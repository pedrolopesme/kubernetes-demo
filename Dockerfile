FROM golang:1.8 as goimage
ENV SRC=/go/src/
RUN mkdir -p /go/src/
WORKDIR /go/src/demo-api
RUN git clone -b master --single-branch https://github.com/pedrolopesme/kubernetes-demo /go/src/demo-api/ \
&& CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
go build -o bin/demo-api

CMD ["bin/demo-api", "run"]