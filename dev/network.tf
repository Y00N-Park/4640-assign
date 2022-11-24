# Create a new vpc

resource "digitalocean_vpc" "web_vpc" {
  name    = "vpcassignment"
  region  = var.region
}
