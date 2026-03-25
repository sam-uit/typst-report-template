#import "../template/lib.typ": *

= BƯỚC 5 -- Transposition Cipher
<buoc-5-transposition-cipher>

- Encrypt → Transposition → Columnar.
- Key: 4312567.
- Giải mã lại.
- Dùng Analysis → Transposition Analysis để phá mã.
- Tạo thêm 2 ví dụ khác để sinh viên thử nghiệm.

== Mã Hóa
<ma-hoa>

- Menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Permutation / Transposition].
- Nhập vào chuỗi khóa đã cho, phân tách bằng dấu phẩy (,): `4,3,1,2,5,6,7`

#figure(image("assets/1a-b5-02.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Key Entry
  ]
)

- Chọn #strong[Encrypt].
  - Bảng mới hiện lên cho biết chuỗi khóa.
  - Chọn #strong[Display ciphertext] để xem kết quả mã hóa.

#figure(image("assets/1a-b5-03.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Encrypt
  ]
)

- Kết quả mã hóa:

#figure(image("assets/1a-b5-04.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Encrypted
  ]
)

== Giải Mã
<giai-ma>

- Tại cửa sổ văn bản đã mã hóa, chọn menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Permutation / Transposition].
- Nhập vào mã khóa đã dùng trước đó: `4,3,1,2,5,6,7`
- Chọn #strong[Decrypt]

#figure(image("assets/1a-b5-05.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Decrypt, Key Entry
  ]
)

- Cửa sổ mới hiện ra, thông báo các cài đặt giải mã.
  - Chọn #strong[Display cleartext] để xem văn bản được giải mã (văn bản gốc).

#figure(image("assets/1a-b5-06.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Decrypt text with permutation
  ]
)

- Kết quả: văn bản gốc được giải mã.

#figure(image("assets/1a-b5-07.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Decrypted
  ]
)

== Analysis
<analysis>

- Menu #strong[Analysis $arrow.r$ Symmetric (classic) $arrow.r$ Simple Column Transposition].
- Cửa sổ #strong[Analysis of a Simple Column Transposition] hiện lên.
  - Chỉ định #strong[Plaintext] và #strong[Ciphertext] lần lượt bằng cách dùng menu xổ xuống và chọn cửa sổ tương ứng.

#figure(image("assets/1a-b5-08.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Analysis, Plaintext
  ]
)

- Tương tự với #strong[Ciphertext]

#figure(image("assets/1a-b5-09.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Analysis, Ciphertext
  ]
)

- Key được tìm ra, so sánh với key đã dùng trước đó: `4,3,1,2,5,6,7`

#figure(image("assets/1a-b5-10.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Analysis, Recovered Permutation Keys
  ]
)

- Có thể copy key để phục vụ việc giải mã.

#figure(image("assets/1a-b5-11.png"),
  caption: [
    BƯỚC 5 -- Transposition Cipher, Analysis, Key
  ]
)
