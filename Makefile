# Ý Tưởng:
# - Các file MD trong thư mục content sẽ được chuyển thành file TYP tương ứng.
# - Makefile sẽ tự động tạo lại file TYP nếu file MD thay đổi.
# - Makefile sẽ tự động tạo lại file PDF nếu file TYP thay đổi.

# Định nghĩa danh sách file nguồn và file đích
# UPDATED: Includes both content folder and author folder
MD_FILES := $(wildcard content/*.md)
TYP_FILES := $(MD_FILES:.md=.typ)

# Định nghĩa đường dẫn đến config và filters
CONFIG := pandoc/pandoc.yaml
FILTERS := pandoc/vietnamese-slugs.lua pandoc/vspacing.lua

# Định nghĩa danh sách file cần theo dõi (Watch list)
# Bao gồm: Markdown, Config/Filters, và các file Typst template
WATCH_FILES := $(MD_FILES) $(FILTERS) $(CONFIG) template/ main.typ slides.typ

.PHONY: all clean typ watch

all: main.pdf slides.pdf

# Target: Chỉ convert MD sang TYP (không compile PDF)
typ: $(TYP_FILES)

# Rule để tạo file .typ từ .md
# Added config and filters as prerequisites so it rebuilds if scripts change
%.typ: %.md $(CONFIG) $(FILTERS)
	pandoc -d $(CONFIG) "$<" -o "$@"

# main.pdf phụ thuộc vào main.typ VÀ tất cả các file typ (content + author)
main.pdf: main.typ $(TYP_FILES)
	typst compile main.typ

# Tương tự cho slides
# Removed dependency on contents.typ
slides.pdf: slides.typ
	typst compile slides.typ

clean:
	rm -f main.pdf slides.pdf
	# rm -f content/*.typ

# WATCH MODE
# Tìm tất cả file liên quan và chạy 'make all' khi có thay đổi
watch:
watch:
	@echo "Started watching with entr..."
	@find config content author pandoc template . -maxdepth 2 -name "*.md" -o -name "*.typ" -o -name "*.lua" -o -name "*.yaml" \
	| entr -r $(MAKE) all
