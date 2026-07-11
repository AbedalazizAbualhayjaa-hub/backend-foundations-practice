# Task 4 - Find and Follow

### 1. Find `.py` files modified in the last 7 days

```bash
find . -name "*.py" -mtime -7 -printf "%p %s bytes\n"
```

### 2. Start a long-running command detached from the terminal

```bash
nohup bash -c 'while true; do echo "Task 4 running"; sleep 1; done' > /tmp/task4.log 2>&1 &
echo $! > /tmp/task4.pid
```

### 3. Follow the log file live

```bash
tail -f /tmp/task4.log
```

### 4. Locate the process

```bash
ps -p $(cat /tmp/task4.pid) -f
```

### 5. Stop the process

```bash
kill $(cat /tmp/task4.pid)
```

## Note

`kill` stops the process normally and gives it a chance for a clean closing. `kill -9` forces the process to stop immediately. I'd try `kill` first because it's safer.
