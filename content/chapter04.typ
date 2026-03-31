#import "../template/lib.typ": *

= Bước 4. Quan Sát Nhật Ký Sự Kiện (Event Viewer)
<buoc-4-quan-sat-nhat-ky-su-kien-event-viewer>

Mục Tiêu:

- Học cách phân tích log Security để phát hiện dấu hiệu tấn công dò mật khẩu.

Hướng Dẫn:

- Đăng nhập lại Windows bằng tài khoản có quyền quản trị (ví dụ: `AdminLab`).
- Mở Event Viewer: nhấn Windows + R → gõ `eventvwr.msc` → Enter.
- Trong khung bên trái, chọn: Windows Logs → Security.
- Ở khung bên phải, chọn: Filter Current Log…
- Trong cửa sổ Filter, tại mục Event IDs nhập: `4625`, `4740` rồi nhấn OK.
- Tìm các sự kiện có ID `4625` (#emph[An account failed to log on]) liên quan đến tài khoản `UserTest`, mở chi tiết để xem lý do thất bại và nguồn đăng nhập (nếu có).
- Tìm sự kiện có ID `4740` (#emph[A user account was locked out]) để xác định thời điểm tài khoản `UserTest` bị khóa và máy thực hiện hành động.

Thực Hiện:
