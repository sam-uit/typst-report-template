# PHẦN B. KIỂM TRA TIẾN TRÌNH BẰNG LỆNH WINDOWS

## B1 – Liệt kê tiến trình bằng CMD

CMD: tasklist
Yêu cầu:

- Chụp ảnh kết quả.
- Nhận diện tiến trình “không rõ nguồn gốc”.

## B2 – Kiểm tra tiến trình theo RAM bằng PowerShell

PowerShell:

```powershell
Get-Process | Sort WS -Descending | Select -First 10
```

Tiến hành cài đặt PowerShell (Installing PowerShell on Windows)

Yêu cầu:

- Chụp ảnh kết quả.
- Ghi chú tiến trình chiếm nhiều RAM nhất.

## B3 – Tìm tiến trình theo tên

PowerShell:

```powershell
Get-Process -Name notepad
```

(Thử tìm tiến trình của ứng dụng đang mở, ví dụ Notepad/Chrome).
