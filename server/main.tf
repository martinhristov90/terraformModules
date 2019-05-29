variable "ami" {}
variable "instance_type" {}
variable subnet_id {}
variable vpc_security_group_ids {}

resource "aws_instance" "web" {

    ami           = "${var.ami}"

    instance_type = "${var.instance_type}"

    subnet_id     = "${var.subnet_id}"

    vpc_security_group_ids = [
       "${var.vpc_security_group_ids}"
    ]

    tags {
        "name" = "MYMACHINE"
    }
}

    output "public_ip" {
        value = "${aws_instance.web.public_ip}"
    }
    output "public_dns" {
        value = "${aws_instance.web.public_dns}"
    }      