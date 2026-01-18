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

// MARK: GROUP MM
#include "content/chapter00-slide-mm.typ"
#include "content/chapter01-slide.typ"
#include "content/chapter01-slide-ailagi-mm.typ"
#include "content/chapter02-slide.typ"
#include "content/chapter02-slide-smarthome-mm.typ"
#include "content/chapter02-slide-giaitri-mm.typ"
#include "content/chapter02-slide-giaoduc-mm.typ"
#include "content/chapter02-slide-thuongmai-mm.typ"
#include "content/chapter02-slide-giaothong-mm.typ"
#include "content/chapter03-slide.typ"
#include "content/chapter03-slide-smartoffice-mm.typ"
#include "content/chapter03-slide-devops-mm.typ"
#include "content/chapter03-slide-tuyendung-mm.typ"
#include "content/chapter04-slide.typ"
#include "content/chapter04-slide-vaitroynghia-mm.typ"
#include "content/chapter04-slide-loiichdinhluong-mm.typ"
#include "content/chapter04-slide-loiichdinhtinh-mm.typ"
#include "content/chapter05-slide.typ"
#include "content/chapter05-slide-vandeluuy-mm.typ"
#include "content/chapter05-slide-dinhhuongtuonglai-mm.typ"
#include "content/chapter06-slide.typ"
#include "content/chapter06-slide-ailathuctien-mm.typ"
#include "content/chapter06-slide-loiket-mm.typ"

// MARK: - Kết Thúc

// = Q&A

// #focus-slide[
//   Xin Cảm Ơn!
// ]

#ending-slide(title: [Xin Cảm Ơn!])[\u{22B7}]

// #ending-slide(title: [Xin Cảm Ơn!])[Questions?]
