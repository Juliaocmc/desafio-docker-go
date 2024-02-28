FROM golang:latest AS build-go

WORKDIR /usr/src/app

COPY src .

RUN go build fullcycle.go

FROM  scratch

WORKDIR /usr/src/app

COPY --from=build-go /usr/src/app/fullcycle .

CMD ["./fullcycle"]