output "server_ip" {
  value = digitalocean_droplet.assignment.*.ipv4_address
}

output "database_url" {
  value = digitalocean_database_cluster.mongodb-example.id
  sensitive = true
}

output "bastion_ip" {
  value = digitalocean_droplet.bastion.ipv4_address
}

output "loadbalancer_ip" {
  value = digitalocean_loadbalancer.public.ip
}
