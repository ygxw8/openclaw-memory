#!/bin/bash
# Weekly Memory Backup to GitHub
# Runs: Every Sunday at 3:00 AM

WORKSPACE_DIR="/root/.openclaw/workspace"
LOG_FILE="$WORKSPACE_DIR/memory/backup.log"

exec >> "$LOG_FILE" 2>&1

echo "========================================"
echo "Backup started: $(date '+%Y-%m-%d %H:%M:%S')"

cd "$WORKSPACE_DIR"

# Check for changes
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Add all changes
git add -A

# Commit with timestamp
git commit -m "Weekly memory backup - $(date '+%Y-%m-%d %H:%M')"

# Push to GitHub
if git push origin master; then
    echo "✅ Backup successful: pushed to GitHub"
else
    echo "❌ Backup failed: push error"
    exit 1
fi

echo "Backup completed: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================"
