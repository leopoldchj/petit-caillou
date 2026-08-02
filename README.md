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

## Run the web application

Install the web project dependencies once:

```bash
npm --prefix petit-caillou-web install
```

Then start the development server from this repository root:

```bash
npm run dev
```

The application is available at `http://localhost:5173`.

The `npm run build`, `npm run lint`, and `npm run preview` commands are also
forwarded to the web project.
