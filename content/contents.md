## Câu Hỏi

1. Có mấy kiểu địa chỉ nhớ, sự phân biệt giữa các kiểu địa chỉ này?
2. Hệ điều hành có thể thực hiện chuyển đổi địa chỉ tại các thời điểm nào?
3. Phân biệt Dynamic linking và Dynamic loading?
4. Nêu sự khác biệt giữa cơ chế phân chia bộ nhớ cố định và phân chia động?
5. Phân biệt sự khác nhau giữa phân mảnh ngoại và phân mảnh nội?

# Các Kiểu Địa Chỉ Nhớ

**Có 4 loại địa chỉ nhớ bao gồm:**

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



# Phân biệt Dynamic linking và Dynamic loading



# Cơ Chế Phân Chia Bộ Nhớ Cố Định và Phân Chia Động



# Phân Biệt Phân Mảnh Ngoại vs Phân Mảnh Nội

