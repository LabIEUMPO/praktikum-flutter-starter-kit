import '../models/report.dart';

final List<Report> sampleReports = [
  Report(
    id: 1,
    title: 'AC Ruang 301 Tidak Berfungsi',
    location: 'Gedung D, Ruang 301',
    description:
        'AC tidak mengeluarkan udara dingin '
        'sejak pagi hari.',
    status: 'Open',
    reporter: 'Andi',
    createdAt: DateTime(2026, 11, 10),
  ),
  Report(
    id: 2,
    title: 'Proyektor Tidak Menyala',
    location: 'Gedung D, Ruang 402',
    description:
        'Proyektor tidak dapat dinyalakan '
        'meskipun kabel sudah terhubung.',
    status: 'In Progress',
    reporter: 'Budi',
    createdAt: DateTime(2026, 11, 11),
  ),
  Report(
    id: 3,
    title: 'Lampu Laboratorium Mati',
    location: 'Laboratorium RPL',
    description:
        'Beberapa lampu di laboratorium '
        'tidak berfungsi.',
    status: 'Resolved',
    reporter: 'Citra',
    createdAt: DateTime(2026, 11, 12),
  ),
  Report(
    id: 4,
    title: 'Kursi Ruang Kelas Rusak',
    location: 'Gedung D, Ruang 405',
    description:
        'Bagian sandaran kursi mengalami '
        'kerusakan dan tidak aman digunakan.',
    status: 'Open',
    reporter: 'Dedi',
    createdAt: DateTime(2026, 11, 13),
  ),
  Report(
    id: 5,
    title: 'Wi-Fi Tidak Bisa Terhubung',
    location: 'Gedung A, Lantai 4',
    description:
        'Perangkat mahasiswa tidak dapat '
        'terhubung ke jaringan Wi-Fi.',
    status: 'In Progress',
    reporter: 'Eka',
    createdAt: DateTime(2026, 11, 14),
  ),
  Report(
    id: 6,
    title: 'Pintu Darurat Terkunci',
    location: 'Gedung D, Pintu Darurat',
    description:
        'Pintu darurat terkunci dan tidak '
        'dapat dibuka dari dalam.',
    status: 'Resolved',
    reporter: 'Fajar',
    createdAt: DateTime(2026, 11, 15),
  ),
  Report(
    id: 7,
    title: 'Dispenser Air Minum Tidak Berfungsi',
    location: 'Gedung B, Lantai 3',
    description:
        'Dispenser air minum tidak mengeluarkan '
        'air meskipun sudah diisi ulang.',
    status: 'Open',
    reporter: 'Gita',
    createdAt: DateTime(2026, 11, 16),
  ),
];
