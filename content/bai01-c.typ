#import "../template/lib.typ": *

== C. Crystal Report Báo Cáo Doanh Thu
<c-crystal-report-bao-cao-doanh-thu>

Cho CSDL Quản lý bán hàng đính kèm bên dưới. Hãy dùng Crystal Report để thiết kế một báo cáo cho biết Doanh thu theo tháng của từng nhân viên trong năm 2006.

Yêu cầu gồm có 2 phần sau:

- Phần Biểu đồ đường (Line Chart): Cho biết sự biến động về doanh số bán được của từng nhân viên qua các tháng trong năm 2006.
  - Trục X là các tháng trong năm 2006, trục Y là doanh số bán được.
  - Mỗi đường biểu thị một nhân viên tương ứng.
- Phần Bảng số liệu chi tiết: Cho biết doanh thu cụ thể của tháng đó với từng nhân viên. Trong đó có:
  - Tổng doanh thu theo từng nhân viên.
  - Tổng doanh thu của tất cả nhân viên trong năm 2006.
  - Lưu ý: Một số tháng không được hiển thị là do bảng `HOADON` không có số liệu bán hàng của tháng đó.

=== Màn Hình Design
<man-hinh-design>

#figure(image("./images/1c-1-15.png"), caption: [
  Bài 1.C - Màn hình Design
])

=== Màn Hình Preview
<man-hinh-preview>

#figure(image("./images/1c-1-17.png"), caption: [
  Bài 1.C - Màn hình Preview
])

=== Các Đối Tượng Sử Dụng
<cac-doi-tuong-su-dung>


==== Tạo View Cho Doanh Thu Năm 2006
<tao-view-cho-doanh-thu-nam-2006>

#figure(
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
  ```,
  caption: [
    View V_BAOCAO_DOANHTHU_2006
  ],
)

Kết Quả Của View Vừa Tạo:

```sql
   SELECT * FROM V_BAOCAO_DOANHTHU_2006  ORDER BY MANV, Thang;
```

#figure(image("./images/1c-1-1.png"), caption: [
  Bài 1.C - View V\_BAOCAO\_DOANHTHU\_2006
])

==== VIEW V\_BAOCAO\_DOANHTHU\_2006
<view-v-baocao-doanhthu-2006>

#figure(image("./images/1c-1-3.png"), caption: [
  Bài 1.C - Sử Dụng V\_BAOCAO\_DOANHTHU\_2006
])

==== Cột Tháng và SUM Tổng Tiền
<cot-thang-va-sum-tong-tien>

#figure(image("./images/1c-1-4.png"), caption: [
  Bài 1.C - Cột Tháng và SUM Tổng Tiền
])

==== Caculated Field MaNV - HoTen
<caculated-field-manv---hoten>

- Để Hiển Thị Dạng MaNV - HoTen, công thức:

```sql
[Manv] + " - " + [Hoten]
```

#figure(image("./images/1c-1-10.png"), caption: [
  Bài 1.C - Caculated field MaNV - HoTen (1)
])

#figure(image("./images/1c-1-11.png"), caption: [
  Bài 1.C - Caculated field MaNV - HoTen (2)
])
