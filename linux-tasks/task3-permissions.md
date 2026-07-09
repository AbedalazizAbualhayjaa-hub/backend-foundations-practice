# Task 3 — Permissions

Commands:

```bash
chmod 755 run.sh
chmod 600 config.env
chmod 755 public-data/
```
## Justification

I used `600` for `config.env` because it may contain secrets, so only the owner should be able to read or edit it.
