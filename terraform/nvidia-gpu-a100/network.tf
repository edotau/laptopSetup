variable "vpc_network" {
	default = "betafold-network-vpc"
	description = "the dedicated vpc used by the betafold pipeline to create subnets"
}

resource "google_compute_address" "static" {
	name = "ipv4-static-${var.region}"
}

variable "bli_subnet" {
	default = "betafold-gpu"
	description = "name of vpc subnetwork used exclusively in the betafold cpu pipeline"
}

variable "ip_range" {
	default = "10.70.0.0/24"
	description = "decide on an ip range that does not conflict with other ip addresses within the subnetwork"
}

resource "google_compute_subnetwork" "subnet" {
	name          = "${var.bli_subnet}-${var.region}-subnet"
	region        = var.region
	network       = var.vpc_network
	ip_cidr_range = var.ip_range
}

