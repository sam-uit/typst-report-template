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

![Tableau Connection](./images/tableau_connection.png)

### Cập nhật title của report

![Update title](./images/update_title.png)

### Drag các database fields từ data panel qua Rows panel

![Drag data](./images/drag_data.png)

### Bổ sung column STT

#### Tạo Calculated Field

![Create stt field](./images/create_stt_field.png)

#### Drag vào Row panel và chỉnh sửa thuộc tính cho phù hợp

Chọn thuộc tính `Discrete` để hiển thị STT rõ ràng.

![Drag stt field](./images/drag_stt_field.png)

### Format lại layout

#### Ẩn đi column không cần thiết có chứa nội dung "ABC"

##### Drag row `Dia chi` vào mục `Text` của `Marks` panel

![Mark dia chi](./images/mark_diachi.png)

##### Drag `Measure Names` từ `Data` panel vào `Columns` panel

![Drag measure name](./images/drag_measure_names.png)

##### Cập nhật lại color của header

![Update color](./images/update_color.png)

##### Cập nhật lại công thức tính index của STT để hiển thị chính xác

- Chọn `Edit Table Calculation`

![Choose edit table calculation](./images/choose_edit_table_calculation.png)

- Cập nhật lại logic
  - Chọn `Specific Dimensions`
  - Check tất cả các giá trị hiện tại cần kết hợp để xác định index.
  - Ở mục `At the level`: chọn `Deepest`

![Update calculation](./images/update_calculation.png)

### Tạo Dashboard cho report

#### Tạo Dashboard và setup layout

![Create dashboard](./images/create_dashboard.png)

#### Thêm title cho dashboard

![Add title dashboard](./images/add_title_dashboard.png)

#### Drag report vào dashboard

![Drag report to dashboard](./images/drag_report_to_dashboard.png)

#### Add footer to dashboard
![Add footer to dashboard](./images/add_footer_dashboard.png)

### Report hoàn chỉnh

![Full Report](./images/full_report.png)

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

### 1C.1 Tạo View cho doanh thu năm 2006

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
\
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

![Ví dụ 1](./images/1c-1-1.png)

### Kết nối SQL Server với Tableau

![Ví dụ 2](./images/1c-1-2.png)

### Kéo VIEW V_BAOCAO_DOANHTHU_2006 vào trong Worksheet để tạo chart line

![Ví dụ 3](./images/1c-1-3.png)

### Mapping dữ liệu từ View V_BAOCAO_DOANHTHU_2006 đã tạo theo trục X và Y

![Ví dụ 4](./images/1c-1-4.png)

### Format và chỉnh sửa lại các tiêu đề trên chart

![Ví dụ 5](./images/1c-1-5.png)

![Ví dụ 6](./images/1c-1-6.png)

### Màn hình design và preview của chart sau khi chỉnh sửa

![Ví dụ 7](./images/1c-1-7.png)

![Ví dụ 8](./images/1c-1-8.png)

### 1C.2 Bảng số liệu chi tiết - tạo thêm 1 sheet cho chi tiết và mapping dữ liệu từ view V_BAOCAO_DOANHTHU_2006
   
![Ví dụ 9](./images/1c-1-9.png)

### Tạo label để hiển thị dạng MaNV - HoTen

![Ví dụ 10](./images/1c-1-10.png)

![Ví dụ 11](./images/1c-1-11.png)

### Format các cột tính tổng, vị trí hiển thị

![Ví dụ 12](./images/1c-1-12.png)

### Màn hình design và preview của table chi tiết

![Ví dụ 13](./images/1c-1-13.png)

![Ví dụ 14](./images/1c-1-14.png)

### Tạo thêm 1 dashboard để hiển thị biểu đồ và chi tiết

![Ví dụ 15](./images/1c-1-15.png)

### Format dashboard

![Ví dụ 16](./images/1c-1-16.png)

### Màn hình design và preview cuối

![Ví dụ 17](./images/1c-1-17.png)

![Ví dụ 18](./images/1c-1-18.png)

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
