## Câu Hỏi

1. Có mấy kiểu địa chỉ nhớ, sự phân biệt giữa các kiểu địa chỉ này?
2. Hệ điều hành có thể thực hiện chuyển đổi địa chỉ tại các thời điểm nào?
3. Phân biệt Dynamic linking và Dynamic loading?
4. Nêu sự khác biệt giữa cơ chế phân chia bộ nhớ cố định và phân chia động?
5. Phân biệt sự khác nhau giữa phân mảnh ngoại và phân mảnh nội?

# Các Kiểu Địa Chỉ Nhớ

## Địa chỉ vật lý (physical address) (địa chỉ thực)

- Là **địa chỉ thực tế** của một ô nhớ trong **bộ nhớ chính (RAM)**.
- Đây là địa chỉ mà **phần cứng bộ nhớ** trực tiếp sử dụng để truy cập dữ liệu.
- Người lập trình **không làm việc trực tiếp** với địa chỉ vật lý trong các hệ điều hành hiện đại.

### Ví dụ

Ô nhớ tại vị trí `0x000A3F2C` trong RAM.

## Địa chỉ luận lý (logical address)

- Là địa chỉ được **CPU sinh ra trong quá trình thực thi chương trình**.
- Được sử dụng trong **mã chương trình** và các lệnh truy cập bộ nhớ.
- Còn được gọi là **địa chỉ ảo (virtual address)**.
- Địa chỉ luận lý **không trùng trực tiếp** với địa chỉ vật lý.
- Phải thông qua **bộ quản lý bộ nhớ MMU (Memory Management Unit)** để chuyển đổi sang địa chỉ vật lý.

### Vai trò

- Giúp **che giấu cấu trúc bộ nhớ vật lý**
- Cho phép **mỗi tiến trình có không gian địa chỉ riêng**

## Địa chỉ tuyệt đối (absolute address)

-  Là địa chỉ **xác định chính xác vị trí trong bộ nhớ**.
- Thường **tương đương với địa chỉ vật lý**.
- Xuất hiện sau khi chương trình đã được **liên kết và nạp vào bộ nhớ**.
- Khi đã có địa chỉ tuyệt đối, chương trình **không thể di chuyển** sang vị trí khác trong bộ nhớ nếu không nạp lại.
- Ví dụ: Lệnh ở địa chỉ tuyệt đối `4000H` trong **RAM.**

## Địa chỉ tương đối (relative address)

- địa chỉ khả tái định vị, *relocatable address*
- Là địa chỉ được biểu diễn **dưới dạng độ lệch (offset)**.
- Được tính **tương đối so với một vị trí gốc** (thường là địa chỉ bắt đầu chương trình).
- Là một dạng **địa chỉ luận lý có khả năng tái định vị**.
- Giúp chương trình **có thể nạp vào nhiều vị trí khác nhau trong bộ nhớ** mà không cần sửa mã.

### Ví dụ

+ 12 byte so với vị trí bắt đầu chương trình.

## Kết Luận

- Chương trình sử dụng **địa chỉ luận lý / tương đối**, Hệ điều hành + MMU chuyển đổi sang **địa chỉ vật lý / tuyệt đối** khi thực thi.

- Hệ điều hành không cho chương trình làm việc trực tiếp với **địa chỉ vật lý**, mà sử dụng **địa chỉ luận lý và tương đối** để:
  - Bảo vệ bộ nhớ
  - Quản lý nhiều tiến trình
  - Tăng tính linh hoạt và an toàn.

# Thời Điểm Chuyển Đổi Địa Chỉ Nhớ

## Các thời điểm

Địa chỉ lệnh và dữ liệu được chuyển đổi thành địa chỉ thực tại **ba thời điểm** khác nhau:

1. Compile Time
2. Load Time
3. Execution Time

## Compile time

- Nếu biết trước địa chỉ bộ nhớ của chương trình thì có thể kết gán địa chỉ tuyệt đối lúc biên dịch.

- Ví dụ: Chương trình .COM của MS-DOS.

- Khuyết điểm: Phải biên dịch lại nếu thay đổi địa chỉ nạp chương trình.

## Load time

Vào thời điểm loading, loader phải chuyển đổi địa chỉ khả tái định vị thành địa chỉ thực dựa trên một địa chỉ nền.

- Địa chỉ thực được tính toán vào thời điểm nạp chương trình.
- **=>** Phải tiến hành reload nếu địa chỉ nền thay đổi.

## Execution time (Thời điểm thực thi)

Nếu tiến trình có thể được di chuyển giữa các phân đoạn (segment) khác nhau trong bộ nhớ trong quá trình thực thi, việc chuyển đổi địa chỉ sẽ được trì hoãn đến lúc này.

- Cần sự hỗ trợ của phần cứng cho việc ánh xạ địa chỉ (ví dụ dùng thanh ghi base và limit khi địa chỉ luận lý là relocatable).
- Được sử dụng trong đa số các hệ điều hành hiện đại có cơ chế swapping, paging, segmentation.

# Phân biệt Dynamic linking và Dynamic loading

## Dynamic Linking (Liên kết động)

- **Cơ chế hoạt động** Sử dụng các đoạn mã giữ chỗ (stub) trong chương trình để tham chiếu đến các module bên ngoài. Khi thực thi lần đầu, stub sẽ nạp routine và thay thế bằng địa chỉ thực tế.
- **Mục đích chính** Cho phép cập nhật thư viện mà không cần biên dịch lại chương trình; hỗ trợ chia sẻ mã nguồn giữa các tiến trình.
- **Đối tượng áp dụng**Thường là các thư viện tiện ích của hệ điều hành (file .DLL trên Windows, .so trên Unix).
- **Khả năng chia sẻ** Chia sẻ mã (code sharing): Một module chỉ nạp một lần và nhiều tiến trình có thể dùng chung, giúp tiết kiệm RAM và đĩa.
- **Vai trò của OS**Cần sự hỗ trợ chặt chẽ từ OS để kiểm tra routine đã nạp chưa và quản lý việc chia sẻ giữa các tiến trình.

## Dynamic Loading (Nạp động)

- **Cơ chế hoạt động** Chỉ khi nào một thủ tục được gọi đến thì nó mới được nạp vào bộ nhớ chính.
- **Mục đích chính** Tăng hiệu dụng của bộ nhớ bằng cách tránh nạp các phần mã không được sử dụng đến.
- **Đối tượng áp dụng** Các chương trình có khối lượng mã lớn nhưng tần suất sử dụng thấp (ví dụ: các thủ tục xử lý lỗi).
- **Khả năng chia sẻ** Tập trung vào việc quản lý bộ nhớ trong phạm vi thực thi của chương trình.

**Vai trò của OS** Người dùng (lập trình viên) chịu trách nhiệm thiết kế; OS chỉ cung cấp các thư viện hỗ trợ để thực hiện dễ dàng hơn.

# Cơ Chế Phân Chia Bộ Nhớ Cố Định và Phân Chia Động

## So Sánh

| **Tiêu chí**               | **Phân chia cố định**                                        | **Phân chia động**                                           |
| -------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Khởi tạo và Phân chia**  | Khi khởi động hệ thống, bộ nhớ chính được chia thành nhiều phần rời nhau gọi là các partition. | Số lượng partition không cố định và partition có thể có kích thước khác nhau. |
| **Kích thước Partition**   | Có kích thước bằng nhau hoặc khác nhau.                      | Partition có thể có kích thước khác nhau.                    |
| **Cơ chế cấp phát**        | Tiến trình nào có kích thước nhỏ hơn hoặc bằng kích thước partition thì có thể được nạp vào partition đó. | Mỗi tiến trình được cấp phát chính xác dung lượng bộ nhớ cần thiết. |
| **Vấn đề phân mảnh**       | Không hiệu quả do bị **phân mảnh nội** (một chương trình dù lớn hay nhỏ đều được cấp phát trọn một partition). | Gây ra hiện tượng **phân mảnh ngoại** (kích thước không gian nhớ còn trống thỏa mãn yêu cầu nhưng không liên tục). |
| **Xử lý khi không đủ chỗ** | Nếu chương trình có kích thước lớn hơn partition thì phải dùng cơ chế **overlay**. | Có thể dùng cơ chế **kết khối (compaction)** để gom lại thành vùng nhớ liên tục. |


## Cơ chế cố định

- Bộ nhớ chính được **chia sẵn thành các phân vùng có kích thước cố định** ngay từ đầu, kích thước bằng nhau hoặc khác nhau.
- Mỗi tiến trình được nạp vào **một phân vùng**. Tiến trình nào có kích thước nhỏ hơn hoặcbằng hoặc nhỏ hơn thì được nạp vào phân vùng đó.
- Nếu chương trình có kích thước lớn hơn partition thì phải dùng cơ chế overlay.
- Nhận xét: Không hiệu quả do bị phân mảnh nội: một chương trình dù lớn hay nhỏ đều được cấp phát trọn một partition.

## Chia động

- Số lượng partition không cố định và partition có thể có kích thước khác nhau.

- Mỗi tiến trình được cấp phát chính xác dung lượng bộ nhớ cần thiết.
- Gây ra hiện tượng phân mảnh ngoại.

# Phân Biệt Phân Mảnh Ngoại vs Phân Mảnh Nội

