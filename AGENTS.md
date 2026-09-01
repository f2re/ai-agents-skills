# Правила развития AI Agents Skills

Этот репозиторий — библиотека инженерных инструкций для coding agents. Общие interaction-принципы переиспользуются между доменами, но platform/domain semantics подключаются только по фактическому проекту.

При создании или изменении skill:

1. Не превращай субъективное впечатление в правило. Отделяй универсальный принцип, продуктовый контракт и локальное предпочтение.
2. Любое правило должно быть сформулировано как действие агента и, где возможно, иметь проверяемый критерий.
3. Для UI обязательно описывай пользовательский intent, trigger, immediate feedback, pending, success, partial/error, cancellation/recovery и keyboard path.
4. В каждом skill должны быть явные `Patterns` и `Anti-patterns` или эквивалентные разделы.
5. Не переносить web/mobile/Qt-компоненты буквально между стеками. Переносить interaction principle и затем отображать его на фактические primitives проекта.
6. Не добавлять декоративную анимацию без purpose/frequency анализа. Частые и keyboard-driven действия должны быть мгновенными или почти мгновенными.
7. Для профессионального интерфейса сначала оптимизировать понимание, плотность и скорость работы, потом декоративность.
8. Метеорологические данные всегда должны иметь явную временную семантику, источник/модель/цикл, статус свежести и состояние загрузки.
9. Если метеоинтерфейс меняет данные вследствие zoom/time/navigation, сохранять пространственный и временной контекст, отменять устаревшие запросы и не блокировать уже доступные данные.
10. В document-automation интерфейсе сохранять явную идентичность источника/шаблона/версии/контекста выпуска и результата; минимализм не должен скрывать provenance, expected output или stale/current state.
11. Browser preview документа является projection, а не источником истины для Office. DOM selector, HTML/CSS и pixel geometry не заменяют server-validated Document IR/binding coordinates и не сериализуются обратно в DOCX/XLSX без отдельного безопасного контракта.
12. Для document generation любой preflight/preview привязан к входной revision; изменение template/audience/mode/relevant data обязано инвалидировать устаревший результат до запуска.
13. Для extraction/import automatic proposal и user corrections разделены; preview/read не создаёт user data. Ошибки рождаются machine-readable с row/column/raw value/action и не восстанавливаются regexp-ом из локализованного текста.
14. Offline/local web проекты не переводить на Qt или новый frontend framework только потому, что библиотека содержит соответствующий skill. Реальный stack, CSP, tokens, offline constraints и project-local architecture имеют приоритет.
15. Любой новый skill должен быть добавлен в `.agents/skills/README.md` и при необходимости в agent compositions.
16. Существенный новый/redesigned primary UI surface должен пройти concept gate (`anti-slop-ui-direction`) до implementation routing; не применять этот ритуал к локальным правкам с уже определённым interaction concept.
17. Anti-slop — decision system, не визуальный стиль: genericity/templateability tests применяются к organizing logic и primary work surface, а не для изобретения нестандартных замен обычным platform controls.
18. Интеграция в существующий репозиторий обязана быть project-first: не переписывать `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `DESIGN.md`, локальные skills/agents/rules ради регистрации пакета; сначала inventory и authority map, затем native discovery, а semantic merge — только минимальный и обоснованный.

## Docomator profile

При работе с Docomator-подобным продуктом сначала проверить фактический проект. Для текущего Docomator canonical interaction spine — `Данные → Шаблон → Выпуск → Результат`; пространство — persistent context, а не дополнительный wizard step. Визуальный template editor организуется вокруг document canvas + contextual inspector; generation — вокруг exact composition/preflight/result; extraction — automatic-first с focused correction.

Конкретная реализация Docomator — local offline web UI. Использовать `offline-web-interface-engineering`, а не `qt-cpp-design-system`, если проект сам не изменил stack. Проверять 320/768/1440, 200% text zoom, keyboard/focus, light/dark, reduced motion, отсутствие page-level horizontal overflow и внешних runtime assets.
