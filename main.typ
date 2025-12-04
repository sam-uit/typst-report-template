// MARR: imports

#import "libs/report.typ": *

// MARK: THE TARGET for BACK TO TOP
#metadata("top") <top>

// MARK: The Template

// Define the author in a variable
#let details = (
  university: (
    name: "Trường Đại Học TP. Hồ Chí Minh",
    college: "Trường Đại Học Công Nghệ Thông Tin",
    center: "Trung Tâm Phát Triển Công Nghệ Thông Tin",
    logo: "",
  ),
  course: (
    id: "IE103",
    name: "Quản Lý Thông Tin (Data Management)",
    class: "LT.K2025.2.CNTT",
  ),
  instructor: "Ths. Nguyễn Văn A",
  author: (
    name: "Nhóm xx",
    members: (
      (
        name: lorem(3),
        id: lorem(1),
      ),
      (
        name: lorem(3),
        id: lorem(1),
      ),
    ),
  ),
  assignment: (
    title: "Bài Tập Thực Hành 1",
    subtitle: "Thiết Kế Cơ Sở Dữ Liệu",
    type: "Bài Tập Thực Hành",
    date: "Dec, 2025",
    duration: "15 phút",
  ),
)

#show: university-assignment.with(
  university: details.university,
  course: details.course,
  author: details.author,
  instructor: details.instructor,
  assignment: details.assignment,
)

// MARK: Callouts Examples
// Feel free to remove this section if not needed

#unheading[Callout Examples]

#co-note[Đây là một chú ý.]
#co-info[Đây là một thông tin.]
#co-warn[Đây là một cảnh báo.]
#co-err[Đây là một lỗi.]
#co-succ[Đây là một thông báo thành công.]

#pagebreak()

// MARK: AUTHOR INFO

#unheading[#details.author.name]
#include "author.typ"

#pagebreak()

// IMPORTANT Switch page number style and reset its counter
#set page(numbering: "1")
#counter(page).update(1)

// MARK: MAIN CONTENT

#include "quiz1.typ"
#include "quiz2.typ"
#include "quiz3.typ"
#include "quiz4.typ"

// THE END
