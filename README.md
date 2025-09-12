# PUGWorkshop2025

PUG Workshop 2025 - "What's my application doing" (Boston & Valencia)

This repository contains OpenEdge ABL code and demos for application observability, profiling, and diagnostics. All code follows OpenEdge ABL standards and references the MCP server OpenEdge, collection "12.8" for syntax and best practices.

## Project Structure

```
demo/
	1-OpenTelemetry/         # OpenTelemetry tracing and metrics demo
	2-OpenEdgeMemoryProfiler/# Memory profiler demo for OpenEdge
	3-CPUProfiler/           # CPU profiler demo
src/
	main/abl/                # (empty, for future main ABL code)
	main/resources/          # (empty, for future resources)
	test/abl/                # (empty, for future test code)
	test/resources/          # (empty, for future test resources)
```

## Demos

- **OpenTelemetry**: See `demo/1-OpenTelemetry/README.md` for setup and usage. Demonstrates tracing and metrics in OpenEdge 12.8+ using OpenTelemetry APIs and configuration.
- **OpenEdge Memory Profiler**: See `demo/2-OpenEdgeMemoryProfiler/README.md`. Tools and code for memory profiling in OpenEdge, including sample procedures and configuration.
- **CPU Profiler**: See `demo/3-CPUProfiler/README.md`. Example code and setup for CPU profiling in OpenEdge.

## Coding Standards

- All code uses OpenEdge ABL syntax and conventions.
- Variable names use camelCase; keywords are lowercase.
- Reference the MCP server OpenEdge, collection "12.8" for syntax and best practices.
- See `.github/copilot-instructions.md` and `.github/instructions/general.instructions.md` for more details.

---
_This project is evolving. Please see individual demo folders for detailed instructions and updates._
