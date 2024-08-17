# RESOURCES

### Resources Block
> <em> Describes one or more infra objectes. </em></br>
>  <em> The resource type and name must be unique within a module because they serve as an identifier for a given resource. </em></br>

SYNTAX :-
```bash
 resources "resource_type" "resource_name" {
 arguments
}
```

example=></br>
```bash
resource "aws_instance" "web" {
ami           = "ami-a1b2c3d4"
instance_type = "t2.micro"
 }
```
    
#### Removing Resources
> <em> To remove a resource from Terraform, simply delete the resource block from your Terraform configuration.</em></br>
><em> By default, after you remove the resource block, Terraform will plan to destroy any real infrastructure object managed by that resource. </em>

<p align="center" style="font-size:16px;">
<em>In the scenario which declare that a resource was removed from Terraform configuration but that its managed object should not be destroyed, remove the resource block from your configuration and replace it with a removed block:</em>
</p>
</br>

```bash
removed {
from = aws_instance.example
lifecycle {
  destroy = false
 }
 }
```

> <em> The  **from**  argument is the address of the resource you want to remove,  without any instance keys (such as "aws_instance.example[1]"). </br>
> The  **lifecycle**  block is required.  </br>
> The **destroy** argument determines whether Terraform will attempt to destroy the object managed by the resource or not. </br>
> A value of false means that Terraform will remove the resource from state without destroying it.
</em>

####  Custom Condition Checks


<em> You can use precondition and postcondition blocks to specify assumptions and guarantees about how the resource operates. The following example creates a precondition that checks whether the AMI is properly configured.</em> </br>

>  custom condition checks in Terraform ->  improve configuration clarity and provide early /post error detection.


```bash
resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-abc123"

  lifecycle {
    # The AMI ID must refer to an AMI that contains an operating system
    # for the `x86_64` architecture.
    precondition {
      condition     = data.aws_ami.example.architecture == "x86_64"
      error_message = "The selected AMI must be for the x86_64 architecture."
    }
  }
}
```
#### Operation Timeouts

* <em> Most resource types do not support the timeouts block at all.</em></br>
* <em> Some resource types provide a special timeouts nested block argument that allows you to customize how long certain operations are allowed to take before being considered to have failed. </em></br>

<p align="center" style="font-size:16px;" > For example, aws_db_instance allows configurable timeouts for create, update, and delete operations. </p>

```bash 
resource "aws_db_instance" "example" {
  # ...

  timeouts {
    create = "60m"
    delete = "2h"
  }
}
```

######
### Resource Behaviour
#### How Terraform Applies a Configuration?
<em>
1. Create resources that exist in the configuration but are not associated with a real infrastructure object in the state.
2. Destroy resources that exist in the state but no longer exist in the configuration.
3. Update in-place resources whose arguments have changed.
4. Destroy and re-create resources whose arguments have changed but which cannot be updated in-place due to remote API limitations.

#### Remote API Limitations:
>Some changes cannot be applied in place due to limitations or constraints of the remote API. </br>
>   Example: In AWS, changing the instance type of an EC2 instance might not be possible without recreating the instance due to API constraints or the nature of the resource.

</em>

#### Accessing Resource Attributes
<em>
1- Expression ( whenever you want to access resource attribute use the follow syntax )
    <p align="center" style="font-size:16px;" > RESOURCE TYPE.NAME.ATTRIBUTE  </p></br> 

2- Read only attribute (attribute which we get to know only after the terraform apply command is runned) </br>
    this often includes things that can't be known until the resource is created, like the resource's unique random ID.
</br>

3- Data source (Data sources are a type of resource used to retrieve information from external sources or existing resources that are not managed by Terraform. They allow you to access and use this information in your Terraform configuration.)
</em>

```bash
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
}

output "latest_ami_id" {
  value = data.aws_ami.latest_amazon_linux.id
}
```
#### Local-only Resources
<em>
>Local Values: Fixed and internal. They are defined within the configuration and used only within that module.</br>
>Variables: Flexible and can accept external input. They allow users or external sources to provide values, enabling changes to the configuration.
</em>

```bash
locals {
  instance_type = "t2.micro"
}

resource "aws_instance" "example" {
  instance_type = local.instance_type
  ami           = "ami-123456"
}
```
<p align="center" style="font-size:16px;" ><em> The behavior of local-only resources is the same as all other resources, but their result data exists only within the Terraform state. "Destroying" such a resource means only to remove it from the state, discarding its data.
</em>  </p>



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
