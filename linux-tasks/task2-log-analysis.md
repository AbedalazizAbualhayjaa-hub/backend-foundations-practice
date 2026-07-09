# Task 2 — Log Analysis with Pipes

Created an `access.log` file with 20 lines. Each line starts with an IP address.

## Commands Used

### 1. Top 10 most frequent IP addresses

```bash
awk '{print $1}' linux-tasks/access.log | sort | uniq -c | sort -rn | head -10
