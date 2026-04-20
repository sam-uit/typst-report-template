# TÓM TẮT

## MỤC TIÊU

- Hiểu nguyên lý mã hoá khóa đối xứng (AES, DES), khóa công khai (RSA), hàm băm
(SHA, MD5), chữ ký số.
- Sử dụng CrypTool 1 để mã hoá/giải mã, tạo và kiểm tra chữ ký số, sinh khóa RSA.
- Thực hành kiểm tra tính toàn vẹn bằng hash.
- Viết báo cáo phân tích dựa trên kết quả thực hành.

## LÝ THUYẾT NỀN TẢNG

### 1. Mã hoá khóa đối xứng

- Dùng một khóa duy nhất để mã hoá và giải mã.
- Thuật toán: AES, DES, 3DES.
- Nhanh nhưng khó phân phối khóa.

### 2. Mã hoá khóa công khai (RSA)

- Dùng 2 khóa (public/private).
- Dùng trong chữ ký số và trao đổi khóa.

### 3. Hàm băm (Hash)

- Tạo chuỗi dài cố định (128–256 bit).
- Không thể đảo ngược.
- Dùng để kiểm tra toàn vẹn dữ liệu.

### 4. Chữ ký số

- Private key dùng để ký.
- Public key dùng để xác minh.
- Dùng để xác thực và chống chối bỏ.

## CHUẨN BỊ

- Máy Windows 10/11.
- Cài phần mềm CrypTool 1.
- Tạo sẵn các đoạn văn bản để thử nghiệm.
