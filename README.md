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
A deployment workflow is included at `.github/workflows/pages.yml`.
1. Open repository **Settings → Pages**.
2. Under **Build and deployment → Source**, choose **GitHub Actions**.
3. Save. The workflow deploys on pushes to `main`; you can monitor it in the **Actions** tab.
4. When the deployment succeeds, open `https://sinnai9.github.io/comet/`.
5. In Supabase **Authentication → URL Configuration**, set the deployed Pages URL as **Site URL** and add it to **Redirect URLs**.

## Database schema
See `supabase/migrations/202610170001_create_comet_tasks.sql`. The live Supabase project already has the task table and per-user RLS policies configured.

## Backups
Export JSON from within the app and store it somewhere private. Do not upload personal backups to this public repository.
