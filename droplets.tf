resource "digitalocean_droplet" "tinytrader" {
  count = 1
  image = "ubuntu-20-04-x64"
  name = "tinytrader-staging-${count.index+1}"
  region = "nyc1"
  size = "s-1vcpu-1gb"
  
  ssh_keys = [
    var.ssh_key_fingerprint
  ]

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.private_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.private_key} -e 'public_key=${var.public_key}' playbook.yml"
  }
}

output "droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.tinytrader:
    droplet.name => droplet.ipv4_address
  }
}