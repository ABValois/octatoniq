
# Build our Site
cd site
npm run build

# Configure our Terraform
cd ../terraform
terraform init

# Apply our Terraform
terraform apply -auto-approve
