# Bước 3. Mã Hoá Khóa Công Khai RSA

## Văn Bản Gốc

```
THIS IS A SECRET MESSAGE USED FOR ASYMMETRIC ENCRYPTION DEMO.
```

## Tạo Cặp Khóa RSA

- Digital Signatures/KPI → PKI → Generate/Import Keys...

- Nhập các thông tin cần thiết.
    - Sau đó bấm Tạo Cặp Khóa (**Generate new key pair...**).

```diff
+ First Name:       Sam
+ Last Name:        Dinh
+ PIN:              1234
+ PIN verification: 1234
```

![Bước 3.1. Tạo Cặp Khóa RSA](assets/b3-1.png)

- Quá trình tạo cặp khóa sẽ bắt đầu:
    - Thời gian hoàn thành vào độ lớn của khóa, sức mạnh tính toán, v...

![Bước 3.2. Tạo Cặp Khóa RSA](assets/b3-2.png)

- Sau khi tạo cặp khóa thành công, ta sẽ có thông báo về việc tạo cặp khóa thành công.
    - Hoàn thành trong khoảng 7.125 giây.

![Bước 3.3. Tạo Cặp Khóa RSA](assets/b3-3.png)

- Bấm chọn **Show key pair...** để xem cặp khóa vừa tạo.

![Bước 3.4. Show Key Pair](assets/b3-4.png)

- Có thể chọn **Export PSE (PKCS#12)** để lưu trữ.

![Bước 3.5. Export PSE (PKCS#12)](assets/b3-5.png)

## Mã Hóa Văn Bản Với Public Key 

- Chọn **Encrypt/Decrypt** → **Asymmetric** → **RSA** → **Encryption**.
    - Chọn key vừa tạo.

![Bước 3.6. Mã Hóa Văn Bản Với Public Key](assets/b3-6.png)

- Mã hóa thành công, trong chưa tới 1 giây

![Bước 3.7. Văn Bản Mã Hóa](assets/b3-7.png)

## Giải Mã Với Private Key

- Chọn **Encrypt/Decrypt** → **Asymmetric** → **RSA** → **Decryption**.
    - Chọn key vừa tạo cần dùng.
    - Điền vào mã PIN khi tạo key.

![Bước 3.8. Giải Mã Văn Bản Với Private Key](assets/b3-8.png)

- Kết quả giải mã:
    - Văn bản gốc ở bên phải.
    - Hoàn thành trong 0.016 giây.

![Bước 3.9. Văn Bản Giải Mã](assets/b3-9.png)

- Lưu ý: Nếu không điền đúng mã PIN, nhận thông báo lỗi.

![Bước 3.10. Thông Báo Sai Mã PIN](assets/b3-10.png)

## Thử Nghiệm Với Độ Dài Bit 2048

- Tạo mã key mới với cùng thông tin nhưng khác về độ dài bit.
    - Độ dài bit: 2048

![Bước 3.11. Tạo Cặp Khóa RSA 2048 Bit](assets/b3-11.png)

- Thông báo tạo cặp key mới hoàn thành: 3.656 giây.

![Bước 3.12. Thông Báo Tạo Cặp Khóa RSA 2048 Bit](assets/b3-12.png)

- Mã key mới đã sẵn sàng: Sam Dinh RSA-2048

![Bước 3.13. Show Key Pair](assets/b3-13.png)

- Mã hóa văn bản gốc với key RSA 2048 bit.

![Bước 3.14. Mã Hóa Văn Bản Với Public Key 2048 Bit](assets/b3-14.png)

- Giải mã với key RSA 2048 bit: nhập mã PIN đã dùng.

![Bước 3.15. Giải Mã Văn Bản Với Private Key 2048 Bit](assets/b3-15.png)

- Kết quả giải mã: Hoàn thành trong 0.046 giây.

![Bước 3.16. Văn Bản Giải Mã](assets/b3-16.png)

- Như vậy, có sự chênh lệch đáng kể khi giải mã với key RSA 1024 bit và 2048 bit.
    - 1024: 0.016 giây
    - 2048: 0.046 giây
    - Gấp khoảng 3 lần.
