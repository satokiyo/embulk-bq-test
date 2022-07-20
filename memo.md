- Cloud Run で Embulk を実行できる環境があるとして、/specific endpoint にパラメータとして config 名渡すと特定の embulk config が、 /all endpoint を叩くと存在する全ての config が実行されるというのを考えているんだけど、

- 最初は /all endpoint 実行してもせいぜい 20min 程度なのでいいと思うんだけど徐々に遅くなってきて&失敗率が上がってきたときに困りそうなので /specific endpoint を叩く Cloud Scheduler を task 分用意するべきか？とはいえ数が増えるたびに Cloud Scheduler のジョブ増やすの？という悩み

embulk guess - 既存の DataGroupETL ツールでは使っている？

- embulk-input-gcs
  https://github.com/embulk/embulk-input-gcs

- embulk-input-google_spreadsheets
  https://github.com/medjed/embulk-input-google_spreadsheets

- embulk-output-bigquery
  https://github.com/embulk/embulk-output-bigquery

```bash
embulk preview -b . user.yml.liquid
```

- CloudRun にデプロイしたら、embulk の AuthMethoed は compute engine or application default にして、Json キーファイルは不要になる？

```bash

sato@LAPTOP-518UVO5T:/media/workspace/study/GCP$ gcloud init
Welcome! This command will take you through the configuration of gcloud.

Settings from your current configuration [study] are:
core:
  account: k.sato.ontology@gmail.com
  disable_usage_reporting: 'False'
  project: study-20220701
eventarc:
  location: us-central1
run:
  platform: managed
  region: us-central1

Pick configuration to use:
 [1] Re-initialize this configuration [study] with new settings
 [2] Create a new configuration
Please enter your numeric choice:  1

Your current configuration has been set to: [study]

You can skip diagnostics next time by using the following flag:
  gcloud init --skip-diagnostics

Network diagnostic detects and fixes local network connection issues.
Checking network connection...done.
Reachability Check passed.
Network diagnostic passed (1/1 checks passed).

Choose the account you would like to use to perform operations for this configuration:
 [1] k.sato.ontology@gmail.com
 [2] Log in with a new account
Please enter your numeric choice:  1

You are logged in as: [k.sato.ontology@gmail.com].

Pick cloud project to use:
 [1] bigquery-test-343301
 [2] ornate-spring-351002
 [3] study-20220720
 [4] swift-stack-354301
 [5] Enter a project ID
 [6] Create a new project
Please enter numeric choice or text value (must exactly match list item):  3

Your current project has been set to: [study-20220720].

Not setting default zone/region (this feature makes it easier to use
[gcloud compute] by setting an appropriate default value for the
--zone and --region flag).
See https://cloud.google.com/compute/docs/gcloud-compute section on how to set
default compute region and zone manually. If you would like [gcloud init] to be
able to do this for you the next time you run it, make sure the
Compute Engine API is enabled for your project on the
https://console.developers.google.com/apis page.

Your Google Cloud SDK is configured and ready to use!

* Commands that require authentication will use k.sato.ontology@gmail.com by default
* Commands will reference project `study-20220720` by default
Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [study]. You can create additional configurations if you work with multiple accounts and/or projects.
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic --help` to learn about advanced features of the SDK like arg files and output formatting
* Run `gcloud cheat-sheet` to see a roster of go-to `gcloud` commands.

```

```
 gcloud auth application-default login --no-launch-browser --scopes "https://www.googleapis.com/auth/drive,https://www.googleapis.com/auth/spreadsheets,https://www.googleapis.com/auth/bigquery,https://www.googleapis.com/auth/devstorage.read_write,https://www.googleapis.com/auth/userinfo.email,https://www.googleapis.com/auth/cloud-platform,openid"

WARNING: The --[no-]launch-browser flags are deprecated and will be removed on June 7th 2022 (Release 389.0.0). Use --no-browser to replace --no-launch-browser.

Go to the following link in your browser:

    https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=764086051850-6qr4p6gpi6hn506pt8ejuq83di341hur.apps.googleusercontent.com&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fspreadsheets+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fbigquery+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdevstorage.read_write+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth&state=FGw018BId9dIVUOWZKQr0kjnLxnIyP&prompt=consent&access_type=offline&code_challenge=4qgF9c5S3DO1QnN75iJ4r-9fca36RmqmH4rgIl_oG4g&code_challenge_method=S256

Enter verification code: 4/1AdQt8qii4dLPe5PEa5JCd912JthT4ZkhFKF1DbE5QB4-EQYhoeet2KxK7go

Credentials saved to file: [/home/sato/.config/gcloud/application_default_credentials.json]

These credentials will be used by any library that requests Application Default Credentials (ADC).

Quota project "study-20220720" was added to ADC which can be used by Google client libraries for billing and quota. Note that some services may still bill the project owning the resource.
```
