
# Configure our Terraform
cd ../terraform
terraform init

# Apply our Terraform
terraform apply -auto-approve

# Upload content to site S3 bucket
cd ../deploy
sh deploy_vue.sh
