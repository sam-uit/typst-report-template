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

Có thể duyệt file .DMP và tìm thấy rất nhiều thông tin về tiến trình và các dữ liệu của tiến trình, bao gồm đường dẫn tới file thực thi, các thư viện được sử dụng, vv.. như các ví dụ dưới đây:

#figure(image("assets/d3-notepad.png"),
  caption: [
    D3. Kiểm Tra File Dump Của Notepad
  ]
)

- password

#figure(image("assets/d3-password.png"),
  caption: [
    D3. Kiểm Tra File Dump Của Notepad - password
  ]
)

- token

#figure(image("assets/d3-token.png"),
  caption: [
    D3. Kiểm Tra File Dump Của Notepad - token
  ]
)

- session

#figure(image("assets/d3-session.png"),
  caption: [
    D3. Kiểm Tra File Dump Của Notepad - session
  ]
)
