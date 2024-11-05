**_Disusun oleh Ignasius Bramantya Widiprasetya - 2306245604 - PBP F_**

## Tugas 7

### 1) Jelaskan apa yang dimaksud dengan Stateless Widget dan Stateful Widget, dan jelaskan perbedaan dari keduanya.
* **Stateless Widget** adalah widget yang tidak dapat berubah setelah dibangun. Artinya, semua nilai dan tampilan pada widget ini bersifat tetap selama aplikasi berjalan. Cocok untuk elemen UI yang tidak memerlukan pembaruan, seperti teks statis atau ikon.
* **Stateful Widget** adalah widget yang dapat berubah selama aplikasi berjalan. Dengan kata lain, widget ini memiliki "state" atau keadaan yang dapat diubah, sehingga cocok untuk komponen yang interaktif atau memerlukan pembaruan, seperti tombol yang berubah warna saat ditekan.

*Perbedaan utama*: Stateless widget tidak menyimpan data yang berubah, sedangkan stateful widget dapat menyimpan data yang bisa diubah selama runtime menggunakan mekanisme state management.

### 2) Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Pada proyek ini, beberapa widget yang digunakan antara lain:
   - **Scaffold**: Struktur dasar layar aplikasi, menyediakan layout untuk AppBar, Body, dan FloatingActionButton.
   - **AppBar**: Header bagian atas yang biasanya berisi judul dan menu navigasi.
   - **Text**: Menampilkan teks di layar.
   - **Column/Row**: Untuk menata widget secara vertikal (Column) atau horizontal (Row).
   - **Padding**: Menambahkan jarak atau ruang di sekitar widget.
   - **Center**: Menempatkan widget di tengah layar.

Setiap widget memiliki peran dalam membangun tampilan aplikasi dan memudahkan pengaturan tata letak serta interaksi pengguna.

### 3) Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` digunakan pada Stateful Widget untuk memberi tahu Flutter bahwa ada perubahan state yang perlu diperbarui pada UI. Dengan memanggil `setState()`, Flutter akan merender ulang bagian widget yang terdampak, sehingga perubahan tampilan langsung terlihat. Variabel yang dapat terdampak adalah variabel yang disimpan dalam state widget, seperti teks, warna, atau data yang berubah saat aplikasi berjalan.

### 4) Jelaskan perbedaan antara const dengan final.
* **const** digunakan untuk nilai tetap yang sudah diketahui sejak kompilasi dan tidak akan berubah. Variabel `const` bersifat immutabel dan diinisialisasi pada waktu kompilasi.
* **final** digunakan untuk nilai yang hanya diinisialisasi sekali dan tidak bisa diubah, tetapi nilainya bisa ditentukan pada runtime, bukan hanya kompilasi.

### 5) Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
- **Membuat Program Flutter Baru**: Saya membuat proyek Flutter baru dengan tema E-Commerce, sebagai dasar untuk mengembangkan fitur-fitur yang sesuai dengan checklist tugas.
- **Menambahkan Tiga Tombol dengan Ikon dan Teks**: Saya menambahkan tiga tombol menggunakan widget `ElevatedButton`, lengkap dengan ikon dan teks untuk setiap fungsi:
  - **Lihat Daftar Produk**
  - **Tambah Produk**
  - **Logout**

   Setiap tombol memiliki label yang sesuai untuk memudahkan pengguna.

- **Mengimplementasikan Warna Berbeda untuk Setiap Tombol**: Menggunakan properti `style` pada setiap `ElevatedButton`, saya memberikan warna yang berbeda untuk setiap tombol:
  - `Lihat Daftar Produk`: Warna Merah
  - `Tambah Produk`: Warna Biru
  - `Logout`: Warna Hijau
   
   Penggunaan warna ini bertujuan untuk membedakan fungsi setiap tombol dengan lebih jelas.

- **Memunculkan Snackbar**: Saya menambahkan fungsi `onPressed` di setiap tombol untuk menampilkan `Snackbar` dengan pesan tertentu. Contoh implementasi untuk tombol "Lihat Daftar Produk":

   ```dart
   onPressed: () {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text("Kamu telah menekan tombol Lihat Daftar Produk")),
     );
   }