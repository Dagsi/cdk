FROM alpine:latest

# set the time zone to Beijing Time in the Eastern 8th Time Zone
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

WORKDIR /app

# set build arg for platform
ARG TARGETPLATFORM

# copy all binaries into image
COPY cdk-server-amd64 .
COPY cdk-server-arm64 .

# select binary according to platform
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then cp cdk-server-amd64 cdk-server; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then cp cdk-server-arm64 cdk-server; fi

# copy docs and support files
COPY docs ./docs
COPY support-files ./support-files

EXPOSE 8000

# set entrypoint
ENTRYPOINT ["./cdk-server"]
