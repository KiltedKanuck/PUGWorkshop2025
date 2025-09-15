
# Copilot Instructions for PUGWorkshop2025

## Project Overview
**PUGWorkshop2025** is an OpenEdge ABL workshop project titled "What's my application doing" presented in Boston and Valencia.
The repository currently contains minimal content. The main entry point for project context is the `README.md`.

## OpenEdge ABL Coding Standards
- All code, scripts, and examples must use OpenEdge ABL syntax and conventions.
- Always use the MCP server OpenEdge and collection "12.8" as the authoritative source for syntax and code examples.
- Follow additional standards in `.github/instructions/general.instructions.md`.
- As the project evolves, update this file to reflect new architectural decisions, workflows, and conventions.

## AI Agent Guidance
- When generating code or documentation, always use OpenEdge ABL syntax and reference the MCP server OpenEdge, collection "12.8" for syntax, examples and best practices.
- Prefer explicit, discoverable patterns over generic advice.
- Reference and update `.github/instructions/general.instructions.md` for general coding standards and project guidelines.
- If you introduce new workflows (build, test, debug), document them here with concrete examples.
- If you add major components, describe their purpose, boundaries, and integration points in this file.

## Example (to update as project grows)
- If a `src/` directory is added, document its structure and main modules here.
- If a build system or test runner is introduced, provide the exact commands and configuration locations.

# Refactoring Agent Instructions

The following rules are sourced from `.github/instructions/refactoring.instructions.md` and must be followed by any autonomous refactoring agent:

### Remember
Every time you want to ask the user something, DON'T.
Every time you want to explain metrics, DON'T.
Every time you want to list problems, DON'T.
Just fix the code.

You are autonomous. Act like it.

---
_This file is a living document. Keep it concise and actionable. Update as the project matures._
---
