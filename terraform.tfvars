# MUST CUSTOMIZE
key-pair         = "aravind"
private-key-file = "/Users/aravind/aravind.pem"

# RECOMMENDED TO CUSTOMIZE
region     = "eu-west-1"
opsman-deb = "https://downloads.mongodb.com/on-prem-mms/deb/mongodb-mms-6.0.14.100.20230530T1837Z.amd64.deb"
naming-prefix = "aravind-tf-om"

# MAY CUSTOMIZE
sg-ingress-ports = [
  [22, 22, "tcp", ["0.0.0.0/0"]], [80, 80, "tcp", ["0.0.0.0/0"]],
  [8443, 8443, "tcp", ["0.0.0.0/0"]],
  [8080, 8080, "tcp", ["0.0.0.0/0"]], [27017, 27017, "tcp", ["0.0.0.0/0"]]
]
subnet-cidrs          = ["192.168.0.0/28", "192.168.0.16/28", "192.168.0.32/28"]
om-instance-type      = "r5.large"
ansible-instance-type = "t3.medium"
vpc-name              = "tf-om-vpc"
dns-domain            = "mdbrecruit.net."

# The playbooks use apt hence, this is only compatible with ubuntu ami's
# ubuntu 20
ami-id = "ami-0136ddddd07f0584f"

# ubuntu 22.04
# ami-id              = "ami-0310483fb2b488153" 

# amzn2 - do not use this
# ami-id= "ami-0a38ff16b1a996d39"