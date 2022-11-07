#_________________TAGS_________________________#

variable "name" { 
    type        = string 
    description = "Name of the certificate on ACM"
}

variable "environment" {
    type    = string
    default = ""
}

variable "managed_by" {
    type    = string
    default = ""
}

#____________________CERTIFICATE____________________#

variable "rsa_key_bits" {
    type    = number
    default = 2048 # for vpn
}

# CA
variable "ca_cert_pem" { type=string }

variable "ca_private_key_pem" { type=string }

# Cert subjects
variable "common_name" { type = string }

variable "organization" { type = string }

# Expires
variable "days" { 
    type        = number 
    default     = 1
    description = "Number of valid days"
}