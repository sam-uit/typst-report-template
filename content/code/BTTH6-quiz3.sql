-- IE103
-- BTTH6
-- NHOM 2
-- CAU 3.

-- ==================================================================
-- 1. Tạo ra 3 users: `GIANGVIEN`, `GIAOVU` và `SINHVIEN`, đặt *mật khẩu tuỳ ý*.
-- ==================================================================

--- Trước khi tạo 3 user ta tạo 3  login đăng nhập
CREATE LOGIN GIANGVIEN WITH PASSWORD = 'gvi123';
CREATE LOGIN GIAOVU WITH PASSWORD = 'gvu123';
CREATE LOGIN SINHVIEN WITH PASSWORD = 'SV123';

---- Tạo 3 user trên DATABASE
CREATE USER GIANGVIEN FOR LOGIN GIANGVIEN;
CREATE USER GIAOVU FOR LOGIN GIAOVU;
CREATE USER SINHVIEN FOR LOGIN SINHVIEN;

----kiểm tra 3 login chưa
SELECT name 
FROM sys.server_principals
WHERE name IN ('GIANGVIEN', 'GIAOVU', 'SINHVIEN');

----kiểm tra 3 user tạo chưa
SELECT name 
FROM sys.database_principals
WHERE name IN ('GIANGVIEN', 'GIAOVU', 'SINHVIEN');

-- ==================================================================
-- 2. Phân quyền cho các users trên database như sau
-- ==================================================================
-- 2.1 `GIAOVU` có quyền xem và chỉnh sửa (cập nhật) trên tất cả các bảng

--3.2.1 GIAOVU có quyền xem và chỉnh sửa (cập nhật) trên tất cả các bảng
GRANT SELECT, UPDATE ON SV_DETAI TO GIAOVU;
GRANT SELECT, UPDATE ON SINHVIEN TO GIAOVU;
GRANT SELECT, UPDATE ON HOIDONG_GV TO GIAOVU;
GRANT SELECT, UPDATE ON HOIDONG_DT TO GIAOVU;
GRANT SELECT, UPDATE ON HOIDONG TO GIAOVU;
GRANT SELECT, UPDATE ON HOCVI TO GIAOVU;
GRANT SELECT, UPDATE ON HOCHAM TO GIAOVU;
GRANT SELECT, UPDATE ON GV_UVDT TO GIAOVU;
GRANT SELECT, UPDATE ON GV_PBDT TO GIAOVU;
GRANT SELECT, UPDATE ON GV_HV_CN TO GIAOVU;
GRANT SELECT, UPDATE ON GV_HDDT TO GIAOVU;
GRANT SELECT, UPDATE ON GIAOVIEN TO GIAOVU;
GRANT SELECT, UPDATE ON DETAI_DIEM TO GIAOVU;
GRANT SELECT, UPDATE ON DETAI TO GIAOVU;
GRANT SELECT, UPDATE ON CHUYENNGANH TO GIAOVU;

----test GIAOVU XEM ĐƯỢC Bảng
EXECUTE AS USER = 'GIAOVU';
SELECT * FROM GIAOVIEN;
REVERT;

----test GIAOVU Cập Nhập được
EXECUTE AS USER = 'GIAOVU';
UPDATE GIAOVIEN 
SET TENGV = TENGV 
WHERE MSGV = '001';
REVERT;

-- 2.2 `GIANGVIEN`:
-- 2.2a Có quyền xem trên các bảng có liên quan đến thông tin GV, các đề tài mà GV hướng dẫn, phản biện hay làm uỷ viên, xem thông tin hội đồng và danh sách các đề tài hiện có.
-- 2.2b Có quyền cập nhật thông tin của mình.
-- 2.3 `SINHVIEN` có quyền xem thông tin của sinh viên, thông tin của hội đồng và danh sách các đề tài hiện có.
-- 2.4 Tất cả người dùng trên đều không có quyền xoá thông tin.

