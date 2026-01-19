#import "presentation.typ": *

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
