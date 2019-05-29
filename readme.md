## This reposistory is created with learning purposes for Terraform, focusing on Terraform modules.

## Purpose :

- It provides a simple example of how to create AWS instance using Terraform modules.

## What is a Terraform module :

- Modules are portable Terraform configurations, they provide a way to reuse the code that has been created already. Modules provide a way to organize our project. A simple module looks like this :

```
.
└── server
    └── main.tf
```
Every Terraform project has a module named `root`. In this repository, the `root` module is going to call a child module named `server` to create AWS EC2 instance.

## How to install terraform : 

- The information about installing terraform can be found on the HashiCorp website 
[here](https://learn.hashicorp.com/terraform/getting-started/install.html)

## How to use it :

- In a directory of your choice, clone the github repository 
```
git clone https://github.com/martinhristov90/terraformModules.git
```

- Change into the directory
```
cd terraformModules
```

- It is good practice to have a separate user that Terraform is going to perform actions with, more information [how to create a user in AWS](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html)

- set AWS credentials as environemental variables, as decribed [here](https://www.terraform.io/docs/providers/aws/index.html#environment-variables)

```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
```

- Use your favorite text editor to modify the file `main.tf`. Set the following values :
    - `ami` - The AMI ID to be used.
    - `instance_type` - The size that you desire.
    - `subnet_id`  - Sets the subnet in which the instance is going to be attaced.
    - `vpc_security_group_ids` - Sets the ID of the security group.
    
- After all the values of the variables are set correctly, go ahead and execute `terraform init`. 

The output should look like this :

```shell
    --- SNIP ---
    * provider.aws: version = "~> 2.11"
    Terraform has been successfully initialized!
    --- SNIP ---
```
    
- Now, Terraform has downloded the AWS provider for you automatically.
- To preview what is going to happen without actually performing any actions, execute `terraform plan`. The output should look like this :

```shell
   Terraform will perform the following actions:
    + module.server.aws_instance.web
        id:                                <computed>
        ami:                               "ami-0444fa3496fb4fab2"
```
This output says that the actions of creating the recources are going to be performed by the `server` module.

- If everything looks good, execute `terraform apply` to actually provision the resources defined in `server/main.tf`. The output should look like this : 

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

public_ip = 3.87.187.208
```

- Now you should have a running instance in AWS.

- In order to destroy whatever resources have been created by Terraform, execute `terraform destroy`. 


