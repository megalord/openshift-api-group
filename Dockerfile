FROM golang:1.10

WORKDIR $GOPATH/src/github.com/megalord/openshift-api-group/
COPY glide.yaml glide.lock ./
RUN go get -u github.com/Masterminds/glide && \
    glide install --strip-vendor && glide up 

COPY . .
RUN make build

EXPOSE 8080
CMD ["openshift-api-group"]
