## AI Agents Skills integration

This file is project-specific design memory. For UI/product-interaction tasks, agents should combine these local decisions with the installed skill catalog rather than treating this document as a replacement for skills.

- Keep durable product/user/domain decisions here; keep generic UI patterns in skills.
- For substantial work-surface redesigns, record only the accepted defining operational idea, primary work object and invariants from the Design Direction Contract. Do not store rejected concepts or brainstorming transcripts.
- Describe core interactions as `intent → trigger → immediate feedback → pending → result → recovery → next action`.
- Record always-visible context, high-frequency actions, loading/stale/partial/error behavior, keyboard navigation and domain semantics.
- If a local decision intentionally conflicts with a generic skill, this project's explicit decision wins and should be dated/explained unless it violates correctness, accessibility or safety.
- Downstream implementation agents should preserve accepted Design Direction invariants or explicitly reopen the concept gate when new evidence requires a change.
- Do not load this document for unrelated backend/build/infrastructure work unless the task actually depends on its constraints.
