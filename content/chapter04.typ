#import "../template/lib.typ": *

= Khối Code
<khoi-code>

Mẫu hỗ trợ code nội dòng và code block với syntax highlighting. Phông chữ
Fira Code được dùng cho tất cả các đoạn code.

== Code Nội Dòng

Sử dụng backtick để viết `code nội dòng`. Ví dụ: hàm `document()` nhận tham số
`doc-class: "thesis"`, phương thức `git cherry-pick`, hoặc lệnh shell `make thesis.pdf`.

== Code Block Đơn Ngôn Ngữ

#figure(
  ```typst
  // Cú pháp tối thiểu để sử dụng template
  #import "template/lib.typ": *
  #import "config/metadata.typ": data

  #let acronyms = csv("content/acronyms.csv")

  #show: document.with(
    ..data,
    doc-class: "thesis",
    paper: "a4",
    font-size: 11pt,
    two-sided: false,
    output: "digital",
    lang: "vi",
    acronyms: acronyms,
  )

  #include "content/chapter01.typ"
  // ... thêm các chương khác

  #show: appendix-l10n.with("vi")
  #include "content/appendixA.typ"
  ```,
  caption: [Code Block Đơn Ngôn Ngữ],
)

== Code Python

Cách dùng:

```typst
#figure(
  raw(read("code/sample-code.py"), block: true, lang: "python"),
  caption: [Code Python Ví Dụ],
)
```

Kết quả:

#figure(
  raw(read("code/sample-code.py"), block: true, lang: "python"),
  caption: [Code Python Ví Dụ],
)

== Code SQL

```sql
-- Truy vấn phân tích rủi ro bảo mật
SELECT
    a.asset_id,
    a.asset_name,
    COUNT(t.threat_id)                          AS threat_count,
    MAX(r.likelihood * r.impact)                AS max_risk_score,
    SUM(CASE WHEN r.severity = 'HIGH'
             THEN 1 ELSE 0 END)                 AS high_severity_count
FROM assets a
    LEFT JOIN threats      t ON t.asset_id    = a.asset_id
    LEFT JOIN risk_matrix  r ON r.threat_id   = t.threat_id
WHERE a.active = TRUE
GROUP BY a.asset_id, a.asset_name
HAVING MAX(r.likelihood * r.impact) > 6
ORDER BY max_risk_score DESC;
```

== Code Bash / Shell

```bash
#!/usr/bin/env bash
# Biên dịch và sao chép PDF vào thư mục môn học

REPO="$HOME/UIT/typst-report-template"
COURSE="IE105"
ASSIGN="TH6B"
DEST="$HOME/UIT/LT.K2025.2-CNTT/uit/courses/$COURSE/assignments/$ASSIGN"

cd "$REPO" || exit 1

# Biên dịch
typst compile thesis.typ \
  --font-path template/fonts \
  --output thesis.pdf

# Kiểm tra kết quả
if [[ $? -eq 0 ]]; then
  cp thesis.pdf "$DEST/thesis.pdf"
  echo "✓ Đã sao chép thesis.pdf → $DEST"
else
  echo "✗ Biên dịch thất bại" >&2
  exit 1
fi
```

== Ghi Chú Về Code Block

#co-note[
  Kích thước chữ trong code block mặc định là `0.9em` so với văn bản thường,
  giúp tiết kiệm không gian khi đoạn code dài. Có thể ghi đè qua `thesis.typ`:
  `#show raw: set text(size: 0.8em)`
]
