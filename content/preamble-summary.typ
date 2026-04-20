#import "../template/lib.typ": *

= TÓM TẮT NỘI DUNG
<tom-tat-noi-dung>


== MỤC TIÊU
<muc-tieu>

- Hiểu nguyên lý mã hoá khóa đối xứng (AES, DES), khóa công khai (RSA), hàm băm (SHA, MD5), chữ ký số.
- Sử dụng CrypTool 1 để mã hoá/giải mã, tạo và kiểm tra chữ ký số, sinh khóa RSA.
- Thực hành kiểm tra tính toàn vẹn bằng hash.
- Viết báo cáo phân tích dựa trên kết quả thực hành.

== LÝ THUYẾT NỀN TẢNG
<ly-thuyet-nen-tang>


=== 1. Mã hoá khóa đối xứng
<1-ma-hoa-khoa-doi-xung>

- Dùng một khóa duy nhất để mã hoá và giải mã.
- Thuật toán: AES, DES, 3DES.
- Nhanh nhưng khó phân phối khóa.

=== 2. Mã hoá khóa công khai (RSA)
<2-ma-hoa-khoa-cong-khai-rsa>

- Dùng 2 khóa (public/private).
- Dùng trong chữ ký số và trao đổi khóa.

=== 3. Hàm băm (Hash)
<3-ham-bam-hash>

- Tạo chuỗi dài cố định (128--256 bit).
- Không thể đảo ngược.
- Dùng để kiểm tra toàn vẹn dữ liệu.

=== 4. Chữ ký số
<4-chu-ky-so>

- Private key dùng để ký.
- Public key dùng để xác minh.
- Dùng để xác thực và chống chối bỏ.

== CHUẨN BỊ
<chuan-bi>

- Máy Windows 10/11.
- Cài phần mềm CrypTool 1.
- Tạo sẵn các đoạn văn bản để thử nghiệm.

== CÁC BƯỚC THỰC HÀNH
<cac-buoc-thuc-hanh>


=== Bước 1. Mã hoá & Giải mã bằng mã hoá đối xứng (AES/DES)
<buoc-1-ma-hoa-giai-ma-bang-ma-hoa-doi-xung-aes-des>

- Nhập văn bản: THIS IS A SECRET MESSAGE USED FOR SYMMETRIC ENCRYPTION DEMO.
- Encrypt → Symmetric (modern) → AES → nhập key: MyStrongKey123.
- Chọn mode ECB hoặc thay đổi CBC/CFB/OFB để quan sát khác biệt.
- Giải mã bằng Decrypt → Symmetric (modern) → AES với cùng key.

=== Bước 2. Hash (Kiểm tra toàn vẹn dữ liệu)
<buoc-2-hash-kiem-tra-toan-ven-du-lieu>

- Analysis → Hashes → chọn MD5, SHA-1, SHA-256 để tạo hash.
- Thay đổi 1 ký tự trong văn bản và tạo hash lại.
- Quan sát hiệu ứng Avalanche: hash thay đổi hoàn toàn.

=== Bước 3. Mã hoá khóa công khai RSA
<buoc-3-ma-hoa-khoa-cong-khai-rsa>

- Encrypt → Asymmetric → RSA → Generate Keys → chọn 1024 bit.
- Dùng Public Key để mã hoá văn bản.
- Dùng Private Key để giải mã.
- Thử dùng key 2048 bit và ghi nhận thay đổi tốc độ.

=== Bước 4. Chữ ký số (Digital Signature)
<buoc-4-chu-ky-so-digital-signature>

- Digitals Signatures → Create/Verify Signature → RSA Signature.
- Chọn văn bản + Private Key để tạo file chữ ký .sig.
- Verify Signature → chọn văn bản gốc + file .sig + Public Key.
- Thử sửa văn bản rồi kiểm tra lại chữ ký (kết quả INVALID).

=== Bước 5. Kiểm tra tính toàn vẹn & xác thực
<buoc-5-kiem-tra-tinh-toan-ven-xac-thuc>

- Người gửi gửi văn bản + hash.
- Người nhận tạo hash mới rồi so sánh.
- Nếu hash không khớp → dữ liệu bị thay đổi.

== CÂU HỎI BÁO CÁO
<cau-hoi-bao-cao>

+ Khác nhau giữa mã hoá đối xứng và bất đối xứng?
+ Hash dùng để làm gì? Vì sao không thể đảo ngược?
+ Vì sao sửa 1 ký tự khiến hash đổi toàn bộ?
+ Tại sao chữ ký số cần private key?
+ RSA có dùng để mã hoá file lớn không? Vì sao?
+ Chữ ký số khác mã hoá ở điểm nào?
+ Nhược điểm của mode ECB trong AES?

== TỔNG KẾT
<tong-ket>

- Sinh viên nắm quy trình mã hoá hiện đại.
- Biết sử dụng RSA để mã hoá và ký.
- Thực hành hash để kiểm tra toàn vẹn.
- Hiểu vai trò của khóa công khai & bí mật.
- Áp dụng CrypTool vào an toàn thông tin.
