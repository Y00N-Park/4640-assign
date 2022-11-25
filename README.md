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
This is the output of terraform apply:

![20221124_182751](https://user-images.githubusercontent.com/55506518/203888308-0615fa2d-df5d-4cef-bf36-3dff7fab2a1c.png)


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
2. Add ssh key which below commands. After you add them, you don't need to us -i option for ssh connection
```
eval $(ssh-agent)
ssh-add path-to-private-key
```
3. Connect to bastion server by ssh
```
ssh -A root@bastion-public-ip
# you should now be connected to the bastion server.
ssh root@server-private-ip
# you should now be connected to one of your servers
# you can print private ips as output in terraform,
# or look at the DO web console. 
```
![20221124_185450](https://user-images.githubusercontent.com/55506518/203891599-24f12d08-8c1a-43f7-9e02-262ad3af9f47.png)

![20221124_185513](https://user-images.githubusercontent.com/55506518/203891623-f9e92636-6bc2-42ff-94df-da573296cd19.png)
