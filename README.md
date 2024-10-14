# simple-server

A image of a simple endpoint that can be deployed to test routing. I built this to quickly deploy and test geo-routing configurations to make sure the right users reach the right services.

It is a Koa based Node JS API that returns some JSON when sent `GET` requests. For example, a `GET` request to `/` will return:

```json
{
  "msg": "Hello world!"
}
```

The response message can be customized so that different servers return different content.

# Usage

You probably want to use the published image which can be used with Docker, e.g.

```
docker run --name simple-server -p 8080:8080 -d ghcr.io/grahamdaw/simple-server:main
```

Optionally you can specify a custom message (via the `MESSAGE` environment variable) or have the server listen on a different port (via the `PORT` environment variable), e.g.

```bash
docker run --name simple-server -e MESSAGE='Hello other world!' -e PORT=3000 -p 3000:3000 -d ghcr.io/grahamdaw/simple-server:main
```

# Development

## Node

The required node and npm versions are defined in the `package.json`.

You can use [Node Version Manager](https://github.com/nvm-sh/nvm) to install the correct version of node specified in `.nvmrc` file in this repository.

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

## Local development

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
docker compose up simple-server -d
```

If you wish to rebuild the container via Docker Compose:

```bash
docker compose build simple-server
```

# Publishing

Images are automatically built and published to [ghcr.io](https://github.com/grahamdaw/simple-server/pkgs/container/simple-server) from every commit on branch `main`.

To pull the latest image from the repository:

```
docker pull ghcr.io/grahamdaw/simple-server:main
```
