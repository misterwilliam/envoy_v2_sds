export GOPATH=~/envoy_v2_sds
export PATH=$PATH:~/protoc/bin:$GOPATH/bin

mkdir -p src/temp
protoc ~/data-plane-api/api/eds.proto -I ~/data-plane-api/api/ --go_out=plugins=grpc:src/eds
go build src/eds.go
