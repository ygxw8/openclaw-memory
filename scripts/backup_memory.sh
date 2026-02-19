#!/bin/bash
timestamp=$(date +%Y%m%d_%H%M%S)
backup_file="openclaw_memory_backup_${timestamp}.tar.gz"

# Pack core memory and identity files
# Including hidden .config for credentials if needed, but maybe safer to stick to workspace first for portability
# User specifically asked for communication data -> memory/
tar -czf "$backup_file" \
    MEMORY.md \
    memory/ \
    IDENTITY.md \
    USER.md \
    SOUL.md \
    AGENTS.md \
    TOOLS.md \
    HEARTBEAT.md \
    BOOTSTRAP.md 2>/dev/null

echo "Backup created: $backup_file"
echo "$backup_file"
