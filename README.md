# PUGWorkshop2025

PUG Workshop 2025 - "What's my application doing" (Boston & Valencia)

This repository contains OpenEdge ABL code and demos for application observability, profiling, and diagnostics. All code follows OpenEdge ABL standards and references the MCP server OpenEdge, collection "12.8" for syntax and best practices.

## Project Structure

```
.github/
	copilot-instructions.md      # GitHub Copilot instructions
	windsurf-instructions.md     # Windsurf AI Assistant instructions
	instructions/                # Additional instruction files
.windsurf/
	rules/
		code-style-guide.md      # Windsurf coding style rules
		general-guidelines.md    # General project guidelines
demo/
	1-RuntimeDiagnostics/        # Runtime diagnostics and logging features
	2-OpenTelemetry/             # OpenTelemetry tracing and metrics demo
	3-OpenEdgeMemoryProfiler/    # Memory profiler demo for OpenEdge
	4-CPUProfiler/               # CPU profiler demo (ABL & PASOE)
lab/                             # Lab exercises and additional examples
src/
	main/abl/
		client/                  # Client-side ABL code (remote.p for PASOE connections)
		examples/                # Sample ABL procedures for profiling and testing
		OpenEdge/Workshop/       # Workshop-specific ABL classes and interfaces
	main/resources/
		ablapps/                 # PASOE application configuration
		adapters/                # Web adapter configurations
		oemp/                    # OpenEdge Memory Profiler configurations
		oprof/                   # CPU profiler configurations and JMX queries
		otel/                    # OpenTelemetry configurations
	test/abl/                    # Test ABL code
	test/resources/              # Test resources
```

## Demos

- **Runtime Diagnostics**: See `demo/1-RuntimeDiagnostics/README.md` for enhanced logging features, log entry types, and application-level logging using the OpenEdge Logger framework.
- **CPU Profiler**: See `demo/2-CPUProfiler/README.md`. Example code and setup for both ABL Performance Profiling and Server-Side ABL Performance Profiling in PASOE.
- **OpenTelemetry**: See `demo/3-OpenTelemetry/README.md` for setup and usage. Demonstrates tracing and metrics in OpenEdge 12.8+ using OpenTelemetry APIs and configuration.
- **OpenEdge Memory Profiler**: See `demo/4-OpenEdgeMemoryProfiler/README.md`. Tools and code for memory profiling in OpenEdge, including sample procedures and configuration.

## Key Features

### Client-Server Connectivity
- **PASOE Connection**: `src/main/abl/client/remote.p` demonstrates proper PASOE connection syntax using the `-URL` parameter
- **Example Procedures**: Multiple sample ABL procedures in `src/main/abl/examples/` for testing profiling and diagnostics

### Configuration Files
- **OpenTelemetry**: JSON configurations for both standalone and PASOE environments
- **Memory Profiler**: Configuration files for OpenEdge Memory Profiler
- **CPU Profiler**: Profile configuration and JMX query files for performance monitoring
- **PASOE**: Application and adapter configurations for Progress Application Server

### Deployment
- **Automated Deployment**: `src/main/deploy.bat` script for copying resources to PASOE server directories
- **Project Configuration**: `openedge-project.json` with proper source paths and database connections

## AI Assistant Integration

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

---
_This project provides comprehensive examples for OpenEdge application observability, profiling, and diagnostics, enhanced with AI-powered development tools. Each demo folder contains detailed instructions for specific use cases._
