# trade-tariff-lambdas-uk-issues-mailer

Scheduled go lambda function to notify HMRC team when there are priority 1 and priority 2 issues with the latest CDS files.

This is anticipated to help with early alerting with these issues

```mermaid
sequenceDiagram
    participant Scheduler as Scheduler
    participant Lambda as Lambda
    participant AWS S3 Bucket as AWS S3 Bucket
    participant AWS SES as AWS SES
    participant HMRC as HMRC

    Scheduler->>Lambda: Trigger at 08:00 AM
    Lambda->>AWS S3 Bucket: GET XML file from AWS S3 Bucket
    API-->>Lambda: XML file data
    Lambda->>Lambda: Determine known issues with Measures and Goods Nomenclature from XML
    Lambda->>AWS SES: Compose HTML email with P1 and P2 issues content
    AWS SES->>HMRC: Send HTML email
```
