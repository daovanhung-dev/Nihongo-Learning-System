# ARCHITECTURE

## Runtime topology

```text
Browser / GitHub Pages
        |
        | Supabase publishable key + user JWT
        v
Supabase
├── Auth
├── PostgreSQL + RLS
├── Storage
└── Edge Functions
        |
        | backend secret
        v
     Gemini API
```

## Trust boundaries

### Browser
Trusted only for presentation and user interaction. Never contains Gemini key or Supabase elevated secret.

### PostgreSQL
Canonical source of truth for learning content, attempts, mastery and mistakes.

### Edge Functions
Trusted server boundary for Gemini, private file evaluation and semantic grading.

## Major frontend layers

```text
Pages
  ↓
Feature components
  ↓
Feature facades/services
  ↓
Repositories / Supabase client
```

Do not call Supabase directly from deeply nested presentational components.

## Learning event architecture

Every meaningful answer creates evidence:

```text
answer
→ grade
→ review_event
→ mastery update
→ due schedule update
→ mistake aggregation
→ future recommendation
```

This event trail is more important than storing only final test scores.

## AI architecture

```text
Angular request
→ Edge Function auth
→ source load
→ prompt contract
→ Gemini structured output
→ schema validation
→ semantic validation
→ persistence
→ response
```

Canonical DB data always wins when AI output conflicts with a stored reading/meaning/reference.
