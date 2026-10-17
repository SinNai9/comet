# Comet · 个人星历

A responsive personal work & learning calendar built with HTML/CSS/JavaScript and Supabase.

## Features
- Month / week / day calendar views
- Email/password authentication
- Working and Learning task categories
- Independent priority and completion-result fields
- Optional time and deadline; overdue tasks remain visible
- Search, filters, JSON backup and restore
- Per-user Row Level Security (RLS)
- Responsive starry theme and reduced-motion support

## Supabase
Region: Tokyo (`ap-northeast-1`).
Project URL: `https://utcduvhgeunwooyxfrvk.supabase.co`

The frontend uses a Supabase publishable key only. Never commit service-role keys, database passwords, or personal task backups to this public repository.

## Deploy with GitHub Pages
1. Upload `index.html`, `style.css`, `app.js`, and the `supabase/` folder to the `main` branch.
2. Open repository **Settings → Pages**.
3. Choose **Deploy from a branch**, select `main` and `/(root)`, then save.
4. Open `https://sinnai9.github.io/comet/` after deployment completes.

In Supabase Authentication URL Configuration, set the deployed Pages URL as Site URL and add it to Redirect URLs.

## Database schema
See `supabase/migrations/202610170001_create_comet_tasks.sql`.

## Backups
Export JSON from within the app and store it somewhere private. Do not upload personal backups to this public repository.
