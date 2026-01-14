-- Câu 9. Kiểm tra xem có tồn tại sinh viên có ID là 12 trong trường KHTN không?
SELECT ChiTietSV.exist('/THONGTINSV/sinhvien[@ID="12"]') as KetQua
FROM QuanLySV WHERE TenDH = 'DH KHTN'
GO
