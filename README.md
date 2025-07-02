# IP & DNS Info Tool

A chill little shell script to show your local IP, public IP, DNS, and gateway. Works on Linux, Termux, and most shells. No root needed.

## What it does
- Shows your local IP (the one your device has on your network)
- Shows your public IP (the one the internet sees)
- Shows your DNS servers
- Shows your default gateway

## How to run
1. Save the script as `ip_dns_info.sh`
2. Make it executable:
   ```sh
   chmod +x ip_dns_info.sh
   ```
3. Run it:
   ```sh
   ./ip_dns_info.sh
   ```

## What you see
- `== Local IP ==` — your device's IP on your network
- `== Public IP ==` — your internet IP (uses curl)
- `== DNS ==` — DNS servers your system uses
- `== Gateway ==` — your default gateway (router IP)

## Notes
- Needs `curl` for public IP (warns if missing)
- Works on Linux, Termux, and most shells
- No root needed
- Uses short variable names like `i`, `p`, `d`, `g` and simple functions like `show_ip`, `show_pub`, etc.

---

Dont Forget To Add As Star!
