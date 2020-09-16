FROM golang:1.13 AS builder

RUN git clone https://github.com/tkashem/graceful.git /go/graceful
WORKDIR /go/graceful
RUN make build

FROM centos:7
COPY --from=builder /go/graceful/_output/bin/loader /bin
COPY --from=builder /go/graceful/_output/bin/graceful-termination /bin

ADD test-a.sh /bin
