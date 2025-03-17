# async_load

## W5: Soal 2

![Capture Hasil Praktikum 1 Soal 2](./assets/soal2.png)

## W5: Soal 3

### Penjelasan Langkah 5

- `substring(0, 450)` digunakan untuk memotong dan menyimpan hanya 450 karakter pertama dari respons yang diterima.
- `catchError` digunakan untuk menangani kemungkinan error dalam proses asynchronous dan memberikan pesan kesalahan yang dapat ditampilkan kepada pengguna.

![Capture Hasil Praktikum 1 Soal 2](./assets/soal3.gif)

## W5: Soal 4

### Penjelasan Langkah 1 & 2

- Fungsi `count()` menghitung jumlah total dari tiga nilai (1, 2, dan 3), masing-masing diproses dengan penundaan 3 detik menggunakan Future.delayed().
- Fungsi `async()` dipanggil secara berurutan, menunggu satu sama lain untuk menyelesaikan, dan akhirnya memperbarui UI dengan hasil yang dihitung.

![Capture Hasil Praktikum 1 Soal 2](./assets/soal4.gif)
