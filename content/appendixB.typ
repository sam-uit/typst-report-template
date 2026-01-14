#import "../template/lib.typ": *

= Các Bước Thực Hiện Chi Tiết
<cac-buoc-thuc-hien-chi-tiet>


== 1.B
<b>


=== Kết nối database
<ket-noi-database>

#figure(
  image("./images/connect_database_2.png"),
  caption: [
    PL. 1.B - Kết nối database,
  ],
  outlined: false,
)

=== Kéo fields và data liên quan vào columns và rows
<keo-fields-va-data-lien-quan-vao-columns-va-rows>

#figure(
  image("./images/drag_relevant_fields.png"),
  caption: [
    PL. 1.B - Kéo fields và data liên quan vào columns và rows
  ],
  outlined: false,
)

=== Config STT field để group theo từng đề tài
<config-stt-field-de-group-theo-tung-de-tai>

#figure(
  image("./images/config_stt_field.png"),
  caption: [
    PL. 1.B - Config STT field để group theo từng đề tài
  ],
  outlined: false,
)

=== Thiết kế Dashboard
<thiet-ke-dashboard>

#figure(
  image("./images/dashboard_2.png"),
  caption: [
    PL. 1.B - Thiết kế Dashboard
  ],
  outlined: false,
)

== 1.C
<c>


=== Tạo View Cho Doanh Thu Năm 2006
<tao-view-cho-doanh-thu-nam-2006>

```sql
-- Tạo View để tổng hợp doanh thu theo nhân viên và tháng trong năm 2006

CREATE OR ALTER VIEW V_BAOCAO_DOANHTHU_2006 AS
WITH
NhanVienActive AS (
    SELECT DISTINCT NV.MANV, NV.HOTEN
    FROM NHANVIEN NV
    JOIN HOADON HD ON NV.MANV = HD.MANV
    WHERE YEAR(HD.NGHD) = 2006
),

CacThangActive AS (
    SELECT DISTINCT MONTH(NGHD) AS Thang
    FROM HOADON
    WHERE YEAR(NGHD) = 2006
),

Data AS (
    SELECT NV.MANV, NV.HOTEN, T.Thang
    FROM NhanVienActive NV
    CROSS JOIN CacThangActive T
)
SELECT
    K.MANV,
    K.HOTEN,
    K.Thang,
    ISNULL(SUM(HD.TRIGIA), 0) AS TongTien
FROM
    Data K
LEFT JOIN
    HOADON HD ON K.MANV = HD.MANV
              AND K.Thang = MONTH(HD.NGHD)
              AND YEAR(HD.NGHD) = 2006
GROUP BY
    K.MANV, K.HOTEN, K.Thang
GO
```

=== Kiểm Tra Kết Quả Của View Vừa Tạo
<kiem-tra-ket-qua-cua-view-vua-tao>

```sql
   SELECT * FROM V_BAOCAO_DOANHTHU_2006  ORDER BY MANV, Thang;
```

#figure(
  image("./images/1c-1-1.png"),
  caption: [
    PL. 1.C - Kiểm tra kết quả view
  ],
  outlined: false,
)

=== Kết Nối SQL Server Với Tableau
<ket-noi-sql-server-voi-tableau>

#figure(
  image("./images/1c-1-2.png"),
  caption: [
    PL. 1.C - Kết nối SQL Server với Tableau
  ],
  outlined: false,
)

=== Kéo VIEW V\_BAOCAO\_DOANHTHU\_2006 Vào Trong Worksheet Để Tạo Chart Line
<keo-view-v-baocao-doanhthu-2006-vao-trong-worksheet-de-tao-chart-line>

#figure(
  image("./images/1c-1-3.png"),
  caption: [
    PL. 1.C - Kéo view vào worksheet
  ],
  outlined: false,
)

=== Mapping Dữ Liệu Từ View V\_BAOCAO\_DOANHTHU\_2006 Đã Tạo Theo Trục X Và Y
<mapping-du-lieu-tu-view-v-baocao-doanhthu-2006-da-tao-theo-truc-x-va-y>

#figure(
  image("./images/1c-1-4.png"),
  caption: [
    PL. 1.C - Mapping dữ liệu
  ],
  outlined: false,
)

=== Format Và Chỉnh Sửa Lại Các Tiêu Đề Trên Chart
<format-va-chinh-sua-lai-cac-tieu-de-tren-chart>

#figure(
  image("./images/1c-1-5.png"),
  caption: [
    PL. 1.C - Format và chỉnh sửa lại các tiêu đề trên chart (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1c-1-6.png"),
  caption: [
    PL. 1.C - Format và chỉnh sửa lại các tiêu đề trên chart (2)
  ],
  outlined: false,
)

=== Màn Hình Design Và Preview Của Chart Sau Khi Chỉnh Sửa
<man-hinh-design-va-preview-cua-chart-sau-khi-chinh-sua>

#figure(
  image("./images/1c-1-7.png"),
  caption: [
    PL. 1.C - Màn hình design và preview của chart (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1c-1-8.png"),
  caption: [
    PL. 1.C - Màn hình design và preview của chart (2)
  ],
  outlined: false,
)

=== Bảng Số Liệu Chi Tiết
<bang-so-lieu-chi-tiet>

- Tạo Thêm 1 Sheet Cho Chi Tiết Và Mapping Dữ Liệu Từ View V\_BAOCAO\_DOANHTHU\_2006

#figure(
  image("./images/1c-1-9.png"),
  caption: [
    PL. 1.C - Bảng số liệu chi tiết
  ],
  outlined: false,
)

=== Tạo Label Để Hiển Thị Dạng MaNV - HoTen
<tao-label-de-hien-thi-dang-manv-hoten>

#figure(
  image("./images/1c-1-10.png"),
  caption: [
    PL. 1.C - Tạo label để hiển thị dạng MaNV - HoTen (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1c-1-11.png"),
  caption: [
    PL. 1.C - Tạo label để hiển thị dạng MaNV - HoTen (2)
  ],
  outlined: false,
)

=== Format Các Cột Tính Tổng, Vị Trí Hiển Thị
<format-cac-cot-tinh-tong-vi-tri-hien-thi>

#figure(
  image("./images/1c-1-12.png"),
  caption: [
    PL. 1.C - Format các cột tính tổng, vị trí hiển thị
  ],
  outlined: false,
)

=== Màn Hình Design Và Preview Của Table Chi Tiết
<man-hinh-design-va-preview-cua-table-chi-tiet>

#figure(
  image("./images/1c-1-13.png"),
  caption: [
    PL. 1.C - Màn hình design và preview của table chi tiết (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1c-1-14.png"),
  caption: [
    PL. 1.C - Màn hình design và preview của table chi tiết (2)
  ],
  outlined: false,
)

=== Tạo Thêm 1 Dashboard Để Hiển Thị Biểu Đồ Và Chi Tiết
<tao-them-1-dashboard-de-hien-thi-bieu-do-va-chi-tiet>

#figure(
  image("./images/1c-1-15.png"),
  caption: [
    PL. 1.C - Dashboard để hiển thị biểu đồ và chi tiết
  ],
  outlined: false,
)

=== Format Dashboard
<format-dashboard>

#figure(
  image("./images/1c-1-16.png"),
  caption: [
    PL. 1.C - Format dashboard
  ],
  outlined: false,
)

=== Màn Hình Design Và Preview Hoàn Thành
<man-hinh-design-va-preview-hoan-thanh>

#figure(
  image("./images/1c-1-17.png"),
  caption: [
    PL. 1.C - Màn hình design và preview hoàn thành (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1c-1-18.png"),
  caption: [
    PL. 1.C - Màn hình design và preview hoàn thành (2)
  ],
  outlined: false,
)

== 1.D
<d>


=== Phần Biểu Đồ Tròn (Pie Chart)
<phan-bieu-do-tron-pie-chart>

```sql
-- Tạo View tính tổng doanh thu riêng từng sản phẩm trong năm 2006, 2007

CREATE OR ALTER VIEW V_BAOCAO_DOANHTHU_SP_2006_2007 AS
SELECT
    SP.MASP,
    SP.TENSP,
    ISNULL(SUM(CASE WHEN YEAR(HD.NGHD) = 2006 THEN CT.SL * SP.GIA ELSE 0 END), 0) AS DoanhThu2006,
    ISNULL(SUM(CASE WHEN YEAR(HD.NGHD) = 2007 THEN CT.SL * SP.GIA ELSE 0 END), 0) AS DoanhThu2007,
    ISNULL(SUM(CASE WHEN YEAR(HD.NGHD) IN (2006, 2007) THEN CT.SL * SP.GIA ELSE 0 END), 0) AS TongCaHaiNam
FROM
    SANPHAM SP
LEFT JOIN
    CTHD CT ON SP.MASP = CT.MASP
LEFT JOIN
    HOADON HD ON CT.SOHD = HD.SOHD
GROUP BY
    SP.MASP, SP.TENSP
GO
```

=== Kiểm Tra Kết Quả Của View Vua Tạo
<kiem-tra-ket-qua-cua-view-vua-tao>

```sql
   SELECT * FROM V_BAOCAO_DOANHTHU_SP_2006_2007;
```

=== Tạo Chart (Pie) Trong Sheet Mới
<tao-chart-pie-trong-sheet-moi>

#figure(
  image("./images/1d-1-1.png"),
  caption: [
    PL. 1.D - Tạo Chart (Pie) Trong Sheet Mới
  ],
  outlined: false,
)

=== Mapping Dữ Liệu Từ View Vào Chart
<mapping-du-lieu-tu-view-vao-chart>

Kéo thả vào mục Marks các trường trong view:

- MaSP -\> Color =\> để hiển thị màu phân biệt sp
- Sum(TongCaNam) -\> Angle =\> để chia tỉ lệ trong biểu đồ
- Sum(TongCaNam) và MaSP -\> Label =\> để hiển thị trên biểu đồ

#figure(
  image("./images/1d-1-2.png"),
  caption: [
    PL. 1.D - Dữ Liệu Từ View (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1d-1-3.png"),
  caption: [
    PL. 1.D - Dữ Liệu Từ View (2)
  ],
  outlined: false,
)

#figure(
  image("./images/1d-1-4.png"),
  caption: [
    PL. 1.D - Dữ Liệu Từ View (3)
  ],
  outlined: false,
)

=== Màn Hình Design Của Chart
<man-hinh-design-cua-chart>

#figure(
  image("./images/1d-1-5.png"),
  caption: [
    PL. 1.D - Màn Hình Design Của Chart
  ],
  outlined: false,
)

=== Bảng Số Liệu Chi Tiết, Tạo Sheet Mới, Tô Màu Và Vẽ Đường Viền
<bang-so-lieu-chi-tiet-tao-sheet-moi-to-mau-va-ve-duong-vien>

Kéo thả các field trong View

#figure(
  image("./images/1d-1-6.png"),
  caption: [
    PL. 1.D - Bảng Số Liệu Chi Tiết (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1d-1-7.png"),
  caption: [
    PL. 1.D - Bảng Số Liệu Chi Tiết (2)
  ],
  outlined: false,
)

=== Tạo STT
<tao-stt>

#figure(
  image("./images/1d-1-8.png"),
  caption: [
    PL. 1.D - Tạo STT (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1d-1-9.png"),
  caption: [
    PL. 1.D - Tạo STT (2)
  ],
  outlined: false,
)

=== Màn Hình Design & Preview Chi Tiết
<man-hinh-design-preview-chi-tiet>

#figure(
  image("./images/1d-1-10.png"),
  caption: [
    PL. 1.D - Design & Preview Chi Tiết (1)
  ],
  outlined: false,
)

#figure(
  image("./images/1d-1-12.png"),
  caption: [
    PL. 1.D - Design & Preview Chi Tiết (2)
  ],
  outlined: false,
)

=== Tạo Dashboard Để Hiển Thị Biểu Đồ Và Chi Tiết
<tao-dashboard-de-hien-thi-bieu-do-va-chi-tiet>

Kéo thả 2 sheet biểu đồ và sheet chi tiết vào

#figure(
  image("./images/1d-1-11.png"),
  caption: [
    PL. 1.D - Dashboard Để Hiển Thị Biểu Đồ Và Chi Tiết
  ],
  outlined: false,
)

=== Màn Hình Design Của Dashboard
<man-hinh-design-cua-dashboard>

#figure(
  image("./images/1d-1-13.png"),
  caption: [
    PL. 1.D - Design
  ],
  outlined: false,
)

=== Màn Hình Preview
<man-hinh-preview>

#figure(
  image("./images/1d-1-14.png"),
  caption: [
    PL. 1.D - Preview
  ],
  outlined: false,
)
