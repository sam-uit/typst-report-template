// MARR: imports

#import "template/lib.typ": *
#import "config/metadata.typ": *

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

// #include "template/callout-examples.typ"

// #pagebreak()

// MARK: AUTHOR INFO
#include "author/author.typ"

#pagebreak()

#include "content/info.typ"
#pagebreak()

// IMPORTANT Switch page number style and reset its counter
#set page(numbering: "1")
#counter(page).update(1)

// MARK: MAIN CONTENT

#include "content/bai-01.typ"
#include "content/bai-01-a.typ"
#include "content/bai-01-b.typ"
#pagebreak()
#include "content/bai-02.typ"
#include "content/bai-02-a.typ"
#include "content/bai-02-b.typ"
#include "content/bai-02-c.typ"

// THE END
