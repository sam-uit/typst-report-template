-- NHOM 2
-- IE103
-- BTTH2
-- Phần 2
-- B. STORED PROCEDURES với tham số VÀO và RA
-- NOTE: A Batch/Top-Down processing Script.

-- ================================================================
-- 2A.1
-- Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH.
-- Trước khi insert dữ liệu cần kiểm tra MSHH đã tồn tại trong table HOCHAM chưa,
-- nếu chưa thì trả về giá trị 0.
-- ================================================================

CREATE OR ALTER PROCEDURE sp_CountGVTheoHocVi
    @TenHV NVARCHAR(20),
    @SOGV INT OUTPUT
AS
BEGIN
    SET @SOGV = 0;

    DECLARE @MSHV_HOCVI INT;
    SELECT @MSHV_HOCVI = MSHV
    FROM HOCVI
    WHERE TENHV = @TenHV;

    IF @MSHV_HOCVI IS NOT NULL
    BEGIN
        SELECT @SOGV = COUNT(DISTINCT MSGV)
        FROM GV_HV_CN
        WHERE MSHV = @MSHV_HOCVI;
    end;
end;
GO

-- ================================================================
-- 2A.2
-- Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH.
-- Trước khi insert dữ liệu cần kiểm tra MSGV trong table GIAOVIEN có trùng không,
-- nếu trùng thì trả về giá trị 0.
-- ================================================================

CREATE OR ALTER PROCEDURE SP_DiemTBDeTai
    @MSDT CHAR(6),
    @DIEMTRUNGBINH FLOAT OUTPUT
AS
BEGIN
    SET @DIEMTRUNGBINH = 0;

    SELECT @DIEMTRUNGBINH = AVG(DIEM)
    FROM (
        SELECT DIEM FROM GV_HDDT WHERE MSDT = @MSDT
        UNION ALL
        SELECT DIEM FROM GV_PBDT WHERE MSDT = @MSDT
        UNION ALL
        SELECT DIEM FROM GV_UVDT WHERE MSDT = @MSDT
    ) AS ALLDIEM;

    IF @DIEMTRUNGBINH IS NULL
    BEGIN
        SET @DIEMTRUNGBINH = 0;
    END
END
GO

-- ================================================================
-- 2A.3
-- Giống (1) và (2) kiểm tra xem MSGV có trùng không? MSHH có tồn tại chưa?
-- Nếu MSGV trùng thì trả về 0. Nếu MSHH chưa tồn tại trả về 1,
-- ngược lại cho insert dữ liệu
-- ================================================================

CREATE OR ALTER PROCEDURE sp_TimGVTheoTen @TENGV NVARCHAR(30),
                                 @SOLUONGGV INT OUTPUT,
                                 @DS_SDT VARCHAR(100) OUTPUT
AS
BEGIN
    SET @DS_SDT = '';
    -- DEM SO LUONG GIAO VIEN TRUNG TEN
    SELECT @SOLUONGGV = COUNT(MSGV)
    FROM GIAOVIEN
    WHERE TENGV = @TENGV;
end
    -- KIEM TRA SO LUONG GIAO VIEN VA TRA VE THONG TIN TUONG UNG
    IF @SOLUONGGV > 0
        BEGIN
            SELECT @DS_SDT = STRING_AGG(SODT, ', ')
            FROM GIAOVIEN
            WHERE TENGV = @TENGV;
        end
    ELSE
        BEGIN
            SET @SOLUONGGV = 0;
            SET @DS_SDT = '';
        end;
GO

-- ================================================================
-- 2A.4
-- Đưa vào MSDT cũ, TENDT mới.
-- Hãy cập nhật tên đề tài mới với mã đề tài cũ không đổi nếu không tìm thấy trả về 0,
-- ngược lại cập nhật và trả về 1
-- ================================================================

CREATE OR ALTER PROCEDURE sp_DiemTBTheoHD @MSHD INT,
                                 @DIEM_TB FLOAT OUTPUT
AS
BEGIN
    SET @DIEM_TB = 0;
    SELECT @DIEM_TB = AVG(T2.DIEM) FROM HOIDONG_DT T1
    JOIN (
        SELECT MSDT, DIEM FROM GV_HDDT
        UNION ALL
        SELECT MSDT, DIEM FROM GV_PBDT
        UNION ALL
        SELECT MSDT, DIEM FROM GV_UVDT
    ) AS T2 ON T1.MSDT = T2.MSDT
    WHERE T1.MSHD = @MSHD
    GROUP BY T1.MSDT;
end
go

-- ================================================================
-- 2A.5
-- Tham số đưa vào MSSV, TENSV mới, DIACHI mới.
-- Hãy cập nhật sinh viên trên với MSSV không đổi,
-- nếu không tìm thấy trả về 0,
-- ngược lại cập nhật và trả về 1
-- ================================================================

CREATE OR ALTER PROCEDURE sp_ThongTinDeTaiGV @TENGV NVARCHAR(30),
                                    @SoDT_HD INT OUTPUT,
                                    @SoDT_PB INT OUTPUT
AS
BEGIN
SET @SoDT_HD = 0;
SET @SoDT_PB = 0;

DECLARE @SoLuong_GV_TrungTen INT;
SET @SoLuong_GV_TrungTen = 0;

-- Kiểm tra danh sách giáo viên xem có trùng tên không
SELECT @SoLuong_GV_TrungTen = Count(MSGV) FROM GIAOVIEN WHERE TENGV = @TENGV

-- Nếu là 1: không trùng tên.
-- Nếu là 2 trở lên: trùng tên -> Lỗi
-- Nếu là 0: không tồn tại giáo viên có tên này
IF @SoLuong_GV_TrungTen = 1
    BEGIN
        -- Lấy MSGV từ khi chỉ có 1 record duy nhất
        DECLARE  @MSGV INT;
        SELECT @MSGV = MSGV FROM GIAOVIEN WHERE TENGV = @TENGV

        -- Đếm số lượng đề tài hướng dẫn và phản biện
        SELECT @SoDT_HD = Count(MSDT) FROM GV_HDDT WHERE MSGV = @MSGV
        SELECT @SoDT_PB = COUNT(MSDT) FROM GV_PBDT WHERE MSGV = @MSGV
    end
ELSE IF @SoLuong_GV_TrungTen >= 2
    BEGIN
        THROW 51000, N'Trùng tên giáo viên', 2;
    end
ELSE
    BEGIN
        THROW 51000, N'Không tìm thấy giáo viên', 1;
    end
end
GO
