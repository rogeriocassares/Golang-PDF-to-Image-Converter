FROM golang:1.19 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o /docker-pdf-to-png

FROM scratch
COPY --from=builder /docker-pdf-to-png /docker-pdf-to-png
CMD ["/docker-pdf-to-png"]
