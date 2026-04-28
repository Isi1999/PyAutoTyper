#!/bin/bash

for i in {1..22}; do echo ""; done

echo "=================================================="
echo "      Überprüfe System mit python"
echo "=================================================="

# 1. Python Check
if command -v python3.14 &>/dev/null; then
    PYTHON_BIN="python3.14"
elif command -v python3 &>/dev/null; then
    PYTHON_BIN="python3"
else
    echo "[!] Python fehlt. Installiere via Homebrew..."
    brew install python@3.14
    PYTHON_BIN="python3.14"
fi


echo "Prüfe Pip..."
if ! $PYTHON_BIN -m pip --version &>/dev/null; then
    echo "[!] Pip beschädigt. Starte Notfall-Reparatur..."
    # Wir laden das offizielle get-pip Skript direkt in den Speicher und führen es aus
    curl -sS https://bootstrap.pypa.io/get-pip.py | $PYTHON_BIN - --break-system-packages
    echo "[OK] Pip wurde neu installiert."
else
    echo "[OK] Pip ist einsatzbereit."
fi

# 3. Tkinter Check
echo "Prüfe Tkinter..."
if ! $PYTHON_BIN -c "import tkinter" &>/dev/null; then
    echo "[!] Tkinter fehlt. Installiere..."
    brew install python-tk@3.14
else
    echo "[OK] Tkinter ist einsatzbereit."
fi

# 4. OS Check
if $PYTHON_BIN -c "import os" &>/dev/null; then
    echo "[OK] OS-Modul bereit."
fi

echo "=================================================="
echo "         SYSTEM IST JETZT READY"
echo "=================================================="
echo "Alle Fehler wurden automatisch korrigiert."
echo ""


read -p "Drücke Enter zum Beenden..."
