packer {
    required_plugins{
        virtualbox = {
        version = ">= 0.0.1"
        source = "github.com/hashicorp/virtualbox"
        }
    }
}
source "virtualbox-iso" "basic-example" {
    guest_os_type = "Ubuntu_64"
    iso_url = "https://old-releases.ubuntu.com/releases/kinetic/ubuntu-22.10-live-server-amd64.iso"
    iso_checksum = "md5:88ed88a1fe5ba10d774a612094d6d295"
    ssh_username = "packer"
    ssh_password = "packer"
    shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
}

build {
    sources = ["sources.virtualbox-iso.basic-example"]

    provisioner "shell" {
        inline = [
            "sudo apt-get update",
            "sudo sudo apt install -y nginx"
        
        ]
   }
}
