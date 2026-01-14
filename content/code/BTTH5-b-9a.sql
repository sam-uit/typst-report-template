-- Câu 9. Kiểm tra sinh viên có ID = 12
SELECT ChiTietSV.query('
  for $sv in /THONGTINSV/sinhvien
  where $sv/@ID = 12
  return $sv
') AS KetQua
FROM QuanLySV WHERE MSDH = 2
GO
