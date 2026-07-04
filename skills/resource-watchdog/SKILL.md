# Skill: system-sentinel

## Description
A real-time telemetry daemon designed to monitor system health, resource utilization (CPU/RAM/Disk), and integrity of critical agent files in Android/Termux or Linux environments.

## Capabilities
- **Resource Telemetry**: Continuously samples memory usage, disk space availability, and process load.
- **Integrity Auditing**: Monitors core configuration files for unauthorized changes or corruption via checksum verification.
- **Event Signaling**: Generates structured logs and alerts when system resource thresholds are breached (e.g., low disk space).
- **Background Persistence**: Capable of running as a non-blocking background process to ensure continuous monitoring without interfering with agent tasks.

## Workflow
1.  **Service Initialization**: Starts the telemetry sampling loop in a detached/background process.
2.  **Sampling Loop**: Periodically executes resource check commands (`df`, `free`, `top`) and monitors key directories.
3.  **Threshold Evaluation**: Compares real-time metrics against safety parameters (e.g., "disk < 10%").
4.  **Signal Dispatch**: If a breach occurs, it writes an alert to the agent log or triggers a task via the `orchestrator`.

## Requirements
- Access to system telemetry commands (`df`, `free`, `top`).
- Permission to write logs and monitor file status within the termux/linux environment.

## Pitfalls
- **Polling Frequency**: High-frequency sampling can consume excessive battery or CPU on mobile devices; use adaptive sleep intervals.
- **Resource Contention**: Monitoring processes should have low priority to ensure they do not interfere with user tasks.
