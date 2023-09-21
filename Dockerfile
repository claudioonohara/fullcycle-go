FROM golang AS builder

WORKDIR /usr/src/app

RUN go mod init example/message
COPY message.go .
RUN go build

FROM scratch

COPY --from=builder /usr/src/app .

ENTRYPOINT ["./message"]

