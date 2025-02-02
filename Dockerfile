# ----- Build Stage (GCC and Make) -----
FROM alpine:latest AS build

RUN apk update && \
apk add git gcc make alpine-sdk

RUN git clone https://github.com/pmaillot/X32-Behringer /x32
WORKDIR /x32

# Makefile expects a 'build' dir for the output
RUN mkdir build

# Build 'X32' from Makefile
RUN make X32 --debug

# ----- Run Stage -----
FROM alpine:latest AS run

LABEL org.opencontainers.image.source="https://www.github.com/lillian-alicia/x32-emulator-docker/"
LABEL org.opencontainers.image.description="A docker container running Patrick-Gilles Maillot's X-32 Emulator, used for development and testing code for the Behringer X-32 mixing desk."

# Copy built executable from build stage
COPY --from=build /x32/build/X32 /x32-emulator/x32 
WORKDIR /x32-emulator

# Copy start.sh from source
ADD start.sh /x32-emulator/start.sh

# Open Sound Control (OSC) Port for X32
EXPOSE 10023

CMD ["/bin/sh", "start.sh"]
