output "Efs_id" {
  description = " Efs id of the Elastic filesystem"
  value       = aws_efs_file_system.my-efs.id
}
