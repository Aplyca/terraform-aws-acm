Terraform AWS Certificate Manager module
========================================

Create and validate a Certificate with AWS Certificate manager. Support multi-domain certificates

Example
-------

```
module "certificate" {
  source  = "Aplyca/acm/aws"
  domain   = "example.com"
  zone_ids = [
    "***********",
    "***********"
  ]
  alternative_domains = [
    "*.example.com"
  ]
  tags {
    Name = "Example"
  }
}
```
