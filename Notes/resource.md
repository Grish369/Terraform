
# 1- Resource Block

>[!NOTE]
> The resource type and name must be unique within a module because they serve as an identifier for a given resource.


    
resource "resourceprovider_resourcetype" "name to call the resource within terraform" {
  #configuration arguments 
}



## Meta-Arguments
    The Terraform language defines the following meta-arguments, which can be used with any resource type to change the behavior of resources:

1- depends_on, for specifying hidden dependencies
  + The depends_on meta-argument instructs Terraform to complete all actions on the dependency object (including Read actions) before performing actions on the object declaring the dependency. 
2- count, for creating multiple resource instances according to a count
3- for_each, to create multiple instances according to a map, or set of strings
4- provider, for selecting a non-default provider configuration
5- lifecycle, for lifecycle customizations
6- provisioner, for taking extra actions after resource creation




## Removing Resources ?

    1- Directly remove the block from configuration file (with this the real object will also get deleted)

    2- Remove the resource block from your configuration and replace it with a removed block: (resource will be removed from the Terraform state, but the real infrastructure object will not be destroyed.)

     ```
     removed {
      from = aws_instance.example

      lifecycle {
       destroy = false
       }
      }
      ```
> A value of false means that Terraform will remove the resource from state without destroying it.






# 2- Resource Behaviour

## Remote API Limitations:
> Definition: Some changes cannot be applied in place due to limitations or constraints of the remote API.
>   Example: In AWS, changing the instance type of an EC2 instance might not be possible without recreating the instance due to API constraints or the nature of the resource.






# 3- Provisioner 
> ek feature hai jo resources create hone ke baad ya destroy hone se pehle kuch additional tasks perform karne ke liye use kiya jata hai. Yeh tasks typically server configuration, scripts run karne, ya specific commands execute karne ke liye hote hain.
 ### Type of Provisioners:
 >  + local-exec-> Yeh provisioner local machine pe commands run karta hai jaha se aap terraform apply command execute kar rahe ho.
      provisioner "local-exec" {
        command = "echo 'Server created!'"
        }

 >  + remote-exec-> Yeh provisioner remote machine (like a VM) pe commands run karta hai. Aapko SSH ya WinRM connection setup karna padta hai.
         provisioner "remote-exec" {
          inline = [
             "sudo apt-get update",
             "sudo apt-get install -y nginx"
            ]
          }

 >  + file -> Yeh provisioner files ko local machine se remote server pe copy karta hai.
        > provisioner "file" {
           source      = "path/to/local/file"
            destination = "/path/on/remote/server/file"
          }
