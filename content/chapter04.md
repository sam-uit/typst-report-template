# Bước 4. Quan Sát Nhật Ký Sự Kiện (Event Viewer)

## Mục Tiêu

- Học cách phân tích log Security để phát hiện dấu hiệu tấn công dò mật khẩu.

## Hướng Dẫn

- Đăng nhập lại Windows bằng tài khoản có quyền quản trị (ví dụ: `AdminLab`).
- Mở Event Viewer: nhấn Windows + R → gõ `eventvwr.msc` → Enter.
- Trong khung bên trái, chọn: Windows Logs → Security.
- Ở khung bên phải, chọn: Filter Current Log…
- Trong cửa sổ Filter, tại mục Event IDs nhập: `4625,4740` rồi nhấn OK.
- Tìm các sự kiện có ID `4625` (*An account failed to log on*) liên quan đến tài khoản `UserTest`, mở chi tiết để xem lý do thất bại và nguồn đăng nhập (nếu có).
- Tìm sự kiện có ID `4740` (*A user account was locked out*) để xác định thời điểm tài khoản `UserTest` bị khóa và máy thực hiện hành động.

## Thực Hiện

Lưu ý:

- Windows 7 mặc định không ghi nhận event id 4625.
    - Cần sử dụng **Local Security Policy** để bật chức năng **Audit Logon**.
        - **Security Settings** → **Advanced Audit Policy Configuration** → **System Audit Policies - Local Group Policy Object** → **Logon/Logoff** → **Audit Logon**.
    - Khi đó, event 4740 sẽ không được sử dụng nữa.
    - Các thông báo liên quan đến sai mật khẩu khi đăng nhập, hoặc tài khoản bị khóa đều là id 4625, nhưng có **Task Category** là khác.
    - Các **Task Category** cho event id 4625 tương ứng:
        - Sai mật khẩu: **Logon**.
        - Khóa tài khoản: **Account Lockout**.

### Event ID 4625: Logon

- Có tối đa 3 event của event id 4625: Logon.
    - Thông báo: "*Unknown user name or bad password.*"
    - Tài khoản `UserTest` bị nhập sai mật khẩu.
    - Điều này thể hiện rằng:
        - Người dùng đã nhập sai mật khẩu 3 lần.

![Bước 4. Các Event ID 4625: Logon](assets/b4-4625-01.png)

- Nội dung của event 4625: Logon ở dạng XML:
    - Chứa đủ các thông tin về:
        - Tên tài khoản bị khóa: `UserTest`
        - Thời gian xảy ra.
        - Và các thông tin khác.

```xml
- <Event xmlns="http://schemas.microsoft.com/win/2004/08/events/event">
    - <System>
        <Provider Name="Microsoft-Windows-Security-Auditing" Guid="{54849625-5478-4994-A5BA-3E3B0328C30D}" />
        <EventID>4625</EventID>
        <Version>0</Version>
        <Level>0</Level>
        <Task>12544</Task>
        <Opcode>0</Opcode>
        <Keywords>0x8010000000000000</Keywords>
        <TimeCreated SystemTime="2026-03-31T14:02:15.386523400Z" />
        <EventRecordID>3358</EventRecordID>
        <Correlation />
        <Execution ProcessID="432" ThreadID="468" />
        <Channel>Security</Channel>
        <Computer>uit-lab</Computer>
        <Security />
    </System>
    - <EventData>
        <Data Name="SubjectUserSid">S-1-5-18</Data>
        <Data Name="SubjectUserName">UIT-LAB$</Data>
        <Data Name="SubjectDomainName">WORKGROUP</Data>
        <Data Name="SubjectLogonId">0x3e7</Data>
        <Data Name="TargetUserSid">S-1-0-0</Data>
        <Data Name="TargetUserName">UserTest</Data>
        <Data Name="TargetDomainName">uit-lab</Data>
        <Data Name="Status">0xc000006d</Data>
        <Data Name="FailureReason">%%2313</Data>
        <Data Name="SubStatus">0xc000006a</Data>
        <Data Name="LogonType">2</Data>
        <Data Name="LogonProcessName">User32</Data>
        <Data Name="AuthenticationPackageName">Negotiate</Data>
        <Data Name="WorkstationName">UIT-LAB</Data>
        <Data Name="TransmittedServices">-</Data>
        <Data Name="LmPackageName">-</Data>
        <Data Name="KeyLength">0</Data>
        <Data Name="ProcessId">0xfc</Data>
        <Data Name="ProcessName">C:\Windows\System32\winlogon.exe</Data>
        <Data Name="IpAddress">127.0.0.1</Data>
        <Data Name="IpPort">0</Data>
    </EventData>
</Event>
```

### Event ID 4625: Account Lockout

- Ngay sau đó là các event id 4625: Account Lockout.
    - Thông báo: "*Account locked out.*"
    - Tài khoản `UserTest` bị khóa sau 3 lần sai mật khẩu.

![Bước 4. Các Event ID 4625: Account Lockout](assets/b4-4625-02.png)

- Nội dung của event 4625: Account Lockout ở dạng XML:
    
```xml
- <Event xmlns="http://schemas.microsoft.com/win/2004/08/events/event">
    - <System>
        <Provider Name="Microsoft-Windows-Security-Auditing" Guid="{54849625-5478-4994-A5BA-3E3B0328C30D}" /> 
        <EventID>4625</EventID> 
        <Version>0</Version> 
        <Level>0</Level> 
        <Task>12546</Task> 
        <Opcode>0</Opcode> 
        <Keywords>0x8010000000000000</Keywords> 
        <TimeCreated SystemTime="2026-03-31T14:02:25.433398400Z" /> 
        <EventRecordID>3361</EventRecordID> 
        <Correlation /> 
        <Execution ProcessID="432" ThreadID="468" /> 
        <Channel>Security</Channel> 
        <Computer>uit-lab</Computer> 
        <Security /> 
    </System>
    - <EventData>
        <Data Name="SubjectUserSid">S-1-5-18</Data> 
        <Data Name="SubjectUserName">UIT-LAB$</Data> 
        <Data Name="SubjectDomainName">WORKGROUP</Data> 
        <Data Name="SubjectLogonId">0x3e7</Data> 
        <Data Name="TargetUserSid">S-1-0-0</Data> 
        <Data Name="TargetUserName">UserTest</Data> 
        <Data Name="TargetDomainName">uit-lab</Data> 
        <Data Name="Status">0xc0000234</Data> 
        <Data Name="FailureReason">%%2307</Data> 
        <Data Name="SubStatus">0x0</Data> 
        <Data Name="LogonType">2</Data> 
        <Data Name="LogonProcessName">User32</Data> 
        <Data Name="AuthenticationPackageName">Negotiate</Data> 
        <Data Name="WorkstationName">UIT-LAB</Data> 
        <Data Name="TransmittedServices">-</Data> 
        <Data Name="LmPackageName">-</Data> 
        <Data Name="KeyLength">0</Data> 
        <Data Name="ProcessId">0xfc</Data> 
        <Data Name="ProcessName">C:\Windows\System32\winlogon.exe</Data> 
        <Data Name="IpAddress">127.0.0.1</Data> 
        <Data Name="IpPort">0</Data> 
    </EventData>
</Event>
```

### Event ID 4740
    - Tài khoản `UserTest` bị khóa.
    - "A user account was locked out."
    - Account Name: UserTest
    - Logged: 3/31/2026 9:40:11 PM

![Bước 4. Event ID 4740](assets/b4-4740.png)

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
