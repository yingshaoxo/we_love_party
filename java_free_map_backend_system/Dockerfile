# docker build --tag yingshaoxo/weloveparty_free_map_backend_service .
FROM gradle:jdk19 as builder 

COPY ./ /work_space/server
WORKDIR /work_space/server
RUN ./gradlew build

RUN mkdir /the_app
RUN tar -xvf /work_space/server/app/build/distributions/app.tar -C /the_app


FROM gradle:jdk19

COPY --from=builder /the_app/app /the_app
WORKDIR /the_app/bin
EXPOSE 40055

CMD ["/the_app/bin/app"]