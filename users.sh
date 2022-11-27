#!/bin/bash

echo "Criando diretorios..."

mkdir /publico
mkdir /adm
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADMIN
groupadd GRP_VEN
groupadd GRP_SEC


echo "Criando usuários..."


useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd eduardo -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd julia -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd fran -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd susana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Permissões de diretórios..."

chow root:GRP_ADM /adm
chow root:GRP_ADM /ven
chow root:GRP_ADM /sec

chmod - R 770 /adm
chmod - R 770 /ven
chmod - R 770 /sec

echo "fim..."


