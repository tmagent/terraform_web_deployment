# Project wide variable
PROJECT_NAME                          = "demo"

# Varibles for the Providers
AWS_ACCESS_KEY                        = ""
AWS_SECRET_KEY                        = ""
AWS_REGION                            = "us-east-2"


# Ec2 Variables
SSH_CIDR_WEB_SERVER                   = "0.0.0.0/0"
WEB_SERVER_INSTANCE_TYPE              = "t2.micro"
USER_DATA_FOR_WEBSERVER               = "./web.sh"
PEM_FILE_WEBSERVERS                   = "us-east-2-key"

# VPC Variables
VPC_CIDR_BLOCK                        = "10.0.0.0/16"
VPC_PUBLIC_SUBNET1_CIDR_BLOCK         = "10.0.1.0/24"
VPC_PUBLIC_SUBNET2_CIDR_BLOCK         = "10.0.2.0/24"
