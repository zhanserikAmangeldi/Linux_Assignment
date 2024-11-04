#! usr/bin/bash
sudo mkdir -p /home/logs
sudo chown -R zhanserik:zhanserik /home/logs

LOGROTATE_CONF="/etc/logrotate.d/app"

sudo tee $LOGROTATE_CONF > /dev/null <<EOF
/home/logs/app.log {
  size 1M
  rotate 3
  compress
  copytruncate
  postrotate
    echo "Log rotated at \$(date)" >> /home/log_rotate.log
  endscript
}
EOF

sudo logrotate -f $LOGROTATE_CONF
