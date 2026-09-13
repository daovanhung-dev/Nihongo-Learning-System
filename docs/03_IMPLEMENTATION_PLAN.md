# IMPLEMENTATION PLAN — NIHONGO LEARNING SYSTEM

## 0. Delivery strategy

Build vertically, not by creating all database tables first and all UI later. Each phase must end with a usable slice that is testable in the browser.

Global Definition of Done for every feature:

1. route exists;
2. layout matches Stitch reference;
3. mobile + desktop states work;
4. loading/empty/error states exist;
5. Supabase access is behind a repository/service;
6. RLS is verified;
7. deterministic rules have unit tests;
8. AI output is schema validated when applicable;
9. keyboard and visible focus states are supported;
10. no API secret exists in frontend code.

---

# PHASE 0 — REPOSITORY + PLATFORM FOUNDATION

## Goal

Get a secure deployable shell online before feature work.

## Tasks

### 0.1 Toolchain

- Install Node from `.nvmrc`.
- `npm install` under `frontend/`.
- Verify Angular build.
- Install Supabase CLI separately.
- Initialize/link Supabase project.

### 0.2 Environment

- Copy `environment.local.example.ts` → `environment.local.ts`.
- Add Supabase URL.
- Add Supabase publishable key.
- Configure Gemini key only with Supabase secrets.

### 0.3 Authentication

Implement S01 Login:

- email/password;
- session restoration;
- logout;
- owner allowlist check;
- auth guard;
- unauthorized route handling.

### 0.4 App shell

Implement:

- desktop sidebar;
- top header;
- mobile bottom navigation;
- responsive breakpoints;
- focus mode shell for study pages.

### 0.5 Design tokens

Port `design/stitch/DESIGN.md` to SCSS/CSS variables:

- color tokens;
- typography;
- spacing;
- radius;
- elevation;
- JLPT badges.

### 0.6 CI/CD

- Run type/build checks on PR/push.
- Deploy main branch to GitHub Pages.
- Configure base href for repository pages.

## Screens

- S01
- shared shell for all screens

## Acceptance

```text
login works
protected dashboard route works
main branch deploys to GitHub Pages
no private key in build output
```

---

# PHASE 1 — SHARED JAPANESE UI FOUNDATION

## Goal

Create reusable UI primitives before repeating markup 38 times.

## Components

### JapaneseTextComponent

Supports:

- kanji/kana;
- optional reading;
- optional romaji;
- Vietnamese meaning.

### FuriganaTextComponent

Supports:

```text
ALWAYS
UNKNOWN_ONLY
TAP
OFF
```

Use native `ruby`/`rt` when practical.

### AudioButtonComponent

States:

```text
idle
loading
playing
error
```

### JlptBadgeComponent

N5 → N1.

### MasteryIndicatorComponent

Ring + linear variants.

### StudyProgressComponent

Current/total + progress bar.

### AnswerFeedbackComponent

Correct / wrong / partial.

### AsyncState components

- skeleton;
- empty;
- retryable error.

## Acceptance

Create Story/demo page or component tests showing all variants.

---

# PHASE 2 — KANA VERTICAL SLICE

## Screens

- S03 Kana Home
- S04 Kana Detail
- S05 Kana Practice

## Backend

Tables:

- `kana_characters`
- `kana_progress`
- `review_events`

## Tasks

### 2.1 Seed Kana

Seed complete production Kana set:

- basic Hiragana;
- basic Katakana;
- dakuten;
- handakuten;
- yōon;
- small っ metadata.

### 2.2 Kana Home

- script tabs;
- category filters;
- mastery states;
- due count.

### 2.3 Kana Detail

- character;
- romaji;
- audio;
- stroke asset;
- examples;
- review data.

### 2.4 Kana Practice

Question types:

- kana → sound;
- romaji → kana;
- audio → kana;
- confusion pair.

### 2.5 SRS integration

Implement Repeat / Hard / Okay / Easy.

## Tests

- Kana normalization;
- script handling;
- SRS interval update;
- mastery event creation.

## Acceptance

A new user can learn and review Kana end-to-end.

---

# PHASE 3 — VOCABULARY CORE

## Screens

- S09 Vocabulary Library
- S10 Vocabulary Editor
- S11 Vocabulary Set Detail
- S12 Flashcards

## Backend

- `vocabulary_sets`
- `vocabulary_items`
- `vocabulary_kanji`
- `vocabulary_progress`

## Tasks

### 3.1 Library

- create/open/archive set;
- search;
- JLPT/topic/status filters;
- due counts.

### 3.2 Editor

- metadata;
- editable rows;
- duplicate detection;
- autosave;
- paste/CSV import;
- preview before commit.

Required data:

```text
written_form
reading_kana
meaning_vi
```

### 3.3 Set Detail

- progress groups;
- star;
- edit;
- launch all study modes.

### 3.4 Flashcards

Directions:

- Kanji/Japanese → meaning;
- Japanese → reading;
- meaning → Japanese.

Modes:

- browse;
- basic sorting;
- SRS.

## Acceptance

Create a Japanese set and learn it with flashcards/SRS.

---

# PHASE 4 — QUIZLET-STYLE LEARNING MODES

## Screens

- S13 Learn Setup
- S14 Learn Session
- S15 Write/Recall
- S16 Dictation
- S17 Test Setup
- S18 Test Session
- S19 Test Result
- S20 Match

## Workstream A — Adaptive Learn

Implement stages:

```text
recognition
→ guided recall
→ production
→ context
→ mastery
```

Build priority formula from BD.

## Workstream B — Japanese Smart Grading

Support expected answer types:

```text
KANJI
KANA
ROMAJI
MEANING
ANY_JAPANESE_FORM
```

Implement STRICT / MODERATE / RELAXED.

AI semantic grading only when deterministic result is `UNSURE`.

## Workstream C — Dictation

- audio → kana;
- audio → kanji;
- diff highlighting;
- small っ and long-vowel mistakes.

## Workstream D — Test

- question configuration;
- timer;
- autosave;
- immutable submission;
- result breakdown;
- review wrong items.

## Workstream E — Match

- six pairs per board;
- timer;
- +1 second wrong penalty;
- low mastery weight.

## Acceptance

Vocabulary set supports complete Quizlet-like learning loop.

---

# PHASE 5 — KANJI

## Screens

- S06 Kanji Library
- S07 Kanji Detail
- S08 Kanji Collection

## Backend

- `kanji_characters`
- `kanji_collections`
- `kanji_collection_items`
- `kanji_progress`

## Tasks

- canonical Kanji dataset import pipeline;
- meanings;
- on/kun readings;
- radical;
- stroke count;
- validated stroke asset;
- vocabulary relationships;
- collection management;
- reading/meaning/compound practice;
- SRS/mastery.

## Rule

Never ask Gemini to invent canonical stroke order or override validated reading data.

## Acceptance

User can browse, study, review and test Kanji collections.

---

# PHASE 6 — GRAMMAR + CONJUGATION

## Screens

- S21 Grammar Library
- S22 Grammar Detail
- S23 Conjugation Practice
- S24 Grammar Practice

## Backend

- grammar tables;
- relations;
- conjugation rules;
- grammar progress.

## Tasks

### Grammar lesson model

Each pack requires:

```text
pattern
meaning
formation
usage
context cues
examples
mistakes
related grammar
```

### Conjugation engine

Implement deterministic rules for:

- Ichidan;
- Godan;
- irregular verbs;
- i-adjective;
- na-adjective.

Forms introduced according to target level.

### Practice

- MCQ;
- fill blank;
- particle;
- conjugation;
- error correction;
- sentence reorder;
- translation;
- free production.

## Acceptance

Grammar mistakes are attributable to specific rules and can enter the mistake bank.

---

# PHASE 7 — AI CORE

## Edge Functions

- `ai-vocab-generate`
- `ai-vocab-enrich`
- `ai-kanji-examples`
- `ai-grammar-explain`
- `ai-generate-vocab-practice`
- `ai-generate-kanji-practice`
- `ai-generate-grammar-practice`
- `ai-semantic-grade`

## Required server pipeline

```text
JWT
→ owner check
→ load canonical sources
→ compact context
→ Gemini
→ JSON/schema validation
→ semantic validation
→ persist
→ response
```

## AI quality controls

- prompt versioning;
- source IDs;
- no invented canonical readings;
- deduplication;
- controlled retry;
- latency/usage log.

## Acceptance

No Gemini request originates directly from Angular.

---

# PHASE 8 — COMBINED REVIEW

## Screen

- S25 Combined Review Builder
- S35 Review Queue is introduced here and refined later.

## Inputs

```text
Kana groups
Kanji collections
Vocabulary sets
Grammar packs
Skills
JLPT
Difficulty
Duration
Question count
```

## Tasks

- wizard selection;
- no source duplication;
- coverage constraints;
- generated session snapshot;
- mastery events mapped back to all source entities.

## Acceptance

One practice session can intentionally combine Vocabulary + Kanji + Grammar.

---

# PHASE 9 — LISTENING + READING

## Screens

- S26 Listening
- S29 Reading
- S30 Reading Result

## Listening

- script generation;
- Japanese TTS;
- cache audio;
- dictation/comprehension;
- transcript hidden until submit;
- answer evidence.

## Reading

- JLPT-aware passage generation;
- Furigana policy;
- unknown Kanji popover;
- evidence highlighting;
- vocabulary/grammar extraction.

## Acceptance

Generated content is grounded in selected source knowledge and target level.

---

# PHASE 10 — SPEAKING + WRITING

## Screens

- S27 Speaking Prompt
- S28 Speaking Result
- S31 Writing
- S32 Writing Result

## Speaking

- MediaRecorder;
- local preview;
- private Storage;
- server ownership verification;
- Gemini audio analysis;
- transcript;
- task/grammar/vocabulary/fluency/pronunciation rubric;
- insufficient-audio state.

## Writing

- Japanese IME editor;
- character count;
- target knowledge requirements;
- annotated corrections;
- error categories;
- corrected + natural version.

## Acceptance

Speaking/Writing mistakes create normalized mistake-bank records.

---

# PHASE 11 — AI PRACTICE + AI TUTOR

## Screens

- S33 AI Practice
- S34 AI Tutor

## AI Practice

Support:

- natural-language generation request;
- structured builder;
- history;
- stored source references.

## AI Tutor

Context priority:

```text
current entity
→ selected pack
→ canonical DB
→ progress
→ recent mistakes
→ general model knowledge
```

Action chips:

```text
Quiz me
Add to Review
More examples
Compare
```

## Acceptance

Tutor actions can create real application state, not merely chat text.

---

# PHASE 12 — REVIEW, ANALYTICS, SETTINGS, POLISH

## Screens

- S35 Review Queue
- S36 Progress
- S37 Mistake Bank
- S38 Settings
- finalize S02 Dashboard

## Review Queue

Priority:

```text
overdue weak
→ due today
→ recent lapses
→ target JLPT weaknesses
→ new items
```

## Progress

- streak;
- study time;
- domain mastery;
- JLPT content coverage;
- LSRW trends;
- heatmap.

Never label app coverage as official JLPT pass probability.

## Mistake Bank

Aggregate repeated errors by normalized signature.

## Settings

- target JLPT;
- daily goal;
- pass score;
- new item limits;
- Furigana;
- Romaji;
- audio;
- AI toggles;
- appearance.

## Acceptance

Dashboard recommendations are backed by real review/progress data.

---

# RELEASE GATES

## Security gate

- all user-owned tables have RLS;
- private speaking bucket verified;
- owner allowlist active;
- Gemini secret only on Supabase;
- no service-role key in repository/build.

## Data-quality gate

- canonical Japanese fields validated;
- AI cannot overwrite canonical Kanji readings silently;
- generated questions pass schema and semantic checks.

## UX gate

- S01–S38 implemented;
- mobile and desktop;
- focus mode for active study;
- visible async/error states;
- accessible keyboard focus.

## Testing gate

- grading tests;
- SRS tests;
- conjugation tests;
- RLS tests;
- Edge Function tests;
- critical E2E journeys.

## Deployment gate

- production Angular build succeeds;
- GitHub Pages route refresh works through hash routing;
- Supabase URLs point to production project;
- smoke test login → study → result → review.
