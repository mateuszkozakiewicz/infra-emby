# Emby server infrastructure

## Included services

- [Emby](https://hub.docker.com/r/emby/embyserver)
- [Sonarr](https://hub.docker.com/r/linuxserver/sonarr)
- [Radarr](https://hub.docker.com/r/linuxserver/radarr)
- [Bazarr](https://hub.docker.com/r/linuxserver/bazarr)
- [Jackett](https://hub.docker.com/r/linuxserver/jackett)
- [Transmission](https://hub.docker.com/r/linuxserver/transmission)
- [Bitwarden](https://github.com/dani-garcia/bitwarden_rs)
- [Netdata](https://hub.docker.com/r/netdata/netdata)
- [Duplicati](https://hub.docker.com/r/linuxserver/duplicati)
- [watchtower](https://hub.docker.com/r/containrrr/watchtower)
- [nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy)
- [letsencrypt-nginx-proxy-companion](https://hub.docker.com/r/jrcs/letsencrypt-nginx-proxy-companion)

## Local testing

- create .env file with required envs

```
EMBY_HOST=emby.localhost
SONARR_HOST=sonarr.localhost
RADARR_HOST=radarr.localhost
BAZARR_HOST=bazarr.localhost
JACKETT_HOST=jackett.localhost
NETDATA_HOST=netdata.localhost
DUPLICATI_HOST=duplicati.local
BITWARDEN_HOST=bitwarden.local
TRANSMISSION_HOST=transmission.localhost
TRANSMISSION_USER=test
TRANSMISSION_PASS=test
LETSENCRYPT_EMAIL=test@test.test
WATCHTOWER_HOOK_URL=
```

- start project

```
docker-compose up -d
```

- services will be available at http://_service_.localhost
