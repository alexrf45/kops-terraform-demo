output "policy_path" {
  value = aws_iam_group.kops.path
}

output "group_id" {
  value = aws_iam_group.kops.unique_id
}

output "access_key_id" {
  value = aws_iam_access_key.kops-access.id
}

output "access_key_secret" {
  value     = aws_iam_access_key.kops-access.secret
  sensitive = true
}
