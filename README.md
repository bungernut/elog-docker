## About
The Dockerfile creates a docker image of an [elog](https://elog.psi.ch/elog/) server built on Debain (stable).  

## Docker image
Pull the Dockerfile from github
```
git clone --recursive https://github.com/bungernut/elog-docker
cd ./elog-docker
```

Edit elog.conf to suit your needs and then build the docker image
```
docker build -t elog .
```

Run the docker image,
```
docker run --name elog -p 8080:8080 -v $PWD/config:/etc/elog/ -v $PWD/elog-banner-css/css:/usr/share/elog/themes/default/banner -v $PWD/logbooks:/var/lib/elog/logbooks elog
```

This forwards port 8080 from the container to [localhost:8080](http://localhost:8080)

## Notes
In the example config, Latex math can be rendered using [MathJax](https://www.mathjax.org/).  This recognises inline math `$ ... $` and numbered equations `\being{equation} ... \end{equation}` in elog entries.

SMTP (email notification) is not tested (and very probably doesn't work).

## Warning
SSL is not supported. Passwords sent over the network are vulnerable to sniffing attacks. It's strongly recommended that you use an SSL-enabled proxy (e.g., Apache or nginx). 

For setting-up, *Self registration = 1*.  It's advisable to set the *Admin user* and disable *Self registration*.  See elog.conf [syntax](https://midas.psi.ch/elog/config.html).
