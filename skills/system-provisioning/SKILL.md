# Skill: system-provisioning

## Description
Automates the setup, optimization, and maintenance of Android/Termux environments to ensure a highly stable and persistent agentic workspace.

## Capabilities
- **Environment Scaffolding**: Automates the creation of standard directory structures (e.g., `~/agent_logs`, `~/projects`).
- **Dependency Management**: Manages package installation (`pkg`/`apt`) and environment isolation using Python virtual environments (`venv`).
- **Shell Optimization**: Configures `.bashrc` or `.zshrc` with intelligent aliases, specialized paths, and environment variables for long-term productivity.
- **Permission Management**: Handles necessary workspace permissions (e.g., `termux-setup-storage`) to ensure command execution integrity.

## Workflow
1.  **Environment Audit**: Scans the current host environment (OS type, package versions, directory presence).
2.<|channel> ability_to_provision: Executes installation of required toolsets and runtime libraries.
3.  **Profile Injection**: Updates shell configuration files to integrate agent-specific terminal optimizations.
4.  **Verification**: Validates that all scoped paths are writable and binaries are in the `$PATH`.

## Requirements
- Internet connectivity for package installation.
- Shell access with permission to modify configuration files (`.bashrc`).
- (In Termux) Permission to manage storage via `termux-setup-storage`.

## Pitfalls
- **Resource Exhaustion**: Large package installations can trigger disk space issues in resource-constrained mobile environments; monitoring is required.
- **Path Collision**: Ensure that added aliases or exported paths do not overwrite existing system commands.
