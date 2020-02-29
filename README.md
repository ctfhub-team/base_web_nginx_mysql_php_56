# 基础镜像 WEB Nginx Mariadb PHP 5.6

- L: Linux alpine
- N: Nginx
- M: MySQL - Mariadb
- P: PHP 5.6
- PHP MySQL Ext
    + mysql
    + mysqli

## Example

[challenge_gyctf_2020_web_babyphp](https://github.com/ctfhub-team/challenge_gyctf_2020_web_babyphp)

## Usage

### ENV

- FLAG=ctfhub{nginx_mysql_php_56}

You should rewrite flag.sh when you use this image.
The `$FLAG` is not mandatory, but i hope you use it!

### Files

- src 网站源码
    + db.sql **This file should be use in Dockerfile**
    + index.php
    + ...etc
- Dockerfile
- docker-compose.yml

#### db.sql

You should create database and user!

```sql
DROP DATABASE IF EXISTS `ctfhub`;
CREATE DATABASE ctfhub;
GRANT SELECT,INSERT,UPDATE,DELETE on ctfhub.* to ctfhub@'127.0.0.1' identified by 'ctfhub';
GRANT SELECT,INSERT,UPDATE,DELETE on ctfhub.* to ctfhub@localhost identified by 'ctfhub';
use ctfhub;

-- create table...
```

### Dockerfile

```
FROM ctfhub/base_web_nginx_mysql_php_56

COPY src /var/www/html
COPY _files/flag.sh /flag.sh

RUN sh -c 'mysqld_safe &' \
    && sleep 5s \
    && mysql -uroot -proot -e "source /var/www/html/db.sql" \
    && rm -f /var/www/html/db.sql
```

