#import "@preview/touying:0.6.1": *
#import "@preview/fontawesome:0.6.0": *

// --- 1. DESIGN SYSTEM & COLORS ---
// Định nghĩa các biến màu sắc cốt lõi theo phong cách Gemini
#let c-bg-dark = rgb("#050505")
#let c-bg-purple = rgb("#130f25")
#let c-text-white = rgb("#ffffff")
#let c-text-gray = rgb("#e2e8f0")
#let c-accent-blue = rgb("#4F8AFF")
#let c-accent-purple = rgb("#9B8DFF")
#let c-accent-pink = rgb("#D96570")

// Gradient đặc trưng
#let gemini-gradient = gradient.linear(c-accent-blue, c-accent-purple, c-accent-pink, angle: 90deg)
#let bg-gradient = gradient.linear(c-bg-dark, c-bg-purple, angle: 135deg)

// --- 2. COMPONENTS (CÁC KHỐI DỰNG) ---

// Hàm tạo hiệu ứng chữ Gradient
#let gradient-text(body) = {
  set text(fill: gemini-gradient)
  body
}

// Hàm tạo Badge (Nhãn nhỏ)
#let badge(body) = {
  box(
    fill: c-accent-blue.transparentize(85%),
    stroke: 1pt + c-accent-blue.transparentize(70%),
    radius: 50pt,
    inset: (x: 1em, y: 0.5em),
    text(fill: c-accent-blue, size: 0.7em, weight: "bold", upper(body)),
  )
}

// Hàm tạo Card (Hiệu ứng kính mờ)
// - icon: icon hiển thị (tùy chọn)
// - color: màu nhấn cho icon/viền (tùy chọn)
#let card(title: none, icon: none, color: c-accent-blue, body) = {
  block(
    width: 100%,
    height: 100%,
    fill: rgb(255, 255, 255, 5), // 5% opacity
    stroke: 0.5pt + rgb(255, 255, 255, 20), // 10% opacity border
    radius: 16pt,
    inset: 1.5em,
    breakable: false,
    {
      // Icon, top + centered
      if icon != none {
        align(center)[
          #text(fill: color, size: 1.2em, icon)
        ]
        // place(top + center, block(
        //   fill: rgb(255, 255, 255, 10),
        //   radius: 8pt,
        //   inset: 8pt,
        //   text(fill: color, size: 1.2em, icon),
        // ))
      }
      // Title
      if title != none {
        text(weight: "bold", size: 1.2em, fill: white, title)
        v(0.5em)
      }
      // Body text
      set text(fill: c-text-gray, size: 0.9em, weight: "light")
      body
    },
  )
}

// Hàm chia cột nhanh (Grid wrapper)
// Dùng để tạo layout 2 cột, 3 cột
#let cols(..args) = {
  grid(
    columns: args.pos().len(),
    gutter: 1em,
    ..args.pos()
  )
}

// Hàm chèn ảnh có bo góc và viền (Glass border)
#let img-glass(path) = {
  block(
    stroke: 1pt + rgb(255, 255, 255, 20),
    radius: 16pt,
    clip: true,
    width: 100%,
    height: 100%, // Fill container
    image(path, width: 100%, height: 100%, fit: "cover"),
  )
}

// --- 4. SLIDE FUNCTIONS (CUSTOMIZED) ---

// MARK: TITLE SLIDE
// Slide tiêu đề (Recreated from HTML Slide 1)
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  touying-slide(self: self, {
    set align(horizon + left)

    // Badge
    badge("Báo Cáo Đồ Án Cuối Môn")
    v(0.6em)

    // Title lớn
    text(size: 2em, weight: "bold", info.title)
    linebreak()
    gradient-text(text(size: 2em, weight: "bold", info.subtitle))

    v(0.6em)
    // Description
    text(
      size: 1.2em,
      fill: c-text-gray,
      "Khám phá cách Trí tuệ nhân tạo đang tái định hình thế giới của chúng ta.",
    )

    // v(3em)
    // Footer Info
    line(length: 100%, stroke: 0.75pt + rgb(255, 255, 255, 20))
    v(0.6em)
    grid(
      columns: (auto, auto),
      gutter: 4em,
      [
        #text(size: 0.7em, fill: c-text-gray, upper("Nhóm Thực Hiện")) \
        #text(weight: "medium", info.author)
      ],
      [
        #text(size: 0.7em, fill: c-text-gray, upper("Thời Gian")) \
        #text(weight: "medium", info.date)
      ],
    )
  })
})

// MARK: CONTENT SLIDE
// Slide nội dung chuẩn
#let slide(title: auto, ..bodies) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.header-left = text(size: 1.5em, weight: "bold", fill: white, title)
  }
  touying-slide(self: self, ..bodies)
})

// Slide Mục lục
#let outline-slide() = touying-slide-wrapper(self => {
  self.store.header-left = text(size: 1.5em, weight: "bold", fill: white, "Mục Lục")
  touying-slide(self: self, {
    set align(horizon)
    set text(size: 1.2em)
    components.custom-progressive-outline(
      level: 1,
      alpha: 100%,
      indent: (1em, 2em),
      vspace: 1em,
      numbered: (true,),
      depth: 1,
      fill: c-text-white,
    )
  })
})

// Slide chuyển đoạn (New Section)
#let new-section-slide(title: auto, ..args) = touying-slide-wrapper(self => {
  let title = if title == auto {
    if args.pos().len() > 0 { args.pos().first() } else { "" }
  } else {
    title
  }
  touying-slide(self: self, {
    set align(center + horizon)
    badge("Phần Tiếp Theo")
    v(1em)
    gradient-text(text(size: 3em, weight: "bold", title))
  })
})


// --- 3. TOUYING THEME SETUP ---

#let stargazer-theme(
  aspect-ratio: "16-9",
  ..args,
  body,
) = {
  // Cấu hình Header (Minimalist)
  let header(self) = {
    set align(top)
    pad(x: 2em, y: 1em, grid(
      columns: (1fr, auto),
      align: (left, right),
      // Breadcrumbs hoặc Navigation nhỏ
      utils.call-or-display(self, self.store.header-left),
      // Logo hoặc tên
      text(fill: c-text-gray.transparentize(50%), size: 0.8em, self.info.title),
    ))
  }

  // Cấu hình Footer (Minimalist)
  let footer(self) = {
    set align(bottom)
    pad(x: 2em, y: 1em, grid(
      columns: (1fr, auto),
      text(fill: c-text-gray.transparentize(50%), size: 0.6em, self.info.institution),
      text(fill: c-text-gray.transparentize(50%), size: 0.6em, context utils.slide-counter.display()
        + " / "
        + utils.last-slide-number),
    ))
  }

  // Cấu hình Background (Gradient + Blobs giả lập)
  let background-layer = {
    rect(width: 100%, height: 100%, fill: bg-gradient)
    // Giả lập blob ánh sáng
    place(top + left, dx: -20%, dy: -40%, circle(radius: 20pt, fill: gradient.radial(
      c-accent-blue.transparentize(85%),
      rgb(0, 0, 0, 100%),
    )))
    place(bottom + right, dx: 10%, dy: 30%, circle(radius: 30pt, fill: gradient.radial(
      c-accent-pink.transparentize(90%),
      rgb(0, 0, 0, 100%),
    )))
  }

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 3em, bottom: 2em, x: 3em),
      fill: c-bg-dark,
      background: background-layer,
      header: header,
      footer: footer,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-colors(
      primary: c-text-white,
      neutral-lightest: c-text-white,
      neutral-darkest: c-bg-dark,
    ),
    config-store(
      header-left: none,
    ),
    // Typography mặc định
    config-methods(
      init: (self: none, body) => {
        // Cố gắng dùng font Humanist, fallback về sans-serif mặc định
        set text(
          font: "Google Sans",
          fill: c-text-white,
          size: 20pt,
          weight: "light",
        )
        set par(justify: true, leading: 0.8em)
        show heading: set text(weight: "bold")
        show strong: set text(weight: "bold", fill: c-accent-blue) // Bold text màu xanh

        body
      },
    ),
    ..args,
  )

  body
}




// --- 5. USAGE EXAMPLE (NỘI DUNG THỰC TẾ) ---

#show: stargazer-theme.with(
  config-info(
    title: [AI TRONG],
    subtitle: [ĐỜI SỐNG VÀ CÔNG VIỆC],
    author: [Nhóm 01 - LT.2025.2-CNTT],
    date: [Tháng 01 Năm 2026],
    institution: [Trường ĐH Công Nghệ Thông Tin],
  ),
)

// 1. Trang Bìa
#title-slide()

// 2. Mục Lục
#outline-slide()

// 3. Tổng Quan (Grid 3 Cột Cards)
= Tổng Quan Về AI

#slide(title: "Tổng Quan Về AI")[
  #cols(
    card(title: "AI Là Gì?", icon: fa-brain(), color: c-text-white)[
      Lĩnh vực Khoa Học Máy Tính tập trung xây dựng Mô Hình Trí Tuệ cho máy móc, mô phỏng khả năng của con người.
    ],
    card(title: "Tại Sao Lúc Này?", icon: fa-bolt(), color: c-accent-pink)[
      Sự hội tụ của 3 yếu tố:
      - Sự bùng nổ *Big Data*
      - Hạ tầng (GPU, TPU)
      - Thuật toán tối ưu mới
    ],
    card(title: "Mục Tiêu", icon: fa-bullseye(), color: c-accent-purple)[
      Xây dựng các hệ thống có khả năng tự nhận thức, ra quyết định và thực hiện các tác vụ thông minh.
    ],
  )
]

// 4. AI Trong Đời Sống (Layout 2 cột: Ảnh + Cards nhỏ)
= AI Trong Đời Sống

#slide(title: "AI Trong Đời Sống: Nhà Thông Minh")[
  #cols(
    // Cột 1: Ảnh (Placeholder màu vì không load được ảnh thật trong preview)
    img-glass("images/smart-home.jpg"), // Thay đường dẫn ảnh của bạn vào đây

    // Cột 2: Các Cards xếp chồng (Stack)
    grid(
      rows: (1fr, 1fr, 1fr),
      gutter: 1em,
      card(title: "Tự Động & Tối Ưu", icon: fa-sliders-h(), color: c-accent-blue)[
        Hệ thống tự học thói quen người dùng để điều chỉnh ánh sáng, nhiệt độ.
      ],
      card(title: "An Ninh & An Toàn", icon: fa-shield-alt(), color: c-accent-pink)[
        Nhận diện khuôn mặt, cảm biến phát hiện té ngã, đột quỵ.
      ],
      card(title: "Ví Dụ Thực Tế", icon: fa-microchip(), color: c-accent-purple)[
        *Việt Nam:* FPT Smart Home, Lumi, Rạng Đông.
      ],
    ),
  )
]

// 5. Thay đổi Background (Ví dụ Slide nhấn mạnh)
#slide(
  config: config-page(fill: c-bg-dark), // Override background thành màu đen đặc
  title: "Giải Trí & Giáo Dục 4.0",
)[
  #cols(
    card(title: "Giải Trí Kỹ Thuật Số", color: c-accent-pink)[
      #text(size: 1.5em, weight: "bold", fill: c-accent-pink, "Netflix / TikTok") \
      Thuật toán đề xuất nội dung theo thời gian thực. "Dynamic Thumbnail" thay đổi ảnh bìa dựa trên sở thích.
    ],
    card(title: "Giáo Dục Cá Nhân Hóa", color: c-accent-blue)[
      #text(size: 1.5em, weight: "bold", fill: c-accent-blue, "Duolingo / Elsa") \
      Phân tích phát âm chi tiết, chỉ ra lỗi sai cụ thể. Mô hình "Cây kiến thức".
    ],
  )
]

// 6. Section Break
#new-section-slide(title: "AI Trong Công Việc")

// 7. Agentic Workflow (Sơ đồ bằng Grid)
#slide(title: "Lập Trình: Agentic Workflows")[
  #align(center)[
    #badge("Sự Chuyển Dịch: Prompt -> Agent")
  ]
  #v(1em)

  #cols(
    card(title: "Con Người", icon: fa-user(), color: c-text-gray)[
      Định hướng mục tiêu \
      Review kết quả
    ],
    align(horizon + center, text(size: 2em, fill: c-accent-blue, fa-arrow-right())),
    card(title: "AI Agents", icon: fa-robot(), color: c-accent-blue)[
      Lên kế hoạch \
      Viết Code -> Debug \
      Kiểm thử (Test)
    ],
  )

  #v(2em)
  #align(center)[*Công cụ tiêu biểu:* GitHub Copilot Workspace, Google Antigravity]
]

// 8. Kết Luận (Trích dẫn)
#slide(config: config-page(fill: gemini-gradient))[ // Background Gradient full
  #align(center + horizon)[
    #text(size: 3em, fill: white, fa-quote-left())
    #v(1em)
    #text(size: 1.5em, weight: "bold", fill: white)[
      "AI là tấm gương phản chiếu xã hội. \
      Khi NHẬN những điều đẹp đẽ, \
      AI sẽ TẠO ra những điều đẹp đẽ."
    ]
    #v(2em)
    #text(size: 1em, fill: white.transparentize(20%), "Hợp tác với AI là kỹ năng sinh tồn của thời đại mới.")
  ]
]
