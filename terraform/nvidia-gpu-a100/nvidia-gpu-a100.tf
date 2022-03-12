variable "name" {
	default = "betafold-gpu-a100"
	description = "gpu module used for betafold pipeline"
}

variable "compute" {
	default = "a2-highgpu-1g"
	description = "base gpu"
}

variable "accelerator" {
	default = "nvidia-tesla-a100"
	description = "accelerator gpu type"
}

variable "num_gpu" {
	default = 1
	description = "set number of gpus on vm"
}

variable "img_snapshot" {
	default = "projects/bcr-3-264801/global/snapshots/betafold-snapshot-datapipe"
	description = "snapshot of 5TB disk boot disk containing alphafold2 database in the /mnt directory"
}

variable "disk_id" {
	default = "betafold-gpu"
	description = "name/id used to name the disk that is made from the snapshot image"
}

variable "pd_disk" {
	default = "pd-ssd"
	description = "type of attached persistent disk used in analysis"
}

