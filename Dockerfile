FROM rust:alpine

LABEL maintainer="@steynovich"

RUN apk add --no-cache musl-dev && \
    cargo install cfn-guard

COPY rules/ /opt/rules/
COPY tests/ /opt/tests/

ENTRYPOINT [ "/usr/local/cargo/bin/cfn-guard" ]
