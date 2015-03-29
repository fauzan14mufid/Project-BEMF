-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 29 Mar 2015 pada 11.16
-- Versi Server: 5.5.34
-- Versi PHP: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `cibemftif`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE IF NOT EXISTS `departemen` (
  `ID_Departemen` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Nama_Ketua` varchar(100) DEFAULT NULL,
  `Nama_Wakil` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Departemen`),
  UNIQUE KEY `ID_Departemen` (`ID_Departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`ID_Departemen`, `Nama`, `Nama_Ketua`, `Nama_Wakil`) VALUES
(1, 'Student Resource Developments', 'Achmad Saiful', 'Mashita Rahmawati'),
(2, 'Internal Affairs', 'Ikrom Aulia Fahdi', 'Astried Nadia Mayasari'),
(3, 'Research Technology Departmen', 'Reva yoga Pradana', 'Mona Syahmi'),
(4, 'Organization Social Responsibility', 'Arbiantoro mas', 'Rizky amalia'),
(5, 'External Affairs', 'M. Satrio Ramadhana Yudhono', 'Ariesa Putri Andini'),
(6, 'Information Media', 'Claudio Denta', 'Esti Widyapraba');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kehadiran`
--

CREATE TABLE IF NOT EXISTS `kehadiran` (
  `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT,
  `id_rapat` int(10) NOT NULL,
  `id_staff` varchar(10) NOT NULL,
  `keterangan` int(11) NOT NULL,
  PRIMARY KEY (`id_kehadiran`),
  KEY `id_rapat` (`id_rapat`),
  KEY `id_staff` (`id_staff`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

--
-- Dumping data untuk tabel `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `id_rapat`, `id_staff`, `keterangan`) VALUES
(63, 39, '5113100097', 1),
(64, 39, '5113100114', 1),
(65, 39, '5213100002', 1),
(66, 39, '5213100023', 1),
(67, 39, '5213100036', 1),
(68, 39, '5213100058', 2),
(69, 39, '5213100080', 1),
(70, 39, '5213100122', 2),
(71, 39, '5213100178', 1),
(72, 39, '5213100185', 1),
(73, 39, '5213100191', 1),
(74, 39, '5213100192', 2),
(75, 40, '5113100097', 1),
(76, 40, '5113100114', 1),
(77, 40, '5213100002', 1),
(78, 40, '5213100023', 1),
(79, 40, '5213100036', 1),
(80, 40, '5213100058', 0),
(81, 40, '5213100080', 1),
(82, 40, '5213100122', 1),
(83, 40, '5213100178', 1),
(84, 40, '5213100185', 2),
(85, 40, '5213100191', 1),
(86, 40, '5213100192', 1),
(87, 41, '5113100097', 1),
(88, 41, '5113100114', 1),
(89, 41, '5213100002', 1),
(90, 41, '5213100023', 1),
(91, 41, '5213100036', 1),
(92, 41, '5213100058', 1),
(93, 41, '5213100080', 1),
(94, 41, '5213100122', 1),
(95, 41, '5213100178', 1),
(96, 41, '5213100185', 1),
(97, 41, '5213100191', 1),
(98, 41, '5213100192', 1);

--
-- Trigger `kehadiran`
--
DROP TRIGGER IF EXISTS `kehadiran_staff`;
DELIMITER //
CREATE TRIGGER `kehadiran_staff` AFTER INSERT ON `kehadiran`
 FOR EACH ROW BEGIN
	declare old_hadir int;

    if (new.keterangan = 1) then
    	select Hadir into old_hadir from staff
        where new.ID_Staff = staff.ID_Staff;
   		update staff set Hadir = old_hadir + 1
		where new.ID_Staff = staff.ID_Staff;
    elseif (new.keterangan = 2) then
    	select Izin into old_hadir from staff
        where new.ID_Staff = staff.ID_Staff;
   		update staff set Izin = old_hadir + 1
		where new.ID_Staff = staff.ID_Staff;
   	elseif (new.keterangan = 0) then
    	select Absen into old_hadir from staff
        where new.ID_Staff = staff.ID_Staff;
   		update staff set Absen = old_hadir + 1
		where new.ID_Staff = staff.ID_Staff;
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE IF NOT EXISTS `penilaian` (
  `ID_Nilai` int(12) NOT NULL AUTO_INCREMENT,
  `Leadership` varchar(11) NOT NULL,
  `Teamwork` varchar(11) NOT NULL,
  `Problem_Solving` varchar(11) NOT NULL,
  `Loyalitas` varchar(11) NOT NULL,
  `Kinerja` varchar(11) NOT NULL,
  `Attitude` varchar(11) NOT NULL,
  `Total_Nilai` int(11) NOT NULL,
  `ID_Staff` char(10) NOT NULL,
  `Bulan` int(11) NOT NULL,
  `ID_Departemen` int(11) NOT NULL,
  PRIMARY KEY (`ID_Nilai`),
  KEY `ID_Staff` (`ID_Staff`),
  KEY `ID_Departemen` (`ID_Departemen`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`ID_Nilai`, `Leadership`, `Teamwork`, `Problem_Solving`, `Loyalitas`, `Kinerja`, `Attitude`, `Total_Nilai`, `ID_Staff`, `Bulan`, `ID_Departemen`) VALUES
(36, '1', '1', '1', '1', '1', '1', 1, '5113100102', 3, 1),
(37, '1', '1', '1', '1', '1', '1', 1, '5113100107', 3, 1),
(38, '1', '1', '1', '1', '1', '1', 1, '5113100150', 3, 1),
(39, '1', '1', '1', '1', '1', '1', 1, '5113100184', 3, 1),
(40, '1', '1', '1', '1', '1', '1', 1, '5213100017', 3, 1),
(41, '1', '1', '1', '1', '1', '1', 1, '5213100029', 3, 1),
(42, '1', '1', '1', '1', '1', '1', 1, '5213100083', 3, 1),
(43, '1', '1', '1', '1', '1', '1', 1, '5213100099', 3, 1),
(44, '1', '1', '1', '1', '1', '1', 1, '5213100110', 3, 1),
(45, '1', '1', '1', '1', '1', '1', 1, '5213100131', 3, 1),
(46, '1', '1', '1', '1', '1', '1', 1, '5213100140', 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rapat`
--

CREATE TABLE IF NOT EXISTS `rapat` (
  `ID_Rapat` int(5) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(1000) DEFAULT NULL,
  `Tanggal` timestamp NULL DEFAULT NULL,
  `Tempat` varchar(100) DEFAULT NULL,
  `ID_Departemen` int(11) NOT NULL,
  PRIMARY KEY (`ID_Rapat`),
  KEY `ID_Departemen` (`ID_Departemen`),
  KEY `ID_Departemen_2` (`ID_Departemen`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data untuk tabel `rapat`
--

INSERT INTO `rapat` (`ID_Rapat`, `Nama`, `Tanggal`, `Tempat`, `ID_Departemen`) VALUES
(26, 'LALA', '0000-00-00 00:00:00', 'K', 2),
(27, '', '0000-00-00 00:00:00', '', 1),
(28, '', '0000-00-00 00:00:00', '', 2),
(29, '', '0000-00-00 00:00:00', '', 2),
(30, 'dasdasdasd', '2015-03-10 17:00:00', 'asdasda', 2),
(31, 'asdfasfas', '2015-03-10 17:00:00', '', 2),
(32, 'lala', '2015-03-10 17:00:00', 'asdasd', 2),
(33, '', '0000-00-00 00:00:00', '', 2),
(34, 'adas', '2015-03-19 17:00:00', 'jhgj', 1),
(35, 'adas', '2015-03-26 17:00:00', 'klbkjhb', 1),
(36, 'adas', '2015-03-06 17:00:00', 'klbkjhb', 1),
(37, 'adas', '2015-03-06 17:00:00', 'klbkjhb', 1),
(38, 'adas', '2015-03-11 17:00:00', 'klbkjhb', 1),
(39, 'prepare FTIf Festival', '2015-03-05 17:00:00', 'Sekretariat FTIf', 5),
(40, 'prepare FTIf Festival II', '2015-03-16 17:00:00', 'Taman Rektorart', 5),
(41, 'Rapat Koordinasi FTIF fest', '2015-03-01 17:00:00', 'Taman Alumni', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `ID_Staff` char(10) NOT NULL,
  `ID_Departemen` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Jurusan` enum('Teknik Informatika','Sistem Informasi') NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Tempat_Lahir` varchar(100) NOT NULL,
  `Foto` blob,
  `Hadir` int(11) DEFAULT '0',
  `Izin` int(11) DEFAULT '0',
  `Absen` int(11) DEFAULT '0',
  PRIMARY KEY (`ID_Staff`),
  KEY `ID_Departemen` (`ID_Departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `staff`
--

INSERT INTO `staff` (`ID_Staff`, `ID_Departemen`, `Nama`, `Jurusan`, `Email`, `Tanggal_Lahir`, `Tempat_Lahir`, `Foto`, `Hadir`, `Izin`, `Absen`) VALUES
('5112100139', 3, 'Daniel Henry ', 'Teknik Informatika', 'daniel12@mhs.is.its.ac.id', '1994-03-10', '', NULL, 0, 0, 0),
('5112100185', 6, 'Dwi Al Aji Suseno', 'Teknik Informatika', 'alaji13@mhs.if.its.ac.id', '1994-11-18', 'Malang', NULL, 0, 0, 0),
('5112100187', 3, 'Ardhya Perdana Putra', 'Teknik Informatika', 'ardhyaperdana@mhs.if.its.ac.id', '1994-04-02', 'Surabaya', NULL, 0, 0, 0),
('5113100007', 2, 'Novia Laksmi Devi', 'Teknik Informatika', 'vita12@mhs.is.its.ac.id', '1993-03-10', '', NULL, 0, 0, 0),
('5113100016', 4, 'Novita Retno Puji L', 'Teknik Informatika', 'vitaa13@mhs.if.its.ac.id', '1994-11-08', 'Malang', NULL, 0, 0, 0),
('5113100033', 2, 'David Victor Giandly', 'Teknik Informatika', 'victorDavid13@mhs.if.its.ac.id', '1994-04-08', 'Surabaya', NULL, 0, 0, 0),
('5113100035', 3, 'Yuna Sugianela', 'Sistem Informasi', 'yuna@is.its.ac.id', '1994-02-25', 'Surabaya', NULL, 0, 0, 0),
('5113100041', 6, 'Ahmad Fauzi Triyanto', 'Teknik Informatika', 'ahmaduji12@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100048', 3, 'Elisa Dian Ristianasari', 'Sistem Informasi', 'Elisa13@mhs.is.its.ac.id', '1994-04-04', 'Surabaya', NULL, 0, 0, 0),
('5113100092', 6, 'Fajar Ade Putra', 'Teknik Informatika', 'fajarade13@mhs.if.its.ac.id', '1994-09-08', 'Palembang', NULL, 0, 0, 0),
('5113100097', 5, 'Zikrul Ihsan', 'Teknik Informatika', 'zikrul@mhs.if.its.ac.id', '0000-00-00', 'Sumbawa', NULL, 3, 0, 0),
('5113100102', 1, 'Achmad Affandi', 'Sistem Informasi', 'fandi13@mhs.is.its.ac.id', '1995-03-09', 'Magetan', NULL, 0, 0, 0),
('5113100107', 1, 'Son Ardhynata Sukarno Mudha\r\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 10, 0, 5),
('5113100110', 6, 'Alexander Siringoringgo', 'Sistem Informasi', 'alexander13@mhs.if.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5113100114', 5, 'Ken Genesius Meta', 'Teknik Informatika', 'ken@mhs.if.its.ac.id', '0000-00-00', 'Sidoarjo', NULL, 3, 0, 0),
('5113100116', 4, 'Wildan Fajria Lazuardy', 'Teknik Informatika', 'wildan13@mhs.if.its.ac.id', '1994-09-08', 'Rembang', NULL, 0, 0, 0),
('5113100123', 2, 'Johan', 'Teknik Informatika', 'asdasd', '2015-03-03', 'asdsad', NULL, 4, 3, 0),
('5113100128', 4, 'Relaci Aprilia Istiqomah', 'Teknik Informatika', 'relaci13@mhs.if.its.ac.id', '1994-11-08', 'Malang', NULL, 0, 0, 0),
('5113100140', 2, 'Reza andriyunanto', 'Teknik Informatika', 'Reza13@if.its.ac.id', '1994-02-25', 'Surabaya', NULL, 0, 0, 0),
('5113100146', 4, 'Lusiana Nurul Aini', 'Teknik Informatika', 'lusiana@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100150', 1, 'Ibnu Prayogi\r\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 8, 1, 1),
('5113100162', 6, 'Muhammad Gupron', 'Teknik Informatika', 'gupron13@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100182', 4, 'Ishardan', 'Teknik Informatika', 'Ishardan13@mhs.if.its.ac.id', '1994-09-08', 'Palembang', NULL, 0, 0, 0),
('5113100183', 4, 'Nanang Taufan Budiansyah', 'Teknik Informatika', 'nanangtaufan13@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100184', 1, 'Hanif Sudira\r\n', 'Teknik Informatika', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 3, 4, 3),
('5113100193', 6, 'Mohammad Rijal', 'Teknik Informatika', 'rijal13@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5212100015', 2, 'Eka Mulya Agustina', 'Sistem Informasi', 'Ekamulya@mhs.is.its.ac.id', '1993-12-04', 'Surabaya', NULL, 0, 0, 0),
('5212100033', 2, 'Jauhar Fatawi', 'Sistem Informasi', 'jauhar12@mhs.is.its.ac.id', '1994-04-04', 'Surabaya', NULL, 0, 0, 0),
('5212100094', 3, 'Erwin Wilbert', 'Sistem Informasi', 'Erwin13@mhs.is.its.ac.id', '1993-07-04', 'Surabaya', NULL, 0, 0, 0),
('5213100002', 5, 'Ervi Ritya Zulvima', 'Teknik Informatika', 'ervi.si12@mhs.if.its.ac.id', '1994-06-07', 'Madiun', NULL, 3, 0, 0),
('5213100011', 6, 'Bintang Setyawan', 'Sistem Informasi', 'bintang13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100015', 2, 'Rifatun khasanah', 'Sistem Informasi', 'rifatun13@mhs.is.its.ac.id', '1995-12-12', 'Surabaya', NULL, 0, 0, 0),
('5213100017', 1, 'Dinar Permatasari\r\n', 'Sistem Informasi', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 6, 3, 2),
('5213100018', 4, 'Mia Eka Setyaningsih', 'Sistem Informasi', 'miaeka2@mhs.if.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100023', 5, 'Nanda Puji Nugroho', 'Sistem Informasi', 'nanda@mhs.is.its.ac.id', '1994-06-07', 'Madiun', NULL, 3, 0, 0),
('5213100024', 6, 'Unsa Rokhiti', 'Sistem Informasi', 'unsa13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100025', 2, 'Muhammad asrar amir', 'Sistem Informasi', 'asrar13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100028', 2, 'Safrina Kharisma imandani', 'Sistem Informasi', 'safrina13@mhs.is.its.ac.id', '1994-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100029', 1, 'Oriehanna Esesiawati\r\n', 'Sistem Informasi', 'Orief@gmail.com', '2015-03-09', 'Mataram', NULL, 9, 1, 0),
('5213100032', 2, 'Andre Firmansyah', 'Sistem Informasi', 'andre13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100036', 5, 'Riza Rahmah Angelia', 'Sistem Informasi', 'riza@gmail.com', '1994-06-07', 'Cianjur', NULL, 3, 0, 0),
('5213100047', 4, 'Made mira diani', 'Sistem Informasi', 'made13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100050', 3, 'Wiqaksono Jati R', 'Sistem Informasi', 'wiqaa13@mhs.is.its.ac.id', '1995-02-03', 'Surabaya', NULL, 0, 0, 0),
('5213100051', 6, 'Nabilah Sofiani', 'Sistem Informasi', 'sofii13@mhs.is.its.ac.id', '1995-10-08', 'Cilegon', NULL, 0, 0, 0),
('5213100054', 4, 'Agung Firdamansyah', 'Sistem Informasi', 'agung13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100056', 4, 'Kirana Gita Larasati', 'Sistem Informasi', 'kikin13@mhs.is.its.ac.id', '1995-10-08', 'Cilegon', NULL, 0, 0, 0),
('5213100057', 6, 'Alvisha Farrasita Istifani', 'Sistem Informasi', 'vishaa13@mhs.if.its.ac.id', '1994-09-18', 'Aceh', NULL, 0, 0, 0),
('5213100058', 5, 'Daniel Surya Anjas', 'Sistem Informasi', 'danielmarbun@mhs.if.its.ac.id', '1995-09-08', 'Medan', NULL, 1, 1, 1),
('5213100063', 4, 'Risa Perdana Sujanawati', 'Sistem Informasi', 'Risa12@mhs.if.its.ac.id', '1994-09-18', 'Aceh', NULL, 0, 0, 0),
('5213100070', 2, 'Rr Khairunnisa Amalia', 'Sistem Informasi', 'rrkhairun13@mhs.is.its.ac.id', '1995-12-06', 'Surabaya', NULL, 0, 0, 0),
('5213100077', 3, 'Nur Sofia Arianti', 'Sistem Informasi', 'sofia13@mhs.is.its.ac.id', '1995-01-04', 'Surabaya', NULL, 0, 0, 0),
('5213100079', 2, 'Nabhihah Hanun Atikah', 'Sistem Informasi', 'Nabihah13@mhs.is.its.ac.id', '1994-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100080', 5, 'Muchammad Haidar Tegar Revaldo', 'Sistem Informasi', 'edo13@mhs.is.its.ac.id', '1995-07-12', 'Malang', NULL, 3, 0, 0),
('5213100083', 1, 'Nurita Damayanti', 'Sistem Informasi', 'nurita@if.its.ac.id', '1994-11-08', 'Jakarta', NULL, 0, 0, 0),
('5213100089', 4, 'Muhammad Hafiz Egan', 'Sistem Informasi', 'egan13@mhs.is.its.ac.id', '1994-09-08', 'Madiun', NULL, 0, 0, 0),
('5213100097', 6, 'Tesar Akram Pratama', 'Sistem Informasi', 'tesar.akram13@mhs.is.its.ac.id', '1994-09-08', 'Madiun', NULL, 0, 0, 0),
('5213100099', 1, 'Tayomi Dwi Larasati', 'Sistem Informasi', 'tayomi13@mhs.is.its.ac.id', '1994-06-07', 'Cilegon', NULL, 0, 0, 0),
('5213100101', 3, 'Adimas Eka Putra', 'Sistem Informasi', 'adimas13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100110', 1, 'Siti Oryza Khairunnisa', 'Sistem Informasi', 'oryza@mhs.is.its.ac.id', '1993-03-10', '', NULL, 0, 0, 0),
('5213100122', 5, 'Rani oktavia', 'Sistem Informasi', 'rani@mhs.is.its.ac.id', '1996-01-03', 'DKI. Jakarta', NULL, 2, 1, 0),
('5213100129', 3, 'Ahmad Sirajudding', 'Sistem Informasi', 'ahmadsira13@mhs.is.its.ac.id', '1995-01-06', 'Surabaya', NULL, 0, 0, 0),
('5213100131', 1, 'Stezar Priana', 'Sistem Informasi', 'stezar13@mhs.is.its.ac.id', '1994-09-08', 'Surabaya', NULL, 0, 0, 0),
('5213100140', 1, 'Ariska Nur Anggraini', 'Sistem Informasi', 'ariska@is.its.ac.id', '2015-03-25', 'Surabaya', NULL, 0, 0, 0),
('5213100155', 6, 'Faisal Setia Putra', 'Sistem Informasi', 'isol13@mhs.is.its.ac.id', '1994-09-08', 'banjarbaru', NULL, 0, 0, 0),
('5213100178', 5, 'Denny Angga Setiawan', 'Sistem Informasi', 'denny@mhs.is.its.ac.d', '1995-09-09', 'Jakarta', NULL, 3, 0, 0),
('5213100179', 2, 'Caesar Fajriansah', 'Sistem Informasi', 'caesar13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100182', 2, 'Wisnu Tri Sugianto', 'Sistem Informasi', 'Wisnu13@mhs.is.its.ac.id', '1995-07-04', 'Surabaya', NULL, 0, 0, 0),
('5213100185', 5, 'Sarah Putri Ramadhani', 'Sistem Informasi', 'sarah@mhs.is.its.ac.id', '1995-08-07', 'Surabaya', NULL, 2, 1, 0),
('5213100189', 2, 'Arifianita Febrina Putri', 'Sistem Informasi', 'arifianitafebri13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100191', 5, 'Hemas Maselva Putri', 'Sistem Informasi', 'hemas@mhs.is.its.ac.id', '1994-12-12', 'Jember', NULL, 3, 0, 0),
('5213100192', 5, 'Zetry Prawira', 'Sistem Informasi', 'zetry@mhs', '1994-09-08', 'Malang', NULL, 2, 1, 0),
('5213100505', 4, 'Nur Annisa Istiqomah', 'Sistem Informasi', 'kokom13@mhs.is.its.ac.id', '1994-09-08', 'banjarbaru', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `userx`
--

CREATE TABLE IF NOT EXISTS `userx` (
  `ID_User` int(11) NOT NULL,
  `ID_Departemen` int(11) DEFAULT NULL,
  `Nama` varchar(100) NOT NULL,
  `Password` varchar(65) NOT NULL,
  `Status` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_User`),
  UNIQUE KEY `ID_User` (`ID_User`),
  UNIQUE KEY `ID_Departemen` (`ID_Departemen`),
  KEY `ID_Departemen_2` (`ID_Departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `userx`
--

INSERT INTO `userx` (`ID_User`, `ID_Departemen`, `Nama`, `Password`, `Status`) VALUES
(0, NULL, 'admin', 'admin', 'admin'),
(1, 1, 'SRD', 'bemftif', 'BPH'),
(2, 2, 'IA', 'bemftif', 'BPH'),
(3, 3, 'RTD', 'bemftif', 'BPH'),
(4, 4, 'OSR', 'bemftif', 'BPH'),
(5, 5, 'EA', 'bemftif', 'BPH'),
(6, 6, 'IM', 'bemftif', 'BPH');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `kehadiran_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`ID_Staff`),
  ADD CONSTRAINT `kehadiran_ibfk_3` FOREIGN KEY (`id_rapat`) REFERENCES `rapat` (`ID_Rapat`);

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`),
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`ID_Staff`) REFERENCES `staff` (`ID_Staff`);

--
-- Ketidakleluasaan untuk tabel `rapat`
--
ALTER TABLE `rapat`
  ADD CONSTRAINT `rapat_ibfk_1` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`);

--
-- Ketidakleluasaan untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`);

--
-- Ketidakleluasaan untuk tabel `userx`
--
ALTER TABLE `userx`
  ADD CONSTRAINT `userx_ibfk_1` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
