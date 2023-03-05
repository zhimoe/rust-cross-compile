FROM centos:latest

WORKDIR /opt

COPY target/x86_64-unknown-linux-musl/release/rs-cross-compile ./

CMD ["./rs-cross-compile"]
