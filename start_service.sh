gunicorn --bind unix://uds.sock uds_service:app &
gunicorn --bind 127.0.0.1:8081 tcp_service:app &
/usr/local/bin/envoy -c envoy.yaml --service-cluster front-proxy --service-node front-node
