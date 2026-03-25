#import "../template/lib.typ": *

= BƯỚC 2 -- Caesar Cipher
<buoc-2-caesar-cipher>


== Mã Hóa
<ma-hoa>

- Nhập plaintext: `ATTACK AT DAWN`.
  - File $arrow.r$ New.
- Encrypt → Classical → Caesar → key = 3.
  - Mục #emph[Key entry as] chọn #emph[Number value], giá trị là 3.

#figure(image("assets/1a-b2-01.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Encrypt, Key Entry
  ]
)

- Kết quả: văn bản được mã hóa thành `DWWDFN DW GDZQ`.

#figure(image("assets/1a-b2-02.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Encrypt, Kết Quả
  ]
)

== Giải Mã
<giai-ma>

- Dùng Decrypt để giải mã lại.
  - Menu Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Caesar / Rot13…
  - Nhập lại cấu hình như trước đó, cụ thể là key = 13.
  - Chọn #strong[Decrypt]

#figure(image("assets/1a-b2-01.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Decrypt, Key Entry
  ]
)

- Kết quả:

#figure(image("assets/1a-b2-03.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Decrypt, Kết Quả
  ]
)

== Analysis
<analysis>

- Phân tích brute-force: #strong[Analysis → Classical → Caesar Analysis].
  - Cho biết khả năng để giải mã, với key là 3. Nhưng sẽ tùy thuộc vào offset cụ thể là 0, hay là 1.
    - Với 0 thì đó là D.
    - Với 1 thì đó là C.
    - Trong trường hợp này, khi mã hóa, em đã chọn offset là 0, với key là 3, tức là D.

#figure(image("assets/1a-b2-04.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Analysis, Caesar Analysis
  ]
)

- Kết quả: văn bản mẫu được giải mã đúng.

#figure(image("assets/1a-b2-05.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Analysis, Decrypted
  ]
)

== Lặp Lại Với Các Key Khác
<lap-lai-voi-cac-key-khac>

- Lặp lại với các key khác: 5, 7, 13.
  - Sinh viên tự tạo 3 ciphertext và trao đổi để giải mã lẫn nhau.
  - Ví dụ với key = 13, chúng ta có văn bản đã mã hóa: `NGGNPX NG QNJA`

#figure(image("assets/1a-b2-06.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Encrypt, Key Entry, key = 13
  ]
)

- Sử dụng #strong[Analysis → Classical → Caesar Analysis]:
  - Cho biết key là 13, gồm 2 khả năng:
    - Key là $M$, nếu offset là 1.
    - Key là $N$, nếu offset là 0.

#figure(image("assets/1a-b2-07.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Analysis, Caesar Analysis, Key 13
  ]
)

- Giải mã: văn bản gốc đã được giải mã đúng.

#figure(image("assets/1a-b2-08.png"),
  caption: [
    BƯỚC 2 -- Caesar Cipher, Analysis, Decrypted, Key 13
  ]
)
