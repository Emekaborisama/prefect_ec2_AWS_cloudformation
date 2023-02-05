pip3 install -U prefect supervisor s3fs awscli
Pip3 install -r requirements.txt

# pip3 install pyOpenSSL --upgrade
prefect cloud login -k xxxxxxx

cat <<EOT >> supervisord.conf
[unix_http_server]
file=/tmp/supervisor.sock   ; the path to the socket file

[supervisord]
loglevel=debug               ; log level; default info; others: debug,warn,trace

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///tmp/supervisor.sock ; use a unix:// URL  for a unix socket

[program:prefect-agent]
command=prefect agent start -q dev
EOT



supervisord -c ./supervisord.conf
