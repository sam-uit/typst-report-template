#import "../template/lib.typ": *

= PHẦN 4. KIỂM TRA CHIA SẺ FILE VÀ RỦI RO SMB
<phan-4-kiem-tra-chia-se-file-va-rui-ro-smb>


== Bước 1. Liệt kê thư mục chia sẻ
<buoc-1-liet-ke-thu-muc-chia-se>

- Trong CMD gõ: `net share`
- Quan sát:
  - `ADMIN$` → chia sẻ hệ thống (không vấn đề)
  - `C$` → chia sẻ hệ thống
  - Nếu thấy `D:\Share` hoặc thư mục cá nhân đang share → rủi ro

SMB:

- Chia sẻ hệ thống:
  - `C$`
  - `ADMIN$`
  - `IPC$`
- Chia sẻ mức User:
  - `Users`

```
C:\Windows\system32>net share

Share name   Resource                        Remark

-------------------------------------------------------------------------------
C$           C:\                             Default share
IPC$                                         Remote IPC
ADMIN$       C:\Windows                      Remote Admin
Users        C:\Users
The command completed successfully.
```

#figure(image("assets/p4-b1.png"),
  caption: [
    Phần 4. Bước 1. Liệt kê thư mục chia sẻ
  ]
)

== Bước 2. Kiểm tra xem User có đặt mật khẩu hay không
<buoc-2-kiem-tra-xem-user-co-dat-mat-khau-hay-khong>

+ Gõ: `net user <tên_user>`
+ Kiểm tra:
  - Password required: Yes
  - Password never expires: NO
  - Nếu Password never expires = YES → rủi ro.

Quan sát:

- Account active: Yes
- Password required: No.~Không có mật khẩu, người dùng môi trường lab.

```
C:\Windows\system32>net user uit
User name                    uit
Full Name
Comment
User's comment
Country code                 000 (System Default)
Account active               Yes
Account expires              Never

Password last set            3/24/2026 8:24:42 PM
Password expires             Never
Password changeable          3/24/2026 8:24:42 PM
Password required            No
User may change password     Yes

Workstations allowed         All
Logon script
User profile
Home directory
Last logon                   3/25/2026 4:06:07 PM

Logon hours allowed          All

Local Group Memberships      *Administrators       *HomeUsers
Global Group memberships     *None
The command completed successfully.
```

#figure(image("assets/p4-b2.png"),
  caption: [
    Phần 4. Bước 2. Kiểm tra xem User có đặt mật khẩu hay không
  ]
)
