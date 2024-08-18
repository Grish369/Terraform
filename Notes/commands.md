# Cheatsheet
<em>

## Authentication
   1-Login (terraform login)
   * what?</br>
      The terraform login command is used to authenticate your Terraform CLI with Terraform Cloud or Terraform Enterprise by generating and storing an API token.

   * why?</br>
      Use it when you first set up Terraform Cloud, switch to a new hostname, or if your existing token expires or is revoked

   * How?</br>
      Run terraform login to authenticate via the default Terraform Cloud, or terraform login [hostname] for a custom host, which redirects you to a browser for authentication.

      * Steps? </br>
       1- Type " terraform login "  
       2- This will redirect to Terraform cloud website ( login there ) </br>
       3- Successful login, Terraform generate API token for the connection with CLI </br>
       4- Success! Terraform has obtained and saved an API token.</br>

       ```bash
       The token will be stored in plaintext in the following file:
       /home/username/.terraform.d/credentials.tfrc.json

       If you'd like to cancel this process, press Ctrl+C now.
       Otherwise, press Enter to continue.
       ```
       </br>

    *Usage: terraform login [hostname]
      If you don't provide an explicit hostname, Terraform will assume you want to log in to HCP Terraform at app.terraform.io.

       > Token are saved in credentials.tfrc.json file .
       
 </br></br>
   2. logout (terraform logout)
   
   * what?</br>
      The terraform logout command is used to remove locally stored API tokens from your machine. 

   * why?</br>
      This is important for security reasons, especially if you're switching users, decommissioning a machine, or simply want to ensure that no unauthorized use of your credentials can occur.

   * How?</br>
      Run terraform logout </br>
      This command will remove the stored API tokens from the credentials.tfrc.json file or any custom credentials storage you've configured, effectively logging you out of Terraform Cloud or Terraform Enterprise from that machine.

   * Usage: terraform logout [hostname]</br>
      If you don't provide an explicit hostname, Terraform will assume you want to log out of HCP Terraform at app.terraform.io.


### Credentials Storage (credential helper)




</em>