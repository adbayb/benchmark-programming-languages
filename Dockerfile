# Note: Alpine image is not used since several packages (such as NodeJS) 
# use glibc and not musl used by Alpine leading to incompatibility issues
# For more details, see: https://dev.to/asyazwan/moving-away-from-alpine-30n4
FROM debian:stable-slim

RUN apt-get update >/dev/null 2>&1 \
    && apt-get install -y git wget xz-utils >/dev/null 2>&1

# ------ Install language binaries ------
WORKDIR /opt

# C (GCC)
RUN apt-get install -y build-essential >/dev/null 2>&1

# Go
ARG VERSION=1.17.7 \
    OUTPUT=go
RUN mkdir $OUTPUT \
    && wget -q -O - https://go.dev/dl/go$VERSION.linux-amd64.tar.gz \
    | tar -xz --strip 1 -C $OUTPUT
ENV PATH "/opt/${OUTPUT}/bin/:${PATH}"

# Node.js
ARG VERSION=16.14.0 \
    OUTPUT=node
RUN mkdir $OUTPUT \
    && wget -q -O - https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-x64.tar.xz \
    | tar -xJ --strip 1 -C $OUTPUT
ENV PATH "/opt/${OUTPUT}/bin/:${PATH}"

# Rust
ARG VERSION=1.58.1 \
    OUTPUT=rust
ENV CARGO_HOME="/opt/.cargo"\
    PATH="/opt/.cargo/bin:${PATH}"
RUN wget -q -O - https://sh.rustup.rs \
    | sh -s -- -y >/dev/null 2>&1 \
    && rustup install $VERSION >/dev/null 2>&1 \
    && rustup default $VERSION >/dev/null 2>&1

# Zig
ARG VERSION=0.9.1 \
    OUTPUT=zig
RUN mkdir $OUTPUT \
    && wget -q -O - https://ziglang.org/download/$VERSION/zig-linux-x86_64-$VERSION.tar.xz \
    | tar -xJ --strip 1 -C $OUTPUT
ENV PATH "/opt/${OUTPUT}/:${PATH}"

# ------ Benchmark runtime binary ------
ARG VERSION=1.12.0 \
    OUTPUT=hyperfine
RUN mkdir $OUTPUT \
    && wget -q -O - https://github.com/sharkdp/hyperfine/releases/download/v$VERSION/hyperfine-v$VERSION-x86_64-unknown-linux-gnu.tar.gz \
    | tar -xz --strip 1 -C $OUTPUT
ENV PATH "/opt/${OUTPUT}/:${PATH}"

RUN echo "Installed versions:" \
    && echo "------ C         ------" && gcc --version \ 
    && echo "------ Go        ------" && go version \
    && echo "------ Node.js   ------" && node --version \
    && echo "------ Rust      ------" && rustc --version \
    && echo "------ Zig       ------" && zig version

# ------ Copy benchmark cases ------
WORKDIR /cases

COPY . .

# ------ Set container runtime instructions ------
RUN git config user.name "github-actions[bot]" \
    && git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

CMD make all \
    && git add -A \
    && git commit -m "chore(release): benchmark results" \
    && git push origin main
