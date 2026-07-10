# Task 10 — Identify the Keys

## 1. Primary Key

```text
loan_id
```

## 2. Duplicated Data

- `book_isbn` can repeat when the same book is borrowed more than once.
- `book_title` can repeat with the same book.
- `member_id` can repeat when the same member borrows more than one book.
- `member_name` can repeat with the same member.
- `member_email` can repeat with the same member.

## 3. Hidden Entities

The two main entities hidden inside the table are:

1. Book
2. Member
