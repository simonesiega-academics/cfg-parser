FROM rust:slim AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./
COPY src ./src

RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /app

COPY --from=builder /app/target/release/MathSolver /usr/local/bin/mathsolver

ENTRYPOINT ["/usr/local/bin/mathsolver"]
