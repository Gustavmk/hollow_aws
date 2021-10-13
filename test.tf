data "http" "ec2" {
  url = output.instance-publicip

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }

  
  depends_on = [
    aws_instance.web
  ]
}