# The API Token
variable "do_token" {}

# Default region to sfo3
variable "region" {
  type    = string
  default = "sfo3"
}

# Default droplet count
variable "droplet_count" {
  type    = number
  default = 1
}
