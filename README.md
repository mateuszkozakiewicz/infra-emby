# Emby server infrastructure

## Configure pritunl Cloudflare CA

`docker exec -it pritunl bash`

`pritunl set app.server_cert "$(cat /certs/cert.pem)"`

`pritunl set app.server_key "$(cat /certs/cert.key)"`
