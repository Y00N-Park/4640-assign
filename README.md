# ACIT4640 Assignment Instruction

### Pre required for the assignment:
- Digital Ocean Account
- Installed Terraform


### Basic Command Lines:
To initialize terraform
```
terraform init
```

To test terraform files
```
terraform plan
```

To execute the actions proposed in terraform files
```
terraform apply
```

To destroy all the resources managed by terraform
```
terraform destroy
```

### Files that are required:
```
- .env
- main.tf (provider info)
- variables.tf (variables, anything that you use twice, or could change(region, size…) )
- terraform.tfvars (variable values)
- output.tf (any output blocks, like ip addresses, and database connection uri)
- database.tf (includes db firewall)
- servers.tf (your droplets, load balancer and firewall for your servers)
- bastion.tf (includes firewall for bastion server)
- network.tf (your vpc)
- data.tf (data blocks, like your ssh keys)
```

### Step 1: How to connect Digital Ocean account and Terraform
Inside .env file, put a token created from Digital Ocean
```
export TF_VAR_do_token=<token>
```
Source .env file, so terraform doesn't ask to put the token everytime
```
source .env
```

### Step 2: How to Connect Database(MongoDB)
1. Install <a href="http://mongodb.com/try/download/shell" target="_blank">MongoDB Compass Download</a> on your local machine </br>
2. Find the database password from terraform.tfstate </br>
3. Go to Digital Ocean account to copy the database connection string paste them to connect the database </br>

![20221124_11545](https://user-images.githubusercontent.com/55506518/203873531-930447af-f273-4a48-98e8-5046eff84849.png)
</br>
</br>
You can check the connection from MongoDB Compass </br>
![20221124_142709](https://user-images.githubusercontent.com/55506518/203873798-e682b4ba-9dd1-4cba-a363-56d32fe3f4a1.png)
</br>

### Step 3: How to Test Bastion Server
1. Go to Digital Ocean account to find ip address
2. 
```
eval $(ssh-agent)
ssh-add <path to private key in localhost>
ssh -A root@<publicIP of bastion server>
ssh root@<privateIP of web server>
```
