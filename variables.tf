variable "tags" {
  description = "Tags"
  default = {}
}

variable "domain" {
  description = "Domian name to request ACM certificate"
}

variable "zone_ids" {
  description = "Zone Id"
  default = []
}

variable "alternative_domains" {
  description = "Domians name to request ACM certificates"
  default = []
}

variable "validate" {
  description = "Validate ACM certificates"
  default = true
}
