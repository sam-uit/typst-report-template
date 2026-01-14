#import "../template/lib.typ": *

== D. Crystal Report Báo Cáo Tổng Doanh Thu
<d-crystal-report-bao-cao-tong-doanh-thu>

Cho CSDL Quản lý bán hàng đính kèm bên dưới. Hãy dùng Crystal Report để thiết kế một báo cáo cho biết Tổng doanh thu theo từng sản phẩm trong năm 2006 + 2007.

Yêu cầu gồm có 2 phần sau:

- Phần Biểu đồ tròn (Pie Chart): Cho biết tỷ lệ phần trăm doanh số bán được của từng sản phẩm trong năm 2006 + 2007.
  - Sử dụng `MASP` (mã sản phẩm) để phân biệt các sản phẩm với nhau (Vì sản phẩm có thể trùng tên).
  - Gán nhãn `MASP` cho từng phần trong biểu đồ.
  - Thông tin phần trăm của từng sản phẩm để bên phải của biểu đồ.
  - Lưu ý: Thông tin phần trăm trong biểu đồ là tổng doanh thu của từng sản phẩm trong năm 2006 + 2007, tức cột cuối cùng trong phần Bảng số liệu chi tiết bên dưới.
- Phần Bảng số liệu chi tiết: Cho biết doanh thu cụ thể của từng sản phẩm trong năm 2006, năm 2007 và năm (2006 + 2007). Cụ thể:
  - Tổng doanh thu theo từng sản phẩm trong năm 2006.
  - Tổng doanh thu theo từng sản phẩm trong năm 2007.
  - Tổng doanh thu theo từng sản phẩm trong năm 2006 + 2007.
  - Phần Page Header tô nền vàng và có Border xung quanh.
  - Phần Detail có Border xung quanh.

=== Màn Hình Design Của Dashboard
<man-hinh-design-cua-dashboard>

#figure(image("./images/1d-1-13.png"), caption: [
  Bài 1.D - Màn Hình Design Của Dashboard
])

=== Màn Hình Preview
<man-hinh-preview>

#figure(image("./images/1d-1-14.png"), caption: [
  Bài 1.D - Màn Hình Preview
])

=== Các Đối Tượng Sử Dụng
<cac-doi-tuong-su-dung>


==== VIEW V\_BAOCAO\_DOANHTHU\_SP\_2006\_2007
<view-v-baocao-doanhthu-sp-2006-2007>

#figure(
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
  ```,
  caption: [
    View V_BAOCAO_DOANHTHU_SP_2006_2007
  ],
)

==== Các Trường Dữ Liệu
<cac-truong-du-lieu>

- `MaSP`: Color, hiển thị màu phân biệt sản phẩm.
- `SUM(TongCaNam)`: Angle, hiển thị góc của phần trăm trong biểu đồ.
- `SUM(TongCaNam)` và `MaSP`: Label, để hiện thị trên biểu đồ.

#figure(image("./images/1d-1-4.png"), caption: [
  Bài 1.D - Mapping dữ liệu từ View vào chart (3)
])
