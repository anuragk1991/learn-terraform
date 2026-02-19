output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.web.public_ip
}

output "app_url" {
  description = "URL to access the app (once provisioned)"
  value       = "http://${aws_instance.web.public_ip}"
}
