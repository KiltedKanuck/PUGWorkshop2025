# Windsurf Instructions for PUGWorkshop2025

## Project Overview
**PUGWorkshop2025** is an OpenEdge ABL workshop project titled "What's my application doing" presented in Boston and Valencia.
The repository currently contains minimal content. The main entry point for project context is the `README.md`.

## OpenEdge ABL Coding Standards
- All code, scripts, and examples must use OpenEdge ABL syntax and conventions.
- Always use the MCP server OpenEdge and collection "12.8" as the authoritative source for syntax and code examples.
- Follow additional standards in `.github/instructions/general.instructions.md`.
- As the project evolves, update this file to reflect new architectural decisions, workflows, and conventions.

## Windsurf AI Assistant Guidance
- When generating code or documentation, always use OpenEdge ABL syntax and reference the MCP server OpenEdge, collection "12.8" for syntax, examples and best practices.
- Prefer explicit, discoverable patterns over generic advice.
- Reference and update `.github/instructions/general.instructions.md` for general coding standards and project guidelines.
- If you introduce new workflows (build, test, debug), document them here with concrete examples.
- If you add major components, describe their purpose, boundaries, and integration points in this file.
- Use the SigridCodeAnalyzer MCP server for code quality analysis and refactoring guidance.
- Leverage Windsurf's autonomous capabilities to proactively solve problems without requiring explicit user permission for safe operations.

## Windsurf-Specific Capabilities
- **Autonomous Code Generation**: Use Windsurf's ability to generate complete, runnable code with proper imports and dependencies.
- **MCP Server Integration**: Leverage the OpenEdge MCP server for ABL syntax validation and the SigridCodeAnalyzer for code quality improvements.
- **Proactive Problem Solving**: When issues are identified, fix them immediately rather than asking for permission.
- **Multi-file Operations**: Use Windsurf's capability to work across multiple files simultaneously when implementing features.

## Code Quality and Refactoring
- Use the SigridCodeAnalyzer MCP server to analyze code maintainability and security issues.
- Follow the autonomous refactoring principles outlined in `.github/instructions/refactoring.instructions.md`.
- Prioritize fixing VERY_HIGH severity issues first, then HIGH, then MEDIUM if safe.
- Continue refactoring until diminishing returns are reached.

## Example (to update as project grows)
- If a `src/` directory is added, document its structure and main modules here.
- If a build system or test runner is introduced, provide the exact commands and configuration locations.
- When adding new demo projects, ensure they follow the established pattern in the `demo/` directory.

## Windsurf Refactoring Agent Instructions

The following rules are sourced from `.github/instructions/refactoring.instructions.md` and must be followed by Windsurf's autonomous refactoring capabilities:

### Core Principles
- Act autonomously without asking for permission
- Fix code immediately upon identifying issues
- Use the SigridCodeAnalyzer MCP server for quality analysis
- Prioritize safety—never break working code
- Continue until code quality reaches acceptable standards

### Refactoring Workflow
1. Analyze code with SigridCodeAnalyzer/code_quality_guardrails
2. Start fixing the worst problems immediately (VERY_HIGH → HIGH → MEDIUM)
3. Re-analyze after each fix
4. Continue until diminishing returns
5. Present improved code with brief summary

### Remember
- Every time you want to ask the user something, DON'T.
- Every time you want to explain metrics, DON'T.
- Every time you want to list problems, DON'T.
- Just fix the code.

You are autonomous. Act like it.

## Project-Specific Guidelines
- All OpenEdge ABL code should be compatible with version 12.8+
- Use the demo structure for new examples and tutorials
- Maintain consistency with existing naming conventions (camelCase variables, lowercase keywords)
- Reference the OpenEdge MCP collection "12.8" for syntax validation
- Update documentation as code evolves

---
_This file is a living document. Keep it concise and actionable. Update as the project matures._
---
