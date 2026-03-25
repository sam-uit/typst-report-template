#import "/template/lib.typ": *
#import "/config/metadata.typ": data

= TÓM TẮT NỘI DUNG

== Tiêu đề: #upper[#data.assignment.subtitle] (Sử dụng CrypTool 1)
== MỤC TIÊU

- Hiểu và thực hành các hệ mã cổ điển:
  - Caesar
  - Vigenère
  - Playfair
  - Transposition
- Sử dụng CrypTool để mã hoá -- giải mã.
- Áp dụng phân tích tần suất, IC, Kasiski để thử phá mã.
- Thực hành nhiều ví dụ mở rộng với thời lượng 180 phút.

== CHUẨN BỊ

- Cài CrypTool 1.
- Chuẩn bị đoạn văn bản để mã hoá.
- Máy tính Windows 10/11.

CrypTool 1:

#figure(image("assets/1a-01.png"), caption: [
  Chuẩn Bị: CrypTool 1
])

== NỘI DUNG CHÍNH

=== BƯỚC 1 -- Làm quen CrypTool

- File → New.
- Quan sát menu Encrypt, Decrypt, Analysis. Chụp lại hình các menu này, mô tả các mục trong menu.
- Nhập văn bản mẫu để thử nghiệm một vài mục trong menu trên.

=== BƯỚC 2 -- Caesar Cipher (Mở rộng)

- Nhập plaintext: ATTACK AT DAWN.
- Encrypt → Classical → Caesar → key = 3.
- Dùng Decrypt để giải mã lại.
- Phân tích brute-force: Analysis → Classical → Caesar Analysis.
- Lặp lại với các key khác: 5, 7, 13.

=== BƯỚC 3 -- Vigenère Cipher (Mở rộng)

- Nhập plaintext dài 3 -- 4 dòng để tăng độ phức tạp.
- Encrypt → Vigenère → key = LEMON.
- Decrypt lại bằng key.
- Phân tích khóa bằng Analysis → Vigenère Analysis.
- Quan sát IC và độ dài khóa dự đoán.
- Tạo một ciphertext mới với key khác (APPLE, SECRET).
- Thực hành: sinh viên đổi ciphertext cho nhau để phá bằng Kasiski + IC.

=== BƯỚC 4 -- Playfair Cipher (Mở rộng)

- Encrypt → Playfair → key = SECRETKEY.
- Ghi lại ma trận 5x5.
- Nhập plaintext có ký tự lặp (MEET ME AT THE BRIDGE).
- Quan sát cách CrypTool chèn X để xử lý chữ đôi.
- Giải mã lại.
- Thực hành mở rộng:
  - Thử với khóa khác và plaintext dài hơn.

=== BƯỚC 5 -- Transposition Cipher

- Encrypt → Transposition → Columnar.
- Key: 4312567.
- Giải mã lại.
- Dùng Analysis → Transposition Analysis để phá mã.
- Tạo thêm 2 ví dụ khác để sinh viên thử nghiệm.

=== BƯỚC 6 -- Solitaire Cipher

- Tìm hiểu và cho biết cách thức mã hoá và giải mã của giải thuật.
- Cho ví dụ mã hoá và giải mã, với plaintext là họ tên sinh viên.

=== CÂU HỎI BÁO CÁO

1. Giải thích lý do Caesar dễ bị phá.
2. IC hỗ trợ phá Vigenère như thế nào?
3. Playfair xử lý chữ đôi ra sao?
4. Tại sao Transposition giữ nguyên chữ nhưng thay đổi vị trí?
5. So sánh mức độ an toàn của 4 hệ mã nêu trên.
