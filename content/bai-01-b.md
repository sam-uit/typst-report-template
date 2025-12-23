## B. AN TOÀN DỮ LIỆU

### 7. Backup (Sao Lưu) và Restore (Khôi Phục)

Hãy backup CSDL `AAA` thành 1 file `AAA.BAK`, sau đó xóa CSDL `AAA` và hãy khôi phục `AAA` nhờ vào `AAA.BAK`. 
Thực hiện bằng 2 cách: 

- Cách 1: Dùng giao diện.
  - Yêu cầu: Chụp màn hình các bước thực hiện (Chụp đúng phần cần thiết và rõ nét, có thể dùng công cụ Snipping Tool). 
- Cách 2: Dùng câu lệnh.
  - Yêu cầu: Dùng các lệnh SQL để thực hiện.

#### Cách 1: Giao Diện (SSMS)

##### Backup (Sao Lưu)

- Click chuột phải vào CSDL AAA > **Tasks** > **Back Up...**

![**Tasks** > **Back Up...**](assets/btth3-bai-1-a-7-1.png)

- Mục **Destination**: Chọn **Disk**, chọn đường dẫn lưu file `AAA.BAK`.

![**Destination**: Chọn **Disk**](assets/btth3-bai-1-a-7-2.png)

- Nhấn **OK**.
  - Màn hình thông báo "The backup of database 'AAA' completed successfully").

![Backup Completed Successfully](assets/btth3-bai-1-a-7-3.png)

##### Xóa DB

- Click chuột phải vào CSDL AAA -> **Delete**.
- Check vào ô **Close existing connections** (để ngắt các kết nối đang chạy).

![Xóa DB](assets/btth3-bai-1-a-7-4.png)

- Nhấn **OK**.

##### Restore (Khôi Phục)

- Click chuột phải vào thư mục **Databases** -> **Restore Database...**
- Chọn **Database** -> Nhấn nút **...** để duyệt file -> Chọn file `AAA.BAK` vừa tạo.

![Restore (Khôi Phục)](assets/btth3-bai-1-a-7-5.png)

- Nhấn **OK**.

![Restore (Khôi Phục) Hoàn Thành](assets/btth3-bai-1-a-7-6.png)

#### Cách 2: CLI

##### Backup (Sao Lưu)

##### Restore (Khôi Phục)
