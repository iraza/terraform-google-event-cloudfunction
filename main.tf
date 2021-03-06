
resource "google_storage_bucket" "bucket" {
  name = "${var.service_name}-${var.function_name}-cloud-function-bucket"
}

resource "google_storage_bucket_object" "archive" {
  name   = "${var.service_name}-${var.function_name}-${filemd5(var.source_zip_file)}.zip"
  bucket = google_storage_bucket.bucket.name
  source = "${var.source_zip_file}"
}

resource "google_cloudfunctions_function" "functionEvent" {
  name        = "${var.service_name}-${var.function_name}"
  description = "${var.function_description}"
  runtime     = "java11"

  available_memory_mb   = var.memory
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  entry_point           = "${var.entry_point_class_name}"

  event_trigger {
    event_type = "${var.event_trigger_type}"
    resource   = "${var.event_trigger_resource}"
  }
}
