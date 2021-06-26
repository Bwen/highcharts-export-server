FROM node:lts-buster-slim

ENV HOME_DIR /home/node/app
WORKDIR $HOME_DIR

RUN apt-get update && apt-get install -y --fix-missing \
    libfontconfig1 \
    xfonts-base \
    xfonts-75dpi \
    xfonts-thai \
    fonts-takao \
    fonts-wqy-microhei \
    ttf-wqy-microhei \
    fonts-wqy-zenhei \
    ttf-wqy-zenhei \
    fonts-tlwg-garuda-ttf \
    fonts-tlwg-kinnari-ttf \
    fonts-tlwg-laksaman-ttf \
    fonts-tlwg-loma-ttf \
    fonts-tlwg-mono-ttf \
    fonts-tlwg-norasi-ttf \
    fonts-tlwg-purisa-ttf \
    fonts-tlwg-sawasdee-ttf \
    fonts-tlwg-typewriter-ttf \
    fonts-tlwg-typist-ttf \
    fonts-tlwg-typo-ttf \
    fonts-tlwg-umpush-ttf  \
    fonts-tlwg-waree-ttf \
    fonts-arabeyes \
    fonts-baekmuk \
    fonts-bpg-georgian \
    fonts-farsiweb \
    fonts-gfs-bodoni-classic \
    fonts-gfs-didot-classic \
    fonts-gfs-neohellenic \
    fonts-kacst \
    fonts-kacst-one \
    fonts-nanum \
    fonts-nanum-coding \
    fonts-nanum-extra \
    fonts-sil-scheherazade \
    imagemagick \
    libmagickwand-dev \
    graphicsmagick \
    libfreetype6-dev \
    libpng-dev \
    unzip \
    bzip2

RUN export OPENSSL_CONF=/etc/ssl/

# NPM BUG TEMP FIX
RUN npm config set unsafe-perm true

ENV NODE_ENV production
ENV HIGHCHARTS_USE_STYLED=NO
ENV HIGHCHARTS_VERSION=latest
ENV ACCEPT_HIGHCHARTS_LICENSE=YES
RUN npm install highcharts-export-server

RUN ln -s /home/node/app/node_modules/highcharts-export-server/bin/cli.js /usr/bin/highcharts

COPY . $HOME_DIR

ENTRYPOINT ["./entrypoint.sh"]
