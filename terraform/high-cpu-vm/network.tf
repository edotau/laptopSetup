variable "vpc_network" {
	default = "gcloud"
	description = "the dedicated vpc used by the betafold pipeline to create subnets"
}

variable "route" {
	default = "bli-subnetwork"
	description = "name of vpc subnetwork used exclusively in the betafold cpu pipeline"
}

variable "ip_address" {
	default = "10.30.11.0/24"
	description = "ip range that does not conflict with other ip addresses within the subnetwork"
}

resource "google_compute_address" "static" {
	name = "ipv4-static-${var.route}-${var.region}"
}

resource "google_compute_network" "vpc" {
	name                    = "${var.vpc_network}-vpc"
	auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
	name          = var.route
	region        = var.region
	network       = google_compute_network.vpc.name
	ip_cidr_range = var.ip_address
}

resource "google_compute_firewall" "firewall" {
	name    = "${var.name}-firewall"
	network = "${google_compute_network.vpc.name}"

	allow {
		protocol = "icmp"
	}
	allow {
		protocol = "tcp"
		ports    = ["22"]
	}

	source_ranges = ["0.0.0.0/0"]
}
