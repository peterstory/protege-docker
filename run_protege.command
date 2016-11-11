#!/bin/bash

# Start the Docker container
cd "$( dirname "${BASH_SOURCE[0]}" )"
docker-compose up -d

# SSH with X11 forwarding
login_failed() {
  ssh -X -p 2222 root@localhost /Protege-5.0.0/run.sh
  [ "$?" != "0" ]
  return $?
}

while login_failed ; do
  echo "Retrying login in 1 second..."
  sleep 1
done
