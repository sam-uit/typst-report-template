# Bước 4. Chữ Ký Số (Digital Signature)

## Sign Document

- Chọn **Digitals Signatures/PKI** → **Sign Document...**
  - Hash function: SHA1
  - Algorithms: RSA
  - PSE: Cặp khóa RSA-1024 bit vừa tạo.
  - PIN: 1234 (của cặp khóa vừa tạo).
  - Chọn **Sign**.

![Bước 4.1. Tạo Chữ Ký Số](assets/b4-1.png)

- Văn bản đã ký và chữ ký.

![Bước 4.2. Văn Bản Đã Ký Và Chữ Ký](assets/b4-2.png)

- Xem chữ ký vừa tạo ra.

![Bước 4.3. Xem Chữ Ký](assets/b4-3.png)

## Verify Signature

- Chọn **Digitals Signatures/PKI** → **Verify Signature...**
  - Chọn RSA-1024 vừa tạo.
  - Xác nhận các thông số:
    - Algorithm: RSA
    - Hash function: SHA-1
  - Bấm **Verify signature**

![Bước 4.4. Xác Nhận Chữ Ký](assets/b4-4.png)

- Kết quả xác nhận chữ ký.
  - Thành công: chữ ký đúng.

![Bước 4.5. Kết Quả Xác Nhận Chữ Ký](assets/b4-5.png)

## Giả Lập Chữ Ký Sai

- Thay đổi 1 ký tự trong văn bản và tạo hash lại: Đổi dấu '.' thành dấu '!'.

![Bước 4.6. Giả Lập Chữ Ký Sai](assets/b4-6.png)

- Chạy lại **Verify Signature** với văn bản đã thay đổi.

![Bước 4.7. Chạy Lại Xác Nhận Chữ Ký Sai](assets/b4-7.png)

- Kết quả của chữ ký đã thay đổi: Sai.

![Bước 4.8. Kết Quả Xác Nhận Chữ Ký Sai](assets/b4-8.png)
