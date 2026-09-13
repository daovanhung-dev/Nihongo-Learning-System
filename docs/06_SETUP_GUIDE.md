# SETUP GUIDE

## 1. Prerequisites

- Node.js matching `.nvmrc`
- npm
- Git
- Supabase CLI
- a Supabase project
- Gemini API credential

## 2. Frontend

```bash
cd frontend
npm install
# Edit src/environments/environment.ts with your PUBLIC Supabase URL/key
npm start
```

Set only the public Supabase URL and publishable key in Angular. Do not place Gemini or elevated Supabase secrets there.

## 3. Supabase

```bash
supabase login
supabase link --project-ref YOUR_PROJECT_REF
supabase db push
```

For local development:

```bash
supabase start
supabase db reset
```

## 4. Gemini secret

```bash
supabase secrets set GEMINI_API_KEY="YOUR_KEY"
```

Never put this value in Angular or GitHub Pages variables that are shipped to the browser.

## 5. Deploy Edge Functions

Example:

```bash
supabase functions deploy ai-vocab-generate
```

Repeat for the functions needed by the implemented phase.

## 6. GitHub Pages

Push to `main`. The included workflow builds the Angular app and uploads the `dist/nihongo-learning/browser` artifact.

If the repository is a user root Pages repository (`<user>.github.io`) rather than a project repository, adjust the `--base-href` step in the workflow.
