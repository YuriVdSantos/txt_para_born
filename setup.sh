#!/bin/bash

#Instale o git na sua VM (se já tiver feito, passe para o próximo passo)

#Clone o repositório para sua VM

#Altere a permissão do Script com o comando abaixo
#chmod 777 setup.sh

#Para rodar o Script basta digitar: ./setup.sh

# Exibe o status do UFW
echo "Verificando o status do firewall (UFW):"
sudo ufw status

# Exibe o status do serviço SSH
echo "Verificando o status do SSH:"
sudo systemctl status ssh

# Lista os usuários no grupo sudo
echo "Listando usuários no grupo sudo:"
getent group sudo

# Lista os usuários no grupo user42
echo "Listando usuários no grupo user42:"
getent group user42

# Adiciona um novo usuário (substitua 'novo_usuario' pelo nome do usuário desejado)
echo "Adicionando um novo usuário chamado 'novo_usuario':"
sudo adduser test42

# Cria um novo grupo (substitua 'grupo_novo' pelo nome do grupo desejado)
echo "Criando um novo grupo chamado 'grupo_novo':"
sudo groupadd test_group

# Adiciona o novo usuário ao novo grupo
echo "Adicionando o usuário 'novo_usuario' ao grupo 'grupo_novo':"
sudo usermod -aG test_group test42

# Verifica regras de expiração de senha do usuário
echo "Verificando regras de expiração de senha para o usuário 'novo_usuario':"
sudo chage -l test42

# Mostra o hostname atual
echo "Hostname atual:"
hostnamectl

# Altera o hostname para 'novo_hostname' (substitua pelo hostname desejado)
echo "Alterando o hostname para 'novo_hostname':"
sudo hostnamectl set-hostname new_host

# Atualiza o arquivo /etc/hosts
echo "Atualizando o arquivo /etc/hosts para refletir o novo hostname:"
sudo sed -i 's/127.0.1.1 .*/127.0.1.1 new_host/' /etc/hosts

# Mostra as partições do sistema
echo "Exibindo partições do sistema:"
lsblk

# Confirma se o sudo está instalado
echo "Verificando se o sudo está instalado:"
dpkg -l | grep sudo

# Lista regras do UFW numeradas
echo "Listando as regras do UFW com numeração:"
sudo ufw status numbered

# Permite a porta 4242 no firewall
echo "Permitindo a porta 4242 no firewall:"
sudo ufw allow 4242

# Testa conexão SSH na porta 4242
echo "Testando conexão SSH na porta 4242:"
ssh seu_usuario@127.0.0.1 -p 4242
