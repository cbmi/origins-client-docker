# Origins Client

Runs a nginx server that serves up the [Origins Client](https://github.com/cbmi/origins-client/) static files to accomodate it's Single Page Application (SPA) design. This image includes the latest stable version of the client, but can be overwritten with a locally mounted volume.

The nginx configuration comes from the [HTML5 Boilerplate server configs](https://github.com/h5bp/server-configs-nginx) repo.

## Usage

By default it assumes the Origins endpoint is accessible by users at `http://localhost:5000`.

```
docker run -d -p 8080:80 bruth/origins-client
```

Change the Origins endpoint (necessary for boot2docker users):

```
docker run -d -p 8080:80 -e ORIGINS_HOST="http://dockerhost:5000" bruth/origins-client
```

Use a local or custom build of the client:

```
docker run -d -p 8080:80 -v /path/to/files:/usr/share/nginx/html bruth/origins-client
```
