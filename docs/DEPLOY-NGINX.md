# Barn Server — nginx Dev Setup

The barn server runs nginx and serves the built static site directly from `dist/`.

---

## One-time nginx setup

Run these commands once on the barn server (requires sudo):

```bash
# Copy the nginx config into place
sudo cp /home/billyb/workspaces/saltydawg/deploy/barn-nginx.conf \
        /etc/nginx/sites-available/saltydawg.barn.workshop.home

# Enable the site
sudo ln -sf /etc/nginx/sites-available/saltydawg.barn.workshop.home \
            /etc/nginx/sites-enabled/saltydawg.barn.workshop.home

# Test config is valid
sudo nginx -t

# Reload nginx (zero-downtime)
sudo nginx -s reload
```

After this, `http://saltydawg.barn.workshop.home` will serve the built `dist/` folder.

> **Make sure your local `/etc/hosts` or LAN DNS has `saltydawg.barn.workshop.home` pointing to the barn server IP.**

---

## Build for the first time

```bash
cd /home/billyb/workspaces/saltydawg
bash deploy/barn-dev.sh
```

This will:
1. Pull latest from GitHub (if remote is set)
2. Run `npm ci`
3. Run `npm run build`
4. Confirm `dist/index.html` exists

nginx immediately serves the new build — no restart needed.

---

## Updating the dev site

```bash
cd /home/billyb/workspaces/saltydawg
bash deploy/barn-dev.sh
```

Or manually:

```bash
git pull origin main
npm ci
npm run build
```

nginx picks up the new files in `dist/` instantly — no reload needed for content changes.

---

## Architecture

```
GitHub (main)
    │
    │  git pull
    ▼
/home/billyb/workspaces/saltydawg/    ← project source
    │
    │  npm run build
    ▼
/home/billyb/workspaces/saltydawg/dist/   ← built output
    │
    │  nginx serves
    ▼
http://saltydawg.barn.workshop.home
```

| Item | Value |
|---|---|
| Dev URL | `http://saltydawg.barn.workshop.home` |
| nginx config in repo | `deploy/barn-nginx.conf` |
| nginx config on server | `/etc/nginx/sites-available/saltydawg.barn.workshop.home` |
| Document root | `/home/billyb/workspaces/saltydawg/dist` |
| Dev build script | `bash deploy/barn-dev.sh` |

---

## Troubleshooting

| Problem | Fix |
|---|---|
| Site not found | Confirm `saltydawg.barn.workshop.home` resolves to barn IP in hosts/DNS |
| 403 Forbidden | Check that nginx user can read `/home/billyb/workspaces/saltydawg/dist` |
| 404 on all pages | Run `bash deploy/barn-dev.sh` to build; confirm `dist/index.html` exists |
| Stale build showing | Run `bash deploy/barn-dev.sh` again; hard-refresh browser |
| nginx config errors | Run `sudo nginx -t` and read the error output |
