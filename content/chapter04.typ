#import "../template/lib.typ": *

= TIẾT 4. BẢO MẬT THIẾT BỊ DI ĐỘNG (THỰC HÀNH BẮT BUỘC)
<tiet-4-bao-mat-thiet-bi-di-dong-thuc-hanh-bat-buoc>


== Bài 8. Thiết Lập Khóa Màn Hình An Toàn
<bai-8-thiet-lap-khoa-man-hinh-an-toan>

- PIN $gt.eq$ 6 số hoặc mật khẩu.
- Bật vân tay / FaceID (nếu có).
- Chụp màn hình mục cấu hình (không lộ mã).

Thiết bị: iPhone.

Mã Pin: 10111997

- 6 chữ số
- Luôn yêu cầu mã PIN ngay khi khóa màn hình.

#figure(image("assets/08-passcode.png"),
  caption: [
    Bài 8. Màn Hình Khóa Điện Thoại
  ]
)

Luôn yêu cầu FaceID cho bất kỳ tác vụ quan trọng nào:

- Mở khóa iPhone.
- Thanh toán.
- Điền mật khẩu.

#figure(image("assets/08-faceid.png"),
  caption: [
    Bài 8. FaceID
  ]
)

== Bài 9. Kiểm Tra Cập Nhật Hệ Điều Hành
<bai-9-kiem-tra-cap-nhat-he-dieu-hanh>

- Android: System Update
- iOS: Software Update

Thiết bị: iPhone

- Phiên bản iOS: mới nhất tại thời điểm hiện tại.

#figure(image("assets/09-ios.jpg"),
  caption: [
    Bài 9. Kiểm Tra Cập Nhật Hệ Điều Hành
  ]
)

- Auto Update: bật. Đảm bảo luôn nhận thông báo về phiên bản mới nhất.

#figure(image("assets/09-update.jpg"),
  caption: [
    Bài 9. Auto Update
  ]
)

== Bài 10. Kiểm Soát Quyền Ứng Dụng
<bai-10-kiem-soat-quyen-ung-dung>

- Bước 1: Settings → Privacy → Location / Camera / Microphone
- Bước 2: Chọn 1 ứng dụng → chỉnh:
  - While using app / Ask every time
- Bước 3: Chụp màn hình

Ứng dụng: AirAsia MOVE

- Camera: Tắt.
  - Không có lý do gì để ứng dụng này có quyền truy cập camera trong khi chỉ dùng để mua vé máy bay.

#figure(image("assets/10-camera.png"),
  caption: [
    Bài 10. Kiểm Soát Quyền Ứng Dụng - Camera
  ]
)

- Location: While Using (the App).
  - Chỉ cho phép truy cập vị trí khi đang sử dụng ứng dụng, nhằm gợi ý các chuyến bay phù hợp với vị trí hiện tại.

#figure(image("assets/10-location.png"),
  caption: [
    Bài 10. Kiểm Soát Quyền Ứng Dụng - Location
  ]
)
