#!/bin/sh

clear

show_ip() {
    printf "== Local IP ==\n"
    if command -v ip >/dev/null 2>&1; then
        i=$(ip route get 1.1.1.1 2>/dev/null | awk '/src/ {print $7; exit}')
        [ -z "$i" ] && i=$(ip addr show | awk '/inet / && $2 !~ /^127/ {print $2; exit}' | cut -d/ -f1)
    elif command -v ifconfig >/dev/null 2>&1; then
        i=$(ifconfig | awk '/inet / && $2 != "127.0.0.1" {print $2; exit}')
    else
        i="n/a"
    fi
    printf "%s\n\n" "$i"
}

show_pub() {
    printf "== Public IP ==\n"
    if ! command -v curl >/dev/null 2>&1; then
        printf "curl not found :(\n\n"
    else
        p=$(curl -s https://ifconfig.me)
        [ -z "$p" ] && p=$(curl -s https://ipinfo.io/ip)
        printf "%s\n\n" "$p"
    fi
}

show_dns() {
    printf "== DNS ==\n"
    if [ -f /system/build.prop ] || [ -n "$ANDROID_ROOT" ]; then
        d=$(getprop | grep 'net.dns' | awk -F': ' '{print $2}' | tr -d '[]')
        [ -z "$d" ] && d="n/a"
        printf "%s\n\n" "$d"
    elif [ -f /etc/resolv.conf ]; then
        d=$(grep '^nameserver' /etc/resolv.conf | awk '{print $2}')
        [ -z "$d" ] && d="n/a"
        printf "%s\n\n" "$d"
    else
        printf "n/a\n\n"
    fi
}

show_gw() {
    printf "== Gateway ==\n"
    if command -v ip >/dev/null 2>&1; then
        g=$(ip route | awk '/default/ {print $3; exit}')
    elif command -v route >/dev/null 2>&1; then
        g=$(route -n | awk '/^0.0.0.0/ {print $2; exit}')
    else
        g="n/a"
    fi
    printf "%s\n\n" "$g"
}

show_ip
show_pub
show_dns
show_gw