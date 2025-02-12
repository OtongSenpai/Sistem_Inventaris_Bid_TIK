-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jan 2025 pada 12.23
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kode_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `spesifikasi` varchar(500) NOT NULL,
  `lokasi_barang` varchar(40) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  `jumlah_brg` int(5) NOT NULL,
  `jenis_brg` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`kode_barang`, `nama_barang`, `spesifikasi`, `lokasi_barang`, `kategori`, `jumlah_brg`, `jenis_brg`) VALUES
('B001', 'Office OP3 i3 4GB', '- MB Intel LGA 1156 Socket H55/H61\r\n- Prosesor Intel Core i3 550/i3 2120/i3 3240 2.9Ghz 2C/4MB\r\n- VGA OnBoard Intel HD 2500\r\n- RAM 4 GB\r\n- System Storage SSD 120GB\r\n- Chasis. SPC/Futura/PowerUp/Sejenis (Inc PSU upto 450w)', 'Gudang', 'PC', 21, 'PC'),
('B002', 'SPC SM-19HD', 'Office 19 inch / black\r\nRespon time 3ms\r\ninput : HDMI / VGA\r\n1440 h X 900 v / HD Clear display\r\nLED display\r\n60HZ high refresh / 1.98kg', 'Gudang', 'Monitor', 9, 'Monitor'),
('B003', 'Robot M102', 'DPI : 1200\r\nPolling rating : 125Hz\r\nSwitch rating : 2 million clicks\r\nInterface : USB\r\nButton : 3\r\nSize : 99.8*60.5*32mm\r\nWired length :1.5M\r\nWeight : 45.5g', 'Gudang', 'Mouse', 10, 'Mouse'),
('B004', 'K09-Wired', 'Warna: Hitam\r\nBahan: ABS\r\nPort type: USB\r\nPanjang garis: 1.3meter\r\n?Jumlah kunci: 104 keys\r\nConnection method: USB cable plug and play\r\nApakah tahan air: Tahan air\r\nBerat: 376g\r\nUkuran: 436*131*25mm', 'Gudang', 'Keyboard', 12, 'Keyboard');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_keluarbarang`
--

CREATE TABLE `tbl_keluarbarang` (
  `no_pinjam` varchar(8) NOT NULL,
  `kode_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `penerima` varchar(35) NOT NULL,
  `jumlah_keluar` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_keluarbarang`
--

INSERT INTO `tbl_keluarbarang` (`no_pinjam`, `kode_barang`, `nama_barang`, `tgl_keluar`, `penerima`, `jumlah_keluar`) VALUES
('PMJN001', 'B001', 'Office OP3 i3 4GB', '2024-12-01', 'Kaur Bidkeu', 1),
('PMJN002', 'B002', 'SPC SM-19HD', '2024-12-04', 'Kaur Bidkeu', 1),
('PMJN003', 'B003', 'Robot M102', '2024-12-17', 'Kaur Bidkeu', 3),
('PMJN004', 'B004', 'K09-Wired', '2024-12-17', 'Kaur Bidkeu', 3),
('PMJN005', 'B001', 'Office OP3 i3 4GB', '2024-12-17', 'Kaur Bidkeu', 3),
('PMJN006', 'B002', 'SPC SM-19HD', '2025-01-09', 'humas', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_masukbarang`
--

CREATE TABLE `tbl_masukbarang` (
  `id_masukbarang` varchar(11) NOT NULL,
  `kode_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `tgl_masuk` date NOT NULL DEFAULT current_timestamp(),
  `jumlah_masuk` int(8) NOT NULL,
  `kode_supplier` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_masukbarang`
--

INSERT INTO `tbl_masukbarang` (`id_masukbarang`, `kode_barang`, `nama_barang`, `tgl_masuk`, `jumlah_masuk`, `kode_supplier`) VALUES
('BMSK001', 'B001', 'Office OP3 i3 4GB', '2024-12-01', 2, 'SP001'),
('BMSK002', 'B001', 'Office OP3 i3 4GB', '2024-12-04', 3, 'SP001'),
('BMSK003', 'B002', 'SPC SM-19HD', '2024-12-04', 11, 'SP001'),
('BMSK004', 'B003', 'Robot M102', '2024-12-11', 10, 'SP002'),
('BMSK005', 'B004', 'K09-Wired', '2024-12-16', 7, 'SP004'),
('BMSK010', 'B004', 'K09-Wired', '2025-01-29', 4, 'SP002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pinjam`
--

CREATE TABLE `tbl_pinjam` (
  `nomor_pinjam` varchar(8) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `kode_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `jumlah_pinjam` int(7) NOT NULL,
  `peminjam` varchar(35) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pinjam`
--

INSERT INTO `tbl_pinjam` (`nomor_pinjam`, `tgl_pinjam`, `kode_barang`, `nama_barang`, `jumlah_pinjam`, `peminjam`, `keterangan`) VALUES
('PMJN001', '2024-12-01', 'B001', 'Office OP3 i3 4GB', 1, 'Kaur Bidkeu', 'Sudah dikembalikan'),
('PMJN002', '2024-12-04', 'B002', 'SPC SM-19HD', 1, 'Kaur Bidkeu', 'Sedang dipinjam'),
('PMJN003', '2024-12-17', 'B003', 'Robot M102', 3, 'Kaur Bidkeu', 'Sudah dikembalikan'),
('PMJN004', '2024-12-17', 'B004', 'K09-Wired', 3, 'Kaur Bidkeu', 'Sedang dipinjam'),
('PMJN005', '2024-12-17', 'B001', 'Office OP3 i3 4GB', 3, 'Kaur Bidkeu', 'Sedang dipinjam'),
('PMJN006', '2025-01-09', 'B002', 'SPC SM-19HD', 1, 'humas', 'Sedang dipinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_stok`
--

CREATE TABLE `tbl_stok` (
  `kode_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `jml_barangmasuk` int(7) NOT NULL,
  `jml_barangkeluar` int(7) NOT NULL,
  `total_barang` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_stok`
--

INSERT INTO `tbl_stok` (`kode_barang`, `nama_barang`, `jml_barangmasuk`, `jml_barangkeluar`, `total_barang`) VALUES
('B001', 'Office OP3 i3 4GB', 24, 3, 24),
('B002', 'SPC SM-19HD', 11, 2, 11),
('B003', 'Robot M102', 10, 0, 10),
('B004', 'K09-Wired', 15, 3, 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `kode_supplier` varchar(5) NOT NULL,
  `nama_supplier` varchar(35) NOT NULL,
  `alamat_supplier` varchar(50) NOT NULL,
  `telp_supplier` varchar(25) NOT NULL,
  `kota_supplier` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`kode_supplier`, `nama_supplier`, `alamat_supplier`, `telp_supplier`, `kota_supplier`) VALUES
('SP001', 'Monotaro', 'Jl. raya pajajaran No 37', '02518356343', 'Bogor'),
('SP002', 'Electronics Best', 'Jl. Gajah Mada No 55', '02518356341', 'Jakarta'),
('SP003', 'Furniture Indonesia', 'Jl. raya tamrin', '02513534764', 'Jakarta'),
('SP004', 'Dell', 'Jl. Soekarno-Hatta no.143', '02518356311', 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` varchar(8) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`) VALUES
('001', 'admin', 'ISMvKXpXpadDiUoOSoAfww==');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `tbl_masukbarang`
--
ALTER TABLE `tbl_masukbarang`
  ADD PRIMARY KEY (`id_masukbarang`),
  ADD KEY `kode_supplier` (`kode_supplier`),
  ADD KEY `fk_kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD PRIMARY KEY (`nomor_pinjam`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tbl_stok`
--
ALTER TABLE `tbl_stok`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`kode_supplier`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_masukbarang`
--
ALTER TABLE `tbl_masukbarang`
  ADD CONSTRAINT `fk_kode_barang` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`),
  ADD CONSTRAINT `kode_supplier` FOREIGN KEY (`kode_supplier`) REFERENCES `tbl_supplier` (`kode_supplier`);

--
-- Ketidakleluasaan untuk tabel `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD CONSTRAINT `kode_barang` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`);

--
-- Ketidakleluasaan untuk tabel `tbl_stok`
--
ALTER TABLE `tbl_stok`
  ADD CONSTRAINT `fk_stok_barang` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
