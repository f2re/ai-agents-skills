# UI/UX patterns and anti-patterns

Общий реестр. Domain-specific skills могут вводить более строгие правила.

| Задача | Паттерн | Антипаттерн |
|---|---|---|
| Несколько controls обслуживают одну частую операцию | Interaction Recomposition: intent → semantic axes → derived/rare state → новый единый interaction model | Чинить каждый dropdown/button отдельно |
| Частый выбор 2–4 режимов | Segmented control / toggle group, один клик | Прятать `Текущие/Архив`, `Факт/Прогноз` в combo |
| Переключение основных связанных content panes | Tabs / tab view | View combo или ряд несвязанных кнопок |
| Большой список моделей/станций | Searchable combo с вторичными метаданными | Огромная открытая панель или `identity/center/id` как основной label |
| Редкие фильтры/слои/настройки | Компактный summary + popover/inspector | Постоянная панель, отнимающая work surface |
| Настоящий упорядоченный диапазон | Slider/scrubber + точное значение/keyboard | Slider для категорий без естественного порядка |
| Длительная загрузка | Локальный pending status + сохранять предыдущие данные | Блокировать весь экран spinner-ом |
| Смена срока | Старый кадр остаётся до готовности нового + pending marker | Очищать карту/график между сроками |
| Ошибка одного слоя | Partial state, слой помечен, остальное работает | Общая modal error, уничтожающая контекст |
| Частое keyboard действие | Мгновенная реакция | 200–400 ms animation на Arrow/Space |
| Масштаб карты | Zoom под курсором + semantic LOD | Zoom вокруг центра; скрытая смена данных |
| Группировка | Proximity + alignment + shared heading | Карточка внутри карточки, рамка вокруг каждого поля |
| Статус | Текст/иконка/shape плюс цвет | Цвет как единственный канал |
| Motion | Origin/continuity/state | Bounce/tilt/glow в operator workflow |
| Пустое состояние | Причина + диапазон + следующее действие | Просто `Нет данных` |
| Таблица/график | Единицы рядом с осью/колонкой, tabular numerals | Единица в каждой ячейке или отсутствует |

## Корневые антипаттерны

### Control fragmentation

Несколько формально правильных controls могут вместе образовывать неправильную interaction model. Если пользователь для одного намерения обычно проходит `dropdown → dropdown → button → dropdown → apply`, аудит обязан проверить саму декомпозицию.

Алгоритм: сформулировать intent, разделить независимые semantic axes, убрать безопасно выводимые/derived controls, вынести редкие overrides в contextual disclosure, затем выбрать tabs/segmented/popover/slider/scrubber/toolbars по их семантике. Цель — минимум ненужных решений, а не минимум widgets.

### UI отражает структуру базы данных

Если пользователь думает «покажи осадки на 18:30», UI не должен заставлять отдельно выбирать internal product id, run key и dataset identity. Backend decomposition не является interaction architecture.

### Wrong primitive semantics

Количество вариантов не определяет control автоматически. Пять связанных main-content panes могут быть tabs; пять редких объектов — combo. Slider допустим для реального упорядоченного диапазона, а не для произвольных категорий. Segmented control подходит для компактных связанных режимов/действий, но не заменяет сложную навигацию.

### Скрытая click tax

Частое действие, требующее открыть dropdown, найти пункт и закрыть его, — дефект flow, если прямое переключение или direct manipulation уменьшает стоимость без потери ясности.

### State without feedback

После click/drag/wheel пользователь сразу понимает, принято ли действие. Асинхронное действие имеет immediate acknowledgement до результата.

### Surprise context change

Один жест — одна основная семантическая ось. Zoom, time, model и selected point не должны незаметно меняться вместе.

### Permanent secondary UI

Редкие filters/diagnostics/advanced settings не конкурируют с map/plot за постоянную площадь.

### Animation tax

Частые actions snap immediately; дополнительные 150–300 ms на повторяемом действии становятся систематической задержкой.

### Empty whitespace as pseudo-premium design

Профессиональный desktop UI не копирует mobile/marketing spacing. Воздух служит группировке, а не вытеснению данных из viewport.

### Generic template as product concept

Чистая сетка, карточки и хорошая типографика могут быть DECENT, но не являются interaction concept. Для primary work surface проверяется organizing logic; standard dialog/menu/table/combo/toolbar не обязаны быть уникальными.

### Apple-like as visual cargo cult

Apple-like означает semantic economy, content-first, direct manipulation, familiar controls и contextual disclosure. Это не обязательные glass/pills, огромные отступы, скрытые labels или анимация каждого действия.

### Anti-slop as cargo-cult

Anti-slop не означает универсальный запрет cards/animation/gradients. Correctness/safety rules, defaults-to-reject и allowed-with-justification остаются разными уровнями.
