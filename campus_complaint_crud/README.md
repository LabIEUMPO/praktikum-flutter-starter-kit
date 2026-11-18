# BAB III - CAMPUS COMPLAINT CRUD

## 1. Project Overview

**Campus Complaint CRUD** merupakan pengembangan dari aplikasi Campus Complaint pada Bab II. Pada praktikum ini, mahasiswa akan mengimplementasikan fungsi pengelolaan data laporan kerusakan fasilitas kampus menggunakan Flutter.

Pada Bab II, aplikasi telah memiliki antarmuka untuk menampilkan daftar laporan dan detail laporan. Namun, data yang ditampilkan masih bersifat statis.

Pada Bab III, mahasiswa harus mengembangkan aplikasi agar pengguna dapat menambahkan, melihat, mengubah, dan menghapus laporan.

**Tema proyek:** Campus Facility Reporting

**Fokus praktikum:** Data Modeling, State Management, CRUD Operations, dan Navigation.

## 2. Project Objectives

Setelah menyelesaikan praktikum ini, mahasiswa diharapkan mampu:

1. Memahami struktur dan pengelolaan data menggunakan model Dart.
2. Mengimplementasikan operasi Create, Read, Update, dan Delete (CRUD).
3. Mengelola perubahan data menggunakan `setState()`.
4. Menggunakan `TextEditingController` untuk mengelola input form.
5. Mengimplementasikan validasi input.
6. Menghubungkan halaman form, halaman utama, dan halaman detail.
7. Mengelola data dalam koleksi `List` secara dinamis.

## 3. Starter Project

Mahasiswa menggunakan starter project hasil pengembangan Bab II.

Beberapa komponen yang telah disediakan:

| Komponen | Keterangan |
|---|---|
| `Report` | Model data laporan |
| `sample_reports.dart` | Sample data berisi 7 laporan |
| `HomeScreen` | Halaman utama daftar laporan |
| `DetailScreen` | Halaman informasi detail laporan |
| `ReportCard` | Widget untuk menampilkan ringkasan laporan |
| `AppThemes` | Konfigurasi tema dan desain aplikasi |
| `CreateReportScreen` | UI form untuk membuat laporan baru |

**Catatan:** Starter project belum menyediakan implementasi CRUD. Mahasiswa bertanggung jawab menghubungkan seluruh komponen tersebut dengan logika pengelolaan data.

## 4. Application Requirements

### 4.1 Data Model

Gunakan model `Report` yang telah disediakan sebagai dasar pengelolaan data.

Setiap laporan memiliki atribut:

| Atribut | Tipe Data | Keterangan |
|---|---|---|
| `id` | `int` | Identitas unik laporan |
| `title` | `String` | Judul laporan |
| `location` | `String` | Lokasi kerusakan |
| `description` | `String?` | Deskripsi kerusakan |
| `status` | `String` | Status laporan |
| `reporter` | `String?` | Nama pelapor |
| `createdAt` | `DateTime` | Tanggal pembuatan laporan |

Ketentuan:

- Setiap laporan harus memiliki ID yang unik.
- ID laporan tidak boleh sama dengan laporan lainnya.
- Gunakan tipe data yang sesuai dengan atribut.
- Properti nullable harus ditangani dengan benar.
- Model dapat disesuaikan apabila diperlukan untuk mendukung operasi CRUD.

### 4.2 Create - Menambahkan Laporan

Pengguna dapat menambahkan laporan baru melalui halaman `CreateReportScreen`.

Field yang wajib tersedia:

1. Judul laporan.
2. Lokasi kejadian.
3. Nama pelapor.
4. Deskripsi kerusakan.

Ketentuan implementasi:

- Gunakan `TextEditingController` untuk mengelola input.
- Setiap field wajib harus divalidasi.
- Input yang kosong tidak boleh disimpan.
- Data baru harus dibuat menjadi objek `Report`.
- Setiap laporan baru harus memiliki ID unik.
- Tanggal pembuatan diisi secara otomatis menggunakan `DateTime.now()`.
- Status awal laporan menggunakan `Open`.
- Setelah berhasil disimpan, pengguna kembali ke halaman utama.
- Daftar laporan harus langsung menampilkan data terbaru.

**Expected Behavior:**

Setelah pengguna mengisi form dan menekan tombol "Kirim Laporan", data baru akan ditambahkan ke daftar laporan.

### 4.3 Read - Menampilkan Laporan

Aplikasi harus dapat menampilkan seluruh laporan yang tersedia.

Ketentuan implementasi:

- Data awal berasal dari `sampleReports`.
- Daftar laporan ditampilkan secara dinamis.
- Gunakan `ListView.builder` atau pendekatan lain yang sesuai.
- Setiap laporan ditampilkan menggunakan `ReportCard`.
- Ketika sebuah laporan dipilih, aplikasi membuka `DetailScreen`.
- DetailScreen harus menampilkan data sesuai laporan yang dipilih.

**Expected Behavior:**

Perubahan jumlah data pada daftar harus langsung tercermin pada tampilan HomeScreen.

### 4.4 Update - Mengubah Laporan

Pengguna dapat mengubah informasi laporan yang sudah dibuat.

Ketentuan implementasi:

- Sediakan tombol atau menu untuk mengedit laporan.
- Form edit dapat menggunakan kembali `CreateReportScreen` atau dibuat menjadi halaman tersendiri.
- Field form harus terisi otomatis menggunakan data laporan yang dipilih.
- Pengguna dapat mengubah judul, lokasi, nama pelapor, dan deskripsi.
- Lakukan validasi sebelum perubahan disimpan.
- Data yang diperbarui harus menggantikan data lama, bukan menambahkan laporan baru.
- ID dan tanggal pembuatan laporan harus tetap dipertahankan.
- Perubahan harus langsung terlihat pada HomeScreen dan DetailScreen.

**Expected Behavior:**

Ketika pengguna mengubah judul laporan, perubahan tersebut harus ditampilkan pada daftar laporan dan halaman detail.

### 4.5 Delete - Menghapus Laporan

Pengguna dapat menghapus laporan yang sudah tersedia.

Ketentuan implementasi:

- Sediakan tombol atau menu hapus pada DetailScreen.
- Tampilkan dialog konfirmasi sebelum menghapus data.
- Pengguna dapat membatalkan proses penghapusan.
- Jika pengguna menyetujui, data dihapus dari daftar laporan.
- Setelah penghapusan berhasil, pengguna kembali ke HomeScreen.
- Daftar laporan harus langsung diperbarui.

**Expected Behavior:**

Laporan yang telah dihapus tidak boleh muncul kembali pada daftar laporan selama aplikasi masih berjalan.

## 5. Search Requirements

Fitur pencarian dari Bab II harus tetap dipertahankan dan disesuaikan dengan data yang dikelola secara dinamis.

Ketentuan:

- Pencarian dilakukan berdasarkan judul laporan.
- Pencarian dapat dikembangkan untuk mendukung lokasi dan deskripsi.
- Hasil pencarian harus mengikuti data terbaru.
- Laporan yang baru ditambahkan harus dapat ditemukan.
- Laporan yang telah dihapus tidak boleh muncul dalam hasil pencarian.
- Ketika input pencarian dikosongkan, seluruh laporan kembali ditampilkan.

## 6. State Management

Pada praktikum ini, pengelolaan state menggunakan pendekatan sederhana dengan `StatefulWidget` dan `setState()`.

Ketentuan:

- Gunakan koleksi `List<Report>` sebagai tempat penyimpanan data aktif.
- Perubahan data harus memicu pembaruan tampilan.
- Pisahkan logika pengelolaan data dari komponen UI jika diperlukan.
- Hindari membuat banyak salinan daftar laporan yang tidak diperlukan.
- Pastikan seluruh halaman menampilkan data dari sumber state yang sama.

**Batasan penyimpanan data:**

Data cukup disimpan di memori selama aplikasi berjalan. Penggunaan SQLite, Drift, Isar, SharedPreferences, Firebase, atau database lainnya belum diwajibkan.

Data yang ditambahkan, diubah, atau dihapus tidak harus tetap tersedia setelah aplikasi ditutup sepenuhnya.

## 7. Navigation Requirements

Navigasi aplikasi harus mengikuti alur berikut:

```text
             HomeScreen
                 |
       +---------+---------+
       |         |         |
     Create    Detail    Search
       |         |
       |      +--+--+
       |      |     |
       |    Edit  Delete
       |      |     |
       +------+-----+
              |
          HomeScreen
```

Ketentuan:

- HomeScreen menjadi halaman utama aplikasi.
- CreateReportScreen digunakan untuk menambahkan laporan.
- DetailScreen digunakan untuk menampilkan informasi laporan.
- Edit dapat dilakukan dari DetailScreen.
- Setelah operasi CRUD selesai, pengguna diarahkan kembali ke halaman yang sesuai.
- Navigasi tidak boleh menyebabkan data yang ditampilkan menjadi tidak konsisten.

## 8. UI and Design Requirements

Gunakan desain dan tema yang telah dikembangkan pada Bab II.

Ketentuan:

- Pertahankan penggunaan `AppThemes`.
- Gunakan color palette, typography, spacing, dan border radius yang telah ditentukan pada Bab II.
- Pertahankan konsistensi tampilan HomeScreen, DetailScreen, dan CreateReportScreen.
- Gunakan komponen UI yang dapat digunakan kembali.
- Pastikan seluruh halaman dapat di-scroll apabila konten melebihi ukuran layar.
- Tidak diperbolehkan terdapat `RenderFlex overflow`.
- Tampilkan feedback setelah operasi CRUD berhasil atau gagal, misalnya menggunakan `SnackBar`.
- Tampilkan empty state ketika tidak ada laporan yang tersedia.

## 9. Technical Requirements

Teknologi dan komponen yang digunakan:

| Teknologi | Penggunaan |
|---|---|
| Flutter | Framework pengembangan aplikasi |
| Dart | Bahasa pemrograman |
| StatefulWidget | Pengelolaan state |
| setState() | Memperbarui tampilan |
| List | Menyimpan data laporan |
| TextEditingController | Mengelola input form |
| Form dan TextFormField | Validasi input |
| Navigator | Navigasi antarhalaman |
| AlertDialog | Konfirmasi penghapusan |
| SnackBar | Feedback operasi CRUD |

Tidak diwajibkan menggunakan package state management eksternal seperti Provider, Bloc, Riverpod, atau GetX.

## 10. Testing Requirements

Mahasiswa wajib melakukan pengujian terhadap seluruh operasi CRUD.

### Create Testing

- [ ] Pengguna dapat menambahkan laporan baru.
- [ ] Semua field wajib divalidasi.
- [ ] Input kosong tidak dapat disimpan.
- [ ] Laporan baru memiliki ID unik.
- [ ] Status awal laporan adalah `Open`.
- [ ] Tanggal laporan terisi otomatis.
- [ ] Data baru muncul pada daftar laporan.

### Read Testing

- [ ] Seluruh sample data dapat ditampilkan.
- [ ] Setiap laporan menampilkan informasi yang benar.
- [ ] DetailScreen menampilkan laporan yang dipilih.
- [ ] Data laporan terbaru dapat ditampilkan.

### Update Testing

- [ ] Pengguna dapat membuka form edit.
- [ ] Form edit terisi dengan data sebelumnya.
- [ ] Pengguna dapat mengubah informasi laporan.
- [ ] Data yang diubah berhasil diperbarui.
- [ ] ID dan tanggal pembuatan tidak berubah.
- [ ] Perubahan terlihat pada HomeScreen dan DetailScreen.

### Delete Testing

- [ ] Pengguna dapat menghapus laporan.
- [ ] Dialog konfirmasi ditampilkan.
- [ ] Pengguna dapat membatalkan penghapusan.
- [ ] Data benar-benar dihapus setelah konfirmasi.
- [ ] Daftar laporan diperbarui setelah penghapusan.

### Search and UI Testing

- [ ] Pencarian dapat digunakan pada data terbaru.
- [ ] Hasil pencarian sesuai dengan kata kunci.
- [ ] Data yang telah dihapus tidak muncul dalam pencarian.
- [ ] Tidak terdapat overflow.
- [ ] Navigasi antarhalaman berjalan dengan benar.
- [ ] Tidak terdapat error yang menyebabkan aplikasi crash.

## 11. Submission Requirements

Mahasiswa wajib mengumpulkan:

1. Source code aplikasi Flutter.
2. Screenshot HomeScreen setelah data berubah.
3. Screenshot form tambah laporan.
4. Screenshot DetailScreen.
5. Screenshot form edit laporan.
6. Bukti proses penghapusan laporan.
7. Dokumentasi hasil pengujian CRUD.

Sertakan penjelasan singkat mengenai implementasi Create, Read, Update, dan Delete.

## 12. Evaluation Criteria

| Aspek Penilaian | Bobot |
|---|---:|
| Data Model and State Management | 20% |
| Create and Read Implementation | 25% |
| Update and Delete Implementation | 25% |
| Navigation and Search Integration | 15% |
| Validation and Testing | 10% |
| Code Quality | 5% |
| **Total** | **100%** |

## 13. Final Goal

Mahasiswa mampu mengembangkan aplikasi Campus Complaint dari UI statis menjadi aplikasi yang dapat mengelola data laporan secara dinamis menggunakan operasi CRUD, memahami hubungan antara model data, state, dan tampilan, serta melakukan pengujian terhadap setiap fungsi aplikasi.

**Project Completion Criteria:** Seluruh operasi Create, Read, Update, dan Delete harus berfungsi dengan benar tanpa menyebabkan ketidakkonsistenan data atau error pada aplikasi.