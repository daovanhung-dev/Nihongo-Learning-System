import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'login',
    title: 'Login',
    loadComponent: () => import('./features/auth/pages/login/login.component').then(m => m.LoginComponent),
  },
  {
    path: 'dashboard',
    title: 'Dashboard',
    loadComponent: () => import('./features/dashboard/pages/dashboard/dashboard.component').then(m => m.DashboardComponent),
  },
  {
    path: 'kana',
    title: 'Kana Home',
    loadComponent: () => import('./features/kana/pages/kana-home/kana-home.component').then(m => m.KanaHomeComponent),
  },
  {
    path: 'kana/practice',
    title: 'Kana Practice',
    loadComponent: () => import('./features/kana/pages/kana-practice/kana-practice.component').then(m => m.KanaPracticeComponent),
  },
  {
    path: 'kana/:id',
    title: 'Kana Character Detail',
    loadComponent: () => import('./features/kana/pages/kana-detail/kana-detail.component').then(m => m.KanaDetailComponent),
  },
  {
    path: 'kanji',
    title: 'Kanji Library',
    loadComponent: () => import('./features/kanji/pages/kanji-library/kanji-library.component').then(m => m.KanjiLibraryComponent),
  },
  {
    path: 'kanji/collections/:id',
    title: 'Kanji Collection',
    loadComponent: () => import('./features/kanji/pages/kanji-collection/kanji-collection.component').then(m => m.KanjiCollectionComponent),
  },
  {
    path: 'kanji/:id',
    title: 'Kanji Detail',
    loadComponent: () => import('./features/kanji/pages/kanji-detail/kanji-detail.component').then(m => m.KanjiDetailComponent),
  },
  {
    path: 'vocabulary',
    title: 'Vocabulary Library',
    loadComponent: () => import('./features/vocabulary/pages/vocabulary-library/vocabulary-library.component').then(m => m.VocabularyLibraryComponent),
  },
  {
    path: 'vocabulary/new',
    title: 'Create / Edit Vocabulary Set',
    loadComponent: () => import('./features/vocabulary/pages/vocabulary-editor/vocabulary-editor.component').then(m => m.VocabularyEditorComponent),
  },
  {
    path: 'vocabulary/:setId',
    title: 'Vocabulary Set Detail',
    loadComponent: () => import('./features/vocabulary/pages/vocabulary-set-detail/vocabulary-set-detail.component').then(m => m.VocabularySetDetailComponent),
  },
  {
    path: 'study/:setId/flashcards',
    title: 'Flashcards',
    loadComponent: () => import('./features/flashcards/pages/flashcards/flashcards.component').then(m => m.FlashcardsComponent),
  },
  {
    path: 'study/:setId/learn/setup',
    title: 'Learn Setup',
    loadComponent: () => import('./features/learn/pages/learn-setup/learn-setup.component').then(m => m.LearnSetupComponent),
  },
  {
    path: 'study/:setId/learn',
    title: 'Learn Session',
    loadComponent: () => import('./features/learn/pages/learn-session/learn-session.component').then(m => m.LearnSessionComponent),
  },
  {
    path: 'study/:setId/write',
    title: 'Write / Recall Mode',
    loadComponent: () => import('./features/write-mode/pages/write-recall/write-recall.component').then(m => m.WriteRecallComponent),
  },
  {
    path: 'study/:setId/dictation',
    title: 'Japanese Dictation',
    loadComponent: () => import('./features/dictation/pages/dictation/dictation.component').then(m => m.DictationComponent),
  },
  {
    path: 'study/:setId/test/setup',
    title: 'Test Setup',
    loadComponent: () => import('./features/tests/pages/test-setup/test-setup.component').then(m => m.TestSetupComponent),
  },
  {
    path: 'study/:setId/test',
    title: 'Test Session',
    loadComponent: () => import('./features/tests/pages/test-session/test-session.component').then(m => m.TestSessionComponent),
  },
  {
    path: 'study/:setId/match',
    title: 'Match Game',
    loadComponent: () => import('./features/match/pages/match-game/match-game.component').then(m => m.MatchGameComponent),
  },
  {
    path: 'grammar',
    title: 'Grammar Library',
    loadComponent: () => import('./features/grammar/pages/grammar-library/grammar-library.component').then(m => m.GrammarLibraryComponent),
  },
  {
    path: 'conjugation',
    title: 'Conjugation Practice',
    loadComponent: () => import('./features/conjugation/pages/conjugation-practice/conjugation-practice.component').then(m => m.ConjugationPracticeComponent),
  },
  {
    path: 'grammar/:id/practice',
    title: 'Grammar Practice',
    loadComponent: () => import('./features/grammar/pages/grammar-practice/grammar-practice.component').then(m => m.GrammarPracticeComponent),
  },
  {
    path: 'grammar/:id',
    title: 'Grammar Detail',
    loadComponent: () => import('./features/grammar/pages/grammar-detail/grammar-detail.component').then(m => m.GrammarDetailComponent),
  },
  {
    path: 'review/create',
    title: 'Combined Review Builder',
    loadComponent: () => import('./features/combined-review/pages/combined-review-builder/combined-review-builder.component').then(m => m.CombinedReviewBuilderComponent),
  },
  {
    path: 'review',
    title: 'Review Queue',
    loadComponent: () => import('./features/review/pages/review-queue/review-queue.component').then(m => m.ReviewQueueComponent),
  },
  {
    path: 'listening/:sessionId',
    title: 'Listening Practice',
    loadComponent: () => import('./features/listening/pages/listening-practice/listening-practice.component').then(m => m.ListeningPracticeComponent),
  },
  {
    path: 'speaking/:sessionId',
    title: 'Speaking Prompt',
    loadComponent: () => import('./features/speaking/pages/speaking-prompt/speaking-prompt.component').then(m => m.SpeakingPromptComponent),
  },
  {
    path: 'speaking/:sessionId/result',
    title: 'Speaking Result',
    loadComponent: () => import('./features/speaking/pages/speaking-result/speaking-result.component').then(m => m.SpeakingResultComponent),
  },
  {
    path: 'reading/:sessionId',
    title: 'Reading Practice',
    loadComponent: () => import('./features/reading/pages/reading-practice/reading-practice.component').then(m => m.ReadingPracticeComponent),
  },
  {
    path: 'reading/:sessionId/result',
    title: 'Reading Result',
    loadComponent: () => import('./features/reading/pages/reading-result/reading-result.component').then(m => m.ReadingResultComponent),
  },
  {
    path: 'writing/:sessionId',
    title: 'Writing Practice',
    loadComponent: () => import('./features/writing/pages/writing-practice/writing-practice.component').then(m => m.WritingPracticeComponent),
  },
  {
    path: 'writing/:sessionId/result',
    title: 'Writing Result',
    loadComponent: () => import('./features/writing/pages/writing-result/writing-result.component').then(m => m.WritingResultComponent),
  },
  {
    path: 'ai-practice',
    title: 'AI Practice Generator',
    loadComponent: () => import('./features/ai-practice/pages/ai-practice/ai-practice.component').then(m => m.AiPracticeComponent),
  },
  {
    path: 'ai-tutor',
    title: 'AI Tutor',
    loadComponent: () => import('./features/ai-tutor/pages/ai-tutor/ai-tutor.component').then(m => m.AiTutorComponent),
  },
  {
    path: 'progress',
    title: 'Progress Dashboard',
    loadComponent: () => import('./features/progress/pages/progress-dashboard/progress-dashboard.component').then(m => m.ProgressDashboardComponent),
  },
  {
    path: 'mistakes',
    title: 'Mistake Bank',
    loadComponent: () => import('./features/mistakes/pages/mistake-bank/mistake-bank.component').then(m => m.MistakeBankComponent),
  },
  {
    path: 'settings',
    title: 'Settings',
    loadComponent: () => import('./features/settings/pages/settings/settings.component').then(m => m.SettingsComponent),
  },
  {
    path: 'results/:sessionId',
    title: 'Test Result',
    loadComponent: () => import('./features/tests/pages/test-result/test-result.component').then(m => m.TestResultComponent),
  },
  { path: '', pathMatch: 'full', redirectTo: 'dashboard' },
  { path: '**', redirectTo: 'dashboard' },
];
