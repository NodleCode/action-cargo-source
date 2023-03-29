FROM rust:1.68-bullseye as runtime
ENV DEBIAN_FRONTEND=noninteractive
ARG target=x86_64-unknown-linux-gnu
RUN apt-get update && apt-get install -qy libssl-dev pkg-config binaryen
RUN rustup default nightly-2023-03-01
RUN rustup target add ${target}
RUN rustup target add wasm32-unknown-unknown
RUN rustup component add rust-src --toolchain nightly-2023-03-01-x86_64-unknown-linux-gnu
RUN rustup component add rust-src
RUN cargo install cargo-dylint
RUN cargo install dylint-link
RUN cargo install cargo-contract --force --locked --version 1.5.1
WORKDIR /github/workspace
COPY ./entrypoint.sh /entrypoint.sh
COPY ./versions.sh /usr/local/bin/versions.sh
RUN chmod +x /entrypoint.sh
RUN chmod +x /usr/local/bin/versions.sh
ENTRYPOINT [ "/entrypoint.sh" ]
