#import "../template/lib.typ": *

== B. Crystal Report Từ View
<b-crystal-report-tu-view>

Tạo một View cho biết thông tin đề tài, thông tin giáo viên là ủy viên đề tài và điểm số của các giáo viên ủy viên này cho từng đề tài. Sau đó tạo một Crystal Report từ View vừa tạo.

Yêu cầu:

- Đầy đủ cấu trúc của 1 Report.
- Thêm cột số thứ tự cho mỗi đề tài bằng Crystal Report.
- Sắp xếp điểm giảm dần theo từng đề tài.
- Page Header có 2 đường kẻ trên cùng và 1 đường kẻ dưới cùng, Report Footer có 2 đường kẻ. Tô nền vàng cho Page Header và Report Footer.
- Ngăn cách phần mỗi đề tài trong phần Details bằng 1 đường kẻ trước mỗi đề tài.

=== Màn Hình Design
<man-hinh-design>

#figure(image("./images/config_stt_field.png"),
  caption: [
    Bài 1.B - Màn Hình Design
  ]
)

=== Màn Hình Preview
<man-hinh-preview>

#figure(image("./images/dashboard_2.png"),
  caption: [
    Bài 1.B - Màn Hình Preview
  ]
)

=== Các Đối Tượng Sử Dụng
<cac-doi-tuong-su-dung>

Các Bảng và Trường tương ứng:

- `STT`
- `GV_UVDT`.`Diem`: `SUM(Diem)`
- `DETAI`.`Msdt`
- `DETAI`.`Tendt`
- `GIAOVIEN`.`Msgv(Giaovien)`

#figure(image("./images/drag_relevant_fields.png"),
  caption: [
    Bài 1.B - Các Đối Tượng Sử Dụng
  ]
)
