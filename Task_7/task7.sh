USERNAME="apiuser"
LOGS_DIR="/home/logs"

sudo chown "$USERNAME:$USERNAME" "$LOGS_DIR"

sudo setfacl -m d:u:$USERNAME:rw "$LOGS_DIR"
sudo setfacl -m d:g:$USERNAME:rw "$LOGS_DIR"

getfacl "$LOGS_DIR"
