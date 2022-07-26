FROM openjdk:8

ENV DIGDAG_VERSION=0.9.35

ENV PROJECT_NAME embulk-bq-test
# USER ${PROJECT_NAME}
USER root
WORKDIR /${PROJECT_NAME}

# パッケージ管理システムのアップデート
RUN apt-get -y update && apt-get -y upgrade

# localeの設定
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# timezone (Asia/Tokyo)の設定
ENV TZ JST-9

# vim以外にも使いそうなもの一応インストール
RUN apt-get install -y vim git zip unzip less wget

# MySQLコンテナ接続確認するときのためにMySQL-clientをインストール
# RUN apt-get install -y default-mysql-client

# embulkをインストール(https://www.embulk.org/)
# RUN curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"
# RUN chmod +x ~/.embulk/bin/embulk
# RUN echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc
# RUN . ~/.bashrc

RUN curl -o /usr/local/bin/embulk --create-dirs -L "https://dl.embulk.org/embulk-latest.jar" && \
    chmod +x /usr/local/bin/embulk

# install digdag
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-${DIGDAG_VERSION}" && \
    chmod +x /usr/local/bin/digdag && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
    adduser --shell /sbin/nologin --disabled-password --gecos "" digdag

ENV PATH=${PATH}:/usr/local/bin



# MySQL取得とBigQuery投入用のプラグインを入れておく
# RUN embulk gem install google-cloud-core -v 1.3.0
RUN embulk gem install jwt:2.3.0
# RUN ~/.embulk/bin/embulk gem install embulk-input-mysql
# RUN ~/.embulk/bin/embulk gem install embulk-output-bigquery
RUN embulk gem install embulk-input-gcs
RUN embulk gem install embulk-output-bigquery
# RUN /usr/local/bin/embulk gem install embulk-input-mysql && embulk gem install embulk-output-bigquery
RUN embulk gem install jwt:2.2.0
RUN embulk gem install embulk-input-google_spreadsheets

# COPY googlesheet secrets.sh  .

# WORKDIR /root

# ENTRYPOINT ["java", "-jar", "/usr/local/bin/embulk"]
# CMD ["./hello.sh"]
