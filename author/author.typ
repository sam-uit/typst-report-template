#import "../template/lib.typ": *
#import "../config/metadata.typ": *

// YOUR CONTENT HERE

#unheading[#data.author.name]

Thành viên của nhóm và bảng nhiệm vụ cho #data.assignment.title.

#figure(
  align(center)[
    // Mono font in column 0, 1
    #show table.cell: current_cell => {
      // Check if row (y > 0) AND the column is (0, 1, or 3)
      if current_cell.y > 0 and current_cell.x in (0, 1) {
        // Use a monofont: Iosevka
        text(
          font: "Iosevka",
          weight: 300,
          fill: black.lighten(40%),
        )[#current_cell]
      } else {
        // Return normal formatting for other columns
        current_cell
      }
    }
    // TODO: Span full width automatically
    // TODO: import/use csv data instead of hardcoding
    #rounded-table-lined(
      columns: (10%, 20%, 30%, 40%),
      align: (right, right, left, left),
      table.header([No], [MSSV], [Họ và Tên], [Phụ Trách]),
      table.hline(),
      [1],
      [25410291],
      [Đinh Xuân Sâm],
      [- Tổng hợp & Biên tập.],
      [2],
      [25410319],
      [Đặng Hữu Toàn],
      [- Phần 2.C (@c-trigger[Mục])],
      [3],
      [25410321],
      [Nguyễn Điền Triết],
      [
        - Phần 1.\* (@phan-1[Mục].xx)
        - Phần 2.A (@a-stored-procedures-voi-tham-so-vao[Mục])
      ],
      [4],
      [25410204],
      [Trương Xuân Hậu],
      [- Phần 2.E (@e-cursor[Mục])],
      [5],
      [25410338],
      [Lê Anh Vũ],
      [],
      [6],
      [25410176],
      [Trần Sơn Bình],
      [],
      [7],
      [25410247],
      [Lê Kim Long],
      [- Phần 2.B (@b-stored-procedures-voi-tham-so-vao-va-ra[Mục])],
      [8],
      [25410337],
      [La Anh Vũ],
      [],
      [9],
      [25410209],
      [Lê Ngọc Hiệp],
      [- Phần 2.D (@d-function[Mục])],
      [10],
      [25410271],
      [Nguyễn Thị Ngọc Nhung],
      [],
    )],
  kind: table,
  caption: [#data.author.name],
  outlined: true, // Hides it from the List of Tables
  numbering: none, // Hides the "Table X:" prefix (optional)
)
