#! usr/bin/bash
remote_server=$1   #connection
password=$2        #password

if [ ! -f ~/.ssh/id_rsa ]; then #if we have not ssh key we will be generate 
  ssh-keygen -t rsa -b 4096 -N "$password" -f ~/.ssh/id_rsa
fi

sshpass -p "$password" ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no $remote_server # setup passwordless connection between remote and local server
sshpass ssh -o StrictHostKeyChecking=no $remote_server "chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys" # setup permissions
ssh $remote_server # connecte



