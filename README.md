# Emby server infrastructure

## Included services

- [Emby](https://hub.docker.com/r/emby/embyserver)
- [Sonarr](https://hub.docker.com/r/linuxserver/sonarr)
- [Radarr](https://hub.docker.com/r/linuxserver/radarr)
- [Bazarr](https://hub.docker.com/r/linuxserver/bazarr)
- [Jackett](https://hub.docker.com/r/linuxserver/jackett)
- [Prowlarr](https://github.com/Prowlarr/Prowlarr)
- [Transmission](https://hub.docker.com/r/linuxserver/transmission)
- [watchtower](https://hub.docker.com/r/containrrr/watchtower)
- [logrotate](https://hub.docker.com/r/blacklabelops/logrotate)
- [traefik](https://hub.docker.com/_/traefik)
- [oauth2-proxy](https://github.com/oauth2-proxy/oauth2-proxy)

## Local testing

- create .env file with required envs

```
EMBY_HOST=emby.localhost
JELLYFIN_HOST=jellyfin.localhost
SONARR_HOST=sonarr.localhost
RADARR_HOST=radarr.localhost
BAZARR_HOST=bazarr.localhost
JACKETT_HOST=jackett.localhost
PROWLARR_HOST=prowlarr.localhost
TRAEFIK_HOST=traefik.localhost
TRANSMISSION_HOST=transmission.localhost
WHOAMI_HOST=whoami.localhost
AUTH_HOST=auth.localhost
DEFAULT_EMAIL=test@test.test
WATCHTOWER_HOOK_URL=
TRAEFIK_PILOT_TOKEN=
CF_DNS_API_TOKEN=
OAUTH2_CLIENT_ID=
OAUTH2_CLIENT_SECRET=
OAUTH2_COOKIE_SECRET=
```

- start project

```
docker-compose up -d
```

- services will be available at http://_service_.localhost
