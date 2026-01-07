# Bài 1. Crystal Report 

## A. Crystal Report Từ Bảng (Table)

Tạo một Crystal Report từ một bảng tùy chọn trong CSDL QLDT.

Yêu cầu: 

- Đầy đủ cấu trúc của 1 Report. 
- Thêm cột số thứ tự cho mỗi sinh viên bằng SQL. 
- Tô nền vàng cho phần Page Header. 
- Ngăn cách phần Details với Report Footer bằng 1 đường kẻ. 
- Trình bày từng bước để tạo được Crystal Report.

### Kết nối SQL Server với Tableau

![Bài 1.A - Tableau Connection](./images/tableau_connection.png)

### Cập nhật title của report

![Bài 1.A - Update title](./images/update_title.png)

### Drag các database fields từ data panel qua Rows panel

![Bài 1.A - Drag data](./images/drag_data.png)

### Bổ sung column STT

#### Tạo Calculated Field

![Bài 1.A - Create stt field](./images/create_stt_field.png)

#### Drag vào Row panel và chỉnh sửa thuộc tính cho phù hợp

Chọn thuộc tính `Discrete` để hiển thị STT rõ ràng.

![Bài 1.A - Drag stt field](./images/drag_stt_field.png)

### Format lại layout

#### Ẩn đi column không cần thiết có chứa nội dung "ABC"

##### Drag row `Dia chi` vào mục `Text` của `Marks` panel

![Bài 1.A - Mark dia chi](./images/mark_diachi.png)

##### Drag `Measure Names` từ `Data` panel vào `Columns` panel

![Bài 1.A - Drag measure name](./images/drag_measure_names.png)

##### Cập nhật lại color của header

![Bài 1.A - Update color](./images/update_color.png)

##### Cập nhật lại công thức tính index của STT để hiển thị chính xác

- Chọn `Edit Table Calculation`

![Bài 1.A - Choose edit table calculation](./images/choose_edit_table_calculation.png)

- Cập nhật lại logic
  - Chọn `Specific Dimensions`
  - Check tất cả các giá trị hiện tại cần kết hợp để xác định index.
  - Ở mục `At the level`: chọn `Deepest`

![Bài 1.A - Update calculation](./images/update_calculation.png)

### Tạo Dashboard cho report

#### Tạo Dashboard và setup layout

![Bài 1.A - Create dashboard](./images/create_dashboard.png)

#### Thêm title cho dashboard

![Bài 1.A - Add title dashboard](./images/add_title_dashboard.png)

#### Drag report vào dashboard

![Bài 1.A - Drag report to dashboard](./images/drag_report_to_dashboard.png)

#### Add footer to dashboard
![Bài 1.A - Add footer to dashboard](./images/add_footer_dashboard.png)

### Report hoàn chỉnh

![Bài 1.A - Full Report](./images/full_report.png)

## B. Crystal Report Từ View

Tạo một View cho biết thông tin đề tài, thông tin giáo viên là ủy viên đề tài và điểm số của các giáo viên ủy viên này cho từng đề tài. Sau đó tạo một Crystal Report từ View vừa tạo.

Yêu cầu: 

- Đầy đủ cấu trúc của 1 Report. 
- Thêm cột số thứ tự cho mỗi đề tài bằng Crystal Report. 
- Sắp xếp điểm giảm dần theo từng đề tài. 
- Page Header có 2 đường kẻ trên cùng và 1 đường kẻ dưới cùng, Report Footer có 2 đường kẻ. Tô nền vàng cho Page Header và Report Footer. 
- Ngăn cách phần mỗi đề tài trong phần Details bằng 1 đường kẻ trước mỗi đề tài.


## C. Crystal Report Báo Cáo Doanh Thu

Cho CSDL Quản lý bán hàng đính kèm bên dưới. Hãy dùng Crystal Report để thiết kế một báo cáo cho biết Doanh thu theo tháng của từng nhân viên trong năm 2006.

Yêu cầu gồm có 2 phần sau: 

- Phần Biểu đồ đường (Line Chart): Cho biết sự biến động về doanh số bán được của từng nhân viên qua các tháng trong năm 2006.
    - Trục X là các tháng trong năm 2006, trục Y là doanh số bán được.
    - Mỗi đường biểu thị một nhân viên tương ứng. 

- Phần Bảng số liệu chi tiết: Cho biết doanh thu cụ thể của tháng đó với từng nhân viên. Trong đó có: 
    - Tổng doanh thu theo từng nhân viên. 
    - Tổng doanh thu của tất cả nhân viên trong năm 2006. 
    - Lưu ý: Một số tháng không được hiển thị là do bảng `HOADON` không có số liệu bán hàng của tháng đó.

### Tạo View cho doanh thu năm 2006

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

### Kiểm tra kết quả của view vừa tạo

```sql
   SELECT * FROM V_BAOCAO_DOANHTHU_2006  ORDER BY MANV, Thang;
```

![Bài 1.C - Kiểm tra kết quả view](./images/1c-1-1.png)

### Kết nối SQL Server với Tableau

![Bài 1.C - Kết nối SQL Server với Tableau](./images/1c-1-2.png)

### Kéo VIEW V_BAOCAO_DOANHTHU_2006 vào trong Worksheet để tạo chart line

![Bài 1.C - Kéo view vào worksheet](./images/1c-1-3.png)

### Mapping dữ liệu từ View V_BAOCAO_DOANHTHU_2006 đã tạo theo trục X và Y

![Bài 1.C - Mapping dữ liệu](./images/1c-1-4.png)

### Format và chỉnh sửa lại các tiêu đề trên chart

![Bài 1.C - Format và chỉnh sửa lại các tiêu đề trên chart (1)](./images/1c-1-5.png)

![Bài 1.C - Format và chỉnh sửa lại các tiêu đề trên chart (2)](./images/1c-1-6.png)

### Màn hình design và preview của chart sau khi chỉnh sửa

![Bài 1.C - Màn hình design và preview của chart sau khi chỉnh sửa (1)](./images/1c-1-7.png)

![Bài 1.C - Màn hình design và preview của chart sau khi chỉnh sửa (2)](./images/1c-1-8.png)

### Bảng số liệu chi tiết - tạo thêm 1 sheet cho chi tiết và mapping dữ liệu từ view V_BAOCAO_DOANHTHU_2006
   
![Bài 1.C - Bảng số liệu chi tiết](./images/1c-1-9.png)

### Tạo label để hiển thị dạng MaNV - HoTen

![Bài 1.C - Tạo label để hiển thị dạng MaNV - HoTen (1)](./images/1c-1-10.png)

![Bài 1.C - Tạo label để hiển thị dạng MaNV - HoTen (2)](./images/1c-1-11.png)

### Format các cột tính tổng, vị trí hiển thị

![Bài 1.C - Format các cột tính tổng, vị trí hiển thị](./images/1c-1-12.png)

### Màn hình design và preview của table chi tiết

![Bài 1.C - Màn hình design và preview của table chi tiết (1)](./images/1c-1-13.png)

![Bài 1.C - Màn hình design và preview của table chi tiết (2)](./images/1c-1-14.png)

### Tạo thêm 1 dashboard để hiển thị biểu đồ và chi tiết

![Bài 1.C - Tạo thêm 1 dashboard để hiển thị biểu đồ và chi tiết](./images/1c-1-15.png)

### Format dashboard

![Bài 1.C - Format dashboard](./images/1c-1-16.png)

### Màn hình design và preview cuối

![Bài 1.C - Màn hình design và preview cuối (1)](./images/1c-1-17.png)

![Bài 1.C - Màn hình design và preview cuối (2)](./images/1c-1-18.png)

## D. Crystal Report Báo Cáo Tổng Doanh Thu

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

### Phần Biểu đồ tròn (Pie Chart)

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

### Kiểm tra kết quả của view vừa tạo

```sql
   SELECT * FROM V_BAOCAO_DOANHTHU_SP_2006_2007;
```

### Tạo chart (Pie) trong sheet mới

![Bài 1.D - Tạo chart (Pie) trong sheet mới](./images/1d-1-1.png)

### Mapping dữ liệu từ View V_BAOCAO_DOANHTHU_SP_2006_2007 vào chart

Kéo thả vào mục Marks các trường trong view:

- MaSP -> Color => để hiển thị màu phân biệt sp
- Sum(TongCaNam) -> Angle => để chia tỉ lệ trong biểu đồ
- Sum(TongCaNam) và MaSP -> Label => để hiển thị trên biểu đồ

![Bài 1.D - Mapping dữ liệu từ View vào chart (1)](./images/1d-1-2.png)

![Bài 1.D - Mapping dữ liệu từ View vào chart (2)](./images/1d-1-3.png)

![Bài 1.D - Mapping dữ liệu từ View vào chart (3)](./images/1d-1-4.png)

### Màn hình design của chart

![Bài 1.D - Màn hình design của chart](./images/1d-1-5.png)

### Bảng số liệu chi tiết, tạo sheet mới, tô màu và vẽ đường viền

Kéo thả các field trong View

![Bài 1.D - Bảng số liệu chi tiết (1)](./images/1d-1-6.png)

![Bài 1.D - Bảng số liệu chi tiết (2)](./images/1d-1-7.png)

### Tạo STT

![Bài 1.D - Tạo STT (1)](./images/1d-1-8.png)

![Bài 1.D - Tạo STT (2)](./images/1d-1-9.png)

### Màn hình design & preview chi tiết

![Bài 1.D - Màn hình design & preview chi tiết (1)](./images/1d-1-10.png)

![Bài 1.D - Màn hình design & preview chi tiết (2)](./images/1d-1-12.png)

### Tạo dashboard để hiển thị biểu đồ và chi tiết

Kéo thả 2 sheet biểu đồ và sheet chi tiết vào

![Bài 1.D - Tạo dashboard để hiển thị biểu đồ và chi tiết](./images/1d-1-11.png)

### Màn hình design cuối cùng

![Bài 1.D - Màn hình design cuối cùng](./images/1d-1-13.png)

### Màn hình preview

![Bài 1.D - Màn hình preview](./images/1d-1-14.png)
