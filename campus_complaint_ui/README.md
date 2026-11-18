# BAB II - CAMPUS COMPLAINT UI

## 1. Project Overview

Starter project telah menyediakan beberapa komponen dasar:

- Model `Report`
- Sample data laporan
- `HomeScreen`
- `DetailScreen`
- Widget `ReportCard`

Mahasiswa bertanggung jawab mengembangkan tampilan aplikasi agar lebih terstruktur, konsisten, mudah digunakan, dan responsif terhadap berbagai ukuran layar.

**Fokus praktikum:** UI Implementation dan Widget Composition.

## 2. General Requirements

Ketentuan umum pengerjaan:

1. Menggunakan Flutter dan bahasa pemrograman Dart.
2. Menggunakan starter project yang telah disediakan.
3. Mempertahankan model dan struktur data `Report` yang tersedia.
4. Mengembangkan tampilan pada `HomeScreen` dan `DetailScreen`.
5. Menggunakan kembali widget `ReportCard` untuk menampilkan informasi laporan.
6. Menggunakan widget Flutter sesuai kebutuhan, seperti `Container`, `Card`, `Column`, `Row`, `Stack`, `ListView`, dan `SingleChildScrollView`.
7. Tidak diperbolehkan membuat seluruh tampilan dalam satu widget besar tanpa pemisahan komponen yang diperlukan.

## 3. UI Design Requirements

Seluruh halaman harus mengikuti pedoman desain berikut.

### 3.1 Color Palette

Gunakan palet warna yang konsisten di seluruh aplikasi.

| Elemen | Warna | Hex Code |
|---|---|---|
| Primary | Blue | `#2563EB` |
| Primary Dark | Dark Blue | `#1D4ED8` |
| Background | Light Gray | `#F8FAFC` |
| Surface / Card | White | `#FFFFFF` |
| Primary Text | Dark Gray | `#1E293B` |
| Secondary Text | Gray | `#64748B` |
| Border | Light Gray | `#E2E8F0` |
| Success | Green | `#16A34A` |
| Warning | Orange | `#F59E0B` |
| Error | Red | `#DC2626` |

Ketentuan:
- Background utama menggunakan `#F8FAFC`.
- Card dan komponen input menggunakan warna putih.
- Teks utama harus memiliki kontras yang jelas dengan background.
- Warna status laporan harus konsisten pada seluruh halaman.
- Hindari penggunaan terlalu banyak warna di luar palet yang ditentukan.

### 3.2 Typography

Gunakan font **Roboto** sebagai font utama.

| Elemen | Ukuran | Weight |
|---|---:|---|
| App Title | 20 px | Bold |
| Page Heading | 22 px | Bold |
| Section Heading | 16 px | Semi Bold |
| Card Title | 15 px | Semi Bold |
| Body Text | 14 px | Regular |
| Secondary Text | 12 px | Regular |
| Status Label | 11 px | Medium |

Ketentuan:
- Gunakan warna `#1E293B` untuk teks utama.
- Gunakan warna `#64748B` untuk informasi tambahan.
- Hindari ukuran teks yang terlalu kecil.
- Gunakan maksimal tiga tingkat ukuran teks utama dalam satu halaman.
- Teks yang panjang harus ditangani dengan baik menggunakan wrapping atau batas jumlah baris.

### 3.3 Spacing

Gunakan sistem spacing berbasis kelipatan 4.

| Penggunaan | Ukuran |
|---|---:|
| Extra Small | 4 px |
| Small | 8 px |
| Medium | 12 px |
| Large | 16 px |
| Extra Large | 24 px |
| Section Spacing | 32 px |

Ketentuan:
- Padding halaman minimal 16 px.
- Jarak antar-card minimal 12 px.
- Jarak antarbagian halaman minimal 24 px.
- Gunakan spacing yang konsisten, jangan menentukan jarak secara acak.

### 3.4 Border Radius

Gunakan ketentuan berikut:

| Komponen | Border Radius |
|---|---:|
| Card | 12 px |
| Text Field | 10 px |
| Button | 10 px |
| Status Badge | 20 px |
| Image | 12 px |
| Dialog | 16 px |

Ketentuan:
- Hindari sudut yang terlalu tajam.
- Gunakan `BorderRadius.circular()` untuk menjaga konsistensi.
- Jangan mencampurkan terlalu banyak variasi radius.

### 3.5 Elevation dan Border

- Card menggunakan elevation antara 0 sampai 2.
- Gunakan border tipis `#E2E8F0` jika diperlukan.
- Hindari shadow yang terlalu gelap atau berlebihan.
- Komponen dalam satu kelompok harus memiliki gaya visual yang konsisten.

## 4. Page Requirements

### 4.1 HomeScreen

HomeScreen merupakan halaman utama yang menampilkan daftar laporan kampus.

Komponen yang wajib tersedia:

1. **AppBar**
   - Menampilkan nama aplikasi atau judul halaman.
   - Menggunakan warna primary atau putih.
   - Memiliki tampilan yang konsisten dengan keseluruhan aplikasi.

2. **Header Section**
   - Menampilkan judul halaman, misalnya "Campus Reports".
   - Dapat dilengkapi deskripsi singkat.

3. **Search Field**
   - Menyediakan input pencarian laporan.
   - Menggunakan ikon pencarian.
   - Memiliki hint text yang jelas.
   - Tidak boleh menyebabkan overflow ketika layar diperkecil.

4. **Report List**
   - Menampilkan seluruh data laporan dari sample data.
   - Menggunakan widget `ReportCard`.
   - Setiap card menampilkan informasi penting laporan.
   - Gunakan `ListView.builder` atau pendekatan scrolling yang sesuai.

5. **Empty State**
   - Jika tidak ada laporan, tampilkan pesan yang informatif.
   - Jangan membiarkan halaman kosong tanpa penjelasan.

### 4.2 ReportCard

Setiap laporan harus ditampilkan dalam bentuk card yang konsisten.

Informasi minimal:

- Judul laporan.
- Lokasi kejadian.
- Deskripsi singkat.
- Status laporan.
- Tanggal laporan jika tersedia dalam model.

Ketentuan:
- Card menggunakan background putih.
- Border radius 12 px.
- Padding internal minimal 12 px.
- Judul harus mudah dibaca.
- Deskripsi panjang harus dibatasi menggunakan `maxLines` dan `overflow`.
- Status laporan ditampilkan menggunakan badge dengan warna sesuai status.
- Seluruh card harus memiliki ukuran dan susunan informasi yang konsisten.

### 4.3 DetailScreen

DetailScreen menampilkan informasi lengkap dari laporan yang dipilih.

Informasi yang wajib ditampilkan:

- Judul laporan.
- Lokasi kejadian.
- Deskripsi lengkap.
- Status laporan.
- Nama pelapor jika tersedia.
- Tanggal laporan jika tersedia.

Ketentuan:
- Memiliki tombol kembali.
- Informasi disusun secara hierarkis.
- Gunakan spacing yang konsisten.
- Deskripsi panjang harus dapat dibaca tanpa terpotong.
- Halaman harus dapat di-scroll jika konten melebihi tinggi layar.

## 5. Layout and Responsiveness

Aplikasi harus dapat ditampilkan dengan baik pada ukuran layar yang berbeda.

Ketentuan:

1. Gunakan layout yang fleksibel, bukan ukuran tetap untuk seluruh komponen.
2. Hindari penggunaan `Container` dengan lebar dan tinggi tetap jika tidak diperlukan.
3. Gunakan `Expanded` atau `Flexible` ketika dibutuhkan untuk mengatur ruang.
4. Gunakan `ListView` untuk daftar yang dapat di-scroll.
5. Pastikan konten tidak terpotong pada layar berukuran kecil.
6. Hindari nested scrolling yang tidak diperlukan.

### Overflow Prevention

**Tidak diperbolehkan terdapat tampilan overflow**, termasuk:

- `RenderFlex overflowed by ... pixels`.
- Teks keluar dari batas card.
- Tombol terpotong.
- Komponen saling bertumpuk secara tidak sengaja.
- Gambar keluar dari batas container.
- Konten tidak dapat dijangkau karena tidak tersedia scrolling.

Jika terjadi overflow, mahasiswa wajib memperbaiki struktur layout, bukan sekadar menyembunyikan pesan error.

## 6. Interaction Requirements

Walaupun praktikum ini berfokus pada UI, beberapa interaksi dasar tetap harus tersedia.

| Interaksi | Perilaku yang Diharapkan |
|---|---|
| Tap ReportCard | Membuka DetailScreen |
| Tap Back Button | Kembali ke HomeScreen |
| Input Search | Menampilkan input pencarian |
| Scroll Report List | Menampilkan laporan lainnya |

Tidak diwajibkan mengimplementasikan database, REST API, autentikasi, atau penyimpanan data permanen.

## 7. Code Quality Requirements

- Gunakan nama class dan variabel yang jelas.
- Pisahkan komponen UI yang digunakan berulang.
- Hindari duplikasi kode yang tidak diperlukan.
- Pertahankan pemisahan `models`, `data`, `screens`, dan `widgets`.
- Jangan menempatkan seluruh implementasi UI dalam `main.dart`.
- Pastikan tidak terdapat error saat aplikasi dijalankan.
- Pastikan tidak terdapat error atau warning penting yang berasal dari implementasi mahasiswa.

## 8. Testing Checklist

Sebelum mengumpulkan tugas, pastikan seluruh ketentuan berikut terpenuhi.

### Visual Consistency
- [ ] Warna sesuai dengan color palette.
- [ ] Typography konsisten.
- [ ] Spacing antar-komponen konsisten.
- [ ] Border radius sesuai ketentuan.
- [ ] Card memiliki tampilan yang seragam.

### Functionality
- [ ] Seluruh laporan berhasil ditampilkan.
- [ ] ReportCard dapat ditekan.
- [ ] DetailScreen menampilkan laporan yang benar.
- [ ] Tombol kembali berfungsi.
- [ ] Search field dapat menerima input.

### Responsiveness
- [ ] Tidak terdapat RenderFlex overflow.
- [ ] Tidak ada teks yang keluar dari batas komponen.
- [ ] Daftar laporan dapat di-scroll.
- [ ] DetailScreen dapat di-scroll jika konten panjang.
- [ ] Tampilan tetap baik pada layar kecil.

### Code Quality
- [ ] Struktur folder tetap terorganisasi.
- [ ] Widget berulang dibuat secara terpisah.
- [ ] Tidak terdapat error saat menjalankan aplikasi.

## 9. Submission Requirements

Mahasiswa wajib mengumpulkan:

1. Source code aplikasi Flutter.
2. Screenshot HomeScreen.
3. Screenshot DetailScreen.
4. Screenshot aplikasi pada ukuran layar kecil atau emulator berbeda.
5. Penjelasan singkat mengenai komponen UI yang dibuat.

Pastikan project dapat dijalankan dengan perintah:

```bash
flutter pub get
flutter run
```

## 10. Evaluation Criteria

| Aspek Penilaian | Bobot |
|---|---:|
| Visual Design Consistency | 25% |
| Layout and Responsiveness | 25% |
| Component Implementation | 20% |
| Navigation and Interaction | 15% |
| Code Quality | 15% |
| **Total** | **100%** |

**Important:** Penilaian tidak hanya berdasarkan kemiripan tampilan, tetapi juga struktur widget, konsistensi desain, kemampuan aplikasi beradaptasi terhadap ukuran layar, dan kualitas implementasi kode.