#import "../template/lib.typ": *

= CÂU HỎI BÁO CÁO
<cau-hoi-bao-cao>

+ #strong[Khác nhau giữa mã hoá đối xứng và bất đối xứng?]

  - Mã hoá đối xứng (Symmetric Key) là việc cả người gửi và người nhận đều dùng chung một khóa duy nhất ($K_E = K_D$) cho quá trình mã hóa và giải mã, yêu cầu khóa này phải được giữ bí mật tuyệt đối.
  - Trong khi đó, mã hoá bất đối xứng (Asymmetric Key) sử dụng một cặp khóa gồm khóa công khai (Public Key) dùng để mã hóa và khóa bí mật (Private Key) dùng để giải mã, tức là hai khóa khác nhau ($K_E eq.not K_D$).

+ #strong[Hash dùng để làm gì? Vì sao không thể đảo ngược?]

  - Hàm #emph[băm] (Hash) dùng để tạo ra một "dấu vân tay kỹ thuật số" (digital digest/fingerprint) có chiều dài cố định từ một thông điệp có chiều dài bất kỳ, phục vụ cho việc chứng thực và kiểm tra tính toàn vẹn của dữ liệu.
  - Không thể đảo ngược được hàm băm vì nó có tính chất một chiều (one-way property); thuật toán đã ngắt dữ liệu thành nhiều mảnh, trộn lẫn chúng lại với nhau để tạo ra chuỗi mới, nên việc tính toán ngược lại từ giá trị băm ra dữ liệu gốc là không khả thi.

+ #strong[Vì sao sửa 1 ký tự khiến hash đổi toàn bộ?]

  - Điều này do tính chất kháng đụng độ (collision resistance) hay còn gọi là hiệu ứng tuyết lở (avalanche effect) của hàm băm như được nhắc đến ở Bước 2.
  - Bất cứ sự thay đổi nào trên đoạn dữ liệu gốc, dù là rất nhỏ (như sửa 1 ký tự), cũng sẽ làm thuật toán tính toán lại và tạo ra một giá trị băm hoàn toàn khác biệt với tỉ lệ rất cao.

+ #strong[Tại sao chữ ký số cần private key?]

  - Chữ ký số cần khóa bí mật (Private Key) của người gửi để mã hóa chuỗi băm (message digest) của thông điệp.
  - Do private key là duy nhất và chỉ có người gửi sở hữu, việc "ký" bằng khóa này đảm bảo rằng người nhận khi dùng Public Key của người gửi để xác minh (verify) có thể tin tưởng tuyệt đối rằng thông điệp thực sự xuất phát từ chính người gửi chứ không phải bị giả mạo bởi ai khác.

+ #strong[RSA có dùng để mã hoá file lớn không? Vì sao?]

  - RSA không thường dùng để mã hóa file lớn.
  - Lý do là tốc độ tính toán (mã hóa và giải mã) chậm hơn các giải thuật đối xứng như DES/AES rất rất nhiều.
  - Do đó, người ta thường dùng giải thuật đối xứng (như DES) để mã hóa khối văn bản lớn vì tốc độ nhanh, sau đó mới dùng RSA để mã hóa chính cái khóa bí mật của DES đó rồi gửi đi, tức là chỉ một phần văn bản/dữ liệu có kích thước nhỏ nhưng chứa đựng thông tin quan trọng.

+ #strong[Chữ ký số khác mã hoá ở điểm nào?]

  - Mã hóa thông thường dùng để đảm bảo #strong[tính bí mật] (confidentiality), người gửi sẽ dùng Khóa công khai (Public Key) của #emph[người nhận] để mã hóa, và chỉ #emph[người nhận] mới có Khóa bí mật (Private Key) để mở ra xem.
  - Trong khi đó, chữ ký số dùng để đảm bảo #strong[tính chứng thực] (authentication), người gửi tự băm thông điệp và dùng Khóa bí mật (Private Key) của #emph[chính mình] để mã hóa (ký), sau đó ai cũng có thể dùng Khóa công khai (Public Key) của #emph[người gửi] để mở ra xác minh xem có đúng là người đó gửi hay không.

+ #strong[Nhược điểm của mode ECB trong AES?]

  - Nhược điểm của mode ECB (Electronic Codebook) là nếu các khối dữ liệu đầu vào (plaintext) giống hệt nhau, thì khi mã hóa nó sẽ tạo ra các khối mã hóa (ciphertext) giống y hệt nhau.
  - Điều này không làm ẩn đi được cấu trúc thống kê của dữ liệu gốc, khiến kẻ tấn công dễ dàng nhận ra các mẫu (pattern) lặp lại và từ đó có thể có các phương án để bẻ khóa.
