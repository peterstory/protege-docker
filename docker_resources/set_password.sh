#!/bin/sh
# Set the root password, then start SSH

echo "root:$ROOT_PASSWORD" | chpasswd
supervisorctl start sshd
