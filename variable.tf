
variable "service_name" {
  type = string
}
variable "function_name" {
  type = string
}
#build/distributions/${var.cloud_function_archive_file_name}
variable "source_zip_file" {
  type = string
}

variable "function_description" {
  type = string
}

variable "entry_point_class_name" {
  type = string
}

variable "event_trigger_type" {
  type = string

}

variable "event_trigger_resource" {
  type = string

}

variable "memory" {
  type = string
}


