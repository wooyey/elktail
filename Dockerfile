FROM golang

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

ENTRYPOINT ["app"]
CMD ["--raw"]	# because we don't know what fields exist
