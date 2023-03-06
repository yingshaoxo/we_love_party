# docker build --tag yingshaoxo/management_system/golang_backend_service --platform=linux/amd64 .

#FROM golang:1.18-bullseye as go_builder 
FROM amd64/golang:1.18 as go_builder 
COPY ./ /work_space/server
WORKDIR /work_space/server
RUN go install github.com/mitchellh/gox@latest
RUN bash build.sh


FROM ubuntu:focal
COPY --from=go_builder /work_space/server/binary/golang_management_backend_service_linux_amd64 /bin/golang_management_backend_service

WORKDIR /bin
RUN mkdir -p /data

EXPOSE 40057

CMD ["/bin/golang_management_backend_service", "/data"]