-- Trả về danh sách sinh viên sắp xếp theo tên với MSDH = 2
SELECT ChiTietSV.query('
  for $sv in /THONGTINSV/sinhvien
  order by $sv/@Ten
  return $sv
') as KetQua
FROM QuanLySV WHERE MSDH = 2
GO
