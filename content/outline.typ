#import "../template/lib.typ": *

= GIỚI THIỆU
<gioi-thieu>


== Lời Cảm Ơn
<loi-cam-on>


=== Giảng Viên
<giang-vien>

#table(
columns: (100%),
inset: (top: 0.6em, bottom: 0.6em),
align: (left),
stroke: (
    bottom: 0.5pt + gradient.linear(red, blue, green),
    top: none,
    left: none,
    right: none,
),
[- Thạc Sĩ Nguyễn Thành Luân.],
[- IE103 -- Quản Lý Thông Tin.]
)

=== Nhà Trường
<nha-truong>

#table(
columns: (100%),
inset: (top: 0.6em, bottom: 0.6em),
align: (left),
stroke: (
    bottom: 0.5pt + gradient.linear(red, blue, green),
    top: none,
    left: none,
    right: none,
),
[- Trung Tâm Phát Triển Công Nghệ Thông Tin.],
[- Trường Đại Học Công Nghệ Thông Tin.]
)

=== Nhóm 02
<nhom-02>

#table(
columns: (100%),
inset: (top: 0.6em, bottom: 0.6em),
align: (left),
stroke: (
    bottom: 0.5pt + gradient.linear(red, blue, green),
    top: none,
    left: none,
    right: none,
),
[- Các thành viên của Nhóm 02.],
)

== Nhóm 02
<nhom-02>

#align(center)[
  #show table.cell: current_cell => {
    if current_cell.x in (0, 1, 3, 4) {
      text(
        //font: code-font,
        weight: "light",
        //size: 0.9em,
        fill: gray,
      )[#current_cell]
    } else {
      current_cell
    }
  }
  #table(
    columns: (5%, 15%, 25%, 5%, 15%, 35%),
    inset: (top: 1.2em, bottom: 1.2em),
    align: (right + bottom, right + bottom, left + bottom, right + bottom, right + bottom, left + bottom),
    stroke: (
      bottom: 0.5pt + gradient.linear(red, blue, green),
      top: none,
      left: none,
      right: none,
    ),
      [1], [12345678], [Nguyễn Văn A],
      [2], [12345678], [Trương Thị B],
      [3], [12345678], [#lorem(3)],
      [4], [12345678], [#lorem(3)],
      [5], [12345678], [#lorem(3)],
      [6], [12345678], [#lorem(3)],
      [7], [12345678], [#lorem(3)],
      [8], [12345678], [#lorem(3)],
      [9], [12345678], [#lorem(3)],
      [10], [12345678], [#lorem(4)],
  )
]

== Giới Thiệu Đề Tài
<gioi-thieu-de-tai>

#align(center)[
    #table(
        columns: (100%),
        inset: (top: 0.6em, bottom: 0.6em),
        align: (left),
        stroke: (
            bottom: 0.5pt + gradient.linear(red, blue, green),
            top: none,
            left: none,
            right: none,
        ),
        [Các Doanh Nghiệp vừa và nhỏ trong ngành Khách Sạn, Du Lịch:]
    )
]
#table(
columns: (45%, 55%),
inset: (top: 0.6em, bottom: 0.6em),
align: (left, left),
stroke: (
    bottom: 0.5pt + gradient.linear(red, blue, green),
    top: none,
    left: none,
    right: none,
),
[- Quản lý *thủ công*.],
[- *Khó khăn* trong thống kê/báo cáo.],
[- Số hóa *hạn chế*.],
[- Không có *điểm chạm* với khách hàng.]
)
#align(center)[
    #table(
        columns: (100%),
        inset: (top: 0.6em, bottom: 0.6em),
        align: (left),
        stroke: (
            bottom: 0.5pt + gradient.linear(red, blue, green),
            top: none,
            left: none,
            right: none,
        ),
        [Hệ Thống Quản Lý Đặt Phòng #emph[(Booking Management System)]:]
    )
]
#table(
columns: (45%, 55%),
inset: (top: 0.6em, bottom: 0.6em),
align: (left, left),
stroke: (
    bottom: 0.5pt + gradient.linear(red, blue, green),
    top: none,
    left: none,
    right: none,
),
[- *Số hóa* quy trình quản lý.],
[- *Chuyển đổi số* cách làm dịch vụ.],
[- Xây dựng *điểm chạm* số.],
[- Tìm kiếm, sử dụng, đánh giá.]
)

= PHÂN TÍCH VÀ THIẾT KẾ
<phan-tich-va-thiet-ke>


== Chức Năng Nghiệp Vụ
<chuc-nang-nghiep-vu>

#table(
  columns: (10%, 90%),
    inset: (top: 0.4em, bottom: 0.4em),
    align: (right, left),
    stroke: (
        bottom: 0.5pt + gradient.linear(red, blue, green),
        top: none,
        left: none,
        right: none,
    ),
    [], [- Quản lý phòng và loại phòng (BMS).],
    [], [- Quản lý khách hàng (BMS).],
    [], [- Quản lý đặt phòng (BMS).],
    [], [- Kiểm tra phòng trống (BMS & Khách Hàng).],
    [], [- Đặt phòng và hủy đặt phòng (Khách Hàng).],
    [], [- Hoàn tiền và hủy giao dịch theo chính sách.],
    [], [- Quản lý và phân quyền người dùng (Admin / Staff / End User).],
    [], [- Hiển thị trạng thái đặt phòng và thanh toán (Khách Hàng).],
    [], [- Hệ thống khuyến mãi & mã giảm giá (Vouchers).],
    [], [- Quản lý dịch vụ đi kèm như ăn sáng, giặt ủi, đưa đón sân bay.],
    [], [- Hệ thống đánh giá & phản hồi sau khi hoàn tất thanh toán.],
)

== Các Thực Thể và Mối Quan Hệ
<cac-thuc-the-va-moi-quan-he>

#image("diagrams/entity-relationship.svg")

== Mô Hình Quan Niệm - ERD (Tối Giản)
<mo-hinh-er-quan-niem>

#align(center)[
    #image("diagrams/ch02-concept-erd-simplify.svg", height: 110%)
]

== Mô Hình Logic - Bảng và Khóa
<mo-hinh-logic-bang-va-khoa>

#show table.cell: set text(size: 0.9em, weight: "light", font: body-font)
#table(
  columns: (5%, 95%),
    inset: (top: 0.5em, bottom: 0.5em),
    align: (right + bottom, left + bottom),
    stroke: (
        bottom: 0.5pt + gradient.linear(red, blue, green),
        top: none,
        left: none,
        right: none,
    ),
    [1], [*ADMINS*(#underline[id], email, password_hash, full_name, status, created_at, updated_at)],
    [2], [*DATPHONG*(#underline[id], #emph[user_id], #emph[voucher_id], check_in, check_out, trang_thai, created_at)],
    [3], [*DICHVU*(#underline[id], ten_dich_vu, don_gia, don_vi_tinh, trang_thai, created_at, updated_at)],
    [4], [*LOAIPHONG*(#underline[id], ten_loai, gia_co_ban, mo_ta, suc_chua)],
    [5], [*PAYMENTS*(#underline[id], #emph[booking_id], #emph[user_id], so_tien, phuong_thuc, trang_thai, created_at)],
    [6], [*PERMISSIONS*(#underline[id], code, description)],
    [7], [*PHONG*(#underline[id], so_phong, #emph[loai_phong_id], trang_thai)],
    [8], [*REFUNDS*(#underline[id], #emph[payment_id], #emph[requested_by], #emph[approved_by], so_tien_hoan, ly_do, trang_thai, created_at, updated_at)],
    [9], [*REVIEWS*(#underline[id], #emph[user_id], #emph[phong_id], #emph[datphong_id], so_sao, binh_luan, ngay_danh_gia, trang_thai, created_at, updated_at)],
    [10], [*ROLES*(#underline[id], code, name, description)],
    [11], [*USERS*(#underline[id], email, phone, password_hash, full_name, status, created_at, updated_at)],
    [12], [*VOUCHERS*(#underline[id], ma_code, phan_tram_giam, ngay_het_han, so_tien_toi_thieu, so_lan_toi_da, so_lan_da_dung, trang_thai, created_at, updated_at)],
    [13], [*ADMIN_ROLES*(#underline[admin_id], #underline[role_id])],
    [14], [*ROLE_PERMISSIONS*(#underline[role_id], #underline[permission_id])],
    [15], [*CT_DATPHONG*(#underline[id], #emph[datphong_id], #emph[phong_id], don_gia)],
    [16], [*CT_SUDUNG_DV*(#underline[id], #emph[datphong_id], #emph[dichvu_id], so_luong, don_gia, thoi_diem_su_dung, ghi_chu, created_at)]
)

= CÀI ĐẶT VÀ TRIỂN KHAI
<cai-dat-va-trien-khai>


== Mô Hình Vật Lý
<mo-hinh-vat-ly>

#show table.cell: set text(size: 1em, weight: "light", font: body-font)
#table(
columns: (100%),
inset: (bottom: 0.6em),
align: (left),
stroke: (
    bottom: 0.5pt + gradient.linear(red, blue, green),
    top: none,
    left: none,
    right: none,
),
[- Hiện thực hóa mô hình logic.],
[- Sẵn sàng triển khai trên Hệ Quản Trị CSDL cụ thể.]
)
#align(center)[
    #table(
        columns: (100%),
        inset: (bottom: 0.6em),
        align: (center),
        stroke: (
            bottom: 0.5pt + gradient.linear(red, blue, green),
            top: none,
            left: none,
            right: none,
        ),
        [Ví dụ về *Mô Hình Vật Lý* của một bảng trong CSDL: ADMINS]
    )
]

#align(center + bottom)[
#show table.cell: set text(size: 0.8em, weight: "light", font: body-font)
#table(
    columns: (20%, 20%, 30%, 30%),
    align: (left, left, left, left),
    stroke: (
        bottom: 0.5pt + gradient.linear(red, blue, green),
        top: none,
        left: none,
        right: none,
    ),
    [#strong[Thuộc Tính]], [#strong[Kiểu]], [#strong[Ràng Buộc]], [#strong[Mô Tả]], [`id`], [`INT`], [`PK`, `IDENTITY`], [Khóa chính tự tăng.], [`email`], [`NVARCHAR(255)`], [`NOT NULL`, `UNIQUE`], [Email đăng nhập.], [`password_hash`], [`NVARCHAR(255)`], [`NOT NULL`], [Mật khẩu (Hash).], [`full_name`], [`NVARCHAR(255)`], [`NULL`], [Họ tên đầy đủ.], [`status`], [`NVARCHAR(50)`], [`DEFAULT 'ACTIVE'`], [Trạng thái tài khoản.], [`created_at`], [`DATETIME`], [`DEFAULT GETDATE()`], [Ngày tạo.], [`updated_at`], [`DATETIME`], [`DEFAULT GETDATE()`], [Ngày cập nhật.], [#emph[CONSTRAINT]], [], [`status IN ('ACTIVE', 'INACTIVE')`], [Chỉ nhận giá trị quy định.]
  )
]

== Triển Khai
<trien-khai>

#align(center)[
    #table(
        columns: (100%),
        inset: (bottom: 0.6em),
        align: (left),
        stroke: (
            bottom: 0.5pt + gradient.linear(red, blue, green),
            top: none,
            left: none,
            right: none,
        ),
        [- Hệ Quản Trị CSDL: Microsoft SQL Server 2019.]
    )
]

=== Khởi Tạo Database
<khoi-tao-database>

#align(center)[
    #table(
        columns: (100%),
        inset: (bottom: 0.6em),
        align: (left),
        stroke: (
            bottom: 0.5pt + gradient.linear(red, blue, green),
            top: none,
            left: none,
            right: none,
        ),
        [- Khởi tạo: Database, tên `ROOM_BOOKING_SYSTEM`.]
    )
]
#v(2em)
#align(center)[
#show raw: set text(size: 1em, weight: "light", font: "Iosevka")
#raw(read("code/slide-create-database.sql"), lang: "sql", block: true)
]

=== Khởi Tạo Các Bảng
<khoi-tao-cac-bang>

#align(center)[
    #table(
        columns: (100%),
        inset: (bottom: 0.6em),
        align: (left),
        stroke: (
            bottom: 0.5pt + gradient.linear(red, blue, green),
            top: none,
            left: none,
            right: none,
        ),
        [- Khai báo và khởi tạo bảng: tổng 16.]
    )
]
#align(center)[
    #table(
        columns: (100%),
        inset: (bottom: 0.6em),
        align: (center),
        stroke: (
            bottom: 0.5pt + gradient.linear(red, blue, green),
            top: none,
            left: none,
            right: none,
        ),
        [Ví dụ về *Khởi Tạo Bảng*: ADMINS.]
    )
]
#align(center + bottom)[
#show raw: set text(size: 0.9em, weight: "light", font: "Iosevka")
#raw(read("code/slide-create-table-admins.sql"), lang: "sql", block: true)
]

= QUẢN LÝ THÔNG TIN
<quan-ly-thong-tin>


== Xử Lý Thông Tin - (SP) Đặt Phòng
<xu-ly-thong-tin-sp-dat-phong>

#lorem(10)


= KẾT LUẬN
<ket-luan>

== Đánh Giá Tổng Quan
<phan-da-dat-duoc>

#show table.cell: set text(size: 1.2em, weight: "light", font: body-font)
#grid(
  columns: (50%, 50%),
  rows: auto,
  // grid.header(
  //   [=== Kết Quả Đạt Được],
  //   [=== Hạn Chế],
  // ),
  [
  === Kết Quả Đạt Được
  #table(
    columns: (100%),
    inset: (top: 0.6em, bottom: 0.6em),
    align: (left),
    stroke: (
        bottom: 0.5pt + gradient.linear(red, blue, green),
        top: none,
        left: none,
        right: none,
    ),
    [- Chuẩn hóa quy trình nghiệp vụ.],
    [- Thiết kế bộ khung CSDL.],
    [- Xử lý thông tin tự động.],
    [- Cơ chế bảo mật đa lớp.],
    [- Sao lưu/Phục hồi.],
  )],[
  === Hạn Chế
  #table(
    columns: (100%),
    inset: (top: 0.6em, bottom: 0.6em),
    align: (left),
    stroke: (
        bottom: 0.5pt + gradient.linear(red, blue, green),
        top: none,
        left: none,
        right: none,
    ),
    [- Giao diện cho người dùng cuối.],
    [- Các kênh thanh toán thực tế.],
    [- Quản lý tài khoản/người dùng.]
    )
  ]
)

// == Phần Chưa Đạt Được
// <phan-chua-dat-duoc>

// // #show table.cell: set text(size: 1.5em, weight: "light", font: body-font)
// #table(
//   columns: (100%),
//   inset: (top: 0.6em, bottom: 0.6em),
//   align: (left),
//   stroke: (
//       bottom: 0.5pt + gradient.linear(red, blue, green),
//       top: none,
//       left: none,
//       right: none,
//   ),
//   [- Giao diện cho người dùng cuối.],
//   [- Các kênh thanh toán thực tế.],
//   [- Quản lý vòng đời tài khoản/người dùng.]
// )

== Mở Rộng & Nâng Cấp
<mo-rong-nang-cap>

=== Web App

#table(
  columns: (100%),
  inset: (top: 0.6em, bottom: 0.6em),
  align: (left),
  stroke: (
      bottom: 0.5pt + gradient.linear(red, blue, green),
      top: none,
      left: none,
      right: none,
  ),
  [- #emph[Nhân Viên] (#emph[Bộ Phận Quản Lý/Lễ Tân])],
  [- Thao tác nghiệp vụ nhanh chóng và chính xác.],
)

=== Mobile App
#table(
  columns: (100%),
  inset: (top: 0.6em, bottom: 0.6em),
  align: (left),
  stroke: (
      bottom: 0.5pt + gradient.linear(red, blue, green),
      top: none,
      left: none,
      right: none,
  ),
  [- #emph[Khách Hàng] (End User)],
  [- #emph["điểm chạm số"].],
  [- Tìm phòng, đặt phòng và tích điểm ngay trên điện thoại.],
)
