#import "../template/lib.typ": *

= PHẦN D. TẠO MEMORY DUMP CỦA MỘT TIẾN TRÌNH
<phan-d-tao-memory-dump-cua-mot-tien-trinh>

#quote(block: true)[
Phần D và E là phần tuỳ chọn. Sinh viên tự tìm hiểu cách thực hiện để hoàn thành nội dung này.
]

== D1 -- Tạo Process Dump
<d1-tao-process-dump>

Task Manager → tab Details → chuột phải tiến trình → Create dump file.

#figure(image("assets/d1-1.png"),
  caption: [
    D1. Tạo Process Dump Cho Notepad
  ]
)

== D2 -- Lưu File
<d2-luu-file>

Windows tạo file tại:

```
C:\Users\uit\AppData\Local\Temp\notepad.DMP
```

#figure(image("assets/d2-1.png"),
  caption: [
    D2. File Process Dump Của Notepad
  ]
)

== D3 -- Kiểm Tra File Dump
<d3-kiem-tra-file-dump>

- Mở bằng Notepad++ hoặc Visual Studio.
- Tìm text:

```
password
token
session
```

\(Ghi chú: Đây là bài mô phỏng -- không phân tích dữ liệu thật.)
