#!/bin/bash

cd "$(dirname "$0")"

echo "========================================"
echo "       TEXT IN MAIN.PY ÄNDERN"
echo "========================================"

echo "Welcher Text soll in der main.py stehen?"
read -p "> " NEUER_TEXT

# Prüfen, ob main.py existiert
if [ -f "main.py" ]; then
    # Wir suchen nach pyautogui.write('...') und ersetzen den Inhalt zwischen den ' '
    sed -i '' "s/pyautogui.write('.*')/pyautogui.write('$NEUER_TEXT')/" main.py
    
    echo "----------------------------------------"
    echo "[OK] Der Text wurde auf '$NEUER_TEXT' geändert."
else
    echo "[!] Fehler: main.py wurde nicht gefunden."
fi

echo ""
read -p "Drücke Enter zum Beenden..."