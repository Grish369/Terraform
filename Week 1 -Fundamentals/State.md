
# Import

### Terraform supports bringing your existing infrastructure under its management. By importing resources into Terraform, you can consistently manage your infrastructure using a common workflow.

Example:
 1- Create a configuration file (.tf ) within your terraform folder.
 2- Write resource block (just give resource address which we need to add inside it can be empty bez post initialize it will get auto popped) which you going to add


```json
provider "vsphere" {
  user           = "your-vcenter-username"
  password       = "your-vcenter-password"
  vsphere_server = "your-vcenter-server"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "my_vm" {
  # yaha pe configuration ki details daalne ki zarurat nahi hai
  # kyunki ye import ke baad automatically populated ho jaayegi
}

```
 3- CMD -> terraform init

 4- type->  terraform import vsphere_virtual_machine.my_vm /datacenter_name/vm/vm_name

        Here:
            vsphere_virtual_machine.my_vm   your resource block name.
            /datacenter_name/vm/vm_name your vCenter's' VM  path .



# Terraform drift
Refers to the situation where the actual state of infrastructure in an environment diverges from the state defined in Terraform configuration files. Drift can happen due to changes outside of Terraform workflow, such as manual modifications, automated external processes, or resource eviction.