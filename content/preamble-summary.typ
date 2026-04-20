#import "../template/lib.typ": *

= TÓM TẮT
<tom-tat>


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
