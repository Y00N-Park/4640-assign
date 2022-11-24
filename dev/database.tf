
# Create a new MongoDB database cluster
resource "digitalocean_database_cluster" "mongodb-example" {
  name       = "example-mongo-cluster"
  engine     = "mongodb"
  version    = "4"
  size       = "db-s-1vcpu-1gb"
  region     = var.region
  node_count = 1

  private_network_uuid = digitalocean_vpc.web_vpc.id
}

resource "digitalocean_database_firewall" "mongodb-firewall" {
    
    cluster_id = digitalocean_database_cluster.mongodb-example.id
    # allow connection from resources with a given tag
    # for example if our droplets all have a tag "web" we could use web as the value
    rule {
        type = "tag"
        value = "assignmentdb"
    }
}

resource "digitalocean_droplet" "assignment2" {
  count  = var.droplet_count
  name   = "web-${count.index + 1}"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-22-04-x64"
  region = var.region
}
