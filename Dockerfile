FROM golang:1.13-alpine3.12 as build

RUN apk --no-cache add git

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

FROM alpine:3.12

COPY --from=build /go/bin/app /app

ENTRYPOINT ["/app"]
CMD ["--raw"]	# because we don't know what fields exist
