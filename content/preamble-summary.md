# TÓM TẮT

**Lưu ý an toàn & đạo đức:**

- Chỉ thực hiện bài thực hành này trên máy cá nhân, máy ảo hoặc môi trường lab được phép.
- Không áp dụng các kỹ thuật trong bài với hệ thống hay tài khoản không thuộc quyền quản lý của bạn.

## I. MỤC TIÊU

1. Hiểu khái niệm tấn công dò tìm mật khẩu chủ động (online password guessing / brute force).
2. Mô phỏng được quá trình thử mật khẩu nhiều lần đối với tài khoản Windows.
3. Cấu hình và đánh giá được Account Lockout Policy trên Windows để giảm rủi ro tấn công dò mật khẩu.
4. Sử dụng Event Viewer để phân tích log sự kiện đăng nhập: đăng nhập sai, khóa tài khoản.
5. Đề xuất được một số biện pháp phòng chống tấn công dò mật khẩu.

## II. MÔI TRƯỜNG & CHUẨN BỊ

1. Hệ điều hành: 01 máy Windows 10 hoặc Windows 11 (máy ảo hoặc máy thật đều được; khuyến khích dùng VM).
2. Tài khoản:
    - 01 tài khoản có quyền Administrator (ví dụ: AdminLab).
    - 01 tài khoản người dùng thường để làm “nạn nhân” (ví dụ: UserTest) với mật khẩu không quá khó nhớ (ví dụ: `P@ssw0rd123` – giảng viên chọn trước).
3. Công cụ tích hợp sẵn trên Windows:
    - Local Users and Groups (lusrmgr.msc).
    - Local Security Policy (secpol.msc).
    - Event Viewer (eventvwr.msc).

## III. KỊCH BẢN BÀI THỰC HÀNH

Sinh viên đóng vai kẻ tấn công có quyền truy cập vật lý tới máy Windows (hoặc đang ngồi trước máy của nạn nhân ở màn hình đăng nhập). Mục tiêu là dò tìm mật khẩu của tài khoản UserTest bằng cách thử nhiều mật khẩu (tấn công chủ động – online), kích hoạt cơ chế khóa tài khoản và quan sát log trên hệ thống.

## IV. CÁC BƯỚC THỰC HÀNH

### Bước 1. Kiểm tra / tạo tài khoản mục tiêu UserTest

- Đăng nhập Windows bằng tài khoản có quyền Administrator (ví dụ: AdminLab).
- Mở Computer Management: nhấn tổ hợp phím Windows + X → chọn Computer Management, hoặc nhấn Windows + R → gõ `compmgmt.msc` → Enter.
- Trong khung bên trái, chọn: System Tools → Local Users and Groups → Users.
- Kiểm tra xem đã có tài khoản UserTest hay chưa trong danh sách Users.

Nếu CHƯA có tài khoản UserTest:

- Chuột phải vào Users → chọn New User…
- User name: UserTest; Full name: User Test (tùy ý);
- Password: `P@ssw0rd123` (hoặc mật khẩu do giảng viên quy định);
- Bỏ chọn “User must change password at next logon” nếu không muốn thay đổi ở lần đăng nhập đầu tiên;
- Nhấn Create → Close.

Sinh viên ghi lại vào báo cáo: tên tài khoản nạn nhân (UserTest) và mật khẩu thật được sử dụng trong bài lab để đối chiếu.

### Bước 2. Cấu hình chính sách khóa tài khoản (Account Lockout Policy)

Mục tiêu: Khi có quá nhiều lần đoán sai mật khẩu, tài khoản sẽ tự động bị khóa.

- Mở Local Security Policy: nhấn Windows + R → gõ secpol.msc → Enter.
- Trong khung bên trái, chọn: Account Policies → Account Lockout Policy.
- Double-click vào Account lockout threshold → đặt giá trị là 3 invalid logon attempts → OK.
- Khi được hỏi thiết lập Reset account lockout counter after và Account lockout duration, đặt cả hai giá trị là 15 minutes (hoặc giá trị khác theo yêu cầu giảng viên).
- Kiểm tra lại các tham số: Account lockout duration = 15 minutes; Account lockout threshold = 3; Reset account lockout counter after = 15 minutes.

Sinh viên chụp màn hình cấu hình Account Lockout Policy để đưa vào báo cáo (Hình 1: Thiết lập Account Lockout Policy).

### Bước 3. Mô phỏng tấn công dò mật khẩu (từ màn hình đăng nhập)

Mục tiêu: Thử nhiều mật khẩu sai để kích hoạt cơ chế khóa tài khoản đã cấu hình ở bước 2.

- Đăng xuất khỏi phiên làm việc hiện tại bằng cách: Start → Sign out, hoặc nhấn Ctrl + Alt + Del → Sign out.
- Tại màn hình đăng nhập, chọn tài khoản UserTest.
- Thực hiện ít nhất 3 lần đăng nhập sai (theo threshold đã cấu hình):
- Lần 1: nhập mật khẩu sai (ví dụ: 123456) → Enter.
- Lần 2: nhập mật khẩu sai khác (ví dụ: User1234) → Enter.
- Lần 3: tiếp tục nhập mật khẩu sai (ví dụ: Password!) → Enter.
- Quan sát thông báo sau lần thử thứ 3: tài khoản UserTest sẽ bị khóa trong khoảng thời gian đã cấu hình (ví dụ 15 phút).

Sinh viên ghi lại trong báo cáo: sau bao nhiêu lần nhập sai thì tài khoản bị khóa và nội dung thông báo lỗi (tóm tắt hoặc ghi nguyên văn).

### Bước 4. Quan sát nhật ký sự kiện (Event Viewer)

Mục tiêu: Học cách phân tích log Security để phát hiện dấu hiệu tấn công dò mật khẩu.

- Đăng nhập lại Windows bằng tài khoản có quyền quản trị (ví dụ: AdminLab).
- Mở Event Viewer: nhấn Windows + R → gõ eventvwr.msc → Enter.
- Trong khung bên trái, chọn: Windows Logs → Security.
- Ở khung bên phải, chọn: Filter Current Log…
- Trong cửa sổ Filter, tại mục Event IDs nhập: 4625, 4740 rồi nhấn OK.
- Tìm các sự kiện có ID 4625 (An account failed to log on) liên quan đến tài khoản UserTest, mở chi tiết để xem lý do thất bại và nguồn đăng nhập (nếu có).
- Tìm sự kiện có ID 4740 (A user account was locked out) để xác định thời điểm tài khoản UserTest bị khóa và máy thực hiện hành động.

Sinh viên chụp ít nhất 01 hình log 4625 (đăng nhập thất bại của UserTest) và 01 hình log 4740 (tài khoản UserTest bị khóa) đưa vào báo cáo với chú thích hình rõ ràng.

Ghi lại vào báo cáo: tổng số lần đăng nhập thất bại (sự kiện 4625) trước khi tài khoản bị khóa và thời điểm tài khoản bị khóa (thời gian của sự kiện 4740).

### Bước 5. Thay đổi chính sách khóa tài khoản và so sánh

Mục tiêu: Thấy được mối liên hệ giữa cấu hình chính sách và mức độ an toàn.

- Mở lại Local Security Policy (secpol.msc).
- Vào Account Policies → Account Lockout Policy.
- Thay đổi Account lockout threshold, ví dụ từ 3 → 10 invalid logon attempts.
- Đăng xuất và lặp lại quá trình thử mật khẩu sai cho UserTest như ở Bước 3, đếm số lần nhập sai trước khi tài khoản bị khóa.
- Quan sát lại log trong Event Viewer để xem số lượng sự kiện 4625 và sự kiện 4740 thay đổi như thế nào so với cấu hình trước.

Sinh viên thảo luận trong báo cáo: khi threshold = 3, hệ thống nhạy như thế nào với tấn công dò mật khẩu? Khi threshold = 10, kẻ tấn công có lợi hơn ra sao và người dùng hợp lệ có dễ bị khóa tài khoản hay không.

## V. CÂU HỎI BÁO CÁO

1. Phân biệt tấn công dò mật khẩu online (chủ động) và tấn công offline (thụ động).
2. Kể tên ít nhất 3 kỹ thuật tấn công mật khẩu online phổ biến (mô tả ngắn, không cần nêu cụ thể công cụ).
3. Phân tích hệ quả khi Account lockout threshold đặt quá thấp (ví dụ 3) đối với người dùng hợp lệ và kẻ tấn công.
4. Phân tích rủi ro khi Account lockout threshold đặt quá cao (ví dụ 50).
5. Mô tả quy trình xử lý của người quản trị khi quan sát thấy:
    - Nhiều log 4625 liên tục cho cùng một tài khoản.
    - Log 4740 xuất hiện thường xuyên cho một hoặc nhiều tài khoản.
6. Đề xuất tối thiểu 3 biện pháp để giảm rủi ro tấn công dò mật khẩu (gợi ý: mật khẩu mạnh, khóa tài khoản, MFA, hạn chế truy cập từ xa, v.v.).
