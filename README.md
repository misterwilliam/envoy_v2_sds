# Usage
docker build -t staticv2 .
docker run -p 8080:10000 staticv2

## Witness the fitness

curl localhost:8080/tcp
curl localhost:8080/uds