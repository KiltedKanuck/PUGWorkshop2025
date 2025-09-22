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

* Note: you will note that we have two exporters. One is ```otlp``` and the other is ```ostream```. ```otlp``` is the OpenTelemetry Protocol and ```ostream``` is a simple file exporter. ```otlp``` is the one we will use for this workshop.
```ostream``` is useful for debugging and testing. This will write to the current working directory. This data can be manually imported into any APM tool like Jaeger.

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
## Visualize
Open our shared Jaeger instance at 
[Workshop Jaeger](http://ec2-13-217-224-70.compute-1.amazonaws.com:16686/search)

I chose Jaeger because it is a very popular open source APM tool. It is also very easy to set up and use. If you want more information no how to set up your own Jaeger instance, check out the [Jaeger Documentation](https://www.jaegertracing.io/docs/1.50/getting-started/).

Jager is just one of many options for visualizing your OpenTelemetry data. Several other examples include:
1. [Elastic](https://www.elastic.co/guide/en/apm/agent/open-telemetry/7.17/apm-open-telemetry.html)
2. [Datadog](https://docs.datadoghq.com/tracing/trace_collection/open_telemetry/)
3. [New Relic](https://docs.newrelic.com/docs/observability/trace/trace-data/trace-data-collection/open-telemetry/)