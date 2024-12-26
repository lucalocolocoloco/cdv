#!/bin/bash

# Ubah direktori ke /home/coder/project
cd /home/coder/project

# Membuat pengguna baru 'xb' tanpa password dan menambahkannya ke grup 'sudo'
if ! id -u xb &>/dev/null; then
    sudo adduser --disabled-password --gecos "" xb
    sudo usermod -aG sudo xb
fi

# Membuat virtual environment Python jika belum ada
if [ ! -d "v" ]; then
    python3 -m venv v
fi

# Aktivasi virtual environment
source v/bin/activate 

# Menginstal paket Python jika belum terinstal
if ! pip show pyautogui &>/dev/null; then
    pip install pyautogui 
fi

# Menunggu selama 4 detik untuk memastikan proses lain siap
sleep 4

# Memulai Bash terminal interaktif
exec bash
