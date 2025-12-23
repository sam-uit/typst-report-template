= Phụ Lục: Thiết Lập Môi Trường Lab
<phu-luc-thiet-lap-moi-truong-lab>


== Các Tài Nguyên
<cac-tai-nguyen>

Các tài nguyên (tài liệu, code, vv…) của lab này được lưu tại:

- #link("https://github.com/lt20252cnttalpha/LT.K2025.2-CNTT/tree/main/uit/courses/IE103/assignments/BTTH2")[LT.K2025.2-CNTT \> IE103 \> assignments \> BTTH2]
  - `content`: Thư mục chứa các file nội dung của báo cáo.
  - `content/code`: Thư mục chứa các script `.sql` để thực thi.
  - `IE103-BTTH2`: Thư mục chứa file dự án `.sqlproj` cho SQL Projects.

== Thiết bị
<thiet-bi>

- macOS, M4 Pro (`arm64`).

== Các công cụ
<cac-cong-cu>

- `make` (cài đặt sẵn)
- brew.sh: quản lý gói.
- Colima
- `docker`
- Azure Database Studio (ADS)
- SQL Projects (ADS Extension)

== Quản lý vòng đời của SQL Server.
<quan-ly-vong-doi-cua-sql-server>

- Sử dụng `make` với `Makefile`.

```bash
# Khởi tạo hoặc/và chạy SQL Server
make up

# Tắt/Shutdown SQL Server
make down

# Xóa bỏ SQL Server
make clean
```

== Khởi tạo môi trường lab thủ công
<khoi-tao-moi-truong-lab-thu-cong>

- Kết nối vào SQL Server: `localhost`, `sa`, `Password123!`
- Tạo DB với `00-CREATE-DB.sql` hoặc nhập truy vấn thủ công.
- Chạy các script `.sql` tương ứng lần lượt từ thư mục `code`.
  - `bai-01-1.sql`
  - `bai-01-2.sql`
  - …

== Khởi tạo môi trường lab với ADS (SQL Projects)
<khoi-tao-moi-truong-lab-voi-ads-sql-projects>
