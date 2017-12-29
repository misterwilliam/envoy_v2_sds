# Usage

## Clone code
```Shell
$ git clone https://github.com/misterwilliam/envoy_v2_sds.git
$ git clone https://github.com/envoyproxy/data-plane-api.git
```

## Install bazel
```Shell
$ sudo apt-get install openjdk-8-jdk
$ echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
$ curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
$ sudo apt-get update && sudo apt-get install bazel
$ sudo apt-get upgrade bazel
```

## Install go
```Shell
$ sudo apt-get update
$ sudo apt-get install golang-go
```

## Install grpc
```Shell
$ go get -u google.golang.org/grpc
```

## Install proto v3
```Shell
$ mkdir protoc
$ cd protoc
$ wget https://github.com/google/protobuf/releases/download/v3.5.0/protoc-3.5.0-linux-x86_64.zip
$ unzip protoc-3.5.0-linux-x86_64.zip
$ cd ..
```

## Install go proto compiler
```Shell
$ go get -u github.com/golang/protobuf/protoc-gen-go
```

```Shell
$ docker build -t staticv2 .
$ docker run -p 8080:10000 staticv2
```

## Witness the fitness
```Shell
curl localhost:8080/tcp
curl localhost:8080/uds
```
