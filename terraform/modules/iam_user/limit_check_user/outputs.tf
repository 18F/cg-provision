output "username" {
  value = "${aws_iam_user.iam_user.username}"
}
output "access_key_id_prev" {
  value = "${aws_iam_access_key.iam_access_key.access_key_id}"
}
output "secret_access_key_prev" {
  value = "${aws_iam_access_key.iam_access_key.secret_access_key}"
}
output "access_key_id_curr" {
  value = "${aws_iam_access_key.iam_access_key_v1.access_key_id}"
}
output "secret_access_key_curr" {
  value = "${aws_iam_access_key.iam_access_key_v1.secret_access_key}"
}
