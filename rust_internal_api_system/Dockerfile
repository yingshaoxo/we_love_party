# docker build --tag yingshaoxo/weloveparty_internal_api_service . --no-cache



FROM rust:1.67.1 as temp_build_container

RUN rustup component add rustfmt

RUN mkdir -p /code/src

WORKDIR /code

COPY ./Cargo.toml /code/Cargo.toml
COPY ./build.rs /code/build.rs
COPY ./src /code/src
COPY ./protocols /code/protocols

RUN cargo build --bin server --release



FROM ubuntu:jammy

RUN mkdir -p /code
COPY --from=temp_build_container /code/target/release/server /code/server


EXPOSE 40050

#CMD ["cargo", "run", "--bin", "server"]
CMD ["/code/server"]