locals {
  projeto      = "projeto"
  tags {
    Environment = "${var.environment}"
    Projeto     = "${local.projeto}"
  }
}