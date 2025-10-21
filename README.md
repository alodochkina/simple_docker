# simple_docker

A minimal example showing an Nginx-based Docker image that serves a small FastCGI C app.

## Quick start

Build the image:
```sh
docker build -t simple_docker:web .
```

Run the image directly (maps host port 80 to container port 81; Nginx inside the container listens on 81):
```sh
docker run -d --name simple_web -p 80:81 simple_docker:web
```

Or use Docker Compose:
```sh
docker compose up -d
```

Rebuild with Compose:
```sh
docker compose build
```

## Repository layout

- Dockerfile, old_Dockerfile — image recipes
- docker-compose.yml — orchestration
- nginx/nginx.conf and nginx.conf — server configuration
- hello.c, server/hello.c — FastCGI example C app
- script.sh — entrypoint that starts the FastCGI app and Nginx

## Notes & troubleshooting

- Ensure script.sh is executable when building the image (chmod +x script.sh).
- If Nginx fails to start, check the configured listen port in nginx/nginx.conf and your docker run port mapping.
- If the FastCGI app fails to compile in the image, verify packages and compilation flags in the Dockerfile.
- View container logs:
```sh
docker logs <container>
```
- Enter a running container:
```sh
docker exec -it <container> bash
```

## Useful commands

- Build: docker build -t simple_docker:web .
- Run: docker run -d --name simple_web -p 80:81 simple_docker:web
- Compose up: docker compose up -d
- Rebuild: docker compose build
