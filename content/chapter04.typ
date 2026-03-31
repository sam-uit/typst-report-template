#import "../template/lib.typ": *

= Bước 4. Quan Sát Nhật Ký Sự Kiện (Event Viewer)
<buoc-4-quan-sat-nhat-ky-su-kien-event-viewer>

Mục Tiêu:

- Học cách phân tích log Security để phát hiện dấu hiệu tấn công dò mật khẩu.

Hướng Dẫn:

- Đăng nhập lại Windows bằng tài khoản có quyền quản trị (ví dụ: `AdminLab`).
- Mở Event Viewer: nhấn Windows + R → gõ `eventvwr.msc` → Enter.
- Trong khung bên trái, chọn: Windows Logs → Security.
- Ở khung bên phải, chọn: Filter Current Log…
- Trong cửa sổ Filter, tại mục Event IDs nhập: `4625,4740` rồi nhấn OK.
- Tìm các sự kiện có ID `4625` (#emph[An account failed to log on]) liên quan đến tài khoản `UserTest`, mở chi tiết để xem lý do thất bại và nguồn đăng nhập (nếu có).
- Tìm sự kiện có ID `4740` (#emph[A user account was locked out]) để xác định thời điểm tài khoản `UserTest` bị khóa và máy thực hiện hành động.

Thực Hiện:

- Event ID 4740:
  - Tài khoản `UserTest` bị khóa.
  - "A user account was locked out."
  - Account Name: UserTest
  - Logged: 3/31/2026 9:40:11 PM

#figure(image("assets/b4-4740.png"),
  caption: [
    Bước 4. Event ID 4740
  ]
)

- Chi tiết của event 4740 ở dạng XML:

```xml
- <Event xmlns="http://schemas.microsoft.com/win/2004/08/events/event">
    - <System>
        <Provider Name="Microsoft-Windows-Security-Auditing" Guid="{54849625-5478-4994-A5BA-3E3B0328C30D}" />
        <EventID>4740</EventID>
        <Version>0</Version>
        <Level>0</Level>
        <Task>13824</Task>
        <Opcode>0</Opcode>
        <Keywords>0x8020000000000000</Keywords>
        <TimeCreated SystemTime="2026-03-31T13:40:11.642382800Z" />
        <EventRecordID>3334</EventRecordID>
        <Correlation />
        <Execution ProcessID="432" ThreadID="468" />
        <Channel>Security</Channel>
        <Computer>uit-lab</Computer>
        <Security />
    </System>
    - <EventData>
        <Data Name="TargetUserName">UserTest</Data>
        <Data Name="TargetDomainName">UIT-LAB</Data>
        <Data Name="TargetSid">S-1-5-21-246133735-4113561269-1434406650-1003</Data>
        <Data Name="SubjectUserSid">S-1-5-18</Data>
        <Data Name="SubjectUserName">UIT-LAB$</Data>
        <Data Name="SubjectDomainName">WORKGROUP</Data>
        <Data Name="SubjectLogonId">0x3e7</Data>
    </EventData>
  </Event>
```
