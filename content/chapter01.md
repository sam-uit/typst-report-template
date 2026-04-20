# Bước 1. Mã Hoá & Giải Mã Bằng Mã Hoá Đối Xứng (AES/DES)

## Chuẩn Bị

- Nhập văn bản: THIS IS A SECRET MESSAGE USED FOR SYMMETRIC ENCRYPTION DEMO.

![Bước 1.1. Văn Bản Gốc](assets/b1-1.png)

- Key `MyStrongKey123` và dạng Hex:
  - Chọn View > Hex dump

![Bước 1.2. Key MyStrongKey123](assets/b1-2.png)

## Mã Hóa AES (CBC)

- Encrypt → Symmetric (modern) → AES (CBC) → nhập key: MyStrongKey123 (dạng Hex)
  - `4D 79 53 74 72 6F 6E 67 4B 65 79 31 32 33`
  - Các bit thiếu sẽ được thêm vào ở dạng `00 00`

![Bước 1.3. Mã Hóa AES (CBC)](assets/b1-3.png)

- Văn bản đã được mã hóa:

![Bước 1.4. Văn Bản Mã Hóa](assets/b1-4.png)

## Giải Mã AES (CBC)

<!-- - Chọn mode ECB hoặc thay đổi CBC/CFB/OFB để quan sát khác biệt. -->
- Giải mã bằng Decrypt → Symmetric (modern) → AES với cùng key.

![Bước 1.5. Giải Mã](assets/b1-5.png)

## Mã Hóa Triple DES (CBC)

- Encrypt → Symmetric (modern) → Triple DES (CBC) → nhập key: MyStrongKey123 (dạng Hex)

![Bước 1.6. Mã Hóa Triple DES (CBC)](assets/b1-6.png)

- Văn bản đã được mã hóa:

![Bước 1.7. Văn Bản Mã Hóa Triple DES (CBC)](assets/b1-7.png)

## Giải Mã Triple DES (CBC)

- Giải mã bằng Decrypt → Symmetric (modern) → Triple DES (CBC) với cùng key.

![Bước 1.8. Giải Mã Triple DES (CBC)](assets/b1-8.png)

## So Sánh Văn Bản Mã Hóa AES (CBC) vs Triple DES (CBC)

- Văn bản mã hóa của AES (CBC) và Triple DES (CBC) có sự khác biệt.

![Bước 1.9. So Sánh Văn Bản Mã Hóa AES (CBC) vs Triple DES (CBC)](assets/b1-9.png)
