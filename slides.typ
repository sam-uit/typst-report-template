#import "template/libslides.typ": *
#import "config/metadata.typ": *
#import "@preview/numbly:0.1.0": numbly

#show: presentation.with(
  title: data.assignment.title,
  subtitle: data.assignment.subtitle,
  author: data.author.name,
  date: data.assignment.date,
  institution: data.course.name,
)

// MARK: - Title Slide
#title-slide()

// Unordered List of Content
// #outline-slide()

// MARK: - Nội Dung Chính
#include "content/chapter00-slide.typ"
#include "content/chapter01-slide.typ"
#include "content/chapter01-slide-ailagi.typ"
#include "content/chapter02-slide.typ"
// #include "content/chapter02-slide-smarthome.typ"
#include "content/chapter02-slide-smarthome-mm.typ"
// #include "content/chapter02-slide-giaitri.typ"
#include "content/chapter02-slide-giaitri-mm.typ"
// #include "content/chapter02-slide-giaoduc.typ"
#include "content/chapter02-slide-giaoduc-mm.typ"
// #include "content/chapter02-slide-thuongmai.typ"
#include "content/chapter02-slide-thuongmai-mm.typ"
// #include "content/chapter02-slide-giaothong.typ"
#include "content/chapter02-slide-giaothong-mm.typ"
#include "content/chapter03-slide.typ"
// #include "content/chapter03-slide-smartoffice.typ"
#include "content/chapter03-slide-smartoffice-mm.typ"
// #include "content/chapter03-slide-devops.typ"
#include "content/chapter03-slide-devops-mm.typ"
#include "content/chapter03-slide-healthcare.typ"
#include "content/chapter03-slide-marketing.typ"
#include "content/chapter03-slide-sanxuat.typ"
#include "content/chapter03-slide-tuyendung.typ"
#include "content/chapter04-slide.typ"
#include "content/chapter04-slide-vaitroynghia.typ"
#include "content/chapter04-slide-loiichdinhluong.typ"
#include "content/chapter04-slide-loiichdinhtinh.typ"
#include "content/chapter05-slide.typ"
#include "content/chapter05-slide-vandeluuy.typ"
#include "content/chapter05-slide-dinhhuongtuonglai.typ"
#include "content/chapter06-slide.typ"
#include "content/chapter06-slide-ailathuctien.typ"
// #include "content/chapter06-slide-aitrongdoisong.typ"
// #include "content/chapter06-slide-aitrongcongviec.typ"
// #include "content/chapter06-slide-danhgiachung.typ"
#include "content/chapter06-slide-loiket.typ"

// MARK: - Kết Thúc

// = Q&A

// #focus-slide[
//   Xin Cảm Ơn!
// ]

#ending-slide(title: [Xin Cảm Ơn!])[\u{22B7}]

// #ending-slide(title: [Xin Cảm Ơn!])[Questions?]
