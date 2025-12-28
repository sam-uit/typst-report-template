#import "../template/lib.typ": *

= Bài 2. Chủ Đề Thứ Hai
<bai-2-chu-de-thu-hai>


== Bài 2 Mục 1 - Chứa Hình Ảnh
<bai-2-muc-1-chua-hinh-anh>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri.

#figure(image("assets/macos-fhs-root-system.png"),
  caption: [
    Bài 2. Cây thư mục trong CLI của macOS.
  ]
)

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat.

== Bài 2 Mục 2 - Chứa Bảng
<bai-2-muc-2-chua-bang>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat.

#figure(
  align(center)[#table(
    columns: 4,
    align: (left, left, left, left),
    table.header([*Thuộc tính*], [*Ổ đĩa (Volume/Drive)*], [*Thư mục (Folder)*], [*Tập tin (File)*]),
    table.hline(),
    [Tên (Name)], [Tên phân vùng (VD: Macintosh HD).], [Tên thư mục.], [Tên file + Đuôi mở rộng (Extension).],
    [Loại (Kind)], [Định dạng (APFS, NTFS…).], [Folder.], [Định dạng (PDF, JPG, Docx…).],
    [Kích thước (Size)], [Dung lượng tổng / Khả dụng.], [Tổng kích thước nội dung.], [Kích thước thực của file.],
    [Ngày tháng], [Ngày tạo phân vùng.], [Ngày tạo, ngày sửa đổi nội dung.], [Ngày tạo, sửa đổi, mở gần nhất.],
    [Quyền (Permissions)],
    [Quản trị hệ thống (System R/W).],
    [Read/Write/Execute (truy cập).],
    [Read/Write/Execute (thao tác).],
    [Khác], [Mount point, thông tin phần cứng.], [Số lượng mục con (items count).], [App mặc định (Open with).],
  )],
  kind: table,
  caption: [@bai-2-chu-de-thu-hai[Bài]. Thuộc tính của Ổ đĩa, Thư mục, và File.],
)
