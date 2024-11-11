# ARN del primer usuario IAM
output "user1_arn" {
  description = "ARN del primer usuario IAM"
  value       = aws_iam_user.user1.arn
}

# ARN del segundo usuario IAM
output "user2_arn" {
  description = "ARN del segundo usuario IAM"
  value       = aws_iam_user.user2.arn
}