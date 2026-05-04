#import "../template/lib.typ": *

= PHẦN A. QUAN SÁT ỨNG DỤNG VÀ TIẾN TRÌNH TRONG RAM
<phan-a-quan-sat-ung-dung-va-tien-trinh-trong-ram>


== A1 -- Mở Task Manager
<a1-mo-task-manager>

+ Nhấn tổ hợp phím: #strong[Ctrl + Shift + Esc].
+ Chọn tab "#strong[Processes]".
+ Chụp màn hình lại (những ứng dụng nào đang sử dụng CPU, Ram, đĩa cứng…).
+ Mục tiêu: Xác định ứng dụng nào đang chạy và sử dụng RAM.

Sử dụng Task Manager: #strong[Processes].

- Thông tin từng tiến trình và lượng CPU/RAM sử dụng tương ứng.

#figure(image("assets/a1-1.png"),
  caption: [
    A1. Task Manager - Processes
  ]
)

Sử dụng Task Manager: #strong[Performance].

- Thông tin sử dụng CPU/RAM tổng quan cho toàn bộ các tiến trình.

#figure(image("assets/a1-2.png"),
  caption: [
    A1. Task Manager - Performance
  ]
)

Sử dụng Resource Monitor: #strong[Overview].

- Thông tin sử dụng CPU/Disk/Memory tổng quan với nhiều thông tin chi tiết hơn.

#figure(image("assets/a1-3.png"),
  caption: [
    A1. Resource Monitor - Overview
  ]
)

== A2 -- Sắp Xếp Theo Lượng RAM
<a2-sap-xep-theo-luong-ram>

+ Tại tab "#strong[Processes]", nhấn vào cột #strong[Memory] để sắp xếp giảm dần.
+ Ghi lại 5 tiến trình chiếm RAM nhiều nhất.
+ Chụp màn hình.

5 tiến trình sử dụng nhiều RAM nhất:

#figure(image("assets/a2-1.png"),
  caption: [
    A2. Task Manager - Processes
  ]
)

#figure(
table(
  columns: (10%, 20%, 25%,  15%, 30%),
  align: (center, left, left, right, left),
  [STT], [Tiến Trình], [User Name], [RAM (K)], [Miêu Tả],
  [1], [`svchost.exe`], [LOCAL SERVICE], [4,752], [Host Process for Windows Services],
  [2], [`iexplorer.exe`], [uit], [4,392], [Internet Explorer],
  [3], [`spoolsv.exe`], [SYSTEM], [3,984], [Spooler Subsystem App],
  [4], [`iexplorer.exe`], [uit], [3,976], [Internet Explorer],
  [5], [`services.exe`], [SYSTEM], [3,896], [Services and Controller app]
),
caption: [A2. 5 Tiến Trình Sử Dụng Nhiều RAM Nhất]
)

== A3 -- Quan Sát Tiến Trình Chi Tiết
<a3-quan-sat-tien-trinh-chi-tiet>

+ Chuyển sang tab "#strong[Details]".
+ Quan sát #strong[PID -- Process ID].
+ Ghi lại 3 PID của các tiến trình lạ hoặc không rõ chức năng. Tìm hiểu trên mạng Internet để xem có thể biết các tiến trình đó là tiến trình gì?

Sử dụng Resource Monitor:

#figure(image("assets/a3-1.png"),
  caption: [
    A3. Quan Sát Tiến Trình Chi Tiết
  ]
)

#figure(
table(
  columns: (10%, 15%, 15%, 25%, 35%),
  align: (center, left, right, left, left),
  [STT], [Tiến Trình], [PID], [Miêu Tả], [Thông Tin Thêm],
  [1], [`vdagent.exe`], [1712], [Spice Agent], [SPICE Guest Agent (Máy này là máy ảo - VM)],
  [2], [`lsass.exe`], [436], [Local Security Authority Process], [Enforcing security policies, managing user logins, password changes, and creating access tokens],
  [3], [`svchost.exe (secsvcs)`], [2216], [Host Process for Windows Services], [Security Service group]
),
caption: [A3. Quan Sát Tiến Trình Chi Tiết]
)
