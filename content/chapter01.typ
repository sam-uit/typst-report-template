#import "../template/lib.typ": *

= Bước 1. Mã Hoá & Giải Mã Bằng Mã Hoá Đối Xứng (AES/DES)
<buoc-1-ma-hoa-giai-ma-bang-ma-hoa-doi-xung-aes-des>


== Chuẩn Bị
<chuan-bi>

- Nhập văn bản: THIS IS A SECRET MESSAGE USED FOR SYMMETRIC ENCRYPTION DEMO.

#figure(image("assets/b1-1.png"),
  caption: [
    Bước 1.1. Văn Bản Gốc
  ]
)

- Key `MyStrongKey123` và dạng Hex:
  - Chọn View \> Hex dump

#figure(image("assets/b1-2.png"),
  caption: [
    Bước 1.2. Key MyStrongKey123
  ]
)

== Mã Hóa AES (CBC)
<ma-hoa-aes-cbc>

- Encrypt → Symmetric (modern) → AES (CBC) → nhập key: MyStrongKey123 (dạng Hex)
  - `4D 79 53 74 72 6F 6E 67 4B 65 79 31 32 33`
  - Các bit thiếu sẽ được thêm vào ở dạng `00 00`

#figure(image("assets/b1-3.png"),
  caption: [
    Bước 1.3. Mã Hóa AES (CBC)
  ]
)

- Văn bản đã được mã hóa:

#figure(image("assets/b1-4.png"),
  caption: [
    Bước 1.4. Văn Bản Mã Hóa
  ]
)

== Giải Mã AES (CBC)
<giai-ma-aes-cbc>

- Giải mã bằng Decrypt → Symmetric (modern) → AES với cùng key.

#figure(image("assets/b1-5.png"),
  caption: [
    Bước 1.5. Giải Mã
  ]
)

== Mã Hóa Triple DES (CBC)
<ma-hoa-triple-des-cbc>

- Encrypt → Symmetric (modern) → Triple DES (CBC) → nhập key: MyStrongKey123 (dạng Hex)

#figure(image("assets/b1-6.png"),
  caption: [
    Bước 1.6. Mã Hóa Triple DES (CBC)
  ]
)

- Văn bản đã được mã hóa:

#figure(image("assets/b1-7.png"),
  caption: [
    Bước 1.7. Văn Bản Mã Hóa Triple DES (CBC)
  ]
)

== Giải Mã Triple DES (CBC)
<giai-ma-triple-des-cbc>

- Giải mã bằng Decrypt → Symmetric (modern) → Triple DES (CBC) với cùng key.

#figure(image("assets/b1-8.png"),
  caption: [
    Bước 1.8. Giải Mã Triple DES (CBC)
  ]
)

== So Sánh Văn Bản Mã Hóa AES (CBC) vs Triple DES (CBC)
<so-sanh-van-ban-ma-hoa-aes-cbc-vs-triple-des-cbc>

- Văn bản mã hóa của AES (CBC) và Triple DES (CBC) có sự khác biệt.

#figure(image("assets/b1-9.png"),
  caption: [
    Bước 1.9. So Sánh Văn Bản Mã Hóa AES (CBC) vs Triple DES (CBC)
  ]
)
