# AWS Certificate Generate Terraform module

Terraform module which creates a local signed certificate and exports to ACM.

## Requirements
The module was tested using:
| Name | Versions |
|------|---------|
| terraform | >= 1.0 |
| aws provider | >= 3.0 |

## Usage

### Creating a certificate with 2048 bits RSA key
```hcl
module "cert_example" {
    source              = ...
    # Subjects
    common_name         = "Certificate_Example"
    organization        = "Example"
    # CA
    ca_cert_pem         = file("CA.crt")
    ca_private_key_pem  = file("CA_key.pem")
    # Acm tags
    name                = "CA_Example"
    # Expires
    days                = 7
}
```

### Creating a certificate with 4096 bits RSA key
```hcl
module "cert_example" {
    source              = ...
    rsa_key_bits        = 4096
    # Subjects
    common_name         = "Certificate_Example"
    organization        = "Example"
    # CA
    ca_cert_pem         = file("CA.crt")
    ca_private_key_pem  = file("CA_key.pem")
    # Acm tags
    name                = "CA_Example"
    managed_by          = "Terraform"
    environment         = "prod"
    # Expires
    days                = 30
}
```

## Resources

| Name | Type |
|------|------|
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_cert_request.csr](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/3.11.0/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Tag 'Name' on ACM | string | null | yes |
| environment | Tag 'Environment' on ACM | string | " " | no |
| managed_by | Tag 'Managed_by' on ACM | string | " " | no |
| rsa_key_bits | Number of bits on rsa private key | number | 2048 | no |
| ca_cert_pem | CA body | string | null | yes |
| ca_private_key_pem | CA private key | string | null | yes |
| common_name | Certificate Subject 'Common Name' | string | null | yes |
| organization | Certificate Subject 'Organization' | string | null | yes |
| days | Certificate valid period on days | number | 1 | no |

## Outputs

| Name | Description |
|------|-------------|
| csr_pem | Certificate request body |
| cert_pem | Certificate body |
| private_key_pem | Certificate private key |
| cert_arn | Certificate arn |


## DevInfos:
- Name: James Artur (Thunder);
- A DevOps and infrastructure enthusiastics.