module "resource_group" {
  source   = "./RG/resource_group"
  name     = "my-resource-group"
  location = "Southeast Asia"
  tags     = {
    Environment = "dev"
    Project     = "Project Name"
  }
}
