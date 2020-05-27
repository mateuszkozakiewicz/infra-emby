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

## Travis configuration

Set necessary envs in Travis project Settings:

- SSH_HOST
- EMBY_HOST
- SONARR_HOST
- RADARR_HOST
- BAZARR_HOST
- JACKETT_HOST
- DEFAULT_EMAIL
- NETDATA_HOST
- TRANSMISSION_HOST
- TRANSMISSION_USER
- TRANSMISSION_PASS
- LETSENCRYPT_EMAIL

## Local testing

- export required envs

```
export EMBY_HOST=emby.localhost \
export SONARR_HOST=sonarr.localhost \
export RADARR_HOST=radarr.localhost \
export BAZARR_HOST=bazarr.localhost \
export JACKETT_HOST=jackett.localhost \
export NETDATA_HOST=netdata.localhost \
export TRANSMISSION_HOST=transmission.localhost \
export TRANSMISSION_USER=test \
export TRANSMISSION_PASS=test \
export LETSENCRYPT_EMAIL=test@test.test
```

- prepare.env files

```
for i in $(find "./env" -type f -name '*.env.template'); do envsubst < "$i" > "${i%.template}"; mv "${i%.template}" .; done
```

- start project

```
docker-compose up -d
```

- services will be available at http://*service*.localhost
