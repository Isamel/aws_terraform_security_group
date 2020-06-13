resource "null_resource" "depends_on" {
    triggers = {
        depends_on = join("", var.security_group_depends_on)
    }
}

resource "aws_security_group" "security_group_terraform" {
    count      = var.security_group_count
    depends_on = [null_resource.depends_on]
    name       = var.security_group_name
    vpc_id     = var.security_group_vpc_id
    dynamic "ingress" {
        for_each = [ for i in var. var.security_group_ingress: {
            from_port   = i.from_port
            to_port     = i.to_port
            protocol    = i.protocol
            cidr_blocks = i.cidr_blocks
            description = i.description
        }]

        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = split(",", ingress.value.cidr_blocks)
            description = ingress.value.description
        }
    }
    dynamic "egress" {
        for_each = [ for e in var. var.security_group_egress: {
            from_port   = e.from_port
            to_port     = e.to_port
            protocol    = e.protocol
            cidr_blocks = e.cidr_blocks
            description = e.description
        }]

        content {
            from_port   = egress.value.from_port
            to_port     = egress.value.to_port
            protocol    = egress.value.protocol
            cidr_blocks = split(",", egress.value.cidr_blocks)
            description = egress.value.description
        }
    }
    tags       = local.tags
}