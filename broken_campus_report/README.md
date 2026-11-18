# BAB I - BROKEN CAMPUS REPORT

## 1. Project Overview

**Broken Campus Report** merupakan aplikasi Flutter sederhana untuk menampilkan laporan kerusakan fasilitas di lingkungan kampus.

Aplikasi ini dikembangkan sebagai proyek latihan debugging. Starter project telah menyediakan struktur dasar aplikasi, model data, sample data, serta beberapa halaman dan widget yang belum berjalan sebagaimana mestinya.

Mahasiswa bertugas melakukan proses identifikasi, analisis, perbaikan, dan pengujian terhadap bug yang terdapat dalam aplikasi.

**Tema proyek:** Campus Facility Reporting

**Fokus praktikum:** Debugging, Error Identification, dan Program Testing.

## 2. Application Description

Aplikasi Broken Campus Report memiliki fungsi utama untuk menampilkan informasi laporan kerusakan fasilitas kampus.

Setiap laporan memiliki informasi sebagai berikut:

- ID laporan.
- Judul laporan.
- Lokasi kerusakan.
- Deskripsi kerusakan.
- Status laporan.
- Nama pelapor.
- Tanggal laporan.

Aplikasi memiliki dua halaman utama:

### 2.1 HomeScreen

HomeScreen merupakan halaman utama yang menampilkan daftar laporan kerusakan kampus.

Fitur yang tersedia:

1. Menampilkan daftar laporan berdasarkan sample data.
2. Menampilkan informasi singkat setiap laporan.
3. Menyediakan fitur pencarian berdasarkan informasi laporan.
4. Mengarahkan pengguna ke halaman detail ketika sebuah laporan dipilih.

### 2.2 DetailScreen

DetailScreen digunakan untuk menampilkan informasi lengkap dari laporan yang dipilih.

Informasi yang ditampilkan meliputi:

- Judul laporan.
- Lokasi kerusakan.
- Deskripsi lengkap.
- Status laporan.
- Informasi pelapor.
- Tanggal laporan.

## 3. Project Structure

Starter project telah menyediakan struktur dasar sebagai berikut:

```text
lib/
├── data/
│   └── sample_reports.dart
├── models/
│   └── report.dart
├── screens/
│   ├── home_screen.dart
│   └── detail_screen.dart
├── widgets/
│   └── report_card.dart
└── main.dart

assets/
└── images/
    └── campus.jpg
```

Keterangan:

| Folder/File | Fungsi |
|---|---|
| `models/` | Mendefinisikan struktur data laporan |
| `data/` | Menyimpan sample data laporan |
| `screens/` | Menyimpan halaman aplikasi |
| `widgets/` | Menyimpan komponen UI yang digunakan kembali |
| `assets/` | Menyimpan aset gambar aplikasi |
| `main.dart` | Entry point aplikasi |

Mahasiswa diperbolehkan melakukan perubahan pada file yang tersedia sesuai kebutuhan perbaikan, tetapi tetap harus menjaga struktur kode agar terorganisasi.

## 4. Debugging Challenges

Dalam starter project terdapat beberapa bug yang harus ditemukan dan diperbaiki.

**Penting:** Lokasi kesalahan dan potongan kode yang bermasalah tidak diberikan secara langsung. Mahasiswa harus mengidentifikasi penyebabnya melalui proses debugging.

### Bug 1 - List Indexing Error

**Kategori:** Runtime Error

Terdapat kesalahan dalam mengakses elemen pada daftar laporan.

Gejala yang mungkin ditemukan:

- Aplikasi mengalami error ketika halaman Home dibuka.
- Muncul pesan `RangeError`.
- Beberapa data tidak dapat ditampilkan sebagaimana mestinya.

**Tugas mahasiswa:**

- Periksa jumlah elemen dalam daftar laporan.
- Identifikasi penggunaan index yang tidak valid.
- Perbaiki proses pengaksesan data.
- Pastikan seluruh laporan dapat ditampilkan tanpa menyebabkan error.

### Bug 2 - Nullable Value Error

**Kategori:** Runtime Error / Null Safety

Terdapat penggunaan nilai yang berpotensi `null` tanpa penanganan yang tepat.

Gejala yang mungkin ditemukan:

- Aplikasi mengalami error ketika data tertentu diproses.
- Muncul pesan terkait null value.
- Halaman detail tidak dapat menampilkan informasi tertentu.

**Tugas mahasiswa:**

- Identifikasi properti yang memungkinkan memiliki nilai `null`.
- Telusuri bagian kode yang menggunakan properti tersebut.
- Terapkan penanganan null yang sesuai.
- Pastikan aplikasi tetap berjalan ketika informasi tertentu tidak tersedia.

### Bug 3 - Bottom Overflow

**Kategori:** UI Layout Error

Terdapat kesalahan dalam pengaturan layout yang menyebabkan komponen melebihi batas area layar.

Gejala yang mungkin ditemukan:

- Muncul peringatan `BOTTOM OVERFLOWED BY ... PIXELS`.
- Sebagian konten tidak terlihat.
- Tampilan aplikasi tidak sesuai pada ukuran layar tertentu.

**Tugas mahasiswa:**

- Identifikasi widget yang menyebabkan overflow.
- Periksa penggunaan `Column`, `Row`, `Container`, dan widget layout lainnya.
- Perbaiki struktur layout agar konten dapat ditampilkan dengan baik.
- Pastikan halaman tetap dapat digunakan pada ukuran layar yang berbeda.

### Bug 4 - Asset Path Error

**Kategori:** Configuration / Asset Error

Terdapat kesalahan pada konfigurasi atau pemanggilan lokasi aset gambar.

Gejala yang mungkin ditemukan:

- Gambar tidak berhasil ditampilkan.
- Muncul pesan `Unable to load asset`.
- Aplikasi tidak dapat menemukan file gambar yang dibutuhkan.

**Tugas mahasiswa:**

- Periksa lokasi file gambar dalam project.
- Periksa konfigurasi assets pada `pubspec.yaml`.
- Periksa pemanggilan `Image.asset()` pada kode.
- Pastikan gambar dapat ditampilkan dengan benar.

### Bug 5 - Search Logic Error

**Kategori:** Logical Error

Fitur pencarian laporan memiliki kesalahan pada pengelolaan state atau proses penyaringan data.

Gejala yang mungkin ditemukan:

- Hasil pencarian tidak muncul meskipun data tersedia.
- Hasil pencarian tidak sesuai dengan kata kunci.
- Daftar laporan tidak berubah sesuai input pengguna.

**Tugas mahasiswa:**

- Telusuri alur input pencarian.
- Periksa pengelolaan state menggunakan `setState()`.
- Pastikan hasil pencarian ditampilkan sesuai kata kunci.
- Pastikan seluruh daftar laporan kembali ditampilkan ketika input pencarian dikosongkan.

## 5. Expected Application Behavior

Setelah seluruh bug diperbaiki, aplikasi harus memenuhi kondisi berikut:

| No. | Komponen | Expected Behavior |
|---|---|---|
| 1 | HomeScreen | Berhasil dibuka tanpa error |
| 2 | Report List | Seluruh data laporan dapat ditampilkan |
| 3 | Asset Image | Gambar kampus berhasil dimuat |
| 4 | Search | Hasil pencarian sesuai kata kunci |
| 5 | Empty Search | Seluruh laporan kembali ditampilkan |
| 6 | DetailScreen | Menampilkan informasi laporan yang dipilih |
| 7 | Nullable Data | Tidak menyebabkan aplikasi crash |
| 8 | Layout | Tidak terdapat bottom overflow |

## 6. Debugging Procedure

Mahasiswa wajib mengikuti tahapan berikut:

1. **Run Application**

   Jalankan aplikasi dan amati perilaku awalnya.

2. **Identify the Problem**

   Catat gejala kesalahan yang ditemukan, baik melalui tampilan aplikasi maupun terminal/debug console.

3. **Analyze the Source Code**

   Telusuri file dan bagian kode yang berhubungan dengan masalah.

4. **Fix the Bug**

   Lakukan perbaikan berdasarkan penyebab kesalahan, bukan sekadar menghilangkan pesan error.

5. **Test the Application**

   Jalankan kembali aplikasi dan lakukan pengujian untuk memastikan masalah telah diselesaikan.

6. **Document the Result**

   Catat penyebab bug, perubahan yang dilakukan, dan hasil pengujian.

## 7. Testing Requirements

Setiap mahasiswa wajib melakukan pengujian terhadap seluruh fungsi aplikasi.

### Functional Testing

- [ ] HomeScreen berhasil dibuka.
- [ ] Seluruh laporan dapat ditampilkan.
- [ ] Pencarian berdasarkan judul berjalan.
- [ ] Pencarian berdasarkan deskripsi berjalan.
- [ ] Hasil pencarian yang tidak ditemukan menampilkan pesan yang sesuai.
- [ ] Menghapus kata kunci mengembalikan seluruh daftar laporan.
- [ ] Memilih laporan membuka DetailScreen yang benar.
- [ ] Informasi detail ditampilkan dengan benar.
- [ ] Data dengan properti nullable dapat ditangani.

### UI Testing

- [ ] Gambar kampus berhasil ditampilkan.
- [ ] Tidak terdapat bottom overflow.
- [ ] Konten tidak terpotong.
- [ ] Halaman detail dapat menampilkan deskripsi panjang.
- [ ] Daftar laporan dapat di-scroll jika melebihi tinggi layar.

### Application Testing

- [ ] Tidak terdapat error yang menyebabkan aplikasi crash.
- [ ] Seluruh fitur utama dapat digunakan.
- [ ] Aplikasi dapat dijalankan kembali setelah perbaikan.

## 8. Debugging Report

Mahasiswa wajib membuat dokumentasi singkat untuk setiap bug yang berhasil diperbaiki.

Gunakan format berikut:

| Komponen | Keterangan |
|---|---|
| Bug Name | Nama bug yang ditemukan |
| Problem Description | Gejala atau masalah yang terjadi |
| Root Cause | Penyebab utama kesalahan |
| Solution | Perubahan kode yang dilakukan |
| Testing Result | Hasil pengujian setelah perbaikan |

Sertakan screenshot sebelum dan sesudah perbaikan untuk setiap bug yang relevan.

## 9. Submission Requirements

Mahasiswa wajib mengumpulkan:

1. Source code aplikasi yang telah diperbaiki.
2. Screenshot aplikasi setelah seluruh bug diperbaiki.
3. Dokumentasi debugging untuk lima kategori bug.
4. Bukti pengujian aplikasi.
5. File README yang telah dilengkapi dengan identitas mahasiswa dan ringkasan hasil pengerjaan.

## 10. Evaluation Criteria

| Aspek Penilaian | Bobot |
|---|---:|
| Bug Identification | 20% |
| Root Cause Analysis | 20% |
| Bug Fix Implementation | 30% |
| Application Testing | 20% |
| Debugging Documentation | 10% |
| **Total** | **100%** |

## 11. Technical Requirements

Pastikan lingkungan pengembangan telah memenuhi kebutuhan berikut:

- Flutter SDK telah terpasang.
- Dart SDK tersedia melalui Flutter.
- Android Studio atau VS Code telah dikonfigurasi.
- Emulator atau perangkat Android tersedia.

Perintah untuk menjalankan aplikasi:

```bash
flutter pub get
flutter run
```

Perintah untuk memeriksa potensi masalah kode:

```bash
flutter analyze
```

---

**Final Goal:** Mahasiswa mampu mengidentifikasi, menganalisis, memperbaiki, dan menguji lima kategori bug pada aplikasi Flutter sederhana tanpa hanya bergantung pada pesan error yang ditampilkan.