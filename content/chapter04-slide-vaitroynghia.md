```{=typst}
#import "../template/libslides.typ": *
```

## Vai Trò và Ý Nghĩa

```{=typst}
#focus-slide[

#upper[Vai Trò và Ý Nghĩa]

Là Những Cộng Sự Số Nhằm Nâng Tầm Năng Lực Cá Nhân.

]
```

```{=typst}
#slide(composer: (45%, 55%))[
=== "Người Cộng Sự"

- AI *KHÔNG* thay thế con người.
    - *Nâng Tầm Năng Lực* của con người.
][

- Bác Sĩ:
    - Chẩn đoán *chính xác* hơn.
- Lập Trình Viên:
    - Phát triển phần mềm *nhanh* hơn.
- Thiết Kế:
    - Hiện thực ý tưởng *hoàn thiện* hơn.
- Quản Trị:
    - Ra quyết định *hiệu quả* hơn.
]
```

<!-- ### Từ "Ra Lệnh" sang "Cộng Tác" -->

```{=typst}
#slide(composer: (40%, 20%, 40%))[

Người *Ra Lệnh* \u{2194} Máy *Phản Hồi*:

- Mô hình truyền thống.
- "Cầm tay chỉ việc".
- Máy không hiểu ngữ cảnh.
- Thông tin đưa vào rời rạc (prompts).
//#pause
][
#align(center)[
=== Từ "Ra Lệnh" sang "Cộng Tác"
//#pause
#text(fill: orange.lighten(30%), size: 2em)[\u{22D9}]
]
][
//#pause
Người *Định Hướng* \u{2194} Máy *Cộng Tác*:

- Tin tưởng & phân quyền.
- Người: Chỉ định mục tiêu.
- AI: Hiểu ngữ cảnh.
- AI: Lên kế hoạch và thực hiện.
]
```

```{=typst}
#pagebreak()
```

### Các Mô Hình Cộng Tác Thực Tế

```{=typst}
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
```

```{=typst}
#table(
  columns: (20%, 40%, 40%),
  align: (left, left, left),
  [#text(fill: orange)[\u{002B}]], [*Centaur (Tri thức)*], [*Cobot (Sản xuất)*], [#strong[Môi Trường]], [Văn phòng; Nghiên cứu; Sáng tạo nội dung.], [Nhà máy, dây chuyền lắp ráp, logistics.], [#strong[Cộng Tác]], [Con người đưa khung sườn, AI viết chi tiết, con người tinh chỉnh.], [Robot làm việc ngay bên cạnh công nhân, hỗ trợ việc nặng nhọc/đòi hỏi
chính xác cao.], [#strong[Giá Trị]], [Tối ưu hóa *tư duy chiến lược*.], [Tối ưu hóa *sự an toàn* và *hiệu suất* vật lý.]
)
```

```{=typst}
#pagebreak()
```


### Tác Động Đến Tư Duy Quản Trị Và Đào Tạo
