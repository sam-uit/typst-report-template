-- Xquery kiểm tra xem có tồn tại sinh viên tên ‘Lan’ trong trường CNTT
SELECT ChiTietSV.exist('/THONGTINSV/sinhvien[@Ten="Lan"]') as KetQua
FROM QuanLySV WHERE TenDH = 'DH CNTT'
GO
