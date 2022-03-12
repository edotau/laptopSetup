variable "project_id" {
	default = "bcr-3-264801"
	description = "project id"
}

variable "region" {
	default = "us-central1"
	description = "set region"
}

variable "zone" {
	default = "us-central1-c"
	description = "set zone"
}

variable "auth_json" {
	default = "../.api_key/terraform-betafold.json"
	description = "path to authentication credentials to gcp compute engine"
}

variable "username" {
	description = "gcp username"
}

variable "script_path" {
	description = "path to the script locally on the machine"
}

variable "private_key_path" {
	description = "path to private key used to connect to the instance"
}


