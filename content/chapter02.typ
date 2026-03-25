#import "../template/lib.typ": *

= PHẦN 2. KIỂM TRA THÔNG TIN HỆ THỐNG
<phan-2-kiem-tra-thong-tin-he-thong>


== Bước 1. Kiểm tra cấu hình hệ thống
<buoc-1-kiem-tra-cau-hinh-he-thong>

Gõ lệnh: `systeminfo`

Quan sát:

- Hệ điều hành: Microsoft Windows 7 Ultimate
- Phiên bản OS: 6.1.7601 Service Pack 1 Build 7601
- RAM: 2,045 MB
- Thời gian cài đặt hệ điều hành: 3/24/2026, 8:24:48 PM
- Các bản vá đã cài (hotfix):
  - KB2534111
  - KB976902

```ini
C:\Windows\system32>systeminfo

Host Name:                 UIT-LAB
OS Name:                   Microsoft Windows 7 Ultimate
OS Version:                6.1.7601 Service Pack 1 Build 7601
OS Manufacturer:           Microsoft Corporation
OS Configuration:          Standalone Workstation
OS Build Type:             Multiprocessor Free
Registered Owner:          uit
Registered Organization:
Product ID:                00426-292-0000007-85191
Original Install Date:     3/24/2026, 8:24:48 PM
System Boot Time:          3/25/2026, 4:05:58 PM
...
System Locale:             en-us;English (United States)
Input Locale:              en-us;English (United States)
Time Zone:                 (UTC+08:00) Kuala Lumpur, Singapore
Total Physical Memory:     2,045 MB
Available Physical Memory: 1,552 MB
...
Hotfix(s):                 2 Hotfix(s) Installed.
                           [01]: KB2534111
                           [02]: KB976902
...
```

#figure(image("assets/p2-b1.png"),
  caption: [
    Phần 2. Bước 1. Kiểm tra cấu hình hệ thống
  ]
)

== Bước 2. Kiểm tra tiến trình đang chạy
<buoc-2-kiem-tra-tien-trinh-dang-chay>

+ Nhấn Ctrl + Shift + Esc để mở Task Manager.
+ Chụp màn hình tab Processes.
+ Nếu thấy tiến trình lạ → ghi chú.

Tiến trình lạ:

- `spice-webdavd`:
  - Đây không phải là tiến trình cài đặt sẵn theo Windows.
  - Đây là một tiến trình hỗ trợ máy ảo chia sẻ file với máy thật (UTM trên macOS).

#figure(image("assets/p2-b2.png"),
  caption: [
    Phần 2. Bước 2. Kiểm tra tiến trình đang chạy
  ]
)

== Bước 3. Kiểm tra phần mềm khởi động cùng Windows
<buoc-3-kiem-tra-phan-mem-khoi-dong-cung-windows>

+ Trong Task Manager → tab Startup.
+ Đánh dấu ứng dụng không cần thiết.

Do đây là hệ điều hành Windows 7:

- Thẻ Startup chưa có trong Task Manager.
- Mà thuộc System Configuration (`msconfig`).
- Hiện tại, không có ứng dụng không cần thiết.

#figure(image("assets/p2-b3.png"),
  caption: [
    Phần 2. Bước 3. Kiểm tra phần mềm khởi động cùng Windows
  ]
)
