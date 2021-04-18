# Emby server infrastructure

## Included services

- [Emby](https://hub.docker.com/r/emby/embyserver)
- [Sonarr](https://hub.docker.com/r/linuxserver/sonarr)
- [Radarr](https://hub.docker.com/r/linuxserver/radarr)
- [Bazarr](https://hub.docker.com/r/linuxserver/bazarr)
- [Jackett](https://hub.docker.com/r/linuxserver/jackett)
- [Transmission](https://hub.docker.com/r/linuxserver/transmission)
- [Bitwarden](https://github.com/dani-garcia/bitwarden_rs)
- [Portainer](https://hub.docker.com/r/portainer/portainer)
- [Duplicati](https://hub.docker.com/r/linuxserver/duplicati)
- [watchtower](https://hub.docker.com/r/containrrr/watchtower)
- [logrotate](https://hub.docker.com/r/blacklabelops/logrotate)
- [traefik](https://hub.docker.com/_/traefik)

## Local testing

- create .env file with required envs

```
EMBY_HOST=emby.localhost
SONARR_HOST=sonarr.localhost
RADARR_HOST=radarr.localhost
BAZARR_HOST=bazarr.localhost
JACKETT_HOST=jackett.localhost
PORTAINER_HOST=portainer.localhost
DUPLICATI_HOST=duplicati.localhost
BITWARDEN_HOST=bitwarden.localhost
TRAEFIK_HOST=traefik.localhost
TRANSMISSION_HOST=transmission.localhost
TRANSMISSION_USER=test
TRANSMISSION_PASS=$$2y$10$$xwrkkQOHrGy513J7MQj/QuA5KmEmC6NxenaaU.cNVBKiJpV8DCtjC
LETSENCRYPT_EMAIL=test@test.test
WATCHTOWER_HOOK_URL=
TRAEFIK_PILOT_TOKEN=
CF_DNS_API_TOKEN=
```

- start project

```
docker-compose up -d
```

- services will be available at http://_service_.localhost
