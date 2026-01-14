-- Câu 8. Kiểm tra kết quả, tên sinh viên thứ 2 đổi thành 'Binh'
SELECT ChiTietSV.query('/THONGTINSV/sinhvien') AS KetQua
FROM QuanLySV
WHERE TenDH = 'DH CNTT'
GO
