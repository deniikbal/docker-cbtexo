# exocbt-docker
ExtraOrdinaryCBT for Docker (Unofficial)

### ExtraOrdinaryCBT Official :
[![Website](https://img.shields.io/badge/🌐Website-%23000000.svg?logo=Site&logoColor=white)](https://ekstraordinary.com/)
[![Email](https://img.shields.io/badge/Email-%23000000.svg?logo=Gmail&logoColor=white)](mailto://wandinak17@gmail.com)
[![Github](https://img.shields.io/badge/Github-%23000000.svg?logo=Github&logoColor=white)](https://github.com/shellrean)
[![Youtube](https://img.shields.io/badge/Youtube-%23000000.svg?logo=Youtube&logoColor=white)](https://www.youtube.com/@extraodev)

### Docker Maintener :
[![Github](https://img.shields.io/badge/Github-%23000000.svg?logo=Github&logoColor=white)](https://github.com/itnsapurbalingga)
[![Youtube](https://img.shields.io/badge/Youtube-%23000000.svg?logo=Youtube&logoColor=white)](https://youtube.com/@inginkuliah)
[![Tiktok](https://img.shields.io/badge/Tiktok-%23000000.svg?logo=Youtube&logoColor=white)](https://tiktok.com/@inginkuliah)
[![Trakteer](https://img.shields.io/badge/Trakteer-%23000000.svg?logo=buy-me-a-coffee&logoColor=white)](https://trakteer.id/inginkuliah)


## Deskripsi
Repositori ini berisi Docker Compose untuk menjalankan ExtraOrdinaryCBT dalam kontainer Docker. Ini memudahkan penggunaan ExtraOrdinaryCBT dalam lingkungan yang terisolasi dengan cepat dan mudah.

## Persyaratan
- Docker
- Docker Compose

## Cara Penggunaan
1. Klon repositori ini:
   ```bash
   git clone https://github.com/smkn1kejobong/exocbt-docker.git
   cd exocbt-docker
   ```

2. Edit .env file
   Agar service app berjalan, perlu dilakukan modifikasi pada file .env
   ```
   SERVER_SECRET_LICENSE_KEY=LISENSI_KAMU
   ```
   Untuk custom expose port, Misalkan
   ```
   APP_EXPOSE=8080
   DB_EXPOSE=5436
   SERVER_ASSET_URL=http://ip-or-domain:PORT
   ```
   Ganti `PORT` dengan value dari APP_EXPOSE

3. Jalankan Docker Compose:
   ```bash
   docker compose up -d
   ```
   Perintah ini akan membangun dan menjalankan semua layanan yang diperlukan dalam mode detached.

4. Akses web interface ExtraOrdinaryCBT pada:
   ```
   http://ip-or-domain:PORT
   ```
   Ganti `PORT` dengan value dari APP_EXPOSE

## Membersihkan
!!! Data pada container akan hilang !!!

Untuk menghentikan dan menghapus semua kontainer yang terkait dengan layanan ini, jalankan:
```bash
docker compose down
```

## Lisensi
Isi dari repositori ini dilisensikan di bawah Lisensi MIT, lihat file LICENSE untuk lebih jelasnya.
