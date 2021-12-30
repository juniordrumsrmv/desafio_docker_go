FROM golang:alpine AS builder

WORKDIR $GOPATH/src/bianouoliveira/fullcycleapp/

COPY app.go .
RUN go mod init fullcycle
RUN go mod tidy
RUN go build -o /go/app

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app"]