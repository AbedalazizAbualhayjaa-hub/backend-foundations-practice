# Task 13 — Indexing and Transactions Reasoning

## 1. Best Index

The best index is:

```sql
CREATE INDEX idx_orders_customer_created
ON orders(customer_id, created_at);
```

This is useful because the query first filters by `customer_id`, then sorts by `created_at`. Because both columns are in the same index, the database can find the customer’s orders faster and return them in date order with less sorting.

## 2. Downside of Many Indexes

Adding many indexes can slow down a table with many writing.

This is because every `INSERT`, `UPDATE`, or `DELETE` changes the table data, and the database also has to update all related indexes. So indexes can make reading faster, but many indexes make writing slower and more storage used.

## 3. Transaction Example

A transaction is important when transferring money between bank accounts.

For example, if Account A is decreased by 50$, Account B must be increased by 50$. If the first update works but the second update fails, the database would have incorrect money balances.

The important ACID property is **Atomicity**, because both updates should happen together as one operation, or both should be cancelled.
