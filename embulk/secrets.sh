#!/bin/bash

# TreasureData API Key Settings
# export EMBULK_TD_API_KEY='0001/******************************'

# QLife (out TreasureData)
# export EMBULK_TD_OUT_DB="hoge"

# Google API Credentials
export EMBULK_GOOGLE_API_CLIENT_ID="287216170231-um5bm7kfoqu5cfbnpdutkf0h3tfk61k5.apps.googleusercontent.com"
export EMBULK_GOOGLE_API_CLIENT_SECRET="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"
export EMBULK_GOOGLE_API_REFRESH_TOKEN='1/*******************************'
# export EMBULK_SA_CREDENTIAL_JSON_PATH
# export EMBULK_USER_CREDENTIAL_JSON_PATH=/root/.config/gcloud/application_default_credentials.json
# export EMBULK_USER_CREDENTIAL_JSON_PATH=/root/client_secret_287216170231-um5bm7kfoqu5cfbnpdutkf0h3tfk61k5.apps.googleusercontent.com.json
export EMBULK_USER_CREDENTIAL_JSON_PATH=/embulk-bq-test/client_secret_287216170231-um5bm7kfoqu5cfbnpdutkf0h3tfk61k5.apps.googleusercontent.com.json

export EMBULK_OUTPUT_PROJECT=study-20220720
export EMBULK_OUTPUT_DATASET=embulk_bq_test
export EMBULK_OUTPUT_TABLE=table_created


export SPREADSHEETS_URL=https://docs.google.com/spreadsheets/d/1tX3dfIhiyJYlzQ06KPQpkk8MEgdy1KlpKJluBlRMP_M/edit#gid=0
export WORKSHEET_TITLE=spread_table
