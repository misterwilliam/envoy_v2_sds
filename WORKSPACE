http_archive(
    name = "com_google_protobuf",
    strip_prefix = "protobuf-master",
    urls = ["https://github.com/google/protobuf/archive/master.zip"],
)

git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    commit = "6c89b6aa2277e2dd063ecc06717a09fe1b107f82",  # 2 Jan 2018
)
load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains()

git_repository(
   name = "envoy_api",
   remote = "https://github.com/envoyproxy/data-plane-api.git",
   commit = "0c6e4875425696720d9dffde81a8c443bb7cc766",  # 29 Dec 2017
)

git_repository(
  name = "com_github_misterwilliam_bazel_grpc",
  remote = "https://github.com/misterwilliam/bazel_grpc.git",
  commit = "0bfd13666376c71094f5e678aee76e6699130f2b",  # 30 Dec 2017
)

PGV_GIT_SHA = "af35f0b0d2cee1178f77329d30252e07047918c3"
git_repository(
   name = "com_lyft_protoc_gen_validate",
   remote = "https://github.com/lyft/protoc-gen-validate.git",
   commit = PGV_GIT_SHA,
)

GOOGLEAPIS_SHA = "5c6df0cd18c6a429eab739fb711c27f6e1393366" # May 14, 2017
new_http_archive(
  name = "googleapis",
  strip_prefix = "googleapis-" + GOOGLEAPIS_SHA,
  url = "https://github.com/googleapis/googleapis/archive/" + GOOGLEAPIS_SHA + ".tar.gz",
  build_file_content = """
load("@com_google_protobuf//:protobuf.bzl", "cc_proto_library", "py_proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

filegroup(
    name = "http_api_protos_src",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "descriptor_go_proto",
    importpath = "github.com/golang/protobuf/protoc-gen-go/descriptor",
    proto = "@com_google_protobuf//:descriptor_proto",
    visibility = ["//visibility:public"],
)

proto_library(
    name = "http_api_protos_proto",
    srcs = [":http_api_protos_src"],
    deps = ["@com_google_protobuf//:descriptor_proto"],
    visibility = ["//visibility:public"],
)
cc_proto_library(
    name = "http_api_protos",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    default_runtime = "@com_google_protobuf//:protobuf",
    protoc = "@com_google_protobuf//:protoc",
    deps = ["@com_google_protobuf//:cc_wkt_protos"],
    visibility = ["//visibility:public"],
)

py_proto_library(
    name = "http_api_protos_py",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    include = ".",
    default_runtime = "@com_google_protobuf//:protobuf_python",
    protoc = "@com_google_protobuf//:protoc",
    visibility = ["//visibility:public"],
    deps = ["@com_google_protobuf//:protobuf_python"],
)

go_proto_library(
    name = "http_api_go_proto",
    importpath = "google.golang.org/genproto/googleapis/api/annotations",
    proto = ":http_api_protos_proto",
    visibility = ["//visibility:public"],
    deps = [
      ":descriptor_go_proto",
    ],
)

filegroup(
     name = "rpc_status_protos_src",
     srcs = [
         "google/rpc/status.proto",
     ],
     visibility = ["//visibility:public"],
)

proto_library(
     name = "rpc_status_protos_lib",
     srcs = [":rpc_status_protos_src"],
     deps = ["@com_google_protobuf//:any_proto"],
     visibility = ["//visibility:public"],
)

cc_proto_library(
     name = "rpc_status_protos",
     srcs = ["google/rpc/status.proto"],
     default_runtime = "@com_google_protobuf//:protobuf",
     protoc = "@com_google_protobuf//:protoc",
     deps = [
         "@com_google_protobuf//:cc_wkt_protos"
     ],
     visibility = ["//visibility:public"],
)

go_proto_library(
    name = "rpc_status_go_proto",
    importpath = "google.golang.org/genproto/googleapis/rpc/status",
    proto = ":rpc_status_protos_lib",
    visibility = ["//visibility:public"],
    deps = [
      "@com_github_golang_protobuf//ptypes/any:go_default_library",
    ],
)

py_proto_library(
     name = "rpc_status_protos_py",
     srcs = [
         "google/rpc/status.proto",
     ],
     include = ".",
     default_runtime = "@com_google_protobuf//:protobuf_python",
     protoc = "@com_google_protobuf//:protoc",
     visibility = ["//visibility:public"],
     deps = ["@com_google_protobuf//:protobuf_python"],
)
        """,
)
