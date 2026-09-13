# Nihongo Learning System

Personal Japanese learning platform inspired by Quizlet-style study flows, extended for **Kana, Kanji, Vocabulary, Grammar, Conjugation, LSRW, AI practice, SRS, JLPT organization and personal analytics**.

## Stack

- **Frontend:** Angular + TypeScript + SCSS
- **Backend/BaaS:** Supabase PostgreSQL + Auth + Storage + Edge Functions + RLS
- **AI:** Gemini API through Supabase Edge Functions
- **Hosting:** GitHub Pages
- **Design source:** 38 Stitch AI screens bundled under `design/stitch/`

## Repository map

```text
frontend/            Angular application scaffold
supabase/            DB migrations, seed and Edge Functions
design/stitch/       Original Stitch HTML/PNG references + design system
docs/                Business Design, architecture and implementation plan
scripts/             Local bootstrap and validation helpers
.github/workflows/   CI and GitHub Pages deployment
```

Read these first:

1. `docs/01_BUSINESS_DESIGN.md`
2. `docs/02_PROJECT_STRUCTURE.md`
3. `docs/03_IMPLEMENTATION_PLAN.md`
4. `docs/04_STITCH_SCREEN_MAP.md`
5. `docs/05_ARCHITECTURE.md`
6. `docs/06_SETUP_GUIDE.md`

## Quick start

```bash
./scripts/bootstrap.sh
cd frontend
npm start
```

Create a local environment file from `frontend/src/environments/environment.local.example.ts` and insert only the public Supabase URL + publishable key. **Never put Gemini or Supabase service-role secrets in the Angular source.**

## Design implementation rule

The Stitch HTML is **reference material**, not production Angular code. Implement reusable Angular components and design tokens first, then translate each Stitch screen in the order defined in the implementation plan.

## Lockfile note

This scaffold does not bundle `node_modules`. Run `npm install` once in `frontend/` to generate `package-lock.json`, then commit the lockfile and you may change CI from `npm install` to `npm ci`.
# Nihongo-Learning-System
