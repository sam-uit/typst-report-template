-- Câu 8. Thay đổi tên sinh viên thứ 2 thành tên 'Binh' trong trường CNTT
UPDATE QuanLySV
SET ChiTietSV.modify('replace value of (/THONGTINSV/sinhvien)[2]/@Ten with "Binh"')
WHERE TenDH = 'DH CNTT'
GO
