#import "../template/lib.typ": *

= PHẦN B. KIỂM TRA TIẾN TRÌNH BẰNG LỆNH WINDOWS
<phan-b-kiem-tra-tien-trinh-bang-lenh-windows>


== B1 -- Liệt Kê Tiến Trình Bằng CMD
<b1-liet-ke-tien-trinh-bang-cmd>

CMD: tasklist Yêu cầu:

- Chụp ảnh kết quả.
- Nhận diện tiến trình “không rõ nguồn gốc”.

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

== B3 -- Tìm Tiến Trình Theo Tên
<b3-tim-tien-trinh-theo-ten>

PowerShell:

```powershell
Get-Process -Name notepad
```

\(Thử tìm tiến trình của ứng dụng đang mở, ví dụ Notepad/Chrome).
