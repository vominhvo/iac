### Setup AWS client and eksctl
```shell
# Install the Weaveworks Homebrew tap.
brew tap weaveworks/tap

# Install or upgrade eksctl
brew install weaveworks/tap/eksctl
brew upgrade eksctl && brew link --overwrite eksctl

# Test that your installation was successful
eksctl version

# Install AWS Client
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# Verify that AWS CLI version 1.16.308 or greater is installed on your system:
aws --version

# Check the current identity to verify that you're using the correct credentials that have permissions for the Amazon EKS cluster
aws sts get-caller-identity
# if not
aws configure

# Verify your AWS Credential Profile
cat $HOME/.aws/credentials
```

### Install Terraform client
```shell
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew update

# Verify Terraform installed
terraform -help
```

### Execute terraform commands
```shell
terraform init
terraform validate
terraform plan -var-file=./var/non-prod.tfvars
terraform apply -var-file=./var/non-prod.tfvars -auto-approve
```

### Clean-up
```shell
# Destroy all resources
terraform destroy -var-file=./var/non-prod.tfvars -auto-approve
terraform apply -destroy -var-file=./var/non-prod.tfvars -auto-approve

# Delete all state files
rm -rf .terraform* & rm -rf terraform.tfstate*
```

### Verify
```shell
nslookup <api-server-endpoint>
```

### Install 
kubectl CLI

### Configure kube config for kubectl
```shell
aws eks --region <region-code> update-kubeconfig --name <cluster_name>
aws eks --region ap-southeast-1 update-kubeconfig --name jio-health-non-prod-eks
```

### List Worker Nodes
```shell
kubectl get nodes
kubectl get nodes -o wide
```

### Verify Services
```shell
kubectl get svc
```
