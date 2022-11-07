#__________________RSA_KEY________________________________#

resource "tls_private_key" "key" {
    algorithm = "RSA"
    rsa_bits  = var.rsa_key_bits
}

#____________________CSR_________________________________#

resource "tls_cert_request" "csr" {
    private_key_pem = tls_private_key.key.private_key_pem

    subject {
        common_name  = var.common_name
        organization = var.organization
    }
}

#________________CERTIFICATE___________________________#

resource "tls_locally_signed_cert" "cert" {
    cert_request_pem    = tls_cert_request.csr.cert_request_pem
    ca_private_key_pem  = var.ca_private_key_pem
    ca_cert_pem         = var.ca_cert_pem

    validity_period_hours = 24 * var.days

    allowed_uses = [
        "key_encipherment",
        "digital_signature",
        "server_auth",
    ]
}

#_____________________EXPORT_CERTIFICATE______________________#

resource "aws_acm_certificate" "cert" {
    private_key         = tls_private_key.key.private_key_pem
    certificate_body    = tls_locally_signed_cert.cert.cert_pem
    certificate_chain   = var.ca_cert_pem
    
    tags = {
        Name        = var.name
        Environment = var.environment
        Managed_by  = var.managed_by
    }
}