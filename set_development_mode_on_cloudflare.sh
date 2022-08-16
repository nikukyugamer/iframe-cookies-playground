#!/bin/bash -xe

# Zone ID を取得する
# curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=${CLOUDFLARE_DOMAIN}&status=active&page=1&per_page=20&order=status&direction=desc&match=all" \
# -H "X-Auth-Email: ${CLOUDFLARE_EMAIL}" \
# -H "X-Auth-Key: ${CLOUDFLARE_AUTH_KEY}" \
# -H "Content-Type: application/json" | jq '.result[0].id'

# キャッシュの「開発モード」の現状を取得する
# curl -X GET "https://api.cloudflare.com/client/v4/zones/${CLOUDFLARE_ZONE_ID}/settings/development_mode" \
# -H "X-Auth-Email: ${CLOUDFLARE_EMAIL}" \
# -H "X-Auth-Key: ${CLOUDFLARE_AUTH_KEY}" \
# -H "Content-Type: application/json"

# キャッシュの「開発モード」を "on" にセットする
curl -X PATCH "https://api.cloudflare.com/client/v4/zones/${CLOUDFLARE_ZONE_ID}/settings/development_mode" \
-H "X-Auth-Email: ${CLOUDFLARE_EMAIL}" \
-H "X-Auth-Key: ${CLOUDFLARE_AUTH_KEY}" \
-H "Content-Type: application/json" \
--data '{"value":"on"}'

exit 0
