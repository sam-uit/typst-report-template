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
#outline-slide()

// MARK: - Nội Dung Chính
#include "content/chapter00.typ"
#include "content/chapter01.typ"
#include "content/chapter02.typ"
#include "content/chapter03.typ"
#include "content/chapter04.typ"
#include "content/chapter05.typ"
#include "content/chapter06.typ"

// MARK: - Kết Thúc

// = Q&A

#focus-slide[
  Xin Cảm Ơn!
]

// #ending-slide(title: [Xin Cảm Ơn!])[Questions?]
