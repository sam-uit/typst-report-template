= Giới Thiệu
== Nhóm 12

#align(center)[
  #show table.cell: current_cell => {
    if current_cell.x in (0, 1, 3, 4) {
      text(
        font: "Iosevka",
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
    [01], [25410321], [*Nguyễn Điền Triết*], [06], [25410204], [Trương Xuân Hậu],
    [02], [25410320], [Nguyễn Hữu Trí], [07], [25410201], [Phạm Phước Hão],
    [03], [25410302], [Trần Thiện Thiên Tân], [08], [25410185], [Nguyễn Phong Đạt],
    [04], [25410291], [Đinh Xuân Sâm], [09], [25410183], [Nguyễn Đào Anh Đạt],
    [05], [25410267], [Trần Đức Nhân], [10], [24410057], [Trần Tuấn Kiệt],
  )
]
