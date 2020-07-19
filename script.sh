 # Garantindo as chaves
    KEY_PATH='/vagrant/files'
    mkdir -p /root/.ssh
    cp $KEY_PATH/key /root/.ssh/id_rsa
    cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
    cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
    chmod 400 /root/.ssh/id_rsa*
    cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# edicao do arquivo /etc/hosts
IP='192.168.0.'
domain='.sgp.local'
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo $IP'160 acesso-01'$domain >> /etc/hosts
echo $IP'110 automation-01'$domain >> /etc/hosts
echo $IP'120 compliance-01'$domain >> /etc/hosts
echo $IP'130 container-01'$domain >> /etc/hosts
echo $IP'140 scm-01'$domain >> /etc/hosts
echo $IP'150 log-01'$domain >> /etc/hosts
