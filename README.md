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

## Tugas 8

### 1) Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?

#### Kegunaan `const` di Flutter

Dalam Flutter, kata kunci `const` digunakan untuk mendefinisikan **nilai atau objek konstan** yang tidak akan berubah selama runtime aplikasi. Objek yang dibuat dengan `const` bersifat **immutable** dan memiliki performa optimal karena mereka dapat dibagikan di seluruh aplikasi tanpa membuat instance baru.

#### Keuntungan Menggunakan `const`

1.  **Optimalisasi Performa**  
    Karena objek `const` hanya dibuat sekali (saat compile time), Flutter tidak perlu membuat instance baru dari objek tersebut saat runtime. Ini mengurangi overhead memori dan mempercepat rendering.
    
2.  **Widget Identitas**  
    Pada framework Flutter, widget `const` memiliki identitas yang tetap. Hal ini memungkinkan **widget tree** untuk mendeteksi bahwa widget tidak berubah, sehingga tidak perlu dirender ulang. Ini meningkatkan efisiensi aplikasi.
    
3.  **Meningkatkan Kejelasan Kode**  
    Dengan menggunakan `const`, developer dapat dengan jelas menunjukkan bahwa nilai atau widget bersifat tetap, sehingga kode lebih mudah dipahami.

### Kapan Sebaiknya Menggunakan `const`?

1.  **Nilai Konstan yang Tidak Berubah**  
    Gunakan `const` untuk mendefinisikan nilai atau objek yang tidak akan berubah sepanjang siklus hidup aplikasi. Misalnya:
    ```dart
    const String appName = "MyApp";
    ``` 
    
2.  **Widget Stateless**  
    Pada widget yang tidak berubah, gunakan `const` untuk mengoptimalkan rendering:
    ```dart
    const Text('Hello, World');
    ``` 
    
3.  **Default Parameter atau Pengaturan Konfigurasi**  
    `const` ideal digunakan untuk memberikan nilai default yang statis dalam konfigurasi:
    ```dart
    const EdgeInsets padding = EdgeInsets.all(8.0);
    ``` 
    
4.  **Penggunaan Berulang**  
    Jika Anda memiliki elemen UI yang sama berulang kali, buat elemen tersebut sebagai `const` untuk mengurangi overhead pembuatan instance baru.
    

### Kapan Tidak Menggunakan `const`?

1.  **Nilai yang Dapat Berubah (Dynamic)**  
    Jangan gunakan `const` jika nilai atau objek berubah selama runtime. Misalnya, ketika nilai diambil dari user input atau API:
    ```dart
    // Tidak cocok menggunakan const
    final dynamicValue = getUserInput();
    ``` 
    
2.  **Stateful Widgets**  
    Dalam widget yang memerlukan perubahan state, tidak relevan untuk menggunakan `const` karena sifatnya yang immutable.
    
3.  **Ketidakjelasan Compile Time**  
    Jika suatu nilai tidak dapat dipastikan pada waktu kompilasi, gunakan `final` atau deklarasi biasa. Contoh:
    ```dart
    final timeNow = DateTime.now(); // Tidak bisa const
    ``` 

### 2) Jelaskan dan bandingkan penggunaan _Column_ dan _Row_ pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

#### **Column vs Row pada Flutter**

**Column** dan **Row** adalah dua widget tata letak (layout) utama di Flutter yang digunakan untuk mengatur widget anak (**children**) dalam sebuah **container**. Meskipun keduanya berfungsi untuk mengatur tata letak, perbedaannya terletak pada arah penempatan elemen.

----------

#### **1. Column**

#### Pengertian

-   **Column** adalah widget yang mengatur elemen secara **vertikal** (dari atas ke bawah).
-   Digunakan ketika elemen dalam layout harus disusun dalam **sumbu Y**.

#### Karakteristik

-   **Arah Tata Letak:** Vertikal (main axis = sumbu Y, cross axis = sumbu X).
-   Mendukung properti seperti **mainAxisAlignment** (penempatan pada sumbu Y) dan **crossAxisAlignment** (penempatan pada sumbu X).
-   Cocok untuk tata letak yang membutuhkan elemen ditumpuk secara berurutan.

#### Contoh Implementasi Column

```dart
import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Elemen di tengah sumbu Y
        crossAxisAlignment: CrossAxisAlignment.start, // Elemen rata kiri di sumbu X
        children: [
          Text('Item 1', style: TextStyle(fontSize: 20)),
          Text('Item 2', style: TextStyle(fontSize: 20)),
          Text('Item 3', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
```

#### **2. Row**

#### Pengertian

-   **Row** adalah widget yang mengatur elemen secara **horizontal** (dari kiri ke kanan).
-   Digunakan ketika elemen dalam layout harus disusun dalam **sumbu X**.

#### Karakteristik

-   **Arah Tata Letak:** Horizontal (main axis = sumbu X, cross axis = sumbu Y).
-   Mendukung properti seperti **mainAxisAlignment** (penempatan pada sumbu X) dan **crossAxisAlignment** (penempatan pada sumbu Y).
-   Cocok untuk tata letak elemen yang perlu disusun dalam satu baris.

#### Contoh Implementasi Row

```dart
import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row Example')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Elemen tersebar merata
        crossAxisAlignment: CrossAxisAlignment.center, // Elemen di tengah sumbu Y
        children: [
          Icon(Icons.star, size: 40, color: Colors.blue),
          Icon(Icons.favorite, size: 40, color: Colors.red),
          Icon(Icons.thumb_up, size: 40, color: Colors.green),
        ],
      ),
    );
  }
}
```

#### Perbandingan Column dan Row

| **Aspek**              | **Column**                                   | **Row**                                      |
|-------------------------|----------------------------------------------|---------------------------------------------|
| **Orientasi Tata Letak** | Vertikal (atas ke bawah).                    | Horizontal (kiri ke kanan).                 |
| **Sumbu Utama (Main Axis)** | Sumbu Y.                                   | Sumbu X.                                    |
| **Sumbu Lintas (Cross Axis)** | Sumbu X.                                   | Sumbu Y.                                    |
| **Properti Tata Letak** | **mainAxisAlignment**, **crossAxisAlignment** | **mainAxisAlignment**, **crossAxisAlignment** |
| **Contoh Penggunaan**   | Form, daftar elemen vertikal.                | Navigasi horizontal, baris elemen ikon.     |

### 3) Sebutkan apa saja elemen input yang kamu gunakan pada halaman _form_ yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

#### Input digunakan di tugas

Dalam tugas ini saya menggunakan dua input untuk halaman form saya. Berikut penjelasannya :

1. **TextFormField**
Versi _advance_ dari `TextField` yang terintegrasi dengan `Form`. Menyediakan fitur validasi input langsung dalam form, membuatnya ideal untuk pengisian data yang membutuhkan pemeriksaan kesalahan.

2. **ElevatedButton**
Tombol berbasis teks yang memberikan feedback elevasi saat ditekan. Sering digunakan untuk memicu tindakan, seperti menyimpan data atau mengirim form.

#### Input lainnya di Flutter

Selain kedua input tersebut, flutter masih memiliki beberapa input lainnya. Berikut penjelasannya :

1. **TextField**
Elemen input teks dasar yang digunakan untuk memasukkan teks dari pengguna. Cocok untuk masukan satu baris seperti nama atau email. Dapat dikustomisasi dengan properti seperti `controller`, `decoration`, dan `keyboardType`.

2. **DropdownButtonFormField**
Elemen input yang memungkinkan pengguna memilih opsi dari daftar dropdown. Sangat bermanfaat untuk input yang memiliki pilihan terbatas seperti kategori produk atau status.

3. **Checkbox**
Elemen input yang memungkinkan pengguna memilih opsi benar atau salah (checked atau unchecked). Umumnya digunakan dalam form untuk konfirmasi, seperti persetujuan syarat dan ketentuan.

4. **Switch**
Elemen input yang berfungsi sebagai tombol on/off. Biasanya digunakan untuk pengaturan yang memiliki dua status, seperti mengaktifkan atau menonaktifkan fitur.

5. **Radio**
Elemen input yang digunakan untuk memilih satu opsi dari beberapa pilihan yang tersedia. Sering digunakan bersama `ListTile` untuk memberikan label pada pilihan.

6. **Slider**
Elemen input yang memungkinkan pengguna memilih nilai dalam rentang tertentu. Biasanya digunakan untuk memilih angka atau level, seperti volume suara atau harga.

7. **DatePicker**
Digunakan untuk memilih tanggal. Elemen ini dapat dipanggil dengan fungsi `showDatePicker()` untuk membuka dialog tanggal yang memungkinkan pengguna memilih tanggal tertentu.

8. **TimePicker**
Digunakan untuk memilih waktu. Sama seperti `DatePicker`, elemen ini dapat dipanggil dengan fungsi `showTimePicker()` dan membuka dialog untuk memilih waktu.

### 4) Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Cara saya untuk mengatur tema dalam aplikasi flutter agar aplikasi yang dibuat konsisten adalah :

1. **Definisikan Warna Utama dan Sekunder**
Saya mendefinisikan `primary` dan `secondary` dengan `ColorScheme.fromSwatch().copyWith`, yang memastikan bahwa warna utama (`primary`) dan sekunder (`secondary`) digunakan secara konsisten dalam komponen-komponen utama seperti `AppBar`, tombol, dan elemen UI lainnya yang mengikuti tema.

2. **Menggunakan `useMaterial3: true`**
Menyertakan `useMaterial3: true` membantu mengadopsi elemen desain Material You, yang lebih modern dan responsif. Ini otomatis menyesuaikan elemen UI berdasarkan tema warna yang telah saya tetapkan, seperti efek elevasi dan kurva pada komponen.

3. **Memanfaatkan `Theme.of(context)` dalam Widget**
Dalam beberapa widget, Saya menggunakan `Theme.of(context)` untuk mengakses dan menerapkan warna sesuai dengan tema utama yang sudah saya definisikan sebelumnya.

Saya mencoba untuk mengaplikasikan tema yang sudah saya buat khusunya dibagian warna primer dan sekunder pada widget AppBar, Scaffold, Drawer dan widget lainnya.

### 5) Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Dalam aplikasi yang buat ini saya menggunakan Drawer yang berada di file left_drawer.dart yang kemudian menjadi parameter di Scaffold. LeftDrawer ini berisikan nama aplikasi saya yaitu Toko Ungu, Tagline aplikasi saya yaitu "Belanja Cepat, Harga Tepat – Semua yang Kamu Butuhkan Ada di Sini!", lalu tombol navigasi menggunakan ListTile yang saat tombolnya di tap maka melakukan navigasi ke page tertentu dengan pushReplacement. Namun, berbeda saat ingin 'tambah item' saya menggunakan navigasi dengan push saja agar saya bisa kembali ke laman sebelumnya.

Sekian & Terima Kasih

