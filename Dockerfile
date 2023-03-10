FROM centos:latest

WORKDIR /opt

COPY target/x86_64-unknown-linux-musl/release/rsx ./

CMD ["./rsx"]
