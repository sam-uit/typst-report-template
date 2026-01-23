```{=typst}
#unheading[Lưu Ý & Hướng Dẫn Thực Hiện]
```

```{=typst}
- #smallcaps[LT.2025.2-CNTT: Chỉ thực hiện @cau-1-to-chuc-va-bieu-dien-thong-tin[Câu], và @cau-3-an-ninh-thong-tin[Câu] trong BTTH6.]
```

## Cách Trình Bày Bài Làm

- Trình bày *ngắn gọn* các câu trả lời.
- Đối với các câu hỏi liên quan đến thực thi code SQL, thực hiện *dán code SQL vào file báo cáo* tương ứng với câu hỏi.
- Đối với các Crystal Report/Tableau, *chụp Màn hình Design và Màn hình Preview* của từng câu.

## Quy Cách Tổ Chức Mã Nguồn và Soạn Thảo

<!-- - Tham khảo [BTTH5](https://github.com/sam-uit/typst-report-template/tree/report/IE103-BTTH5/content) -->

Cấu trúc thư mục `content/` trong template Typst:

- `./code/`: Các file code SQL.
- `./assets/`: Các file ảnh.
- `./diagrams/`: Các file diagram (d2, mermaid, vv...).
- `./chapterX.md`: File báo cáo của câu hỏi X.

Đặt tên file theo mô hình sau:

- `BTTH6-quiz1-a.sql`: Code SQL của câu 1, mục a.
- `BTTH6-quiz1-a.xml`: Output XML của câu 1, mục a (nếu có, XML, JSON, vv...).
- `BTTH6-quiz1-a1.png`: Màn hình Design của câu 1, mục a, ảnh 1.
- `BTTH6-quiz1-a2.png`: Màn hình Preview của câu 1, mục a, ảnh 2.

## Tài Nguyên

Code SQL của BTTH2 được lưu tại: [LT.K2025.2-CNTT > courses > IE103 > assignments > BTTH2](https://github.com/lt20252cnttalpha/LT.K2025.2-CNTT/tree/main/uit/courses/IE103/assignments/BTTH2)

- `IE103-BTTH2`:
    - Thư mục chứa SQL Project cho BTTH2
    - Có thể triển khai ngay một cách tự động.
    - Chỉ chứa các bảng và insert dữ liệu.
    - Không chứa các stored procedure, function, trigger, view.
- `content/code`:
    - Thư mục chứa code SQL của BTTH2.
    - Có thể triển khai thủ công mọi thành phần (chỉ khi cần).
