#import "../template/libslides.typ": *
#import "../config/metadata.typ": *

= Giới Thiệu

== Lời Cảm Ơn

#slide(composer: (70%, 30%))[
=== Nhà Trường

- Đại Học Quốc Gia Thành Phố Hồ Chí Minh.
- Trường Đại Học Công Nghệ Thông Tin.
- Trung Tâm Phát Triển Công Nghệ Thông Tin.

=== Giảng Viên

- Thạc Sĩ Nguyễn Thì Thùy Trâm.
- IE005 - *Giới Thiệu Nghành Công Nghệ Thông Tin*.

][
#align(center)[
  #image("../static/Logo_UIT_updated.jpg", height: 40%)
  // #block(width: 100%, stroke: (0.5pt + orange))
  // #text(size: 2em, fill: orange)[#sym.star.op]
]

// #v(1em)

=== Thành Viên Nhóm

- Nhóm 01.
]

#pagebreak()

== Nhóm 01

#align(center)[
  #show table.cell: current_cell => {
    if current_cell.x in (0, 1, 3, 4) {
      text(
        font: code-font,
        weight: "light",
        size: 0.9em,
        fill: gray,
      )[#current_cell]
    } else {
      current_cell
    }
  }
  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    inset: 0.5em,
    align: (right, right, left, right, right, left),
    stroke: (
      bottom: 0.5pt + gradient.linear(red, blue, green),
      top: none,
      left: none,
      right: none,
    ),
    [01], [25410291], [_Đinh Xuân Sâm_], [09], [25410325], [Nguyễn Văn Trung],
    [02], [25410240], [_Nguyễn Tạ Quí Lan_],  [10], [25410213], [Phan Chí Hiếu],
    [03], [25410220], [Vũ Huy Hoàng], [11], [25410239], [Phạm Tuấn Kiệt],
    [04], [25410179], [Giang Hải Chương], [12], [25410244], [Nguyễn Thành Lộc],
    [05], [25410171], [Lê Thị Tú Anh], [13], [25410204], [Trương Xuân Hậu],
    [06], [25410338], [Lê Anh Vũ], [14], [25410319], [Đặng Hữu Toàn],
    [07], [25410183], [Nguyễn Đào Anh Đạt], [15], [25410321], [Nguyễn Điền Triết],
    [08], [25410193], [Nguyễn Minh Duy]
  )
]
