-- Nihongo Learning System - initial schema
-- User-owned data is protected by RLS. Canonical reference tables are authenticated-read.

create extension if not exists pgcrypto;

create table if not exists public.app_owners (
  user_id uuid primary key references auth.users(id) on delete cascade,
  enabled boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  avatar_url text,
  target_jlpt text check (target_jlpt in ('N5','N4','N3','N2','N1')) default 'N5',
  daily_goal_minutes integer not null default 20 check (daily_goal_minutes > 0),
  default_pass_threshold numeric(5,2) not null default 80,
  furigana_mode text not null default 'UNKNOWN_ONLY',
  romaji_mode text not null default 'BEGINNER_ONLY',
  timezone text not null default 'Asia/Bangkok',
  settings jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.kana_characters (
  id uuid primary key default gen_random_uuid(),
  character text not null unique,
  script_type text not null check (script_type in ('HIRAGANA','KATAKANA')),
  romaji text not null,
  row_name text,
  column_name text,
  category text not null default 'BASIC',
  audio_url text,
  stroke_order_asset text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.kana_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  kana_id uuid not null references public.kana_characters(id) on delete cascade,
  mastery_score numeric(5,2) not null default 0,
  recognition_accuracy numeric(5,2) not null default 0,
  production_accuracy numeric(5,2) not null default 0,
  listening_accuracy numeric(5,2) not null default 0,
  correct_count integer not null default 0,
  wrong_count integer not null default 0,
  confusion_count integer not null default 0,
  last_confused_kana_id uuid references public.kana_characters(id),
  last_reviewed_at timestamptz,
  next_review_at timestamptz,
  interval_days numeric not null default 0,
  stability numeric,
  difficulty numeric,
  last_rating text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(user_id, kana_id)
);

create table if not exists public.kanji_characters (
  id uuid primary key default gen_random_uuid(),
  character text not null unique,
  meanings_vi text[] not null default '{}',
  onyomi text[] not null default '{}',
  kunyomi text[] not null default '{}',
  nanori text[] not null default '{}',
  radical text,
  radical_name text,
  stroke_count integer,
  stroke_order_asset text,
  jlpt_level text check (jlpt_level in ('N5','N4','N3','N2','N1')),
  frequency_rank integer,
  notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.kanji_collections (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  description text,
  jlpt_level text check (jlpt_level in ('N5','N4','N3','N2','N1')),
  tags text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.kanji_collection_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  collection_id uuid not null references public.kanji_collections(id) on delete cascade,
  kanji_id uuid not null references public.kanji_characters(id) on delete cascade,
  sort_order integer not null default 0,
  unique(collection_id, kanji_id)
);

create table if not exists public.kanji_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  kanji_id uuid not null references public.kanji_characters(id) on delete cascade,
  mastery_score numeric(5,2) not null default 0,
  meaning_accuracy numeric(5,2) not null default 0,
  reading_accuracy numeric(5,2) not null default 0,
  compound_accuracy numeric(5,2) not null default 0,
  writing_accuracy numeric(5,2) not null default 0,
  correct_count integer not null default 0,
  wrong_count integer not null default 0,
  last_reviewed_at timestamptz,
  next_review_at timestamptz,
  review_count integer not null default 0,
  lapses integer not null default 0,
  interval_days numeric not null default 0,
  stability numeric,
  difficulty numeric,
  is_starred boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(user_id, kanji_id)
);

create table if not exists public.vocabulary_sets (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  description text,
  jlpt_level text check (jlpt_level in ('N5','N4','N3','N2','N1')),
  topic text,
  tags text[] not null default '{}',
  cover_url text,
  is_archived boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.vocabulary_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  set_id uuid not null references public.vocabulary_sets(id) on delete cascade,
  written_form text not null,
  reading_kana text not null,
  romaji text,
  part_of_speech text,
  meaning_vi text not null,
  meanings jsonb not null default '[]'::jsonb,
  alternative_forms text[] not null default '{}',
  example_ja text,
  example_reading text,
  example_vi text,
  audio_url text,
  image_url text,
  pitch_accent_info jsonb,
  jlpt_level text check (jlpt_level in ('N5','N4','N3','N2','N1')),
  tags text[] not null default '{}',
  notes text,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(user_id, set_id, written_form, reading_kana)
);

create table if not exists public.vocabulary_kanji (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  vocabulary_item_id uuid not null references public.vocabulary_items(id) on delete cascade,
  kanji_id uuid not null references public.kanji_characters(id) on delete cascade,
  position integer,
  unique(vocabulary_item_id, kanji_id, position)
);

create table if not exists public.vocabulary_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  vocabulary_item_id uuid not null references public.vocabulary_items(id) on delete cascade,
  mastery_score numeric(5,2) not null default 0,
  status text not null default 'NEW',
  seen_count integer not null default 0,
  correct_count integer not null default 0,
  wrong_count integer not null default 0,
  first_try_correct_count integer not null default 0,
  reading_correct_count integer not null default 0,
  meaning_correct_count integer not null default 0,
  production_correct_count integer not null default 0,
  dictation_correct_count integer not null default 0,
  context_correct_count integer not null default 0,
  current_streak integer not null default 0,
  best_streak integer not null default 0,
  last_reviewed_at timestamptz,
  next_review_at timestamptz,
  review_count integer not null default 0,
  lapses integer not null default 0,
  interval_days numeric not null default 0,
  stability numeric,
  difficulty numeric,
  last_rating text,
  is_starred boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(user_id, vocabulary_item_id)
);

create table if not exists public.grammar_packs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  pattern text not null,
  meaning_vi text not null,
  summary text,
  description text,
  jlpt_level text check (jlpt_level in ('N5','N4','N3','N2','N1')),
  category text,
  difficulty numeric,
  tags text[] not null default '{}',
  prerequisites uuid[] not null default '{}',
  is_archived boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.grammar_formations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  grammar_pack_id uuid not null references public.grammar_packs(id) on delete cascade,
  label text,
  formation text not null,
  explanation text,
  sort_order integer not null default 0
);

create table if not exists public.grammar_usages (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  grammar_pack_id uuid not null references public.grammar_packs(id) on delete cascade,
  title text not null,
  description text not null,
  context_notes text,
  sort_order integer not null default 0
);

create table if not exists public.grammar_examples (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  grammar_pack_id uuid not null references public.grammar_packs(id) on delete cascade,
  sentence_ja text not null,
  reading text,
  translation_vi text,
  explanation text,
  difficulty numeric,
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists public.grammar_cues (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  grammar_pack_id uuid not null references public.grammar_packs(id) on delete cascade,
  cue text not null,
  category text,
  explanation text,
  example text,
  limitations text
);

create table if not exists public.grammar_mistakes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  grammar_pack_id uuid not null references public.grammar_packs(id) on delete cascade,
  incorrect_ja text not null,
  correct_ja text not null,
  reason_vi text,
  rule_reference text
);

create table if not exists public.grammar_relations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  grammar_id uuid not null references public.grammar_packs(id) on delete cascade,
  related_grammar_id uuid not null references public.grammar_packs(id) on delete cascade,
  relation_type text not null,
  comparison_note text
);

create table if not exists public.grammar_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  grammar_pack_id uuid not null references public.grammar_packs(id) on delete cascade,
  mastery_score numeric(5,2) not null default 0,
  practice_accuracy numeric(5,2) not null default 0,
  test_accuracy numeric(5,2) not null default 0,
  production_accuracy numeric(5,2) not null default 0,
  conjugation_accuracy numeric(5,2) not null default 0,
  correct_count integer not null default 0,
  wrong_count integer not null default 0,
  last_reviewed_at timestamptz,
  next_review_at timestamptz,
  review_count integer not null default 0,
  lapses integer not null default 0,
  is_starred boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(user_id, grammar_pack_id)
);

create table if not exists public.conjugation_rules (
  id uuid primary key default gen_random_uuid(),
  entity_type text not null,
  class text not null,
  target_form text not null,
  rule_json jsonb not null,
  examples jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.study_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  session_type text not null,
  source_config jsonb not null default '{}'::jsonb,
  goal text,
  skill text,
  jlpt_level text,
  difficulty text,
  grading_mode text,
  furigana_mode text,
  status text not null default 'ACTIVE',
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  duration_seconds integer,
  total_questions integer,
  earned_points numeric,
  available_points numeric,
  score numeric(5,2),
  passed boolean,
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists public.ai_generations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  generation_type text not null,
  request_hash text,
  model text,
  prompt_version text,
  input_summary jsonb not null default '{}'::jsonb,
  output jsonb,
  status text not null default 'PENDING',
  latency_ms integer,
  usage jsonb,
  error_code text,
  created_at timestamptz not null default now()
);

create table if not exists public.questions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid references public.study_sessions(id) on delete cascade,
  source_type text,
  source_refs jsonb not null default '[]'::jsonb,
  question_type text not null,
  skill text,
  prompt text not null,
  prompt_reading text,
  options jsonb,
  expected_answer_type text,
  correct_answer jsonb not null,
  explanation text,
  difficulty text,
  jlpt_level text,
  ai_generated boolean not null default false,
  generation_id uuid references public.ai_generations(id),
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.answers (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid not null references public.study_sessions(id) on delete cascade,
  question_id uuid not null references public.questions(id) on delete cascade,
  attempt_no integer not null default 1,
  answer jsonb not null,
  normalized_answer jsonb,
  is_correct boolean,
  is_first_try boolean not null default true,
  score numeric,
  semantic_score numeric,
  form_score numeric,
  grammar_score numeric,
  grader text,
  grading_confidence numeric,
  response_time_ms integer,
  feedback jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.review_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  entity_type text not null,
  entity_id uuid not null,
  session_id uuid references public.study_sessions(id) on delete set null,
  mode text,
  result text,
  weight numeric,
  previous_mastery numeric,
  new_mastery numeric,
  reviewed_at timestamptz not null default now(),
  next_review_at timestamptz,
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists public.combined_review_configs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  kana_group_ids uuid[] not null default '{}',
  kanji_collection_ids uuid[] not null default '{}',
  vocabulary_set_ids uuid[] not null default '{}',
  grammar_pack_ids uuid[] not null default '{}',
  skills text[] not null default '{}',
  jlpt_level text,
  difficulty text,
  question_count integer,
  duration_minutes integer,
  settings jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.listening_attempts (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid references public.study_sessions(id) on delete cascade,
  script_ja text, script_reading text, audio_url text,
  score numeric, dictation_score numeric, comprehension_score numeric,
  feedback jsonb, created_at timestamptz not null default now()
);

create table if not exists public.speaking_attempts (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid references public.study_sessions(id) on delete cascade,
  prompt_ja text, prompt_vi text, audio_url text, transcript_ja text, transcript_reading text,
  duration_seconds integer, task_score numeric, grammar_score numeric, vocabulary_score numeric,
  fluency_score numeric, pronunciation_score numeric, overall_score numeric,
  feedback jsonb, created_at timestamptz not null default now()
);

create table if not exists public.reading_attempts (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid references public.study_sessions(id) on delete cascade,
  passage_ja text, passage_reading text, character_count integer, jlpt_level text,
  score numeric, feedback jsonb, created_at timestamptz not null default now()
);

create table if not exists public.writing_attempts (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid references public.study_sessions(id) on delete cascade,
  prompt text, answer_ja text, character_count integer,
  task_score numeric, grammar_score numeric, vocabulary_score numeric, naturalness_score numeric,
  coherence_score numeric, kanji_kana_score numeric, overall_score numeric,
  feedback jsonb, created_at timestamptz not null default now()
);

create table if not exists public.learning_mistakes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  source_type text, source_id uuid, skill text, category text not null, subtype text,
  original text, corrected text, explanation text,
  occurrence_count integer not null default 1,
  first_seen_at timestamptz not null default now(),
  last_seen_at timestamptz not null default now(),
  resolved_score numeric not null default 0,
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists public.study_goals (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  goal_type text not null, target_jlpt text, target_value numeric, target_date date,
  is_active boolean not null default true, metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

create table if not exists public.daily_stats (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  study_date date not null, study_seconds integer not null default 0, sessions integer not null default 0,
  questions integer not null default 0, correct integer not null default 0,
  kana_reviewed integer not null default 0, kanji_reviewed integer not null default 0,
  vocab_reviewed integer not null default 0, grammar_reviewed integer not null default 0,
  unique(user_id, study_date)
);

-- Helpful indexes
create index if not exists idx_vocab_sets_user_updated on public.vocabulary_sets(user_id, updated_at desc);
create index if not exists idx_vocab_progress_due on public.vocabulary_progress(user_id, next_review_at);
create index if not exists idx_kanji_progress_due on public.kanji_progress(user_id, next_review_at);
create index if not exists idx_kana_progress_due on public.kana_progress(user_id, next_review_at);
create index if not exists idx_grammar_progress_due on public.grammar_progress(user_id, next_review_at);
create index if not exists idx_review_events_user_time on public.review_events(user_id, reviewed_at desc);
create index if not exists idx_mistakes_user_category on public.learning_mistakes(user_id, category, last_seen_at desc);

-- RLS helper: owner-only user tables.
do $$
declare t text;
begin
  foreach t in array array[
    'profiles','kana_progress','kanji_collections','kanji_collection_items','kanji_progress',
    'vocabulary_sets','vocabulary_items','vocabulary_kanji','vocabulary_progress',
    'grammar_packs','grammar_formations','grammar_usages','grammar_examples','grammar_cues',
    'grammar_mistakes','grammar_relations','grammar_progress','study_sessions','ai_generations',
    'questions','answers','review_events','combined_review_configs','listening_attempts','speaking_attempts',
    'reading_attempts','writing_attempts','learning_mistakes','study_goals','daily_stats'
  ] loop
    execute format('alter table public.%I enable row level security', t);
    if t = 'profiles' then
      execute format('create policy %I on public.%I for all to authenticated using (id = (select auth.uid())) with check (id = (select auth.uid()))', t || '_owner', t);
    else
      execute format('create policy %I on public.%I for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()))', t || '_owner', t);
    end if;
  end loop;
end $$;

-- Owner allowlist.
alter table public.app_owners enable row level security;
create policy app_owners_self_read on public.app_owners for select to authenticated using (user_id = (select auth.uid()));

-- Canonical reference tables: authenticated read-only.
alter table public.kana_characters enable row level security;
create policy kana_authenticated_read on public.kana_characters for select to authenticated using (true);

alter table public.kanji_characters enable row level security;
create policy kanji_authenticated_read on public.kanji_characters for select to authenticated using (true);

alter table public.conjugation_rules enable row level security;
create policy conjugation_authenticated_read on public.conjugation_rules for select to authenticated using (true);
