# docker build --tag yingshaoxo/weloveparty_golang_user_storage_system . --no-cache

FROM golang:1.18-bullseye as go_builder 
COPY ./ /work_space/server
WORKDIR /work_space/server
RUN bash build.sh


FROM ubuntu:focal
COPY --from=go_builder /work_space/server/binary/golang_user_storage_system_linux_amd64 /bin/golang_user_storage_system

WORKDIR /bin
RUN mkdir -p /data

EXPOSE 40053

CMD ["/bin/golang_user_storage_system", "/data"]