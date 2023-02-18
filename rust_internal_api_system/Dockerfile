FROM rust:1.67.1 as temp_build_container

RUN rustup component add rustfmt

RUN mkdir -p /code/src

WORKDIR /code

COPY ./Cargo.toml /code/Cargo.toml
COPY ./build.rs /code/build.rs
COPY ./src /code/src
COPY ./protocols /code/protocols

#RUN cargo update
RUN cargo build --bin server


FROM rust:1.67.1 as final

COPY --from=temp_build_container /code/target/debug/server /code/server


EXPOSE 40050

#CMD ["cargo", "run", "--bin", "server"]
CMD ["/code/server"]