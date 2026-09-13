# BUSINESS DESIGN V3 — PERSONAL QUIZLET AI JAPANESE LEARNING SYSTEM

> **Phiên bản:** 3.0 — Japanese Learning Edition  
> **Mục tiêu:** Chuyển toàn bộ hệ thống Personal Quizlet AI từ English Learning sang Japanese Learning, không chỉ thay nội dung mà thay đổi domain model, learning engine, grading, UI và AI để phù hợp tiếng Nhật.  
> **Target stack:** Angular + Supabase + Gemini API + GitHub Pages  
> **Target user:** 01 người dùng duy nhất / personal use  
> **Ngôn ngữ giao diện mặc định:** Tiếng Việt  
> **Ngôn ngữ học:** Tiếng Nhật  
> **Chuẩn cấp độ chính:** JLPT N5 → N1  
> **Nguồn cảm hứng UX:** Quizlet study flow, Flashcards, Learn, Write, Spell, Test, Match, Progress, SRS và AI study tools.  
> **Nguyên tắc pháp lý/sản phẩm:** Không sao chép logo, nhãn hiệu, tài sản đồ họa, copywriting hoặc implementation riêng của Quizlet. Chỉ tái tạo mô hình tương tác học tập bằng nhận diện thiết kế riêng.

---

# MỤC LỤC

1. Executive Summary
2. Nền tảng nghiên cứu từ Quizlet
3. Đặc thù domain học tiếng Nhật
4. Product Scope
5. Product Principles
6. User Model
7. Feature Parity & Japanese Extensions
8. System Architecture
9. Technology Stack
10. Domain Architecture
11. Kana Module
12. Kanji Module
13. Vocabulary Module
14. Flashcards Engine
15. Spaced Repetition Engine
16. Learn / Adaptive Study Engine
17. Write / Recall Mode
18. Japanese Dictation / Spell Mode
19. Smart Grading for Japanese
20. Test Engine
21. Match Game
22. Progress / Mastery
23. Grammar Module
24. Grammar Practice Engine
25. Conjugation Engine
26. Combined Review
27. Listening
28. Speaking
29. Reading
30. Writing
31. AI Practice Generator
32. AI Tutor
33. Daily Study Path
34. Scoring & Mastery
35. Database Design
36. Supabase Edge Functions
37. API Contracts
38. AI Prompt Contracts
39. Security & RLS
40. Angular Application Architecture
41. Detailed Screen Specifications
42. UI Design System
43. Navigation & Routing
44. GitHub Pages Deployment
45. Observability & AI Cost Control
46. Validation & Quality Gates
47. Testing Strategy
48. Implementation Roadmap
49. Acceptance Criteria
50. Future Extensions
51. Research Sources
52. Final Product Definition

---

# 1. EXECUTIVE SUMMARY

## 1.1. Product vision

Ứng dụng là một **Personal Japanese Learning System** có trải nghiệm học nhanh, rõ ràng và trực quan tương tự Quizlet, nhưng được thiết kế riêng cho tiếng Nhật.

Hệ thống phải giải quyết đồng thời 7 lớp kiến thức:

```text
Kana
Kanji
Vocabulary
Grammar
Listening
Speaking
Reading
Writing
```

và một lớp xuyên suốt:

```text
Learning History / Mastery / Mistakes / Review Schedule
```

Không xem tiếng Nhật như tiếng Anh thay font.

Các đặc thù bắt buộc phải được hỗ trợ:

```text
Hiragana
Katakana
Kanji
Kana Reading
Romaji
Furigana
On'yomi
Kun'yomi
Okurigana
Radical
Stroke Count
Stroke Order
Particles
Verb/Adjective Conjugation
Counters
Politeness Level
JLPT Level
Japanese IME input
Long vowels
Small っ
Small ゃゅょ
Dakuten / Handakuten
```

## 1.2. Learning loop

```text
IMPORT / CREATE KNOWLEDGE
          ↓
LEARN
          ↓
RECOGNIZE
          ↓
RECALL
          ↓
USE IN CONTEXT
          ↓
TEST
          ↓
ANALYZE MISTAKES
          ↓
SCHEDULE REVIEW
          ↓
RETEST
          ↓
MASTERY
```

## 1.3. Core experience

Người dùng mở app và không cần tự hỏi:

> Hôm nay mình nên học gì?

Dashboard phải tự trả lời:

```text
8 từ vựng đến hạn
5 Kanji cần ôn
1 mẫu ngữ pháp yếu
10 phút Listening
1 bài Speaking ngắn
```

Một phiên học lý tưởng:

```text
Dashboard
→ Today's Plan
→ 5 Kana/Kanji/Vocab reviews
→ 1 Grammar drill
→ 1 integrated exercise
→ result
→ mistakes mapped back to knowledge
→ next review scheduled
```

## 1.4. Example integrated task

Nguồn học:

```text
Grammar:
～たことがある

Vocabulary:
旅行
日本
京都
寺
写真
食べる

Kanji:
旅
京
寺
食

Target:
Speaking
```

AI tạo:

```text
日本へ旅行した経験について1分ほど話してください。

できれば次の語彙を使ってください:
旅行、京都、寺、写真

文法:
～たことがある
```

Sau khi người dùng nói:

```text
audio
→ transcript
→ pronunciation analysis
→ grammar analysis
→ vocab usage analysis
→ feedback
→ mastery update
```

## 1.5. Product position

Sản phẩm cuối cùng:

```text
Quizlet-style Study System
+
Japanese Kana Trainer
+
Kanji Learning System
+
Grammar Learning
+
JLPT-oriented Content Organization
+
LSRW Practice
+
AI Tutor
+
AI Exercise Generator
+
Adaptive Review
+
Personal Analytics
```

---

# 2. NỀN TẢNG NGHIÊN CỨU TỪ QUIZLET

Phần này giữ lại các behavior đã nghiên cứu từ Quizlet ở BD V2 và ánh xạ sang Japanese Learning.

## 2.1. Flashcard Set

Quizlet tổ chức nội dung theo Study Set gồm nhiều cặp term/definition.

Ánh xạ sang tiếng Nhật:

```text
Japanese Knowledge Set
├── vocabulary items
├── kana items
├── kanji references
└── optional grammar references
```

Một Japanese Vocabulary card không chỉ gồm:

```text
term ↔ definition
```

mà có thể có:

```text
学校
↔
がっこう
↔
gakkou
↔
trường học
```

## 2.2. Flashcards

Giữ các behavior:

```text
flip
next/previous
shuffle
autoplay
audio
star
orientation
known / learning
```

Mở rộng direction:

```text
Kanji → Meaning
Kanji → Reading
Reading → Kanji
Japanese → Vietnamese
Vietnamese → Japanese
Audio → Japanese
```

## 2.3. Spaced Repetition

Giữ interaction:

```text
Repeat
Hard
Okay
Easy
```

Hệ thống riêng quyết định interval.

Không tuyên bố copy thuật toán nội bộ của Quizlet.

## 2.4. Learn Mode

Giữ cơ chế:

```text
recognition
→ assisted recall
→ free recall
→ contextual production
```

Với tiếng Nhật:

```text
看板 + 4 meanings
→ 看板 reading?
→ "biển hiệu" viết tiếng Nhật?
→ dùng 看板 trong câu
```

## 2.5. Answer Streaks

Giữ streak như motivation layer.

First-try correctness quan trọng hơn final correctness.

## 2.6. Write Mode

Giữ remediation loop:

```text
ask all
→ collect wrong
→ focus wrong items
→ require repeated successful recall
```

Với Japanese cần policy:

```text
question asks Kanji:
  学校 expected

question asks reading:
  がっこう expected

question asks Japanese generally:
  学校 / がっこう may be accepted according to grading policy
```

## 2.7. Spell Mode

Trong tiếng Nhật đổi tên nghiệp vụ thành:

```text
Japanese Dictation
```

Các mode:

```text
Audio → Kana
Audio → Kanji
Audio → Full sentence
Kanji → Reading
```

## 2.8. Smart Grading

Giữ 3 mức:

```text
RELAXED
MODERATE
STRICT
```

nhưng normalization phải hiểu Japanese script.

## 2.9. Test Mode

Giữ:

```text
question count
question types
timer
starred-only
weak-only
submit
score
review
```

## 2.10. Match

Có thể match:

```text
Kanji ↔ Reading
Kanji ↔ Meaning
Japanese ↔ Vietnamese
Kana ↔ Meaning
```

## 2.11. Progress

Giữ nhóm:

```text
Not Studied
Still Learning
Mastered
```

Internal states:

```text
NEW
LEARNING
FAMILIAR
MASTERED
STRONG
```

## 2.12. Stars

Star có thể dùng cho:

```text
từ khó
Kanji khó
ngữ pháp quan trọng
mục tiêu JLPT
từ muốn dùng khi Speaking
```

## 2.13. Combine Sets

Mở rộng mạnh:

```text
N Vocabulary Sets
+
N Grammar Packs
+
N Kanji Collections
+
skill selection
```

Không duplicate dữ liệu.

## 2.14. AI Practice Tests

Nguồn:

```text
Vocab
Grammar
Kanji
Kana
Mistake history
JLPT level
```

Output:

```text
practice session
```

## 2.15. AI Study Guide

Future:

```text
Upload Japanese lesson/PDF/note
→ extract text
→ identify Vocabulary
→ identify Kanji
→ identify Grammar
→ propose lesson
→ user approves
→ save
```

## 2.16. Ask-style AI Tutor

AI Tutor phải context aware:

```text
giải thích từ này
giải thích Kanji này
so sánh は và が
tạo 5 câu với ～ながら
kiểm tra cách đọc
tạo mini quiz
```

## 2.17. Learning science

Core engine ưu tiên:

```text
retrieval practice
active recall
spacing
guidance fading
immediate feedback
targeted review
contextual production
```

---

# 3. ĐẶC THÙ DOMAIN HỌC TIẾNG NHẬT

## 3.1. Learning dimensions

Japanese không được model như:

```text
word ↔ translation
```

Mà phải model thành:

```text
Written Form
Reading
Meaning
Pronunciation
Usage
Grammar
Context
Script Knowledge
```

## 3.2. Script layers

```text
Hiragana
Katakana
Kanji
Romaji
```

Romaji chỉ là scaffolding.

Default:

```text
N5 beginner:
  có thể bật Romaji

sau khi Kana mastery >= threshold:
  hệ thống đề xuất tắt Romaji
```

## 3.3. Furigana

Mọi text có Kanji nên hỗ trợ:

```html
<ruby>
  学校
  <rt>がっこう</rt>
</ruby>
```

Modes:

```text
Always
On Tap
Unknown Kanji Only
Off
```

## 3.4. JLPT levels

Primary level:

```text
N5
N4
N3
N2
N1
Unclassified
```

JLPT level được dùng để:

```text
filter
generate exercises
recommend lessons
analytics
study planning
```

Không dùng JLPT như official score predictor nếu không có hệ thống calibration riêng.

## 3.5. Japanese answer dimensions

Một Vocabulary item có thể có nhiều correct dimensions:

```text
Written:
学校

Reading:
がっこう

Meaning:
trường học
```

Question phải declare:

```text
expected_answer_type
```

Ví dụ:

```text
KANJI
KANA
MEANING_VI
ROMAJI
ANY_JAPANESE_FORM
```

---

# 4. PRODUCT SCOPE

## 4.1. Kana

- Hiragana chart
- Katakana chart
- basic kana
- dakuten
- handakuten
- yōon
- small っ
- long vowel
- recognition
- reading
- listening
- typing
- SRS
- confusion pairs
- progress

## 4.2. Kanji

- Kanji library
- meaning
- Onyomi
- Kunyomi
- radicals
- stroke count
- stroke order data
- example vocabulary
- example sentences
- JLPT
- star
- SRS
- reading quiz
- meaning quiz
- compound quiz
- handwriting future

## 4.3. Vocabulary

- Sets
- Japanese written form
- Kana reading
- Romaji
- Vietnamese meaning
- POS
- examples
- grammar tags
- Kanji references
- audio
- Flashcards
- Learn
- Write
- Dictation
- Test
- Match
- AI Practice
- SRS

## 4.4. Grammar

- Pattern
- Formula
- Meaning
- Usage
- Context recognition
- Conjugation
- Examples
- Common mistakes
- Similar grammar comparison
- Practice
- Test
- AI explanation
- SRS

## 4.5. Integrated Review

```text
Vocabulary
+
Kanji
+
Grammar
+
LSRW
```

## 4.6. LSRW

- Listening
- Speaking
- Reading
- Writing
- feedback
- scores
- mistakes
- next recommendations

## 4.7. Personal Analytics

- mastery
- study streak
- time
- JLPT coverage
- due review
- accuracy
- reading accuracy
- dictation accuracy
- Kanji mastery
- grammar mastery
- skill trends
- AI recommendations

---

# 5. PRODUCT PRINCIPLES

## P1. One-click Study

```text
Open item/set
→ Study
```

## P2. One Knowledge Source, Many Modes

Ví dụ `学校` được lưu một lần nhưng xuất hiện trong:

```text
Flashcard
Learn
Dictation
Test
Match
Reading
Listening
Speaking
Writing
```

## P3. Japanese-first Representation

UI hiển thị:

```text
学校
がっこう
trường học
```

Romaji không chiếm vị trí chính.

## P4. Furigana is contextual scaffolding

Không ép Furigana luôn bật.

## P5. Weakness drives next study

Sai `っ`, sai đọc Kanji, sai particle hoặc sai conjugation đều phải ảnh hưởng phiên học tiếp theo.

## P6. AI is not source of truth

AI:

```text
generates
explains
evaluates
suggests
```

Database:

```text
stores canonical learning content
```

## P7. Deterministic before AI

Nếu chấm được bằng code:

```text
code first
```

Chỉ gọi AI khi:

```text
semantic judgment
free writing
speaking
open-ended response
```

## P8. Explainable recommendations

Ví dụ:

```text
Ôn ～ています vì:
- accuracy 58%
- sai 4 lần trong 7 ngày
- 2 câu Writing dùng sai
- review đang overdue
```

---

# 6. USER MODEL

## 6.1. User

Chỉ một owner.

Role:

```text
OWNER
```

Technical access:

```text
anonymous → denied
authenticated non-owner → denied
owner → allowed
backend service → Edge Function only
```

## 6.2. Authentication

Recommended:

```text
Email + Password
```

Optional:

```text
Magic Link
Google OAuth
```

Không cần public registration.

---

# 7. FEATURE PARITY & JAPANESE EXTENSIONS

| Feature | Quizlet-like | Japanese Extension | Priority |
|---|---:|---|---:|
| Flashcard Set | Yes | Kanji/Kana/Meaning multi-side | P0 |
| Flashcard flip | Yes | Multi-direction | P0 |
| Audio | Yes | ja-JP TTS | P0 |
| Import | Yes | Japanese CSV format | P0 |
| AI Create | Yes | JLPT-aware | P1 |
| Learn | Yes | Script-aware adaptive | P0 |
| Write | Yes | Kana/Kanji expected type | P0 |
| Spell | Yes | Japanese Dictation | P0 |
| SRS | Yes | Kana/Kanji/Vocab/Grammar | P0 |
| Smart grading | Yes | Japanese normalization | P0 |
| Test | Yes | JLPT-style mix optional | P0 |
| Match | Yes | Kanji↔Kana↔Meaning | P1 |
| Progress | Yes | per-domain mastery | P0 |
| Stars | Yes | all knowledge entities | P0 |
| Combined Sets | Extended | Vocab+Kanji+Grammar | P0 |
| AI Practice | Yes | Japanese context generation | P1 |
| AI Tutor | Yes | Japanese explanations | P1 |
| Kana module | New | Full module | P0 |
| Kanji module | New | Full module | P0 |
| Furigana | New | System-wide | P0 |
| Conjugation Engine | New | Japanese-specific | P0 |
| Listening | Extended | Japanese dictation/comprehension | P0 |
| Speaking | Extended | mora/long vowel/gemination feedback | P1 |
| Reading | Extended | Furigana-aware | P0 |
| Writing | Extended | Japanese correction | P1 |
| JLPT tracking | New | N5→N1 | P1 |

---

# 8. SYSTEM ARCHITECTURE

```text
┌─────────────────────────────────────────────────────┐
│                    GitHub Pages                     │
│                                                     │
│                    Angular SPA                      │
│                                                     │
│ Dashboard                                           │
│ Kana                                                │
│ Kanji                                               │
│ Vocabulary                                          │
│ Grammar                                             │
│ Study Engines                                       │
│ LSRW                                                │
│ AI Tutor                                            │
│ Progress                                            │
└──────────────────────────┬──────────────────────────┘
                           │ HTTPS / JWT
                           ▼
┌─────────────────────────────────────────────────────┐
│                     Supabase                        │
│                                                     │
│ Auth                                                │
│ PostgreSQL                                          │
│ Storage                                             │
│ Edge Functions                                      │
│ RLS                                                 │
└───────────────┬───────────────────┬─────────────────┘
                │                   │
                ▼                   ▼
          Gemini API            Storage
          Text/Audio            Images
          Structured JSON       Japanese audio
          Evaluation            Speaking recordings
```

---

# 9. TECHNOLOGY STACK

## 9.1. Frontend

```text
Angular
TypeScript
Angular Router
Angular Signals
RxJS
Reactive Forms
SCSS
Angular CDK / Material primitives
Supabase JS Client
```

Japanese rendering requirements:

```text
ruby / rt support
Japanese font fallback
IME-compatible inputs
vertical text optional future
```

Suggested font stack:

```css
font-family:
  "Noto Sans JP",
  "Hiragino Kaku Gothic ProN",
  "Yu Gothic",
  system-ui,
  sans-serif;
```

Không bundle font proprietary.

## 9.2. Backend

```text
Supabase PostgreSQL
Supabase Auth
Supabase Storage
Supabase Edge Functions
RLS
Postgres Functions
```

## 9.3. AI

```text
Angular
→ Edge Function
→ Gemini API
→ structured output
→ validation
→ persistence
```

Use cases:

```text
exercise generation
grammar explanation
reading generation
listening script generation
semantic grading
writing feedback
speaking/audio analysis
AI Tutor
```

## 9.4. Hosting

```text
Frontend: GitHub Pages
Backend: Supabase
AI: Gemini API
```

---

# 10. DOMAIN ARCHITECTURE

```text
User
│
├── Kana
│   ├── Kana Characters
│   └── Kana Progress
│
├── Kanji
│   ├── Kanji Characters
│   ├── Readings
│   ├── Radicals
│   ├── Stroke Data
│   └── Kanji Progress
│
├── Vocabulary Sets
│   ├── Vocabulary Items
│   ├── Kanji References
│   └── Vocabulary Progress
│
├── Grammar Packs
│   ├── Patterns
│   ├── Formulas
│   ├── Usages
│   ├── Conjugation Rules
│   ├── Examples
│   ├── Common Mistakes
│   └── Grammar Progress
│
├── Study Sessions
│   ├── Questions
│   ├── Answers
│   ├── Results
│   └── Review Events
│
├── Combined Reviews
├── Listening Attempts
├── Speaking Attempts
├── Reading Attempts
├── Writing Attempts
├── Mistake Bank
├── AI Generations
└── Analytics
```

---

# 11. KANA MODULE

## 11.1. Purpose

Dạy nền tảng Kana trước và song song với Vocabulary.

Hai hệ:

```text
Hiragana
Katakana
```

## 11.2. Kana categories

```text
Basic Gojuon
Dakuten
Handakuten
Yōon
Sokuon
Long Vowels
Special combinations
```

## 11.3. Kana entity

```text
character
script_type
romaji
row
column
audio
stroke_order
category
example_words
```

Example:

```text
character: か
script_type: hiragana
romaji: ka
row: K
category: basic
```

## 11.4. Learning directions

```text
Kana → Romaji
Romaji → Kana
Audio → Kana
Kana → Sound
Hiragana ↔ Katakana
```

## 11.5. Confusion pairs

Track separately:

```text
さ / き
ぬ / め
れ / わ
シ / ツ
ソ / ン
ク / ケ
```

Data:

```text
confusion_count
last_confused_with
```

## 11.6. Kana Study Mode

Flow:

```text
show character
→ learner recalls
→ reveal
→ Repeat/Hard/Okay/Easy
```

## 11.7. Kana Test

Types:

```text
recognition
typing
audio recognition
pair distinction
```

## 11.8. Kana mastery

```text
recognition 30%
production 30%
listening 25%
retention 15%
```

---

# 12. KANJI MODULE

## 12.1. Kanji entity

Fields:

```text
character
meanings_vi[]
onyomi[]
kunyomi[]
nanori[] optional
radical
radical_name
stroke_count
stroke_order_asset
jlpt_level
frequency_rank optional
notes
```

## 12.2. Reading structure

Không lưu reading thành một string duy nhất.

```text
kanji_readings
├── type: ON
├── type: KUN
└── reading_kana
```

Example:

```text
日

On:
ニチ
ジツ

Kun:
ひ
か
```

## 12.3. Kanji detail

Display:

```text
日
N5

Meaning:
ngày, mặt trời

On:
ニチ / ジツ

Kun:
ひ / か

Radical:
日

Strokes:
4
```

Then:

```text
日本
にほん
Nhật Bản

毎日
まいにち
mỗi ngày
```

## 12.4. Kanji learning modes

```text
Kanji → Meaning
Kanji → Reading
Meaning → Kanji
Kana → Kanji
Compound → Reading
Audio → Compound
```

## 12.5. Stroke order

Store authoritative asset/reference where available.

AI must not invent stroke order.

`stroke_order_asset` can be:

```text
SVG
JSON path
image sequence
external validated dataset ID
```

## 12.6. Kanji Collection

Examples:

```text
JLPT N5 Kanji
Numbers
Time
School
Travel
Food
```

## 12.7. Kanji Progress

Separate evidence:

```text
meaning_accuracy
onyomi_accuracy
kunyomi_accuracy
compound_accuracy
writing_accuracy optional
retention
```

## 12.8. Kanji mastery formula

```text
0.25 meaning
+ 0.20 readings
+ 0.25 vocabulary compounds
+ 0.15 contextual recognition
+ 0.15 retention
```

---

# 13. VOCABULARY MODULE

## 13.1. Vocabulary Set

Examples:

```text
N5 Daily Life
School
Travel
Restaurant
Part-time Work
JLPT N4 Unit 3
```

Fields:

```text
id
title
description
jlpt_level
topic
tags
cover
is_archived
```

## 13.2. Vocabulary Item

Required:

```text
written_form
reading_kana
meaning_vi
```

Optional:

```text
romaji
part_of_speech
meanings[]
common_kanji_form
alternative_forms[]
pitch_accent_info optional
example_ja
example_reading
example_vi
notes
audio_url
image_url
tags[]
jlpt_level
```

Example:

```text
written_form:
食べる

reading:
たべる

romaji:
taberu

POS:
verb / ichidan

meaning:
ăn

example:
毎朝パンを食べます。

reading:
まいあさ パンを たべます。

meaning:
Mỗi sáng tôi ăn bánh mì.
```

## 13.3. Kanji references

`食べる` links:

```text
食
```

Not duplicated.

## 13.4. POS

Suggested enum:

```text
noun
i_adjective
na_adjective
ichidan_verb
godan_verb
irregular_verb
adverb
particle
conjunction
expression
counter
prefix
suffix
other
```

## 13.5. Create Set

Manual:

```text
Set info
→ add vocab rows
→ autosave
```

## 13.6. Import

Supported:

```text
Japanese[TAB]Reading[TAB]Meaning
Japanese,Reading,Meaning
Japanese | Reading | Meaning
```

Example:

```text
学校	がっこう	trường học
先生	せんせい	giáo viên
勉強する	べんきょうする	học
```

## 13.7. CSV

Columns:

```text
written_form
reading_kana
meaning_vi
romaji
part_of_speech
jlpt_level
example_ja
example_vi
```

## 13.8. AI Create

Input:

```text
Tạo 30 từ vựng N5 chủ đề trường học.
```

AI returns:

```text
written
reading
meaning
POS
example
JLPT estimate
```

Flow:

```text
Generate
→ schema validate
→ duplicate detect
→ preview
→ user edit
→ save
```

Không auto publish.

---

# 14. FLASHCARDS ENGINE

## 14.1. Methods

```text
Browse
Basic Sorting
Spaced Repetition
```

## 14.2. Card sides

Card supports more than 2 logical fields but displays 2 surfaces.

Template A:

Front:

```text
学校
```

Back:

```text
がっこう
trường học
🔊
```

Template B:

Front:

```text
trường học
```

Back:

```text
学校
がっこう
```

Template C:

Front:

```text
学校
```

Back:

```text
がっこう
```

## 14.3. Controls

```text
Flip
Previous
Next
Shuffle
Autoplay
Audio
Star
Furigana
Orientation
Fullscreen
```

## 14.4. Keyboard

```text
Space → Flip
← → Previous
→ → Next
S → Star
A → Audio
```

## 14.5. Basic Sorting

```text
Still Learning
Know
```

Round summary:

```text
Know: 18
Still Learning: 7
```

## 14.6. Audio

Priority:

```text
custom validated audio
→ generated TTS
→ browser SpeechSynthesis ja-JP
```

---

# 15. SPACED REPETITION ENGINE

## 15.1. Interaction

```text
show
→ recall
→ reveal
→ rate
```

Ratings:

```text
Repeat
Hard
Okay
Easy
```

## 15.2. Initial schedule

App policy:

```text
Repeat → 5 minutes
Hard   → 6 hours
Okay   → 1 day
Easy   → 4 days
```

Later:

```text
Hard   interval × 1.2
Okay   interval × 2.3
Easy   interval × 3.5
```

Caps:

```text
5 minutes → 180 days
```

Can replace with FSRS later.

## 15.3. Per-entity scheduler

SRS applies independently to:

```text
Kana
Kanji
Vocabulary
Grammar
```

## 15.4. Queue priority

```text
1 overdue weak
2 due today
3 recent lapses
4 JLPT target weaknesses
5 new content
```

## 15.5. New items/day

Separate settings:

```text
new vocab/day
new kanji/day
new grammar/day
```

---

# 16. LEARN / ADAPTIVE STUDY ENGINE

## 16.1. Study Goals

```text
Familiarity
Understanding
Mastery
JLPT Preparation
```

## 16.2. Stages

### Stage 0 — Recognition

```text
MCQ
True/False
Flashcard
```

### Stage 1 — Guided Recall

```text
Japanese → meaning
Kanji → reading
meaning → choose Japanese
```

### Stage 2 — Production

```text
type Kana
type Kanji
type Japanese vocabulary
grammar fill
```

### Stage 3 — Context

```text
sentence completion
particle selection
reading in context
conjugation
```

### Stage 4 — Mastery

```text
free response
translation
short writing
listening recall
speaking use
```

## 16.3. Priority formula

```text
priority =
  0.30 weakness
+ 0.25 due_factor
+ 0.15 lapse_factor
+ 0.10 recency_gap
+ 0.10 JLPT_target
+ 0.10 skill_gap
```

## 16.4. Format selection

Example:

```text
mastery < 30
→ 70% recognition
→ 20% guided
→ 10% production

30–60
→ 40% recognition
→ 40% guided
→ 20% production

60–80
→ 20% recognition
→ 30% guided
→ 50% production

>80
→ 10% recognition
→ 20% guided
→ 70% context/production
```

## 16.5. Wrong answer feedback

Example:

Question:

```text
学校 の読み方は？
```

User:

```text
がこう
```

Feedback:

```text
✕ Sai

Đáp án:
がっこう

Bạn thiếu âm ngắt っ.

学校:
がっこう

がっ + こう

Hãy nghe lại:
🔊
```

Then requeue.

---

# 17. WRITE / RECALL MODE

## 17.1. Modes

```text
Meaning → Japanese
Kanji → Reading
Reading → Kanji
Vietnamese → Japanese
Grammar completion
```

## 17.2. Completion

```text
each selected item
→ correct written recall twice
```

## 17.3. Input policy

Question metadata:

```text
answer_type
```

Possible:

```text
KANJI
KANA
ROMAJI
MEANING
ANY_JAPANESE_FORM
```

## 17.4. Hint

Hint levels:

```text
1 show first Kana
2 show word length
3 show reading
4 reveal
```

Using hint lowers evidence weight.

---

# 18. JAPANESE DICTATION / SPELL MODE

## 18.1. Purpose

Thay cho English Spell.

## 18.2. Modes

```text
Audio → Kana
Audio → Kanji
Audio → Mixed Japanese
Sentence Audio → Transcript
Kanji → Reading
```

## 18.3. Example

Audio:

```text
がっこう
```

Mode `KANA` expects:

```text
がっこう
```

Mode `KANJI` expects:

```text
学校
```

## 18.4. Error diff

Input:

```text
がこう
```

Correct:

```text
がっこう
```

UI highlight:

```text
が [っ] こう
```

Explanation:

```text
Thiếu small っ, làm thay đổi nhịp mora và cách phát âm.
```

## 18.5. Audio controls

```text
Replay
0.75x
1x
1.25x
Show after N attempts
```

## 18.6. Completion

```text
2 first/near-first successful recalls per item
```

---

# 19. SMART GRADING FOR JAPANESE

## 19.1. Normalization pipeline

Always:

```text
Unicode NFC/NFKC policy
trim spaces
normalize Japanese spaces
normalize punctuation where irrelevant
```

Optional:

```text
full-width / half-width normalization
Katakana/Hiragana normalization for reading-only tasks
```

Never normalize when script itself is being tested.

## 19.2. STRICT

Example question:

```text
Viết bằng Kanji: trường học
```

Expected:

```text
学校
```

`がっこう`:

```text
incorrect
```

## 19.3. MODERATE

Question:

```text
Viết từ tiếng Nhật cho "trường học".
```

Can accept:

```text
学校
```

and optionally:

```text
がっこう
```

depending question policy.

## 19.4. RELAXED

Use:

```text
deterministic aliases
→ semantic variants
→ AI judge only if uncertain
```

## 19.5. Reading equivalence

For reading question:

```text
学校 → がっこう
```

Katakana:

```text
ガッコウ
```

Default:

```text
mark as wrong if Hiragana explicitly required
```

Can allow as semantically correct but script wrong:

```text
meaning_correct = true
format_correct = false
```

## 19.6. Partial correctness

Important for Japanese.

Example:

```text
answer has correct meaning but wrong particle
```

Store:

```text
semantic_score
form_score
grammar_score
```

instead of binary only.

---

# 20. TEST ENGINE

## 20.1. Setup

```text
Sources
Question count
Types
Directions
Difficulty
JLPT level
Only starred
Only weak
Timer
Pass threshold
Furigana policy
```

## 20.2. Question types

```text
MCQ
True/False
Kana input
Kanji input
Reading
Meaning
Fill blank
Particle
Conjugation
Matching
Context
Listening
Short translation
```

## 20.3. Test behavior

No answer feedback before submit.

Autosave locally/database.

## 20.4. Score

```text
score = earned_points / available_points × 100
```

Default:

```text
90–100 Excellent
80–89 Pass
65–79 Review Required
<65 Fail
```

Threshold configurable.

## 20.5. Result breakdown

```text
Kana
Kanji
Vocabulary
Grammar
Reading
Listening
```

For integrated tests optionally:

```text
Speaking
Writing
```

## 20.6. Review

Each wrong answer:

```text
Your answer
Correct answer
Reading
Meaning
Grammar explanation
Related source item
Review now
```

---

# 21. MATCH GAME

## 21.1. Pair types

```text
Kanji ↔ Kana
Kanji ↔ Meaning
Kana ↔ Meaning
Japanese ↔ Vietnamese
```

## 21.2. Rules

```text
6 pairs/board
timer starts first interaction
wrong pair → +1 second
correct → pair disappears
```

## 21.3. Score

```text
raw time
penalty
final time
best time
```

Low mastery weight.

---

# 22. PROGRESS / MASTERY

## 22.1. Display groups

```text
Chưa học
Đang học
Đã thành thạo
```

Internal:

```text
NEW
LEARNING
FAMILIAR
MASTERED
STRONG
```

## 22.2. Domain mastery

Dashboard separately shows:

```text
Kana Mastery
Kanji Mastery
Vocabulary Mastery
Grammar Mastery
Listening
Speaking
Reading
Writing
```

## 22.3. JLPT coverage

Example:

```text
N5 Vocabulary: 72%
N5 Kanji:      58%
N5 Grammar:    64%
```

This is coverage/mastery of app content, not official JLPT predicted pass probability.

## 22.4. Starred

Any knowledge entity can be starred.

---

# 23. GRAMMAR MODULE

## 23.1. Grammar Pack

Examples:

```text
です / ます
は vs が
を / に / で
～ています
～たい
～たことがある
～てもいい
～てはいけない
～なければならない
～ながら
～そうだ
～ように
```

## 23.2. Required structure

Every pack:

```text
Title
JLPT
Meaning
Pattern / Formula
Formation
Usage
Context / recognition cues
Examples
Negative/past variants if relevant
Conjugation requirements
Common mistakes
Similar grammar
Notes
Practice
Test
Mastery
```

## 23.3. Formula example

Grammar:

```text
～たことがある
```

Meaning:

```text
đã từng...
```

Pattern:

```text
Vた + ことがある
```

Example:

```text
日本へ行ったことがあります。
にほんへ いったことがあります。
Tôi đã từng đi Nhật Bản.
```

## 23.4. Usage

```text
Dùng để nói về kinh nghiệm từng làm việc gì đó trong quá khứ.
```

## 23.5. Context / DHNB

Không áp dụng “dấu hiệu nhận biết” cơ học như tiếng Anh.

UI section giữ tên thân thiện:

```text
Dấu hiệu / Ngữ cảnh thường gặp
```

Examples:

```text
一度
今までに
前に
```

Nhưng phải ghi:

```text
Đây là cue thường gặp, không phải điều kiện bắt buộc.
```

## 23.6. Common mistakes

Wrong:

```text
日本へ行くことがあります。
```

Nếu ý muốn nói “đã từng đi Nhật”.

Correct:

```text
日本へ行ったことがあります。
```

Reason:

```text
～たことがある yêu cầu động từ thể た.
```

## 23.7. Similar Grammar

Example:

```text
～たことがある
vs
～ことがある
```

Display comparison table.

---

# 24. GRAMMAR PRACTICE ENGINE

## 24.1. Types

```text
MCQ
Fill Blank
Particle Selection
Conjugation
Error Detection
Sentence Correction
Sentence Reordering
JP→VI
VI→JP
Context Completion
Free Production
```

## 24.2. Wrong-answer response

Required:

```text
Sai
Câu trả lời của bạn
Đáp án
Mẫu ngữ pháp
Vì sao sai
Cách biến đổi
Ví dụ tương tự
Mini retry
```

## 24.3. Example

Question:

```text
日本へ行った_____があります。

A. もの
B. こと
C. の
D. とき
```

Correct:

```text
B. こと
```

Explanation:

```text
Vた + ことがある
= đã từng làm...
```

## 24.4. AI Explain More

Context:

```text
grammar ID
question
answer
correct answer
JLPT level
recent mistakes
```

Output:

```text
short explanation
step-by-step
conjugation explanation
similar example
mini-check
```

---

# 25. CONJUGATION ENGINE

AI không nên là nguồn chính cho conjugation cơ bản.

## 25.1. Verb classes

```text
Ichidan
Godan
Irregular
```

## 25.2. Adjective classes

```text
i-adjective
na-adjective
```

## 25.3. Forms

Verb:

```text
dictionary
ます
ない
た
て
potential
volitional
passive
causative
imperative
conditional
```

Depending level.

## 25.4. Example entity

```text
食べる

class:
ICHIDAN

ます:
食べます

ない:
食べない

た:
食べた

て:
食べて
```

## 25.5. Practice

```text
食べる → て-form?
```

Expected:

```text
食べて
```

## 25.6. Mistake attribution

Wrong conjugation creates mistake:

```text
category: CONJUGATION
subtype: TE_FORM
source_grammar
source_vocab
```

---

# 26. COMBINED REVIEW

## 26.1. Inputs

```text
0..N Kana groups
0..N Kanji collections
1..N Vocabulary sets
0..N Grammar packs
1..4 skills
difficulty
JLPT level
duration
question count
```

## 26.2. Example

```text
Kanji:
JLPT N5 — School

Vocabulary:
School
Daily Life

Grammar:
～ています
に / で

Skills:
Listening
Reading
Writing
```

## 26.3. Context builder

```text
target vocabulary
target Kanji
target grammar
weak items
recent mistakes
JLPT target
skill gap
```

## 26.4. Coverage

Example 20 questions:

```text
>= 12 use target vocabulary
>= 8 use target Kanji
>= 10 use selected grammar
>= 5 combine grammar + vocabulary
>= 3 explicitly test readings
```

## 26.5. No duplication

Session stores references and immutable generated questions.

---

# 27. LISTENING

## 27.1. Modes

```text
Kana Listening
Word Dictation
Sentence Dictation
Dialogue
Short Comprehension
JLPT-style Listening Practice
Integrated Listening
```

## 27.2. Japanese-specific listening traps

Track:

```text
long vowels
small っ
ん
similar mora sequences
particles pronounced specially
numbers/counters
casual contractions
```

## 27.3. Generation

```text
selected knowledge
→ create Japanese script
→ validate
→ TTS/audio
→ cache
→ questions
```

## 27.4. Player

```text
Play
Pause
Replay
0.75x
1x
1.25x
```

## 27.5. Transcript

Before submit:

```text
hidden
```

After submit:

```text
Japanese transcript
Furigana optional
Vietnamese translation optional
target vocab highlights
grammar highlights
answer evidence
```

## 27.6. Score

```text
comprehension
dictation kana accuracy
kanji transcription accuracy
content word accuracy
```

---

# 28. SPEAKING

## 28.1. Modes

```text
Kana Read Aloud
Word Read Aloud
Sentence Read Aloud
Short Answer
Role Play
Topic Speaking
Conversation
Shadowing
```

## 28.2. Recording

```text
MediaRecorder
→ local preview
→ private Storage
→ Edge Function
→ AI audio analysis
→ structured result
```

## 28.3. Internal rubric

```text
Task Fulfillment      20
Grammar               20
Vocabulary            20
Fluency               20
Pronunciation          20
```

Pronunciation analysis may additionally report:

```text
mora timing
long vowels
gemination / small っ
sounds
rhythm
clarity
```

These are internal learning metrics, not an official JLPT score.

## 28.4. Required output

```json
{
  "transcriptJa": "",
  "transcriptReading": "",
  "overallScore": 0,
  "subscores": {
    "task": 0,
    "grammar": 0,
    "vocabulary": 0,
    "fluency": 0,
    "pronunciation": 0
  },
  "grammarErrors": [],
  "vocabularyIssues": [],
  "pronunciationIssues": [],
  "improvedAnswer": "",
  "usedVocabularyIds": [],
  "usedGrammarIds": [],
  "recommendations": []
}
```

## 28.5. Feedback UI

```text
Điểm tốt
Cần cải thiện
Transcript
Lỗi ngữ pháp
Lỗi từ vựng
Phát âm
Cách nói tự nhiên hơn
Bài mẫu
Ôn lại
```

---

# 29. READING

## 29.1. Reading content

Sources:

```text
AI generated
user pasted
future imported document
```

Parameters:

```text
JLPT
target vocab
target grammar
target Kanji
length
topic
furigana policy
```

## 29.2. Question types

```text
Main Idea
Detail
Inference
Reference
Vocabulary in Context
Kanji Reading
Grammar in Context
True/False
MCQ
Short Answer
```

## 29.3. Furigana policy

Options:

```text
Always
Unknown Kanji
Tap to reveal
Off
```

`Unknown Kanji`:

```text
show furigana only when kanji_mastery < threshold
```

## 29.4. Evidence

After submit:

```text
highlight evidence
show explanation
show reading
show vocabulary
show grammar
```

---

# 30. WRITING

## 30.1. Modes

```text
Kana Writing
Sentence
Short Message
Diary
Email
Paragraph
Opinion
Essay
JLPT-inspired free practice
Custom
```

Note:

JLPT organization may be used for vocabulary/grammar difficulty, but Speaking/Writing scores are internal product scores rather than official JLPT sections.

## 30.2. Requirements

Example:

```text
80–120 Japanese characters
use:
旅行
京都
写真

grammar:
～たことがある
～たい
```

## 30.3. Rubric

```text
Task Fulfillment       20
Grammar Accuracy       25
Vocabulary             20
Naturalness            15
Coherence              10
Kanji/Kana Usage       10
```

## 30.4. Error categories

```text
PARTICLE
CONJUGATION
WORD_CHOICE
KANJI
KANA
WORD_ORDER
REGISTER
GRAMMAR_PATTERN
NATURALNESS
PUNCTUATION
```

## 30.5. Inline feedback

Example:

Original:

```text
日本に行くことがあります。
```

Intended experience statement.

Suggestion:

```text
日本に行ったことがあります。
```

Explanation:

```text
～たことがある requires Vた for past experience.
```

## 30.6. AI output

```text
overall
subscores
annotated errors
corrected version
natural version
grammar notes
vocab notes
required target coverage
next practice
```

---

# 31. AI PRACTICE GENERATOR

## 31.1. Inputs

```text
Kana groups
Kanji collections
Vocabulary sets
Grammar packs
skills
JLPT
difficulty
question count
duration
weakness preference
```

## 31.2. Pipeline

```text
Request
→ Auth
→ Load source
→ Load mastery
→ Load mistakes
→ Select targets
→ Build compact Japanese context
→ Gemini Structured Output
→ JSON validation
→ Japanese semantic validation
→ deduplicate
→ persist
→ session
```

## 31.3. Validation

Check:

```text
Japanese is grammatical
correct answer exists
reading is plausible
Kanji/reading pairing matches canonical source
no duplicate options
no answer leak
JLPT difficulty reasonable
target coverage met
```

Canonical readings/meanings from database override AI generation.

---

# 32. AI TUTOR

## 32.1. Entry points

```text
Dashboard
Kana
Kanji
Vocabulary
Grammar
Question result
Reading
Listening
Speaking result
Writing result
```

## 32.2. Context examples

On Kanji `食`:

```text
Giải thích Kanji này
Cho tôi 5 từ ghép
Kiểm tra cách đọc
Tạo quiz
```

On grammar `は vs が`:

```text
So sánh
Cho ví dụ
Giải thích câu tôi vừa sai
Tạo 5 câu luyện tập
```

## 32.3. Actions

AI response can expose:

```text
[Quiz me]
[Add to Review]
[Create Flashcards]
[Show more examples]
[Compare grammar]
```

## 32.4. Grounding priority

```text
1 current entity
2 selected pack
3 canonical DB data
4 learning history
5 recent mistakes
6 general model knowledge
```

---

# 33. DAILY STUDY PATH

## 33.1. Dashboard plan

Example:

```text
Hôm nay — 22 phút

Kana due: 5
Kanji due: 6
Vocabulary due: 8
Grammar: ～ています
Listening: 5 phút
```

## 33.2. Planner weighting

```text
35% due review
25% weak knowledge
15% new content
15% current JLPT target
10% skill rotation
```

## 33.3. Beginner profile

If Kana mastery low:

```text
increase Kana allocation
reduce Kanji production
show more furigana
allow Romaji
```

## 33.4. Advanced profile

If N3+ target:

```text
reduce Romaji
reduce Furigana
increase reading
increase context
increase Japanese-only instructions
```

---

# 34. SCORING & MASTERY

## 34.1. Event weights

```text
Flashcard self-rating     0.5
Match                     0.3
MCQ                       0.7
Kana production           0.9
Kanji reading             1.0
Kanji production          1.1
Dictation                 1.0
Grammar fill              1.0
Conjugation               1.1
Test                      1.2
Context production        1.3
Speaking/Writing          1.2
Due SRS review            1.4
```

## 34.2. Result quality

```text
correct first try   +1.0
correct with hint   +0.6
correct retry       +0.4
partial             +0.2
wrong               -0.8
don't know          -1.0
```

## 34.3. Mastery

```text
new_mastery =
clamp(
  decayed_previous_mastery
  + weighted_evidence,
  0,
  100
)
```

## 34.4. Decay

If no review near due date:

```text
confidence decreases gradually
```

Do not aggressively reduce displayed mastery immediately.

Maintain separately:

```text
mastery
retention_confidence
```

## 34.5. Pass threshold

Default:

```text
80%
```

Configurable.

---

# 35. DATABASE DESIGN

All user-owned tables:

```text
user_id uuid not null
created_at timestamptz
updated_at timestamptz
```

UUID PK.

---

## 35.1. profiles

```text
id uuid pk
display_name
avatar_url
target_jlpt
daily_goal_minutes
default_pass_threshold
furigana_mode
romaji_mode
timezone
settings jsonb
```

---

## 35.2. kana_characters

Canonical/shared or owner-seeded.

```text
id
character
script_type
romaji
row_name
column_name
category
audio_url
stroke_order_asset
metadata jsonb
```

---

## 35.3. kana_progress

```text
id
user_id
kana_id
mastery_score
recognition_accuracy
production_accuracy
listening_accuracy
correct_count
wrong_count
confusion_count
last_confused_kana_id
last_reviewed_at
next_review_at
interval_days
stability
difficulty
last_rating
```

---

## 35.4. kanji_characters

```text
id
character
meanings_vi text[]
onyomi text[]
kunyomi text[]
nanori text[]
radical
radical_name
stroke_count
stroke_order_asset
jlpt_level
frequency_rank
notes
metadata jsonb
```

---

## 35.5. kanji_collections

```text
id
user_id
title
description
jlpt_level
tags text[]
```

---

## 35.6. kanji_collection_items

```text
collection_id
kanji_id
sort_order
```

---

## 35.7. kanji_progress

```text
id
user_id
kanji_id
mastery_score
meaning_accuracy
reading_accuracy
compound_accuracy
writing_accuracy
correct_count
wrong_count
last_reviewed_at
next_review_at
review_count
lapses
interval_days
stability
difficulty
is_starred
```

---

## 35.8. vocabulary_sets

```text
id
user_id
title
description
jlpt_level
topic
tags text[]
cover_url
is_archived
```

---

## 35.9. vocabulary_items

```text
id
user_id
set_id
written_form
reading_kana
romaji
part_of_speech
meaning_vi
meanings jsonb
alternative_forms text[]
example_ja
example_reading
example_vi
audio_url
image_url
pitch_accent_info jsonb
jlpt_level
tags text[]
notes
sort_order
```

Unique candidate:

```text
user_id + set_id + written_form + reading_kana
```

---

## 35.10. vocabulary_kanji

```text
vocabulary_item_id
kanji_id
position
```

---

## 35.11. vocabulary_progress

```text
id
user_id
vocabulary_item_id
mastery_score
status
seen_count
correct_count
wrong_count
first_try_correct_count
reading_correct_count
meaning_correct_count
production_correct_count
dictation_correct_count
context_correct_count
current_streak
best_streak
last_reviewed_at
next_review_at
review_count
lapses
interval_days
stability
difficulty
last_rating
is_starred
```

---

## 35.12. grammar_packs

```text
id
user_id
title
pattern
meaning_vi
summary
description
jlpt_level
category
difficulty
tags text[]
prerequisites uuid[]
is_archived
```

---

## 35.13. grammar_formations

```text
id
grammar_pack_id
label
formation
explanation
sort_order
```

---

## 35.14. grammar_usages

```text
id
grammar_pack_id
title
description
context_notes
sort_order
```

---

## 35.15. grammar_examples

```text
id
grammar_pack_id
sentence_ja
reading
translation_vi
explanation
difficulty
metadata jsonb
```

---

## 35.16. grammar_cues

```text
id
grammar_pack_id
cue
category
explanation
example
limitations
```

---

## 35.17. grammar_mistakes

```text
id
grammar_pack_id
incorrect_ja
correct_ja
reason_vi
rule_reference
```

---

## 35.18. grammar_relations

```text
grammar_id
related_grammar_id
relation_type
comparison_note
```

Types:

```text
SIMILAR
CONTRAST
PREREQUISITE
OFTEN_CONFUSED
```

---

## 35.19. grammar_progress

```text
id
user_id
grammar_pack_id
mastery_score
practice_accuracy
test_accuracy
production_accuracy
conjugation_accuracy
correct_count
wrong_count
last_reviewed_at
next_review_at
review_count
lapses
is_starred
```

---

## 35.20. conjugation_rules

```text
id
entity_type
class
target_form
rule_json
examples jsonb
```

---

## 35.21. study_sessions

```text
id
user_id
session_type
source_config jsonb
goal
skill
jlpt_level
difficulty
grading_mode
furigana_mode
status
started_at
completed_at
duration_seconds
total_questions
earned_points
available_points
score
passed
metadata jsonb
```

Session types:

```text
kana
kanji
flashcards
learn
write
dictation
test
match
grammar_practice
grammar_test
combined
listening
speaking
reading
writing
daily_review
ai_practice
```

---

## 35.22. questions

```text
id
user_id
session_id
source_type
source_refs jsonb
question_type
skill
prompt
prompt_reading
options jsonb
expected_answer_type
correct_answer jsonb
explanation
difficulty
jlpt_level
ai_generated
generation_id
metadata jsonb
```

---

## 35.23. answers

```text
id
user_id
session_id
question_id
attempt_no
answer jsonb
normalized_answer jsonb
is_correct
is_first_try
score
semantic_score
form_score
grammar_score
grader
grading_confidence
response_time_ms
feedback jsonb
created_at
```

---

## 35.24. review_events

```text
id
user_id
entity_type
entity_id
session_id
mode
result
weight
previous_mastery
new_mastery
reviewed_at
next_review_at
metadata jsonb
```

---

## 35.25. combined_review_configs

```text
id
user_id
name
kana_group_ids uuid[]
kanji_collection_ids uuid[]
vocabulary_set_ids uuid[]
grammar_pack_ids uuid[]
skills text[]
jlpt_level
difficulty
question_count
duration_minutes
settings jsonb
```

---

## 35.26. listening_attempts

```text
id
user_id
session_id
script_ja
script_reading
audio_url
score
dictation_score
comprehension_score
feedback jsonb
```

---

## 35.27. speaking_attempts

```text
id
user_id
session_id
prompt_ja
prompt_vi
audio_url
transcript_ja
transcript_reading
duration_seconds
task_score
grammar_score
vocabulary_score
fluency_score
pronunciation_score
overall_score
feedback jsonb
```

---

## 35.28. reading_attempts

```text
id
user_id
session_id
passage_ja
passage_reading
character_count
jlpt_level
score
feedback jsonb
```

---

## 35.29. writing_attempts

```text
id
user_id
session_id
prompt
answer_ja
character_count
task_score
grammar_score
vocabulary_score
naturalness_score
coherence_score
kanji_kana_score
overall_score
feedback jsonb
```

---

## 35.30. ai_generations

```text
id
user_id
generation_type
request_hash
model
prompt_version
input_summary jsonb
output jsonb
status
latency_ms
usage jsonb
error_code
created_at
```

---

## 35.31. learning_mistakes

```text
id
user_id
source_type
source_id
skill
category
subtype
original
corrected
explanation
occurrence_count
first_seen_at
last_seen_at
resolved_score
metadata jsonb
```

Categories include:

```text
KANA
KANJI
READING
LONG_VOWEL
SOKUON
PARTICLE
CONJUGATION
GRAMMAR
VOCABULARY
WORD_ORDER
PRONUNCIATION
NATURALNESS
```

---

## 35.32. study_goals

```text
id
user_id
goal_type
target_jlpt
target_value
target_date
is_active
metadata
```

---

## 35.33. daily_stats

```text
user_id
study_date
study_seconds
sessions
questions
correct
kana_reviewed
kanji_reviewed
vocab_reviewed
grammar_reviewed
```

---

# 36. SUPABASE EDGE FUNCTIONS

Recommended:

```text
ai-vocab-generate
ai-vocab-enrich
ai-kanji-examples
ai-grammar-explain
ai-generate-vocab-practice
ai-generate-kanji-practice
ai-generate-grammar-practice
ai-generate-combined-review
ai-generate-reading
ai-generate-listening
ai-evaluate-writing
ai-evaluate-speaking
ai-semantic-grade
ai-tutor
ai-daily-plan
```

Deterministic logic should remain DB/app-side:

```text
Japanese normalization
SRS
basic grading
conjugation rules
mastery calculation
daily due queue
```

---

# 37. API CONTRACTS

## 37.1. Generate Vocab Practice

Request:

```json
{
  "setIds": ["uuid"],
  "questionCount": 20,
  "difficulty": "adaptive",
  "jlptLevel": "N5",
  "questionTypes": [
    "meaning_mcq",
    "reading",
    "kana_input",
    "context"
  ],
  "onlyWeak": false
}
```

## 37.2. Generate Kanji Practice

```json
{
  "collectionIds": ["uuid"],
  "questionCount": 15,
  "modes": [
    "meaning",
    "reading",
    "compound"
  ]
}
```

## 37.3. Combined Review

```json
{
  "vocabularySetIds": ["uuid"],
  "kanjiCollectionIds": ["uuid"],
  "grammarPackIds": ["uuid"],
  "skills": ["listening", "reading", "writing"],
  "jlptLevel": "N5",
  "difficulty": "adaptive",
  "questionCount": 20
}
```

## 37.4. Evaluate Writing

```json
{
  "sessionId": "uuid",
  "prompt": "...",
  "answerJa": "...",
  "targetVocabularyIds": ["uuid"],
  "targetGrammarIds": ["uuid"],
  "targetKanjiIds": ["uuid"]
}
```

## 37.5. Evaluate Speaking

Audio uploaded first.

```json
{
  "sessionId": "uuid",
  "audioPath": "owner/.../answer.webm",
  "prompt": "...",
  "targetVocabularyIds": [],
  "targetGrammarIds": []
}
```

---

# 38. AI PROMPT CONTRACTS

## 38.1. Global system rule

```text
You are a Japanese learning content engine.

You must:
- respect the learner's JLPT level;
- prioritize supplied canonical vocabulary/grammar/kanji;
- preserve Japanese readings exactly when canonical readings are supplied;
- not invent a different reading for a supplied vocabulary item;
- return the required schema only;
- make explanations in Vietnamese unless explicitly requested otherwise;
- generate natural Japanese examples;
- avoid introducing excessive unknown grammar or vocabulary.
```

## 38.2. Grounding payload

```text
LEARNER
target JLPT
kana mastery
kanji mastery
weaknesses
recent mistakes

TARGET VOCABULARY
id
written form
reading
meaning

TARGET KANJI
id
character
canonical readings
meaning

TARGET GRAMMAR
id
pattern
formation
meaning
examples
```

## 38.3. Generation output validation

Reject if:

```text
wrong schema
wrong question count
unknown source ID
reading conflicts with canonical DB
missing explanation
duplicate option
correct answer not present
answer leak
too much out-of-level content
```

## 38.4. Writing evaluation prompt

Must distinguish:

```text
incorrect
unnatural but grammatical
stylistic suggestion
```

Do not mark every non-native expression as grammatically wrong.

## 38.5. Speaking prompt

AI must:

```text
transcribe first
evaluate task
evaluate grammar/vocab
evaluate pronunciation conservatively
show confidence
```

If audio quality insufficient:

```text
pronunciation status = INSUFFICIENT_AUDIO
```

not fabricate a score.

---

# 39. SECURITY & RLS

## 39.1. Frontend

Allowed:

```text
SUPABASE_URL
SUPABASE_PUBLISHABLE_KEY
```

Forbidden:

```text
Gemini API key
Supabase service role/secret key
```

## 39.2. RLS

Every user table:

```sql
using ((select auth.uid()) = user_id)
```

Insert:

```sql
with check ((select auth.uid()) = user_id)
```

## 39.3. Owner lock

`app_owners`:

```text
user_id
enabled
```

Every sensitive Edge Function:

```text
JWT
→ auth.uid
→ app_owners
→ continue
```

## 39.4. Storage

Buckets:

```text
vocab-images
japanese-audio
generated-audio
speaking-recordings
imports
```

Speaking:

```text
private
```

---

# 40. ANGULAR APPLICATION ARCHITECTURE

```text
src/
├── app/
│   ├── core/
│   │   ├── auth/
│   │   ├── guards/
│   │   ├── supabase/
│   │   ├── ai/
│   │   ├── japanese/
│   │   ├── audio/
│   │   ├── storage/
│   │   ├── telemetry/
│   │   └── config/
│   │
│   ├── shared/
│   │   ├── ui/
│   │   ├── japanese-text/
│   │   ├── furigana/
│   │   ├── models/
│   │   ├── pipes/
│   │   ├── directives/
│   │   └── utils/
│   │
│   ├── features/
│   │   ├── dashboard/
│   │   ├── kana/
│   │   ├── kanji/
│   │   ├── vocabulary/
│   │   ├── flashcards/
│   │   ├── learn/
│   │   ├── write-mode/
│   │   ├── dictation/
│   │   ├── tests/
│   │   ├── match/
│   │   ├── grammar/
│   │   ├── conjugation/
│   │   ├── combined-review/
│   │   ├── listening/
│   │   ├── speaking/
│   │   ├── reading/
│   │   ├── writing/
│   │   ├── ai-practice/
│   │   ├── ai-tutor/
│   │   ├── progress/
│   │   └── settings/
│   │
│   ├── layout/
│   │   ├── app-shell/
│   │   ├── sidebar/
│   │   ├── topbar/
│   │   └── mobile-nav/
│   │
│   └── app.routes.ts
├── assets/
└── styles/
```

## 40.1. Japanese text components

Reusable:

```text
<jp-text>
<furigana-text>
<kanji-chip>
<jlpt-badge>
<audio-button>
<answer-diff>
```

## 40.2. State

Signals:

```text
study session
card position
answer state
furigana state
audio state
filters
progress
```

---

# 41. DETAILED SCREEN SPECIFICATIONS

Target initial product: **38 primary screens/views**.

---

# S01 — LOGIN

Center card.

Elements:

```text
Product icon
Japanese Learning System
Email
Password
Login
Magic Link optional
```

No Sign Up.

---

# S02 — DASHBOARD

## Top area

Left:

```text
こんばんは 👋
Hôm nay tiếp tục học nhé.
```

Right:

```text
Streak
JLPT target badge
avatar
```

## Today's Plan

Large primary card:

```text
22 phút
5 Kana
6 Kanji
8 Vocabulary
1 Grammar
5 phút Listening

[ Bắt đầu học ]
```

## Continue

Horizontal cards:

```text
N5 Daily Life
JLPT N5 Kanji
Particles
```

## Weak now

```text
学校 reading
小さい っ
は vs が
食べる て-form
```

## Progress

```text
Kana
Kanji
Vocab
Grammar
```

---

# S03 — KANA HOME

Tabs:

```text
Hiragana
Katakana
Progress
```

Grid:

```text
あ い う え お
か き く け こ
...
```

Each cell:

```text
Kana
small Romaji optional
mastery indicator
```

Filters:

```text
Basic
Dakuten
Yōon
All
```

Actions:

```text
Learn
Review Due
Test
```

---

# S04 — KANA CHARACTER DETAIL

Center:

```text
あ
```

Below:

```text
a
audio
stroke animation/asset
example words
```

Right desktop:

```text
mastery
last review
next review
```

Actions:

```text
Practice
Star
```

---

# S05 — KANA PRACTICE

Question area.

Examples:

```text
What sound?
き
```

or:

```text
Audio 🔊
Type Kana:
```

Feedback bottom.

Progress top.

---

# S06 — KANJI LIBRARY

Header:

```text
Kanji
[Create Collection]
```

Filters:

```text
N5 N4 N3 N2 N1
Mastery
Due
Starred
```

Grid cards:

```text
食
ăn
N5
78%
```

Search:

```text
Kanji
reading
meaning
```

---

# S07 — KANJI DETAIL

Hero left:

```text
食
N5
9 strokes
```

Info right:

```text
Meaning
On
Kun
Radical
```

Sections:

```text
Stroke Order
Vocabulary
Examples
Progress
```

Vocabulary cards:

```text
食べる
たべる
ăn
```

Actions:

```text
Study
Add to Collection
Star
```

---

# S08 — KANJI COLLECTION

Hero:

```text
JLPT N5 Kanji
80 chars
62% mastery
12 due
```

Actions:

```text
Flashcards
Learn
Test
```

List/grid below.

---

# S09 — VOCABULARY LIBRARY

Header:

```text
Từ vựng
[+ Tạo bộ]
```

Tabs:

```text
Tất cả
Gần đây
Đang học
Đã thuộc
Đã lưu trữ
```

Filters:

```text
JLPT
Topic
Due
```

Set card:

```text
School
32 words
N5
74%
8 due
```

---

# S10 — CREATE / EDIT VOCAB SET

Top:

```text
Title
Description
JLPT
Topic
Tags
```

Toolbar:

```text
Import
AI Create
Add Word
Save
```

Table row:

```text
Japanese | Reading | Meaning
```

Expand row:

```text
Romaji
POS
Example
Audio
Image
Notes
```

Autosave status top-right.

---

# S11 — VOCAB SET DETAIL

Hero:

```text
N5 School
32 words
74% mastery
8 due
```

Primary:

```text
Flashcards
Learn
Test
```

Secondary:

```text
Write
Dictation
Match
AI Practice
```

Progress tabs:

```text
Chưa học
Đang học
Đã thuộc
```

Vocabulary list:

```text
学校
がっこう
trường học
★
```

---

# S12 — FLASHCARDS

Top bar:

```text
Back
Set name
12/32
Options
```

Center:

```text
large card
```

Bottom default:

```text
Previous
Flip
Next
```

SRS mode after flip:

```text
Repeat
Hard
Okay
Easy
```

Options:

```text
Direction
Furigana
Romaji
Shuffle
Autoplay
Audio
Starred only
```

---

# S13 — LEARN SETUP

Cards:

```text
Làm quen
Hiểu
Thành thạo
Ôn JLPT
```

Settings:

```text
Answer direction
Question types
Grading
Furigana
Starred
Weak only
```

CTA:

```text
Bắt đầu
```

---

# S14 — LEARN SESSION

Top:

```text
progress
streak
mastery goal
```

Center question.

Bottom answer controls.

On feedback:

```text
correct/wrong
reading
meaning
explanation
audio
```

---

# S15 — WRITE / RECALL

Prompt:

```text
trường học
```

Input:

```text
学校
```

Controls:

```text
Submit
Không biết
Hint
```

Answer type badge:

```text
KANJI
```

---

# S16 — JAPANESE DICTATION

Large audio control.

Prompt:

```text
🔊
Hãy nhập Kana bạn nghe được.
```

Input Japanese IME friendly.

Controls:

```text
Replay
Slow
Submit
```

Diff after answer.

---

# S17 — TEST SETUP

Cards/controls:

```text
20 câu
JLPT N5
Question Types
Directions
Timer
Pass 80%
Furigana Off
```

CTA:

```text
Bắt đầu kiểm tra
```

---

# S18 — TEST SESSION

Top:

```text
Question 5/20
Timer
Flag
```

Center.

No feedback.

Bottom:

```text
Previous
Next
```

---

# S19 — TEST RESULT

Hero:

```text
86%
ĐẠT
```

Breakdown:

```text
Reading 90
Meaning 85
Kanji 76
Grammar 92
```

Weak:

```text
学校 reading
～たことがある
```

Actions:

```text
Ôn câu sai
Luyện phần yếu
Làm lại
Tạo đề mới
```

---

# S20 — MATCH

12 tiles.

Mode label:

```text
Kanji ↔ Reading
```

Timer top.

Incorrect:

```text
+1 sec
```

---

# S21 — GRAMMAR LIBRARY

Header:

```text
Ngữ pháp
```

Filters:

```text
N5 N4 N3 N2 N1
Particles
Verb forms
Expressions
Sentence patterns
```

Card:

```text
～たことがある
đã từng...
N5
68%
```

---

# S22 — GRAMMAR DETAIL

Hero:

```text
～たことがある
N5
Đã từng...
```

Sticky nav:

```text
Tổng quan
Công thức
Cách dùng
Ngữ cảnh
Ví dụ
Lỗi thường gặp
So sánh
Luyện tập
```

Mastery right.

---

# S23 — CONJUGATION PRACTICE

Header:

```text
Chia động từ
```

Question:

```text
食べる
→ て-form
```

Input:

```text
食べて
```

Feedback:

```text
Correct
Ichidan:
る → て
```

---

# S24 — GRAMMAR PRACTICE

Question + answer.

After wrong:

```text
Your answer
Correct
Formula
Conjugation
Explanation
Example
Explain with AI
```

---

# S25 — COMBINED REVIEW BUILDER

4 steps:

```text
1 Knowledge
2 Skills
3 Difficulty
4 Summary
```

Knowledge selectors:

```text
Kana
Kanji
Vocabulary
Grammar
```

Skills:

```text
Listening
Speaking
Reading
Writing
```

CTA:

```text
AI tạo bài luyện
```

---

# S26 — LISTENING

Top:

```text
N5
Dialogue
2:15
```

Player center.

Questions below.

Transcript hidden until submit.

Result opens transcript drawer.

---

# S27 — SPEAKING PROMPT

Prompt card.

Display:

```text
Japanese prompt
Vietnamese support optional
target time
required vocab
required grammar
```

Recorder:

```text
Record
Pause
Stop
Replay
Submit
```

---

# S28 — SPEAKING RESULT

Hero overall.

Score cards:

```text
Task
Grammar
Vocabulary
Fluency
Pronunciation
```

Tabs:

```text
Feedback
Transcript
Pronunciation
Corrections
Better Answer
```

---

# S29 — READING

Desktop:

```text
Passage         Questions
60%             40%
```

Top controls:

```text
Furigana
Font size
Audio optional
```

Unknown Kanji can open mini popup.

---

# S30 — READING RESULT

Passage with highlights.

Right:

```text
answers
evidence
explanation
```

Bottom:

```text
New vocabulary
Weak Kanji
Grammar encountered
```

---

# S31 — WRITING

Prompt.

Requirements:

```text
80–120 chars
3 target words
1 target grammar
```

Editor.

Live indicators:

```text
character count
target vocab used
target grammar detected
```

No correction before submit unless Practice Assist enabled.

---

# S32 — WRITING RESULT

Annotated Japanese text.

Tabs:

```text
Score
Errors
Grammar
Vocabulary
Naturalness
Improved Version
```

Click error → side panel explanation.

---

# S33 — AI PRACTICE

Two modes:

### Natural language

```text
"Tạo bài N5 15 phút dùng bộ School và ngữ pháp ～ています."
```

### Builder

Selectors.

CTA:

```text
Generate
```

---

# S34 — AI TUTOR

Chat area.

Context chips:

```text
学校
～ています
N5
```

Quick prompts.

AI answer.

Action chips:

```text
Quiz me
Add review
More examples
Compare
```

---

# S35 — REVIEW QUEUE

Sections:

```text
Quá hạn
Hôm nay
Yếu
Đã đánh dấu
Mới
```

Filters:

```text
Kana
Kanji
Vocabulary
Grammar
```

CTA:

```text
Ôn tất cả
```

---

# S36 — PROGRESS

Global:

```text
Streak
Study time
Sessions
Average
```

Domain cards:

```text
Kana
Kanji
Vocab
Grammar
```

Charts:

```text
7d 30d 90d
```

JLPT coverage.

Skill trend.

---

# S37 — MISTAKE BANK

Filters:

```text
Kana
Kanji
Reading
Particle
Conjugation
Grammar
Speaking
Writing
```

Mistake card:

```text
original
correct
explanation
count
last seen
resolved %
```

CTA:

```text
Practice this
```

---

# S38 — SETTINGS

## Study

```text
Target JLPT
Daily minutes
Pass threshold
New Vocab/day
New Kanji/day
SRS
```

## Japanese Display

```text
Furigana
Romaji
Japanese font size
```

## Audio

```text
Voice
Speed
Autoplay
```

## AI

```text
AI generation enabled
Speaking evaluation
Writing evaluation
```

No raw API key displayed.

## Appearance

```text
Light
Dark
System
```

---

# 42. UI DESIGN SYSTEM

## 42.1. Visual direction

Phong cách:

```text
Bright
Clean
Friendly
Japanese-learning focused
Modern
Calm
High readability
```

Không dùng visual stereotype Nhật quá mạnh.

Tránh:

```text
quá nhiều đỏ
hoa anh đào khắp UI
font thư pháp cho nội dung học
admin dashboard nặng nề
```

## 42.2. Palette

Primary Indigo:

```text
#4F5CF6
```

Secondary Violet:

```text
#7C63FF
```

Japanese Accent / Sakura:

```text
#F28AA5
```

Mint:

```text
#44C7A1
```

Warm Yellow:

```text
#F5C451
```

Success:

```text
#22C55E
```

Error:

```text
#EF4444
```

Background:

```text
#F7F8FC
```

Surface:

```text
#FFFFFF
```

Text:

```text
#1F2937
```

Muted:

```text
#6B7280
```

## 42.3. JLPT badges

```text
N5 → light mint
N4 → cyan
N3 → indigo
N2 → violet
N1 → deep plum
```

Exact colors need WCAG contrast validation.

## 42.4. Japanese Typography

Japanese content should have larger x-height/line-height than Latin support text.

Suggested:

```text
Japanese hero Kanji: 72–120px
Flashcard term: 40–64px
Sentence: 20–24px
Reading/Furigana: 12–16px
Body Vietnamese: 14–16px
```

## 42.5. Cards

```text
radius 16
padding 20–24
subtle border
soft shadow
```

## 42.6. Study focus

During study:

```text
hide unnecessary navigation
large center content
few primary actions
keyboard friendly
```

## 42.7. Motion

Use:

```text
flashcard flip
answer feedback
match
progress
```

Respect reduced motion.

---

# 43. NAVIGATION & ROUTING

Use HashLocationStrategy for simple GitHub Pages deployment.

```text
/#/login
/#/dashboard

/#/kana
/#/kana/:id
/#/kana/practice

/#/kanji
/#/kanji/:id
/#/kanji/collections/:id

/#/vocabulary
/#/vocabulary/new
/#/vocabulary/:setId
/#/vocabulary/:setId/edit

/#/study/:setId/flashcards
/#/study/:setId/learn
/#/study/:setId/write
/#/study/:setId/dictation
/#/study/:setId/test
/#/study/:setId/match

/#/grammar
/#/grammar/:id
/#/grammar/:id/practice
/#/grammar/:id/test
/#/conjugation

/#/review
/#/review/create
/#/review/:sessionId

/#/listening/:sessionId
/#/speaking/:sessionId
/#/reading/:sessionId
/#/writing/:sessionId

/#/ai-practice
/#/ai-tutor

/#/results/:sessionId
/#/mistakes
/#/progress
/#/settings
```

Desktop sidebar:

```text
Home
Kana
Kanji
Vocabulary
Grammar
Review
AI Practice
Progress
Settings
```

Mobile bottom:

```text
Home
Vocab
Review
Progress
More
```

`More`:

```text
Kana
Kanji
Grammar
AI
Settings
```

---

# 44. GITHUB PAGES DEPLOYMENT

## 44.1. CI

```text
push main
→ checkout
→ setup node
→ npm ci
→ tests
→ ng build
→ Pages artifact
→ deploy
```

## 44.2. Frontend environment

Allowed:

```text
SUPABASE_URL
SUPABASE_PUBLISHABLE_KEY
```

## 44.3. Base href

Must match repo path.

Hash routing avoids SPA server rewrite issue.

---

# 45. OBSERVABILITY & AI COST CONTROL

## 45.1. AI log

```text
generation type
model
prompt version
latency
status
usage
request hash
```

## 45.2. Cache

Good candidates:

```text
vocab enrichment
stable example generation
TTS audio
Kanji explanations
```

Do not reuse personalized grading across different answers.

## 45.3. Rate

Single user:

```text
max 2 concurrent AI requests
```

Prevent double submit.

## 45.4. Retry

```text
network → retry
schema invalid → regenerate once
failed again → controlled error
```

---

# 46. VALIDATION & QUALITY GATES

## 46.1. Kana

Reject malformed character mapping.

## 46.2. Kanji

Required:

```text
character
>=1 meaning
validated reading source where canonical
```

Stroke data only if validated.

## 46.3. Vocabulary

Required:

```text
written_form
reading_kana
meaning_vi
```

Check duplicate.

Validate Kana reading shape.

## 46.4. Grammar

Cannot mark ready unless:

```text
pattern
meaning
formation
usage
example
```

## 46.5. AI Questions

Require:

```text
prompt
answer
explanation
source refs
```

MCQ:

```text
unique options
correct option present
```

## 46.6. Writing/Speaking

AI output must contain:

```text
score or explicit insufficient-data state
positive feedback
specific issues
actionable next step
```

---

# 47. TESTING STRATEGY

## 47.1. Unit

Test:

```text
Kana normalization
Katakana/Hiragana policy
small っ diff
long vowel handling
Japanese answer type
SRS
mastery
conjugation
pass/fail
streak
```

## 47.2. Components

```text
FuriganaText
Flashcard
Kana grid
Kanji detail
Learn question
Dictation
Grammar explanation
Recorder
Writing annotation
```

## 47.3. RLS

```text
anonymous denied
wrong user denied
owner CRUD
private Storage protected
```

## 47.4. Edge Functions

Mock Gemini.

Test:

```text
valid schema
invalid schema
wrong reading
timeout
duplicate generation
ownership
```

## 47.5. E2E

Kana:

```text
login
→ Kana
→ learn
→ test
→ progress
```

Vocab:

```text
create set
→ add Japanese words
→ Flashcards
→ Learn
→ Dictation
→ Test
→ weak review
```

Kanji:

```text
collection
→ study
→ reading practice
→ test
```

Grammar:

```text
grammar
→ lesson
→ conjugation
→ practice
→ explanation
→ test
```

Integrated:

```text
Combined Review
→ AI generate
→ complete
→ result
→ mastery updated
```

---

# 48. IMPLEMENTATION ROADMAP

# PHASE 0 — FOUNDATION

Deliver:

```text
Angular
Supabase
Auth
RLS
GitHub Pages
CI
App shell
Design system
Japanese text components
```

---

# PHASE 1 — KANA FOUNDATION

Deliver:

```text
Hiragana
Katakana
Kana grid
Kana audio
Kana practice
Kana test
Kana SRS
Progress
```

---

# PHASE 2 — VOCABULARY CORE

Deliver:

```text
Vocab CRUD
Japanese reading fields
Import
Flashcards
Basic sorting
Audio
Star
Progress
```

---

# PHASE 3 — QUIZLET LEARNING MODES

Deliver:

```text
Learn
Write
Japanese Dictation
Smart Grading
Test
Match
Results
```

---

# PHASE 4 — KANJI

Deliver:

```text
Kanji DB
Kanji Library
Kanji Detail
Readings
Radicals
Collections
Kanji practice
Kanji test
Kanji SRS
```

---

# PHASE 5 — GRAMMAR + CONJUGATION

Deliver:

```text
Grammar CRUD
Formation
Usage
Context cues
Examples
Mistakes
Similar grammar
Conjugation engine
Practice
Test
Mastery
```

---

# PHASE 6 — AI CORE

Deliver:

```text
AI vocab generation
AI examples
AI grammar explanation
AI exercises
Structured output
Validation
```

---

# PHASE 7 — COMBINED REVIEW

Deliver:

```text
Kana refs
Kanji refs
Vocab refs
Grammar refs
Adaptive mixed session
Coverage rules
```

---

# PHASE 8 — LISTENING + READING

Deliver:

```text
Japanese TTS
Dictation
Dialogue
Reading generator
Furigana policy
Evidence feedback
```

---

# PHASE 9 — WRITING + SPEAKING

Deliver:

```text
Japanese editor
AI correction
MediaRecorder
private audio
AI audio evaluation
Mistake extraction
```

---

# PHASE 10 — AI TUTOR + DAILY PLAN

Deliver:

```text
AI Tutor
context actions
daily planner
JLPT targeting
weakness recommendations
```

---

# PHASE 11 — ANALYTICS / POLISH

Deliver:

```text
JLPT coverage
heatmaps
skill trends
mistake bank
responsive
performance
PWA optional
```

---

# 49. ACCEPTANCE CRITERIA

## Kana

```text
Hiragana/Katakana
→ Learn
→ Audio
→ Type
→ Test
→ SRS
→ mastery
```

## Kanji

```text
Kanji
→ meaning
→ readings
→ compounds
→ review
→ test
→ mastery
```

## Vocabulary

```text
Create
→ Japanese + Kana + meaning
→ Flashcards
→ Learn
→ Write
→ Dictation
→ Test
→ Match
→ SRS
```

## Grammar

```text
Create/seed
→ formula
→ usage
→ context
→ example
→ conjugation
→ practice
→ detailed explanation
→ test
```

## Combined

```text
select Vocab
+ Kanji
+ Grammar
+ skills
→ generate
→ complete
→ grade
→ update all source mastery
```

## Reading

```text
Japanese passage
→ configurable Furigana
→ questions
→ evidence
→ vocabulary/kanji extraction
```

## Listening

```text
audio
→ comprehension/dictation
→ transcript after submit
→ mistake extraction
```

## Speaking

```text
record
→ secure upload
→ transcript
→ internal rubric
→ actionable feedback
→ mistakes
```

## Writing

```text
write Japanese
→ annotation
→ grammar/particle/conjugation feedback
→ natural version
→ mistakes
```

## AI

```text
Gemini key never exposed in Angular
structured outputs validated
canonical DB overrides AI conflict
```

---

# 50. FUTURE EXTENSIONS

```text
PWA offline
FSRS
Handwriting canvas
Kanji stroke recognition
Pitch accent training
Shadowing waveform
Live AI Japanese conversation
Roleplay scenarios
Document import
OCR Japanese notes
Manga/article reading helper
Sentence mining
Anki import/export
Browser extension
JLPT mock exam templates
Notification reminders
Calendar study plan
Knowledge graph
Japanese dictionary connector
```

---

# 51. RESEARCH SOURCES

## 51.1. Quizlet behavior references retained from BD V2

**[Q1] What are flashcard sets?**  
https://help.quizlet.com/hc/en-au/articles/360032006352-What-are-flashcard-sets

**[Q2] Creating flashcard sets**  
https://help.quizlet.com/hc/en-us/articles/360029780752-Creating-study-sets/

**[Q3] Importing content**  
https://help.quizlet.com/hc/en-us/articles/360029977151-Creating-sets-by-importing-content

**[Q4] Smart Assist**  
https://help.quizlet.com/hc/en-ca/articles/39606772122509-Creating-study-sets-with-Smart-Assist

**[Q5] Flashcards**  
https://help.quizlet.com/hc/en-us/articles/360030988091-Studying-with-Flashcards

**[Q6] Spaced Repetition**  
https://help.quizlet.com/hc/en-us/articles/48324742264077-Studying-with-Spaced-Repetition

**[Q7] Learn**  
https://help.quizlet.com/hc/en-us/articles/360030986971-Studying-with-Learn

**[Q8] Learn Feature**  
https://quizlet.com/gb/features/learn

**[Q9] Study Path**  
https://help.quizlet.com/hc/en-us/articles/360048314692-Setting-up-a-study-path

**[Q10] How Quizlet Works**  
https://quizlet.com/gb/features/how-quizlet-works

**[Q11] Answer Streaks**  
https://help.quizlet.com/hc/en-us/articles/40011154960653-Studying-with-Answer-Streaks

**[Q12] Write Mode**  
https://help.quizlet.com/hc/en-us/articles/360030990531-Studying-with-Write-mode

**[Q13] Spell Mode**  
https://help.quizlet.com/hc/en-us/articles/360030645752-Studying-with-Spell-mode

**[Q14] Grading Options**  
https://help.quizlet.com/hc/en-us/articles/360048313652-Using-smart-grading-US-/

**[Q15] Test Mode**  
https://help.quizlet.com/hc/en-us/articles/360030642972-Studying-with-Test-mode/

**[Q16] Practice Tests**  
https://help.quizlet.com/hc/en-us/articles/25946589648013-Studying-with-Practice-Tests

**[Q17] Match**  
https://help.quizlet.com/hc/en-us/articles/360031183611-Playing-Match

**[Q18] Progress**  
https://help.quizlet.com/hc/en-ca/articles/360048803491-Using-Progress-for-targeted-studying

**[Q19] Stars**  
https://help.quizlet.com/hc/en-us/articles/360031172312-Studying-most-missed-terms-with-stars

**[Q20] Combining Sets**  
https://help.quizlet.com/hc/en-us/articles/360029638892-Combining-study-sets/

**[Q21] Study Guides**  
https://help.quizlet.com/hc/en-ca/articles/18312306436365-Studying-with-Study-Guides

**[Q22] Ask Quizlet**  
https://help.quizlet.com/hc/en-us/articles/42790350723725-Studying-with-Ask-Quizlet

## 51.2. Supabase

https://supabase.com/docs/guides/database/postgres/row-level-security

https://supabase.com/docs/guides/auth

https://supabase.com/docs/guides/getting-started/api-keys

https://supabase.com/docs/guides/functions/quickstart

## 51.3. Angular / GitHub Pages

https://angular.dev/tools/cli/deployment

https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages

## 51.4. Gemini

https://ai.google.dev/gemini-api/docs

https://ai.google.dev/gemini-api/docs/structured-output

https://ai.google.dev/gemini-api/docs/audio

https://ai.google.dev/gemini-api/docs/live-api/get-started-sdk

https://ai.google.dev/gemini-api/docs/speech-generation

---

# 52. FINAL PRODUCT DEFINITION

Final system:

```text
Quizlet-style Learning UX
+
Hiragana / Katakana Trainer
+
Kanji Learning
+
Japanese Vocabulary
+
Japanese Grammar
+
Conjugation Engine
+
Japanese Dictation
+
Spaced Repetition
+
Adaptive Learn
+
Smart Japanese Grading
+
Tests
+
Match
+
Combined Review
+
Listening
+
Speaking
+
Reading
+
Writing
+
JLPT-based Organization
+
Gemini AI Generation
+
AI Evaluation
+
AI Tutor
+
Personal Analytics
```

Core rule:

> **Mỗi câu trả lời phải làm cho câu hỏi tiếp theo phù hợp hơn với người học.**

Hệ thống chưa hoàn thành nếu chỉ:

```text
lưu từ
hiện flashcard
chấm quiz
```

Hệ thống chỉ hoàn thành khi learning history liên tục điều chỉnh:

```text
học nội dung nào
học theo script nào
có hiện Furigana hay không
có hiện Romaji hay không
câu hỏi khó tới đâu
hỏi Kanji hay Kana
khi nào cần ôn lại
lỗi nào cần xuất hiện nhiều hơn
Grammar nào cần luyện cùng Vocabulary nào
skill nào nên học tiếp
```

Đó là **Personal Quizlet AI Japanese Learning System**.
