#!/bin/bash
docker build -t embulk-bq-test .
docker run --rm -it -v $(pwd):/embulk-bq-test embulk-bq-test guess ./googlesheet/export_config.yml.liquid
docker run --rm -it -v $(pwd):/embulk-bq-test embulk-bq-test preview -G ./googlesheet/export_config.yml.liquid
docker run --rm -it \
-v "$(pwd):/embulk-bq-test" \
-v "./client_secret_287216170231-um5bm7kfoqu5cfbnpdutkf0h3tfk61k5.apps.googleusercontent.com.json:/root/client_secret_287216170231-um5bm7kfoqu5cfbnpdutkf0h3tfk61k5.apps.googleusercontent.com.json" \
embulk-bq-test run ./googlesheet/export_config.yml.liquid

# -v /home/$(USER)/.config/gcloud/application_default_credentials.json:/root/.config/gcloud/application_default_credentials.json \