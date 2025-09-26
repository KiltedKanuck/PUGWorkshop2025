# Extras
All code follows OpenEdge ABL standards and references the MCP server OpenEdge, collection "12.8" for syntax and best practices.

## AI Assistant Integration
```
.github/
	copilot-instructions.md      # GitHub Copilot instructions
	windsurf-instructions.md     # Windsurf AI Assistant instructions
	instructions/                # Additional instruction files
.windsurf/
	rules/
		code-style-guide.md      # Windsurf coding style rules
		general-guidelines.md    # General project guidelines
```
### Windsurf AI Assistant
This project is optimized for use with **Windsurf AI Assistant**, featuring:
- **Autonomous Code Generation**: Complete, runnable OpenEdge ABL code with proper imports and dependencies
- **MCP Server Integration**: Direct access to OpenEdge collection "12.8" for syntax validation and best practices
- **Code Quality Analysis**: Integrated SigridCodeAnalyzer for maintainability and security analysis
- **Proactive Problem Solving**: Autonomous refactoring and issue resolution
- **Multi-file Operations**: Seamless work across multiple files and project components

### Configuration Files
- **Windsurf Instructions**: `.github/windsurf-instructions.md` - Main AI assistant guidance
- **Coding Style Rules**: `.windsurf/rules/code-style-guide.md` - Enforced coding standards
- **General Guidelines**: `.windsurf/rules/general-guidelines.md` - Project contribution guidelines

## Coding Standards

### OpenEdge ABL Standards
- All code uses OpenEdge ABL syntax and conventions compatible with version 12.8+
- Variable names use camelCase; keywords are lowercase
- Prefer `var` statement over `define variable` for variable declarations
- Never use hyphens in variable names
- Reference the MCP server OpenEdge, collection "12.8" for authoritative syntax and best practices

### Code Quality
- Use ABLUnit testing framework for unit and integration tests
- Follow security best practices (input validation, output sanitization)
- Consider performance implications (memory usage, execution time)
- Maintain clear documentation and meaningful commit messages
- See `.github/windsurf-instructions.md` for comprehensive AI assistant guidance

## MCP Server Integration

This project leverages **Model Context Protocol (MCP)** servers for enhanced development capabilities:

### OpenEdge MCP Server
- **Collection**: "12.8" - Authoritative source for OpenEdge ABL syntax, examples, and best practices
- **Usage**: Automatic syntax validation, code completion, and best practice enforcement
- **Integration**: Seamlessly integrated with Windsurf AI Assistant for real-time guidance

### SigridCodeAnalyzer MCP Server
- **Purpose**: Enterprise-grade static analysis for maintainability and security
- **Capabilities**: Code smell detection, complexity analysis, security vulnerability identification
- **Workflow**: Autonomous refactoring with priority-based issue resolution (VERY_HIGH → HIGH → MEDIUM)
