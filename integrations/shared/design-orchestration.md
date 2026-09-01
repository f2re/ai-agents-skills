## AI Agents Skills integration

This file is project-specific design memory. For UI/product-interaction tasks, agents should combine these local decisions with the installed skill catalog rather than treating this document as a replacement for skills.

- Keep durable product/user/domain decisions here; keep generic UI patterns in skills.
- Describe core interactions as `intent → trigger → immediate feedback → pending → result → recovery → next action`.
- Record always-visible context, high-frequency actions, loading/stale/partial/error behavior, keyboard navigation and domain semantics.
- If a local decision intentionally conflicts with a generic skill, this project's explicit decision wins and should be dated/explained.
- Do not load this document for unrelated backend/build/infrastructure work unless the task actually depends on its constraints.
