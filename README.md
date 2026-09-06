# Petit Caillou

This repository brings together both parts of the project:

- `petit-caillou-web`: the React web application
- `petit-caillou-service`: the application service

## Clone the repository

Clone the shared repository and both submodules in one command:

```bash
git clone --recurse-submodules https://github.com/leopoldchj/petit-caillou.git
cd petit-caillou
```

If the repository was cloned without `--recurse-submodules`, initialize the
submodules afterwards:

```bash
git submodule update --init --recursive
```

## Update the repository

Pull the shared repository and check out the exact submodule revisions it
references:

```bash
git pull --recurse-submodules
git submodule update --init --recursive
```

To intentionally update every submodule to the latest commit from its remote
tracking branch, use:

```bash
git submodule update --remote --recursive
```

## Run with Docker (recommended)

The whole stack — database, service, and web application — runs in containers.
The only requirement is Docker.

```bash
docker compose up --build
```

(or `npm run docker:up`). Once the containers are healthy:

- Web application: `http://localhost:5173`
- Service API: `http://localhost:8080`

The web container serves the built app and reverse-proxies `/api` to the
service, so both share a single origin (no CORS). The database is a MariaDB
container; Flyway creates the schema on first start. Stop everything with
`docker compose down` (or `npm run docker:down`).

## Run locally (host toolchain)

Useful for hot reload during development. Requires **JDK 21**, **Node**, and
**Docker** (for the database only).

```bash
cp .env.example .env   # localhost defaults
npm install            # root tooling (concurrently, dotenv-cli)
npm run setup          # install web dependencies
npm run dev:local      # MariaDB container + service + web, all together
```

- `npm run dev` runs the service and web app against the database configured in
  `.env` (without starting the local container).
- `npm run db:up` / `npm run db:down` manage the local MariaDB container.

The `npm run build`, `npm run lint`, and `npm run preview` commands are also
forwarded to the web project.
