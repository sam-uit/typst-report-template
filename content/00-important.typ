#import "../template/lib.typ": *
#unheading[Lưu Ý & Hướng Dẫn Thực Hiện]
- #smallcaps[LT.2025.2-CNTT: Chỉ thực hiện câu 1, và 3 trong BTTH6.]

== Bài Làm
<bai-lam>

- Trình bày ngắn gọn các câu trả lời.
- Đối với các câu hỏi liên quan đến thực thi code SQL, thực hiện dán code SQL vào file báo cáo tương ứng với câu hỏi.
- Đối với các Crystal Report/Tableau, chụp Màn hình Design và Màn hình Preview của từng câu.

== Quy Cách
<quy-cach>

Cấu trúc thư mục `content/` trong template Typst:

- `./code/`: Các file code SQL.
- `./assets/`: Các file ảnh.
- `./diagrams/`: Các file diagram (d2, mermaid, vv…).
- `./chapterX.md`: File báo cáo của câu hỏi X.

Đặt tên file theo mô hình sau:

- `BTTH6-quiz1-a.sql`: Code SQL của câu 1, mục a.
- `BTTH6-quiz1-a.xml`: Output XML của câu 1, mục a (nếu có, XML, JSON, vv…).
- `BTTH6-quiz1-a1.png`: Màn hình Design của câu 1, mục a, ảnh 1.
- `BTTH6-quiz1-a2.png`: Màn hình Preview của câu 1, mục a, ảnh 2.

== Tài Nguyên
<tai-nguyen>

Code SQL của BTTH2 được lưu tại: #link("https://github.com/lt20252cnttalpha/LT.K2025.2-CNTT/tree/main/uit/courses/IE103/assignments/BTTH2")[LT.K2025.2-CNTT \> courses \> IE103 \> assignments \> BTTH2]

- `IE103-BTTH2`:
  - Thư mục chứa SQL Project cho BTTH2
  - Có thể triển khai ngay một cách tự động.
  - Chỉ chứa các bảng và insert dữ liệu.
  - Không chứa các stored procedure, function, trigger, view.
- `content/code`:
  - Thư mục chứa code SQL của BTTH2.
  - Có thể triển khai thủ công mọi thành phần.
