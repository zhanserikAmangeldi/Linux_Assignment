#! usr/bin/bash
USERNAME="apiuser"
APP_PATH="/home/zhanserik/DevOps/Linux_Assignment/Task_4"
SERVICE_NAME="testapi.service"

echo "Creating user and group: $USERNAME"
if id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME already exists"
else
  sudo groupadd $USERNAME
  sudo useradd -r -g $USERNAME -s /sbin/nologin -d /nonexistent $USERNAME
  echo "User add group $USERNAME created"
fi
sudo chown -R $USERNAME:$USERNAME $APP_PATH


echo "Creating systemd service file:  /etc/systemd/system/$SERVICE_NAME"
cat << EOL | sudo tee /etc/systemd/system/$SERVICE_NAME > /dev/null
[Unit]
Description=My API Service
After=network.target

[Service]
Type=simple
User=$USERNAME
Group=$USERNAME
WorkingDirectory=/home/zhanserik/DevOps/Linux_Assignment/Task_4
Environment="PATH=/home/zhanserik/DevOps/Linux_Assignment/Task_4/env/bin"
ExecStart=/home/zhanserik/DevOps/Linux_Assignment/Task_4/env/bin/uvicorn main:app --host 0.0.0.0 --port 8080
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOL

echo "Reloading systemd daemon"
sudo systemctl daemon-reload

echo "Enabling the service: $SERVICE_NAME"
sudo systemctl enable $SERVICE_NAME

echo "Start the service: $SERVICE_NAME"
sudo systemctl start $SERVICE_NAME

echo "Checking the staatus of the service: $SERVICE_NAME"


echo "Setup completed succesfully!"
