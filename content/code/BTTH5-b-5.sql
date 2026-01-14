-- Câu 5. Định dạng MSDH và TenDH
SELECT
   CAST(MSDH AS VARCHAR) + ' ' + TenDH AS ChiTietSV
FROM QuanLySV
FOR XML PATH('QuanLySV')
GO
