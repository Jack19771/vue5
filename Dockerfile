# Używamy Ubuntu jako bazowego obrazu
FROM ubuntu:22.04

# Tworzenie katalogu dla Yggdrasil
RUN mkdir -p /var/run/yggdrasil && chmod 777 /var/run/yggdrasil

# Instalacja wymaganych pakietów
RUN apt update && apt install -y \
    curl \
    supervisor \
    socat \
    dirmngr \
    apt-transport-https \
    iputils-ping \
    dnsutils \
    net-tools \
    iproute2 \
    nmap \
    tcpdump \
    traceroute \
    gnupg2 \
    lsb-release \
    ca-certificates \
    wget \
    nginx \
    unzip \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install fastapi uvicorn

# Pobranie i dodanie klucza repozytorium Yggdrasil
RUN mkdir -p /usr/local/apt-keys \
    && gpg --fetch-keys https://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/key.txt \
    && gpg --export BC1BF63BD10B8F1A | tee /usr/local/apt-keys/yggdrasil-keyring.gpg > /dev/null

# Dodanie repozytorium Yggdrasil do APT
RUN echo 'deb [signed-by=/usr/local/apt-keys/yggdrasil-keyring.gpg] http://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/ debian yggdrasil' \
    | tee /etc/apt/sources.list.d/yggdrasil.list \
    && apt update \
    && apt install -y yggdrasil \
    && rm -rf /var/lib/apt/lists/*

# Instalacja IPFS (go-ipfs)
RUN wget https://dist.ipfs.tech/kubo/v0.22.0/kubo_v0.22.0_linux-amd64.tar.gz && \
    tar -xvzf kubo_v0.22.0_linux-amd64.tar.gz && \
    mv kubo/ipfs /usr/local/bin/ipfs && \
    rm -rf kubo_v0.22.0_linux-amd64.tar.gz kubo

# Inicjalizacja IPFS
RUN ipfs init

# Ustawienie API IPFS na 0.0.0.0, aby było dostępne z zewnątrz
RUN ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001

# Zezwolenie na CORS dla przeglądarek
RUN ipfs config --json API.HTTPHeaders '{"Access-Control-Allow-Origin": ["*"], "Access-Control-Allow-Methods": ["PUT", "POST", "GET", "OPTIONS"], "Access-Control-Allow-Headers": ["Authorization", "Content-Type"]}'

# Restart demona IPFS, aby zastosować zmiany
RUN ipfs shutdown || true && ipfs daemon --init & sleep 5

# Skopiowanie plików konfiguracyjnych
COPY yggdrasil.conf /etc/yggdrasil.conf
COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY html/ /var/www/html/
COPY app/app.py /app/app.py


# Otwieramy porty
EXPOSE 80 4001 5001 8080 8000 3000

# Uruchamianie usług przez supervisora
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
