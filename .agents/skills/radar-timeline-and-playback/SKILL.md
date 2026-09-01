---
name: radar-timeline-and-playback
description: Design compact, fully labeled radar/satellite/nowcast timelines with frame availability, local loading states, gaps, playback, latest/live navigation, prefetch and keyboard controls without consuming major screen area.
---

# Radar Timeline and Playback

Use for radar mosaics, local radar, satellite imagery, lightning frames and short-range nowcast sequences.

## Space budget

The timeline is navigation, not the main content.

Default desktop target:
- total collapsed height: about 44–64 px;
- hard target: keep under ~72 px unless product constraints justify more;
- optional expanded inspection mode may reach ~96–128 px, but only on demand;
- do not put the timeline in a large standalone card with header, padding and footer.

Prefer a slim rail attached to the map/plot bottom edge or directly below it.

## Anatomy

Compact timeline should contain:
1. direct `latest/live` action;
2. previous/play-pause/next controls or equivalent keyboard-friendly controls;
3. time rail with one semantic slot per data frame;
4. exact selected valid time text;
5. subtle source/fact-nowcast boundary when relevant;
6. loading/error state on the affected frame;
7. optional playback speed in secondary/overflow control.

Do not mix playback speed with meteorological time interval.

## Every frame has temporal identity

Each available/missing/pending frame owns an exact timestamp.

At minimum:
- selected frame is always labeled with exact date/time;
- latest/current boundary is labeled;
- date change is labeled;
- major ticks are always visible;
- every frame exposes exact time on hover and keyboard focus;
- if enough width exists, label every frame directly;
- if labels would overlap, do not silently remove temporal meaning: use a horizontally scrollable/adaptive window, alternating label rows or reduced visible window while preserving every frame's accessible timestamp.

Never display anonymous dots whose times cannot be determined.

## Frame states

Represent distinct states:
- loaded/cached;
- selected-loaded;
- requested/loading;
- available-not-loaded;
- missing/not received;
- failed;
- stale/source-delayed;
- forecast/nowcast if sequence crosses observed boundary.

Color alone is insufficient. Shape, stroke, icon or text/tooltip must disambiguate states.

## Loading behavior

When selecting a new term:
1. selection marker moves immediately;
2. the target slot gets local pending indication;
3. previous valid map remains visible;
4. request begins/coalesces;
5. stale previous content may receive subtle `показан предыдущий кадр`/age indication if confusion is possible;
6. new frame replaces atomically when ready;
7. failure marks that slot and offers retry without losing selection/history.

Do not clear the map and show a global spinner between every frame.

If progress is determinate, use slot/range progress. If not, a compact spinner/pulse around the selected marker is enough. Avoid indefinite shimmer across the entire timeline.

## Gaps

A missing radar term must occupy its temporal position. Do not compress 18:10 → 18:30 into adjacent slots as if 18:20 never existed.

Show missing slot as gap/outlined marker with reason when known: `нет файла`, `источник задержан`, `декодирование не удалось`.

Do not interpolate missing observational frames unless the product explicitly provides interpolation and labels it as derived.

## Fact / nowcast boundary

Mark the temporal boundary at `now/latest observation`. Suggested compact treatment:
- thin vertical divider;
- subtle change in rail style;
- short labels `Факт` and `Прогноз/Nowcast` only once per region;
- different stroke/fill pattern for forecast slots.

The boundary should remain recognizable in grayscale.

## Interaction

### Pointer
- click slot: select term;
- wheel over timeline: move adjacent frames only when timeline intentionally has focus/hover policy; do not hijack page scrolling accidentally;
- drag/scrub: preview time continuously, expensive data request is debounced/coalesced; commit after short idle/release;
- drag must preserve 1:1 spatial relation with slots.

### Keyboard
- Left/Right: previous/next frame instantly;
- Shift+Left/Right or PageUp/PageDown: larger logical step if configured;
- Space: play/pause when timeline is active and not editing another field;
- Home or configured shortcut: latest observation/live;
- Esc: stop temporary scrub/playback mode if applicable.

Do not animate keyboard selection movement.

## Rapid stepping and request policy

Rapid repeated navigation must not launch an unbounded request per frame.

Use:
- immediate visual selection;
- short debounce for expensive fetch/render;
- cancellation/revision token for obsolete requests;
- neighbor prefetch around current frame;
- cache loaded frames;
- latest-request-wins update rule.

Suggested prefetch: at least previous/next 1–2 frames when memory allows; expand based on playback direction.

## Playback

Separate:
- data interval, e.g. 5/10/15 min;
- playback wall-clock speed, e.g. 1/2/4 frames per second.

Default behavior:
- play from selected frame;
- pause at end or optionally loop if explicitly enabled;
- manual scrub/selection pauses playback unless product has a clear alternative contract;
- if next frame is not ready, do not silently lie about continuity. Either wait with local loading or skip with explicit skipped/gap indication according to product policy;
- preserve exact selected time during playback.

Animations between radar frames should generally be direct crossfade or no transition; long morphing introduces false meteorological motion.

## Label density algorithm

Base label density on available pixel width and locale-formatted text width, not a fixed “every N ticks” rule.

Priority labels:
1. selected time;
2. latest/current;
3. hour boundaries;
4. date boundaries;
5. remaining slots as space permits.

When the user zooms/expands timeline, reveal more direct labels. When compact, every hidden label remains available on hover/focus.

## Anti-patterns

- Timeline height 150–300 px for a simple frame sequence.
- Large date cards for every frame.
- Selected time visible only in tooltip.
- Spinner centered over the whole map for each term.
- Anonymous progress with no target timestamp.
- Missing frames collapsed out of time.
- Playback that changes data interval when user only changed speed.
- Smooth interpolation that visually invents radar echoes.
- Tiny dots with no focus/keyboard semantics.
- Auto-jumping back to latest while user is reviewing history.

## Acceptance tests

Test:
- 6, 24, 72 and 200-frame sequences;
- 5/10/15-minute spacing;
- midnight/date boundary;
- observed→nowcast boundary;
- one and multiple missing frames;
- slow frame load;
- failed frame + retry;
- rapid Left/Right presses;
- fast drag scrub;
- playback with uncached future frames;
- resize from wide monitor to narrow window;
- keyboard-only use.
