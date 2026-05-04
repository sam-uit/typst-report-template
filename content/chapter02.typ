#import "../template/lib.typ": *

= PHẦN B. KIỂM TRA TIẾN TRÌNH BẰNG LỆNH WINDOWS
<phan-b-kiem-tra-tien-trinh-bang-lenh-windows>


== B1 -- Liệt Kê Tiến Trình Bằng CMD
<b1-liet-ke-tien-trinh-bang-cmd>

CMD: `tasklist`

Yêu cầu:

- Chụp ảnh kết quả.
- Nhận diện tiến trình "không rõ nguồn gốc".

Không có tiến trình lạ trong danh sách:

- Ngoại trừ `spice-webdavd.exe` là cài đặt thêm như một phần của phần mềm ảo hóa.

#figure(image("assets/b1-1.png"),
  caption: [
    B1. Liệt Kê Tiến Trình Bằng CMD
  ]
)

== B2 -- Kiểm Tra Tiến Trình Theo RAM Bằng PowerShell
<b2-kiem-tra-tien-trinh-theo-ram-bang-powershell>

PowerShell:

```powershell
Get-Process | Sort WS -Descending | Select -First 10
```

Tiến hành cài đặt PowerShell (Installing PowerShell on Windows)

Yêu cầu:

- Chụp ảnh kết quả.
- Ghi chú tiến trình chiếm nhiều RAM nhất.

Tiến trình chiếm nhiều RAM nhất:

- #strong[explorer] với giá trị là 57680 KB.

#figure(image("assets/b2-1.png"),
  caption: [
    B2. Kiểm Tra Tiến Trình Theo RAM Bằng PowerShell
  ]
)

== B3 -- Tìm Tiến Trình Theo Tên
<b3-tim-tien-trinh-theo-ten>

PowerShell:

```powershell
Get-Process -Name notepad
```

\(Thử tìm tiến trình của ứng dụng đang mở, ví dụ Notepad/Chrome).
