terraform {
  backend "s3" {
    bucket         = "tf-state-kops-stage"
    region         = "us-east-1"
    dynamodb_table = "tf-kops-locks"
    encrypt        = true
    key            = "cloud-fam/terraform.tfstate"

  }

}

locals {
  bastion_autoscaling_group_ids                      = [aws_autoscaling_group.bastions-cloud-fam-com.id]
  bastion_security_group_ids                         = [aws_security_group.bastion-cloud-fam-com.id]
  bastions_role_arn                                  = aws_iam_role.bastions-cloud-fam-com.arn
  bastions_role_name                                 = aws_iam_role.bastions-cloud-fam-com.name
  cluster_name                                       = "cloud-fam.com"
  iam_openid_connect_provider_arn                    = aws_iam_openid_connect_provider.cloud-fam-com.arn
  iam_openid_connect_provider_issuer                 = "tf-state-kops-stage.s3.us-east-1.amazonaws.com/cloud-fam.com/discovery/cloud-fam.com"
  kube-system-aws-cloud-controller-manager_role_arn  = aws_iam_role.aws-cloud-controller-manager-kube-system-sa-cloud-fam-com.arn
  kube-system-aws-cloud-controller-manager_role_name = aws_iam_role.aws-cloud-controller-manager-kube-system-sa-cloud-fam-com.name
  kube-system-dns-controller_role_arn                = aws_iam_role.dns-controller-kube-system-sa-cloud-fam-com.arn
  kube-system-dns-controller_role_name               = aws_iam_role.dns-controller-kube-system-sa-cloud-fam-com.name
  kube-system-ebs-csi-controller-sa_role_arn         = aws_iam_role.ebs-csi-controller-sa-kube-system-sa-cloud-fam-com.arn
  kube-system-ebs-csi-controller-sa_role_name        = aws_iam_role.ebs-csi-controller-sa-kube-system-sa-cloud-fam-com.name
  master_autoscaling_group_ids                       = [aws_autoscaling_group.control-plane-us-east-1a-masters-cloud-fam-com.id, aws_autoscaling_group.control-plane-us-east-1b-masters-cloud-fam-com.id, aws_autoscaling_group.control-plane-us-east-1c-masters-cloud-fam-com.id]
  master_security_group_ids                          = [aws_security_group.masters-cloud-fam-com.id]
  masters_role_arn                                   = aws_iam_role.masters-cloud-fam-com.arn
  masters_role_name                                  = aws_iam_role.masters-cloud-fam-com.name
  node_autoscaling_group_ids                         = [aws_autoscaling_group.nodes-us-east-1a-cloud-fam-com.id, aws_autoscaling_group.nodes-us-east-1b-cloud-fam-com.id, aws_autoscaling_group.nodes-us-east-1c-cloud-fam-com.id]
  node_security_group_ids                            = [aws_security_group.nodes-cloud-fam-com.id]
  node_subnet_ids                                    = [aws_subnet.us-east-1a-cloud-fam-com.id, aws_subnet.us-east-1b-cloud-fam-com.id, aws_subnet.us-east-1c-cloud-fam-com.id]
  nodes_role_arn                                     = aws_iam_role.nodes-cloud-fam-com.arn
  nodes_role_name                                    = aws_iam_role.nodes-cloud-fam-com.name
  region                                             = "us-east-1"
  route_table_private-us-east-1a_id                  = aws_route_table.private-us-east-1a-cloud-fam-com.id
  route_table_private-us-east-1b_id                  = aws_route_table.private-us-east-1b-cloud-fam-com.id
  route_table_private-us-east-1c_id                  = aws_route_table.private-us-east-1c-cloud-fam-com.id
  route_table_public_id                              = aws_route_table.cloud-fam-com.id
  subnet_us-east-1a_id                               = aws_subnet.us-east-1a-cloud-fam-com.id
  subnet_us-east-1b_id                               = aws_subnet.us-east-1b-cloud-fam-com.id
  subnet_us-east-1c_id                               = aws_subnet.us-east-1c-cloud-fam-com.id
  subnet_utility-us-east-1a_id                       = aws_subnet.utility-us-east-1a-cloud-fam-com.id
  subnet_utility-us-east-1b_id                       = aws_subnet.utility-us-east-1b-cloud-fam-com.id
  subnet_utility-us-east-1c_id                       = aws_subnet.utility-us-east-1c-cloud-fam-com.id
  vpc_cidr_block                                     = aws_vpc.cloud-fam-com.cidr_block
  vpc_id                                             = aws_vpc.cloud-fam-com.id
  vpc_ipv6_cidr_block                                = aws_vpc.cloud-fam-com.ipv6_cidr_block
  vpc_ipv6_cidr_length                               = local.vpc_ipv6_cidr_block == null ? null : tonumber(regex(".*/(\\d+)", local.vpc_ipv6_cidr_block)[0])
}

output "bastion_autoscaling_group_ids" {
  value = [aws_autoscaling_group.bastions-cloud-fam-com.id]
}

output "bastion_security_group_ids" {
  value = [aws_security_group.bastion-cloud-fam-com.id]
}

output "bastions_role_arn" {
  value = aws_iam_role.bastions-cloud-fam-com.arn
}

output "bastions_role_name" {
  value = aws_iam_role.bastions-cloud-fam-com.name
}

output "cluster_name" {
  value = "cloud-fam.com"
}

output "iam_openid_connect_provider_arn" {
  value = aws_iam_openid_connect_provider.cloud-fam-com.arn
}

output "iam_openid_connect_provider_issuer" {
  value = "tf-state-kops-stage.s3.us-east-1.amazonaws.com/cloud-fam.com/discovery/cloud-fam.com"
}

output "kube-system-aws-cloud-controller-manager_role_arn" {
  value = aws_iam_role.aws-cloud-controller-manager-kube-system-sa-cloud-fam-com.arn
}

output "kube-system-aws-cloud-controller-manager_role_name" {
  value = aws_iam_role.aws-cloud-controller-manager-kube-system-sa-cloud-fam-com.name
}

output "kube-system-dns-controller_role_arn" {
  value = aws_iam_role.dns-controller-kube-system-sa-cloud-fam-com.arn
}

output "kube-system-dns-controller_role_name" {
  value = aws_iam_role.dns-controller-kube-system-sa-cloud-fam-com.name
}

output "kube-system-ebs-csi-controller-sa_role_arn" {
  value = aws_iam_role.ebs-csi-controller-sa-kube-system-sa-cloud-fam-com.arn
}

output "kube-system-ebs-csi-controller-sa_role_name" {
  value = aws_iam_role.ebs-csi-controller-sa-kube-system-sa-cloud-fam-com.name
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.control-plane-us-east-1a-masters-cloud-fam-com.id, aws_autoscaling_group.control-plane-us-east-1b-masters-cloud-fam-com.id, aws_autoscaling_group.control-plane-us-east-1c-masters-cloud-fam-com.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-cloud-fam-com.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-cloud-fam-com.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-cloud-fam-com.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-us-east-1a-cloud-fam-com.id, aws_autoscaling_group.nodes-us-east-1b-cloud-fam-com.id, aws_autoscaling_group.nodes-us-east-1c-cloud-fam-com.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-cloud-fam-com.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.us-east-1a-cloud-fam-com.id, aws_subnet.us-east-1b-cloud-fam-com.id, aws_subnet.us-east-1c-cloud-fam-com.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-cloud-fam-com.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-cloud-fam-com.name
}

output "region" {
  value = "us-east-1"
}

output "route_table_private-us-east-1a_id" {
  value = aws_route_table.private-us-east-1a-cloud-fam-com.id
}

output "route_table_private-us-east-1b_id" {
  value = aws_route_table.private-us-east-1b-cloud-fam-com.id
}

output "route_table_private-us-east-1c_id" {
  value = aws_route_table.private-us-east-1c-cloud-fam-com.id
}

output "route_table_public_id" {
  value = aws_route_table.cloud-fam-com.id
}

output "subnet_us-east-1a_id" {
  value = aws_subnet.us-east-1a-cloud-fam-com.id
}

output "subnet_us-east-1b_id" {
  value = aws_subnet.us-east-1b-cloud-fam-com.id
}

output "subnet_us-east-1c_id" {
  value = aws_subnet.us-east-1c-cloud-fam-com.id
}

output "subnet_utility-us-east-1a_id" {
  value = aws_subnet.utility-us-east-1a-cloud-fam-com.id
}

output "subnet_utility-us-east-1b_id" {
  value = aws_subnet.utility-us-east-1b-cloud-fam-com.id
}

output "subnet_utility-us-east-1c_id" {
  value = aws_subnet.utility-us-east-1c-cloud-fam-com.id
}

output "vpc_cidr_block" {
  value = aws_vpc.cloud-fam-com.cidr_block
}

output "vpc_id" {
  value = aws_vpc.cloud-fam-com.id
}

output "vpc_ipv6_cidr_block" {
  value = aws_vpc.cloud-fam-com.ipv6_cidr_block
}

output "vpc_ipv6_cidr_length" {
  value = local.vpc_ipv6_cidr_block == null ? null : tonumber(regex(".*/(\\d+)", local.vpc_ipv6_cidr_block)[0])
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "files"
  region = "us-east-1"
}

resource "aws_autoscaling_group" "bastions-cloud-fam-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.bastions-cloud-fam-com.id
    version = aws_launch_template.bastions-cloud-fam-com.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "bastions.cloud-fam.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "cloud-fam.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "bastions.cloud-fam.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/bastion"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "bastions"
  }
  tag {
    key                 = "kubernetes.io/cluster/cloud-fam.com"
    propagate_at_launch = true
    value               = "owned"
  }
  target_group_arns   = [aws_lb_target_group.bastion-cloud-fam-com-amg3a8.id]
  vpc_zone_identifier = [aws_subnet.us-east-1a-cloud-fam-com.id, aws_subnet.us-east-1b-cloud-fam-com.id, aws_subnet.us-east-1c-cloud-fam-com.id]
}

resource "aws_autoscaling_group" "control-plane-us-east-1a-masters-cloud-fam-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.control-plane-us-east-1a-masters-cloud-fam-com.id
    version = aws_launch_template.control-plane-us-east-1a-masters-cloud-fam-com.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "control-plane-us-east-1a.masters.cloud-fam.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "cloud-fam.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "control-plane-us-east-1a.masters.cloud-fam.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/control-plane"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "control-plane-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/cloud-fam.com"
    propagate_at_launch = true
    value               = "owned"
  }
  target_group_arns   = [aws_lb_target_group.tcp-cloud-fam-com-qk3bcf.id]
  vpc_zone_identifier = [aws_subnet.us-east-1a-cloud-fam-com.id]
}

resource "aws_autoscaling_group" "control-plane-us-east-1b-masters-cloud-fam-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.control-plane-us-east-1b-masters-cloud-fam-com.id
    version = aws_launch_template.control-plane-us-east-1b-masters-cloud-fam-com.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "control-plane-us-east-1b.masters.cloud-fam.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "cloud-fam.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "control-plane-us-east-1b.masters.cloud-fam.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/control-plane"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "control-plane-us-east-1b"
  }
  tag {
    key                 = "kubernetes.io/cluster/cloud-fam.com"
    propagate_at_launch = true
    value               = "owned"
  }
  target_group_arns   = [aws_lb_target_group.tcp-cloud-fam-com-qk3bcf.id]
  vpc_zone_identifier = [aws_subnet.us-east-1b-cloud-fam-com.id]
}

resource "aws_autoscaling_group" "control-plane-us-east-1c-masters-cloud-fam-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.control-plane-us-east-1c-masters-cloud-fam-com.id
    version = aws_launch_template.control-plane-us-east-1c-masters-cloud-fam-com.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "control-plane-us-east-1c.masters.cloud-fam.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "cloud-fam.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "control-plane-us-east-1c.masters.cloud-fam.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/control-plane"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "control-plane-us-east-1c"
  }
  tag {
    key                 = "kubernetes.io/cluster/cloud-fam.com"
    propagate_at_launch = true
    value               = "owned"
  }
  target_group_arns   = [aws_lb_target_group.tcp-cloud-fam-com-qk3bcf.id]
  vpc_zone_identifier = [aws_subnet.us-east-1c-cloud-fam-com.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1a-cloud-fam-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1a-cloud-fam-com.id
    version = aws_launch_template.nodes-us-east-1a-cloud-fam-com.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-east-1a.cloud-fam.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "cloud-fam.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1a.cloud-fam.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/cloud-fam.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1a-cloud-fam-com.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1b-cloud-fam-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1b-cloud-fam-com.id
    version = aws_launch_template.nodes-us-east-1b-cloud-fam-com.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-east-1b.cloud-fam.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "cloud-fam.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1b.cloud-fam.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1b"
  }
  tag {
    key                 = "kubernetes.io/cluster/cloud-fam.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1b-cloud-fam-com.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1c-cloud-fam-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1c-cloud-fam-com.id
    version = aws_launch_template.nodes-us-east-1c-cloud-fam-com.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-east-1c.cloud-fam.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "cloud-fam.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1c.cloud-fam.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1c"
  }
  tag {
    key                 = "kubernetes.io/cluster/cloud-fam.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1c-cloud-fam-com.id]
}

resource "aws_ebs_volume" "a-etcd-events-cloud-fam-com" {
  availability_zone = "us-east-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "a.etcd-events.cloud-fam.com"
    "k8s.io/etcd/events"                  = "a/a,b,c"
    "k8s.io/role/control-plane"           = "1"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-cloud-fam-com" {
  availability_zone = "us-east-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "a.etcd-main.cloud-fam.com"
    "k8s.io/etcd/main"                    = "a/a,b,c"
    "k8s.io/role/control-plane"           = "1"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "b-etcd-events-cloud-fam-com" {
  availability_zone = "us-east-1b"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "b.etcd-events.cloud-fam.com"
    "k8s.io/etcd/events"                  = "b/a,b,c"
    "k8s.io/role/control-plane"           = "1"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "b-etcd-main-cloud-fam-com" {
  availability_zone = "us-east-1b"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "b.etcd-main.cloud-fam.com"
    "k8s.io/etcd/main"                    = "b/a,b,c"
    "k8s.io/role/control-plane"           = "1"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "c-etcd-events-cloud-fam-com" {
  availability_zone = "us-east-1c"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "c.etcd-events.cloud-fam.com"
    "k8s.io/etcd/events"                  = "c/a,b,c"
    "k8s.io/role/control-plane"           = "1"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "c-etcd-main-cloud-fam-com" {
  availability_zone = "us-east-1c"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "c.etcd-main.cloud-fam.com"
    "k8s.io/etcd/main"                    = "c/a,b,c"
    "k8s.io/role/control-plane"           = "1"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_eip" "us-east-1a-cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "us-east-1a.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc = true
}

resource "aws_eip" "us-east-1b-cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "us-east-1b.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc = true
}

resource "aws_eip" "us-east-1c-cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "us-east-1c.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc = true
}

resource "aws_iam_instance_profile" "bastions-cloud-fam-com" {
  name = "bastions.cloud-fam.com"
  role = aws_iam_role.bastions-cloud-fam-com.name
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "bastions.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-cloud-fam-com" {
  name = "masters.cloud-fam.com"
  role = aws_iam_role.masters-cloud-fam-com.name
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "masters.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-cloud-fam-com" {
  name = "nodes.cloud-fam.com"
  role = aws_iam_role.nodes-cloud-fam-com.name
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "nodes.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_iam_openid_connect_provider" "cloud-fam-com" {
  client_id_list = ["amazonaws.com"]
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280", "a9d53002e97e00e043244f3d170d6f4c414104fd"]
  url             = "https://tf-state-kops-stage.s3.us-east-1.amazonaws.com/cloud-fam.com/discovery/cloud-fam.com"
}

resource "aws_iam_role" "aws-cloud-controller-manager-kube-system-sa-cloud-fam-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_aws-cloud-controller-manager.kube-system.sa.cloud-fam.com_policy")
  name               = "aws-cloud-controller-manager.kube-system.sa.cloud-fam.com"
  tags = {
    "KubernetesCluster"                     = "cloud-fam.com"
    "Name"                                  = "aws-cloud-controller-manager.kube-system.sa.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com"   = "owned"
    "service-account.kops.k8s.io/name"      = "aws-cloud-controller-manager"
    "service-account.kops.k8s.io/namespace" = "kube-system"
  }
}

resource "aws_iam_role" "bastions-cloud-fam-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_bastions.cloud-fam.com_policy")
  name               = "bastions.cloud-fam.com"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "bastions.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_iam_role" "dns-controller-kube-system-sa-cloud-fam-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_dns-controller.kube-system.sa.cloud-fam.com_policy")
  name               = "dns-controller.kube-system.sa.cloud-fam.com"
  tags = {
    "KubernetesCluster"                     = "cloud-fam.com"
    "Name"                                  = "dns-controller.kube-system.sa.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com"   = "owned"
    "service-account.kops.k8s.io/name"      = "dns-controller"
    "service-account.kops.k8s.io/namespace" = "kube-system"
  }
}

resource "aws_iam_role" "ebs-csi-controller-sa-kube-system-sa-cloud-fam-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_ebs-csi-controller-sa.kube-system.sa.cloud-fam.com_policy")
  name               = "ebs-csi-controller-sa.kube-system.sa.cloud-fam.com"
  tags = {
    "KubernetesCluster"                     = "cloud-fam.com"
    "Name"                                  = "ebs-csi-controller-sa.kube-system.sa.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com"   = "owned"
    "service-account.kops.k8s.io/name"      = "ebs-csi-controller-sa"
    "service-account.kops.k8s.io/namespace" = "kube-system"
  }
}

resource "aws_iam_role" "masters-cloud-fam-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.cloud-fam.com_policy")
  name               = "masters.cloud-fam.com"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "masters.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_iam_role" "nodes-cloud-fam-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.cloud-fam.com_policy")
  name               = "nodes.cloud-fam.com"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "nodes.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_iam_role_policy" "aws-cloud-controller-manager-kube-system-sa-cloud-fam-com" {
  name   = "aws-cloud-controller-manager.kube-system.sa.cloud-fam.com"
  policy = file("${path.module}/data/aws_iam_role_policy_aws-cloud-controller-manager.kube-system.sa.cloud-fam.com_policy")
  role   = aws_iam_role.aws-cloud-controller-manager-kube-system-sa-cloud-fam-com.name
}

resource "aws_iam_role_policy" "bastions-cloud-fam-com" {
  name   = "bastions.cloud-fam.com"
  policy = file("${path.module}/data/aws_iam_role_policy_bastions.cloud-fam.com_policy")
  role   = aws_iam_role.bastions-cloud-fam-com.name
}

resource "aws_iam_role_policy" "dns-controller-kube-system-sa-cloud-fam-com" {
  name   = "dns-controller.kube-system.sa.cloud-fam.com"
  policy = file("${path.module}/data/aws_iam_role_policy_dns-controller.kube-system.sa.cloud-fam.com_policy")
  role   = aws_iam_role.dns-controller-kube-system-sa-cloud-fam-com.name
}

resource "aws_iam_role_policy" "ebs-csi-controller-sa-kube-system-sa-cloud-fam-com" {
  name   = "ebs-csi-controller-sa.kube-system.sa.cloud-fam.com"
  policy = file("${path.module}/data/aws_iam_role_policy_ebs-csi-controller-sa.kube-system.sa.cloud-fam.com_policy")
  role   = aws_iam_role.ebs-csi-controller-sa-kube-system-sa-cloud-fam-com.name
}

resource "aws_iam_role_policy" "masters-cloud-fam-com" {
  name   = "masters.cloud-fam.com"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.cloud-fam.com_policy")
  role   = aws_iam_role.masters-cloud-fam-com.name
}

resource "aws_iam_role_policy" "nodes-cloud-fam-com" {
  name   = "nodes.cloud-fam.com"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.cloud-fam.com_policy")
  role   = aws_iam_role.nodes-cloud-fam-com.name
}

resource "aws_internet_gateway" "cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_launch_template" "bastions-cloud-fam-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 32
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.bastions-cloud-fam-com.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "t3.micro"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "bastions.cloud-fam.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.bastion-cloud-fam-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "bastions.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/bastion"                                                        = "1"
      "kops.k8s.io/instancegroup"                                                  = "bastions"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "bastions.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/bastion"                                                        = "1"
      "kops.k8s.io/instancegroup"                                                  = "bastions"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "cloud-fam.com"
    "Name"                                                                       = "bastions.cloud-fam.com"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/bastion"                                                        = "1"
    "kops.k8s.io/instancegroup"                                                  = "bastions"
    "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
  }
}

resource "aws_launch_template" "control-plane-us-east-1a-masters-cloud-fam-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-cloud-fam-com.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "m5.large"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "control-plane-us-east-1a.masters.cloud-fam.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-cloud-fam-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "cloud-fam.com"
      "Name"                                                                                                  = "control-plane-us-east-1a.masters.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1a"
      "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "cloud-fam.com"
      "Name"                                                                                                  = "control-plane-us-east-1a.masters.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1a"
      "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "cloud-fam.com"
    "Name"                                                                                                  = "control-plane-us-east-1a.masters.cloud-fam.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/control-plane"                                                                             = "1"
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1a"
    "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_control-plane-us-east-1a.masters.cloud-fam.com_user_data")
}

resource "aws_launch_template" "control-plane-us-east-1b-masters-cloud-fam-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-cloud-fam-com.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "m5.large"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "control-plane-us-east-1b.masters.cloud-fam.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-cloud-fam-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "cloud-fam.com"
      "Name"                                                                                                  = "control-plane-us-east-1b.masters.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1b"
      "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "cloud-fam.com"
      "Name"                                                                                                  = "control-plane-us-east-1b.masters.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1b"
      "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "cloud-fam.com"
    "Name"                                                                                                  = "control-plane-us-east-1b.masters.cloud-fam.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/control-plane"                                                                             = "1"
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1b"
    "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_control-plane-us-east-1b.masters.cloud-fam.com_user_data")
}

resource "aws_launch_template" "control-plane-us-east-1c-masters-cloud-fam-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-cloud-fam-com.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "m5.large"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "control-plane-us-east-1c.masters.cloud-fam.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-cloud-fam-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "cloud-fam.com"
      "Name"                                                                                                  = "control-plane-us-east-1c.masters.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1c"
      "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "cloud-fam.com"
      "Name"                                                                                                  = "control-plane-us-east-1c.masters.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1c"
      "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "cloud-fam.com"
    "Name"                                                                                                  = "control-plane-us-east-1c.masters.cloud-fam.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/control-plane"                                                                             = "1"
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1c"
    "kubernetes.io/cluster/cloud-fam.com"                                                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_control-plane-us-east-1c.masters.cloud-fam.com_user_data")
}

resource "aws_launch_template" "nodes-us-east-1a-cloud-fam-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-cloud-fam-com.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "m5.large"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-east-1a.cloud-fam.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-cloud-fam-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "nodes-us-east-1a.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "nodes-us-east-1a.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "cloud-fam.com"
    "Name"                                                                       = "nodes-us-east-1a.cloud-fam.com"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
    "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1a.cloud-fam.com_user_data")
}

resource "aws_launch_template" "nodes-us-east-1b-cloud-fam-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-cloud-fam-com.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "m5.large"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-east-1b.cloud-fam.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-cloud-fam-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "nodes-us-east-1b.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "nodes-us-east-1b.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "cloud-fam.com"
    "Name"                                                                       = "nodes-us-east-1b.cloud-fam.com"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
    "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1b.cloud-fam.com_user_data")
}

resource "aws_launch_template" "nodes-us-east-1c-cloud-fam-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-cloud-fam-com.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "m5.large"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-east-1c.cloud-fam.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-cloud-fam-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "nodes-us-east-1c.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "cloud-fam.com"
      "Name"                                                                       = "nodes-us-east-1c.cloud-fam.com"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
      "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "cloud-fam.com"
    "Name"                                                                       = "nodes-us-east-1c.cloud-fam.com"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
    "kubernetes.io/cluster/cloud-fam.com"                                        = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1c.cloud-fam.com_user_data")
}

resource "aws_lb" "api-cloud-fam-com" {
  enable_cross_zone_load_balancing = false
  internal                         = false
  load_balancer_type               = "network"
  name                             = "api-cloud-fam-com-8etb0e"
  subnet_mapping {
    subnet_id = aws_subnet.utility-us-east-1a-cloud-fam-com.id
  }
  subnet_mapping {
    subnet_id = aws_subnet.utility-us-east-1b-cloud-fam-com.id
  }
  subnet_mapping {
    subnet_id = aws_subnet.utility-us-east-1c-cloud-fam-com.id
  }
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "api.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_lb" "bastion-cloud-fam-com" {
  enable_cross_zone_load_balancing = false
  internal                         = false
  load_balancer_type               = "network"
  name                             = "bastion-cloud-fam-com-amg3a8"
  subnet_mapping {
    subnet_id = aws_subnet.utility-us-east-1a-cloud-fam-com.id
  }
  subnet_mapping {
    subnet_id = aws_subnet.utility-us-east-1b-cloud-fam-com.id
  }
  subnet_mapping {
    subnet_id = aws_subnet.utility-us-east-1c-cloud-fam-com.id
  }
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "bastion.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_lb_listener" "api-cloud-fam-com-443" {
  default_action {
    target_group_arn = aws_lb_target_group.tcp-cloud-fam-com-qk3bcf.id
    type             = "forward"
  }
  load_balancer_arn = aws_lb.api-cloud-fam-com.id
  port              = 443
  protocol          = "TCP"
}

resource "aws_lb_listener" "bastion-cloud-fam-com-22" {
  default_action {
    target_group_arn = aws_lb_target_group.bastion-cloud-fam-com-amg3a8.id
    type             = "forward"
  }
  load_balancer_arn = aws_lb.bastion-cloud-fam-com.id
  port              = 22
  protocol          = "TCP"
}

resource "aws_lb_target_group" "bastion-cloud-fam-com-amg3a8" {
  connection_termination = "true"
  deregistration_delay   = "30"
  health_check {
    healthy_threshold   = 2
    interval            = 10
    protocol            = "TCP"
    unhealthy_threshold = 2
  }
  name     = "bastion-cloud-fam-com-amg3a8"
  port     = 22
  protocol = "TCP"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "bastion-cloud-fam-com-amg3a8"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_lb_target_group" "tcp-cloud-fam-com-qk3bcf" {
  connection_termination = "true"
  deregistration_delay   = "30"
  health_check {
    healthy_threshold   = 2
    interval            = 10
    protocol            = "TCP"
    unhealthy_threshold = 2
  }
  name     = "tcp-cloud-fam-com-qk3bcf"
  port     = 443
  protocol = "TCP"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "tcp-cloud-fam-com-qk3bcf"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_nat_gateway" "us-east-1a-cloud-fam-com" {
  allocation_id = aws_eip.us-east-1a-cloud-fam-com.id
  subnet_id     = aws_subnet.utility-us-east-1a-cloud-fam-com.id
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "us-east-1a.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-east-1b-cloud-fam-com" {
  allocation_id = aws_eip.us-east-1b-cloud-fam-com.id
  subnet_id     = aws_subnet.utility-us-east-1b-cloud-fam-com.id
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "us-east-1b.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-east-1c-cloud-fam-com" {
  allocation_id = aws_eip.us-east-1c-cloud-fam-com.id
  subnet_id     = aws_subnet.utility-us-east-1c-cloud-fam-com.id
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "us-east-1c.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.cloud-fam-com.id
  route_table_id         = aws_route_table.cloud-fam-com.id
}

resource "aws_route" "route-__--0" {
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.cloud-fam-com.id
  route_table_id              = aws_route_table.cloud-fam-com.id
}

resource "aws_route" "route-private-us-east-1a-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.us-east-1a-cloud-fam-com.id
  route_table_id         = aws_route_table.private-us-east-1a-cloud-fam-com.id
}

resource "aws_route" "route-private-us-east-1b-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.us-east-1b-cloud-fam-com.id
  route_table_id         = aws_route_table.private-us-east-1b-cloud-fam-com.id
}

resource "aws_route" "route-private-us-east-1c-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.us-east-1c-cloud-fam-com.id
  route_table_id         = aws_route_table.private-us-east-1c-cloud-fam-com.id
}

resource "aws_route53_record" "api-cloud-fam-com" {
  alias {
    evaluate_target_health = false
    name                   = aws_lb.api-cloud-fam-com.dns_name
    zone_id                = aws_lb.api-cloud-fam-com.zone_id
  }
  name    = "api.cloud-fam.com"
  type    = "A"
  zone_id = "/hostedzone/Z013889816NRL3LRA6IX"
}

resource "aws_route53_record" "bastion-cloud-fam-com" {
  alias {
    evaluate_target_health = false
    name                   = aws_lb.bastion-cloud-fam-com.dns_name
    zone_id                = aws_lb.bastion-cloud-fam-com.zone_id
  }
  name    = "bastion.cloud-fam.com"
  type    = "A"
  zone_id = "/hostedzone/Z013889816NRL3LRA6IX"
}

resource "aws_route_table" "cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
    "kubernetes.io/kops/role"             = "public"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_route_table" "private-us-east-1a-cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "private-us-east-1a.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
    "kubernetes.io/kops/role"             = "private-us-east-1a"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_route_table" "private-us-east-1b-cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "private-us-east-1b.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
    "kubernetes.io/kops/role"             = "private-us-east-1b"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_route_table" "private-us-east-1c-cloud-fam-com" {
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "private-us-east-1c.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
    "kubernetes.io/kops/role"             = "private-us-east-1c"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_route_table_association" "private-us-east-1a-cloud-fam-com" {
  route_table_id = aws_route_table.private-us-east-1a-cloud-fam-com.id
  subnet_id      = aws_subnet.us-east-1a-cloud-fam-com.id
}

resource "aws_route_table_association" "private-us-east-1b-cloud-fam-com" {
  route_table_id = aws_route_table.private-us-east-1b-cloud-fam-com.id
  subnet_id      = aws_subnet.us-east-1b-cloud-fam-com.id
}

resource "aws_route_table_association" "private-us-east-1c-cloud-fam-com" {
  route_table_id = aws_route_table.private-us-east-1c-cloud-fam-com.id
  subnet_id      = aws_subnet.us-east-1c-cloud-fam-com.id
}

resource "aws_route_table_association" "utility-us-east-1a-cloud-fam-com" {
  route_table_id = aws_route_table.cloud-fam-com.id
  subnet_id      = aws_subnet.utility-us-east-1a-cloud-fam-com.id
}

resource "aws_route_table_association" "utility-us-east-1b-cloud-fam-com" {
  route_table_id = aws_route_table.cloud-fam-com.id
  subnet_id      = aws_subnet.utility-us-east-1b-cloud-fam-com.id
}

resource "aws_route_table_association" "utility-us-east-1c-cloud-fam-com" {
  route_table_id = aws_route_table.cloud-fam-com.id
  subnet_id      = aws_subnet.utility-us-east-1c-cloud-fam-com.id
}

resource "aws_s3_object" "cloud-fam-com-addons-aws-cloud-controller-addons-k8s-io-k8s-1-18" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-aws-cloud-controller.addons.k8s.io-k8s-1.18_content")
  key      = "cloud-fam.com/addons/aws-cloud-controller.addons.k8s.io/k8s-1.18.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-aws-ebs-csi-driver-addons-k8s-io-k8s-1-17" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-aws-ebs-csi-driver.addons.k8s.io-k8s-1.17_content")
  key      = "cloud-fam.com/addons/aws-ebs-csi-driver.addons.k8s.io/k8s-1.17.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-bootstrap" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-bootstrap_content")
  key      = "cloud-fam.com/addons/bootstrap-channel.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-coredns-addons-k8s-io-k8s-1-12" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-coredns.addons.k8s.io-k8s-1.12_content")
  key      = "cloud-fam.com/addons/coredns.addons.k8s.io/k8s-1.12.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-dns-controller-addons-k8s-io-k8s-1-12" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-dns-controller.addons.k8s.io-k8s-1.12_content")
  key      = "cloud-fam.com/addons/dns-controller.addons.k8s.io/k8s-1.12.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-kops-controller-addons-k8s-io-k8s-1-16" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-kops-controller.addons.k8s.io-k8s-1.16_content")
  key      = "cloud-fam.com/addons/kops-controller.addons.k8s.io/k8s-1.16.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-kubelet-api-rbac-addons-k8s-io-k8s-1-9" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-kubelet-api.rbac.addons.k8s.io-k8s-1.9_content")
  key      = "cloud-fam.com/addons/kubelet-api.rbac.addons.k8s.io/k8s-1.9.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-limit-range-addons-k8s-io" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-limit-range.addons.k8s.io_content")
  key      = "cloud-fam.com/addons/limit-range.addons.k8s.io/v1.5.0.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-networking-amazon-vpc-routed-eni-k8s-1-16" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-networking.amazon-vpc-routed-eni-k8s-1.16_content")
  key      = "cloud-fam.com/addons/networking.amazon-vpc-routed-eni/k8s-1.16.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cloud-fam-com-addons-storage-aws-addons-k8s-io-v1-15-0" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cloud-fam.com-addons-storage-aws.addons.k8s.io-v1.15.0_content")
  key      = "cloud-fam.com/addons/storage-aws.addons.k8s.io/v1.15.0.yaml"
  provider = aws.files
}

resource "aws_s3_object" "cluster-completed-spec" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_cluster-completed.spec_content")
  key      = "cloud-fam.com/cluster-completed.spec"
  provider = aws.files
}

resource "aws_s3_object" "discovery-json" {
  acl      = "public-read"
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_discovery.json_content")
  key      = "cloud-fam.com/discovery/cloud-fam.com/.well-known/openid-configuration"
  provider = aws.files
}

resource "aws_s3_object" "etcd-cluster-spec-events" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_etcd-cluster-spec-events_content")
  key      = "cloud-fam.com/backups/etcd/events/control/etcd-cluster-spec"
  provider = aws.files
}

resource "aws_s3_object" "etcd-cluster-spec-main" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_etcd-cluster-spec-main_content")
  key      = "cloud-fam.com/backups/etcd/main/control/etcd-cluster-spec"
  provider = aws.files
}

resource "aws_s3_object" "keys-json" {
  acl      = "public-read"
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_keys.json_content")
  key      = "cloud-fam.com/discovery/cloud-fam.com/openid/v1/jwks"
  provider = aws.files
}

resource "aws_s3_object" "kops-version-txt" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_kops-version.txt_content")
  key      = "cloud-fam.com/kops-version.txt"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-events-control-plane-us-east-1a" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-events-control-plane-us-east-1a_content")
  key      = "cloud-fam.com/manifests/etcd/events-control-plane-us-east-1a.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-events-control-plane-us-east-1b" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-events-control-plane-us-east-1b_content")
  key      = "cloud-fam.com/manifests/etcd/events-control-plane-us-east-1b.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-events-control-plane-us-east-1c" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-events-control-plane-us-east-1c_content")
  key      = "cloud-fam.com/manifests/etcd/events-control-plane-us-east-1c.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-main-control-plane-us-east-1a" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-main-control-plane-us-east-1a_content")
  key      = "cloud-fam.com/manifests/etcd/main-control-plane-us-east-1a.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-main-control-plane-us-east-1b" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-main-control-plane-us-east-1b_content")
  key      = "cloud-fam.com/manifests/etcd/main-control-plane-us-east-1b.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-main-control-plane-us-east-1c" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-main-control-plane-us-east-1c_content")
  key      = "cloud-fam.com/manifests/etcd/main-control-plane-us-east-1c.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-static-kube-apiserver-healthcheck" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_manifests-static-kube-apiserver-healthcheck_content")
  key      = "cloud-fam.com/manifests/static/kube-apiserver-healthcheck.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-control-plane-us-east-1a" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-control-plane-us-east-1a_content")
  key      = "cloud-fam.com/igconfig/control-plane/control-plane-us-east-1a/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-control-plane-us-east-1b" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-control-plane-us-east-1b_content")
  key      = "cloud-fam.com/igconfig/control-plane/control-plane-us-east-1b/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-control-plane-us-east-1c" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-control-plane-us-east-1c_content")
  key      = "cloud-fam.com/igconfig/control-plane/control-plane-us-east-1c/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-nodes-us-east-1a" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-nodes-us-east-1a_content")
  key      = "cloud-fam.com/igconfig/node/nodes-us-east-1a/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-nodes-us-east-1b" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-nodes-us-east-1b_content")
  key      = "cloud-fam.com/igconfig/node/nodes-us-east-1b/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-nodes-us-east-1c" {
  bucket   = "tf-state-kops-stage"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-nodes-us-east-1c_content")
  key      = "cloud-fam.com/igconfig/node/nodes-us-east-1c/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_security_group" "api-elb-cloud-fam-com" {
  description = "Security group for api ELB"
  name        = "api-elb.cloud-fam.com"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "api-elb.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_security_group" "bastion-cloud-fam-com" {
  description = "Security group for bastion"
  name        = "bastion.cloud-fam.com"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "bastion.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_security_group" "masters-cloud-fam-com" {
  description = "Security group for masters"
  name        = "masters.cloud-fam.com"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "masters.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_security_group" "nodes-cloud-fam-com" {
  description = "Security group for nodes"
  name        = "nodes.cloud-fam.com"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "nodes.cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-bastion-cloud-fam-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-masters-cloud-fam-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-172-20-0-0--22-ingress-tcp-22to22-bastion-cloud-fam-com" {
  cidr_blocks       = ["172.20.0.0/22"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-172-20-4-0--22-ingress-tcp-22to22-bastion-cloud-fam-com" {
  cidr_blocks       = ["172.20.4.0/22"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-172-20-8-0--22-ingress-tcp-22to22-bastion-cloud-fam-com" {
  cidr_blocks       = ["172.20.8.0/22"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-22to22-bastion-cloud-fam-com" {
  from_port         = 22
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-443to443-masters-cloud-fam-com" {
  from_port         = 443
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-bastion-cloud-fam-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-cloud-fam-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-cloud-fam-com-ingress-tcp-22to22-masters-cloud-fam-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-cloud-fam-com.id
  source_security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-bastion-cloud-fam-com-ingress-tcp-22to22-nodes-cloud-fam-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.nodes-cloud-fam-com.id
  source_security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-cloud-fam-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-cloud-fam-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-cloud-fam-com-ingress-all-0to0-masters-cloud-fam-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-cloud-fam-com.id
  source_security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-cloud-fam-com-ingress-all-0to0-nodes-cloud-fam-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-cloud-fam-com.id
  source_security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-ingress-all-0to0-masters-cloud-fam-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-cloud-fam-com.id
  source_security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-ingress-all-0to0-nodes-cloud-fam-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-cloud-fam-com.id
  source_security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-ingress-tcp-1to2379-masters-cloud-fam-com" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-cloud-fam-com.id
  source_security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-ingress-tcp-2382to4000-masters-cloud-fam-com" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-cloud-fam-com.id
  source_security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-ingress-tcp-4003to65535-masters-cloud-fam-com" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-cloud-fam-com.id
  source_security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-cloud-fam-com-ingress-udp-1to65535-masters-cloud-fam-com" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-cloud-fam-com.id
  source_security_group_id = aws_security_group.nodes-cloud-fam-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-elb-to-master" {
  cidr_blocks       = ["172.20.0.0/16"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-ssh-nlb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-ssh-nlb-172-20-0-0--22" {
  cidr_blocks       = ["172.20.0.0/22"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-ssh-nlb-172-20-4-0--22" {
  cidr_blocks       = ["172.20.4.0/22"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-ssh-nlb-172-20-8-0--22" {
  cidr_blocks       = ["172.20.8.0/22"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_security_group_rule" "icmpv6-pmtu-api-elb-__--0" {
  from_port         = -1
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "icmpv6"
  security_group_id = aws_security_group.masters-cloud-fam-com.id
  to_port           = -1
  type              = "ingress"
}

resource "aws_security_group_rule" "icmpv6-pmtu-ssh-nlb-__--0" {
  from_port         = -1
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "icmpv6"
  security_group_id = aws_security_group.bastion-cloud-fam-com.id
  to_port           = -1
  type              = "ingress"
}

resource "aws_subnet" "us-east-1a-cloud-fam-com" {
  availability_zone                           = "us-east-1a"
  cidr_block                                  = "172.20.32.0/19"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                                   = "cloud-fam.com"
    "Name"                                                = "us-east-1a.cloud-fam.com"
    "SubnetType"                                          = "Private"
    "kops.k8s.io/instance-group/bastions"                 = "true"
    "kops.k8s.io/instance-group/control-plane-us-east-1a" = "true"
    "kops.k8s.io/instance-group/nodes-us-east-1a"         = "true"
    "kubernetes.io/cluster/cloud-fam.com"                 = "owned"
    "kubernetes.io/role/internal-elb"                     = "1"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_subnet" "us-east-1b-cloud-fam-com" {
  availability_zone                           = "us-east-1b"
  cidr_block                                  = "172.20.64.0/19"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                                   = "cloud-fam.com"
    "Name"                                                = "us-east-1b.cloud-fam.com"
    "SubnetType"                                          = "Private"
    "kops.k8s.io/instance-group/bastions"                 = "true"
    "kops.k8s.io/instance-group/control-plane-us-east-1b" = "true"
    "kops.k8s.io/instance-group/nodes-us-east-1b"         = "true"
    "kubernetes.io/cluster/cloud-fam.com"                 = "owned"
    "kubernetes.io/role/internal-elb"                     = "1"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_subnet" "us-east-1c-cloud-fam-com" {
  availability_zone                           = "us-east-1c"
  cidr_block                                  = "172.20.96.0/19"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                                   = "cloud-fam.com"
    "Name"                                                = "us-east-1c.cloud-fam.com"
    "SubnetType"                                          = "Private"
    "kops.k8s.io/instance-group/bastions"                 = "true"
    "kops.k8s.io/instance-group/control-plane-us-east-1c" = "true"
    "kops.k8s.io/instance-group/nodes-us-east-1c"         = "true"
    "kubernetes.io/cluster/cloud-fam.com"                 = "owned"
    "kubernetes.io/role/internal-elb"                     = "1"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_subnet" "utility-us-east-1a-cloud-fam-com" {
  availability_zone                           = "us-east-1a"
  cidr_block                                  = "172.20.0.0/22"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "utility-us-east-1a.cloud-fam.com"
    "SubnetType"                          = "Utility"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_subnet" "utility-us-east-1b-cloud-fam-com" {
  availability_zone                           = "us-east-1b"
  cidr_block                                  = "172.20.4.0/22"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "utility-us-east-1b.cloud-fam.com"
    "SubnetType"                          = "Utility"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_subnet" "utility-us-east-1c-cloud-fam-com" {
  availability_zone                           = "us-east-1c"
  cidr_block                                  = "172.20.8.0/22"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "utility-us-east-1c.cloud-fam.com"
    "SubnetType"                          = "Utility"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
  vpc_id = aws_vpc.cloud-fam-com.id
}

resource "aws_vpc" "cloud-fam-com" {
  assign_generated_ipv6_cidr_block = true
  cidr_block                       = "172.20.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "cloud-fam-com" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                   = "cloud-fam.com"
    "Name"                                = "cloud-fam.com"
    "kubernetes.io/cluster/cloud-fam.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "cloud-fam-com" {
  dhcp_options_id = aws_vpc_dhcp_options.cloud-fam-com.id
  vpc_id          = aws_vpc.cloud-fam-com.id
}

terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      "configuration_aliases" = [aws.files]
      "source"                = "hashicorp/aws"
      "version"               = ">= 4.0.0"
    }
  }
}
