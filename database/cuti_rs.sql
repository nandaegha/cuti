-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Sep 2024 pada 10.35
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuti_rs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cuti`
--

CREATE TABLE `cuti` (
  `id_cuti` varchar(30) NOT NULL,
  `id_user` varchar(256) NOT NULL,
  `alasan` text NOT NULL,
  `tgl_diajukan` date NOT NULL,
  `mulai` date NOT NULL,
  `berakhir` date NOT NULL,
  `id_status_cuti` int(12) NOT NULL,
  `perihal_cuti` varchar(100) NOT NULL,
  `alasan_verifikasi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cuti`
--

INSERT INTO `cuti` (`id_cuti`, `id_user`, `alasan`, `tgl_diajukan`, `mulai`, `berakhir`, `id_status_cuti`, `perihal_cuti`, `alasan_verifikasi`) VALUES
('cuti-562d0', 'd64b249f60f3c04a5ff04f7b8c9ec844', 'sakit', '2024-08-30', '2024-10-12', '2024-10-15', 3, 'cuti sakit', 'tidak'),
('cuti-714f0', '592d06bdc0ee778dab4e01d55ba8b14c', 'Karena ibu saya sakit', '2022-06-15', '2022-06-12', '2022-06-30', 1, 'Cuti Libur', NULL),
('cuti-99215', 'ebeeaf891bcf293ec607f50475648ddc', 'menemani ibu saya yang sakit, sekarang beliau masih berada dirumah sakit dan butuh saya temani selama seminggu.', '2022-06-06', '2022-06-06', '2022-06-15', 2, 'berobat', NULL),
('cuti-ede81', 'dce802a5e29e9ccabc144dfb6a37abbb', 'Liburan ke lampung', '2022-06-21', '2022-06-21', '2022-06-21', 2, 'Cuti Libur', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id_jenis_kelamin` int(11) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id_jenis_kelamin`, `jenis_kelamin`) VALUES
(1, 'Laki-Laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_cuti`
--

CREATE TABLE `status_cuti` (
  `id_status_cuti` int(11) NOT NULL,
  `status_cuti` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `status_cuti`
--

INSERT INTO `status_cuti` (`id_status_cuti`, `status_cuti`) VALUES
(1, 'Menunggu Konfirmasi'),
(2, 'Izin Cuti Diterima'),
(3, 'Izin Cuti Ditolak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(256) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `id_user_detail` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `id_user_level`, `id_user_detail`) VALUES
('298d06bc3dcda4666e67526023b4778a', 'super_admin', 'super_admin', 'superadmin@gmail.com', 3, '298d06bc3dcda4666e67526023b4778a'),
('7030f91920f543f6e2e0bbcb07c017d7', 'pimpinan', 'pimpinan', 'pimpinan@gmail.com', 3, '7030f91920f543f6e2e0bbcb07c017d7'),
('d64b249f60f3c04a5ff04f7b8c9ec844', 'pegawai', 'pegawai', 'pegawai@gmail.com', 1, 'd64b249f60f3c04a5ff04f7b8c9ec844'),
('db894ce38dfcd9acfeea11f344c5cec5', 'admin', 'admin', 'admin@gmail.com', 2, 'db894ce38dfcd9acfeea11f344c5cec5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_detail`
--

CREATE TABLE `user_detail` (
  `id_user_detail` varchar(256) NOT NULL,
  `nama_lengkap` varchar(30) DEFAULT NULL,
  `id_jenis_kelamin` int(12) DEFAULT NULL,
  `no_telp` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `pangkat` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_detail`
--

INSERT INTO `user_detail` (`id_user_detail`, `nama_lengkap`, `id_jenis_kelamin`, `no_telp`, `alamat`, `nip`, `pangkat`, `jabatan`) VALUES
('298d06bc3dcda4666e67526023b4778a', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2a9e09b8b3d521674fe3038a537d03cc', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7030f91920f543f6e2e0bbcb07c017d7', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('c551fc8847d29dc25a23db5d2cdb941b', 'malian', 2, '+62812781728', 'Jl. Sekip', '2019220028', 'Golo 1', 'Bos'),
('d64b249f60f3c04a5ff04f7b8c9ec844', 'egha', 1, '082234432234', 'genteng', '3510027771020001', 'gol 1', 'staff IT'),
('db894ce38dfcd9acfeea11f344c5cec5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dce802a5e29e9ccabc144dfb6a37abbb', 'TaufiiqulhakimIKAAA', 2, '+62812781728', 'Jl. Sekip', '1111', 'Golo 1', 'Bos');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `id_user_level` int(11) NOT NULL,
  `user_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`id_user_level`, `user_level`) VALUES
(1, 'pegawai'),
(2, 'admin'),
(3, 'super admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indeks untuk tabel `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indeks untuk tabel `status_cuti`
--
ALTER TABLE `status_cuti`
  ADD PRIMARY KEY (`id_status_cuti`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id_user_detail`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id_jenis_kelamin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `status_cuti`
--
ALTER TABLE `status_cuti`
  MODIFY `id_status_cuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
