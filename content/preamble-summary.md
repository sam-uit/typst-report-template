# TÓM TẮT NỘI DUNG

## I. MỤC TIÊU BÀI THỰC HÀNH

Sau khi hoàn thành bài thực hành, sinh viên có thể:

1. Hiểu cơ chế lưu trữ thông tin trong bộ nhớ RAM.
2. Biết cách xem, phân tích tiến trình và bộ nhớ bằng Task Manager, CMD, PowerShell và Process Explorer.
3. Tự tạo memory dump của tiến trình và (tuỳ chọn) phân tích bằng công cụ ngoài.
4. Nhận diện rủi ro an toàn thông tin liên quan đến RAM.
5. PHẦN NÂNG CAO: Làm quen với forensic memory analysis bằng Volatility Framework.

## II. YÊU CẦU BÁO CÁO

Sinh viên phải nộp: file báo cáo (.docx), ghi lại quá trình thực hiện, chụp ảnh màn hình, mô tả các bước thực hiện, phân tích kết quả…, trong đó:

1. Hình chụp tiến trình trong Task Manager.
2. Hình `tasklist` / `Get-Process`.
3. Hình Process Explorer → Properties → Memory.
4. Hình dump file đã tạo.
5. Bảng phân tích rủi ro.
6. Trả lời câu hỏi:
    - Tại sao dữ liệu chưa lưu vẫn tồn tại trong RAM?
    - Hacker có thể lấy gì từ RAM?
    - Làm sao để giảm rủi ro rò rỉ dữ liệu?
7. Kết luận cá nhân.

## III. CHUẨN BỊ MÔI TRƯỜNG

- Windows 10 hoặc 11.
- Internet (để tải Sysinternals Process Explorer).
- CMD / PowerShell.
- Task Manager.
- [Process Explorer](https://learn.microsoft.com/sysinternals/downloads/process-explorer).
- (Tuỳ chọn nâng cao) RAM Capture / DumpIt / [Volatility Framework](https://www.volatilityfoundation.org/).
