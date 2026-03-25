// MARK: Report Details
// Define the author and report details here
#let data = (
  university: (
    name: "Đại Học Quốc Gia Thành Phố Hồ Chí Minh",
    college: "Trường Đại Học Công Nghệ Thông Tin",
    center: "Trung Tâm Phát Triển Công Nghệ Thông Tin",
    faculty: "Khoa Khoa Học Và Kỹ Thuật Thông Tin",
    logo: "uit.jpeg",
  ),
  course: (
    id: upper(lorem(1)),
    name: lorem(6),
    class: upper(lorem(2)),
  ),
  instructor: lorem(4),
  author: (
    name: lorem(3),
    id: lorem(1),
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
    title: upper(lorem(5)),
    subtitle: upper(lorem(6)),
    type: upper(lorem(2)),
    date: lorem(6),
    duration: "15 phút",
  ),
  company: "A Limited Company Name",
)
