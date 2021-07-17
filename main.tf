provider "google" {
 credentials = file("cre.json")
 project     = "playground-s-11-b5035d6a"
 region      = "us-central1"
}

resource "google_compute_instance" "default" {
 name         = "vm-from-terraform"
 machine_type = "f1-micro"
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-1804-lts"
   }
 }

 network_interface {
   network = "default"

   access_config {
   }
 }
  metadata_startup_script= file("startup.sh")
  tags = ["http-server"]
}

output "ip" {
	value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
