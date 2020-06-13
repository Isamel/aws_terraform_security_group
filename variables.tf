variable "security_group_count" {
    type        = bool
    description = "security group count."
}

variable "security_group_depends_on" {
    type        = list(string)
    description = "security group depends on."
}

variable "security_group_name" {
    type        = string
    description = "security group name."
}

variable "security_group_vpc_id" {
    type        = string
    description = "security group vpc id."
}

variable "security_group_ingress" {
    type        = list(map(string))
    description = "security group ingress."
}

variable "security_group_egress" {
    type        = list(map(string))
    description = "security group egress."
}

variable "extra_tags" {
    type        = map(string)
    description = "extra tags."
}