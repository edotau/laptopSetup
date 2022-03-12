variable "project_id" {
	default = "bcr-3-264801"
	description = "project id"
}

variable "region" {
	default = "us-west1"
	description = "set region"
}

variable "zone" {
	default = "us-west1-b"
	description = "set zone"
}

variable "auth_json" {
	default = "/Users/eric.au/.api_keys/bcr_admin.json"
	description = "path to authentication credentials to gcp compute engine"
}

variable "username" {
	description = "gcp username"
}

variable "private_key_path" {
	description = "path to private key used to connect to the instance"
}

