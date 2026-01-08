#import "../template/lib.typ": *

== Câu Hỏi


+ Có mấy kiểu địa chỉ nhớ, sự phân biệt giữa các kiểu địa chỉ này?
+ Hệ điều hành có thể thực hiện chuyển đổi địa chỉ tại các thời điểm nào?
+ Phân biệt Dynamic linking và Dynamic loading?
+ Nêu sự khác biệt giữa cơ chế phân chia bộ nhớ cố định và phân chia động?
+ Phân biệt sự khác nhau giữa phân mảnh ngoại và phân mảnh nội?

= Các Kiểu Địa Chỉ Nhớ



== Địa chỉ vật lý (physical address) (địa chỉ thực)


- Là #strong[địa chỉ thực tế] của một ô nhớ trong #strong[bộ nhớ chính (RAM)];.
- Đây là địa chỉ mà #strong[phần cứng bộ nhớ] trực tiếp sử dụng để truy cập dữ liệu.
- Người lập trình #strong[không làm việc trực tiếp] với địa chỉ vật lý trong các hệ điều hành hiện đại.

=== Ví dụ


Ô nhớ tại vị trí `0x000A3F2C` trong RAM.

== Địa chỉ luận lý (logical address)


- Là địa chỉ được #strong[CPU sinh ra trong quá trình thực thi chương trình];.
- Được sử dụng trong #strong[mã chương trình] và các lệnh truy cập bộ nhớ.
- Còn được gọi là #strong[địa chỉ ảo (virtual address)];.
- Địa chỉ luận lý #strong[không trùng trực tiếp] với địa chỉ vật lý.
- Phải thông qua #strong[bộ quản lý bộ nhớ MMU (Memory Management Unit)] để chuyển đổi sang địa chỉ vật lý.

=== Vai trò


- Giúp #strong[che giấu cấu trúc bộ nhớ vật lý]
- Cho phép #strong[mỗi tiến trình có không gian địa chỉ riêng]

== Địa chỉ tuyệt đối (absolute address)


- Là địa chỉ #strong[xác định chính xác vị trí trong bộ nhớ];.
- Thường #strong[tương đương với địa chỉ vật lý];.
- Xuất hiện sau khi chương trình đã được #strong[liên kết và nạp vào bộ nhớ];.
- Khi đã có địa chỉ tuyệt đối, chương trình #strong[không thể di chuyển] sang vị trí khác trong bộ nhớ nếu không nạp lại.
- Ví dụ: Lệnh ở địa chỉ tuyệt đối `4000H` trong #strong[RAM.]

== Địa chỉ tương đối (relative address)


- địa chỉ khả tái định vị, #emph[relocatable address]
- Là địa chỉ được biểu diễn #strong[dưới dạng độ lệch (offset)];.
- Được tính #strong[tương đối so với một vị trí gốc] (thường là địa chỉ bắt đầu chương trình).
- Là một dạng #strong[địa chỉ luận lý có khả năng tái định vị];.
- Giúp chương trình #strong[có thể nạp vào nhiều vị trí khác nhau trong bộ nhớ] mà không cần sửa mã.

=== Ví dụ


- 12 byte so với vị trí bắt đầu chương trình.

== Kết Luận


- Chương trình sử dụng #strong[địa chỉ luận lý / tương đối];, Hệ điều hành + MMU chuyển đổi sang #strong[địa chỉ vật lý / tuyệt đối] khi thực thi.

- Hệ điều hành không cho chương trình làm việc trực tiếp với #strong[địa chỉ vật lý];, mà sử dụng #strong[địa chỉ luận lý và tương đối] để:

  - Bảo vệ bộ nhớ
  - Quản lý nhiều tiến trình
  - Tăng tính linh hoạt và an toàn.

= Chuyển Đổi Địa Chỉ Nhớ



== Các thời điểm


Địa chỉ lệnh và dữ liệu được chuyển đổi thành địa chỉ thực tại #strong[ba thời điểm] khác nhau:

+ Compile Time
+ Load Time
+ Execution Time

== Compile time


- Nếu biết trước địa chỉ bộ nhớ của chương trình thì có thể kết gán địa chỉ tuyệt đối lúc biên dịch.

- Ví dụ: Chương trình `.COM` của MS-DOS.

- Khuyết điểm: Phải biên dịch lại nếu thay đổi địa chỉ nạp chương trình.

== Load time


Vào thời điểm loading, loader phải chuyển đổi địa chỉ khả tái định vị thành địa chỉ thực dựa trên một địa chỉ nền.

- Địa chỉ thực được tính toán vào thời điểm nạp chương trình.
- $arrow.r.double$ Phải tiến hành reload nếu địa chỉ nền thay đổi.

== Execution time (Thời điểm thực thi)


Nếu tiến trình có thể được di chuyển giữa các phân đoạn (segment) khác nhau trong bộ nhớ trong quá trình thực thi, việc chuyển đổi địa chỉ sẽ được trì hoãn đến lúc này.

- Cần sự hỗ trợ của phần cứng cho việc ánh xạ địa chỉ (ví dụ dùng thanh ghi base và limit khi địa chỉ luận lý là relocatable).
- Được sử dụng trong đa số các hệ điều hành hiện đại có cơ chế swapping, paging, segmentation.

= Dynamic Linking và Dynamic Loading



== So Sánh



#table(
  columns: (20%, 40%, 40%),
  align: (left, left, left),
  [#strong[Tiêu chí]], [#strong[Dynamic Linking (Liên kết động)]], [#strong[Dynamic Loading (Nạp động)]],
  [#strong[Thời điểm liên kết/nạp]],
  [Liên kết thư viện khi chương trình đang chạy (runtime), thường ở lần gọi
    đầu tiên],
  [Nạp từng phần/thủ tục của chương trình chỉ khi cần dùng],

  [#strong[Đối tượng chính]],
  [Thư viện ngoài (`.dll` trên Windows, `.so` trên Unix/Linux)],
  [Các module/thủ tục bên trong chương trình],

  [#strong[Cách hoạt động]],
  [File thực thi chứa stub; khi gọi hàm, stub nạp thư viện và vá địa chỉ],
  [Lập trình viên chủ động thiết kế: thủ tục nào được gọi mới nạp vào RAM],

  [#strong[Hỗ trợ của HĐH]],
  [Cần HĐH hỗ trợ mạnh (quản lý thư viện dùng chung, kiểm tra đã nạp chưa)],
  [Ít phụ thuộc HĐH, chủ yếu qua thư viện hỗ trợ],

  [#strong[Chia sẻ mã]],
  [Có -- nhiều tiến trình dùng chung 1 bản thư viện trong RAM],
  [Không bắt buộc (mỗi tiến trình/module tự quản)],

  [#strong[Lợi ích chính]],
  [Giảm dung lượng file thực thi, tiết kiệm RAM nhờ chia sẻ],
  [Giảm RAM sử dụng vì không nạp phần không dùng],

  [#strong[Ví dụ]], [Chương trình dùng `libc.so` chỉ nạp khi chạy], [Module xử lý lỗi chỉ nạp khi lỗi xảy ra],
)

== Dynamic Linking (Liên kết động)


- #strong[Cơ chế hoạt động] Sử dụng các đoạn mã giữ chỗ (stub) trong chương trình để tham chiếu đến các module bên ngoài. Khi thực thi lần đầu, stub sẽ nạp routine và thay thế bằng địa chỉ thực tế.
- #strong[Mục đích chính] Cho phép cập nhật thư viện mà không cần biên dịch lại chương trình; hỗ trợ chia sẻ mã nguồn giữa các tiến trình.
- #strong[Đối tượng áp dụng];Thường là các thư viện tiện ích của hệ điều hành (file .DLL trên Windows, .so trên Unix).
- #strong[Khả năng chia sẻ] Chia sẻ mã (code sharing): Một module chỉ nạp một lần và nhiều tiến trình có thể dùng chung, giúp tiết kiệm RAM và đĩa.
- #strong[Vai trò của OS];Cần sự hỗ trợ chặt chẽ từ OS để kiểm tra routine đã nạp chưa và quản lý việc chia sẻ giữa các tiến trình.

== Dynamic Loading (Nạp động)


- #strong[Cơ chế hoạt động] Chỉ khi nào một thủ tục được gọi đến thì nó mới được nạp vào bộ nhớ chính.
- #strong[Mục đích chính] Tăng hiệu dụng của bộ nhớ bằng cách tránh nạp các phần mã không được sử dụng đến.
- #strong[Đối tượng áp dụng] Các chương trình có khối lượng mã lớn nhưng tần suất sử dụng thấp (ví dụ: các thủ tục xử lý lỗi).
- #strong[Khả năng chia sẻ] Tập trung vào việc quản lý bộ nhớ trong phạm vi thực thi của chương trình.

#strong[Vai trò của OS] Người dùng (lập trình viên) chịu trách nhiệm thiết kế; OS chỉ cung cấp các thư viện hỗ trợ để thực hiện dễ dàng hơn.

= Cơ Chế Phân Chia Bộ Nhớ



== So Sánh


#table(
  columns: (20%, 40%, 40%),
  align: (left, left, left),
  [#strong[Tiêu chí]], [#strong[Phân chia cố định]], [#strong[Phân chia động]],
  [#strong[Khởi tạo và Phân chia]],
  [Khi khởi động hệ thống, bộ nhớ chính được chia thành nhiều phần rời nhau
    gọi là các partition.],
  [Số lượng partition không cố định và partition có thể có kích thước khác
    nhau.],

  [#strong[Kích thước Partition]],
  [Có kích thước bằng nhau hoặc khác nhau.],
  [Partition có thể có kích thước khác nhau.],

  [#strong[Cơ chế cấp phát]],
  [Tiến trình nào có kích thước nhỏ hơn hoặc bằng kích thước partition thì
    có thể được nạp vào partition đó.],
  [Mỗi tiến trình được cấp phát chính xác dung lượng bộ nhớ cần thiết.],

  [#strong[Vấn đề phân mảnh]],
  [Không hiệu quả do bị #strong[phân mảnh nội] (một chương trình dù lớn hay
    nhỏ đều được cấp phát trọn một partition).],
  [Gây ra hiện tượng #strong[phân mảnh ngoại] (kích thước không gian nhớ
    còn trống thỏa mãn yêu cầu nhưng không liên tục).],

  [#strong[Xử lý khi không đủ chỗ]],
  [Nếu chương trình có kích thước lớn hơn partition thì phải dùng cơ chế
    #strong[overlay];.],
  [Có thể dùng cơ chế #strong[kết khối (compaction)] để gom lại thành vùng
    nhớ liên tục.],
)

== Cơ chế cố định


- Bộ nhớ chính được #strong[chia sẵn thành các phân vùng có kích thước cố định] ngay từ đầu, kích thước bằng nhau hoặc khác nhau.
- Mỗi tiến trình được nạp vào #strong[một phân vùng];. Tiến trình nào có kích thước nhỏ hơn hoặcbằng hoặc nhỏ hơn thì được nạp vào phân vùng đó.
- Nếu chương trình có kích thước lớn hơn partition thì phải dùng cơ chế overlay.
- Nhận xét: Không hiệu quả do bị phân mảnh nội: một chương trình dù lớn hay nhỏ đều được cấp phát trọn một partition.

== Chia động


- Số lượng partition không cố định và partition có thể có kích thước khác nhau.

- Mỗi tiến trình được cấp phát chính xác dung lượng bộ nhớ cần thiết.

== Phân Biệt

= Phân Mảnh Ngoại vs Nội


=== Phân mảnh ngoại (External fragmentation):


- Xảy ra khi tổng kích thước không gian nhớ còn trống đủ để thỏa mãn yêu cầu nhưng #strong[không liên tục];.
- Thường gặp trong phân chia động (dynamic partitioning). Có thể khắc phục bằng kỹ thuật kết khối (compaction).

=== Phân mảnh nội (Internal fragmentation):


- Xảy ra khi kích thước vùng nhớ được cấp phát #strong[lớn hơn] kích thước tiến trình yêu cầu, phần thừa ra bên trong vùng được cấp phát bị lãng phí.
- Thường xảy ra khi bộ nhớ chia thành các khối kích thước cố định (như Fixed partitioning hoặc Paging) và các tiến trình được cấp phát theo đơn vị khối.

== Bổ Sung



=== Kết khối (Compaction) (bổ sung):


- Hệ điều hành sẽ thực hiện dịch chuyển các vùng nhớ đang được sử dụng (các tiến trình đang chạy) sát lại gần nhau nhằm dồn tất cả các vùng nhớ trống rải rác lại thành một vùng nhớ trống liên tục lớn duy nhất.
