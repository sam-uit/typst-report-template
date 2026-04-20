#import "../template/lib.typ": *

= Bước 1. Mã Hoá & Giải Mã Bằng Mã Hoá Đối Xứng (AES/DES)
<buoc-1-ma-hoa-giai-ma-bang-ma-hoa-doi-xung-aes-des>

- Nhập văn bản: THIS IS A SECRET MESSAGE USED FOR SYMMETRIC ENCRYPTION DEMO.
- Encrypt → Symmetric (modern) → AES → nhập key: MyStrongKey123.
- Chọn mode ECB hoặc thay đổi CBC/CFB/OFB để quan sát khác biệt.
- Giải mã bằng Decrypt → Symmetric (modern) → AES với cùng key.
