# Devops-Assessment

## Part I (Deliver Terraform Code)
- The terraform code is in the **part-1** directory
- To run this, you need to create a .tfvars file e.g part1.tfvars
- The file would house the variable **storage_account_name** and its value. 
- This is due to the fact that its unique across azure, so a default value cannot be set
- To run, you also need to create a Service Principal that terraform would use to authenticate to Azure
- You can create the service principal by running "az ad sp create-for-rbac --name *name* --role Contributor --scopes /subscriptions/*subscription-id*" 
- You would get a json output containing some credentials.
- you can store the values in a .env file in this format, 
`export ARM_CLIENT_ID="appId"
export ARM_CLIENT_SECRET="password"
export ARM_TENANT_ID="tenant"
export ARM_SUBSCRIPTION_ID="subscription-id"`

- Each export should be in a new line, then you can run `source .env`. This would export those variables for you in your shell

- You also need to update the backend.tf file with the correct values
    - The resource group name
    - The storage account name
    - The container name

- Then you can finally run;
    - terraform init
    - terraform plan -var-file="part1.tfvars"
    - terraform apply -var-file="part1.tfvars"


## Part II (Deliver Small App for K8S and a Helm Chart)
- Here we have the whole code in the `part-2` directory
- The `application` folder there contains the python app with its Dockerfile
- The `list-chart` folder is the application helm chart
- To run the application loclaly, you can run a docker build and run command 
    - docker build -t list-chart .
    - docker run -d -p 8002:8002 list-chart

- You can also deploy this into a kubernest cluster by running the below
    - Ensure to Update the values.yaml file with the correct values the value of `AZURE_STORAGE_ACCOUNT_KEY`
    - helm upgrade --install --atomic --timeout 300s helm-list-app ./list-chart -f ./list-chart/values.yaml -n default

## Part III (Setup an AKS cluster and Azure SQL Database )

- The terraform code is in the **part-3** directory
- To run this, you need to create a .tfvars file e.g part3.tfvars
- The file would house the following variables
    - aks_service_principal_app_id
    - aks_service_principal_client_secret
    - administrator_login
    - administrator_login_password

- The aks service principal credentials are the `appId and secret` gotten from creating the service principal below

- The Administrator login and password are the credentials to the `mssql server`

- This is due to the fact that its unique across azure, so a default value cannot be set
- To run, you also need to create a Service Principal that terraform would use to authenticate to Azure
- You can create the service principal by running "az ad sp create-for-rbac --name *name* --role Contributor --scopes /subscriptions/*subscription-id*" 
- You would get a json output containing some credentials.
- you can store the values in a .env file in this format, 
`export ARM_CLIENT_ID="appId"
export ARM_CLIENT_SECRET="password"
export ARM_TENANT_ID="tenant"
export ARM_SUBSCRIPTION_ID="subscription-id"`

- Each export should be in a new line, then you can run `source .env`. This would export those variables for you in your shell

- You also need to update the backend.tf file with the correct values
    - The resource group name
    - The storage account name
    - The container name

- Then you can finally run;
    - terraform init
    - terraform plan -var-file="part3.tfvars"
    - terraform apply -var-file="part3.tfvars"


## Part IV (Helm Chart GitHub Action)
- A github actions workflow has been included 
- This workflow will trigger whenever there is a merge to the `main` branch
- The workflow will authenticate to azure, package the helm chart created in `Part II` and push the helm chart to the Azure blob storage helm repo created in `Part I`