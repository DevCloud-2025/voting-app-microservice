
# resource "aws_security_group" "all_worker_mgmt" {
#   name_prefix = "all_worker_management"
#   vpc_id      = var.vpc_id
# }

# resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
#   description       = "allow inbound traffic from eks"
#   from_port         = 0
#   protocol          = "-1"
#   to_port           = 0
#   security_group_id = aws_security_group.all_worker_mgmt.id
#   type              = "ingress"
#   cidr_blocks = [
#     "10.0.0.0/8",
#     "172.16.0.0/12",
#     "192.168.0.0/16",
#   ]
# }

# resource "aws_security_group_rule" "all_worker_mgmt_egress" {
#   description       = "allow outbound traffic to anywhere"
#   from_port         = 0
#   protocol          = "-1"
#   security_group_id = aws_security_group.all_worker_mgmt.id
#   to_port           = 0
#   type              = "egress"
#   cidr_blocks       = ["0.0.0.0/0"]
# }




# Worker Node SG (unchanged)
resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
  description       = "Allow all inbound traffic from private networks"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "ingress"
  cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {
  description       = "Allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Control Plane SG Ingress Rule (for EKS API access from kubectl)
resource "aws_security_group_rule" "eks_api_ingress" {
  description       = "Allow kubectl access to EKS API from public internet"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  type              = "ingress"
  security_group_id = "sg-04b8bf1505350f35c"  # Your EKS control plane SG

  cidr_blocks       = ["0.0.0.0/0"]  # Replace with your IP/CIDR for better security
}
