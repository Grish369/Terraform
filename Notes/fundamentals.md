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

> <em> The  ' from ' argument is the address of the resource you want to remove, <u> without any instance keys (such as "aws_instance.example[1]"). </u></br>
> The  ' lifecycle'  block is required.  </br>
> The ' destroy ' argument determines whether Terraform will attempt to destroy the object managed by the resource or not. </br>
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
