#import "../template/lib.typ": *

= BƯỚC 1 -- Làm Quen CrypTool
<buoc-1-lam-quen-cryptool>

- File → New.
- Quan sát menu Encrypt, Decrypt, Analysis.
  - Chụp lại hình các menu này, mô tả các mục trong menu.
- Nhập văn bản mẫu để thử nghiệm một vài mục trong menu trên.

=== Văn Bản Mẫu
<van-ban-mau>

- File $arrow.r$ New:
  - Cho phép tạo một đoạn văn bản mẫu, ví dụ: `TRUONG DAI HOC CONG NGHE THONG TIN`.

#figure(image("assets/1a-b1-01.png"),
  caption: [
    Bước 1: Văn Bản Mẫu
  ]
)

=== Các Menu
<cac-menu>

- Menu Encrypt/Decrypt:
  - Liệt kê các kỹ thuật Mã Hóa, bao gồm:
    - Symmetric (classic): Mã Hóa Đối Xứng Cổ Điển
      - Caesar
      - Vigenere
      - Playfair
      - vv…
    - Symmetric (classic): Mã Hóa Đối Xứng Hiện Đại
    - Asymmetric: Mã Hóa Bất Đối Xứng
    - Hybrid: Mã Hóa Lai

#figure(image("assets/1a-b1-02.png"),
  caption: [
    Bước 1: Menu Encrypt/Decrypt
  ]
)

- Menu Analysis
  - Cho phép phân tích các kỹ thuật mã hóa.
  - Có menu sắp xếp gần như tương đương với menu Encrypt/Decrypt.

#figure(image("assets/1a-b1-03.png"),
  caption: [
    Bước 1: Menu Analysis
  ]
)

=== Thử Nghiệm
<thu-nghiem>

- Mã hóa văn bản mẫu trên với Caesar:
  - Tại cửa sổ chính với văn bản mẫu đã có, chọn #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Caesar / Rot13…]
  - Cửa sổ #strong[Key Entry: Caesar / Rot13] hiện lên.
    - Chỉ định biến thể (#strong[variant]): Caesar; Ký tự đầu tiên bắt đầu từ 0: $A = 0$.
    - #strong[Key entry as]: chỉ định ký tự (độ lớn của sự dịch chuyển), trong ví dụ này là $S$, với $S = 18$.
  - Chọn nút #strong[Encrypt].

#figure(image("assets/1a-b1-04.png"),
  caption: [
    Thử nghiệm 1: Caesar, Encrypt, Key Entry
  ]
)

- Kết quả:
  - Văn bản đã được mã hóa, cho ra kết quả: `LJMGFY VSA ZGU UGFY FYZW LZGFY LAF`
  - Cửa sổ kết quả cho biết key là gì, offset bao nhiêu.

#figure(image("assets/1a-b1-05.png"),
  caption: [
    Thử nghiệm 1: Caesar, Encrypt, Kết Quả
  ]
)

- Giải mã
  - Tại cửa sổ kết quả, chọn menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Caesar / Rot13…]
  - Cửa sổ #strong[Key Entry: Caesar / Rot13] hiện lên.
    - Thực hiện các thay đổi như ở phần mã hóa.
  - Chọn nút #strong[Decrypt].
  - Kết quả trả về là văn bản gốc, có hiện thị key và offset.

#figure(image("assets/1a-b1-06.png"),
  caption: [
    Thử nghiệm 1: Caesar, Decrypt, Kết Quả
  ]
)
