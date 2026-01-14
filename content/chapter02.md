# B. Thực Hành

Hãy sử dụng Xpath, Xquery để thực hiện các yêu cầu sau:

- Câu 1: Viết lệnh Xpath lấy Sinh viên có `ID=10` và Lệnh Xpath lấy sinh viên ở vị trí cuối cùng ở trường CNTT.
- Câu 2: Viết lệnh trả về tất cả các nút từ nút gốc là `THONGTINSV`.
- Câu 3: Viết lệnh Xquery trả về danh sách sinh viên có `ID < 12` với `MSDH = 1`.
- Câu 4: Viết lệnh Xquery trả về danh sách sinh viên sắp xếp theo tên với `MSDH=2`.
- Câu 5: Viết lệnh Xquery trả về `MSDH` và `TenDH` theo định dạng sau:

    ```xml
    <!-- Dữ liệu mẫu -->
    <QuanLySV>
    <ChiTietSV>1 DH CNTT</ChiTietSV>
    </QuanLySV>
    ```

- Câu 6: Viết lệnh Xquery xóa tên các sinh viên trường DH KHTN.
- Câu 7: Viết lệnh Xquery trả về thông tin các sinh viên có tên là '`Nam`' hoặc '`Thanh`'.
- Câu 8: Viết lệnh Xquery thay đổi tên sinh viên thứ 2 thành tên '`Binh`' trong trường `CNTT`.
- Câu 9: Viết lệnh Xquery kiểm tra xem có tồn tại sinh viên có `ID` là 12 trong trường `KHTN` không? (Nếu có trả về 1, nếu không thì trả về 0).
- Câu 10: Viết lệnh Xquery kiểm tra xem có tồn tại sinh viên tên '`Lan`' trong trường `CNTT` không? (Nếu có trả về 1, nếu không thì trả về 0). Và `INSERT` thêm vào `THONGTINSV`:

    ```xml
    <!-- Dữ liệu mẫu -->
    <sinhvien ID="15" Ten="Lan">
    <monhoc ID="10" Ten="Toan Roi Rac" />
    <monhoc ID="11" Ten="Lap Trinh C#" />
    <monhoc ID="12" Ten="CSDL Nang Cao" />
    </sinhvien>
    ```

- Câu 11: Thực hiện phép nối bằng các lệnh Xquery như một câu truy vấn trong SQL để trả về thông tin là sinh viên nào học khóa học tên là gì, sinh viên nào học môn học gì?

