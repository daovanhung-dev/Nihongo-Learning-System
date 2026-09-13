# PROJECT STRUCTURE

## 1. Objective

The repository is organized so that a coding agent can move from **Business Design → Stitch reference → Angular feature → Supabase domain → test → GitHub Pages** without reorganizing the project.

## 2. Top-level tree

```text
nihongo-learning-system/
├── README.md
├── package.json
├── .env.example
├── .gitignore
├── .editorconfig
├── .nvmrc
│
├── docs/
│   ├── 01_BUSINESS_DESIGN.md
│   ├── 02_PROJECT_STRUCTURE.md
│   ├── 03_IMPLEMENTATION_PLAN.md
│   ├── 04_STITCH_SCREEN_MAP.md
│   ├── 05_ARCHITECTURE.md
│   ├── 06_SETUP_GUIDE.md
│   └── decisions/
│
├── design/
│   └── stitch/
│       ├── DESIGN.md
│       ├── README.md
│       ├── screen-map.json
│       ├── assets/
│       │   ├── logo.svg
│       │   └── logo-preview.png
│       ├── screens/
│       │   ├── S01_login/
│       │   ├── ...
│       │   └── S38_settings/
│       └── source-archives/
│
├── frontend/
│   ├── package.json
│   ├── angular.json
│   ├── tsconfig*.json
│   ├── public/
│   └── src/
│       ├── index.html
│       ├── main.ts
│       ├── styles.scss
│       ├── environments/
│       └── app/
│           ├── core/
│           ├── shared/
│           ├── layout/
│           ├── features/
│           ├── app.component.*
│           ├── app.config.ts
│           └── app.routes.ts
│
├── supabase/
│   ├── config.toml
│   ├── migrations/
│   ├── seed.sql
│   └── functions/
│       ├── _shared/
│       └── ai-*/
│
├── scripts/
│   ├── bootstrap.sh
│   └── validate-project.sh
│
└── .github/
    └── workflows/
        ├── quality.yml
        └── deploy-pages.yml
```

## 3. Frontend rules

### `core/`
Singleton infrastructure only:

- Supabase client
- authentication
- guards
- API helpers
- global configuration
- telemetry

### `shared/`
Reusable presentation building blocks:

- Japanese text / furigana
- JLPT badge
- mastery indicator
- audio button
- study progress bar
- feedback panel
- generic empty/loading/error state

`shared/` must not know feature-specific business rules.

### `features/`
Feature-first folders. One feature may implement multiple Stitch screens.

Example:

```text
features/vocabulary/
├── pages/
│   ├── vocabulary-library/
│   ├── vocabulary-editor/
│   └── vocabulary-set-detail/
├── components/
├── data-access/
├── models/
└── utils/
```

The scaffold initially keeps one screen component per Stitch view so implementation can proceed incrementally. Refactor common behavior into feature components as screens become real.

## 4. Backend rules

### PostgreSQL
Canonical source of truth for:

- Kana
- Kanji
- Vocabulary
- Grammar
- progress/mastery
- study sessions
- review events
- mistake bank

### Edge Functions
Only for server-side operations requiring secrets or trusted execution:

- Gemini generation/evaluation
- AI semantic grading
- speaking/writing evaluation
- AI Tutor

### Deterministic logic
Keep deterministic logic out of AI:

- SRS scheduling
- Japanese normalization
- exact/moderate grading
- conjugation rules
- mastery aggregation
- review queue construction

## 5. Design implementation rule

Every page has a canonical Stitch reference under `design/stitch/screens/Sxx_*`.

Implementation sequence:

```text
screen.png
→ code.html inspection
→ reusable token/component selection
→ Angular implementation
→ responsive states
→ unit/component tests
→ visual comparison
```

Never treat generated Stitch HTML as production architecture.
