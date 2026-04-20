#import "../template/lib.typ": *

= Bước 2. Hash (Kiểm Tra Toàn Vẹn Dữ Liệu)
<buoc-2-hash-kiem-tra-toan-ven-du-lieu>


== Văn Bản Gốc
<van-ban-goc>

```
THIS IS A SECRET MESSAGE USED FOR SYMMETRIC ENCRYPTION DEMO.
```

#figure(image("assets/b2-1.png"),
  caption: [
    Bước 2.1. Văn Bản Gốc
  ]
)

== Hash
<hash>

- Indiv. Procedures → Hashes → chọn MD5, SHA-1, SHA-256 để tạo hash.
  - Các giá trị hash được tạo ra tương ứng.

```diff
- MD5:    24 EB A2 FB CF CD 46 2F 49 83 D5 AD 6A D5 73 28
- SHA1:   42 A6 7B 02 2F F2 C1 5B 85 B1 11 35 E5 24 04 FC BA 5E 29 20
- SHA256: 5B 01 81 E3 5F 13 78 4B D3 6F A1 48 80 76 5F D3 D5 49 8C 58 2F 44 C3 14 7F 46 6D 6D DD 5E E0 16
```

#figure(image("assets/b2-2.png"),
  caption: [
    Bước 2.2. Hashes
  ]
)

== Thay Đổi Văn Bản Và Thử Lại
<thay-doi-van-ban-va-thu-lai>

- Thay đổi 1 ký tự trong văn bản và tạo hash lại: Đổi dấu '.' thành dấu '!'.

```diff
- THIS IS A SECRET MESSAGE USED FOR SYMMETRIC ENCRYPTION DEMO.
+ THIS IS A SECRET MESSAGE USED FOR SYMMETRIC ENCRYPTION DEMO!
-                                                            ^
```

- Quan sát hiệu ứng Avalanche: hash thay đổi hoàn toàn.
  - Các mã hash với cùng các thuật toán đã dùng cho kết quả khác hoàn toàn.

```diff
- MD5:    24 EB A2 FB CF CD 46 2F 49 83 D5 AD 6A D5 73 28
+ MD5:    EF 04 31 9F 42 E4 99 FB B0 71 18 FD A0 0D EA EA
- SHA1:   42 A6 7B 02 2F F2 C1 5B 85 B1 11 35 E5 24 04 FC BA 5E 29 20
+ SHA1:   0A BB E2 A9 A0 03 D6 B6 93 11 EA 2E 76 AC 9F EB C5 C9 4D 21
- SHA256: 5B 01 81 E3 5F 13 78 4B D3 6F A1 48 80 76 5F D3 D5 49 8C 58 2F 44 C3 14 7F 46 6D 6D DD 5E E0 16
+ SHA256: 64 EE 4F 05 6A 0B 36 75 B1 0E F6 37 FB AC 93 2A DE FF 1E 34 DB 25 EA 7A 4B 21 39 24 9A 4D D7 32
```

#figure(image("assets/b2-3.png"),
  caption: [
    Bước 2.3. Hashes Sau Khi Đổi 1 Ký Tự
  ]
)
