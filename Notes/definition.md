# Working Directory Contents
> + Terraform configuration (.tf file)
> + .terraform directory (hidden file)
>   + Used to managed
>       + cached provider plugins and modules, record which workspace is currently active
>       + And record the last known backend configuration in case it needs to migrate state on   the next run. 
>   + This directory is automatically managed by Terraform, and is created during initialization.

> + State data
>   + Default local backend/ default workspace -> terraform.tfstate file
>   + If directory uses multiple workspace -> terraform.tfstate.d directory within that it created workspace named folder having their own tfstate file.
 
```
.terraform
 > environment
terraform.tfstate.d
 >dev
 >test
```

# Terraform init
> + terraform init [options]
>+ The following options apply to all of (or several of) the initialization steps:


     ``` -input=true ``` Ask for input if necessary. If false, will error if input was required.
     
     ``` -lock=false``` Disable locking of state files during state-related operations.
     
     ``` -lock-timeout=<duration> ``` Override the time Terraform will wait to acquire a state lock. The default is 0s (zero seconds), which causes immediate failure if the lock is already held by another process.

     ``` -no-color ``` Disable color codes in the command output.

     ``` -upgrade Opt ``` to upgrade modules and plugins as part of their respective installation steps. See the sections below for more details