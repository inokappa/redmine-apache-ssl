## redmine-apache-ssl

### How to use

1. Please modified to suit the generate-certfiles.sh to your environment. 
2. execute generate-certfiles.sh
3. docker build
4. docker run

***

### Modify generate-certfiles.sh

- Change the following

```
 C="JP"
ST="Fukuoka"
 L="Fukuoka"
 O="foo"
OU="bar"
CN="foo.bar.example.com"
```

***

### Execute generate-certfiles.sh

- Generate assets/etc/apache2/ssl/apache.crt, assets/etc/apache2/ssl/apache.key, assets/etc/apache2/ssl/server.der

```sh
$ ./generate-certfiles.sh
```

***

### docker build

```sh
$ docker build -i your_name/image_name .
```

***

### docker run

```sh
$ docker run -d --link ${redmine_name}:${redmine_alias} --name=apache -p 80:80 -p 443:443 your_name/image_name
```
