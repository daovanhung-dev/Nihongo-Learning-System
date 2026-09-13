# STITCH SCREEN MAP

The 38 Stitch exports are normalized and mapped to Angular routes/features below.

| ID | Screen | Angular route | Feature | Stitch reference |
|---|---|---|---|---|
| S01 | Login | `/#/login` | `auth` | `design/stitch/screens/S01_login/` |
| S02 | Dashboard | `/#/dashboard` | `dashboard` | `design/stitch/screens/S02_dashboard/` |
| S03 | Kana Home | `/#/kana` | `kana` | `design/stitch/screens/S03_kana-home/` |
| S04 | Kana Character Detail | `/#/kana/:id` | `kana` | `design/stitch/screens/S04_kana-detail/` |
| S05 | Kana Practice | `/#/kana/practice` | `kana` | `design/stitch/screens/S05_kana-practice/` |
| S06 | Kanji Library | `/#/kanji` | `kanji` | `design/stitch/screens/S06_kanji-library/` |
| S07 | Kanji Detail | `/#/kanji/:id` | `kanji` | `design/stitch/screens/S07_kanji-detail/` |
| S08 | Kanji Collection | `/#/kanji/collections/:id` | `kanji` | `design/stitch/screens/S08_kanji-collection/` |
| S09 | Vocabulary Library | `/#/vocabulary` | `vocabulary` | `design/stitch/screens/S09_vocabulary-library/` |
| S10 | Create / Edit Vocabulary Set | `/#/vocabulary/new` | `vocabulary` | `design/stitch/screens/S10_vocabulary-editor/` |
| S11 | Vocabulary Set Detail | `/#/vocabulary/:setId` | `vocabulary` | `design/stitch/screens/S11_vocabulary-set-detail/` |
| S12 | Flashcards | `/#/study/:setId/flashcards` | `flashcards` | `design/stitch/screens/S12_flashcards/` |
| S13 | Learn Setup | `/#/study/:setId/learn/setup` | `learn` | `design/stitch/screens/S13_learn-setup/` |
| S14 | Learn Session | `/#/study/:setId/learn` | `learn` | `design/stitch/screens/S14_learn-session/` |
| S15 | Write / Recall Mode | `/#/study/:setId/write` | `write-mode` | `design/stitch/screens/S15_write-recall/` |
| S16 | Japanese Dictation | `/#/study/:setId/dictation` | `dictation` | `design/stitch/screens/S16_dictation/` |
| S17 | Test Setup | `/#/study/:setId/test/setup` | `tests` | `design/stitch/screens/S17_test-setup/` |
| S18 | Test Session | `/#/study/:setId/test` | `tests` | `design/stitch/screens/S18_test-session/` |
| S19 | Test Result | `/#/results/:sessionId` | `tests` | `design/stitch/screens/S19_test-result/` |
| S20 | Match Game | `/#/study/:setId/match` | `match` | `design/stitch/screens/S20_match-game/` |
| S21 | Grammar Library | `/#/grammar` | `grammar` | `design/stitch/screens/S21_grammar-library/` |
| S22 | Grammar Detail | `/#/grammar/:id` | `grammar` | `design/stitch/screens/S22_grammar-detail/` |
| S23 | Conjugation Practice | `/#/conjugation` | `conjugation` | `design/stitch/screens/S23_conjugation-practice/` |
| S24 | Grammar Practice | `/#/grammar/:id/practice` | `grammar` | `design/stitch/screens/S24_grammar-practice/` |
| S25 | Combined Review Builder | `/#/review/create` | `combined-review` | `design/stitch/screens/S25_combined-review-builder/` |
| S26 | Listening Practice | `/#/listening/:sessionId` | `listening` | `design/stitch/screens/S26_listening-practice/` |
| S27 | Speaking Prompt | `/#/speaking/:sessionId` | `speaking` | `design/stitch/screens/S27_speaking-prompt/` |
| S28 | Speaking Result | `/#/speaking/:sessionId/result` | `speaking` | `design/stitch/screens/S28_speaking-result/` |
| S29 | Reading Practice | `/#/reading/:sessionId` | `reading` | `design/stitch/screens/S29_reading-practice/` |
| S30 | Reading Result | `/#/reading/:sessionId/result` | `reading` | `design/stitch/screens/S30_reading-result/` |
| S31 | Writing Practice | `/#/writing/:sessionId` | `writing` | `design/stitch/screens/S31_writing-practice/` |
| S32 | Writing Result | `/#/writing/:sessionId/result` | `writing` | `design/stitch/screens/S32_writing-result/` |
| S33 | AI Practice Generator | `/#/ai-practice` | `ai-practice` | `design/stitch/screens/S33_ai-practice/` |
| S34 | AI Tutor | `/#/ai-tutor` | `ai-tutor` | `design/stitch/screens/S34_ai-tutor/` |
| S35 | Review Queue | `/#/review` | `review` | `design/stitch/screens/S35_review-queue/` |
| S36 | Progress Dashboard | `/#/progress` | `progress` | `design/stitch/screens/S36_progress-dashboard/` |
| S37 | Mistake Bank | `/#/mistakes` | `mistakes` | `design/stitch/screens/S37_mistake-bank/` |
| S38 | Settings | `/#/settings` | `settings` | `design/stitch/screens/S38_settings/` |

## Implementation rule

Each screen folder contains the source `code.html`, a visual `screen.png`, and `metadata.json`. Treat the HTML as a visual reference and port it into reusable Angular components.
