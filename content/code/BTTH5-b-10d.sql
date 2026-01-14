-- Câu 10d. Xquery kiểm tra xem có tồn tại sinh viên tên ‘Lan’ trong trường CNTT
SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@Ten="Lan"]') as KetQua
FROM QuanLySV WHERE TenDH = 'DH CNTT'
GO
