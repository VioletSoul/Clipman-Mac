![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white)
![Terminal](https://img.shields.io/badge/Terminal-✓-black)
![Clipboard](https://img.shields.io/badge/Clipboard-✓-purple)
![fzf](https://img.shields.io/badge/fzf-✓-green)
![Homebrew](https://img.shields.io/badge/Homebrew-✓-orange)

# Clipman-Mac

User-friendly, терминальный менеджер буфера обмена для macOS.

---

## Зачем нужен Clipman-Mac?

В macOS нет штатного, удобного для терминала менеджера буфера обмена.  
Clipman-Mac решает эту задачу: это лёгкое, быстрое и простое решение, идеально интегрируемое в ваш терминальный рабочий процесс.

---

## Возможности

- Работа из терминала: полностью управляется из командной строки.
- История буфера обмена: хранит несколько последних копирований.
- Быстрый поиск: выбирайте нужную запись с помощью fzf.
- Минимализм: использует только стандартные утилиты macOS (pbcopy/pbpaste).
- Простая установка: всё работает после пары команд.

---

## Установка

1. Установите Homebrew (если ещё не установлен):

   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

2. Установите зависимости:

   brew install fzf

3. Скачайте скрипт:
```
   git clone https://github.com/yourusername/clipman-mac.git
   cd clipman-mac
```
4. Сделайте скрипт исполняемым (если нужно):
```
   chmod +x clipman.sh
```
5. Запустите скрипт:
```
   ./clipman.sh
```
---

## Использование

- Запускайте скрипт в терминале.
- Используйте поиск по истории буфера обмена через fzf.
- Выбранный элемент автоматически будет скопирован обратно в буфер обмена или выведен в терминал.

---

## Зависимости

- macOS
- Homebrew (для быстрой установки)
- fzf (fuzzy finder)
- pbcopy, pbpaste (стандартные утилиты macOS)

---

## Лицензия

MIT License

---

## Контакты

Вопросы и предложения — через Issues в репозитории или напрямую автору.

---

Пусть ваш буфер обмена всегда будет под рукой прямо в терминале!
