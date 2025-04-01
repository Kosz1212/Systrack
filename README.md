# Systrack

# 📈 **Projekt 2: Skrypt Bash do monitorowania zasobów systemu**

**Cel projektu:**  
Tworzysz skrypt Bash, który codziennie (np. co godzinę) automatycznie zbiera informacje o aktualnym stanie systemu Linux i zapisuje je do pliku CSV, dzięki czemu możesz łatwo analizować wykorzystanie zasobów w czasie.

**Wymagania techniczne (zbierasz minimum te dane):**

- Aktualna data i godzina pomiaru.
    
- Użycie CPU (%).
    
- Użycie pamięci RAM (użyta, wolna pamięć w MB).
    
- Użycie przestrzeni dyskowej (`/` główny katalog w % zajętości).
    
- Aktualna liczba zalogowanych użytkowników.
    
- Dane zapisujesz do jednego pliku CSV (`system_stats.csv`).
    

**Etapy realizacji:**

1. Napisz skrypt w Bash, który zbiera ww. informacje (użyj poleceń takich jak `date`, `top`, `free`, `df`, `who`).
    
2. Przetestuj skrypt ręcznie.
    
3. Ustaw automatyczne uruchamianie skryptu co godzinę przez `cron`.
    
4. Sprawdź poprawność działania (np. po 1 dniu zbierania danych).
    

**Kryterium sukcesu:**

- Dane systemowe są regularnie zbierane co godzinę i poprawnie zapisywane do pliku CSV.
    
- Łatwo możesz otworzyć CSV w arkuszu kalkulacyjnym (Excel lub Google Sheets) i analizować zebrane dane.
