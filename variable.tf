variable "instance_name" {
  type        = string
  description = "the name of the instance for DB"
  default     = "mydb"
}

// required
variable "database_version" {
  description = "The database version to use"
  type        = string
  default     = "MYSQL_5_7"
}

// required
variable "region" {
  description = "The region of the Cloud SQL resources"
  type        = string
  default     = "us-central1"
}


// Master
variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-n1-standard-1"
}


variable "disk_autoresize" {
  description = "Configuration to increase storage size"
  type        = bool
  default     = true
}

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}


variable "db_name" {
  description = "The name of the default database to create"
  type        = string
  default     = "default"
}

variable "db_charset" {
  description = "The charset for the default database"
  type        = string
  default     = ""
}

variable "root_password" {
  description = "MySQL password for the root user."
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = false
}