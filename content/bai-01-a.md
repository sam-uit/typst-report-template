## A. TỔ CHỨC DỮ LIỆU

### Các kiểu dữ liệu (data type) dùng cho các trường (field) và cách sử dụng nó.

- **Kiểu số (Exact Numerics)**:
  - `INT`: Lưu số nguyên (4 bytes). Dùng cho ID, số lượng.
  - `BIGINT`: Số nguyên lớn (8 bytes). Dùng khi dữ liệu vượt quá 2 tỷ.
  - `BIT`: Giá trị `0` hoặc `1` (tương tự Boolean). Dùng cho trạng thái (Đúng/Sai).
  - `DECIMAL(p,s) `/ `NUMERIC`: Số thực chính xác. Dùng cho tiền tệ, tính toán khoa học.

- **Kiểu chuỗi ký tự (Character Strings)**:
  - `VARCHAR(n)`: Chuỗi ký tự độ dài thay đổi (không dấu). Dùng cho tên tiếng Anh, mã số.
  - `NVARCHAR(n)`: Chuỗi ký tự Unicode (có dấu tiếng Việt). Lưu ý: Tốn gấp đôi dung lượng so với `VARCHAR`.
  - `CHAR(n)`: Chuỗi ký tự độ dài cố định. Dùng cho các mã có độ dài cố định (VD: Mã bưu điện).

- **Kiểu ngày giờ (Date and Time)**:
  - `DATETIME`: Ngày và giờ chính xác đến mili-giây.
  - `DATE`: Chỉ lưu ngày (`YYYY-MM-DD`).

### Dung lượng (KB) tối đa của 1 row trong 1 table mà SQL Server cho phép.

- Dung lượng tối đa của một dòng (row) trong SQL Server được giới hạn bởi kích thước của một trang dữ liệu (Page).
- Giới hạn này là **8.060 bytes** (xấp xỉ 8KB).

### Dung lượng (KB) tối đa của 1 table mà SQL Server cho phép.

- Về lý thuyết, kích thước bảng chỉ bị giới hạn bởi dung lượng lưu trữ của hệ điều hành (File System) và phiên bản SQL Server.
- Dung lượng tối đa của Database là **524,272 Terabytes**.
  - Do đó, 1 table có thể chứa lượng dữ liệu khổng lồ gần như không giới hạn trong thực tế, miễn là lưu trữ còn chỗ trống.

### Tìm hiểu ý nghĩa các table hệ thống (System tables) trong CSDL Master như: Sysusers; Syssserver; Sysxlogin.



### Khi người dùng tạo 1 CSDL, SQL Server yêu cầu tạo ra tối thiểu bao nhiêu file? Ý nghĩa mỗi file? Chú ý câu lệnh: CREATE DATABASE AAA.

### Số user có thể connect cùng 1 thời điểm là bao nhiêu?

