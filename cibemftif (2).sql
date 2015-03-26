-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 26 Mar 2015 pada 14.01
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data untuk tabel `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `id_rapat`, `id_staff`, `keterangan`) VALUES
(41, 25, '1', 1),
(42, 25, '2', 1),
(43, 25, '3', 0),
(44, 25, '4', 0),
(45, 25, '5', 2),
(46, 26, '5113100123', 2),
(47, 27, '1', 1),
(48, 27, '2', 1),
(49, 27, '3', 2),
(50, 27, '4', 1),
(51, 27, '5', 1),
(52, 28, '5113100123', 1),
(53, 29, '5113100123', 1),
(54, 30, '5113100123', 2),
(55, 31, '5113100123', 1),
(56, 32, '5113100123', 2),
(57, 33, '5113100123', 1),
(58, 38, '1', 1),
(59, 38, '2', 1),
(60, 38, '3', 1),
(61, 38, '4', 1),
(62, 38, '5', 1);

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
  PRIMARY KEY (`ID_Nilai`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`ID_Nilai`, `Leadership`, `Teamwork`, `Problem_Solving`, `Loyalitas`, `Kinerja`, `Attitude`, `Total_Nilai`) VALUES
(1, '1', '1', '1', '1', '1', '1', 1),
(2, '1', '1', '1', '1', '1', '1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian_staff`
--

CREATE TABLE IF NOT EXISTS `penilaian_staff` (
  `ID_Nilai` int(12) NOT NULL AUTO_INCREMENT,
  `ID_Staff` char(10) NOT NULL,
  PRIMARY KEY (`ID_Nilai`,`ID_Staff`),
  KEY `ID_Staff` (`ID_Staff`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data untuk tabel `rapat`
--

INSERT INTO `rapat` (`ID_Rapat`, `Nama`, `Tanggal`, `Tempat`, `ID_Departemen`) VALUES
(25, '213 Rapat', '2015-02-01 17:00:00', 'SBY', 1),
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
(38, 'adas', '2015-03-11 17:00:00', 'klbkjhb', 1);

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
('1', 1, 'Son Ardhynata Sukarno Mudha\r\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 10, 0, 5),
('2', 1, 'Ibnu Prayogi\r\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 8, 1, 1),
('3', 1, 'Hanif Sudira\r\n', 'Teknik Informatika', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 3, 4, 3),
('4', 1, 'Dinar Permatasari\r\n', 'Sistem Informasi', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 6, 3, 2),
('5', 1, 'Oriehanna Esesiawati\r\n', 'Sistem Informasi', 'Orief@gmail.com', '2015-03-09', 'Mataram', NULL, 9, 1, 0),
('5113100123', 2, 'Johan', 'Teknik Informatika', 'asdasd', '2015-03-03', 'asdsad', NULL, 4, 3, 0);

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
-- Ketidakleluasaan untuk tabel `penilaian_staff`
--
ALTER TABLE `penilaian_staff`
  ADD CONSTRAINT `penilaian_staff_ibfk_2` FOREIGN KEY (`ID_Staff`) REFERENCES `staff` (`ID_Staff`),
  ADD CONSTRAINT `penilaian_staff_ibfk_3` FOREIGN KEY (`ID_Nilai`) REFERENCES `penilaian` (`ID_Nilai`);

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
