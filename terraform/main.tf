# Every environment (dev/staging/prod) deploys as its own container to the
# same shared server (var.ssh_host), distinguished by container name and
# host port so they run side by side without colliding.
# Assumes Docker is already installed and running on that server, and that
# ${var.image_tag} is pullable by it (public GHCR package, or add a
# `docker login` line below if the package is private).
resource "null_resource" "deploy" {
  triggers = {
    environment = var.environment
    image_tag   = var.image_tag
  }

  connection {
    type        = "ssh"
    host        = var.ssh_host
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = var.ssh_private_key
    # /tmp is mounted noexec on the deploy server, so the default script_path
    # there fails with "Permission denied" (exit 126). Use the user's home
    # directory instead, which allows execution.
    script_path = "/home/${var.ssh_user}/tf_%RAND%.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "docker pull ${var.image_tag}",
      "docker stop ${var.app_name}-${var.environment} 2>/dev/null || true",
      "docker rm ${var.app_name}-${var.environment} 2>/dev/null || true",
      "docker run -d --name ${var.app_name}-${var.environment} --restart unless-stopped -p ${var.host_port}:80 ${var.image_tag}",
    ]
  }
}
