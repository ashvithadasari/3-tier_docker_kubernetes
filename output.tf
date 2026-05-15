output "cluster_id" {
  value = aws_eks_cluster.main.id
}

output "node_group_id" {
  value = aws_eks_node_group.nodes.id
}

output "vpc_id" {
  value = aws_vpc.myappvpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}
output "private_subnet_ids" {
    value =  aws_subnet.private_subnet[*].id
  
}
output "ec2id" {
    value = aws_instance.myappec2.id
  
}