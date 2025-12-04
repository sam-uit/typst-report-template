// MARR: imports

#import "libs/report.typ": *
#import "data.typ": *

// MARK: Document Settings
#set document(
  title: data.assignment.title,
  author: data.author.name,
  description: data.assignment.subtitle,
  keywords: (data.course.id, data.course.name),
  date: datetime.today(),
)

// MARK: THE TARGET for BACK TO TOP
#metadata("top") <top>

// MARK: The Template Details Page
#show: university-assignment.with(
  university: data.university,
  course: data.course,
  author: data.author,
  instructor: data.instructor,
  assignment: data.assignment,
)

// MARK: Callouts Examples
// Feel free to remove this section if not needed

#unheading[Callout Examples]

Cách dùng:

```typst
// Callout Examples
#co-note(title: "Kết Luận")[Đây là một chú ý với tiêu đề "Kết Luận".]
#co-note[Đây là một chú ý.]
#co-info[Đây là một thông tin.]
#co-warn[Đây là một cảnh báo.]
#co-erro[Đây là một lỗi.]
#co-succ[Đây là một thông báo thành công.]
```

Kết quả:

#co-note(title: "Kết Luận")[Đây là một chú ý với tiêu đề "Kết Luận".]
#co-note[Đây là một chú ý.]
#co-info[Đây là một thông tin.]
#co-warn[Đây là một cảnh báo.]
#co-erro[Đây là một lỗi.]
#co-succ[Đây là một thông báo thành công.]

#pagebreak()

// MARK: AUTHOR INFO
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
