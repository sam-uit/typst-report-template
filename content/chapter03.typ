#import "../template/lib.typ": *

= Bước 3. Mã Hoá Khóa Công Khai RSA
<buoc-3-ma-hoa-khoa-cong-khai-rsa>


== Văn Bản Gốc
<van-ban-goc>

```
THIS IS A SECRET MESSAGE USED FOR ASYMMETRIC ENCRYPTION DEMO.
```

== Tạo Cặp Khóa RSA
<tao-cap-khoa-rsa>

- Digital Signatures/KPI → PKI → Generate/Import Keys…

- Nhập các thông tin cần thiết.

  - Sau đó bấm Tạo Cặp Khóa (#strong[Generate new key pair…]).

```diff
+ First Name:       Sam
+ Last Name:        Dinh
+ PIN:              1234
+ PIN verification: 1234
```

#figure(image("assets/b3-1.png"),
  caption: [
    Bước 3.1. Tạo Cặp Khóa RSA
  ]
)

- Quá trình tạo cặp khóa sẽ bắt đầu:
  - Thời gian hoàn thành vào độ lớn của khóa, sức mạnh tính toán, v…

#figure(image("assets/b3-2.png"),
  caption: [
    Bước 3.2. Tạo Cặp Khóa RSA
  ]
)

- Sau khi tạo cặp khóa thành công, ta sẽ có thông báo về việc tạo cặp khóa thành công.
  - Hoàn thành trong khoảng 7.125 giây.

#figure(image("assets/b3-3.png"),
  caption: [
    Bước 3.3. Tạo Cặp Khóa RSA
  ]
)

- Bấm chọn #strong[Show key pair…] để xem cặp khóa vừa tạo.

#figure(image("assets/b3-4.png"),
  caption: [
    Bước 3.4. Show Key Pair
  ]
)

- Có thể chọn #strong[Export PSE (PKCS\#12)] để lưu trữ.

#figure(image("assets/b3-5.png"),
  caption: [
    Bước 3.5. Export PSE (PKCS\#12)
  ]
)

== Mã Hóa Văn Bản Với Public Key
<ma-hoa-van-ban-voi-public-key>

- Chọn #strong[Encrypt/Decrypt] → #strong[Asymmetric] → #strong[RSA] → #strong[Encryption].
  - Chọn key vừa tạo.

#figure(image("assets/b3-6.png"),
  caption: [
    Bước 3.6. Mã Hóa Văn Bản Với Public Key
  ]
)

- Mã hóa thành công, trong chưa tới 1 giây

#figure(image("assets/b3-7.png"),
  caption: [
    Bước 3.7. Văn Bản Mã Hóa
  ]
)

== Giải Mã Với Private Key
<giai-ma-voi-private-key>

- Chọn #strong[Encrypt/Decrypt] → #strong[Asymmetric] → #strong[RSA] → #strong[Decryption].
  - Chọn key vừa tạo cần dùng.
  - Điền vào mã PIN khi tạo key.

#figure(image("assets/b3-8.png"),
  caption: [
    Bước 3.8. Giải Mã Văn Bản Với Private Key
  ]
)

- Kết quả giải mã:
  - Văn bản gốc ở bên phải.
  - Hoàn thành trong 0.016 giây.

#figure(image("assets/b3-9.png"),
  caption: [
    Bước 3.9. Văn Bản Giải Mã
  ]
)

- Lưu ý: Nếu không điền đúng mã PIN, nhận thông báo lỗi.

#figure(image("assets/b3-10.png"),
  caption: [
    Bước 3.10. Thông Báo Sai Mã PIN
  ]
)

== Thử Nghiệm Với Độ Dài Bit 2048
<thu-nghiem-voi-do-dai-bit-2048>

- Tạo mã key mới với cùng thông tin nhưng khác về độ dài bit.
  - Độ dài bit: 2048

#figure(image("assets/b3-11.png"),
  caption: [
    Bước 3.11. Tạo Cặp Khóa RSA 2048 Bit
  ]
)

- Thông báo tạo cặp key mới hoàn thành: 3.656 giây.

#figure(image("assets/b3-12.png"),
  caption: [
    Bước 3.12. Thông Báo Tạo Cặp Khóa RSA 2048 Bit
  ]
)

- Mã key mới đã sẵn sàng: Sam Dinh RSA-2048

#figure(image("assets/b3-13.png"),
  caption: [
    Bước 3.13. Show Key Pair
  ]
)

- Mã hóa văn bản gốc với key RSA 2048 bit.

#figure(image("assets/b3-14.png"),
  caption: [
    Bước 3.14. Mã Hóa Văn Bản Với Public Key 2048 Bit
  ]
)

- Giải mã với key RSA 2048 bit: nhập mã PIN đã dùng.

#figure(image("assets/b3-15.png"),
  caption: [
    Bước 3.15. Giải Mã Văn Bản Với Private Key 2048 Bit
  ]
)

- Kết quả giải mã: Hoàn thành trong 0.046 giây.

#figure(image("assets/b3-16.png"),
  caption: [
    Bước 3.16. Văn Bản Giải Mã
  ]
)

- Như vậy, có sự chênh lệch đáng kể khi giải mã với key RSA 1024 bit và 2048 bit.
  - 1024: 0.016 giây
  - 2048: 0.046 giây
  - Gấp khoảng 3 lần.
