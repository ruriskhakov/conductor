FROM rust:1.59.0-slim as builder
WORKDIR /usr/src/conductor
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
EXPOSE 8000
COPY --from=builder /usr/local/cargo/bin/conductor /usr/local/bin/conductor
CMD ["conductor"]
