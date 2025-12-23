# Phụ Lục: Thiết Lập Môi Trường Lab

- Thiết bị: macOS, M4 Pro (`arm64`).

## Các công cụ

- `make` (cài đặt sẵn)
- brew.sh: quản lý gói.
- Colima
- `docker`
- Azure Database Studio (ADS)
- SQL Projects (ADS Extension)

## `Makefile`

- Quản lý vòng đời của SQL Server.

```bash
# Khởi tạo hoặc/và chạy SQL Server
make up

# Tắt/Shutdown SQL Server
make down

# Xóa bỏ SQL Server
make clean
```
