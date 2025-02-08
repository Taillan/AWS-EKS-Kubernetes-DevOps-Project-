# Public route table association
resource "aws_route_table_association" "rt_public_a" {
    subnet_id = aws_subnet.web_public_subnet_3a.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "rt_public_b" {
    subnet_id = aws_subnet.web_public_subnet_3b.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "rt_public_c" {
    subnet_id = aws_subnet.web_public_subnet_3c.id
    route_table_id = aws_route_table.public.id
}

# Private app route table association
resource "aws_route_table_association" "rt_private_app_a" {
    subnet_id = aws_subnet.app_private_subnet_3a.id
    route_table_id = aws_route_table.private_3a.id
}

resource "aws_route_table_association" "rt_private_app_b" {
    subnet_id = aws_subnet.app_private_subnet_3b.id
    route_table_id = aws_route_table.private_3b.id
}

resource "aws_route_table_association" "rt_private_app_c" {
    subnet_id = aws_subnet.app_private_subnet_3c.id
    route_table_id = aws_route_table.private_3c.id
}

# Private db route table association
resource "aws_route_table_association" "rt_private_db_a" {
    subnet_id = aws_subnet.db_private_subnet_3a.id
    route_table_id = aws_route_table.private_3a.id
}

resource "aws_route_table_association" "rt_private_db_b" {
    subnet_id = aws_subnet.db_private_subnet_3b.id
    route_table_id = aws_route_table.private_3b.id
}

resource "aws_route_table_association" "rt_private_db_c" {
    subnet_id = aws_subnet.db_private_subnet_3c.id
    route_table_id = aws_route_table.private_3c.id
}