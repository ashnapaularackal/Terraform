module "resource_group" {
  source              = "./modules/rgroup-N01657087"
  resource_group_name = "N01657087-RG"
  location            = "Canada East"
}


module "network" {
  source              = "./modules/network-N01657087"
  network_rg_name     = module.resource_group.resource_group_name
  network_rg_location = module.resource_group.location
  vnet_name           = "N01657087-VNET"
  vnet_aspace         = ["10.0.0.0/16"]
  subnet1             = "N01657087-SUBNET"
  subnet1_aspace      = ["10.0.0.0/24"]
  nsg_name            = "N01657087-NSG"
}


module "common" {
  source              = "./modules/common-N01657087"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
}



module "vmlinux" {
  source                     = "./modules/vmlinux-N01657087"
  linux_rg_name              = module.resource_group.resource_group_name
  linux_rg_location          = module.resource_group.location
  subnet1_id                 = module.network.subnet_id
  boot_diagnostics_storage_uri = module.common.storage_account_primary_blob_endpoint
  vm_instances               = {
    "n01657087-u-vm1" = {}
    "n01657087-u-vm2" = {}
    "n01657087-u-vm3" = {}
  }

  lb_backend_pool_id         = module.loadbalancer.lb_backend_pool_id
}





module "vmwindows" {
  source                     = "./modules/vmwindows-N01657087"
  windows_rg_name            = module.resource_group.resource_group_name
  windows_rg_location        = module.resource_group.location
  subnet2_id                 = module.network.subnet_id
  boot_diagnostics_storage_uri = module.common.storage_account_primary_blob_endpoint
}


module "datadisks" {
  source              = "./modules/datadisk-N01657087"
  location            = module.resource_group.location 
  resource_group      = module.resource_group.resource_group_name
  disk_name_prefix    = "datadisk"
  vm_ids              = concat(module.vmwindows.windows_vm_ids, module.vmlinux.linux_vm_ids)
}



module "loadbalancer" {
  source              = "./modules/loadbalancer-N01657087"
  resource_prefix     = "n01657087"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  assignment          = "Assignment1"
  name                = "ashna.paul"
  expiration_date     = "2024-12-31"
  environment         = "Learning"
}


module "database" {
  source                = "./modules/database-N01657087"
  server_name           = "postgresql-server-n01657087"
  location              =  module.resource_group.location
  resource_group_name   =  module.resource_group.resource_group_name
  administrator_login   = "n01657087"
  administrator_login_password = "Sona@2806june"
  database_name         = "db_server_name"
 }












