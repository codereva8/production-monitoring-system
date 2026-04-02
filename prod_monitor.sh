#!/bin/bash

LOGFILE="/home/$USER/monitoring-system/prod.log"
ALERTFILE="/home/$USER/monitoring-system/alerts.log"

SERVICES=("nginx")

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "===== $TIMESTAMP =====" >> $LOGFILE

send_alert() {
  MSG=$1
  echo "$TIMESTAMP ALERT: $MSG" >> $ALERTFILE
}

for SERVICE in "${SERVICES[@]}"
do
  if systemctl is-active --quiet $SERVICE
  then
    echo "$SERVICE is running" >> $LOGFILE
  else
    echo "$SERVICE is DOWN" >> $LOGFILE
    send_alert "$SERVICE is DOWN"

    sudo systemctl start $SERVICE

    if systemctl is-active --quiet $SERVICE
    then
      echo "$SERVICE restarted successfully" >> $LOGFILE
    else
      send_alert "$SERVICE failed to restart"
    fi
  fi
done

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

if [ "$CPU" -gt 70 ]
then
  send_alert "High CPU usage: $CPU%"
fi

MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if (( $(echo "$MEM > 70" | bc -l) ))
then
  send_alert "High Memory usage: $MEM%"
fi

CONTAINERS=$(docker ps -q)

if [ -z "$CONTAINERS" ]
then
  send_alert "No running Docker containers!"
else
  echo "Docker containers running" >> $LOGFILE
fi