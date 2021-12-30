provider "vault" {
  address = "http://152.70.64.188:8200"
  auth_login {
    path = "auth/userpass/login/sravan"
    parameters = {
      password = "sravan"
    }
  }
}
data "vault_generic_secret" "gcp_credentials" {
  path = "gcp/gcp_key"
}

provider "google" {
  credentials = data.vault_generic_secret.gcp_credentials.data["auth_key"]
  project     = "web-project-333613"
}
