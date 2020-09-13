# Emby server infrastructure

## Included services

- Emby
- Sonarr
- Radarr
- Bazarr
- Jackett
- Transmission
- Netdata
- nginx-proxy
- letsencrypt-nginx-proxy-companion

## Local testing

- create .env file with required envs

```
EMBY_HOST=emby.localhost
SONARR_HOST=sonarr.localhost
RADARR_HOST=radarr.localhost
BAZARR_HOST=bazarr.localhost
JACKETT_HOST=jackett.localhost
NETDATA_HOST=netdata.localhost
TRANSMISSION_HOST=transmission.localhost
TRANSMISSION_USER=test
TRANSMISSION_PASS=test
LETSENCRYPT_EMAIL=test@test.test
```

- start project

```
docker-compose up -d
```

- services will be available at http://_service_.localhost
