# Task 11 — Normalize to 3NF

Original table:

```text
loans(loan_id, book_isbn, book_title, member_id, member_name, member_email, loan_date, due_date)
```

### books

```text
books(
    book_isbn PRIMARY KEY,
    book_title
)
```

Justification: This table stores each book once, so the book title is not repeated in every loan row.

### members

```text
members(
    member_id PRIMARY KEY,
    member_name,
    member_email
)
```

Justification: This table stores each member once, so the member name and email are not repeated in every loan row.

### loans

```text
loans(
    loan_id PRIMARY KEY,
    book_isbn FOREIGN KEY REFERENCES books(book_isbn),
    member_id FOREIGN KEY REFERENCES members(member_id),
    loan_date,
    due_date
)
```

Justification: This table stores the borrowing record and connects each loan to one book and one member.

## Relationships

- One book can appear in many loans.
- One member can have many loans.
- Each loan belongs to one book and one member.
