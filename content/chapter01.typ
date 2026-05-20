#import "../template/lib.typ": *

= PHẦN 1 — GIỚI THIỆU XU THẾ
<phan-1-gioi-thieu-xu-the>

== Xu Thế Được Chọn: Zero Trust Security
<xu-the-duoc-chon>

Sinh viên chọn *Xu thế 1*: *Zero Trust Security* (An ninh theo mô hình Không Tin Cậy).

Zero Trust Security là một mô hình bảo mật hoạt động dựa trên triết lý cốt lõi:
_"Không bao giờ tin cậy, luôn luôn xác minh"_ (Never Trust, Always Verify). Khác với
mô hình bảo mật truyền thống vốn phân chia rõ ràng giữa "bên trong" (tin cậy) và
"bên ngoài" (không tin cậy), Zero Trust coi mọi yêu cầu truy cập — dù xuất phát từ
bên trong hay bên ngoài mạng — đều là tiềm ẩn rủi ro và cần được xác minh nghiêm
ngặt trước khi cấp quyền.

== Bối Cảnh Xuất Hiện
<boi-canh-xuat-hien>

Khái niệm Zero Trust được John Kindervag — nhà phân tích tại Forrester Research —
đề xuất lần đầu vào năm 2010. Tuy nhiên, xu thế này thực sự bùng nổ trong giai đoạn
2020–2025 khi hội tụ nhiều yếu tố:

- *Chuyển đổi số và điện toán đám mây:* Dữ liệu và ứng dụng doanh nghiệp không
  còn nằm gọn trong một trung tâm dữ liệu duy nhất mà phân tán trên nhiều nền tảng
  đám mây (AWS, Azure, Google Cloud). Ranh giới mạng truyền thống trở nên mờ nhạt.

- *Làm việc từ xa:* Đại dịch COVID-19 thúc đẩy mô hình làm việc từ xa trên quy mô
  toàn cầu. Nhân viên truy cập hệ thống công ty từ mạng gia đình, quán cà phê, hay
  thiết bị cá nhân — đều là những môi trường nằm ngoài vành đai bảo mật truyền thống.

- *Tấn công mạng ngày càng tinh vi:* Các vụ tấn công lớn như SolarWinds (2020) và
  Colonial Pipeline (2021) cho thấy kẻ tấn công có thể xâm nhập sâu vào hệ thống
  nội bộ và di chuyển ngang (lateral movement) mà không bị phát hiện trong thời gian
  dài. Mô hình bảo mật vành đai đã thất bại trong việc ngăn chặn những cuộc tấn
  công này.

- *Sự phức tạp của thiết bị:* Sự gia tăng của thiết bị IoT, BYOD (Bring Your Own
  Device) và thiết bị di động khiến việc kiểm soát truy cập dựa trên vị trí mạng
  ngày càng bất khả thi.

== Vì Sao Zero Trust Trở Nên Cần Thiết?
<vi-sao-zero-trust-can-thiet>

Mô hình bảo mật truyền thống dựa trên giả định rằng mọi thứ bên trong mạng nội bộ
đều an toàn — giống như một lâu đài với bức tường thành kiên cố, ai đã vào bên
trong thì được tự do di chuyển. Tuy nhiên, thực tế đã chứng minh giả định này không
còn đúng:

Theo thống kê, các tổ chức triển khai Zero Trust đầy đủ giảm đến 50% số vụ vi phạm
dữ liệu và tiết kiệm trung bình 43% chi phí xử lý sự cố. Đến cuối năm 2026,
khoảng 10% doanh nghiệp lớn trên thế giới sẽ có chương trình Zero Trust trưởng
thành và đo lường được — tăng mạnh so với mức dưới 1% vào năm 2023. Thị trường
Zero Trust toàn cầu được dự báo đạt 86,57 tỷ USD vào năm 2030 với tốc độ tăng
trưởng hàng năm (CAGR) 17,7%.

Những con số trên cho thấy Zero Trust không còn là một khái niệm lý thuyết mà đã
trở thành chiến lược bảo mật bắt buộc trong kỷ nguyên số, khi mà ranh giới mạng
không còn tồn tại rõ ràng và mối đe dọa có thể đến từ bất kỳ đâu — kể cả từ bên
trong tổ chức.
