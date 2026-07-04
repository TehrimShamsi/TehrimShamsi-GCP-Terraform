#Configure GPG Key
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# Update sudo & Install Terraform
sudo apt update
sudo apt-get update
sudo apt-get install terraform

# Create service account in GCP
# Download Gcloud CLI 
use dev container.json to download 
Then do Full Rebuild
# Authenticate 
gcloud auth application-default login
Follow the link using crtl+ click
Copy and paste the key in terminal
# Bottom Line
This authenticates your local gcloud with your GCP account and saves credentials that Terraform can use.

# Deploy 
terraform apply
type yes to continue

# Destroy 
terraform destroy
type yes to continue