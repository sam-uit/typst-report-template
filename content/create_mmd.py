# Mục đích: tách các nội dung từ các file slide md thành các file .mmd.

import os
import re
import glob
import subprocess

# Determine directories relative to this script location
# Assumes script is in <root>/content/
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DIAGRAMS_DIR = os.path.join(BASE_DIR, "diagrams")

mmd_header = """
---
config:
  theme: redux-color
  themeVariables:
    fontFamily: Google Sans
    fontSize: 20px
---
mindmap
"""

def slugify(text):
    text = text.lower()
    text = re.sub(r'[àáạảãâầấậẩẫăằắặẳẵ]', 'a', text)
    text = re.sub(r'[èéẹẻẽêềếệểễ]', 'e', text)
    text = re.sub(r'[ìíịỉĩ]', 'i', text)
    text = re.sub(r'[òóọỏõôồốộổỗơờớợởỡ]', 'o', text)
    text = re.sub(r'[ùúụủũưừứựửữ]', 'u', text)
    text = re.sub(r'[ỳýỵỷỹ]', 'y', text)
    text = re.sub(r'đ', 'd', text)
    text = re.sub(r'[^a-z0-9]+', '-', text)
    return text.strip('-')

def escape_mermaid_text(text):
    """
    Escapes text for Mermaid diagram.
    Wraps in quotes and escapes internal quotes.
    Also replaces parenthesis ( and ) with ** to bold content.
    """
    # Replace parenthesis with ** (as per user request)
    text = text.replace('(', '**').replace(')', '**')
    
    # Replace double quotes with HTML entity or escape '\"'
    # Mermaid often handles " in string if escaped, or use #quot;
    safe_text = text.replace('"', '#quot;')
    return f'"{safe_text}"'

def parse_and_convert(filepath, dry_run=True, seen_slugs=None):
    if seen_slugs is None:
        seen_slugs = {}
        
    filename_base = os.path.basename(filepath)
    chapter_match = re.search(r'(chapter\d+)', filename_base)
    chapter_prefix = chapter_match.group(1) if chapter_match else "chapterXX"

    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    modified = False

    while i < len(lines):
        line = lines[i]
        
        # Check for start of section ###
        # Must not be inside comment.
        if line.lstrip().startswith("### ") and not "<!--" in line:
            header_line = line
            title = line.strip().lstrip("#").strip()
            
            # Start gathering description and list
            description = []
            list_items = []
            current_raw_block = [line]
            
            j = i + 1
            has_list = False
            
            while j < len(lines):
                subline = lines[j]
                
                # Stop if next header or pagebreak or comment start
                if re.match(r'^#{1,6}\s', subline) or subline.strip().startswith("```"):
                    break
                    
                if subline.lstrip().startswith("- "):
                    has_list = True
                    list_items.append(subline)
                    current_raw_block.append(subline)
                elif has_list:
                    # If we are already in a list
                    if subline.strip() == "":
                        current_raw_block.append(subline)
                    elif subline.startswith("    ") or subline.startswith("\t"):
                        list_items.append(subline)
                        current_raw_block.append(subline)
                    else:
                        break
                else:
                    # Description text (before list)
                    if subline.strip() != "":
                        description.append(subline.strip())
                    current_raw_block.append(subline)
                
                j += 1
            
            if has_list:
                print(f"[{'DRY RUN' if dry_run else 'ACTION'}] Converting section '{title}' in {filename_base}")
                
                # Slug handling
                raw_slug = slugify(title)
                
                # Truncate to max 40 but respect word boundaries (indicated by hyphens)
                if len(raw_slug) > 40:
                    truncated = raw_slug[:40]
                    # Find last dash to cut cleanly
                    last_dash = truncated.rfind('-')
                    if last_dash > 0:
                        raw_slug = truncated[:last_dash]
                    else:
                        # Fallback if no dash found (rare for very long single word)
                        raw_slug = truncated
                
                raw_slug = raw_slug.strip('-')
                
                if raw_slug in seen_slugs:
                    seen_slugs[raw_slug] += 1
                    slug = f"{raw_slug}-{seen_slugs[raw_slug]}"
                else:
                    seen_slugs[raw_slug] = 0
                    slug = raw_slug
                
                mmd_filename = f"{chapter_prefix}-{slug}.mmd"
                mmd_path = os.path.join(DIAGRAMS_DIR, mmd_filename)
                # The png relative path should be relative to the markdown file?
                # The markdown files are in CONTENT_DIR.
                # DIAGRAMS_DIR is CONTENT_DIR/diagrams.
                # So relative path is ./diagrams/...
                png_filename = f"{chapter_prefix}-{slug}.png"
                png_relative_path = f"./diagrams/{png_filename}"
                
                # Generate MMD Content
                desc_text = "<br/>".join(description)
                safe_title = escape_mermaid_text(title)
                if desc_text:
                    # We might need to escape description too?
                    # But description was joined by <br/>.
                    # Let's escape individual lines then join.
                    # Also apply parenthesis replacement to descriptions too?
                    # "Thay thế toàn bộ các ( và ) tìm được thành **" - implies everywhere.
                    description_escaped = []
                    for line in description:
                         # Apply same logic
                         l = line.replace('(', '**').replace(')', '**').replace('"', '#quot;')
                         description_escaped.append(l)
                    
                    safe_desc = "<br/>".join(description_escaped)
                    
                    # Note: safe_title already includes quotes from escape_mermaid_text
                    # But we want to construct the complex node label.
                    # The mermaid string for root node would be: (("Title<br/>Desc"))
                    # So we need to strip outer quotes from safe_title if we combine inside one quote pair?
                    # Or can we concat? "Title"<br/>"Desc" is not valid.
                    # It should be "Title<br/>Desc"
                    
                    # Redo title escaping for this composite case just to be safe
                    title_inner = title.replace('(', '**').replace(')', '**').replace('"', '#quot;')
                    
                    root_label_node = f'(("{title_inner}<br/>{safe_desc}"))'
                else:
                    root_label_node = f'(({safe_title}))'
                
                # Use mmd_header here
                mmd_content_lines = [mmd_header.strip(), f"  root{root_label_node}"]
                
                for item in list_items:
                    content = item.lstrip().lstrip("- ").strip()
                    indent_count = len(item) - len(item.lstrip())
                    # Only count spaces? Assuming 2 or 4 spaces.
                    # Preserving hierarchy based on input indentation.
                    # Mermaid doesn't strictly need precise indentation matching source, just hierarchy.
                    # But we trust the source indentation roughly maps.
                    
                    safe_content = escape_mermaid_text(content)
                    
                    # We add our own indentation for the file clarity
                    mmd_content_lines.append(f"    {' ' * indent_count}{safe_content}")
                
                mmd_content = "\n".join(mmd_content_lines)

                if not dry_run:
                    # Write MMD
                    os.makedirs(DIAGRAMS_DIR, exist_ok=True)
                    with open(mmd_path, 'w', encoding='utf-8') as mf:
                        mf.write(mmd_content)
                    
                    # Run MMDC
                    try:
                        subprocess.run(["mmdc", "-i", mmd_path, "-o", os.path.join(DIAGRAMS_DIR, png_filename), "-b", "transparent", "-s", "3"], check=True)
                    except Exception as e:
                        print(f"Error running mmdc for {mmd_path}: {e}")

                # Thêm vào phần typst code cho file .md 
                replacement_text = f"```{'{=typst}'}\n#align(center)[\n\t#image(\"{png_relative_path}\", width: 100%)\n]\n```\n\n{''.join(current_raw_block)}"
                new_lines.append(replacement_text)
                # new_lines.append("\n") 
                
                i = j 
                modified = True
                continue

        new_lines.append(line)
        i += 1
    
    if modified and not dry_run:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        print(f"Updated {filepath}")

def process_all(dry_run=True):
    # Search for md files in the same directory as script (content/)
    files = glob.glob(os.path.join(BASE_DIR, "chapter0*-slide*.md"))
    files.sort()
    
    for filepath in files:
        if "loiichdinhluong" in filepath: continue
        parse_and_convert(filepath, dry_run=dry_run)

if __name__ == "__main__":
    import sys
    # Default to False (Execution) if user runs this script now, 
    # but let's allow CLI arg or defaulting to dry run for safety if called without args?
    # User asked for the script to be provided.
    # Usually safer to default to Dry Run unless explicit.
    # But for "Agent automation", I often hardcode False.
    # I'll default to True (Dry Run) and print instruction.
    
    dry_run = True
    if len(sys.argv) > 1 and sys.argv[1] == "--run":
        dry_run = False
        print("Running in EXECUTION mode...")
    else:
        print("Running in DRY RUN mode. Use --run to execute changes.")
        
    process_all(dry_run=dry_run)
