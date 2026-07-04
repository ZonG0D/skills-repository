#!/bin/bash
echo "[WATCHDOG] Pulse active."
df -h / | tail -1
free -h | grep Mem || echo "No freem command available"
