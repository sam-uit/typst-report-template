-- Câu 6. Kiểm tra kết quả, thuộc tính Ten đã bị xóa
SELECT ChiTietSV.query('/THONGTINSV/sinhvien') AS KetQua
FROM QuanLySV WHERE TenDH = 'DH KHTN'
GO
