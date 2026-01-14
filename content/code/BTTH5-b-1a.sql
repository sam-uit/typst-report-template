-- Câu 1. Xpath lấy Sinh viên có ID=10
SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@ID="10"]') AS KetQua
FROM QuanLySV WHERE TenDH = 'DH CNTT'
GO
