#import "../template/lib.typ": *

= BƯỚC 3 -- Vigenère Cipher
<buoc-3-vigenere-cipher>

- Nhập plaintext dài 3--4 dòng để tăng độ phức tạp.
- Encrypt → Vigenère → key = `LEMON`.
- Decrypt lại bằng key.
- Phân tích khóa bằng Analysis → Vigenère Analysis.
- Quan sát IC và độ dài khóa dự đoán.
- Tạo một ciphertext mới với key khác (`APPLE`, `SECRET`).
- Thực hành: sinh viên đổi ciphertext cho nhau để phá bằng Kasiski + IC.

== Plaintext
<plaintext>

```c
DAI HOC QUOC GIA THANH PHO CHO CHI MINH
TRUONG DAI HOC CONG NGHE THONG TIN
KHOA KHOA HOC VA KY THUAT MAY TINH
```

#figure(image("assets/1a-b3-01.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Plaintext
  ]
)

== Mã Hóa
<ma-hoa>

- Menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Vigenère]
  - #strong[Key Entry]: `LEMON`
  - Chọn #strong[Encrypt]

#figure(image("assets/1a-b3-02.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Encrypt, Key Entry
  ]
)

- Có thể bấm #strong[Text options] để xem thêm các tùy chọn về miền không gian khóa.

#figure(image("assets/1a-b3-03.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Encrypt, Text options
  ]
)

- Kết Quả
  - Văn bản mẫu được mã hóa.

#figure(image("assets/1a-b3-04.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Encrypted
  ]
)

== Analysis
<analysis>

- Độ dài khóa dự đoán là 14. Đây cho thấy 2 điểm:
  - Công cụ phân tích dựa trên từ điển tiếng Anh (ở phần #strong[Text options]), nên khó có kết quả chính xác với ngôn ngữ khác.
  - Độ dài khóa sai lệch rất nhiều so với khóa gốc, cho thấy Vigenère đem đến sự bảo mật hơn so với Caesar.

#figure(image("assets/1a-b3-05.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Analysis, Key Length
  ]
)

- Khóa dự đoán không chính xác

#figure(image("assets/1a-b3-06.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Analysis, Key
  ]
)

- Khóa sai nên kết quả giải mã sai:

#figure(image("assets/1a-b3-07.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Analysis, Decrypted with a wrong key
  ]
)

- Nhập lại mã khóa thủ công.

#figure(image("assets/1a-b3-08.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Analysis, Decrypt, Key
  ]
)

- Văn bản gốc được giải mã thành công.

#figure(image("assets/1a-b3-09.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Analysis, Decrypted
  ]
)

== Ciphertext Mới Với Các Key Khác
<ciphertext-moi-voi-cac-key-khac>

- Ciphertext với key: APPLE và SECRET, cho kết quả lần lượt.

#figure(image("assets/1a-b3-10.png"),
  caption: [
    BƯỚC 3 -- Vigenère Cipher, Key là APPLE và SECRET
  ]
)
