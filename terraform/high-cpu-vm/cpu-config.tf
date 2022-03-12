variable "name" {
	default = "gcp-terraform-vm"
	description = "cpu module used for betafold pipeline"
}

variable "instance" {
	default = "n2-standard-48"
	description = "base cpu"
}

variable "disk_id" {
	default = "comput-bootdisk"
}

variable "pd_disk" {
	default = "pd-ssd"
	description = "type of attached persistent disk used in analysis"
}

variable "script_path" {
	default = "scripts/bootstrap.sh"
	description = "start up script to perform apy-get update and install docker on gcp vm"
}

