# Bài 4. Chủ Đề Thứ Tư

## Bài 4 Mục 1 - Chứa Code

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat.

```sql
-- Tạo mới VIEW (hoặc thay thế)
CREATE OR REPLACE VIEW account_activity_view AS
SELECT
  ba.account_number,
  ba.account_holder,
  ba.balance,
  ul.action AS latest_action,
  ul.timestamp AS latest_action_time
FROM
  BankAccounts ba
-- Join nhiều bảng
LEFT JOIN
  (
      -- Một truy vấn cụ thể
      SELECT DISTINCT ON (account_number)
          account_number,
          action,
          timestamp
      FROM
          UserLogs
      ORDER BY
          account_number,
          timestamp DESC
  ) ul ON ba.account_number = ul.account_number;
```

```sql
-- Truy vấn từ VIEW như một bảng bình thường
SELECT * FROM account_activity_view;
```

## Bài 4 Mục 2

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat.
