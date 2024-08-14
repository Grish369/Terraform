https://developer.hashicorp.com/terraform/language




# Installation:
https://developer.hashicorp.com/terraform/install
open environment variable -> user variable path -> add the terraform.exe path to "PATH" variable



# Version:
PS C:\..\Terraform> terraform --version
Terraform v1.9.4 on windows_386



# terraform:
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

* Main commands:
   + init          Prepare your working directory for other commands
   + validate      Check whether the configuration is valid
   + plan          Show changes required by the current configuration
   + apply         Create or update infrastructure    
   + destroy       Destroy previously-created infrastructure

* All other commands:
  + console       Try Terraform expressions at an interactive command prompt
  + fmt           Reformat your configuration in the standard style
  + force-unlock  Release a stuck lock on the current workspace
  + get           Install or upgrade remote Terraform modules
  + test          Execute integration tests for Terraform modules
  + untaint       Remove the 'tainted' state from a resource instance
  + version       Show the current Terraform version
  + workspace     Workspace management

* Global options (use these before the subcommand, if any):
  + -chdir=DIR    Switch to a different working directory before executing the        
                given subcommand.
  + -help         Show this help output, or the help for a specified subcommand.      
  + -version      An alias for the "version" subcommand.




# Workspace:
* Usage: terraform [global options] workspace

  | new, list, show, select and delete Terraform workspaces.

* Subcommands:
    + delete    Delete a workspace
    + list      List Workspaces
    + new       Create a new workspace and also switch to that workspace
    + select    Switch to that workspace
    + show      Show the name of the current workspace

> Isolated State: Since the workspace is new and empty, there is no existing state to reference. This means Terraform will treat all resources in your configuration as new and will attempt to create them when you run terraform apply.

> No Conflicts: Because the workspace is isolated, changes made in this workspace will not affect resources in other workspaces. This is useful in scenarios like managing different environments (e.g., dev, staging, prod) where you want to keep their infrastructure separate.

> Plan and Apply: When you run terraform plan, Terraform will generate a plan based on the configuration files and show you what changes it intends to make, but since there is no existing state, everything will appear as new. When you run terraform apply, Terraform will create all the resources as described in your configuration.

>[!TIP]
> whenever new workspace is created using " terraform workspace new <name_of the workspace>"
  + it create new folders 
    + with .terraform (it will have one environment file which state the name of the current working workspace ) 
    + terraform.tfstate.d ( it create the folders with the respective workspaces name which include tfstate for each workspace respectively)


```
.terraform
 > environment
terraform.tfstate.d
 >dev
 >test
```



