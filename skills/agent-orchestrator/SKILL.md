# Skill: orchestration-core

## Description
The cognitive engine of the Hermes Agent; responsible for high-level goal decomposition, task sequencing, and multi-agent coordination. It functions as the central decision-making node in a distributed agentic workflow.

## Capabilities
- **Goal Decomposition**: Breaks complex user intents into a Directed Acyclic Graph (DAG) of atomic, executable sub-tasks.
- **Dynamic Task Execution**: Schedules tasks based on dependency resolution and resource availability.
- **Stateful Context Management**: Maintains an evolving world-model and conversation history to ensure continuity across multiple agent turns.
- **Result Synthesis**: Aggregates divergent outputs from specialized leaf agents into a single, coherent response for the user.

## Workflow
1.  **Analysis**: Ingests a high-level user goal and identifies required tool dependencies.
2.  **Planning**: Generates a step-by-step execution plan with explicit task orderings.
3.  **Orchestration Loop**: 
    *   Dispatches sub-tasks to specialized agents via `delegate_task`.
    *   Monitors background processes using non-blocking polling (`process(action="poll")`).
    *   Evaluates results and handles error recovery logic (retries or re-planning).
4.  **Consolidation**: Synthesizes final outputs and presents the resolved solution to the user.

## Requirements
- Access to `terminal` and `execute_code` for task execution.
- Ability to manage asynchronous background processes.
- Standard structured data parsing skills (JSON/Markdown parsing).

## Pitfalls
- **Infinite Recursion**: Must avoid recursive goal decomposition without a depth limit or state check to prevent operational loops.
- **Context Explosion**: Large amounts of stdout from sub-agents must be summarized to stay within context window limits.
,