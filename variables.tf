# Prefix and tags

variable "prefix" {
  description = "Prefix to append to all resource names"
  type        = string
  default     = "staticwebsite"
}

# Resource groups

variable "location" {
  description = "Location for the resource group"
  type        = string
  default     = "East US"
}

# Storage account

variable "saVars" {
  description = "Storage account variables"
  type        = map(string)
  default = {
    "account_kind"             = "StorageV2"
    "account_tier"             = "Standard"
    "access_tier"              = "Hot"
    "account_replication_type" = "LRS"
  }
}

variable "blobs" {
  description = "Files to upload to the container"
  type        = map(string)
  default = {
    "index.html" = "./index.html"
    "404.html"   = "./404.html"
  }
}