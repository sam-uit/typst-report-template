# B. Thực Hành

Hãy sử dụng Xpath, Xquery để thực hiện các yêu cầu sau đây.

## Câu 1

- Viết lệnh Xpath lấy Sinh viên có `ID=10`
- Viết lệnh Xpath lấy sinh viên ở vị trí cuối cùng ở trường CNTT.

### Sinh viên có `ID=10`

```{=typst}
#figure(
    raw(read("code/BTTH5-b-1a.sql"), lang: "sql", block: true),
    caption: "Câu 1 - Sinh viên có ID=10"
)
```

Giải thích:

- `/THONGTINSV/sinhvien[@ID="10"]`: Đường dẫn XPath tìm phần tử `sinhvien` có thuộc tính `ID` bằng "10".
- `query()`: Phương thức để thực thi biểu thức XPath/XQuery trên cột XML.

Kết quả:

![BTTH5-b-1a](assets/BTTH5-b-1a.png)

```{=typst}
#raw(read("code/BTTH5-b-1a.xml"), lang: "xml", block: true)
```

### Sinh Viên Ở Vị Trí Cuối Cùng Trong Trường `CNTT`

```{=typst}
#figure(
    raw(read("code/BTTH5-b-1b.sql"), lang: "sql", block: true),
    caption: "Câu 1 - Sinh viên ở vị trí cuối cùng"
)
```

Giải thích:

- `[last()]`: Hàm XPath trả về phần tử cuối cùng trong tập hợp các phần tử `sinhvien`.

Kết quả:

![BTTH5-b-1b](assets/BTTH5-b-1b.png)

```{=typst}
#raw(read("code/BTTH5-b-1b.xml"), lang: "xml", block: true)
```

## Câu 2

Viết lệnh trả về tất cả các nút từ nút gốc là `THONGTINSV`.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-2.sql"), lang: "sql", block: true),
    caption: "Câu 2 - Tất cả các nút từ nút gốc THONGTINSV"
)
```

Giải thích:

- `/THONGTINSV/*`: Ký tự `*` đại diện cho tất cả các phần tử con trực tiếp của `THONGTINSV`.
- Kết quả trả về tất cả các phần tử `sinhvien` trong XML.

Kết quả:

![BTTH5-b-2](assets/BTTH5-b-2.png)

- CNTT:

```{=typst}
#raw(read("code/BTTH5-b-2a.xml"), lang: "xml", block: true)
```

- KHTN:

```{=typst}
#raw(read("code/BTTH5-b-2b.xml"), lang: "xml", block: true)
```

## Câu 3

Viết lệnh Xquery trả về danh sách sinh viên có `ID < 12` với `MSDH = 1`.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-3.sql"), lang: "sql", block: true),
    caption: "Câu 3 - Danh sách sinh viên có ID < 12 với MSDH = 1"
)
```

Giải thích:

- `for $sv in /THONGTINSV/sinhvien`: Duyệt qua tất cả các phần tử `sinhvien`.
- `where $sv/@ID < 12`: Lọc các sinh viên có ID nhỏ hơn 12.
- `return $sv`: Trả về phần tử sinh viên thỏa mãn điều kiện.

Kết quả:

![BTTH5-b-3](assets/BTTH5-b-3.png)

```{=typst}
#raw(read("code/BTTH5-b-3.xml"), lang: "xml", block: true)
```

## Câu 4

Viết lệnh Xquery trả về danh sách sinh viên sắp xếp theo tên với `MSDH=2`.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-4.sql"), lang: "sql", block: true),
    caption: "Câu 4 - Sinh viên sắp xếp theo tên với MSDH=2"
)
```

Giải thích:

- `order by $sv/@Ten`: Sắp xếp các sinh viên theo thuộc tính `Ten` (tên).
- Kết quả được sắp xếp theo thứ tự bảng chữ cái.

Kết quả:

![BTTH5-b-4](assets/BTTH5-b-4.png)

```{=typst}
#raw(read("code/BTTH5-b-4.xml"), lang: "xml", block: true)
```

## Câu 5

Viết lệnh Xquery trả về `MSDH` và `TenDH` theo định dạng sau:

```xml
<!-- Dữ liệu mẫu -->
<QuanLySV>
    <ChiTietSV>1 DH CNTT</ChiTietSV>
</QuanLySV>
```

Sử dụng `FOR XML PATH` để tạo cấu trúc XML từ dữ liệu quan hệ.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-5.sql"), lang: "sql", block: true),
    caption: "Câu 5 - Tạo cấu trúc XML từ dữ liệu quan hệ"
)
```

Giải thích:

- `FOR XML PATH('QuanLySV')`: Tạo cấu trúc XML với phần tử gốc là `QuanLySV`.
- `CAST(MSDH AS VARCHAR) + ' ' + TenDH`: Nối MSDH và TenDH thành một chuỗi.

Kết quả:

![BTTH5-b-5](assets/BTTH5-b-5.png)

```{=typst}
#raw(read("code/BTTH5-b-5.xml"), lang: "xml", block: true)
```

## Câu 6

Viết lệnh Xquery xóa tên các sinh viên trường DH `KHTN`.

Sử dụng phương thức `modify()` với lệnh `delete` để xóa thuộc tính.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-6.sql"), lang: "sql", block: true),
    caption: "Câu 6 - Xóa tên các sinh viên trường DH KHTN"
)
```

Giải thích:

- `modify('delete ...')`: Phương thức để sửa đổi XML.
- `/THONGTINSV/sinhvien/@Ten`: Đường dẫn đến thuộc tính `Ten` của tất cả các phần tử `sinhvien`.
- Sau khi thực thi, tất cả các thuộc tính `Ten` của sinh viên trong trường DH KHTN sẽ bị xóa.

Hoàn thành:

![BTTH5-b-6](assets/BTTH5-b-6.png)

Kiểm tra lại:

```{=typst}
#raw(read("code/BTTH5-b-6a.sql"), lang: "sql", block: true)
```

Kết quả:

- Không còn thuộc tính `Ten` trong `sinhvien`.

```{=typst}
#raw(read("code/BTTH5-b-6.xml"), lang: "xml", block: true)
```

## Câu 7

Viết lệnh Xquery trả về thông tin các sinh viên có tên là '`Nam`' hoặc '`Thanh`'.

Sử dụng toán tử logic `or` trong mệnh đề `where` để lọc dữ liệu theo nhiều điều kiện.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-7.sql"), lang: "sql", block: true),
    caption: "Câu 7 - Các sinh viên có tên là 'Nam' hoặc 'Thanh'"
)
```

Giải thích:

- `where $s/@Ten = "Nam" or $s/@Ten = "Thanh"`: Lọc các sinh viên có tên là "Nam" hoặc "Thanh".
- Kết quả trả về tất cả các phần tử `sinhvien` thỏa mãn một trong hai điều kiện.

Kết quả:

![BTTH5-b-7](assets/BTTH5-b-7.png)

```{=typst}
#raw(read("code/BTTH5-b-7.xml"), lang: "xml", block: true)
```

## Câu 8

Viết lệnh Xquery thay đổi tên sinh viên thứ 2 thành tên '`Binh`' trong trường `CNTT`.

Sử dụng `replace value of` để thay đổi giá trị của thuộc tính tại vị trí cụ thể

```{=typst}
#figure(
    raw(read("code/BTTH5-b-8.sql"), lang: "sql", block: true),
    caption: "Câu 8 - Thay đổi tên sinh viên thứ 2 thành tên 'Binh'"
)
```

Giải thích:

- `[/THONGTINSV/sinhvien](2)`: Chọn phần tử `sinhvien` thứ 2 (chỉ số bắt đầu từ 1).
- `replace value of ... with "Binh"`: Thay thế giá trị của thuộc tính `Ten` bằng "Binh"

Hoàn thành:

![BTTH5-b-8](assets/BTTH5-b-8.png)

Kiểm tra lại:

```{=typst}
#raw(read("code/BTTH5-b-8a.sql"), lang: "sql", block: true)
```

Kết quả:

- Thay đổi tên sinh viên thứ 2 (không phụ thuộc vào ID) thành tên 'Binh' trong trường CNTT.

```{=typst}
#raw(read("code/BTTH5-b-8.xml"), lang: "xml", block: true)
```

## Câu 9

Viết lệnh Xquery kiểm tra xem có tồn tại sinh viên có `ID` là 12 trong trường `KHTN` không?

- Nếu có trả về 1
- Nếu không thì trả về 0.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-9.sql"), lang: "sql", block: true),
    caption: "Câu 9 - Kiểm tra tồn tại sinh viên ID 12 trong KHTN"
)
```

Giải thích:

- `exist()`: Phương thức kiểm tra sự tồn tại của phần tử hoặc điều kiện trong XML.
- Trả về `1` nếu tìm thấy sinh viên có ID=12, `0` nếu không tìm thấy.

Hoàn thành:

- Có 1 sinh viên có `ID = 12` trong trường `KHTN`.

![BTTH5-b-9](assets/BTTH5-b-9.png)

Kiểm tra lại:

```{=typst}
#raw(read("code/BTTH5-b-9a.sql"), lang: "sql", block: true)
```

Kết quả:

- Trả về `sinhvien` có `ID = 12` trong trường `KHTN`.
- Hiện tại đã không còn thuộc tính `Ten` trong `sinhvien`.

```{=typst}
#raw(read("code/BTTH5-b-9.xml"), lang: "xml", block: true)
```

## Câu 10

Viết lệnh Xquery kiểm tra xem có tồn tại sinh viên tên '`Lan`' trong trường `CNTT` không?

- Nếu có trả về 1
- Nếu không thì trả về 0.

Và `INSERT` thêm vào `THONGTINSV`:

```xml
<!-- Dữ liệu mẫu -->
<sinhvien ID="15" Ten="Lan">
<monhoc ID="10" Ten="Toan Roi Rac" />
<monhoc ID="11" Ten="Lap Trinh C#" />
<monhoc ID="12" Ten="CSDL Nang Cao" />
</sinhvien>
```

### Kiểm Tra

Kiểm tra xem có tồn tại sinh viên `Lan` trong trường `CNTT` không:

```{=typst}
#figure(
    raw(read("code/BTTH5-b-10a.sql"), lang: "sql", block: true),
    caption: "Câu 10 - Kiểm tra sinh viên tên 'Lan' trong CNTT"
)
```

Giải thích:

- `exist()`: Phương thức kiểm tra sự tồn tại của phần tử hoặc điều kiện trong XML.
- Trả về `1` nếu tìm thấy sinh viên tên 'Lan', `0` nếu không tìm thấy.

Kết quả:

- Không có sinh viên nào tên `Lan` trong trường `CNTT`.

![BTTH5-b-10](assets/BTTH5-b-10.png)

### Thêm Thông Tin

Thêm `Lan` vào `THONGTINSV`:

Sử dụng lệnh `insert` với các tùy chọn vị trí: `as first`, `as last`, `before`, `after`.

```{=typst}
#figure(
    raw(read("code/BTTH5-b-10b.sql"), lang: "sql", block: true),
    caption: "Câu 10 - Thêm sinh viên tên 'Lan' vào CNTT"
)
```

Giải thích:

- `insert ... as last into [/THONGTINSV](1)`: Chèn phần tử mới vào cuối cùng của phần tử `THONGTINSV` đầu tiên.
- `(1)`: Chỉ định phần tử đầu tiên (vì có thể có nhiều phần tử `THONGTINSV`).

Hoàn thành:

![BTTH5-b-10b](assets/BTTH5-b-10b.png)

Kiểm tra lại:

```{=typst}
#raw(read("code/BTTH5-b-10d.sql"), lang: "sql", block: true)
```

Kết quả:

![BTTH5-b-10d](assets/BTTH5-b-10d.png)

Thông tin của sinh viên:

```{=typst}
#raw(read("code/BTTH5-b-10d.xml"), lang: "xml", block: true)
```

## Câu 11

Viết lệnh Xquery thực hiện phép nối bằng các lệnh Xquery như một câu truy vấn trong SQL để trả về thông tin là sinh viên nào học khóa học tên là gì, sinh viên nào học môn học gì?

```{=typst}
#figure(
    raw(read("code/BTTH5-b-11.sql"), lang: "sql", block: true),
    caption: "Câu 11 - Xquery thực hiện phép nối"
)
```

Giải thích:

- `for $sv in /THONGTINSV/sinhvien`: Vòng lặp ngoài duyệt qua tất cả sinh viên.
- `for $mh in $sv/monhoc`: Vòng lặp trong duyệt qua tất cả môn học của mỗi sinh viên.
- `sql:column("TenDH")`: Lấy giá trị từ cột quan hệ `TenDH` của bảng.
- `data($sv/@Ten)`: Lấy giá trị của thuộc tính `Ten` từ biến `$sv`.
- Kết quả: Mỗi dòng sẽ là một cặp (Sinh viên, Môn học) với tên khóa học tương ứng.

Kết quả:

![BTTH5-b-11](assets/BTTH5-b-11.png)

- CNTT: Thông tin đầy đủ bao gồm Khóa học, Tên sinh viên, Tên môn học. Ví dụ, đã lược bớt số dòng vì quá dài.

```{=typst}
#raw(read("code/BTTH5-b-11-cntt.xml"), lang: "xml", block: true)
```

- KHTN: Không có Tên sinh viên do đã bị xóa ở Câu 6. Dưới đây là các ví dụ, đã lược bớt số dòng vì quá dài.

```{=typst}
#raw(read("code/BTTH5-b-11-khtn.xml"), lang: "xml", block: true)
```

## Tổng Kết

- Sử dụng XPath để định vị và chọn phần tử XML.
- Sử dụng XQuery với cú pháp FLWOR để truy vấn dữ liệu XML.
- Sử dụng phương thức `modify()` để sửa đổi dữ liệu XML:
  - `insert`: Chèn phần tử mới.
  - `delete`: Xóa phần tử hoặc thuộc tính.
  - `replace value of`: Thay thế giá trị.
- Sử dụng phương thức `exist()` để kiểm tra sự tồn tại.
- Thực hiện phép nối (join) giữa các phần tử XML và dữ liệu quan hệ.
