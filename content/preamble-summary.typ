#import "../template/lib.typ": *

= BÀI TẬP THỰC HÀNH 6B: MỘT SỐ XU THẾ AN NINH THÔNG TIN HIỆN ĐẠI
<bai-tap-thuc-hanh-6b-mot-so-xu-the-an-ninh-thong-tin-hien-dai>


== MỤC TIÊU BÀI THỰC HÀNH
<muc-tieu-bai-thuc-hanh>

Sau bài thực hành, sinh viên có thể

+ Nhận biết các #strong[xu thế an ninh thông tin hiện đại].
+ Phân tích #strong[nguyên nhân hình thành xu thế].
+ Đánh giá #strong[tác động của xu thế đến an toàn thông tin].
+ Liên hệ xu thế với #strong[người dùng, tổ chức, doanh nghiệp].
+ Rèn luyện #strong[kỹ năng tìm kiếm -- tổng hợp -- trình bày kỹ thuật].

== YÊU CẦU CHUNG
<yeu-cau-chung>

- Sinh viên #strong[tự nghiên cứu tài liệu].
- Không sao chép Wikipedia nguyên văn.
- Nội dung phải #strong[diễn giải bằng lời của sinh viên].
- Có #strong[nhận xét, đánh giá cá nhân].

== DANH SÁCH XU THẾ (BẮT BUỘC CHỌN)
<danh-sach-xu-the-bat-buoc-chon>

Sinh viên chọn 01 xu thế trong danh sách sau (ghi rõ đã chọn xu thế nào):

+ Zero Trust Security.
+ Cloud Security.
+ AI trong An ninh Thông tin.
+ An ninh IoT.
+ Bảo mật thiết bị di động.
+ Bảo mật dữ liệu cá nhân & quyền riêng tư.
+ An ninh chuỗi cung ứng (Supply Chain Security).
+ An ninh mạng trong môi trường làm việc từ xa (Remote Work Security).

Không chọn ngoài danh sách nêu trên.

== NỘI DUNG THỰC HÀNH
<noi-dung-thuc-hanh>

Sinh viên chọn #strong[Xu thế 1]: #strong[Zero Trust Security] (An ninh theo mô hình Không Tin Cậy) -- mô hình bảo mật hoạt động dựa trên triết lý #strong["Không bao giờ tin cậy, luôn luôn xác minh"]. Xu thế này được chọn vì tính thời sự cao, sự phổ biến toàn cầu và mức độ tác động sâu rộng đến cả người dùng cá nhân lẫn doanh nghiệp trong bối cảnh chuyển đổi số.

Báo cáo được tổ chức theo 6 phần theo yêu cầu bài thực hành:

- #strong[Phần 1]: Giới Thiệu Xu Thế: Bối cảnh, lý do Zero Trust trở nên cần thiết.
- #strong[Phần 2]: Các Đặc Điểm Chính: 6 đặc điểm cốt lõi của mô hình Zero Trust.
- #strong[Phần 3]: Lợi Ích & Thách Thức: 4 lợi ích và 4 thách thức khi triển khai.
- #strong[Phần 4]: Tác Động Đến ATTT: Phân tích tác động đến người dùng, doanh nghiệp, quản lý ATTT.
- #strong[Phần 5]: Liên Hệ Thực Tế: Ví dụ Google BeyondCorp -- triển khai Zero Trust quy mô lớn.
- #strong[Phần 6]: Nhận Xét Cá Nhân: Đánh giá tính phù hợp với Việt Nam, triển vọng 5 năm, và chuẩn bị cho sinh viên CNTT.

Mỗi phần sẽ được trình bày trong mỗi chương riêng biệt trong báo cáo.

#import "../template/lib.typ": *
#line(length: 100%, stroke: 0.5pt + gradient.linear(orange, red, blue, green))
#co-info(title: "Lời Nhắn")[
    Nội dung của báo cáo này được thu thập, tổng hợp từ nhiều nguồn Internet, đồng thời kết hợp với kinh nghiệm trong lĩnh vực, từ các sản phẩm và dịch vụ của Dell Technologies (VxRail/PowerFlex), VMware (vSphere/vSAN/NSX), Nutanix (AHV), Google Cloud (GCP), vv... và có thể có các sai sót hoặc thiếu đồng bộ. Người viết rất vui nếu nhận được đóng góp để hoàn thiện.
]
