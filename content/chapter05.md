# Bước 5. Kiểm Tra Tính Toàn Vẹn & Xác Thực

- Người gửi gửi văn bản + hash.
- Người nhận tạo hash mới rồi so sánh.
- Nếu hash không khớp → dữ liệu bị thay đổi.

## Văn Bản Gốc Và Hash

- Tạo file văn bản gốc `test.txt` với giá trị:
  - 'THIS IS A SECRET MESSAGE USED FOR ASYMMETRIC ENCRYPTION DEMO.'
- Tạo giá trị hash cho file văn bản trên: `test.md5`.
- Gửi tới người nhận cả 2 file trên.

```bash
~/vm ⌚ 23:13:49
$ echo 'THIS IS A SECRET MESSAGE USED FOR ASYMMETRIC ENCRYPTION DEMO.' > test.txt 

~/vm ⌚ 23:14:19
$ md5sum test.txt 
d353bd8b4b88befdf24299eaf5c71577  test.txt

~/vm ⌚ 23:14:25
$ md5sum test.txt > test.md5
```

## Trường Hợp 1: Văn Bản Nguyên Vẹn

- Người nhận tạo hash cho văn bản đã nhận.
- So sánh với hash của người gửi.
- Không tìm thấy sự khác biệt.
- Như vậy văn bản đã được gửi nguyên vẹn.

```bash
~/vm ⌚ 23:14:35
$ md5sum test.txt > test-new.md5

~/vm ⌚ 23:14:58
$ diff test.md5 test-new.md5 
```

## Trường Hợp 2: Văn Bản Bị Thay Đổi

- Vì lý do nào đó, văn bản bị thay đổi trong quá trình truyền.
  - Cụ thể: Thay `.` bằng `!` ở cuối câu.

```bash
~/vm ⌚ 23:15:09
$ echo 'THIS IS A SECRET MESSAGE USED FOR ASYMMETRIC ENCRYPTION DEMO!' > test.txt
```

- Người nhận tạo hash cho văn bản đã nhận.
- So sánh với hash của người gửi.
- Tìm thấy sự khác biệt.
- Như vậy văn bản đã bị thay đổi.

```bash
~/vm ⌚ 23:15:20
$ md5sum test.txt > test-new.md5                                                 

~/vm ⌚ 23:15:24
$ diff test.md5 test-new.md5                                                     
1c1
< d353bd8b4b88befdf24299eaf5c71577  test.txt
---
> 4b4cd50b491638b12620a4bd31d00094  test.txt
```
