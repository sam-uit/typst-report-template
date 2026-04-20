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

- Dùng Public Key để mã hoá văn bản.

== Giải Mã Với Private Key
<giai-ma-voi-private-key>

- Dùng Private Key để giải mã.

== Thử Nghiệm Với Độ Dài Bit 2048
<thu-nghiem-voi-do-dai-bit-2048>

- Thử dùng key 2048 bit và ghi nhận thay đổi tốc độ.
