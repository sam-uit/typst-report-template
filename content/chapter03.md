# BƯỚC 3 – Vigenère Cipher

- Nhập plaintext dài 3–4 dòng để tăng độ phức tạp.
- Encrypt → Vigenère → key = `LEMON`.
- Decrypt lại bằng key.
- Phân tích khóa bằng Analysis → Vigenère Analysis.
- Quan sát IC và độ dài khóa dự đoán.
- Tạo một ciphertext mới với key khác (`APPLE`, `SECRET`).
- Thực hành: sinh viên đổi ciphertext cho nhau để phá bằng Kasiski + IC.

## Plaintext

```c
DAI HOC QUOC GIA THANH PHO CHO CHI MINH
TRUONG DAI HOC CONG NGHE THONG TIN
KHOA KHOA HOC VA KY THUAT MAY TINH
```

![BƯỚC 3 – Vigenère Cipher, Plaintext](assets/1a-b3-01.png)

## Mã Hóa

- Menu **Encrypt/Decrypt $\to$ Symmetric (classic) $\to$ Vigenère**
    - **Key Entry**: `LEMON`
    - Chọn **Encrypt**

![BƯỚC 3 – Vigenère Cipher, Encrypt, Key Entry](assets/1a-b3-02.png)

- Có thể bấm **Text options** để xem thêm các tùy chọn về miền không gian khóa.

![BƯỚC 3 – Vigenère Cipher, Encrypt, Text options](assets/1a-b3-03.png)

- Kết Quả
    - Văn bản mẫu được mã hóa.

![BƯỚC 3 – Vigenère Cipher, Encrypted](assets/1a-b3-04.png)

## Analysis

- Độ dài khóa dự đoán là 14. Đây cho thấy 2 điểm:
    - Công cụ phân tích dựa trên từ điển tiếng Anh (ở phần **Text options**), nên khó có kết quả chính xác với ngôn ngữ khác.
    - Độ dài khóa sai lệch rất nhiều so với khóa gốc, cho thấy Vigenère đem đến sự bảo mật hơn so với Caesar.

![BƯỚC 3 – Vigenère Cipher, Analysis, Key Length](assets/1a-b3-05.png)

- Khóa dự đoán không chính xác

![BƯỚC 3 – Vigenère Cipher, Analysis, Key](assets/1a-b3-06.png)

- Khóa sai nên kết quả giải mã sai:

![BƯỚC 3 – Vigenère Cipher, Analysis, Decrypted with a wrong key](assets/1a-b3-07.png)

- Nhập lại mã khóa thủ công.

![BƯỚC 3 – Vigenère Cipher, Analysis, Decrypt, Key](assets/1a-b3-08.png)

- Văn bản gốc được giải mã thành công.

![BƯỚC 3 – Vigenère Cipher, Analysis, Decrypted](assets/1a-b3-09.png)

## Ciphertext Mới Với Các Key Khác

- Ciphertext với key: APPLE và SECRET, cho kết quả lần lượt.

![BƯỚC 3 – Vigenère Cipher, Key là APPLE và SECRET](assets/1a-b3-10.png)
