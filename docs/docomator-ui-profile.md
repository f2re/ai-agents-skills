# Docomator UI profile

Статус: профиль адаптации библиотеки skills под документную автоматизацию.

Проверенный baseline при создании профиля:

- `ai-agents-skills/main`: `ffd85b363f78d5ad0ecb5ff471add1c841b7c1f5`;
- `docomator/main`: `cfccc70d29385ae7715aeb8746711c9e1df310da`;
- Docomator UI: локальный offline web UI на HTML/CSS/JavaScript, не Qt;
- canonical Docomator visual direction: «Документный рабочий стол»;
- основной маршрут: `Данные → Шаблон → Выпуск → Результат`.

Перед применением профиль обязан заново читать фактический HEAD и project-local инструкции. Эти SHA — evidence исходной адаптации, а не разрешение игнорировать последующие изменения проекта.

## 1. Что переносится из исходной Qt/meteo библиотеки

Исходный набор силён не конкретными Qwt/радарными компонентами, а следующими interaction-механизмами:

1. **primary work object dominates chrome** — рабочий объект важнее панели настроек;
2. **Interaction Recomposition** — несколько технических selectors переосмысливаются вокруг одной пользовательской задачи;
3. **context preservation** — изменение выбора не сбрасывает несвязанный рабочий контекст;
4. **local pending/stale truth** — новая загрузка не превращает весь экран в пустой spinner и не позволяет устаревшему ответу переписать текущий выбор;
5. **direct manipulation where natural** — пользователь действует непосредственно над временной шкалой/картой/объектом, а не настраивает косвенные поля;
6. **purpose/frequency motion** — частое действие почти мгновенно, анимация объясняет только состояние/пространственную связь;
7. **anti-slop concept gate** — primary surface организуется предметной задачей, а не стандартным dashboard template;
8. **progressive disclosure** — редкая сложность не занимает постоянное место;
9. **domain truth over visual minimalism** — нельзя скрывать критичный provenance ради «чистоты».

Именно эти механизмы адаптируются. Карта, forecast timeline, model/run/lead, radar playback, Qwt и Qt widgets в Docomator не переносятся как UI-метафоры.

## 2. Карта соответствий: метео → документы

| Исходный паттерн | Документная адаптация | Что нельзя переносить буквально |
|---|---|---|
| Map/plot is primary work surface | Document/template canvas или generation plan является primary work object | Не превращать документ в карту с плавающими слоями/легендой |
| Valid-time spine | `Данные → Шаблон → Выпуск → Результат` и локальные этапы `Документ → Поля → Проверка → Готово` | Не делать scrubber/timeline для дискретных этапов, если обычная навигация яснее |
| Model/source/cycle provenance | Template/source/version, current space, audience snapshot, result identity | Не показывать SHA/UUID как основной label |
| Fresh/stale data | Current/stale visual layout, preview, preflight, extraction result revision | Не оставлять старую проверку зелёной после изменения входов |
| Layer inspector | Contextual binding/field/repeat inspector выбранного места документа | Не держать огромную постоянную панель всех полей рядом с документом |
| Crosshair/linked plots | Source-linked highlight: выбранный extracted field ↔ исходный paragraph/cell/row | Не сохранять DOM/pixel coordinate как source truth |
| Scrub/direct manipulation | Выделение текста/ячейки/строки, drag selection, reorder повторяемых данных | Core action не может быть gesture-only |
| Forecast uncertainty | Structured ambiguity: `готово / нужно проверить / не определено` | Не спамить confidence percentages без действия |
| Local async layer load | Local validation/preview/trial/pending state | Не блокировать весь рабочий стол из-за одной проверки |
| Operational hazard priority | Attention order: blocking error → partial/retry → running → completed | Не использовать яркие warning colors как декор |

## 3. Выбранная organizing idea

**Документный рабочий стол строится вокруг текущего документа/выпуска и его маршрута, а настройки появляются рядом с выбранным объектом только когда нужны.**

Это определяющий механизм профиля.

Он означает:

- Главная не является KPI dashboard;
- Visual Template Studio организован вокруг документа, а не вокруг списка backend bindings;
- «Создать документы» организован вокруг проверяемой композиции будущего результата;
- extraction/import сначала показывает найденную структуру, затем просит исправить только неоднозначность;
- Результаты — реестр фактических операций/файлов, а не набор decorative cards;
- пространство постоянно видно как context, но не становится ещё одним обязательным шагом каждого процесса.

## 4. Design Direction для ключевых surfaces

### 4.1. Главная / навигация

Основной вопрос: «Что мне нужно сделать, чтобы получить документы?»

Показывать:

- current task/next action;
- маршрут `Данные → Шаблон → Выпуск → Результат` с фактическим состоянием;
- компактный current space;
- только действительно требующий внимания background status.

Не показывать:

- hero-иллюстрацию;
- KPI-плитки количества сущностей ради заполнения пространства;
- большую панель диагностики;
- одинаково яркие действия всех разделов.

### 4.2. Visual Template Studio

Основной вопрос: «Какое значение должно подставляться сюда?»

Work surface:

- большой document canvas;
- selection highlight;
- contextual inspector выбранного span/cell/row/range;
- field search по human labels;
- scalar/repeat semantics;
- trial/validation state.

Persisted truth:

- immutable source + server Document IR/binding coordinate;
- browser DOM/HTML/CSS — только projection;
- source revision защищает от stale selection commit.

### 4.3. Создать документы

Основной вопрос: «Что именно сейчас будет сформировано?»

Primary summary:

`template + audience + mode → exact expected result`

Пример:

`27 сотрудников → 27 личных карточек`

Preflight — реальный revision-bound check. Изменение template/audience/mode/relevant data инвалидирует старый check. Missing values исправляются без потери подготовленного выпуска.

### 4.4. Extraction / import

Основной вопрос: «Что система поняла из документа и что требуется поправить?»

Default:

- upload/drop;
- automatic proposed structure;
- `Готово / Нужно проверить / Не определено`;
- source-linked correction;
- structured row/cell problem;
- explicit `Импортировать` только после review.

Automatic result immutable; corrections separate. Preview/read не создаёт user properties/entities.

### 4.5. Повторяемые таблицы/коллекции

Основной вопрос в данных: «Какие строки принадлежат этому объекту и в каком порядке?»

Основной вопрос в template editor: «Повторять эту строку по какому списку и чем заполнять ячейки?»

Pattern:

- table/register editor;
- auto row number as derived value;
- add/duplicate/delete/reorder;
- paste/import with preview;
- selected template row → `Повторять эту строку по списку`;
- map cells to collection fields;
- trial N rows;
- explicit empty behavior.

Не показывать `@row_number`, collection key или schema version как обязательный пользовательский ввод.

## 5. Interaction Recomposition для Docomator

Перед сохранением нескольких controls спросить, какую одну работу они выполняют.

### Generation cluster

Плохой технический вариант:

```text
Template [▼] Group [▼] Mode [▼] [Validate] [Refresh] [Generate]
```

Целевой смысл:

```text
Шаблон: Приказ о назначении
Получатели: Отдел разработки · 27 человек
Результат: 27 документов

[Проверить и сформировать]
```

Редкие изменения остаются доступны через обычные selectors, но derived count/preflight status не становятся дополнительными controls.

### Template binding cluster

Плохой вариант:

```text
Element ID [▼] Field key [▼] Binding type [▼] [Apply]
```

Целевой смысл:

```text
<выделение непосредственно в документе>
→ inspector: «Что подставлять сюда?»
→ поиск поля по названию
→ server-confirmed binding
```

### Extraction review cluster

Плохой вариант:

```text
Document type [▼] Parser [▼] Table index [▼] Mapping [Configure]
```

Целевой смысл:

```text
<файл>
→ «Мы нашли 2 набора данных»
→ review только 3 неоднозначных мест
→ explicit import
```

## 6. Motion contract

### Мгновенно

- keyboard navigation;
- selection/highlight документа;
- row/cell focus;
- selected state;
- изменение локального текста состояния после server confirmation.

### Короткий transition допустим

- inspector/popover open/close, если помогает понять источник;
- disclosure проблемной строки;
- pending → success/error swap;
- drop target feedback.

Обычная длительность берётся из project tokens; для текущего Docomator routine transition около 120–160 ms.

### Запрещено по умолчанию

- button scale/bounce;
- staged entrance всего экрана;
- «лист улетает в архив»;
- page flip;
- pulsing logo/document icon;
- endless decorative shimmer;
- задержка результата ради animation completion;
- animation of keyboard selection;
- global `transition: all`.

`prefers-reduced-motion` удаляет необязательное пространственное движение.

## 7. Visual language

Переносим не macOS skin, а desktop interaction discipline:

- одна доминирующая primary action;
- системная типографика;
- спокойные нейтральные surfaces;
- thin borders вместо card shadows;
- document/register rows вместо dashboard tiles;
- compact controls с достаточным hit area;
- familiar platform controls;
- progressive disclosure;
- dark/light/system с одной семантикой;
- no gradients/glass/AI sparkles/giant pills.

Для Docomator canonical token source остаётся project `brand-tokens.css`. Skill не создаёт параллельную palette.

## 8. Responsive/reflow strategy

Проверять отдельно:

- 320 px;
- 768 px;
- 1440 px;
- 200% text zoom;
- long Russian labels/values.

Правила:

- page-level horizontal overflow запрещён;
- explicit document/table component может иметь bounded two-dimensional scroll;
- desktop sidebar может стать bottom navigation согласно project contract;
- inspector на narrow surface меняет расположение/форму, а не просто сжимается;
- action groups wrap/recompose;
- не применять global `nowrap`/`flex-shrink:0` к action controls;
- 44×44 target contract сохраняется.

## 9. Offline/security implementation

Current Docomator profile предполагает local offline web stack.

- no CDN/remote fonts/analytics/assets;
- no new frontend framework without demonstrated product need;
- document text is untrusted data, not HTML;
- no DOM→OOXML serialization;
- no LLM-driven arbitrary code/path/SQL/OOXML;
- state comes from real API/persisted operations;
- no fake progress timer;
- space isolation and explicit mutation boundaries remain backend-enforced even when UI is simple.

## 10. Skill routing

Use the smallest set:

- document IA / main surface → `document-workstation-ux`;
- template visual binding → `document-template-canvas-and-binding`;
- generation/preflight/retry → `document-generation-flow`;
- extraction/import → `document-extraction-and-import-review`;
- Docomator implementation/reflow/CSP → `offline-web-interface-engineering`;
- overloaded controls → `dense-controls-and-selection`;
- staged complexity → `workflow-and-progressive-disclosure`;
- async/recovery → `states-errors-and-recovery`;
- motion → `motion-feedback-and-microinteractions`;
- material completion → `ui-audit-and-acceptance`.

Do not load all of them for a local fix.

## 11. Acceptance target

A successful Docomator UI change lets a user without internal-system knowledge:

1. understand location/current space and next action;
2. add/import data and repair a concrete row/cell problem without re-upload;
3. open a DOCX/XLSX template and assign a field by selecting the document itself;
4. configure a supported repeated row/list without machine keys;
5. trial/validate the template;
6. prepare generation and see exact expected result count;
7. correct missing data without losing the composition;
8. launch once and safely navigate away while persisted work continues;
9. find partial/completed results and retry only what failed when supported;
10. complete the flow by keyboard and at 320/768/1440 + 200% zoom + dark/light + reduced motion;
11. do all runtime work offline and without trusting document/LLM content as executable input.

Use [`docomator-ui-review-checklist.md`](docomator-ui-review-checklist.md) for the detailed review gate.

## Installing this branch profile

Until the profile is merged into `main`, install the branch explicitly:

```bash
export AI_AGENTS_SKILLS_REF=docomator-ui-profile
curl -fsSL https://raw.githubusercontent.com/f2re/ai-agents-skills/docomator-ui-profile/install.sh | bash
ai-skills doctor
```

For an existing Docomator checkout, use the normal project-first integration flow after installation:

```bash
ai-skills integrate /path/to/docomator --plan
ai-skills integrate /path/to/docomator --vendor
```

Project-local `AGENTS.md`, design documents and existing skills remain authoritative.
