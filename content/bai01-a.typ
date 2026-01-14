#import "../template/lib.typ": *

== A. Crystal Report Từ Bảng (Table)
<a-crystal-report-tu-bang-table>

Tạo một Crystal Report từ một bảng tùy chọn trong CSDL QLDT.

Yêu cầu:

- Đầy đủ cấu trúc của 1 Report.
- Thêm cột số thứ tự cho mỗi sinh viên bằng SQL.
- Tô nền vàng cho phần Page Header.
- Ngăn cách phần Details với Report Footer bằng 1 đường kẻ.
- Trình bày từng bước để tạo được Crystal Report.

=== Các Bước Thực Hiện
<cac-buoc-thuc-hien>


==== Kết Nối SQL Server Với Tableau
<ket-noi-sql-server-voi-tableau>

#figure(image("./images/tableau_connection.png"),
  caption: [
    Bài 1.A - Kết nối SQL Server với Tableau
  ]
)

==== Cập Nhật Title Của Report
<cap-nhat-title-cua-report>

#figure(image("./images/update_title.png"),
  caption: [
    Bài 1.A - Cập Nhật Title Của Report
  ]
)

==== Kéo Fields Từ Data Panel Qua Rows Panel
<keo-fields-tu-data-panel-qua-rows-panel>

#figure(image("./images/drag_data.png"),
  caption: [
    Bài 1.A - Kéo Fields Từ Data Panel Qua Rows Panel
  ]
)

==== Bổ Sung Column STT
<bo-sung-column-stt>


===== Tạo Calculated Field STT
<tao-calculated-field-stt>

#figure(image("./images/create_stt_field.png"),
  caption: [
    Bài 1.A - Tạo Calculated Field STT
  ]
)

===== Kéo STT Vào Row Panel Và Chỉnh Sửa Thuộc Tính Cho Phù Hợp
<keo-stt-vao-row-panel-va-chinh-sua-thuoc-tinh-cho-phu-hop>

Chọn thuộc tính `Discrete` để hiển thị STT rõ ràng.

#figure(image("./images/drag_stt_field.png"),
  caption: [
    Bài 1.A - Chọn Thuộc Tính Discrete
  ]
)

==== Format Lại Layout
<format-lai-layout>


===== Kéo `Dia chi` Vào Mục `Text` Của `Marks` Panel
<keo-dia-chi-vao-muc-text-cua-marks-panel>

#figure(image("./images/mark_diachi.png"),
  caption: [
    Bài 1.A - Kéo Dia chi Vào Mục Text Của Marks Panel
  ]
)

===== Kéo `Measure Names` Từ `Data` Panel Vào `Columns` Panel
<keo-measure-names-tu-data-panel-vao-columns-panel>

#figure(image("./images/drag_measure_names.png"),
  caption: [
    Bài 1.A - Kéo Measure Names Từ Data Vào Columns Panel
  ]
)

===== Cập Nhật Lại Màu Của Header
<cap-nhat-lai-mau-cua-header>

#figure(image("./images/update_color.png"),
  caption: [
    Bài 1.A - Cập Nhật Lại Màu Của Header
  ]
)

===== Cập Nhật Lại Công Thức Tính Index Của STT Để Hiển Thị Chính Xác
<cap-nhat-lai-cong-thuc-tinh-index-cua-stt-de-hien-thi-chinh-xac>

- Chọn `Edit Table Calculation`

#figure(image("./images/choose_edit_table_calculation.png"),
  caption: [
    Bài 1.A - Chọn Edit Table Calculation
  ]
)

- Cập nhật lại logic:
  - Chọn `Specific Dimensions`
  - Check tất cả các giá trị hiện tại cần kết hợp để xác định index.
  - Ở mục `At the level`: chọn `Deepest`

#figure(image("./images/update_calculation.png"),
  caption: [
    Bài 1.A - Cập Nhật Lại Công Thức Tính Index Của STT
  ]
)

=== Màn Hình Design
<man-hinh-design>


==== Tạo Dashboard Và Setup Layout
<tao-dashboard-va-setup-layout>

#figure(image("./images/create_dashboard.png"),
  caption: [
    Bài 1.A - Tạo Dashboard Và Setup Layout
  ]
)

==== Thêm Title Cho Dashboard
<thêm-title-cho-dashboard>

#figure(image("./images/add_title_dashboard.png"),
  caption: [
    Bài 1.A - Thêm Title Cho Dashboard
  ]
)

==== Kéo Report Vào Dashboard
<keo-report-vao-dashboard>

#figure(image("./images/drag_report_to_dashboard.png"),
  caption: [
    Bài 1.A - Kéo Report Vào Dashboard
  ]
)

==== Thêm Footer To Dashboard
<thêm-footer-to-dashboard>

#figure(image("./images/add_footer_dashboard.png"),
  caption: [
    Bài 1.A - Thêm Footer To Dashboard
  ]
)

=== Màn Hình Preview
<man-hinh-preview>

#figure(image("./images/full_report.png"),
  caption: [
    Bài 1.A - Màn Hình Preview
  ]
)

=== Các Đối Tượng Sử Dụng
<cac-doi-tuong-su-dung>

- `Mssv`
- `Tenv`
- `Sodt`
- `LOP`
- `Diachi`

#figure(image("./images/drag_data.png"),
  caption: [
    Bài 1.A - Các Trường Dữ Liệu Sử Dụng
  ]
)
