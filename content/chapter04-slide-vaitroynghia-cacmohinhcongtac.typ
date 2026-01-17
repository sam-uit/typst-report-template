#import "../template/libslides.typ": *

// MARK: Formatting - Tables
// Bảng có đường viền và màu nền
// Tắt căn bằng lề cho văn bản trong bảng
//#show table: set par(justify: false)
#set table(
  // Đường viền cho bảng
  stroke: 0.5pt + blue.lighten(90%),
  // Màu nền cho hàng đầu tiên (header) và hàng chẵn (nhạt hơn)
  fill: (x, y) => if y == 0 { purple.lighten(90%) } else if calc.even(y) { orange.lighten(98%) } else { none },
)

// Bảng có góc bo tròn
#show table: it => block(
  radius: 8pt,
  stroke: 1pt + orange.lighten(90%),
  clip: true,
  width: 100%,
  it,
)

#table(
  columns: (20%, 40%, 40%),
  align: (left, left, left),
  [#text(fill: orange)[\u{002B}]], [*Centaur (Tri thức)*], [*Cobot (Sản xuất)*],
  [#strong[Môi Trường]], [Văn phòng; Nghiên cứu; Sáng tạo nội dung.], [Nhà máy, dây chuyền lắp ráp, logistics.],
  [#strong[Cộng Tác]],
  [Con người đưa khung sườn, AI viết chi tiết, con người tinh chỉnh.],
  [Robot làm việc ngay bên cạnh công nhân, hỗ trợ việc nặng nhọc/đòi hỏi
    chính xác cao.],

  [#strong[Giá Trị]], [Tối ưu hóa *tư duy chiến lược*.], [Tối ưu hóa *sự an toàn* và *hiệu suất* vật lý.],
)
