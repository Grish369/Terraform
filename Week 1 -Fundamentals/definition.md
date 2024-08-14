# Working Directory Contents
> + Terraform configuration
> + .terraform directory (hidden file)
>   + Terraform uses to manage cached provider plugins and modules, record which workspace is currently active, and record the last known backend configuration in case it needs to migrate state on the next run. 
>   + This directory is automatically managed by Terraform, and is created during initialization.