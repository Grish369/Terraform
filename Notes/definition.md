# Working Directory Contents
> + Terraform configuration (.tf file)
> + .terraform directory (hidden file)
>   + Used to managed
>       + cached provider plugins and modules, record which workspace is currently active
>       + And record the last known backend configuration in case it needs to migrate state on   the next run. 
>   + This directory is automatically managed by Terraform, and is created during initialization.