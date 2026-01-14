#import "../template/lib.typ": *

= Bài 2. Các Loại Reports
<bai-2-cac-loai-reports>

Yêu cầu:

- Tìm hiểu ngoài Crystal Report, còn có những loại Report nào mà Visual Studio hỗ trợ?
- Hiện tại, loại Report nào phổ biến và hay được dùng nhất?
- Ngoài ra, nếu không dùng Visual Studio thì có cách nào tạo Report không?

Hướng dẫn làm bài:

- Đối với Windows OS: Sử dụng phần mềm Crystal Report tương ứng với phiên bản của Visual Studio đang dùng.
- Đối với MacOS: Sử dụng phần mềm Tableau Desktop.

== Visual Studio Hỗ trợ Những Loại Report Nào?
<visual-studio-ho-tro-nhung-loai-report-nao>

Ngoài #strong[Crystal Report];, Visual Studio còn hỗ trợ một số loại Report phổ biến sau:

- RDLC (Local Report): Microsoft Report Viewer
- SSRS (SQL Server Reporting Services): Server Report

=== RDLC (Local Report) -- Microsoft Report Viewer
<rdlc-local-report-microsoft-report-viewer>

- Dùng tốt cho WinForms, WPF, ASP.NET MVC, WebForms.
- File report: `.rdlc`
- Thiết kế report bằng designer kéo-thả trong Visual Studio

=== SSRS (SQL Server Reporting Services) -- Server Report
<ssrs-sql-server-reporting-services-server-report>

- Dùng khi muốn tạo report chạy trên server.
- Thiết kế file `.rdl` (khác với `.rdlc`).
- Report chạy trên Report Server: Web, API.

=== Ví Dụ Thực Tế
<vi-du-thuc-te>

Hiện nay, một số phần mềm bệnh viện đang sử dụng #strong[RDLC] và #strong[SSRS];, ví dụ:

- Hoàn Mỹ
- Nam Sài Gòn
- Gia An
- Truyền máu Huyết Học

== Loại Report Phổ Biến và Hay Được Dùng Nhất Hiện Nay?
<loai-report-pho-bien-va-hay-duoc-dung-nhat-hien-nay>

Hiện nay, #strong[Local Report (RDLC)] và #strong[SSRS] là hai loại report được sử dụng nhiều nhất trong thực tế, đặc biệt trong các hệ thống lớn:

- Quản lý doanh nghiệp (ERP)
- Quản lý bệnh viện (HIS)
- Quản lý tài chính -- kế toán

== Nếu Không Dùng Visual Studio Thì Có Cách Khác Không?
<neu-khong-dung-visual-studio-thi-co-cach-khac-khong>

Ngoài Visual Studio, vẫn có thể tạo report bằng cách:

- Sử Dụng #strong[Report Builder]
  - Công cụ kéo-thả giao diện.
  - Kết nối trực tiếp với Database.
  - Thiết kế report mà #strong[không cần code];.
