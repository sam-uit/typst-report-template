#import "../template/lib.typ": *

= Bước 4. Chữ Ký Số (Digital Signature)
<buoc-4-chu-ky-so-digital-signature>


== Sign Document
<sign-document>

- Chọn #strong[Digitals Signatures/PKI] → #strong[Sign Document…]
  - Hash function: SHA1
  - Algorithms: RSA
  - PSE: Cặp khóa RSA-1024 bit vừa tạo.
  - PIN: 1234 (của cặp khóa vừa tạo).
  - Chọn #strong[Sign].

#figure(image("assets/b4-1.png"),
  caption: [
    Bước 4.1. Tạo Chữ Ký Số
  ]
)

- Văn bản đã ký và chữ ký.

#figure(image("assets/b4-2.png"),
  caption: [
    Bước 4.2. Văn Bản Đã Ký Và Chữ Ký
  ]
)

- Xem chữ ký vừa tạo ra.

#figure(image("assets/b4-3.png"),
  caption: [
    Bước 4.3. Xem Chữ Ký
  ]
)

== Verify Signature
<verify-signature>

- Chọn #strong[Digitals Signatures/PKI] → #strong[Verify Signature…]
  - Chọn RSA-1024 vừa tạo.
  - Xác nhận các thông số:
    - Algorithm: RSA
    - Hash function: SHA-1
  - Bấm #strong[Verify signature]

#figure(image("assets/b4-4.png"),
  caption: [
    Bước 4.4. Xác Nhận Chữ Ký
  ]
)

- Kết quả xác nhận chữ ký.
  - Thành công: chữ ký đúng.

#figure(image("assets/b4-5.png"),
  caption: [
    Bước 4.5. Kết Quả Xác Nhận Chữ Ký
  ]
)

== Giả Lập Chữ Ký Sai
<gia-lap-chu-ky-sai>

- Thay đổi 1 ký tự trong văn bản và tạo hash lại: Đổi dấu '.' thành dấu '!'.

#figure(image("assets/b4-6.png"),
  caption: [
    Bước 4.6. Giả Lập Chữ Ký Sai
  ]
)

- Chạy lại #strong[Verify Signature] với văn bản đã thay đổi.

#figure(image("assets/b4-7.png"),
  caption: [
    Bước 4.7. Chạy Lại Xác Nhận Chữ Ký Sai
  ]
)

- Kết quả của chữ ký đã thay đổi: Sai.

#figure(image("assets/b4-8.png"),
  caption: [
    Bước 4.8. Kết Quả Xác Nhận Chữ Ký Sai
  ]
)
