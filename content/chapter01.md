# PHẦN 1 --- GIỚI THIỆU XU THẾ

**Bước 1**: Trình bày:

- Tên xu thế
- Xu thế này xuất hiện trong bối cảnh nào?
- Vì sao xu thế này trở nên cần thiết?

**Yêu cầu**: 1–1,5 trang

## Xu Thế Được Chọn: Zero Trust Security

Sinh viên chọn **Xu thế 1**: **Zero Trust Security** (An ninh theo mô hình Không Tin Cậy).

**Zero Trust Security** là một mô hình bảo mật hoạt động dựa trên triết lý cốt lõi:

- **"Không bao giờ tin cậy, luôn luôn xác minh"** (Never Trust, Always Verify).

Khác với mô hình bảo mật truyền thống vốn phân chia rõ ràng giữa **bên trong** (tin cậy) và **bên ngoài** (không tin cậy), Zero Trust coi mọi yêu cầu truy cập -- dù xuất phát từ bên trong hay bên ngoài mạng -- đều là tiềm ẩn rủi ro và cần được xác minh nghiêm ngặt trước khi cấp quyền.

Ở môi trường truyền thống, hạ tầng được phân tách thành các khu vực (zone) như DMZ, Internal, DB... Từng khu vực sẽ có các chính sách bảo mật tương ứng. Tuy nhiên, khi dữ liệu và các ứng dụng được triển khai trên nhiều môi trường khác nhau, việc quản lý trở nên khó khăn hơn. Hoặc cách phát triển ứng dụng bây giờ đã thay đổi, nhiều dịch vụ quan trọng tập trung trong các môi trường khác nhau, không còn nằm trong khu vực cụ thể để dễ dàng phân loại và cô lập nữa. Dẫn đến việc kiểm soát quyền truy cập của người dùng với từng ứng dụng ngày càng trở nên khó khăn và phức tạp hơn.

**Zero Trust Security** kết hợp với một cách quản lý hệ thống mạng mới gọi là **Micro Segmentation**. Từ đó, một mô hình đầy đủ hơn được gọi là **Zero Trust Architecture** được ứng dụng rộng rãi trong môi trường doanh nghiệp.

Ví dụ: **VMware NSX**, đây là một nền tảng ảo hóa mạng được phát triển bởi VMware, được triển khai trên các môi trường ảo hóa vSphere -- một môi trường điện toán đám mây riêng (Private Cloud) ảo hóa rộng lớn, cho phép các tổ chức xây dựng và quản lý mạng ảo của riêng mình trên nền tảng hạ tầng vật lý. NSX nhấn mạnh vào Zero Trust và Micro Segmentation, từ đó tạo ra một mô hình bảo mật toàn diện và linh hoạt, phục vụ cho cả môi trường hạ tầng truyền thống như mô hình 3-Tier (App - Web - DB) và cả môi trường microservices (Tanzu) đang ngày càng phổ biến.

## Bối Cảnh Xuất Hiện

Khái niệm **Zero Trust** được John Kindervag -- nhà phân tích tại Forrester Research -- đề xuất lần đầu vào năm 2010. Tuy nhiên, xu thế này thực sự bùng nổ trong giai đoạn 2020–2025 khi hội tụ nhiều yếu tố:

- **Chuyển đổi số và điện toán đám mây:** Dữ liệu và ứng dụng doanh nghiệp không còn nằm gọn trong một trung tâm dữ liệu duy nhất mà phân tán trên nhiều nền tảng đám mây (AWS, Azure, Google Cloud), hoặc trong các môi trường ảo hóa và hybrid phức tạp. Điều này khiến ranh giới phân chia ranh giới giữa bên trong và bên ngoài theo mô hình mạng truyền thống trở nên mờ nhạt.

- **Làm việc từ xa:** Đại dịch COVID-19 thúc đẩy mô hình làm việc từ xa trên quy mô toàn cầu. Nhân viên truy cập hệ thống công ty từ mạng gia đình, quán cà phê, hay thiết bị cá nhân -- đều là những môi trường nằm ngoài vành đai bảo mật truyền thống.

- **Tấn công mạng ngày càng tinh vi:** Các vụ tấn công lớn như SolarWinds (2020) và Colonial Pipeline (2021) cho thấy kẻ tấn công có thể xâm nhập sâu vào hệ thống nội bộ và di chuyển ngang (lateral movement) mà không bị phát hiện trong thời gian dài. Mô hình bảo mật vành đai truyền thống đã thất bại trong việc ngăn chặn những cuộc tấn công này.

- **Sự phức tạp của các loại thiết bị:** Sự gia tăng của thiết bị IoT, BYOD (Bring Your Own Device) và thiết bị di động khiến việc kiểm soát truy cập dựa trên vị trí mạng ngày càng bất khả thi.

## Vì Sao Zero Trust Trở Nên Cần Thiết?

Mô hình bảo mật truyền thống dựa trên giả định rằng mọi thứ bên trong mạng nội bộ đều an toàn -- giống như một lâu đài với bức tường thành kiên cố, ai đã vào bên trong thì được tự do di chuyển. Tuy nhiên, thực tế đã chứng minh giả định này không còn đúng.

Môi trường doanh nghiệp nói riêng, và môi trường ứng dụng & dữ liệu CNTT nói chung trong những năm gần đây đã có sự thay đổi lớn: rộng hơn, phân tán hơn, kết nối đa dạng hơn, vv.. với cấp số nhân, từ đó dẫn đến sự xuất hiện của các thách thức và yêu cầu bảo mật mới. Chúng ta cần các công cụ mới, cách tiếp cận mới thay thế mô hình truyền thống.

Trong số đó, Zero Trust Security đang trở thành một trong những mô hình bảo mật được quan tâm và áp dụng nhiều nhất hiện nay. Zero Trust Security không chỉ là một công nghệ hay giải pháp, mà là một triết lý bảo mật, một cách tiếp cận toàn diện, có hệ thống nhằm bảo vệ doanh nghiệp khỏi các mối đe dọa ngày càng tinh vi và đa dạng.

Zero Trust không còn là một khái niệm lý thuyết mà đã trở thành chiến lược bảo mật bắt buộc trong kỷ nguyên số, khi mà ranh giới mạng không còn tồn tại rõ ràng và mối đe dọa có thể đến từ bất kỳ đâu -- kể cả từ bên trong tổ chức.
