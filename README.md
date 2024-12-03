# local-env-flink

## Description

This project uses Docker Compose to spin up a local Flink cluster for development purposes. It is *not* intended
for use in production.

## License

MIT licensed. See [LICENSE.txt](./LICENSE.txt) for more details.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. Add the following entry to your `/etc/hosts` file.

    ```hosts.txt
    # Host mappings for local-env-flink
    127.0.0.1 traefik.localhost
    127.0.0.1 flink.localhost
    ```

2. Start the Docker Compose services: `docker compose up --detach`

3. (Optional) Navigate to the Traefik Dashboard at [http://traefik.localhost](http://traefik.localhost).

4. (Optional) Navigate to the Flink dashboard at [http://flink.localhost](http://flink.localhost).
