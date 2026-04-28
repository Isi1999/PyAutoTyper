import os

def text_ersetzen():
    datei_name = "main.py"
    
    # 1. Benutzereingabe abfragen
    neuer_text = input("Welcher Text soll in der main.py stehen? ")
    
    # 2. Prüfen, ob die main.py im selben Ordner ist
    if not os.path.exists(datei_name):
        print(f"Fehler: {datei_name} wurde nicht gefunden!")
        return

    # 3. Datei einlesen
    with open(datei_name, "r", encoding="utf-8") as f:
        zeilen = f.readlines()

    # 4. Die Zeile suchen, die mit pyautogui.write beginnt
    neue_zeilen = []
    gefunden = False
    for zeile in zeilen:
        if "pyautogui.write(" in zeile and "#" not in zeile.split("pyautogui.write(")[0]:
            # Die Zeile wird ersetzt, wir behalten die Einrückung (Leerzeichen) bei
            einrueckung = zeile[:zeile.find("pyautogui.write(")]
            neue_zeilen.append(f"{einrueckung}pyautogui.write('{neuer_text}')\n")
            gefunden = True
        else:
            neue_zeilen.append(zeile)

    # 5. Datei speichern, falls die Zeile gefunden wurde
    if gefunden:
        with open(datei_name, "w", encoding="utf-8") as f:
            f.writelines(neue_zeilen)
        print(f"Erfolg! Der Text in {datei_name} wurde auf '{neuer_text}' geändert.")
    else:
        print("Konnte die entsprechende Zeile in main.py nicht finden.")

if __name__ == "__main__":
    text_ersetzen()