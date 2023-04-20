# simple-server
A image of a simple endpoint that can be deployed to test routing.

# Setup

## Node

The required node and npm versions are defined in the `package.json`.

You can use [Node Version Manager](https://github.com/nvm-sh/nvm), there  to install the correct version of node specified in `.nvmrc` file in this repository.

```bash
nvm use
```

## Environment

The supported environment variables can be defined in a `.env` file. 

You can copy and configure the template [`.env.example`](.env.example) to `.env` to get started.


## direnv

You can install [direnv](https://github.com/direnv/direnv) to load and unload environment variables depending on the current directory. This project contains a [`.envrc`](.envrc) file to automatically set the correct node and environment. 

```bash
direnv allow
```

# Development

`ts-node` can be used to run the project via the following commands:

```bash
npm install
npm run dev
```

# Running the server

## Local Node

The following commands can run the server in the local node installation. Note that this requires the `.env` environment varibles to be set in the shell beforehand. 

```bash
npm ci --omit=dev
npm run build
npm run start
```

## Docker

To build and run the server via Docker:

```bash
docker build -t simple-server .
docker run --name simple-server --env-file .env -p 8080:8080 -d simple-server
```

## Docker Compose

To build and run the server via Docker Compose:

```bash
docker compose up simple-servergs -d
```

If you wish to rebuild the container via Docker Compose:
```bash
docker compose build simple-server
```

# Publishing

Images are automatically built and published to [ghcr.io](https://github.com/grahamdaw/simple-server/pkgs/container/simple-server) from every commit on branch `main`.

To pull the latest image from the repository, use `docker pull ghcr.io/grahamdaw/simple-server:main`.