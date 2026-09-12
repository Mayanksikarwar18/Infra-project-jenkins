terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-mgmt"
    storage_account_name = "sttfstatemgmt1209"
    container_name       = "tfstate"
    key                  = "infra-project.tfstate"
  }
}
