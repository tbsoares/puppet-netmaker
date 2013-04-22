#!/bin/bash
# Script para criar usuarios
# Criar chave SSH se necessario
# E coloca-lo no grupo de Admins (sudo)
# Nao esquecer de liberar o grupo wheel no sudoers
# Script by Molinero <molinero@fiocruz.br>

# Se for do NNOC definir como operadores
# Se for analista ou usuario, definir como users
groupadd operadores
GROUP=operadores
echo
echo "Grupo definido atualmente: $GROUP"
echo
echo "Deseja continuar? [Y/N]"
read ANSWER
if [ $ANSWER == Y ]; then
  echo "Informe o usuario: "
  read USER
  HOME=/home/$USER
  id $USER > /dev/null 2>&1 
  EXIST=$?
  if [ $EXIST == 0 ]; then
	echo "Usuario existente"
  else
	PASS=`cat /dev/urandom| tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?='|fold -w 12| head -n 1| grep -i '[!@#$%^&*()_+{}|:<>?=]'`
    useradd $USER -g $GROUP
    mkdir $HOME
    usermod -p $PASS $USER
# If your Linux is Ubuntu or Gentoo
# Uncomment the line bellow
#chown -R $USER.$USER

# If your Linux is Slackware
# Uncomment the line bellow
    chown -R $USER.$GROUP $HOME
    echo "A senha eh: $PASS"
#    echo "Criar chave ? [Y/N]"
#    read KEY
#    if [ $KEY == Y ]; then
#	  mkdir -p $HOME/.ssh
#For Ubuntu or Gentoo
#	chown -R $USER.$USER $HOME/.ssh
#For Slackware
#	  chown -R $USER.$GROUP $HOME/.ssh
#	  su $USER -c "ssh-keygen -t rsa"
#	  cat $HOME/.ssh/id_rsa.pub > $HOME/.ssh/authorized_keys
# Don't make mistake with other users ! 	
#      mv $HOME/.ssh/id_rsa.pub $HOME/.ssh/id_rsa_$USER.pub
#      mv $HOME/.ssh/id_rsa $HOME/.ssh/id_rsa_$USER
#      chmod 700 $HOME/.ssh
#      chmod 600 $HOME/.ssh/authorized_keys
#    fi
    echo "Usuario Administrador? [Y/N]"
    read ASK
    if [ $ASK == Y ];then
# For Ubuntu or Gentoo
#	usermod -G $USER,wheel $USER
# For Slackware
	  usermod -G users,wheel $USER
    fi
# Copying the exist key
    echo "Importar Chave ? [Y/N]"
    read IMPORT
    if [ $IMPORT == Y ]; then
      mkdir -p $HOME/.ssh
      #scp altairm@157.86.152.50:/home/altairm/chaves/id_rsa_$USER* $HOME/.ssh/
      cd /home/$USER/.ssh
      wget http://leffe.netmaker.com.br/chaves/id_rsa_$USER.pub
      cat $HOME/.ssh/id_rsa_$USER.pub > $HOME/.ssh/authorized_keys
      chmod 700 $HOME/.ssh
      chmod 600 $HOME/.ssh/authorized_keys
# For Ubuntu or Gentoo
# chown -R $USER.$USER $HOME
      chown -R $USER.$GROUP $HOME
    fi
  fi
fi
