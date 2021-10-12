# infraestrutura requisitada
- Criar uma máquina Virtual, com um ip público
- Expor os protocolos HTTP e HTTP/S
- Instalar um servidor web NGINX.
- Garantir a execução do webserver.
- Testar a conexão com a porta 80
- Criar um storage
- Enviar o log do NGINX para o storage criado.

# About infrastructure

- Use the tfvars localy to access programatic to cloud
- Init on local state file
- Create network 
- Create EC2 instance with SSH key authentication 
- EC2 access private key on AWS Secret 

# Next steps
- Create packer image alternative to Cloud-init


# Running

$ terraform init
$ terraform plan --out=tfplan --var-file='variables.tfvars'
$ terraform apply --auto-approve --var-file='variables.tfvars'


# access
ssh -i FILE.pem ec2-web-mgmt-access@IP