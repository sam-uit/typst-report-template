# PHẦN D. TẠO MEMORY DUMP CỦA MỘT TIẾN TRÌNH

> Phần D và E là phần tuỳ chọn. Sinh viên tự tìm hiểu cách thực hiện để hoàn thành nội dung này.

## D1 – Tạo Process Dump

Task Manager → tab Details → chuột phải tiến trình → Create dump file.

![D1. Tạo Process Dump Cho Notepad](assets/d1-1.png)

## D2 – Lưu File

Windows tạo file tại:

```
C:\Users\uit\AppData\Local\Temp\notepad.DMP
```

![D2. File Process Dump Của Notepad](assets/d2-1.png)

## D3 – Kiểm Tra File Dump

- Mở bằng Notepad++ hoặc Visual Studio.
- Tìm text:

```
password
token
session
```

(Ghi chú: Đây là bài mô phỏng – không phân tích dữ liệu thật.)
