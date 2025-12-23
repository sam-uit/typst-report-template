== A. IMPORT VÀ EXPORT
<a-import-va-export>


=== Import Dữ Liệu Từ Excel File
<import-du-lieu-tu-excel-file>

Chọn 1 file dữ liệu (SV) từ excel, và import vào SQL Server.

- Chuột phải vào bảng cần IMPORT dữ liệu và chọn Import/Export \> Import Data from File(s)…

#figure(image("assets/Import-001.jpg"),
  caption: [
    Import-001
  ]
)

- Chọn lựa file Excel chứa dữ liệu.

#figure(image("assets/Import-002.jpg"),
  caption: [
    Import-002
  ]
)

- Cấu hình các trường (field) và kiểu dữ liệu (data type) cho bảng.

#figure(image("assets/Import-003.jpg"),
  caption: [
    Import-003
  ]
)

- Kết quả: Dữ liệu đã được nhập (imported) thành công.

#figure(image("assets/Import-004.jpg"),
  caption: [
    Import-004
  ]
)

=== Export Dữ Liệu tới Excel File
<export-du-lieu-toi-excel-file>

Chọn 1 table trong SQL Server, và export tới file Excel.

- Chuột phải vào bảng cần EXPORT dữ liệu và chọn Import/Export \> Export Data to File

#figure(image("assets/export-001.jpg"),
  caption: [
    Import/Export \> Export Data to File
  ]
)

- Chỉ định thể loại file (#strong[Extractor];) và nơi lưu trữ (#strong[Output file];).

#figure(image("assets/Export-002.jpg"),
  caption: [
    Chỉ định thể loại file và nơi lưu trữ
  ]
)

- Thông báo EXPORT thành công.

#figure(image("assets/Export-003.jpg"),
  caption: [
    Thông báo EXPORT thành công.
  ]
)

- Kiểm tra lại kết quả EXPORT.

#figure(image("assets/Export-004.jpg"),
  caption: [
    Kiểm tra lại kết quả EXPORT
  ]
)
