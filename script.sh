 # Garantindo as chaves
    KEY_PATH='/vagrant/files'
    mkdir -p /root/.ssh
    cp $KEY_PATH/key /root/.ssh/id_rsa
    cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
    cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
    chmod 400 /root/.ssh/id_rsa*
    cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

