# Open Telemetry
OpenTelemetry is a collection of APIs, SDKs, and tools. Use it to instrument, generate, collect, and export telemetry data (metrics, logs, and traces) to help you analyze your software’s performance and behavior.

[What is OpenTelemetry ](https://opentelemetry.io/docs/what-is-opentelemetry/)

[OpenEdge OpenTelemetry Documentation](https://docs.progress.com/bundle/openedge-abl-troubleshoot-applications/page/Monitor-ABL-applications-using-OpenTelemetry.html)

## About
1. First introduced into OpenEdge in 12.8
2. METRICS (db and PASOE) are supported throught OECC
3. TRACE is supported in both Native AVM and PASOE
4. LOG is NOT supported at this time. There are other options for this.

## OpenEdge Config
Inside the file called ```otelconfig.json``` we define the 'exporter' along with the 'OpenEdgeTelemetryConfiguration'. Our endpoint is in AWS, so we will use the following configuration. 
```
{
  "OpenTelemetryConfiguration": {
    "resource_attributes": "service.name=PUGWorkshop2025DemoApp",
    "exporters": {
      "otlp": {
        "grpc": [
          {
            "endpoint": "http://ec2-13-217-224-70.compute-1.amazonaws.com:4317",
            "span_processor": "batch",
            "batch_processor_options": {
              "max_queue_size": 500
            }
          }
        ]
      },
      "ostream": [
        {
          "filename": "otelTraceData.out",
          "span_processor": "simple"
        }
      ]
    }
  },
  "OpenEdgeTelemetryConfiguration": {
    "trace_procedures": "*",
    "trace_classes": "*",
    "trace_abl_transactions": true,
    "trace_requires_parent": true,
    "trace_request_start": true
  }
}
```
*Note: Your config endpoint will be different.

## Enable 
Now we should run the code and collect some tracing
```
cd ./src
pro -otelconfig otelconfig.json -profile prof.cfg -p mainproc.p
```
