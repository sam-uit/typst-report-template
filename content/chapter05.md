# BƯỚC 5 – Transposition Cipher

- Encrypt → Transposition → Columnar.
- Key: 4312567.
- Giải mã lại.
- Dùng Analysis → Transposition Analysis để phá mã.
- Tạo thêm 2 ví dụ khác để sinh viên thử nghiệm.

## Mã Hóa

- Menu **Encrypt/Decrypt $\to$ Symmetric (classic) $\to$ Permutation / Transposition**.
- Nhập vào chuỗi khóa đã cho, phân tách bằng dấu phẩy (,): `4,3,1,2,5,6,7`

![BƯỚC 5 – Transposition Cipher, Key Entry](assets/1a-b5-02.png)

- Chọn **Encrypt**.
    - Bảng mới hiện lên cho biết chuỗi khóa.
    - Chọn **Display ciphertext** để xem kết quả mã hóa.

![BƯỚC 5 – Transposition Cipher, Encrypt](assets/1a-b5-03.png)

- Kết quả mã hóa:

![BƯỚC 5 – Transposition Cipher, Encrypted](assets/1a-b5-04.png)

## Giải Mã

- Tại cửa sổ văn bản đã mã hóa, chọn menu **Encrypt/Decrypt $\to$ Symmetric (classic) $\to$ Permutation / Transposition**.
- Nhập vào mã khóa đã dùng trước đó: `4,3,1,2,5,6,7`
- Chọn **Decrypt**

![BƯỚC 5 – Transposition Cipher, Decrypt, Key Entry](assets/1a-b5-05.png)

- Cửa sổ mới hiện ra, thông báo các cài đặt giải mã.
    - Chọn **Display cleartext** để xem văn bản được giải mã (văn bản gốc).

![BƯỚC 5 – Transposition Cipher, Decrypt text with permutation](assets/1a-b5-06.png)

- Kết quả: văn bản gốc được giải mã.

![BƯỚC 5 – Transposition Cipher, Decrypted](assets/1a-b5-07.png)

## Analysis

- Menu **Analysis $\to$ Symmetric (classic) $\to$ Simple Column Transposition**.
- Cửa sổ **Analysis of a Simple Column Transposition** hiện lên.
    - Chỉ định **Plaintext** và **Ciphertext** lần lượt bằng cách dùng menu xổ xuống và chọn cửa sổ tương ứng.

![BƯỚC 5 – Transposition Cipher, Analysis, Plaintext](assets/1a-b5-08.png)

- Tương tự với **Ciphertext**

![BƯỚC 5 – Transposition Cipher, Analysis, Ciphertext](assets/1a-b5-09.png)

- Key được tìm ra, so sánh với key đã dùng trước đó: `4,3,1,2,5,6,7`

![BƯỚC 5 – Transposition Cipher, Analysis, Recovered Permutation Keys](assets/1a-b5-10.png)

- Có thể copy key để phục vụ việc giải mã.

![BƯỚC 5 – Transposition Cipher, Analysis, Key](assets/1a-b5-11.png)
