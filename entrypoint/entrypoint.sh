#!/bin/bash

secret='"'$(printenv VAULT_SECRETS_PATH)'"'
sed -i '/path/c\  path='"$secret" ./entrypoint/config.hcl
envconsul -config="./entrypoint/config.hcl" node app.js
