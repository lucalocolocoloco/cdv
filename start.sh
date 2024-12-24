#!/bin/bash
# Ubah direktori ke /home/coder/project
cd /home/coder/project

# Membuat pengguna baru 'fbbot' tanpa password dan menambahkannya ke grup 'sudo'
sudo adduser --disabled-password --gecos "" xb
sudo usermod -aG sudo xb

# Membuat virtual environment Python
python3 -m venv v 
source v/bin/activate 

# Menginstal paket Python dan Node.js
pip install pyautogui 


# Mulai code-server tanpa otentikasi pada port 8080
echo "Starting Tmate.."
tmate -F . &

# Tunggu selama 10 detik agar code-server siap
sleep 4

# Mencegah script keluar dan container berhenti
echo "tmate is running. Keeping the container alive..."
tail -f /dev/null
