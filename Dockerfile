FROM rust:alpine

LABEL maintainer="@steynovich"

RUN apk add --no-cache musl-dev && \
    cargo install cfn-guard

COPY rules/ /opt/rules

ENTRYPOINT [ "/usr/local/cargo/bin/cfn-guard" ]
