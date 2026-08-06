environment = "dev"
app_name    = "cicd-demo"
ssh_host    = "151.106.41.61"
ssh_user    = "github-deploy" # SSH username on the server
ssh_port    = 22
host_port   = 8081

# ssh_private_key is intentionally NOT set here — it's supplied at apply time
# via the GitHub Environment secret SSH_PRIVATE_KEY (see README setup steps).
