# Qt meteorological UI review checklist

Короткий проход перед завершением UI-задачи. Детали находятся в соответствующих skills.

## Пользовательский flow

- [ ] Для основных сценариев известны intent и expected result.
- [ ] Частые действия выполняются напрямую, без лишних dropdown/modal переходов.
- [ ] После каждого действия есть immediate feedback.
- [ ] Async операция имеет локальный pending state.
- [ ] Старый запрос не может перезаписать новый выбор.
- [ ] Back/Cancel/Retry сохраняют рабочий контекст.

## Иерархия и плотность

- [ ] Карта/график остаётся главным объектом.
- [ ] Редкие настройки не занимают постоянную большую панель.
- [ ] Отступы следуют общей шкале; нет случайных 5/7/13 px без причины.
- [ ] Нет лишних nested cards, borders и badges.
- [ ] Primary/secondary metadata различимы по иерархии.

## Контролы

- [ ] Frequent 2–4 mode choice — direct segmented/toggle, если помещается.
- [ ] Большие списки searchable.
- [ ] Internal IDs не являются основными labels.
- [ ] Combo/list полностью работает с keyboard.
- [ ] Активный tool/mode виден и после закрытия popup.

## Radar/satellite timeline

- [ ] Default высота примерно 44–64 px и не забирает существенную часть карты.
- [ ] Selected valid time всегда подписан текстом.
- [ ] Каждый frame имеет exact timestamp и доступен через label/hover/focus.
- [ ] Missing frames остаются на своих временных позициях.
- [ ] Fact/nowcast/forecast boundary различима.
- [ ] Loading показан на target frame; карта не очищается.
- [ ] Prev/next, latest/live, play/pause доступны напрямую.
- [ ] Left/Right/Space keyboard behavior предсказуем.
- [ ] Rapid scrub/step coalesces requests.

## Map

- [ ] Zoom происходит вокруг cursor.
- [ ] Mouse wheel и high-resolution trackpad нормализованы.
- [ ] Pan/zoom сохраняет time/selection.
- [ ] Semantic LOD change виден и имеет hysteresis.
- [ ] Fast wheel burst не основан на сыром количестве trackpad events.
- [ ] Loading layer не блокирует pan/zoom.

## Meteorological semantics

- [ ] Valid time виден.
- [ ] Forecast run/cycle/lead различимы.
- [ ] Model/source понятны человеку.
- [ ] Units видны и последовательны.
- [ ] Fresh/stale/partial/missing states различимы.
- [ ] Observed и forecast не смешаны визуально.
- [ ] Uncertainty имеет конкретное статистическое значение.

## Motion

- [ ] У каждой анимации есть purpose.
- [ ] Keyboard/high-frequency действия не имеют animation tax.
- [ ] Routine motion обычно <300 ms и использует общие tokens.
- [ ] Motion interruptible.
- [ ] Reduced motion поддержан.
- [ ] Radar/chart motion не создаёт ложных промежуточных данных.

## Accessibility/safety

- [ ] Primary workflow выполним keyboard-only.
- [ ] Focus видим.
- [ ] Цвет не единственный канал статуса.
- [ ] DPI 100–200% не ломает layout.
- [ ] Destructive actions не находятся рядом с частой навигацией без защиты.
