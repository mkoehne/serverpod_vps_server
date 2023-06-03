# Serverpod VPS Server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

Update Serverpod code.
```sh
serverpod generate 
```

Watch Serverpod updates.
```sh
serverpod generate --watch
```

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.
```sh
docker compose up --build --detach
```

Then you can start the Serverpod server.
```sh
dart bin/main.dart
```
When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.
```sh
docker compose stop
```

Create Dockerfile
```sh
docker build -t vps-server .  
```

Run Dockerfile
```sh
docker run -it --rm -p 8080-8082:8080-8082 --name vps-server vps-server 
```