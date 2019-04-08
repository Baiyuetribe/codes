FROM php:7.3.4-zts-alpine3.9 
MAINTAINER azure <https://baiyue.one>

# 鉴于现有版本比较成就，官方更新很多bug，因此定制一份最新版4.4.0
ENV KODEXPLORER_VERSION=4.4.0
ENV KODEXPLORER_URL="https://cloud.baiyue.one/?/Blog_code/kodexplorer4.40.tar.gz"

# base镜像内核升级和程序部署
RUN set -x \
  && mkdir -p /usr/src/kodexplorer \
  && apk --update --no-cache add wget bash \
  && wget -q -O /tmp/kodexplorer.tar.gz "$KODEXPLORER_URL" \
  && tar -xzf /tmp/kodexplorer.tar.gz -C /usr/src/kodexplorer/ --strip-components=1 \
  && rm -rf /tmp/*

# 编译基础环境
RUN set -x \
  && apk add --no-cache --update \
        freetype libpng libjpeg-turbo \
        freetype-dev libpng-dev libjpeg-turbo-dev \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j "$(getconf _NPROCESSORS_ONLN)" gd \
  && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

# 指定工作目录
WORKDIR /var/www/html
# 设置启动项
COPY entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["entrypoint.sh"]
CMD [ "php", "-S", "0000:80", "-t", "/var/www/html" ]


