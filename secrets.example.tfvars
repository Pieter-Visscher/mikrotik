# match the variable to your workspace name and variables used in providers.tf
example_password  = "secret"
example_host_url  = "http://your.mikrotik"

# name of secrets must match name of wifi config"
# password primary gets used for config primary
wifi_passwords = {
  primary = "super-secret-password"
  backup  = "another-secret-password"
}
