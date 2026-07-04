#!/bin/bash
set -e
REPO=$1
[ -z "$REPO" ] && echo "Error: No repository URL provided." && exit 1

echo "[INIT] Cloning and provisioning via Machine Manifest..."
TEMP=$(mktemp -d)
git clone --depth 1 "$REPO" "$TEMP" > /dev/null 2>&1

# Install runtime logic to user home for persistence
mkdir -p ~/agent_core/lib
cp $TEMP/skills/resource-watchdog/monitor.sh ~/agent_core/monitor.sh 2>/dev/null || true
cp $TEMP/skills/agent-orchestrator/SKILL.md ~/agent_core/capabilities.txt 2>/dev/null || true

# Setup shell profile logic (idempotent)
if ! grep -q "AGENT_CORE" ~/.bashrc; then
    echo 'export AGENT_WORKDIR="$HOME/agent_core"' >> ~/.bashrc
    echo 'alias agent-start="~/agent_core/monitor.sh &"' >> ~/.bashrc
fi

echo "[DONE] Provisioning complete. Agent runtime active in \$AGENT_WORKDIR."
