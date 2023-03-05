# rs-cross-compile

rust交叉编译的demo

### 从macos编译到linux静态二进制
1. add target toolchain
    ```shell
    rustup target add x86_64-unknown-linux-musl
    brew install FiloSottile/musl-cross/musl-cross
    ```
2. config cargo compile
    ```
    # $project/.cargo/config.toml
    [target.x86_64-unknown-linux-musl]
    linker = "x86_64-linux-musl-gcc"
    ```
3. build
    ```shell
    cargo build --release --target x86_64-unknown-linux-musl
    ```
4. valid with docker 
    ```dockerfile
    FROM centos:latest
    
    WORKDIR /opt
    
    COPY target/x86_64-unknown-linux-musl/release/rs-cross-compile ./
    
    CMD ["./rs-cross-compile"]
    ```
    ```shell
    docker build -t rs .
    docker run rs
    ```
   