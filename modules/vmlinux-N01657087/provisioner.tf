// vmlinux-N01657087/provisioner.tf

resource "null_resource" "linux_provisioner" {
  for_each = azurerm_linux_virtual_machine.linux_vm

  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key_path)
      host        = azurerm_public_ip.linux_pip[each.key].ip_address
    }
  }
}





