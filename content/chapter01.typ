#import "../template/lib.typ": *

= A. Chuẩn Bị
<a-chuan-bi>

Mục tiêu:

- Chuẩn bị Cơ Sở Dữ Liệu

== Tạo Cơ Sở Dữ Liệu
<tao-co-so-du-lieu>

#raw(read("code/BTTH5-a-0-create-db.sql"), lang: "sql", block: true)

== Tạo Các Bảng
<tao-cac-bang>


=== `KhoaHoc`
<khoahoc>

#raw(read("code/BTTH5-a-create-KhoaHoc.sql"), lang: "sql", block: true)

=== `SinhVien`
<sinhvien>

#raw(read("code/BTTH5-a-create-SinhVien.sql"), lang: "sql", block: true)

=== `MonHoc`
<monhoc>

#raw(read("code/BTTH5-a-create-MonHoc.sql"), lang: "sql", block: true)

=== `KhoaHocMonHoc`
<khoahocmonhoc>

#raw(read("code/BTTH5-a-create-KhoaHocMonHoc.sql"), lang: "sql", block: true)

=== `Diem`
<diem>

#raw(read("code/BTTH5-a-create-Diem.sql"), lang: "sql", block: true)

=== `QuanLySV`
<quanlysv>

#raw(read("code/BTTH5-a-create-QuanLySV.sql"), lang: "sql", block: true)

=== Kết Quả: Danh Sách Các Bảng
<ket-qua-danh-sach-cac-bang>

#figure(image("assets/01-database-tables.png"),
  caption: [
    Phần A - Các Bảng Trong CSDL
  ]
)

== Thêm Dữ Liệu
<them-du-lieu>


=== `KhoaHoc`
<khoahoc-1>

#raw(read("code/BTTH5-a-insert-KhoaHoc.sql"), lang: "sql", block: true)

=== `SinhVien`
<sinhvien-1>

#raw(read("code/BTTH5-a-insert-SinhVien.sql"), lang: "sql", block: true)

=== `MonHoc`
<monhoc-1>

#raw(read("code/BTTH5-a-insert-MonHoc.sql"), lang: "sql", block: true)

=== `KhoaHocMonHoc`
<khoahocmonhoc-1>

#raw(read("code/BTTH5-a-insert-KhoaHocMonHoc.sql"), lang: "sql", block: true)

=== `Diem`
<diem-1>

#raw(read("code/BTTH5-a-insert-Diem.sql"), lang: "sql", block: true)

=== `QuanLySV`
<quanlysv-1>

- CNTT:

#raw(read("code/BTTH5-a-insert-QuanLySV-cntt.sql"), lang: "sql", block: true)
- KHTN:

#raw(read("code/BTTH5-a-insert-QuanLySV-khtn.sql"), lang: "sql", block: true)
