package main

import (
  "flag"
  "fmt"
	"net"
	"log"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
//  _ "github.com/envoyproxy/data-plane-api/api/eds"
  _ "github.com/misterwilliam/bazel_grpc/parent"
  pb "github.com/misterwilliam/envoy_v2_sds/temp"
)

var (
    port = flag.Int("port", 10000, "Server port")
)

type tempServer struct {
}

func(s *tempServer) Hi(ctx context.Context, req *pb.HiReq) (*pb.HiResp, error) {
	return &pb.HiResp{}, nil
}

func (s *tempServer) FetchEndpoints(ctx context.Context) {
}

func newServer() *tempServer {
	s := new(tempServer)
	return s
}

func main() {
	flag.Parse()
	lis, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", *port))
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}
	var opts []grpc.ServerOption
	srv := grpc.NewServer(opts...)
	pb.RegisterTempServer(srv, newServer())
	srv.Serve(lis)
}
