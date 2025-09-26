# PUGWorkshop2025

PUG Workshop 2025 - "What's my application doing" (Boston & Valencia)

This repository contains OpenEdge ABL code and demos for application observability, profiling, and diagnostics. 

## Project Structure

```
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

---
_This project provides comprehensive examples for OpenEdge application observability, profiling, and diagnostics, enhanced with AI-powered development tools. Each demo folder contains detailed instructions for specific use cases._
