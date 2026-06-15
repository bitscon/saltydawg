# Deploying Salty Dawg II to Plesk

Simple step-by-step guide. No coding required after this is set up once.

---

## A. What you need

- A domain added in Plesk
- Access to the Plesk control panel
- The GitHub repo: `https://github.com/bitscon/saltydawg`

---

## B. Connect Plesk to GitHub

1. Log into Plesk.
2. Open the domain you want to use: **`saltydawg2.net`**.
3. Click **Git** in the domain tools.
4. Click **Add Repository** (or "Connect to Remote Repository").
5. Fill in:
   - **Repository URL:** `https://github.com/bitscon/saltydawg`
   - **Branch:** `main`
   - **Deployment path / Application root:** `httpdocs`
6. Click **OK** / **Save**.

> **Why `httpdocs`?** Plesk will pull the repo into `httpdocs/`. The build script then creates `httpdocs/dist/` which is where the finished website files live.

---

## C. Set the document root

The website is built into a `dist/` folder. Plesk needs to know to serve from there.

1. In Plesk, open the domain.
2. Go to **Hosting Settings** (or **Apache & nginx Settings**).
3. Set **Document root** to:
   ```
   httpdocs/dist
   ```
4. Click **OK**.

---

## D. Add the build command (Additional Deployment Actions)

This tells Plesk to run the build every time it pulls new code.

1. In Plesk, go back to **Git** for the domain.
2. Find the setting called **Additional deployment actions** (sometimes labeled "Post-deployment script").
3. Enter this single command:
   ```
   bash deploy/plesk-deploy.sh
   ```
4. Save.

---

## E. First deployment

1. In Plesk **Git**, click **Deploy now** (or "Pull & Deploy").
2. Watch the log — it should show:
   ```
   [OK]  Dependencies installed
   [OK]  Running build...
   [OK]  Build complete
   Deployment SUCCESSFUL
   ```
3. Open your domain in a browser.
4. You should see the Salty Dawg II website.

### If you see a 404 or directory listing
- Check that **Document root** is set to `httpdocs/dist` (not `httpdocs`).

### If the log says "npm not found"
- In Plesk, go to the domain → **Node.js** → Enable Node.js.
- Then re-run the deployment.

---

## F. Updating the site

Every time you push a new commit to GitHub:

- **If auto-deploy is on:** Plesk picks it up automatically (within a few minutes).
- **If auto-deploy is off:** Go to Plesk → Git → click **Deploy now**.

That's it. No SSH required.

---

## G. Troubleshooting

| Problem | Fix |
|---|---|
| `npm not found` | Enable Node.js in Plesk for this domain, then re-deploy |
| Build fails / red output | Read the Plesk deploy log for the exact error and paste it into support |
| `dist/` folder missing after build | Build failed — check the log |
| Site shows raw files or file listing | Document root is wrong — set it to `httpdocs/dist` |
| Images not showing | Copy images into `public/assets/` per `public/assets/ASSET-MANIFEST.md`, commit, push |
| Old version still showing | Clear Plesk cache; hard-refresh browser (Ctrl+Shift+R) |
| Page loads but styles look wrong | Same — clear browser cache |

---

## H. Key paths reference

| What | Path |
|---|---|
| GitHub repo | `https://github.com/bitscon/saltydawg` |
| Branch | `main` |
| Plesk app root | `httpdocs` |
| Plesk document root | `httpdocs/dist` |
| Deploy script | `deploy/plesk-deploy.sh` |
| Editable content | `src/data/site.ts` |
| Images folder | `public/assets/` |
| Image guide | `public/assets/ASSET-MANIFEST.md` |
| Owner action items | `TODO-confirmations.md` |
