# Các Công Cụ Phổ Biến

Trong quá trình phân tích và giám sát mã độc, việc theo dõi các tiến trình và kết nối mạng là cực kỳ quan trọng. Dưới đây là chức năng và cách sử dụng của 5 công cụ phổ biến:

## 1. Netstat

### Chức Năng

Là một công cụ dòng lệnh (command-line) tích hợp sẵn trên các hệ điều hành (Windows, Linux), giúp hiển thị các kết nối mạng TCP/UDP đang hoạt động, các cổng đang lắng nghe (listening ports), bảng định tuyến và các thống kê giao diện mạng.

### Cách Sử Dụng

- Mở Command Prompt (cmd) dưới quyền Quản trị viên (Administrator).
- Gõ lệnh `netstat -a` để xem tất cả các kết nối, hoặc `netstat -ano` để hiển thị thêm cột PID (Process ID).
- Từ PID này, bạn có thể đối chiếu với Task Manager để biết tiến trình nào đang lén lút kết nối ra Internet.

### Ví Dụ

- Đây là phiên bản trên macOS.

```shell
$ netstat -a
Active Internet connections (including servers)
Proto Recv-Q Send-Q  Local Address                                 Foreign Address                               (state)    
tcp4       0      0  192.168.10.14.64346    pnkula-ad-in-f10.https ESTABLISHED
tcp4       0      0  192.168.10.14.64347    pnkula-ad-in-f10.https ESTABLISHED
tcp4       0      0  192.168.10.14.64344    pnkulb-al-in-f10.https ESTABLISHED
tcp4       0      0  192.168.10.14.64345    pnkulb-al-in-f10.https ESTABLISHED
tcp4       0      0  192.168.10.14.64342    hkg12s36-in-f10..https ESTABLISHED
tcp4       0      0  192.168.10.14.64341    hkg12s36-in-f10..https ESTABLISHED
tcp4       0      0  192.168.10.14.64310    216.239.34.223.https   ESTABLISHED
tcp4       0      0  192.168.10.14.64309    52.123.130.14.https    ESTABLISHED
tcp4       0      0  192.168.10.14.64205    hkg12s36-in-f10..https ESTABLISHED
tcp4       0      0  192.168.10.14.64191    lb-140-82-113-25.https ESTABLISHED
tcp4       0      0  192.168.10.14.64148    lb-140-82-112-26.https ESTABLISHED
tcp4       0      0  192.168.10.14.64006    216.239.38.223.https   ESTABLISHED
tcp4       0      0  localhost.63978        localhost.64002        ESTABLISHED
tcp4       0      0  localhost.64002        localhost.63978        ESTABLISHED
tcp4       0      0  localhost.63448        localhost.64001        ESTABLISHED
tcp4       0      0  localhost.64001        localhost.63448        ESTABLISHED
tcp4       0      0  192.168.10.14.64000    151.101.65.242.https   ESTABLISHED
tcp4       0      0  localhost.63987        localhost.63994        ESTABLISHED
tcp4       0      0  localhost.63994        localhost.63987        ESTABLISHED
tcp4       0      0  192.168.10.14.63991    pnkula-af-in-f10.https ESTABLISHED
tcp4       0      0  localhost.63976        localhost.63990        ESTABLISHED
```

## 2. Fport

### Chức Năng

Là một công cụ dòng lệnh cũ của Foundstone, dùng để báo cáo tất cả các cổng TCP/IP và UDP đang mở và ánh xạ (map) chúng trực tiếp tới các tiến trình/ứng dụng đang chạy. Nó giúp phát hiện nhanh các cổng đang bị mã độc (như Trojan hay Backdoor) mở để lắng nghe.

### Cách Sử Dụng

- Chạy file `fport.exe` trong Command Prompt (yêu cầu quyền Admin).
- Màn hình sẽ trả về danh sách gồm Process Name, PID, Port và Protocol.

## 3. TCPView

### Chức Năng

Là công cụ đồ họa của bộ Sysinternals (Microsoft), cung cấp danh sách chi tiết và trực quan về tất cả các endpoint TCP và UDP trên hệ thống, bao gồm địa chỉ local/remote và trạng thái hiện tại của kết nối.

### Cách Sử Dụng

- Mở ứng dụng `Tcpview.exe`. Các kết nối mới tạo sẽ được tô màu xanh lá, kết nối bị đóng tô màu đỏ.
- Bạn có thể nhấp chuột phải vào một kết nối khả nghi để chọn "Close Connection" (đóng kết nối) hoặc "End Process" (buộc dừng tiến trình lây nhiễm).

## 4. CurrPorts Tool

### Chức Năng

Tương tự TCPView, đây là một phần mềm giám sát mạng (của NirSoft) hiển thị danh sách tất cả các cổng TCP/IP và UDP hiện đang mở trên máy tính.

### Cách Sử Dụng

- Khởi chạy `cports.exe`. Ứng dụng sẽ liệt kê chi tiết tên tiến trình, đường dẫn file thực thi, và thông tin version của phần mềm đang mở cổng. Người dùng có thể bôi đen các tiến trình độc hại, nhấn nút "Kill Processes" để đóng chúng, hoặc xuất báo cáo ra file HTML/XML để phân tích thêm.

## 5. Process Viewer (hoặc Process Explorer)

### Chức Năng

Là công cụ giám sát tiến trình nâng cao, cho phép theo dõi chi tiết cấu trúc tiến trình (tiến trình cha/con), tài nguyên CPU/RAM sử dụng, và các thư viện (DLL) đang được nạp vào bộ nhớ.

### Cách Sử Dụng

- Mở ứng dụng để xem cây tiến trình (Process Tree). Nếu phát hiện một tiến trình lạ ngụy trang thành file hệ thống (ví dụ `svchost.exe` nhưng chạy sai đường dẫn), bạn có thể click đúp vào để xem các luồng (threads), kiểm tra chữ ký số, hoặc gửi trực tiếp mã băm (hash) của tiến trình đó lên VirusTotal để quét mã độc.
