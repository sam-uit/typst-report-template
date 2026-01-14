-- Câu 6. Xóa tên các sinh viên trường DH KHTN
UPDATE QuanLySV
SET ChiTietSV.modify('delete /THONGTINSV/sinhvien/@Ten')
WHERE TenDH = 'DH KHTN'
GO
