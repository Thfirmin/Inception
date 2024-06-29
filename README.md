# Mandatory

# Bonus

## Redis

> Proxy server used as a cache manager

__To Test__:

enter in `redis` container and use:
```bash
redis-cli monitor
```

or

```bash
redis-cli
ping
```

## FTP

> Server file transfer manager

__To Test__:

install filezilla:

```bash
apt update && apt install filezilla -y
```

and insert the following setting:

```txt
Host: <login>.42.fr
Username: <FTP_USR>
Password: <FTP_PWD>
Port: 21
```

## Static Website

> A static website that doesn't use php like wordpress

__To Test__:

Access `http://thfirmin.42.fr` or `thfirmin.42.fr:80`

## Adminer

> A database manager web interface

__To Test__:

Access `localhost:8080`, and insert your account:

```txt
System: MySQL
Server: mariadb:3306
Username: <DB_USER>
Password: <DB_PASS>
Database: <DB_NAME> (Optional)
```

## Optional (Portainer)

> Docker's container manager

__To Test__:

Access `https://thfirmin.42.fr:9443`

create your account and acces your docker's container in `local` section   
