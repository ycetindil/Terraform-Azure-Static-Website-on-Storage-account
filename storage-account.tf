
resource "random_integer" "randint" {
  min = 1000
  max = 9999
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.prefix}${random_integer.randint.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_kind             = var.saVars["account_kind"]
  account_tier             = var.saVars["account_tier"]
  access_tier              = var.saVars["access_tier"]
  account_replication_type = var.saVars["account_replication_type"]

  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }
}

resource "azurerm_storage_blob" "website" {
  for_each               = var.blobs
  name                   = each.key
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = each.value
}

