# Barn Server — nginx Dev Setup

The barn server runs nginx and serves the built static site directly from `dist/`.

---

## One-time nginx setup

Run these commands once on the barn server (requires sudo):

```bash
# Copy the nginx config into place
sudo cp /home/billyb/workspaces/saltydawg/deploy/barn-nginx.conf \
        /etc/nginx/sites-available/dev.saltydawg2.net

# Enable the site
sudo ln -sf /etc/nginx/sites-available/dev.saltydawg2.net \
            /etc/nginx/sites-enabled/dev.saltydawg2.net

# Test config is valid
sudo nginx -t

# Reload nginx (zero-downtime)
sudo nginx -s reload
```

After this, `http://dev.saltydawg2.net` will serve the built `dist/` folder.

> **Make sure your local `/etc/hosts` or LAN DNS has `dev.saltydawg2.net` pointing to the barn server IP (or LAN DNS must resolve dev.saltydawg2.net to the barn).**

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
http://dev.saltydawg2.net
```

| Item | Value |
|---|---|
| Dev URL | `http://dev.saltydawg2.net` |
| nginx config in repo | `deploy/barn-nginx.conf` |
| nginx config on server | `/etc/nginx/sites-available/dev.saltydawg2.net` |
| Document root | `/home/billyb/workspaces/saltydawg/dist` |
| Dev build script | `bash deploy/barn-dev.sh` |

---

## Troubleshooting

| Problem | Fix |
|---|---|
| Site not found | Confirm `dev.saltydawg2.net` resolves to barn IP in hosts/DNS |
| 403 Forbidden | Check that nginx user can read `/home/billyb/workspaces/saltydawg/dist` |
| 404 on all pages | Run `bash deploy/barn-dev.sh` to build; confirm `dist/index.html` exists |
| Stale build showing | Run `bash deploy/barn-dev.sh` again; hard-refresh browser |
| nginx config errors | Run `sudo nginx -t` and read the error output |
