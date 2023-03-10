# rust-cross-compile

demo for rust cross compile between in windows/linux/macOS. tested on macOS/win10/ubuntu/centOS

### macOS -> linux

#### build linux executable

```shell
# 1 add cargo target
rustup target add x86_64-unknown-linux-musl
brew install FiloSottile/musl-cross/musl-cross

# 2 add target in $project/.cargo/config.toml
[target.x86_64-unknown-linux-musl]
linker = "x86_64-linux-musl-gcc"

# 3 build
cargo build --release --target x86_64-unknown-linux-musl
```

#### validate the linux executable with docker

```dockerfile
# $project/Dockerfile
FROM centos:latest
 
WORKDIR /opt
 
COPY target/x86_64-unknown-linux-musl/release/rsx ./
 
CMD ["./rsx"]
```

```shell
docker build -t rsx .
docker run rsx
```

### macOS -> windows

```shell
# 1 add cargo target
rustup target add x86_64-pc-windows-msvc

# 2 add target in $project/.cargo/config.toml
[target.x86_64-pc-windows-msvc]
rustflags = ["-C", "target-feature=+crt-static"]

# 3 build
cargo build --release --target x86_64-pc-windows-msvc
```

### windows -> linux

```shell
# 1 add cargo target
rustup target add x86_64-unknown-linux-musl

# 2 add target in $project/.cargo/config.toml
[target.x86_64-unknown-linux-musl]
linker = "rust-lld"

# 3 build
cargo build --release --target x86_64-unknown-linux-musl

# 4 test with docker
```

[ref:rust-cross/issues/33](https://github.com/japaric/rust-cross/issues/33#issuecomment-500111581)

### linux -> windows

```shell
# 1 add target and toolchain
rustup target add x86_64-pc-windows-gnu

# 2 fix error: linker `x86_64-w64-mingw32-gcc` not found
sudo apt install mingw-w64

# no need anything in $project/.cargo/config.toml
# 3 build
cargo build --release --target x86_64-pc-windows-gnu
```

### windows / linux -> macOS

[use cross?](https://github.com/cross-rs/cross)
