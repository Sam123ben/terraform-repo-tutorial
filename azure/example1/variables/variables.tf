variable "check_version" {
  default = "0.12"
}

variable "locations" {
  type    = "map"
  default = {
    location1 = "australiasoutheast"
    location2 = "australiaeast"
  }
}

variable "subnets" {
  type    = "list"
  default = ["10.0.1.10","10.0.1.11"]
}

variable "live" {
  type    = "string"
  default = "true"
}