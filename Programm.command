#!/bin/bash

# Wechselt in das Verzeichnis, in dem dieses Skript liegt
cd "$(dirname "$0")"

echo "========================================"
echo "      Starte Python Programm..."
echo "========================================"

# Prüft, ob main.py existiert
if [ -f "main.py" ]; then
    python3 main.py
else
    echo "[!] Fehler: main.py wurde in diesem Ordner nicht gefunden."
    echo "Stelle sicher, dass alle Dateien im selben Ordner liegen."
fi

echo ""
read -p "Drücke Enter zum Beenden..."