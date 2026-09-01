# Example ladder: radar / satellite timeline

## SLOP

- timeline in a large decorative card;
- generic slider with only relative position;
- play button plus a global spinner;
- next frame clears the map while loading;
- observed/nowcast/forecast frames look identical;
- gaps are compressed away.

## DECENT

- compact timeline with exact timestamps;
- play/pause, previous/next and current selection;
- local loading marker;
- readable map remains dominant.

## PROFESSIONAL

Defining mechanism: **FACT → NOW → FORECAST** with **STATE IS PART OF THE OBJECT**.

- observation, now boundary, nowcast and forecast are one continuous time navigation surface with explicit provenance;
- every frame has inspectable loaded/pending/missing/error state;
- selecting a pending frame acknowledges immediately while the last valid map stays visible;
- stale requests are cancelled/ignored when the selection moves on;
- temporal gaps remain honest;
- keyboard stepping is immediate; playback motion is interruptible;
- exact valid time is never replaced by an ambiguous "+1" or unlabeled slider position.

The timeline communicates data availability and provenance, not merely playback position.
