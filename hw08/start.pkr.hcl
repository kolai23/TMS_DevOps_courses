packer {
    required_plugins{
        virtualbox = {
        version = ">= 0.0.1"
        source = "github.com/hashicorp/virtualbox"
        }
    }
}
source "virtualbox-iso" "basic-example" {
    
    vboxmanage = [
        ["modifyvm", "{{.Name}}", "--memory", "1024"],
        ["modifyvm", "{{.Name}}", "--cpus", "2"],
    ]
    guest_os_type = "Ubuntu_64"
    iso_url = "https://old-releases.ubuntu.com/releases/kinetic/ubuntu-22.10-live-server-amd64.iso"
    iso_checksum = "md5:88ed88a1fe5ba10d774a612094d6d295"
    ssh_username = "packer"
    ssh_password = "packer"
    
    shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
}

provisioner "shell" {
    inline = [
        "sudo apt update",
        "sudo apt install -y nginx"

    ]
}

build {
    sources = ["sources.virtualbox-iso.basic-example"]
}
