= Phụ Lục: Thiết Lập Môi Trường Lab
<phu-luc-thiet-lap-moi-truong-lab>

- Thiết bị: macOS, M4 Pro (`arm64`).

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
