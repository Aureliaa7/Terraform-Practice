1. Run terraform init
2. In PowerShell run $env:ARM_SUBSCRIPTION_ID = "subscription id"
3. Run terraform plan command to see the execution plan
4. Run terraform apply -var-file ./env.prod.tfvars to execute the plan
5. Check Azure to see the created resources
