# RESOURCES

### Resources Block
> describes one or more infra objectes.
>  The resource type and name must be unique within a module because they serve as an identifier for a given resource.
SYNTAX :-
   ```json
 resources "resource_type" "resource_name" {
        arguments
    }
```
>Here., <resources_type>= <provider>_<type>
     example=>

```json
resource "aws_instance" "web" {
                 ami           = "ami-a1b2c3d4"
                 instance_type = "t2.micro"
                }
```
    
#### Removing Resources
> To remove a resource from Terraform, simply delete the resource block from your Terraform configuration.
> By default, after you remove the resource block, Terraform will plan to destroy any real infrastructure object managed by that resource.
    In this scenario to declare that a resource was removed from Terraform configuration but that its managed object should not be destroyed, remove the resource block from your configuration and replace it with a removed block:

```json
removed {
                    from = aws_instance.example

                    lifecycle {
                         destroy = false
                        }
            }
```









### Resource Behaviour



### Meta Arguments
* depends_on
* for_each
* count
* provider
* lifecycle
### Provisioner
* Declaring Provisioners
* Provisioner Connections
* Provisioner withput a Resource
* Types
    + file
    + local-exec
    + remote-exec

























### The terraform_data Managed Resource Type


# DATA SOURCES

# PROVIDERS

# VARIABLES & OUTPUTS

# MODULES

# MOVED BLOCK

# CHECKS

# IMPORT
