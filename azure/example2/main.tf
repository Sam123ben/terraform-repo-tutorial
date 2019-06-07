variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}

provider "azurerm" {
#   version         = "ENTER THE VERSION OF THE AZURERM API WHICH COULD BE FOUND FROM THE DOC"
#   client_id       = "GET THE CLIENT ID FROM THE AZURE PORTAL FROM THE SMP"
#   client_secret   = "GET THE CLIENT SECRET FROM THE AZURE PORTAL FROM THE SMP"
#   tenant_id       = "GET THE TENTANT ID FROM THE AZURE PORTAL FROM THE SMP"
#   subscription_id = "GET THE SUBSRIPTION ID FROM THE AZURE PORTAL FROM THE SMP"

    version         = "=1.28.0"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
    subscription_id = "${var.subscription_id}"
}

### All these are maintained in the hashicorp terraform doc
resource "azurerm_resource_group" "web_server_sam" {
    name = "sam-web-app"
    location = "australiasoutheast"
  ### you can use the command to get the region name "az account list-locations"
  #  Eg:     
  #   {
  #     "displayName": "Australia Southeast",
  #     "id": "/subscriptions/4572bdc6-974d-48cf-ba64-3ae6e0442345/locations/australiasoutheast",
  #     "latitude": "-37.8136",
  #     "longitude": "144.9631",
  #     "name": "australiasoutheast",
  #     "subscriptionId": null
  #   },
}

resource "azurerm_virtual_network" "web_server_sam_vm" {
  name                = "tutorial-network"
  resource_group_name = "${azurerm_resource_group.web_server_sam.name}"
  location            = "${azurerm_resource_group.web_server_sam.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "web_server_sam_vm_subnet" {
  name                 = "internal"
  virtual_network_name = "${azurerm_virtual_network.web_server_sam_vm.name}"
  resource_group_name = "${azurerm_resource_group.web_server_sam.name}"
  address_prefix       = "10.0.1.0/24"
}