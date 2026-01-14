-- Câu 10. INSERT dữ liệu mẫu vào THONGTINSV
UPDATE QuanLySV
SET ChiTietSV.modify('
  insert <sinhvien ID="15" Ten="Lan">
            <monhoc ID="10" Ten="Toan Roi Rac" />
            <monhoc ID="11" Ten="Lap Trinh C#" />
            <monhoc ID="12" Ten="CSDL Nang Cao" />
         </sinhvien>
  as last into (/THONGTINSV)[1]
')
WHERE TenDH = 'DH CNTT'
GO
