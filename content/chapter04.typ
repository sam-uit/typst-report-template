#import "../template/lib.typ": *

= BƯỚC 4 -- Playfair Cipher
<buoc-4-playfair-cipher>

- Encrypt → Playfair → key = `SECRETKEY`.
- Ghi lại ma trận 5×5.
- Nhập plaintext có ký tự lặp (`MEET ME AT THE BRIDGE`).
- Quan sát cách CrypTool chèn X để xử lý chữ đôi.
- Giải mã lại.
- Thực hành mở rộng:
  - thử với khóa khác và plaintext dài hơn.

== Ma Trận Khóa
<ma-tran-khoa>

- Đây là ma trận $5 times 5$ vì văn bản gốc chỉ chứa các ký tự chữ cái (tối đa 26 ký tự), không chứa ký tự số.
- Một ký tự sẽ được lược bỏ, thường là $J$ để chuỗi khóa vừa với tổng số 25 ký tự của ma trận khóa.

#table(
  columns: (1fr,) * 6,
  align: (center, center, center, center, center, center),
  [#strong[\+]], [#strong[1]], [#strong[2]], [#strong[3]], [#strong[4]], [#strong[5]], [#strong[1]], [S], [E], [C], [R], [T], [#strong[2]], [K], [Y], [A], [B], [D], [#strong[3]], [F], [G], [H], [I], [L], [#strong[4]], [M], [N], [O], [P], [Q], [#strong[5]], [U], [V], [W], [X], [Z]
)

== Mã Hóa
<ma-hoa>

- Menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Playfair].
- Cửa sổ #strong[Key Entry: Playfair] hiện lên.
- Có thể chỉ định ký tự thay thế/phân tách:
  - $X$: mặc định.
  - $Y$: nếu cần thêm.
  - Chỉ chia tách khi có ký tự trùng trong cùng một cặp.
- Chỉ định kích thước ma trận:
  - $5 times 5$ : được chọn, vì không chứa ký tự số.

#figure(image("assets/1a-b4-01.png"),
  caption: [
    BƯỚC 4 -- Playfair Cipher, Key Entry
  ]
)

- Kết quả:
  - Văn bản gốc được băm thành từng cặp.
  - Văn bản đã mã hóa.

#figure(image("assets/1a-b4-02.png"),
  caption: [
    BƯỚC 4 -- Playfair Cipher, Cặp Ký Tự và Kết Quả Mã Hóa
  ]
)

== Meet Me At The Bridge
<meet-me-at-the-bridge>

- Văn bản gốc `MEET ME AT THE BRIDGE`.
- Menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Playfair].

#figure(image("assets/1a-b4-03.png"),
  caption: [
    BƯỚC 4 -- Playfair Cipher, MEET ME AT THE BRIDGE
  ]
)

- Trong trường hợp này, văn bản gốc không đủ ký tự chẵn để tạo thành các cặp, nên cặp cuối cùng, CrypTool chèn thêm $X$ vào để thành cặp hoàn chỉnh:
  - `ME ET ME AT TH EB RI DG EX`

#table(
  columns: (1fr,) * 26,
  align: (center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center),
  [1], [2], [], [3], [4], [], [5], [6], [], [7], [8], [], [9], [10], [], [11], [12], [], [13], [14], [], [15], [16], [], [17], [18], [M], [E], [], [E], [T], [], [M], [E], [], [A], [T], [], [T], [H], [], [E], [B], [], [R], [I], [], [D], [G], [], [E], [X]
)
#figure(image("assets/1a-b4-04.png"),
  caption: [
    BƯỚC 4 -- Playfair Cipher, MEET ME AT THE BRIDGE, Encrypted
  ]
)

- Tại cửa sổ text của văn bản đã mã hóa, chọn menu #strong[Encrypt/Decrypt $arrow.r$ Classic $arrow.r$ Playfair]
  - Nhập vào key = `SECRET`

#figure(image("assets/1a-b4-05.png"),
  caption: [
    BƯỚC 4 -- Playfair Cipher, MEET ME AT THE BRIDGE, Key Entry
  ]
)

- Giải mã thành công.

#figure(image("assets/1a-b4-06.png"),
  caption: [
    BƯỚC 4 -- Playfair Cipher, MEET ME AT THE BRIDGE, Decrypted
  ]
)
