---
name: states-errors-and-recovery
description: Specify and implement loading, refreshing, stale, partial, empty, offline, error, cancelled and recovery states without destroying the user's working context.
---

# States, Errors and Recovery

Every data surface must define its state machine before implementation.

## Required states

Consider explicitly:
- initial/loading;
- loaded/fresh;
- refreshing;
- stale but usable;
- partial;
- empty-valid;
- unavailable/offline;
- error;
- cancelled;
- permission/auth required where applicable.

Do not collapse all non-success states into one spinner or “Нет данных”.

## Loading hierarchy

### Small/local operation
Spinner or progress inside/next to the affected control.

### Content shape known
Skeleton only if it preserves layout and reduces perceived jump. Do not skeletonize dense maps/plots into fake chart bars.

### Determinate multi-stage work
Progress with stage text: `Загрузка 3/12`, `Декодирование`, `Построение продукта`.

### Data navigation
Keep previous valid map/plot visible and mark selected target as loading. Replace atomically when ready.

## Stale data

Stale data is often better than blank data in operations. Show age/freshness and reason. Never visually present stale as fresh.

## Partial data

If one model/layer/parameter fails, keep available data. Identify missing part locally and provide retry if meaningful.

## Error messages

An actionable error states:
1. what failed;
2. scope/impact;
3. whether existing data is still usable;
4. next available action.

Avoid raw exception strings as primary user copy, but preserve diagnostic detail in expandable logs/copy details.

## Empty states

Distinguish:
- no data exists for this range;
- filters removed all results;
- source has not arrived yet;
- user has not configured/imported anything.

Each needs a different next action.

## Request races

Tag requests by selection/revision. Ignore/cancel outdated completions. Rapid timeline scrubbing or map zoom must not queue dozens of expensive renders.

## Anti-patterns

- Fullscreen spinner for one layer.
- Blank map between every timeline frame.
- Generic “Ошибка загрузки” without affected source/time.
- Retry that resets filters/selection.
- Error modal repeated every refresh interval.
- Loading indicator after content is already ready because animation must finish.

## Acceptance

Simulate slow network/disk, missing frame, source timeout, rapid selection changes, offline mode and recovery. Confirm user context remains stable.
