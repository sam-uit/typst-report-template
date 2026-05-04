# PHẦN D. TẠO MEMORY DUMP CỦA MỘT TIẾN TRÌNH

> Phần D và E là phần tuỳ chọn. Sinh viên tự tìm hiểu cách thực hiện để hoàn thành nội dung này.

## D1 – Tạo Process Dump

Task Manager → tab Details → chuột phải tiến trình → Create dump file.

![D1. Tạo Process Dump Cho Notepad](assets/d1-1.png)

## D2 – Lưu File

Windows sẽ tạo file dạng:

```
C:\Users\<username>\AppData\Local\Temp\<process>.dmp
```

## D3 – Kiểm Tra File Dump

- Mở bằng Notepad++ hoặc Visual Studio.
- Tìm text:

```
password
token
session
```

(Ghi chú: Đây là bài mô phỏng – không phân tích dữ liệu thật.)
