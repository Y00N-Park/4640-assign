data "digitalocean_ssh_key" "ssh_key" {
  name = "ACIT4640"
}

data "digitalocean_project" "lab_project" {
  name = "first-project"
}
