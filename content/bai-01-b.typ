== B. AN TOÀN DỮ LIỆU
<b-an-toan-du-lieu>


=== 7. Backup (Sao Lưu) và Restore (Khôi Phục)
<7-backup-sao-luu-va-restore-khoi-phuc>

Hãy backup CSDL `AAA` thành 1 file `AAA.BAK`, sau đó xóa CSDL `AAA` và hãy khôi phục `AAA` nhờ vào `AAA.BAK`. Thực hiện bằng 2 cách:

- Cách 1: Dùng giao diện.
  - Yêu cầu: Chụp màn hình các bước thực hiện (Chụp đúng phần cần thiết và rõ nét, có thể dùng công cụ Snipping Tool).
- Cách 2: Dùng câu lệnh.
  - Yêu cầu: Dùng các lệnh SQL để thực hiện.

==== Cách 1: Giao Diện (SSMS)
<cach-1-giao-dien-ssms>


===== Backup (Sao Lưu)
<backup-sao-luu>

- Click chuột phải vào CSDL AAA \> #strong[Tasks] \> #strong[Back Up…]

#figure(image("assets/btth3-bai-1-a-7-1.png"),
  caption: [
    Tasks \> Back Up…
  ]
)

- Mục #strong[Destination];: Chọn #strong[Disk];, chọn đường dẫn lưu file `AAA.BAK`.

#figure(image("assets/btth3-bai-1-a-7-2.png"),
  caption: [
    Destination: Chọn Disk
  ]
)

- Nhấn #strong[OK];.
  - Màn hình thông báo "The backup of database 'AAA' completed successfully").

#figure(image("assets/btth3-bai-1-a-7-3.png"),
  caption: [
    Backup Completed Successfully
  ]
)

===== Xóa DB
<xoa-db>

- Click chuột phải vào CSDL AAA -\> #strong[Delete];.
- Check vào ô #strong[Close existing connections] (để ngắt các kết nối đang chạy).

#figure(image("assets/btth3-bai-1-a-7-4.png"),
  caption: [
    Xóa DB
  ]
)

- Nhấn #strong[OK];.

===== Restore (Khôi Phục)
<restore-khoi-phuc>

- Click chuột phải vào thư mục #strong[Databases] -\> #strong[Restore Database…]
- Chọn #strong[Database] -\> Nhấn nút #strong[…] để duyệt file -\> Chọn file `AAA.BAK` vừa tạo.

#figure(image("assets/btth3-bai-1-a-7-5.png"),
  caption: [
    Restore (Khôi Phục)
  ]
)

- Nhấn #strong[OK];.

#figure(image("assets/btth3-bai-1-a-7-6.png"),
  caption: [
    Restore (Khôi Phục) Hoàn Thành
  ]
)

==== Cách 2: SQL
<cach-2-sql>

Mở cửa sổ #strong[New Query] và chạy lần lượt các đoạn lệnh.

===== Backup (Sao Lưu)
<backup-sao-luu>

```sql
BACKUP DATABASE AAA
TO DISK = 'C:\Users\Admin\Desktop\Backup\AAA.BAK'
WITH FORMAT;
GO
```

#figure(image("assets/btth3-bai-1-a-7-7.png"),
  caption: [
    SQL: Sao Lưu
  ]
)

===== Xóa DB
<xoa-db>

```sql
ALTER DATABASE AAA SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- để đảm bảo không có ai đang dùng Database
DROP DATABASE AAA;
```

#figure(image("assets/btth3-bai-1-a-7-8.png"),
  caption: [
    SQL: Xóa DB
  ]
)

===== Restore (Khôi Phục)
<restore-khoi-phuc>

```sql
RESTORE DATABASE AAA
FROM DISK =  'C:\Users\Admin\Desktop\Backup\AAA.BAK;
GO
```

#figure(image("assets/btth3-bai-1-a-7-9.png"),
  caption: [
    SQL: Khôi Phục
  ]
)

=== SQL Server Log
<sql-server-log>

Hãy đọc SQL Server Log trong phần SQL Enterprice → Management → SQL Server Log. Trình bày màn hình các bước thực hiện và ý nghĩa của mỗi trường thông tin trong bảng Log.

- #strong[Đường dẫn:] Trong SQL Server Management Studio (SSMS), mở rộng mục #strong[Management] -\> Mở rộng #strong[SQL Server Logs];. Click đúp vào #strong[Current] (hoặc Archive \#1, \#2).

#figure(image("assets/btth3-bai-1-a-8-1.png"),
  caption: [
    SQL Server Log
  ]
)

- Ý nghĩa các trường thông tin trong Log:
  - #strong[Date:] Thời gian (ngày/giờ) sự kiện xảy ra.

  - #strong[Source:] Nguồn gốc của thông báo (thường là Server, Logon, hoặc spid - Session Process ID).

  - #strong[Message:] Nội dung chi tiết của thông báo ("Database backed up…", "Login failed for user…").

  - Mục đích: Giúp quản trị viên theo dõi sức khỏe hệ thống, phát hiện lỗi đăng nhập, kiểm tra các tác vụ backup thành công hay thất bại.

#figure(image("assets/btth3-bai-1-a-8-2.png"),
  caption: [
    Ý nghĩa các trường thông tin trong Log
  ]
)

=== Employees
<employees>

Cho bảng Employees có cấu trúc như sau:

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR (50) NOT NULL,
    LastName VARCHAR (50) NOT NULL,
    BirthDate DATE NOT NULL,
    HireDate DATE NOT NULL );
GO
```

Giả sử tạo 1 View tên là `EmployeeNames` như sau:

```sql
CREATE VIEW EmployeeNames
AS
    SELECT FirstName, LastName
    FROM Employees
```

Hỏi câu lệnh `INSERT` dưới đây có thực hiện được hay không? Tại sao?

```sql
INSERT INTO EmployeeNames (FirstName, LastName) VALUES ('QuanLyThongTin', 'IE103');
```

#strong[Trả lời:]

- Câu lệnh INSERT này KHÔNG thực hiện được.

#strong[Giải thích:]

- #strong[Cấu trúc bảng (`Employees`)];:
  - Cột `BirthDate` được định nghĩa là `NOT NULL` (Bắt buộc có dữ liệu).
  - Cột `HireDate` được định nghĩa là `NOT NULL` (Bắt buộc có dữ liệu).
  - Không có giá trị mặc định (`DEFAULT`) nào được khai báo cho 2 cột này.
- #strong[Cấu trúc View (`EmployeeNames`):]
  - Chỉ chứa 2 cột: `FirstName` và `LastName`.
- #strong[Hành động INSERT:]
  - Câu lệnh: `INSERT INTO EmployeeNames (FirstName, LastName) VALUES (...)`
  - Khi insert vào View, SQL Server thực chất sẽ cố gắng insert vào bảng gốc `Employees`.
  - Câu lệnh trên cung cấp `FirstName`, `LastName` (và `EmployeeID` nếu ID tự tăng - Identity, trong trường hợp này thì không).
  - Tuy nhiên, nó #strong[không cung cấp giá trị] cho `BirthDate` và `HireDate`.

#strong[Thực nghiệm:]

- Nhận thông báo lỗi.

```sql
Msg 515, Level 16, State 2, Line 15
Cannot insert the value NULL into column 'HireDate', table 'BTTH2.dbo.Employees'; column does not allow nulls. INSERT fails.
```

#strong[Kết luận:]

- Do bảng gốc yêu cầu `BirthDate` và `HireDate` không được để trống (`NOT NULL`), nhưng câu lệnh `INSERT` thông qua View lại không cung cấp giá trị cho chúng, nên SQL Server sẽ báo lỗi vi phạm ràng buộc dữ liệu.

=== Mã Hóa Dữ Liệu
<ma-hoa-du-lieu>

Cho hình bên dưới.

#figure(image("assets/btth3-bai-1-a-10-1.png"),
  caption: [
    Mã Hóa Dữ Liệu
  ]
)

Hỏi hình trên đang mô tả mã hóa dữ liệu ở trạng thái nào? Vì sao?

Biết dữ liệu có 3 trạng thái là:

- Data at rest (trạng thái nghỉ),
- Data in use (trạng thái đang sử dụng),
- Data in motion/transit (trạng thái lưu chuyển).

Trả lời:

- Đồ họa trên miêu tả việc mã hóa dữ liệu ở các trạng thái sau đây.
- #strong[Data in motion/transit (Trạng thái lưu chuyển)]
  - Mũi tên từ bộ phận điều khiển ADO.NET (phía ứng dụng/Client) gửi đến Database có ghi chú "SQL Query with Cipher Parameters" (Truy vấn SQL với các tham số mật mã).
  - ADO.NET: “a set of computer software components that programmers can use to access data and data services from a database.”
  - Điều này có nghĩa là dữ liệu đã được mã hóa ngay tại ứng dụng (Client-side) trước khi nó được gửi tới lưu trữ.
  - Do đó, trên đường truyền, dữ liệu hoàn toàn ở dạng mã hóa, bảo vệ nó khỏi việc bị nghe lén.
- #strong[Data at rest (Trạng thái nghỉ)]
  - Ở phía bên phải (Database), hình ảnh biểu diễn dữ liệu ngay từ trước khi được đưa vào lưu trữ (hình trụ) là "Encrypted Data" (Dữ liệu đã mã hóa).
  - Ngay cả DBA (người quản trị cơ sở dữ liệu) khi truy xuất vào bảng cũng chỉ thấy chuỗi mã hóa vô nghĩa (ví dụ: 0x823ksk…).
  - Điều này chứng tỏ dữ liệu nằm trên thiết bị lưu trữ luôn ở trạng thái được mã hóa.
