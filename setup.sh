#!/bin/bash
set -e
echo "[INIT] Reconstructing ZoneG0D Intelligence Package..."
git clone --depth 1 https://github.com/ZonG0D/skills-repository.git /tmp/agent_setup || true
cd /tmp/agent_setup

# Ensure executable permissions
chmod +x setup.sh skills/resource-watchdog/monitor.sh 2>/dev/null || true

# Setup local environment variables
echo 'export PATH="$HOME/agent_bin:$PATH"' >> ~/.bashrc
mkdir -p ~/agent_bin

cp runtime/lib/orchestrator.py $HOME/agent_core_exec.py
alias am-run='python3 $HOME/agent_core_exec.py'

echo "[SUCCESS] Environment Ready. Usage: 'am-run'"
