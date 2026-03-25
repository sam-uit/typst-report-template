# Câu Hỏi Báo Cáo

Quy ước không gian khóa:

- Sử dụng trường hợp mặc định đánh chỉ số bắt đầu từ 0: $A=0, B=1, \dots, Z=25$, như bảng sau đây:

|  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  | 10  | 11  | 12  | 13  | 14  | 15  | 16  | 17  | 18  | 19  | 20  | 21  | 22  | 23  | 24  | 25  |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|  A  |  B  |  C  |  D  |  E  |  F  |  G  |  H  |  I  |  J  |  K  |  L  |  M  |  N  |  O  |  P  |  Q  |  R  |  S  |  T  |  U  |  V  |  W  |  X  |  Y  |  Z  |

1. **Giải thích lý do Caesar dễ bị phá**.
    - Chỉ là sự dịch chuyển với các bước từ 0 tới số lượng tối đa của bảng chữ cái (26), nên có thể vét cạn.
    - Không gian khóa quá nhỏ, 25 trường hợp dịch chuyển, nên có thể thử với việc lặp lại rất nhanh với máy tính.
    - Có thể phân tích tần suất chữ cái của ngôn ngữ gốc (English) để phán đoán kết quả, vì ở đây là sự thay thế *1 - 1*: một ký tự thay cho một ký tự khác.
2. **IC hỗ trợ phá Vigenère như thế nào?**
    - IC (Chỉ số trùng hợp) đo lường xác suất lấy ra 2 ký tự ngẫu nhiên trong văn bản mà chúng giống nhau.
    - Đối với Vigenère, cái khó nhất để bẻ khóa là tìm ra **độ dài của từ khóa**.
    - Bằng cách chia bản mã thành các cột với các khoảng dời (offset) khác nhau và tính chỉ số IC cho từng cột, nếu IC tính được xấp xỉ với IC chuẩn của ngôn ngữ gốc (ví dụ tiếng Anh là ~0.066), ta có thể đoán được độ dài khóa là bao nhiêu.
    - Khi đã biết độ dài khóa, bài toán được chia nhỏ về thành bẻ khóa Caesar cho từng cột đơn giản hơn rất nhiều.
3. **Playfair xử lý chữ đôi ra sao?**
    - Playfair băm văn bản thành các cặp 2 ký tự (digraph).
    - Nếu trong mỗi cặp chữ có sự trùng nhau, thì sẽ được tách ra, và chèn vào giữa một ký tự thay thế, thường là $X$, ví dụ: $AA \to AX$ và $A$ còn lại ở bên phải được chuyển sang cặp khác.
    - Nếu một cặp bị thiếu 1 ký tự cuối, sẽ được bổ sung bằng ký tự thay thế, thường là $X$, như thấy ở bước 4.
    - Mục đích của việc này là để phá vỡ cấu trúc lặp từ, khiến kẻ tấn công khó dùng phân tích tần suất hơn.
4. **Tại sao Transposition giữ nguyên chữ nhưng thay đổi vị trí?**
    - Như một sự xáo bài tú lơ khơ 52 hoặc 54 lá.
        - Bản chất của Transposition (Hoán vị) không phải là thay thế chữ A thành chữ B như Caesar hay Vigenère.
        - Nó tráo vị trí các chữ cái đã có theo một ma trận hoặc một quy tắc nhất định (ví dụ: viết theo hàng ngang nhưng đọc theo cột dọc).
        - Các mảnh ghép (ký tự) không đổi, khối lượng ký tự không đổi, chỉ có thứ tự bị xáo trộn theo một quy luật nào đó để che giấu đi ý nghĩa thực sự của bản gốc.
    - Số lá bài thực ra có thể chỉ định được, như ví dụ trước đó.
5. **So sánh mức độ an toàn của 4 hệ mã nêu trên**.
    - Theo thứ tự an toàn từ thấp đến cao: $Caesar < Transposition < Vigenère < Playfair$.
        - **Caesar:**
            - Yếu nhất
            - Vét cạn hoặc phân tích tần suất thường đem ra kết quả ngay.
        - **Transposition (đơn giản):**
            - Kém an toàn nếu đứng một mình
            - Kẻ tấn công có thể đếm tần suất chữ cái (thấy khớp với tần suất chữ tiếng Anh chuẩn) là biết ngay **đây là mã hoán vị**, từ đó tìm cách xếp lại các cột.
        - **Vigenère:**
            - Khá an toàn vì là mã đa bảng, giấu được tần suất chữ cái.
            - Nay dễ dàng bị phá rách bằng phương pháp Kasiski hoặc tính chỉ số IC.
        - **Playfair:** An toàn nhất trong 4 loại này.
            - Do nó mã hóa theo từng cặp ký tự (digraph) chứ không mã hóa từng chữ cái rời rạc.
            - Mục đích: trung hòa tần suất xuất hiện của các chữ cái đơn, giúp nó chống lại các đòn tấn công phân tích tần suất truyền thống rất tốt.
