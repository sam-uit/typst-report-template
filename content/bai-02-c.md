## C. PHÂN QUYỀN NGƯỜI DÙNG

### Mô Tả Yêu Cầu

Thực hiện các phát biểu `GRANT` / `DENY` / `REVOKE` trên CSDL **Quản lý đề tài** gồm các bảng:

* T1: `DETAI`
* T2: `HOIDONG`
* T3: `GV_HDDT`

Tạo các user `U1`, `U2`, `U3` và phân quyền theo yêu cầu.

- U1 có quyền select, delete trên T1, T3
- U2 có quyền update, delete trên T2
- U3 có quyền insert trên T1, T2, T3
- U1 bị từ chối quyền insert trên T1, T2
- U2 bị từ chối quyền delete trên T3
- Thu hồi các quyền của U1 trên T1
- Thu hồi các quyền của U3 trên T2

