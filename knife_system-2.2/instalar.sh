#!/bin/bash

############################### Informações #############################
# Autor: Anônimo000                                                     #
# Data: 05/02/2016                                                      #
# Descrição: Para inúmeras finalidades descritas no Readme.md           #
# Versão: 2.2                                                           #
# Data de modificação: 21/03/2016                                       #
# OS: Apenas para derivados do Debian.                                  #
#                                                                       #
# Sinta-se livre para mudar o código, e deixa-lo a seu gosto            #
# Não retire os devidos créditos                                        #
#########################################################################


###### versão 1.0 #########################
#                                         #
# Criação do menu, das funcões.           #
#                                         #
# Instalação dos programas.               #
#                                         #
# Automatização nas tarefas.              #
###########################################
#
####### versão 1.1 ########################
# Nova opção, instalação de temas.        #
#                                         #
# Erro de esquema das cores concertado.   #
###########################################
#
####### versão 1.2 ########################
# Nova opção, atualização da distribuição.#
###########################################
#
####### versão 1.3 ########################
# Nova opção, remover temas               #
###########################################
#
###### versão 1.4 #########################
# Remoção da lista de programas de insta- #
# lação e movido para um sub-menu.        #
#                                         #
# Nova opção, Lista de programas          #
#                                         #
# Efeitos no menu príncipal               #
###########################################
#
###### versão 1.5 #########################
# Nova opção, Firewall                    #
#                                         #
# Erro na instalação do Gnumeric          #
#                                         #
###########################################
#
##### versão 1.6 ##########################
# Firewall permanente adicionado          #
#                                         #
# Nova opção, GIT                         #
#                                         #
# Aperfeiçoado algumas funções            #
#                                         #
# Script mais discreto sem mostrar muitas mensagens
#                                         #
# Mensagens de log são geradas            #
###########################################
#
###### versão 1.7 #########################
# Aperfeçoamentos nas funções             #
###########################################
#
###### versão 1.8 #########################
# Barra de progresso implantada           #
#                                         #
# Pequenos bugs corrigidos                #
###########################################
#
####### versão 1.9 ########################
# Nova opção, Informações do PC           #
#                                         #
# Pode-se agora mostar o IP externo       #
###########################################
#
####### versão 2.0  #######################
# Melhorado a verificação de conexão      #
#                                         #
# Nmap adicionadoas opções de infos       #
#                                         #
# Concertado bug de obtenção de endereço IP
###########################################
#
####### versão 2.1 ########################
# Nova opção Baixar arquivos              #
###########################################
#
###### versão 2.2 #########################
# Melhorado funções                       #
# Pequenos erros corrigidos               #
# Nova cor implantada                     #
# Novo visual do menu                     #
# Opções de instalação de programas removidas
# Refeito toda opção de programas         #
# Retirado a opção GIT                    #
# Melhorada a opção de instalar programas #
# Informa se há downloads a serem continuados
###########################################

verm="\033[1;31m"
verde="\033[1;32m"
amarelo=`echo "\033[1;33m"`
azul=`echo "\033[1;34m"`
branco=`echo "\033[0;37m"`
NORMAL=`echo "\033[m"`
ciano=`echo "\033[01;36m"`


########################################################
#                menu principal                        #
########################################################
echo -e "${azul}Verificando sua conexão...${NORMAL}"
ping -c1 google.com > /dev/null
if [ $? = 0 ];then
echo -e "${verde}Conectado${NORMAL}"
myip=`curl -s https://wtfismyip.com/text`
echo ""
echo -e "${azul}Verificando se o pacote pv está instalado...${NORMAL}"
which pv > /dev/null
if [ $? != 0 ];then
  echo -e ${verde}Instalando o PV... Aguarde...${NORMAL}
  apt-get -y install pv > /dev/null
fi
sleep 1
echo ""
else
  myip=`echo -e "${verm}Não conectado${NORMAL}"`
  echo -e "${verm}Não conectado a internet${NORMAL}"
  sleep 1
  echo ""
  echo -e "${azul}Verificando se o pacote pv está instalado...${NORMAL}"
  sleep 1
  which pv > /dev/null
  if [ $? != 0 ];then
  echo -e "${verm}Não instalado, por favor instale quando possível${NORMAL}"
fi
  sleep 1
  echo ""
fi
echo -e "${azul}Checando sua distribuição...${NORMAL}"
sleep 1
if [ -e /etc/debian_version ]; then

function menu {
clear
echo -e $verm "====================================== ${NORMAL}"
sleep 0.1
echo -e $amarelo "            Knife System             ${NORMAL}"
sleep 0.1
echo -e $verm" ====================================== ${NORMAL}"
echo -e "${branco}                             versão 2.2"
echo ""
sleep 0.1
echo -e "${amarelo} A)${ciano} Instalar programas${NORMAL}"
sleep 0.1
echo -e "${amarelo} B)${ciano} Remover programas${NORMAL}"
sleep 0.1
echo -e "${amarelo} C)${ciano} Procurar programas${NORMAL}"
sleep 0.1
echo -e "${amarelo} D)${ciano} Reparar erros de dependências${NORMAL}"
sleep 0.1
echo -e "${amarelo} E)${ciano} Atualizar distribuição${NORMAL}"
sleep 0.1
echo -e "${amarelo} F)${ciano} Lista de programas${NORMAL}"
sleep 0.1
echo -e "${amarelo} G)${ciano} Procurar por arquivos${NORMAL}"
sleep 0.1
echo -e "${amarelo} H)${ciano} Instalar temas${NORMAL}"
sleep 0.1
echo -e "${amarelo} I)${ciano} Remover temas${NORMAL}"
sleep 0.1
echo -e "${amarelo} J)${ciano} Firewall${NORMAL}"
sleep 0.1
echo -e "${amarelo} K)${ciano} Informações PC${NORMAL}"
sleep 0.1
echo -e "${amarelo} L)${ciano} Baixar arquivos${NORMAL}"
sleep 0.1

echo ""
echo -e "${ciano}Q)${amarelo} Sair${NORMAL}"
echo -e $verm "Escolha uma das opções:"

read -n1 inst
}


########################################################
#               Funções do menu principal              #
########################################################

##### Instalar programas #####

function instal() {
  function deb() {
    echo -e "${ciano}Informe a localização do pacote .deb à ser instalado:${NORMAL}"
    read -e debResp
    if [ -e $debResp ];then
      echo -e "${azul}Instalando pacote aguarde...${NORMAL}"
      sleep 1
      dpkg -i $debResp | pv -W > /dev/null
      apt-get install -fy | pv -W /dev/null
      echo ""
      echo -e "${verde}Instalação concluída!${NORMAL}"
      sleep 1
    else
      echo -e "${verm}Pacote não encontrado, tente novamente!${NORMAL}"
      echo -e "${branco}Não esqueça de colocar a extensão .deb no nome do pacote${NORMAL}"
      echo -e "${branco}Caso tenha instalado o script basta${NORMAL}"
      echo -e "${branco}Entrar na pasta corrente do pacote e digitar seu nome${NORMAL}"
      sleep 10
      reset
      deb
    fi
  }

  function instRep() {
    echo -e "${ciano}Informe o nome  do pacote à ser instalado:${NORMAL}"
    read pacResp
    clear
    echo -e "${azul}Instalando pacote aguarde...${NORMAL}"
    apt-get -y install $pacResp | pv -W > /dev/null
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  }
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Instalar               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Como deseja instalar?${NORMAL}"
   echo ""
   echo -e "${ciano}1) ${azul}Pacote .deb${NORMAL}"
   echo -e "${ciano}2) ${azul}Direto do repositório${NORMAL}"
   echo ""
   echo -e "${verde}Pressione ${amarelo}[ Q ] ${verde}para voltar${NORMAL}"
   read -n1 instResp
   case $instResp in
     1)reset;
       deb;
       inst;
       ;;

       2)reset;
         instRep;
         inst;
         ;;

         Q | q)fazer;
         ;;
         *)reset;
           inst;
         esac
}

###### Remover programas #####

function remov() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Remover               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Digite o nome do programa a ser removido:${NORMAL}"
   read rmove
   sleep 1
   echo -e "${azul}Removendo $rmove. Por favor, aguarde...${NORMAL}"
   apt-get -y remove --purge $rmove | pv -W > /tmp/KS_remove.log
   apt-get -y autoremove | pv -W > /tmp/KS_aremove.log
   echo ""
   echo -e "${verde}$rmove removido com sucesso${NORMAL}"
   sleep 2
}

###### Repara dependências #####

function repair() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Reparar                ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e "${amarelo}Reparando... aguarde...${NORMAL}"
   echo ""
   sleep 1
   apt-get -f install | pv -W > /tmp/KS_finstall.log
   apt-get -y autoremove | pv -W > /tmp/KS_autremove.log
   apt-get clean | pv -W > /tmp/KS_clean.log
   dpkg --configure -a | pv -W > /tmp/KS_configa.log
   echo -e "${verde}Dependências reparadas com sucesso${NORMAL}"
   sleep 2
}

###### Procurar programas #####

function achar() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Procurar               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Digite o nome do programa:${NORMAL}"
   read ach
   echo -e $ciano""
   apt-cache pkgnames $ach | grep $ach
   echo ""
   echo -e "${verde}Pressione ${amarelo}[ Q ] ${verde}para voltar${NORMAL}"
   read -n1 acharResp

   case $acharResp in

     Q | q)fazer;
           ;;

      *)reset;
        location;
    esac

}

###### Procurar arquivos #####

function location() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Procurar               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Digite o nome do arquivo:${NORMAL}"
   read achha
   echo -e "${verm}Atualizando arquivos no sistema, dependendo do espaço ocupado no seu HD isso${NORMAL}"
   echo -e "${verm}poderá levar alguns minutos. Aguarde...${NORMAL}"
   echo ""
   updatedb
   locate $achha | grep $achha
   echo ""
   echo -e "${verde}Pressione ${amarelo}[ Q ] ${verde}para voltar${NORMAL}"
   read -n1 locatResp

   case $locatResp in

     Q | q)fazer;
           ;;

      *)reset;
        location;
    esac
}

##### Atualizar distro ######

function atual() {
   echo -e "${azul}Em alguns casos de atualização completa do sistema${NORMAL}"
   echo -e "${azul}podem ocorrer erros nas dependências, causando perda total do${NORMAL}"
   echo -e "${azul}sistema, levando á uma nova formatação.${NORMAL}"
   echo ""
   echo -e "${verde}Deseja realmente atualizar sua distribuição? [S/N]${NORMAL}"
   read -n1 atualit

   if [ $atualit == "n" ];then
      menu
   else
    clear
    echo -e $amarelo"****************************************"
    echo -e "${verde}        Atualizando sistema!${NORMAL}"
    echo -e $amarelo"****************************************"
    sleep 2
    echo ""
    echo -e "${azul}Atualizando seu sistema, isso pode demorar algun minutos${NORMAL}"
    apt-get -uy dist-upgrade | pv -W > /dev/null
    echo ""
    echo -e $verde"Atualização terminada"
    sleep 1
    menu
fi

}

##### Instalar temas ###########
#                              #
################################

function tema() {
function instTema() {
    echo -e "${branco}Insira o nome do seu tema, já descompactado e levando em conta que${NORMAL}"
    echo -e "${branco}ele esteja na  mesma pasta que este script:${NORMAL}"
    read theme

    if [ -e $theme ];then
    clear
    mv -f $theme /usr/share/themes
    sleep 2
    echo -e "${verde}Tema adicionado com sucesso!${NORMAL}"
    sleep 1
    echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
    echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
    sleep 2
    clear
  else
    clear
    echo -e "${verm}Arquivo não encontrado!${NORMAL}"
    sleep 1
    clear
    instTema
  fi
  }

  ##### Cursor ######

 function cursor() {
    echo -e "${verde}Insira o nome do seu cursor, já descompactado e levando em conta que ele esteja em sua pasta HOME:${NORMAL}"
    read curso

   if [ -e .icons ];then
    mv $curso .icons
    sleep 2
    echo -e "${verde}Cursor adicionado com sucesso!${NORMAL}"
    sleep 1
    clear
    echo -e "${branco}O cursor já está pronto para ser instalado, basta apenas${NORMAL}"
    echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
    sleep 2
    reset
  else
    echo -e "${verm}Diretório .icons não foi encontrado em HOME${NORMAL}"
    sleep 1
    echo -e "${azul}Criando diretório em sua home... "
    mkdir .icons
    sleep 2
    echo -e "${verde}Diretório criado, rode o comando novamente"
    sleep 2
    clear
    cursor

  fi
 }

 ##### Ícones #####

  function icone() {
    echo -e "${verde}Insira o nome do seu ícone, já descompactado e levando em conta que ele esteja em sua pasta HOME:${NORMAL}"
    read icon

    if [ -e $icon ];then
    clear
    mv -f $icon /usr/share/icons
    sleep 2
    echo -e "${verde}Ícone adicionado com sucesso!${NORMAL}"
    sleep 1
    clear
    echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
    echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
    sleep 2
    reset
  else
    clear
    echo -e "${verm}Arquivo não encontrado!${NORMAL}"
    sleep 1
    clear
    icone
  fi
}

function tool() {
  echo -e "${azul}Instalando gnome-tweak-tool${NORMAL}"
  sleep 2
  apt-get -y install gnome-tweak-tool
  tema
}
  echo -e "${verde}O que deseja instalar?"
  echo ""

  echo -e "${amarelo}1) ${azul} Temas${NORMAL}"
  echo -e "${amarelo}2) ${azul} Cursor${NORMAL}"
  echo -e "${amarelo}3) ${azul} Ícones${NORMAL}"
  echo -e "${amarelo}4) ${azul} Gnome-Tweak-Tool${NORMAL}"
  echo ""
  echo
  echo -e "${azul}X) ${amarelo}Voltar ao menu principal${NORMAL}"
  read -n1 temeInsta

  while [ temeInsta != '' ]
  do
    case $temeInsta in

      1) reset;
         instTema;
         tema;
         ;;

         2) reset;
            cursor;
            tema;
            ;;

            3) reset;
               icone;
               tema;
               ;;

               4) reset;
                  tool;
                  tema;
                  ;;

                  x) fazer;
                     ;;

                     *)reset;
                       tema;
                       ;;
    esac
done
}

### Remover temas ######
#                      #
########################

function removeTemas() {
  function rmTema () {
    echo -e "${branco}Insira o nome do tema a se removido:${NORMAL}"
    echo ""
    read rmtheme

    if [ -e /usr/share/themes/$rmtheme ];then
      sleep 2
      rm -r /usr/share/themes/$rmtheme
      echo -e "${verde}Tema removido com sucesso!"
      sleep 1
      echo -e "${azul}Basta apenas você ir em aparência e muda-lo${NORMAL}"
      sleep 2
      clear
      removeTemas
    else
      echo -e "${verm}Tema não encontrado!"
      sleep 2
      clear
      rmTema
    fi
  }

##### Remover Cursor ######

  function rmCursor() {
    echo -e "${branco}Insira o nome do cursor a ser removido:${NORMAL}"
    echo ""
    read rmcurso

    if [ -e .icons/$rmcurso ];then
      sleep 2
      rm -r .icons/$rmcurso
      echo -e "${verde}Cursor removido com sucesso${NORMAL}"
      sleep 1
      echo -e "{branco}Basta apenas você ir em aparência e muda-lo${NORMAL}"
      sleep 2
      removeTemas
    else
      echo -e "${verm}Cursor não encontrado"
      sleep 2
      clear
      rmCursor
    fi
  }

###### Remover ícones ######

  function rmIcones() {
    echo -e "${branco}Insira o nome do ícone a ser removido:${NORMAL}"
    echo ""
    read rmicon

    if [ -e /usr/share/icons/$rmicon ];then
      sleep 2
      rm -r /usr/share/icons/$rmicon
      echo -e "${verde}Ícone removido com sucesso!${NORMAL}"
      sleep 1
      echo -e "${branco}Basta apenas você ir em aparência e muda-lo${NORMAL}"
      sleep 2
      clear
      removeTemas
    else
      echo -e "${verm}Ícone não encontrado!${NORMAL}"
      sleep 2
      clear
      rmIcones
    fi
  }

  ###### Menu de remoção de temas ######

  echo -e "${verde}O que deseja remover?"
  echo ""

  echo -e "${amarelo}1) ${azul} Temas${NORMAL}"
  echo -e "${amarelo}2) ${azul} Cursor${NORMAL}"
  echo -e "${amarelo}3) ${azul} Ícones${NORMAL}"
  echo ""
  echo -e "${azul}X) ${amarelo}Voltar ao menu principal${NORMAL}"
  read -n1 maintheme

  while [ maintheme != '' ]
  do
    case $maintheme in

      1) clear;
         rmTema;
         removeTemas;
         ;;

         2) clear;
            rmCursor;
            removeTemas;
            ;;

            3) clear;
               rmIcones;
               removeTemas;
               ;;

               x) fazer;
                  ;;

                  *) reset;
                     removeTemas;

 esac
done
}


############# Firewall ##################

# Área destinada a usuários avançados que possuam conhecimentos para modificar
# esse pequeno firewall de acordo com suas necessidades
#

function firew() {
 startFire() {
   clear
   echo -e "${verm} ATENÇÃO!${NORMAL}"
   echo ""
   sleep 1
   echo -e ${amarelo}"Este é apenas um símples firewall criado por"
   echo -e ${amarelo}"Tácio de Jesus Andrade e editado por mim"
   echo ""
   echo -e ${amarelo}"Ele pode não funcionar em algumas máquinas"
   echo -e ${amarelo}"dependendo muito dos serviços que nela roda"
   echo ""
   echo -e ${amarelo}"Edite-o de acordo com suas necessidades"
   sleep 10
   clear
   ########################
    # Zera todas as Regras #
    ########################
      iptables -F

    ########################################
    # Bloqueia tudo, nada entra e nada sai #
    ########################################
      iptables -P INPUT DROP
      iptables -P FORWARD DROP
      iptables -P OUTPUT DROP

    ############################################################################
    # Impede ataques DoS a maquina limitando a quantidade de respostas do ping #
    ############################################################################
     iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT

    #################################
    # Bloqieia completamente o ping #
    #################################
      iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

    ##########################
    # Politicas de segurança #
    ##########################
      echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route # Impede falsear pacote
      echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects # Perigo de descobrimento de rotas de roteamento (desativar em roteador)
      echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts # Risco de DoS
      echo 1 > /proc/sys/net/ipv4/tcp_syncookies # Só inicia a conexão quando recebe a confirmação, diminuindo a banda gasta
      echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter # Faz o firewall responder apenas a placa de rede que recebeu o pacote
      iptables -A INPUT -m state --state INVALID -j DROP # Elimina os pacotes invalidos

    #################################
    # Libera conexoes estabelecidas #
    #################################
      iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
      iptables -A FORWARD -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
      iptables -A OUTPUT -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
      iptables -A INPUT -i lo -j ACCEPT

      iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
      iptables -A INPUT -p tcp --dport 80 -j ACCEPT

    ################################
    # Previne ataque de SYS Flood  #
    ################################
      iptables -t filter -N syn-chain
      iptables -t filter -A syn-chain -p tcp --syn -m limit --limit 2/s -j ACCEPT
      iptables -t filter -A syn-chain -j DROP

    echo ""
    echo -e "${verde}Firewall ativado com sucesso.${NORMAL}"
    sleep 2
    reset
    firew
}
 function stopFire() {
     clear
     echo -e "${verm} Parando firewall..."
     sleep 2
     # -----------------------------------------------------------------
     # Remove todas as regras existentes
     # -----------------------------------------------------------------
       iptables -F
       iptables -X
       iptables -t mangle -F
     # -----------------------------------------------------------------
     # Reseta as politicas padrões, aceitar tudo
     # -----------------------------------------------------------------
       iptables -P INPUT   ACCEPT
       iptables -P OUTPUT  ACCEPT
       iptables -P FORWARD ACCEPT

      echo 1 > /proc/sys/net/ipv4/conf/all/accept_source_route
      echo 1 > /proc/sys/net/ipv4/conf/all/accept_redirects
      echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
      echo 0 > /proc/sys/net/ipv4/tcp_syncookies
      echo 0 > /proc/sys/net/ipv4/conf/default/rp_filter
     reset
     firew
 }

function permFire() {
 reset
 echo -e "${verde}Esse firewall será 'ativado' toda vez que o sistema for inicializado${NORMAL}"
 sleep 3
 echo  ""

 echo "
      iptables -F
      iptables -P INPUT DROP
      iptables -P FORWARD DROP
      iptables -P OUTPUT DROP
      iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
      iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
      echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
      echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
      echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
      echo 1 > /proc/sys/net/ipv4/tcp_syncookies
      echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter
      iptables -A INPUT -m state --state INVALID -j DROP
      iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
      iptables -A FORWARD -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
      iptables -A OUTPUT -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
      iptables -A INPUT -i lo -j ACCEPT
      iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
      iptables -A INPUT -p tcp --dport 80 -j ACCEPT
      iptables -t filter -N syn-chain
      iptables -t filter -A syn-chain -p tcp --syn -m limit --limit 2/s -j ACCEPT
      iptables -t filter -A syn-chain -j DROP" > firewall.sh

      mv firewall.sh /etc/init.d
      ln -s /etc/init.d/firewall.sh /etc/rc3.d/S54firewall

  echo -e "${verde}Firewall ativado com sucesso${NORMAL}"
  sleep 2

  firew
}

function permStopFire() {
 reset
 echo -e "${azul}Parando firewall...${NORMAL}"
 sleep 2
 rm /etc/rc3.d/S54firewall
 rm /etc/init.d/firewall.sh
 echo -e "${verde}Firewall parado com sucesso${NORMAL}"
 sleep 2
 firew
}

function newFire() {
  function fireExpert() {
    echo -e "${ciano}O que desja fazer?${NORMAL}"
    echo ""
    echo -e "${verde}1) ${verm}Listar regras${NORMAL}"
    echo -e "${verde}2) ${verm}Criar regra${NORMAL}"
    echo -e "${verde}3) ${verm}Deletar regra${NORMAL}"
  }
  echo -e "${branco}Não funcional, em desenvolvimento${NORMAL}"
  echo -e ${ciano}Você se considera um usuário:${NORMAL}
  echo ""
  echo -e "${verm}1) ${amarelo}Avançado${NORMAL}"
  echo -e "${verm}2) ${amarelo}Iniciante${NORMAL}"
  echo ""
  echo -e "${branco}Pressine [Q] para voltar${NORMAL}"
  echo -e "${ciano}Escolha uma das opções:${NORMAL}"
  read -n1 newFireResp
  case $newFireResp in
    1)reset;
      fireExpert;
      exit;
      ;;

      2)reset;
        fireBeginner;
        exit;
        ;;

        Q | q)fazer;
        ;;

        *)echo -e "${verm}Opção inválida!${NORMAL}"
          sleep 1;
          reset;
          newFire;

esac


}

 echo -e "${amarelo}1)${verde} Iniciar firewall${NORMAL}"
 echo -e "${amarelo}2)${verde} Iniciar firewall ${branco}(Permanente)${NORMAL}"
 echo -e "${amarelo}0)${verm} Parar firewall${NORMAL}"
 echo -e "${amarelo}9)${verm} Parar firewall ${branco}(Permanente)${NORMAL}"
 echo -e "${amarelo}5)${ciano} Crie seu firewall${branco}(em desenvolvimento)${NORMAL}"
 echo ""
 echo -e "${verde}X)${amarelo}Voltar ao menu princípal${NORMAL}"

 read -n1 respFire


 case $respFire in

  1) startFire;
     reset;
     firew;
     ;;
    2) permFire;
       reset;
       firew;
       ;;

   0) stopFire;
      reset;
      firew;
      ;;

   9) permStopFire;
      reset;
      firew;
      ;;

      5)reset;
        newFire;
        firew;
        ;;

    X | x) fazer;
           ;;

     *) reset;
        firew;

 esac
}

########## Informações do hardware e etc.... #################
function infos() {
  function rede() {
    iwco=`iwconfig`
    ifco=`ifconfig`
    dns=`cat /etc/resolv.conf`
    rot=`route`
    echo -e "${amarelo}Informações sobre a sua rede${NORMAL}"
    echo ""
    sleep 2
    echo -e "${amarelo}Equivale ao iwconfig:${NORMAL}"
    sleep 1
    echo -e "${azul} $iwco ${NORMAL}"
    echo ""
    echo -e "${amarelo}Equivale ao ifconfig:${NORMAL}"
    echo -e "${verde} $ifco ${NORMAL}"
    sleep 1
    echo ""
    echo -e "${amarelo}Informções do DNS:${NORMAL}"
    sleep 1
    echo -e "${verm} $dns ${NORMAL}"
    echo ""
    echo -e "${amarelo}ROUTE${NORMAL}"
    sleep 1
    echo -e "${azul} $rot ${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 redeResp
    case $redeResp in
      Q | q)reset;
            infos;
            ;;
     *)echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       rede;
      ;;
    esac
  }

  function hard() {
    cpui=`cat /proc/cpuinfo`
    memi=`cat /proc/meminfo`
    fre=`free -m`
    echo -e "${amarelo}Informações da CPU e memória(HD)"
    echo ""
    echo -e "${amarelo}CPU:${NORMAL}"
    sleep 1
    echo -e "${verde} $cpui ${NORMAL}"
    echo ""
    echo -e "${amarelo}RAM:${NORMAL}"
    sleep 1
    echo -e "${azul} $memi ${NORMAL}"
    echo ""
    echo -e "${azul} $fre ${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 hardResp
    case $hardResp in
      Q | q)reset;
            infos;
            ;;
     *)echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       hard;
      ;;
    esac
  }

  function arqui() {
    echo -e "${amarelo}Arquitetura da sua máquina(x86_64 ou i386)${NORMAL}"
    echo ""
    archi=`arch`
    echo -e "${azul}A arquiteura da sua máquina é: ${verm}$archi${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 arquiResp
    case $arquiResp in
      Q | q)reset;
            infos;
            ;;
     *)reset;
       echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       arqui;
      ;;
    esac
  }
  function ker() {
    unn=`uname -n`
    unr=`uname -r`
    unv=`uname -v`
    echo -e "${amarelo}Informações sobre o kernel${NORMAL}"
    echo ""
    echo -e ${verm} $unn ${azul}$unr ${verde}$unv ${NORMAL}
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 kerResp
    case $kerResp in
      Q | q)reset;
            infos;
            ;;
     *)reset;
       echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       ker;
      ;;
    esac
  }

  function ports() {
    function pergNmap() {
      echo -e "${verm}Nmap não instalado${NORMAL}"
      sleep 1
      echo -e "${verde}Deseja instalar o Nmap? [N/S]${NORMAL}"
      read -n1 nmapResp
      case $nmapResp in
        S | s)echo "";
            echo -e "${azul}Instalando Nmap.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y install nmap | pv;
            reset;
            infos;
             ;;

        N | n)reset;
              infos;
              ;;

      esac

    }
    echo -e "${amarelo}Informações sobre os serviços e portas rodando${NORMAL}"
    echo -e "${branco}Necessita o Nmap instalado${NORMAL}"
    echo ""
    which nmap > /dev/null
    if [ $? = 0 ];then
    nmap -sV localhost
    echo ""
    echo -e "${verde}Voltar [Q]${NORMAL}"
    read -n1 voltResp
    case $voltResp in
      Q | Q)fazer;
    esac
  else
    reset;pergNmap
  fi
  }

  echo -e "${amarelo}Obter informaçõe do seu computador ou notebook:${NORMAL}"
  echo -e "${branco}Seu IP(externo): $myip"
  echo ""
  echo -e "${verm}1) ${verde}Informações de rede${NORMAL}"
  sleep 0.1
  echo -e "${verm}2) ${verde}Informações do sistema(HD, RAM)${NORMAL}"
  sleep 0.1
  echo -e "${verm}3) ${verde}Informações do kernel${NORMAL}"
  sleep 0.1
  echo -e "${verm}4) ${verde}Arquitetura do processador${NORMAL}"
  sleep 0.1
  echo -e "${verm}5) ${verde}Serviços e portas${branco}(Nmap)${NORMAL}"
  echo ""
  echo -e "${verde}Q) ${verm}Voltar ao menú princípal${NORMAL}"
  read -n1 respInfo
  case $respInfo in
    1) reset;
       rede;
       ;;

       2)reset;
         hard;
         ;;

         3)reset;
           ker;
           ;;

           4)reset;
             arqui;
             ;;

             5)reset;
               ports;
               ;;

             Q | q)fazer;
                   ;;

                   *)reset;
                     infos;
    esac
}

##### Download de arquivos ##############
function down() {
  function baixar() {
    echo -e "${azul}Digite o link do arquivo à ser baixado:${NORMAL}"
    read downResp
    clear
    echo -e "${azul}Digite o nome da pasta e o nome do arquivo que será baixado:${NORMAL}"
    echo -e "${branco}Ex: /home/fulano/Downloads/arquivo.deb${NORMAL}"
    echo ""
    read -e direResp
    clear
    echo -e "${verde}Baixando arquivo${NORMAL}"
    echo -e "${branco}Pressione CTRL + C, para pausar"${NORMAL}
    echo ""
    sleep 2
    echo "$downResp" > /var/log/KS_arqdown.log
    echo "$direResp" > /var/log/KS_dirdown.log
    wget -O $direResp $downResp
    echo ""
    echo -e "${verde}Download concluído${NORMAL}"
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 conVOL
    case $conVol in
      Q | q)fazer;
      ;;

      *)fazer;
  esac
  }

function contBaixar() {
  if [ -e /var/log/KS_dirdown.log ];then
  echo -e "${azul}Continuando download anterior...${NORMAL}"
  echo -e "${branco}Pressione CTRL + C, para pausar"${NORMAL}
  echo ""
  sleep 2
  arqDown=`cat /var/log/KS_arqdown.log`
  dirDown=`cat /var/log/KS_dirdown.log`
  wget -c -O $dirDown $arqDown
  if [ $? = 0 ];then
  echo ""
  echo -e "${verde}Download concluído${NORMAL}"
  rm /var/log/KS_*.log
fi
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  read -n1 concluVOL
  case $concluVol in
    Q | q)fazer;
    ;;

    *)fazer;
esac

else
  echo -e "${verm}Não há downloads${NORMAL}"
  sleep 2
  reset
  down
fi
}

function histDown() {
  echo -e "${azul}Excluindo histórico...${NORMAL}"
  rm /var/log/KS_*.log
  echo -e "${verde}Concluído!${NORMAL}"
  sleep 1
  reset
  down
}

ping -c1 google.com > /dev/null
if [ $? = 0 ];then
echo -e "${verde}Baixar arquivos da internet${NORMAL}"
echo ""
echo -e "${verm}1) ${amarelo}Baixar arquivo${NORMAL}"
echo -e "${verm}2) ${amarelo}Continuar download${NORMAL}"
echo -e "${verm}3) ${amarelo}Limpar histórico de download${NORMAL}"
if [ -e /var/log/KS_dirdown.log ] && [ -e /var/log/KS_dirdown.log ];then
  echo -e "${ciano}Você tem [1] download pendente${NORMAL}"
fi
echo ""
echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
echo -e "${azul}Escolha uma das opções:${NORMAL}"
read -n 1 wgetResp
case $wgetResp in
  1)reset;
    baixar;
    reset;
    down;
    ;;

    2)reset;
      contBaixar;
      reset;
      down;
      ;;

      3)reset;
        histDown;
        reset;
        down;
        ;;

      q | Q)fazer;
      ;;

      *)reset;
        down;
esac
else
  echo -e "${verm}Não conectado${NORMAL}"
  echo ""
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  read -n1 notCon
  case $notCon in
    Q | q)fazer;
    ;;

    *)fazer;
esac
  fi
}
########### Instalação de programas ###################

function programas() {
  function conky-manage() {
    echo -e "${ciano}Baixando e instalando o Conky-Manager${NORMAL}"
    sleep 1
    wget https://www.dropbox.com/s/5fg0n1ls1wnvxhn/conky-manager-latest-amd64.deb?dl=0 -O Conky-Manager.deb
    clear
    dpkg -i Conky-Manager.deb | pv -W >/dev/null
    apt-get install -f | pv -W >/dev/null
    rm Conky-Manager.deb
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1

  }


function skyp() {
  arch=`uname -m`
  if [ $arch = x86_64 ];then
    echo -e "${ciano}Para isso será necessário editar sua source.list${NORMAL}"
    echo ""
    echo -e "${ciano}Editando sources.list aguarde...${NORMAL}"
    echo "
##Mint 17 - Skype for x86_64
deb cdrom:[Linux Mint 17 _Qiana_ - Release i386 20140513]/ trusty contrib main non-free
deb http://packages.linuxmint.com qiana main upstream import #id:linuxmint_main
deb http://extra.linuxmint.com qiana main #id:linuxmint_extra
deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu/ trusty partner" >> /etc/apt/sources.list
echo -e "${ciano}Realizando update e instalando o Skype...${NORMAL}"
apt-get update | pv -W > /dev/null
apt-get -y install skype | pv -W > /dev/null
apt-get -fy | pv -W /dev/null
echo -e "${verde}Instalação concluída!${NORMAL}"
echo -e "${branco}O skype pode não funcionar em algumas distros.${NORMAL}"
sleep 2
else
  echo -e "${ciano}Baixando e instalando o Skype...${NORMAL}"
  wget https://www.dropbox.com/s/vkygoriipuzmncq/skype-debian_4.3.0.37-1_i386.deb?dl=0 -O skype.deb
  clear
  dpkg -i skype.deb | pv -W >/dev/null
  apt-get install -fy | pv -W > /dev/null
  rm skype.deb
  echo ""
  echo -e "${verde}Instalação concluída${NORMAL}"
  sleep 1
fi
}

function chrom() {
  echo -e "${ciano}Baixando e instalando o chrome...${NORMAL}"
  wget https://www.dropbox.com/s/amp2lb1ww8zylil/google-chrome-stable_current_amd64.deb?dl=0 -O chrome.deb
  clear
  dpkg -i chrome.deb | pv -W > /dev/null
  apt-get install -fy | pv -W > /dev/null
  rm chrome.deb
  echo ""
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
}

function atm() {
  echo -e "${ciano}Baixando e instalando o Atom...${NORMAL}"
  wget https://www.dropbox.com/s/8fpxvr803zm7xlg/atom-amd64.deb?dl=0 -O atom.deb
  clear
  dpkg -i atom.deb | pv -W > /dev/null
  apt-get install -fy | pv -W > /dev/null
  rm atom.deb
  echo ""
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
}
ping -c1 google.com > /dev/null
if [ $? = 0 ];then
echo -e "${verm}*************************************${NORMAL}"
sleep 0.1
echo -e "${verde}            PROGRAMAS               ${NORMAL}"
sleep 0.1
echo -e "${verm}*************************************${NORMAL}"
sleep 0.1
echo ""
echo -e "${amarelo} 1)${azul} Skype${NORMAL}"
sleep 0.1
echo -e "${amarelo} 2)${azul} Conky-Manager${NORMAL}"
sleep 0.1
echo -e "${amarelo} 3)${azul} Chrome${NORMAL}"
sleep 0.1
echo -e "${amarelo} 4)${azul} Atom${NORMAL}"
echo ""
echo -e "pressione [ Q ] para voltar ao menu principal"
echo -e "${verm}Escolha qual pacote deseja instalar:${NORMAL}"
read -n1 proResp
 while [ proResp != '' ]; do
 case $proResp in

   1)reset;
     skyp;
     programas;
     ;;

     2)reset;
      conky-manage;
      programas;
      ;;

      3)reset;
       chrom;
       programas;
       ;;

       4)reset;
         atm;
         programas;
         ;;

         Q | q)fazer;
         ;;

  *) reset;
     programas;

esac
done
else
  echo -e "${verm}Não conectado${NORMAL}"
  echo ""
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  read -n1 notCon
  case $notCon in
    Q | q)fazer;
    ;;

    *)fazer;
esac
  fi
}
######################################
#      Setar os comandos do menu     #
#####################################
function fazer() {
  reset
  menu
while [ inst != '' ]
    do

    case $inst in
      A | a)reset;
            instal;
            menu;
            ;;
            B | b)reset;
                  remov;
                  menu;
                  ;;

                  C | c)reset;
                        achar;
                        menu;
                        ;;

                        D | d)reset;
                              repair;
                              menu;
                              ;;

                              E | e)reset;
                                    atual;
                                    menu;
                                    ;;

                                    F | f)reset;
                                          programas;
                                          menu;
                                          ;;

                                          G | g)reset;
                                                location;
                                                menu;
                                                ;;

                                                H | h)reset;
                                                      tema;
                                                      menu;
                                                      ;;

                                                      I | i)reset;
                                                             removeTemas;
                                                             menu;
                                                            ;;

                                                            J | j)reset;
                                                                  firew;
                                                                  menu;
                                                                  ;;

                                                                  K | k)reset;
                                                                        infos;
                                                                        menu;
                                                                        ;;

                                                                        L | l)reset;
                                                                              down;
                                                                              menu;
                                                                              ;;

     Q | q)reset;
           echo -e "${ciano}Até mais${NORMAL}"
           exit;
           ;;

     *) reset;
        menu;
        ;;
    esac
done
}

if [ `whoami` == "root" ]; then
	fazer;
else
    echo ""
	echo -e $verm "Você precisa ser root digite sua senha e tente novamente${NORMAL}"
    sudo su
fi

else
  echo "Desculpe, esse script só funciona em derivados do Debian"
fi
