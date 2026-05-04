#import "../template/lib.typ": *

= TÓM TẮT NỘI DUNG
<tom-tat-noi-dung>


== I. MỤC TIÊU BÀI THỰC HÀNH
<i-muc-tieu-bai-thuc-hanh>

Sau khi hoàn thành bài thực hành, sinh viên có thể:

+ Hiểu cơ chế lưu trữ thông tin trong bộ nhớ RAM.
+ Biết cách xem, phân tích tiến trình và bộ nhớ bằng Task Manager, CMD, PowerShell và Process Explorer.
+ Tự tạo memory dump của tiến trình và (tuỳ chọn) phân tích bằng công cụ ngoài.
+ Nhận diện rủi ro an toàn thông tin liên quan đến RAM.
+ PHẦN NÂNG CAO: Làm quen với forensic memory analysis bằng Volatility Framework.

== II. YÊU CẦU BÁO CÁO
<ii-yeu-cau-bao-cao>

Sinh viên phải nộp: file báo cáo (.docx), ghi lại quá trình thực hiện, chụp ảnh màn hình, mô tả các bước thực hiện, phân tích kết quả…, trong đó:

+ Hình chụp tiến trình trong Task Manager.
+ Hình `tasklist` / `Get-Process`.
+ Hình Process Explorer → Properties → Memory.
+ Hình dump file đã tạo.
+ Bảng phân tích rủi ro.
+ Trả lời câu hỏi:
  - Tại sao dữ liệu chưa lưu vẫn tồn tại trong RAM?
  - Hacker có thể lấy gì từ RAM?
  - Làm sao để giảm rủi ro rò rỉ dữ liệu?
+ Kết luận cá nhân.

== III. CHUẨN BỊ MÔI TRƯỜNG
<iii-chuan-bi-moi-truong>

- Windows 10 hoặc 11.
- Internet (để tải Sysinternals Process Explorer).
- CMD / PowerShell.
- Task Manager.
- #link("https://learn.microsoft.com/sysinternals/downloads/process-explorer")[Process Explorer].
- \(Tuỳ chọn nâng cao) RAM Capture / DumpIt / #link("https://www.volatilityfoundation.org/")[Volatility Framework].
