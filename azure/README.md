# terraform-repo-tutorial
Learn terraform and its usage on how to create resources on aws, azure and google clouds


## Basic start up commands
terraform init
terraform plan
terraform apply
terraform destroy

####
create your SPN details and fetch the below deatils:

client_id
client_secret
tenant_id
subscription_id

Two ways we can start doing the above vars and values  vy setting them directly into the terraform file as below [never recommended]:

provider "azurerm" {
    version         = "=1.28.0"
    client_id       = "123********"
    client_secret   = "123********"
    tenant_id       = "123********"
    subscription_id = "123********"
}

Or set it to the environment variables with a prefix as TF_VAR_*** and then interpolation will be done as part of the ansible and will help the terraform create the resources by fetching them from the env vars.

export TF_VAR_subscription_id=4572bdc6-#######

  ### you can use the below command to get the region name "az account list-locations"
  #  Eg:     
  #   {
  #     "displayName": "Australia Southeast",
  #     "id": "/subscriptions/4572bdc6-974d-48cf-ba64-3ae6e0442345/locations/australiasoutheast",
  #     "latitude": "-37.8136",
  #     "longitude": "144.9631",
  #     "name": "australiasoutheast",
  #     "subscriptionId": null
  #   },