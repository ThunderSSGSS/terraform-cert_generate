
output "csr_pem" {
    value = tls_cert_request.csr.cert_request_pem
}

output "cert_pem" {
    value = tls_locally_signed_cert.cert.cert_pem
}

output "private_key_pem" {
    value = tls_private_key.key.private_key_pem
}

output "cert_arn" {
    value = aws_acm_certificate.cert.arn
}