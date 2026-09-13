---
name: Komorebi Study System
colors:
  surface: '#f8f9ff'
  surface-dim: '#d0dbed'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e6eeff'
  surface-container-high: '#dee9fc'
  surface-container-highest: '#d9e3f6'
  on-surface: '#121c2a'
  on-surface-variant: '#454555'
  inverse-surface: '#27313f'
  inverse-on-surface: '#eaf1ff'
  outline: '#757687'
  outline-variant: '#c6c5d8'
  surface-tint: '#3c48e4'
  primary: '#333fdd'
  on-primary: '#ffffff'
  primary-container: '#4f5cf6'
  on-primary-container: '#f5f2ff'
  inverse-primary: '#bec2ff'
  secondary: '#5a3ddc'
  on-secondary: '#ffffff'
  secondary-container: '#735af6'
  on-secondary-container: '#fffbff'
  tertiary: '#8f3a54'
  on-tertiary: '#ffffff'
  tertiary-container: '#ad526c'
  on-tertiary-container: '#fff1f2'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e0e0ff'
  primary-fixed-dim: '#bec2ff'
  on-primary-fixed: '#00046a'
  on-primary-fixed-variant: '#1c29cd'
  secondary-fixed: '#e5deff'
  secondary-fixed-dim: '#c8bfff'
  on-secondary-fixed: '#1a0063'
  on-secondary-fixed-variant: '#441ec6'
  tertiary-fixed: '#ffd9e0'
  tertiary-fixed-dim: '#ffb1c3'
  on-tertiary-fixed: '#3f0019'
  on-tertiary-fixed-variant: '#7a2a43'
  background: '#f8f9ff'
  on-background: '#121c2a'
  surface-variant: '#d9e3f6'
typography:
  display-kanji:
    fontFamily: Noto Sans
    fontSize: 64px
    fontWeight: '500'
    lineHeight: 80px
    letterSpacing: 0.02em
  display-kanji-mobile:
    fontFamily: Noto Sans
    fontSize: 44px
    fontWeight: '500'
    lineHeight: 56px
    letterSpacing: 0.02em
  furigana:
    fontFamily: Noto Sans
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 16px
    letterSpacing: 0.01em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 26px
    fontWeight: '700'
    lineHeight: 34px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 30px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '600'
    lineHeight: 18px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.04em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-lg: 1.5rem
  margin: 1rem
  margin-md: 2rem
  margin-lg: 3rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style
The design system combines the frictionless utility of high-performance digital study tools with a restrained, contemplative Japanese aesthetic. Designed for self-directed language learners spanning N5 beginner through N1 advanced fluency, it balances clarity, cognitive ease, and serene encouragement.

The aesthetic philosophy draws on modern minimalist educational interfaces with tactile, soft surface layers. It eliminates cognitive noise during high-repetition study sessions (Spaced Repetition System intervals, flashcard drilling, and kanji stroke recognition) through expansive negative space, high contrast reading paths, and deliberate accent colors that convey meaning without overwhelming the user.

Key emotional traits:
- **Calm & Focused**: Soft off-white canvases and pill-shaped structural elements minimize visual fatigue.
- **Supportive & Structured**: Explicit color semantics guide the learner through JLPT tiers and mastery states.
- **Culturally Attuned**: Typesetting accommodates dual-language mechanics natively, offering deliberate horizontal and vertical metrics for complex glyphs, furigana ruby text, and kana balance.

## Colors

The system operates primarily in a crisp, bright light mode with deeply calibrated semantic accents.

### Core Canvas & Structure
- **Background**: `#F7F8FC` — Canvas floor, low-glare cool paper tone.
- **Surface**: `#FFFFFF` — Cards, modals, elevated study panels.
- **Border**: `#E5E7EB` — Hairline frame dividers providing structure without heavy contrast.
- **Primary Text**: `#1F2937` — Deep charcoal for high legibility kanji and body copy.
- **Secondary Text**: `#6B7280` — Mid-tone grey for romaji, pitch accent markers, and secondary metadata.

### Accents & Progress Semantics
- **Primary (Indigo)**: `#4F5CF6` — Active interactions, primary CTAs, active deck selection, and JLPT N3 level.
- **Secondary (Violet)**: `#7C63FF` — Review highlights, grammar grouping, and JLPT N2 level.
- **Sakura Accent**: `#F28AA5` — Used strictly for subtle delight moments, bookmarking favorited vocabulary, and JLPT N1 plum transitions.
- **Mint (Mastery)**: `#44C7A1` — Successful recall confirmation, retention ring fill, and JLPT N5 designation.
- **Warm Yellow (Streak)**: `#F5C451` — Retention fire counters, daily streak milestones, and attention callouts.

### JLPT Badge Matrix
- **N5**: Mint (`#44C7A1`) with 12% tint background.
- **N4**: Cyan (`#06B6D4`) with 12% tint background.
- **N3**: Indigo (`#4F5CF6`) with 12% tint background.
- **N2**: Violet (`#7C63FF`) with 12% tint background.
- **N1**: Plum (`#9333EA` / `#F28AA5` tone) with 12% tint background.

## Typography

Typography requires strict vertical metrics to harmonize Latin glyphs with multi-part CJK orthography (Kanji, Hiragana, Katakana, and Furigana annotations).

### Font Pairing
- **Latin Display**: `Plus Jakarta Sans` delivers a contemporary, geometric, yet warmly rounded tone suited for UI labels, titles, and scoreboards.
- **Body & Functional UI**: `Inter` delivers uncompromised neutrality and exceptional legibility at compact data sizes.
- **Japanese Content (Kanji & Kana)**: `Noto Sans JP` (with fallbacks to `Hiragino Kaku Gothic ProN` and `Meiryo`) handles cross-script balance.

### Ruby & Furigana Rules
Furigana must be rendered above the target Kanji using native `<ruby>` and `<rt>` tags or dedicated flex columns. The `furigana` token sets an exact ratio (approx. 40–50% of the base Kanji size). Furigana must always be centered over the respective glyph and tinted to `#6B7280` to preserve the visual dominance of the primary character during active recall sessions.

## Layout & Spacing

The layout is constructed on an 8px base rhythm with a distraction-free centering rule for study sessions.

### Grid & Breakpoints
- **Mobile (under 640px)**: Single column with fluid stretch. `margin: 1rem` (`16px`), `gutter: 1rem`. Flashcard surfaces take 100% width with a max-height viewport constraint.
- **Tablet (640px - 1024px)**: 8-column layout. `margin-md: 2rem` (`32px`), `gutter: 1.5rem` (`24px`). Study tools align to the central 6 columns.
- **Desktop (1024px+)**: 12-column layout. Max container constraint of `1120px` for discovery and dashboards. During active study/drilling modes, content collapses to an intentional `680px` single-focus focal canvas centered horizontally to eliminate peripheral eye strain.

### Vertical Rhythm
Spacers strictly follow the 8px grid:
- `space-xs` (4px): Furigana-to-kanji separation, badge padding.
- `space-sm` (8px): Inline element grouping, audio icon to label margin.
- `space-md` (16px): Standard internal card padding, input field padding.
- `space-lg` (24px): Card-to-card gaps, desktop list item spacing.
- `space-xl` (32px): Primary section stack distance.

## Elevation & Depth

Visual hierarchy uses flat layered surfaces punctuated by ambient, color-tinted shadows. High-frequency educational tasks become taxing under heavy drop shadows; this system prioritizes calm elevation.

### Elevation Hierarchy
- **Level 0 (Flat)**: Base canvas `#F7F8FC`.
- **Level 1 (Card Default)**: `#FFFFFF` surface with a subtle perimeter border (`1px solid #E5E7EB`) and ambient shadow: `0px 2px 8px -2px rgba(31, 41, 55, 0.04), 0px 1px 2px 0px rgba(31, 41, 55, 0.02)`.
- **Level 2 (Interactive Cards & Study Panels)**: Elevated flashcards during review. Hairline border (`#E5E7EB`) backed by an expanded soft ambient diffusion: `0px 12px 32px -4px rgba(79, 92, 246, 0.06), 0px 4px 12px -2px rgba(31, 41, 55, 0.03)`.
- **Level 3 (Modals & Overlays)**: High-prominence overlays and contextual grammar sheets: `0px 24px 48px -12px rgba(31, 41, 55, 0.12)`.

### Border Integrity
Every card and surface keeps its `1px` border (`#E5E7EB`) even when shadowed. This preserves structural clarity in high-contrast viewing scenarios and ensures clean boundaries on low-nit mobile screens.

## Shapes

The interface embraces a soft, approachable curvature that counterbalances the architectural complexity of Japanese characters. 

- **Cards & Primary Modules**: Standardized on `rounded-2xl` (`1rem` / `16px`), providing an inviting, tactile card-deck quality.
- **Controls & Secondary Enclosures**: Form inputs, action buttons, and segmented pickers scale to `rounded-xl` (`0.75rem` / `12px`).
- **Badges & Interactive Filters**: Strictly pill-shaped (`9999px`) to maintain immediate recognition as non-content metadata elements.

## Components

### 1. Flashcard Container
- **Geometry**: `rounded-2xl` with Level 2 elevation and `#E5E7EB` border. Minimum mobile height `360px`, desktop `420px`.
- **Anatomy**:
  - *Top Rail*: Left-aligned JLPT Pill Badge; right-aligned audio icon and bookmark trigger (Sakura hover `#F28AA5`).
  - *Center Core*: Prominent Kanji block with top-aligned Furigana (`display-kanji`). Tap anywhere triggers a 3D flip animation (`transform: rotateY(180deg)` with a `250ms` cubic-bezier transition).
  - *Bottom Utility*: Pitch-accent visualization diagram (horizontal baseline with high/low pitch indicator markers in `#7C63FF`).

### 2. Audio Control Buttons
- Circular shape (`44px × 44px` on mobile, `40px × 40px` on desktop) for reliable touch targeting.
- Subtle `#F7F8FC` background with a `1px solid #E5E7EB` border.
- Speaker icon centered in Indigo (`#4F5CF6`).
- Active/Playing state transforms background to Indigo `#4F5CF6` with white icon and a pulsating wave aura (`0 0 0 4px rgba(79, 92, 246, 0.15)`).

### 3. JLPT Level Badges
- Strict pill architecture (`rounded-full`, height `24px`, padding `2px 10px`).
- Typographic style: `label-sm` in all-caps bold tracking (`0.04em`).
- Visual style: Low-saturation tinted background (12% opacity of the level color) paired with a solid text glyph in the level's hex code.

### 4. Mastery Progress Rings
- Circular SVG progress meter with an internal diameter scaled to context (`32px` in list rows, `72px` in summary views).
- Background track: `3px` stroke in `#E5E7EB`.
- Active meter: `3px` stroke in Mint (`#44C7A1`), stroke-linecap round.
- Center displays numerical mastery percentage formatted with `label-sm`.

### 5. Buttons
- **Primary Action**: Indigo `#4F5CF6` background, solid white text, `rounded-xl`, height `48px`, font `label-md`. Shadow: `0px 4px 14px 0px rgba(79, 92, 246, 0.25)`.
- **Answer/Recall Choices**:
  - *Default*: Surface `#FFFFFF`, border `1.5px solid #E5E7EB`, text `#1F2937`.
  - *Success ("Easy / Pass")*: Border `#44C7A1`, background `rgba(68, 199, 161, 0.08)`, text `#1F2937`.
  - *Failure ("Again")*: Border `#F28AA5`, background `rgba(242, 138, 165, 0.08)`, text `#1F2937`.

### 6. Input Fields (Furigana & Romaji Entry)
- Height `48px`, `rounded-xl`, border `1px solid #E5E7EB`, background `#FFFFFF`.
- Typography: `body-md` in `Noto Sans JP` for immediate IME (Input Method Editor) compatibility without vertical displacement.
- Focus ring: `2px` solid `#4F5CF6` with zero offset.

### 7. Streak Counter
- Horizontal pill badge featuring Warm Yellow (`#F5C451`).
- Accommodates flame glyph + numerical count of consecutive days.
- Background: `#FEF9C3`, text: `#854D0E`, border: `1px solid #FDE047`.
