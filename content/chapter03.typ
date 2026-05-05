#import "../template/lib.typ": *

= 03 Loại Mã độc Tiêu Biểu Gần Đây
<03-loai-ma-doc-tieu-bieu-gan-day>

Một số thông tin về 3 loại mã độc (Malware) bao gồm các loại khác nhau (Trojan, Virus, Worm) đang gây ảnh hưởng lớn nhất trong không gian mạng hiện nay.

== Trojan: Lumma Stealer (LummaC2)
<trojan-lumma-stealer-lummac2>

- #strong[Tên:] Lumma Stealer (còn gọi là LummaC2).
- #strong[Nguồn gốc:]
  - Xuất hiện từ tháng 08/2022.
  - Được phát triển bởi cá nhân có bí danh "Shamel" (Lumma).
  - Vận hành theo mô hình Mã độc như một dịch vụ (Malware as a Service - MaaS) trên các diễn đàn tiếng Nga và Telegram.
- #strong[Đặc điểm:]
  - Viết bằng ngôn ngữ C và ASM, nhẹ và nhanh.
  - Sử dụng kỹ thuật:
    - "ClickFix" (lừa người dùng copy-paste lệnh vào cửa sổ Run thông qua CAPTCHA giả).
    - "EtherHiding" (lưu trữ mã độc trên #link("https://blackpointcyber.com/beyond-the-click-forensic-analysis-of-etherhiding-in-clickfix-campaign-infrastructure/")[blockchain Binance Smart Chain]) để lẩn tránh các hệ thống phòng thủ.
- #strong[Phương thức phá hoại:]
  - Đánh cắp thông tin trình duyệt (mật khẩu, cookie phiên), ví tiền điện tử (MetaMask, Electrum) và cấu hình VPN.
  - Sử dụng kỹ thuật #emph[process hollowing] để tiêm mã độc vào các tiến trình Windows hợp lệ như `explorer.exe` hoặc `msbuild.exe` để hoạt động ngầm.
- #strong[Biện pháp phòng chống:]
  - Triển khai giải pháp #emph[EDR] để phát hiện hành vi thực thi không tệp (#emph[fileless]).
  - Đào tạo người dùng nhận biết kỹ thuật thao túng tâm lý CAPTCHA giả.
  - Thực hiện nguyên tắc đặc quyền tối thiểu (Least Privilege).
- #strong[Nguồn tham khảo:]
  - #link("https://www.microsoft.com/en-us/corporate-responsibility/cybersecurity/microsoft-digital-defense-report-2025/")[Microsoft - Microsoft Digital Defense Report 2025]
  - #link("https://blog.qualys.com/vulnerabilities-threat-research/2024/10/20/unmasking-lumma-stealer-analyzing-deceptive-tactics-with-fake-captcha")[Qualys - Unmasking Lumma Stealer: Analyzing Deceptive Tactics with Fake CAPTCHA]
  - #link("https://www.sophos.com/en-us/blog/lumma-stealer-coming-and-going")[Sophos - Lumma Stealer: coming and going]

== Virus: Sality (Biến thể Đa hình 2024-2025)
<virus-sality-bien-the-da-hinh-2024-2025>

- #strong[Tên:] Virus Sality.
- #strong[Nguồn gốc:]
  - Là dòng virus lâu đời (xuất hiện từ 2003).
  - Đã ghi nhận sự bùng phát mạnh mẽ trở lại trong năm 2024 và đầu năm 2025 với hạ tầng điều khiển (C2 - Command & Control) được nâng cấp.
- #strong[Đặc điểm:]
  - Thuộc loại virus lây nhiễm tệp (#emph[file infector]) đa hình (#emph[polymorphic]) cực kỳ tinh vi.
  - Mã nguồn của nó liên tục thay đổi sau mỗi lần lây nhiễm để vượt qua các phần mềm diệt virus dựa trên chữ ký tĩnh.
- #strong[Phương thức phá hoại:]
  - Tự động chèn mã độc vào các tệp thực thi `.exe` và `.dll` trên toàn bộ hệ thống.
  - Vô hiệu hóa Windows Defender, tường lửa và các công cụ bảo mật.
  - Biến máy tính nạn nhân thành một phần của botnet để đào tiền ảo hoặc phát tán thư rác.
- #strong[Biện pháp phòng chống:]
  - Sử dụng phần mềm diệt virus dựa trên phân tích hành vi (#emph[Behavior-based]) thay vì chỉ dựa vào chữ ký.
  - Quét hệ thống định kỳ bằng các công cụ chuyên dụng có khả năng khử nhiễm (#emph[disinfection]) tệp tin và bảo vệ tính toàn vẹn của hệ thống.
- #strong[Nguồn tham khảo:]
  - #link("https://www.recordedfuture.com/research/h1-2025-malware-and-vulnerability-trends")[Recorded Future - H1 2025 Malware and Vulnerability Trends]
  - #link("https://web-assets.esetstatic.com/wls/en/papers/threat-reports/eset-threat-report-h22025.pdf")[ESET - Threat Report H2 2025]

== Worm: Morris II (Sâu AI)
<worm-morris-ii-sau-ai>

- #strong[Tên:] Morris II.
- #strong[Nguồn gốc:]
  - Được công bố vào đầu năm 2024 bởi nhóm nghiên cứu từ #emph[Cornell Tech], #emph[Technion] và #emph[Intuit] như một minh chứng về lỗ hổng của các hệ thống AI hiện đại.
- #strong[Đặc điểm:]
  - Sâu máy tính "không nhấp chuột" (#emph[zero-click]) đầu tiên nhắm vào các hệ sinh thái Trí Tuệ Nhân Tạo Tạo Sinh (GenAI) như GPT-4 và Gemini.
  - Nó sử dụng các "câu lệnh tự sao chép đối nghịch" (#emph[Adversarial Self-Replicating Prompts]) để thao túng phản hồi của AI.
- #strong[Phương thức phá hoại:]
  - Thông qua việc thao túng phản hồi của các tác nhân AI.
  - Khi trợ lý email AI xử lý một thông điệp nhiễm sâu, nó bị buộc phải trích xuất dữ liệu nhạy cảm (PII - Personal Identity Information, số thẻ tín dụng).
  - Và tự động tạo ra các email mới chứa chính mã độc của sâu để gửi đến các người dùng khác.
  - Tạo ra chuỗi lây nhiễm bùng nổ trong mạng lưới AI.
- #strong[Biện pháp phòng chống:]
  - Thực hiện kiểm tra tính hợp lệ của dữ liệu đầu vào/đầu ra (#emph[Input/Output validation]).
  - Cách ly các tác nhân AI (#emph[AI agents]) trong môi trường riêng biệt (#emph[Segmentation]);
  - Và áp dụng xác thực API nghiêm ngặt cùng giám sát bất thường về tần suất truy vấn.
- #strong[Nguồn tham khảo:]
  - #link("https://arxiv.org/html/2403.02817v2")[arXiv - Here Comes The AI Worm: Unleashing Zero-click Worms that Target GenAI-Powered Applications]
  - #link("https://www.ibm.com/think/insights/morris-ii-self-replicating-malware-genai-email-assistants")[IBM - Morris II Self-Replicating Malware in GenAI Email Assistants]
  - #link("https://www.sentinelone.com/cybersecurity-101/cybersecurity/ai-worms/")[SentinelOne - AI Worms Explained: Adaptive Malware Threats]

== Phụ Lục: Giải Thích Thuật Ngữ Kỹ Thuật
<phu-luc-giai-thich-thuat-ngu-ky-thuat>

- #strong[Process Hollowing:]
  - Kỹ thuật tiêm mã độc bằng cách tạo ra một tiến trình hợp lệ ở trạng thái tạm dừng, sau đó xóa bỏ phần mã gốc trong bộ nhớ RAM và thay thế bằng mã độc hại trước khi cho tiến trình chạy tiếp.
- #strong[EDR (Endpoint Detection and Response):]
  - Giải pháp an ninh tập trung vào việc giám sát và phản hồi các mối đe dọa tại điểm cuối (máy tính, máy chủ) dựa trên phân tích hành vi thời gian thực.
- #strong[Fileless Malware:]
  - Mã độc không tệp, hoạt động trực tiếp trong RAM và sử dụng các công cụ hệ thống hợp lệ để thực thi, không để lại dấu vết trên ổ cứng.
- #strong[MaaS (Malware-as-a-Service):]
  - Mô hình kinh doanh tội phạm mạng, trong đó kẻ phát triển mã độc cho thuê hạ tầng và công cụ tấn công cho các đối tượng khác để thu phí.
- #strong[File Infector:]
  - Loại mã độc ký sinh bằng cách đính kèm mã độc vào các tệp thực thi hợp lệ và lan truyền khi người dùng chạy các tệp đó.
- #strong[Polymorphic (Đa hình):]
  - Khả năng tự thay đổi hình dạng mã (mã hóa hoặc làm rối) sau mỗi lần lây nhiễm nhưng vẫn giữ nguyên chức năng độc hại, nhằm lẩn tránh sự phát hiện của chữ ký số tĩnh.
- #strong[Zero-click:]
  - Loại tấn công không cần bất kỳ sự tương tác nào của người dùng (như nhấp link hay mở tệp) để mã độc được thực thi.
- #strong[Adversarial Self-Replicating Prompts:]
  - Các câu lệnh độc hại được thiết kế để đánh lừa mô hình AI, khiến nó tạo ra kết quả bao gồm chính câu lệnh đó (kết quả bình thường) cùng với hành vi phá hoại (kết quả độc hại).
- #strong[C2 (Command & Control):]
  - Máy chủ điều khiển do tin tặc vận hành dùng để gửi lệnh và nhận dữ liệu đánh cắp được từ máy nạn nhân.
