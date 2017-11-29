FROM lyft/envoy:latest
RUN apt-get update
RUN apt-get -q install -y curl \
                          software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get -q install -y python3 python3-pip
RUN python3 --version && pip3 --version
RUN pip3 install -q Flask==0.11.1
run pip3 install -q gunicorn==19.6.0
COPY envoy.yaml envoy.yaml
COPY tcp_service.py tcp_service.py
COPY uds_service.py uds_service.py
COPY start_service.sh start_service.sh
RUN chmod u+x start_service.sh
CMD ./start_service.sh
			  