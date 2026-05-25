# PHẦN 4 --- TÁC ĐỘNG ĐẾN AN NINH THÔNG TIN

**Bước 4**:

Phân tích tác động của xu thế đến:

- Người dùng cá nhân
- Doanh nghiệp / tổ chức
- Công tác quản lý ATTT

Yêu cầu: Viết 1 đoạn cho mỗi đối tượng (5–7 dòng/đoạn)

Zero Trust Security không chỉ là một công nghệ hay sản phẩm cụ thể mà là một sự thay đổi mô hình tư duy (paradigm shift) trong cách tiếp cận an ninh thông tin, an toàn thông tin bây giờ không chỉ là trách nhiệm của đội ngũ IT mà còn là của tất cả mọi người. Phần này phân tích tác động của xu thế đến ba nhóm đối tượng chính.

## Tác Động Đến Người Dùng Cá Nhân

Đối với người dùng cá nhân, Zero Trust thể hiện qua những thay đổi cụ thể trong cách họ tương tác với các dịch vụ số hàng ngày.

Xác thực đa yếu tố (MFA) --- từ mã OTP qua SMS đến xác thực sinh trắc học trên điện thoại --- đã trở thành tiêu chuẩn bắt buộc trên hầu hết các nền tảng lớn như Google, Facebook và các ứng dụng ngân hàng. Người dùng cũng ngày càng quen thuộc với việc bị yêu cầu xác thực lại khi truy cập từ thiết bị mới hoặc vị trí bất thường. Dù đôi khi gây bất tiện, những biện pháp này đã giúp giảm đáng kể số vụ đánh cắp tài khoản cá nhân.

Đặc biệt, các ứng dụng ngân hàng tại Việt Nam đã áp dụng xác thực sinh trắc học theo quy định của Ngân hàng Nhà nước từ năm 2024, đây chính là việc áp dụng triết lý Zero Trust ở cấp người dùng cuối.

## Tác Động Đến Doanh Nghiệp và Tổ Chức

Với doanh nghiệp, Zero Trust tạo ra sự thay đổi căn bản trong kiến trúc bảo mật. Thay vì đầu tư vào tường lửa vành đai ngày càng lớn, doanh nghiệp chuyển sang mô hình bảo mật phân tán --- mỗi ứng dụng, mỗi dịch vụ đều có lớp bảo vệ riêng.

Google là ví dụ tiên phong khi triển khai BeyondCorp từ năm 2011, cho phép nhân viên làm việc từ bất kỳ mạng nào mà không cần VPN. Sau đó là các nhà cung cấp khác với các sản phẩm khác nhau, như Palo Alto Networks với Prisma Access, Zscaler với Zscaler Private Access, Microsoft với Microsoft Entra Private Access và Cloudflare với Cloudflare Zero Trust, hay VMware với NSX đem đến khả năng cho doanh nghiệp triển khai Zero Trust dễ dàng và hiệu quả hơn.

Mô hình này đặc biệt quan trọng trong bối cảnh nhiều doanh nghiệp quan tâm hơn đến vấn đề bảo mật thông tin, đặc biệt là khi làm việc từ xa hoặc trong môi trường quy mô lớn, đa dạng. Việc áp dụng Zero Trust giúp doanh nghiệp giảm thiểu rủi ro từ các mối đe dọa an ninh ngày càng tinh vi, đồng thời nâng cao hiệu quả hoạt động.

## Tác Động Đến Công Tác Quản Lý An Toàn Thông Tin

Các mô hình/framework về quản lý hạ tầng hoặc/và dịch vụ IT như ITILv4, COBIT, vv... đều có vai trò trong việc quản lý ATTT của doanh nghiệp. Và các framework này đề cập Zero Trust theo các góc độ khác nhau từ đó tác động đến cách các doanh nghiệp tiếp cận/triển khai Zero Trust. Ví dụ, tập trung vào Con Người, rồi tới Quy Trình, và cuối cùng là Công Nghệ, đúng như chúng ta đã đề cập ở trên, Con Người trong tổ chức là mắt xích quan trọng nhất.

Về mặt quản lý, Zero Trust buộc các tổ chức phải xây dựng lại chính sách an toàn thông tin từ nền tảng. Thay vì phân loại đơn giản "mạng nội bộ = an toàn", quản trị viên phải thiết kế chính sách truy cập dựa trên ngữ cảnh (context-aware access) --- xem xét danh tính người dùng, trạng thái thiết bị, thời gian truy cập và mức độ nhạy cảm của tài nguyên.

Điều này đòi hỏi đội ngũ quản lý ATTT phải nâng cao năng lực chuyên môn, đầu tư vào công cụ SIEM (Security Information and Event Management) và SOAR (Security Orchestration, Automation and Response) để xử lý lượng lớn dữ liệu giám sát.

Mặt tích cực là Zero Trust cung cấp khả năng kiểm toán (audit) và báo cáo chi tiết hơn, giúp công tác quản lý ATTT trở nên minh bạch và có cơ sở dữ liệu hơn so với mô hình truyền thống.

Các nhà cung cấp hạ tầng lớn đặc biệt là hạ tầng đám mây (Cloud) đã tích hợp và có hướng dẫn triển khai Zero Trust trên hạ tầng của mình, giúp các tổ chức/doanh nghiệp dễ dàng triển khai Zero Trust khi trở thành khách hàng của họ.

## Các Mô Hình Triển Khai Zero Trust Phổ Biến

Mô hình Zero Trust đầu tiên và cơ bản nhất là **Micro Segmentation** (Phân đoạn vi mô). Ý tưởng cốt lõi là chia nhỏ mạng lưới thành các phân đoạn nhỏ nhất có thể --- thậm chí đến từng ứng dụng hoặc từng máy chủ --- và áp dụng chính sách bảo mật riêng cho từng phân đoạn. Khi kết hợp với Zero Trust, Micro Segmentation giúp ngăn chặn hiệu quả sự di chuyển ngang (East-West movement) của kẻ tấn công. Nếu một phần tử bị xâm nhập, kẻ tấn công sẽ bị giới hạn trong phạm vi phân đoạn đó và không thể lan sang các phần khác của hệ thống.

Một triển khai thực tế và đầy đủ hơn của Zero Trust là **Zero Trust Architecture (ZTA)**. Khác với Micro Segmentation chỉ tập trung vào phân đoạn mạng, ZTA là một khuôn khổ toàn diện bao gồm nhiều thành phần: quản lý danh tính và truy cập (Identity and Access Management - IAM), xác thực đa yếu tố (MFA), quản lý điểm cuối (endpoint security), quản lý dữ liệu (data governance), phân tích hành vi người dùng (UEBA), và tự động hóa phản ứng sự cố (SOAR). ZTA không chỉ bảo vệ mạng mà còn bảo vệ dữ liệu và ứng dụng, bất kể chúng nằm ở đâu.

Tại Việt Nam, các đơn vị cung cấp giải pháp Zero Trust thường kết hợp cả hai mô hình trên. Ví dụ, Viettel Cyber Security (VCS) cung cấp các dịch vụ như "Zero Trust Access Control" dựa trên nền tảng AI và hành vi người dùng, đồng thời triển khai Micro Segmentation để bảo vệ các hệ thống trọng yếu của khách hàng. Các mô hình này đều tuân thủ nguyên tắc cốt lõi "Không bao giờ tin cậy, luôn luôn xác minh" --- mọi yêu cầu truy cập đều phải trải qua kiểm tra nghiêm ngặt trước khi được cấp quyền.
