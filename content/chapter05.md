# PHẦN E. PHÂN TÍCH RỦI RO

## Các Câu Hỏi

- **Thông tin nhạy cảm có thể tồn tại trong RAM.**
  - Các thông tin trong quá trình làm việc của chương trình tồn tại trong bộ nhớ.
  - Bao gồm các loại bộ nhớ như cache L1/L2, và phổ biến là RAM.
  - Các thông tin nhạy cảm đó có thể là: mật khẩu; mã truy cập; thông tin cá nhân; tài khoản ngân hàng,...
- **Tiến trình không rõ gây nguy hiểm thế nào.**
  - Các tiến trình không rõ có nghĩa là có thể có các hành vi không biết trước, hoặc không thể dự đoán.
  - Bao gồm các hành vi như: truy cập dữ liệu của các tiến trình khác, từ file system tới các địa chỉ nhớ trong RAM.
  - Mục tiêu thường là: sao chép, đánh cắp dữ liệu; bẻ khóa, chiếm quyền điều khiển; hoặc đơn giản là dùng tài nguyên hệ thống.
- **Dump file có thể bị hacker sử dụng để thu thập dữ liệu gì.**
  - Dump file chứa rất nhiều thông tin về tiến trình và các dữ liệu của tiến trình, vì vậy hacker có thể khai thác theo nhiều cách.
  - Mỗi chương trình có thể có các lượng và loại dữ liệu khác nhau tùy chức năng: khai thác trực tiếp, hoặc khai thác gián tiếp.
    - Khai thác trực tiếp: là tấn công trực tiếp vào dump file để lấy dữ liệu.
    - Khai thác gián tiếp: là tấn công hành vi của chương trình để lấy dữ liệu.
  - File dump cũng cho biết chương trình đó chạy từ đâu, sử dụng các tài nguyên nào, và thậm chí là tổ chức lưu trữ như thế nào, tức là các hành vi của chương trình.
  - Từ đó, hacker có thể dự đoán, hoặc thay thế, hoặc chèn vào các thành phần mà chương trình cần dùng một cách tinh vi, ví dụ mã độc nhằm thay thay thế các thành phần quan trọng và thu thập dữ liệu.
- **Vì sao laptop Sleep/Hibernate có thể lưu nhiều dữ liệu nhạy cảm?**
  - Chế độ Sleep hoặc Hibernate tức là quá trình ngủ và ngủ đông của máy tính.
  - Hiểu đơn giản là mặc dù đang không sử dụng, nhưng máy tính vẫn đang chạy (có điện) các chương trình vẫn chạy, hoặc là được lưu lại quá trình thực thi.
  - Điểm quan trọng: dữ liệu đang được xử lý của các chương trình không bị xóa hoàn toàn trong quá trình này.
  - Khi Sleep, các chương trình vẫn đang chạy và dữ liệu vẫn trong RAM và các dữ liệu quan trọng vẫn chưa được lưu hoặc mã hóa, hoặc một hình thức khác.
  - Khi Hibernate, máy tính tạm dừng, lưu dữ liệu đang xử lý trong RAM ra một file trên ổ cứng, và ngắt điện toàn bộ. File này thường là page.sys hoặc tương tự vậy, và quan trọng hơn file này chứa toàn bộ dữ liệu đang xử lý. Đây cũng là điểm quan trọng, vì kẻ tấn công có thể chỉ cần lấy toàn bộ thiết bị lưu trữ (HDD/SSD) mà không cần khởi động hệ thống, và thực hiện tấn công ở một thời điểm khác, công cụ khác mà thường có khả năng cao hơn trong quá trình khai thác dữ liệu.

## Kết Luận và Khuyến Nghị

- Chỉ cài đặt và chạy các chương trình cần thiết.
- Chỉ cài đặt và chạy các chương trình có nguồn gốc rõ ràng.
- Luôn cập nhật các chương trình:
  - bao gồm cả Hệ Điều Hành và các phần mềm liên quan;
  - đảm bảo rằng các lỗ hổng bảo mật được vá kịp thời.
- Sử dụng mật khẩu mạnh và mã hóa dữ liệu quan trọng.
- Sử dụng các công cụ bảo mật chuyên nghiệp:
  - giám sát hoạt động của hệ thống hoặc quét các tiến trình lạ.
- Sử dụng các chế độ Sleep hoặc Hibernate một cách cẩn trọng.
- Phân tách chức năng:
  - máy tính/thiết bị làm việc quan trọng;
  - máy tính/thiết bị làm việc thông thường/giải trí.
- Sử dụng các môi trường sandbox hoặc ảo hóa tùy nhu cầu cụ thể về an toàn dữ liệu.
- Bảo mật là một quá trình xuyên suốt:
  - từ phần cứng tới phần mềm;
  - từ dữ liệu tới hành vi;
  - từ con người tới công cụ; vv...
