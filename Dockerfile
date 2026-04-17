FROM debian:stable-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    procps \
    uuid-runtime \
    openssl \
    ca-certificates \
    wget \
    bash \
    && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/yonggekkk/argosbx/main/argosbx.sh /app/argosbx.sh
RUN chmod +x /app/argosbx.sh

#ENV PORT=3000
EXPOSE 3000

ENTRYPOINT ["/bin/bash", "/app/argosbx.sh"]
