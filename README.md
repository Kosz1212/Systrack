# Systrack

📈 **System Resource Tracker – Bash-based Logging to CSV**

---

## 🖥️ About

**Systrack** is a lightweight Bash script that monitors key system metrics on a Linux machine and logs them to a CSV file. It is designed to run automatically (e.g., hourly), helping you track system behavior over time and analyze trends using spreadsheet tools like **Excel** or **Google Sheets**.

> 🐧 **Built and tested on [NixOS](https://nixos.org/)** – compatible with most other Linux distributions with minimal changes.

---

## 📊 What It Tracks

Each execution logs the following data:

- **Timestamp** – current date and time  
- **CPU usage** – as a percentage (calculated from idle)  
- **RAM usage** – used and free memory in megabytes  
- **Swap usage** – used and free swap memory  
- **Disk usage** – percentage used of the root (`/`) filesystem  
- **Logged-in users** – number of users currently logged in

📁 The data is stored in:

```bash
$HOME/Logs/Stats/system_stats.csv
```
Additionally, each run creates a timestamped log file in:

```bash
$HOME/Logs/
```
---
## ⚙️ Setup & Usage
1. Clone or copy the script to your machine

2. Make it executable:

```bash
chmod +x systrack.sh
```
3. Run manually to test:

```bash
./systrack.sh
```
---
## 🕒 Automate with systemd (recommended for NixOS)
To run the script automatically every hour, use a `systemd timer`:

`~/.config/systemd/user/systrack.service`
```ini
[Unit]
Description=Run system resource tracker

[Service]
Type=oneshot
ExecStart=%h/Dev/Monitoring/systrack.sh
```
`~/.config/systemd/user/systrack.timer`
```ini
[Unit]
Description=Run systrack.sh every hour

[Timer]
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target
```
Enable with:
```bash
systemctl --user daemon-reload
systemctl --user enable --now systrack.timer
```
## ✅ Example Output
```yaml
datetime,cpu_used_percent,ram_used_mb,ram_free_mb,swap_used_mb,swap_free_mb,disk_usage_percent,logged_users
2025-04-01 18:00:00,4.2,2056,5230,0,2047,32,1
```
## 📦 Dependencies
- Standard coreutils (`date`, `free`, `df`, `who`)
- `top` (from `procps`)
- `bc` (for float math)
- On NixOS, you may need to run the script inside a shell with:
```bash
nix-shell -p bc procps
```
