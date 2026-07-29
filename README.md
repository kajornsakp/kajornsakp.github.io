# kajornsakp_portfolio (retired)

> **This is no longer the live site.** As of 2026-07-29, www.kajornsakp.dev is served
> from Cloudflare Workers by a headless-CMS setup:
>
> | Repo | Role |
> |---|---|
> | `kajornsakp-web` | Astro frontend, SSR on Cloudflare Workers → www.kajornsakp.dev |
> | `kajornsakp-cms` | SonicJS headless CMS (Workers + D1 + R2) → cms.kajornsakp.dev |
>
> This Flutter web app is kept as a **rollback target**. GitHub Pages still builds and
> serves it, so reverting is a single DNS change: point the `www` record back at
> `kajornsakp.github.io`.
>
> Content (bio, skills, experience, speaking, education, social links, posts) now lives
> in the CMS. The values that were hardcoded in `lib/models/profile_data.dart` and
> `lib/config/constants.dart` were transcribed into it verbatim — edit them there, not
> here.
>
> **Note:** `.github/workflows/flutter_deploy.yml` still deploys on every push to
> `master`. That's intentional while this is the rollback target; disable the trigger
> once you're confident you won't need it.

---

A Flutter web portfolio using [`sketchy_design_lang`](https://pub.dev/packages/sketchy_design_lang)
for a hand-drawn aesthetic. Blog posts were fetched client-side from the Medium RSS
feed via `api.rss2json.com`.

## Getting Started

```bash
flutter pub get
flutter run -d chrome
```

Build for web:

```bash
flutter build web --release --wasm
```
