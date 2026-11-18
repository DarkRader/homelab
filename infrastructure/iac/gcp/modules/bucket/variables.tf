variable "name" {
  type        = string
  description = "Globally unique GCS bucket name"
}

variable "location" {
  type        = string
  default     = "EUROPE-WEST3"
  description = "GCS bucket location or region"
}

variable "storage_class" {
  type        = string
  default     = "STANDARD"
  description = "Storage class (STANDARD, NEARLINE, COLDLINE)"
}

variable "versioning" {
  type        = bool
  default     = false
  description = "Enable object versioning (usually false for CNPG/Barman backups since Barman manages retention)"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Allow deleting bucket even if it contains objects"
}

variable "retention_days" {
  type        = number
  default     = null
  description = "Optional lifecycle rule to automatically delete objects older than N days"
}

variable "noncurrent_retention_days" {
  type        = number
  default     = null
  description = "Optional lifecycle rule to delete noncurrent object versions after N days (when versioning is enabled)"
}

variable "soft_delete_retention_seconds" {
  type        = number
  default     = 604800 # 7 days (GCP default); set to 0 to disable soft delete and save storage costs on churned WAL files
  description = "Soft delete retention duration in seconds (0 to disable, or 604800 to 7776000)"
}

variable "labels" {
  type    = map(string)
  default = {}
}
