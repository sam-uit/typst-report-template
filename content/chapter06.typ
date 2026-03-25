#import "../template/lib.typ": *

= BƯỚC 6 -- Solitaire Cipher
<buoc-6-solitaire-cipher>

- Tìm hiểu và cho biết cách thức mã hoá và giải mã của giải thuật
- Cho ví dụ mã hoá và giải mã, với plaintext là họ tên sinh viên

== Nguyên Lý Hoạt Động
<nguyen-ly-hoat-dong>

- Là một dạng mã dòng (stream cipher) sử dụng một bộ bài tây để tạo ra chuỗi khóa (keystream).
  - 54 lá gồm
    - 52 lá thường và
    - 2 lá Joker

Quy ước không gian khóa:

- Sử dụng trường hợp mặc định đánh chỉ số bắt đầu từ 0: $A = 0 \, B = 1 \, dots.h \, Z = 25$, như bảng sau đây:

#table(
  columns: (1fr,) * 26,
  align: (center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center, center),
  [0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24], [25], [A], [B], [C], [D], [E], [F], [G], [H], [I], [J], [K], [L], [M], [N], [O], [P], [Q], [R], [S], [T], [U], [V], [W], [X], [Y], [Z]
)
Nguyên lý cơ bản:

- #strong[Key] chính là thứ tự sắp xếp ban đầu của 54 lá bài trong bộ bài (Initial deck).
  - Có thể xuôi hoặc ngược, tức là nhỏ đến lớn hoặc ngược lại.
- Hệ thống sẽ xáo trộn bộ bài qua các bước cố định (dịch chuyển Joker, cắt bài, tráo bài…) để sinh ra từng con số ngẫu nhiên.
  - Tập hợp các số này tạo thành #strong[Keystream], ví dụ: `4,47,10,24,8,49,44,6,18,33,24`.
- Số ngẫu nhiên này sẽ được quy đổi ra độ dời để cộng vào bản gốc (Plaintext) giống như thuật toán Caesar hay Vigenère:
  - Ưu điểm: độ dời thay đổi liên tục và cực kỳ khó đoán cho từng chữ cái.
- #strong[Khi giải mã], bắt buộc phải có một bộ bài được sắp xếp y hệt như bộ bài ban đầu của người gửi (có thể load hoặc nhập thủ công)
  - Trải qua các bước xáo bài tương tự, người nhận sẽ tạo ra được chuỗi Keystream gốc
  - Lấy bản mã dịch chuyển đi một đoạn theo số trong Keystream là sẽ thu được bản rõ.

== Plaintext
<plaintext>

- Tên sinh viên: `DINH XUAN SAM`

== Mã Hóa
<ma-hoa>

- Menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Solitaire].
- Cửa sổ #strong[Key Entry] hiện lên, có thể #emph[cài đặt] các điều kiện mã hóa, ví dụ:
  - #strong[Total number of cards]: số lượng các lá bài.
  - #strong[Card order]: thứ tự của lá bài.

#figure(image("assets/1a-b6-01.png"),
  caption: [
    Bước 6 - Solitaire, Key Entry
  ]
)

- Chỉ định các cài đặt trong Key Entry:
  - #strong[Total number of cards]: 52
  - #strong[Card order]: #emph[ascending], nhỏ đến lớn.

#figure(image("assets/1a-b6-02.png"),
  caption: [
    Bước 6 - Solitaire, Key Entry và cài đặt
  ]
)

- Tại mục #strong[\2. Generating the keystream], chọn #strong[Automatic] (#emph[tự động]).
- Các keystream sẽ được tạo ra ở mục Output.
- Có thể lưu lại các keystream sử dụng các nút #strong[Save] tương ứng với #strong[Initial deck] và #strong[Final deck] như hình.
- Keystream: `4,47,10,24,8,49,44,6,18,33,24`

#figure(image("assets/1a-b6-03.png"),
  caption: [
    Bước 6 - Solitaire, Keystream, Save
  ]
)

- Kết quả: văn bản gốc được mã hóa thành `HDXFF RSTKH K`
  - `D` (3) dịch đi 4 đơn vị, thành `H` (7).
  - `I` (8) dịch đi 47 đơn vị, thành `D` (3) (đi gần 2 vòng).
  - `N` (13) dịch đi 10 đơn vị thành `X` (23).
  - Tương tự cho các ký tự khác.

#figure(image("assets/1a-b6-04.png"),
  caption: [
    Bước 6 - Solitaire, Encrypted
  ]
)

== Giải Mã
<giai-ma>

- Tại cửa sổ văn bản đã mã hóa, chọn menu #strong[Encrypt/Decrypt $arrow.r$ Symmetric (classic) $arrow.r$ Solitaire].
- Nhập lại các thông tin khớp với đã dùng trước đó:
  - #strong[1a. Number of cards]: 52
  - #strong[1b: Defining the card order]: #emph[ascending]
- Keystream sẽ được tạo ra.
- Chọn #strong[Decrypt]

#figure(image("assets/1a-b6-11.png"),
  caption: [
    Bước 6 - Solitaire, Decrypt, Key Entry
  ]
)

- Văn bản gốc được giải mã.

#figure(image("assets/1a-b6-12.png"),
  caption: [
    Bước 6 - Solitaire, Decrypted
  ]
)

== Analysis
<analysis>

- Để giải mã, cần chỉ định #strong[Parameters of the found deck].
  - Hoặc tải file deck đã lưu trước đó, hoặc chỉ định thủ công.
  - Trong trường hợp này, em sẽ tải file đã lưu trước đó với #strong[Load final deck]

#figure(image("assets/1a-b6-05.png"),
  caption: [
    Bước 6 - Solitaire, Solitaire Analysis
  ]
)

- Chọn file tương ứng là `end-deck.txt` đã lưu trước đó tương ứng với #strong[Final deck]

#figure(image("assets/1a-b6-06.png"),
  caption: [
    Bước 6 - Solitaire, Final Deck
  ]
)

- Bước 2, #strong[Positioning of the joker], là thứ tự sắp xếp, đây là phần #strong[Initial deck] trước đó.
  - Chọn #strong[Always to front].

#figure(image("assets/1a-b6-07.png"),
  caption: [
    Bước 6 - Solitaire, Always to front
  ]
)

- Bước 3, #strong[Initial deck] được tạo ra, sẵn sàng để tạo #strong[Keystream]

#figure(image("assets/1a-b6-08.png"),
  caption: [
    Bước 6 - Solitaire, Initial deck
  ]
)

- Bước 4, #strong[Generating the keystream]
  - Bấm chọn #strong[Automatically generate the keystream]
  - Key stream sẽ được tạo ra, giống với trước đó đã dùng: `4,47,10,24,8,49,44,6,18,33,24`

#figure(image("assets/1a-b6-09.png"),
  caption: [
    Bước 6 - Solitaire, Keystream
  ]
)

- Chọn #strong[Decrypt]
  - Văn bản gốc được giải mã.
  - Có chèn sai vị trí khoảng trắng thành: `DINHX UANSA M`

#figure(image("assets/1a-b6-10.png"),
  caption: [
    Bước 6 - Solitaire, Decrypted
  ]
)
