-- phpMyAdmin SQL Dump
-- version 4.3.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2015 at 12:44 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cibemftif`
--
CREATE DATABASE IF NOT EXISTS `cibemftif` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cibemftif`;

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--
-- Creation: Mar 29, 2015 at 12:38 PM
--

DROP TABLE IF EXISTS `departemen`;
CREATE TABLE IF NOT EXISTS `departemen` (
  `ID_Departemen` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Nama_Ketua` varchar(100) DEFAULT NULL,
  `Nama_Wakil` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `departemen`:
--

--
-- Dumping data for table `departemen`
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
-- Table structure for table `kehadiran`
--
-- Creation: Mar 29, 2015 at 12:38 PM
--

DROP TABLE IF EXISTS `kehadiran`;
CREATE TABLE IF NOT EXISTS `kehadiran` (
  `id_kehadiran` int(11) NOT NULL,
  `id_rapat` int(10) NOT NULL,
  `id_staff` varchar(10) NOT NULL,
  `keterangan` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `kehadiran`:
--   `id_staff`
--       `staff` -> `ID_Staff`
--   `id_rapat`
--       `rapat` -> `ID_Rapat`
--

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `id_rapat`, `id_staff`, `keterangan`) VALUES
(206, 54, '5113100097', 1),
(207, 54, '5113100114', 1),
(208, 54, '5213100002', 2),
(209, 54, '5213100023', 1),
(210, 54, '5213100036', 1),
(211, 54, '5213100058', 2),
(212, 54, '5213100080', 1),
(213, 54, '5213100122', 2),
(214, 54, '5213100178', 1),
(215, 54, '5213100185', 1),
(216, 54, '5213100191', 1),
(217, 54, '5213100192', 1),
(218, 55, '5113100007', 1),
(219, 55, '5113100033', 1),
(220, 55, '5113100123', 1),
(221, 55, '5113100140', 1),
(222, 55, '5212100015', 1),
(223, 55, '5212100033', 1),
(224, 55, '5213100015', 1),
(225, 55, '5213100025', 1),
(226, 55, '5213100028', 1),
(227, 55, '5213100032', 1),
(228, 55, '5213100070', 2),
(229, 55, '5213100079', 1),
(230, 55, '5213100179', 1),
(231, 55, '5213100182', 0),
(232, 55, '5213100189', 1),
(233, 56, '5113100097', 1),
(234, 56, '5113100114', 1),
(235, 56, '5213100002', 1),
(236, 56, '5213100023', 2),
(237, 56, '5213100036', 1),
(238, 56, '5213100058', 1),
(239, 56, '5213100080', 1),
(240, 56, '5213100122', 1),
(241, 56, '5213100178', 0),
(242, 56, '5213100185', 1),
(243, 56, '5213100191', 2),
(244, 56, '5213100192', 0);

--
-- Triggers `kehadiran`
--
DROP TRIGGER IF EXISTS `kehadiran_staff`;
DELIMITER $$
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
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--
-- Creation: Mar 29, 2015 at 12:38 PM
--

DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE IF NOT EXISTS `penilaian` (
  `ID_Nilai` int(12) NOT NULL,
  `Leadership` varchar(11) NOT NULL,
  `Teamwork` varchar(11) NOT NULL,
  `Problem_Solving` varchar(11) NOT NULL,
  `Loyalitas` varchar(11) NOT NULL,
  `Kinerja` varchar(11) NOT NULL,
  `Attitude` varchar(11) NOT NULL,
  `Total_Nilai` decimal(11,0) NOT NULL,
  `ID_Staff` char(10) NOT NULL,
  `Bulan` int(11) NOT NULL,
  `ID_Departemen` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `penilaian`:
--   `ID_Staff`
--       `staff` -> `ID_Staff`
--   `ID_Departemen`
--       `departemen` -> `ID_Departemen`
--

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`ID_Nilai`, `Leadership`, `Teamwork`, `Problem_Solving`, `Loyalitas`, `Kinerja`, `Attitude`, `Total_Nilai`, `ID_Staff`, `Bulan`, `ID_Departemen`) VALUES
(93, '5', '5', '1', '1', '1', '1', '2', '5112100185', 1, 6),
(94, '5', '2', '1', '1', '1', '1', '2', '5113100041', 1, 6),
(95, '5', '1', '1', '1', '1', '1', '2', '5113100092', 1, 6),
(96, '5', '1', '1', '1', '1', '1', '2', '5113100110', 1, 6),
(97, '5', '1', '1', '1', '1', '1', '2', '5113100162', 1, 6),
(98, '5', '1', '1', '1', '1', '1', '2', '5113100193', 1, 6),
(99, '5', '1', '1', '1', '1', '1', '2', '5213100011', 1, 6),
(100, '5', '1', '1', '1', '1', '1', '2', '5213100024', 1, 6),
(101, '5', '5', '1', '1', '1', '1', '2', '5213100051', 1, 6),
(102, '5', '5', '1', '1', '1', '1', '2', '5213100057', 1, 6),
(103, '5', '2', '1', '1', '1', '1', '2', '5213100097', 1, 6),
(104, '2', '1', '5', '5', '5', '5', '4', '5213100155', 1, 6),
(105, '5', '5', '5', '5', '5', '5', '5', '5113100102', 1, 1),
(106, '1', '1', '1', '1', '1', '1', '1', '5113100107', 1, 1),
(107, '1', '1', '1', '1', '1', '1', '1', '5113100150', 1, 1),
(108, '1', '1', '1', '1', '1', '1', '1', '5113100184', 1, 1),
(109, '1', '1', '1', '1', '1', '1', '1', '5213100017', 1, 1),
(110, '1', '1', '1', '1', '1', '1', '1', '5213100029', 1, 1),
(111, '1', '1', '1', '1', '1', '1', '1', '5213100083', 1, 1),
(112, '1', '1', '1', '1', '1', '1', '1', '5213100099', 1, 1),
(113, '1', '1', '1', '1', '1', '1', '1', '5213100110', 1, 1),
(114, '1', '1', '1', '1', '1', '1', '1', '5213100131', 1, 1),
(115, '5', '1', '1', '1', '1', '1', '2', '5213100140', 1, 1),
(116, '5', '5', '5', '5', '5', '5', '5', '5113100007', 1, 2),
(117, '1', '1', '1', '1', '1', '1', '1', '5113100033', 1, 2),
(118, '1', '1', '1', '1', '1', '1', '1', '5113100123', 1, 2),
(119, '1', '1', '1', '1', '1', '1', '1', '5113100140', 1, 2),
(120, '1', '1', '1', '1', '1', '1', '1', '5212100015', 1, 2),
(121, '1', '1', '1', '1', '1', '1', '1', '5212100033', 1, 2),
(122, '1', '1', '1', '1', '1', '1', '1', '5213100015', 1, 2),
(123, '1', '1', '1', '1', '1', '1', '1', '5213100025', 1, 2),
(124, '1', '1', '1', '1', '1', '1', '1', '5213100028', 1, 2),
(125, '1', '1', '1', '1', '1', '1', '1', '5213100032', 1, 2),
(126, '5', '1', '1', '1', '1', '1', '2', '5213100070', 1, 2),
(127, '1', '1', '1', '1', '1', '1', '1', '5213100079', 1, 2),
(128, '1', '1', '1', '1', '1', '1', '1', '5213100179', 1, 2),
(129, '1', '1', '1', '1', '1', '1', '1', '5213100182', 1, 2),
(130, '1', '1', '1', '1', '1', '1', '1', '5213100189', 1, 2),
(131, '4', '5', '5', '5', '4', '5', '5', '5113100097', 1, 5),
(132, '1', '1', '1', '1', '1', '1', '1', '5113100114', 1, 5),
(133, '1', '1', '1', '1', '1', '1', '1', '5213100002', 1, 5),
(134, '1', '1', '1', '1', '1', '1', '1', '5213100023', 1, 5),
(135, '1', '1', '1', '1', '1', '1', '1', '5213100036', 1, 5),
(136, '1', '1', '1', '1', '1', '1', '1', '5213100058', 1, 5),
(137, '1', '1', '1', '1', '1', '1', '1', '5213100080', 1, 5),
(138, '1', '1', '1', '1', '1', '1', '1', '5213100122', 1, 5),
(139, '1', '1', '1', '1', '1', '1', '1', '5213100178', 1, 5),
(140, '1', '1', '1', '1', '1', '1', '1', '5213100185', 1, 5),
(141, '5', '1', '1', '1', '1', '1', '2', '5213100191', 1, 5),
(142, '1', '1', '1', '1', '1', '1', '1', '5213100192', 1, 5),
(143, '5', '1', '1', '1', '1', '1', '2', '5112100139', 1, 3),
(144, '1', '1', '1', '1', '1', '1', '1', '5112100187', 1, 3),
(145, '1', '1', '1', '1', '1', '1', '1', '5113100035', 1, 3),
(146, '1', '1', '1', '1', '1', '1', '1', '5113100048', 1, 3),
(147, '1', '1', '1', '1', '1', '1', '1', '5212100094', 1, 3),
(148, '1', '1', '1', '1', '1', '1', '1', '5213100050', 1, 3),
(149, '1', '1', '1', '1', '1', '1', '1', '5213100077', 1, 3),
(150, '1', '1', '1', '1', '1', '1', '1', '5213100101', 1, 3),
(151, '1', '1', '1', '1', '1', '1', '1', '5213100129', 1, 3),
(152, '4', '1', '1', '5', '1', '5', '3', '5113100016', 1, 4),
(153, '1', '1', '1', '1', '1', '1', '1', '5113100116', 1, 4),
(154, '1', '1', '1', '1', '1', '1', '1', '5113100128', 1, 4),
(155, '1', '1', '1', '1', '1', '1', '1', '5113100146', 1, 4),
(156, '1', '1', '1', '1', '1', '1', '1', '5113100182', 1, 4),
(157, '1', '1', '1', '1', '1', '1', '1', '5113100183', 1, 4),
(158, '1', '1', '1', '1', '1', '1', '1', '5213100018', 1, 4),
(159, '1', '1', '1', '1', '1', '1', '1', '5213100047', 1, 4),
(160, '1', '1', '1', '1', '1', '1', '1', '5213100054', 1, 4),
(161, '1', '1', '1', '1', '1', '1', '1', '5213100056', 1, 4),
(162, '1', '1', '1', '1', '1', '1', '1', '5213100063', 1, 4),
(163, '1', '1', '1', '1', '1', '1', '1', '5213100089', 1, 4),
(164, '1', '1', '1', '1', '1', '1', '1', '5213100505', 1, 4),
(165, '5', '3', '5', '5', '5', '5', '5', '5113100102', 1, 1),
(166, '3', '5', '3', '3', '3', '3', '3', '5113100107', 1, 1),
(167, '3', '3', '3', '3', '3', '3', '3', '5113100150', 1, 1),
(168, '3', '3', '3', '3', '3', '3', '3', '5113100184', 1, 1),
(169, '3', '3', '3', '3', '3', '3', '3', '5213100017', 1, 1),
(170, '3', '3', '3', '3', '3', '3', '3', '5213100029', 1, 1),
(171, '3', '3', '3', '3', '3', '3', '3', '5213100083', 1, 1),
(172, '3', '3', '3', '3', '3', '3', '3', '5213100099', 1, 1),
(173, '3', '3', '3', '3', '3', '3', '3', '5213100110', 1, 1),
(174, '3', '3', '3', '3', '3', '3', '3', '5213100131', 1, 1),
(175, '3', '3', '3', '3', '3', '3', '3', '5213100140', 1, 1),
(176, '5', '4', '4', '5', '5', '4', '5', '5113100097', 2, 5),
(177, '4', '5', '3', '5', '5', '5', '5', '5113100114', 2, 5),
(178, '5', '4', '5', '4', '4', '4', '4', '5213100002', 2, 5),
(179, '5', '5', '5', '4', '4', '5', '5', '5213100023', 2, 5),
(180, '5', '5', '4', '5', '5', '4', '5', '5213100036', 2, 5),
(181, '4', '5', '5', '4', '4', '4', '4', '5213100058', 2, 5),
(182, '5', '4', '5', '5', '5', '5', '5', '5213100080', 2, 5),
(183, '4', '4', '5', '4', '5', '5', '5', '5213100122', 2, 5),
(184, '4', '5', '4', '5', '5', '4', '5', '5213100178', 2, 5),
(185, '5', '5', '5', '4', '4', '4', '5', '5213100185', 2, 5),
(186, '4', '4', '5', '5', '4', '4', '4', '5213100191', 2, 5),
(187, '5', '5', '4', '5', '5', '5', '5', '5213100192', 2, 5),
(188, '2', '3', '3', '3', '3', '3', '3', '5113100097', 2, 5),
(189, '3', '2', '3', '3', '3', '3', '3', '5113100114', 2, 5),
(190, '3', '3', '3', '3', '3', '3', '3', '5213100002', 2, 5),
(191, '3', '3', '3', '3', '3', '3', '3', '5213100023', 2, 5),
(192, '3', '3', '3', '3', '3', '3', '3', '5213100036', 2, 5),
(193, '3', '3', '3', '3', '3', '3', '3', '5213100058', 2, 5),
(194, '3', '3', '3', '3', '3', '3', '3', '5213100080', 2, 5),
(195, '3', '3', '3', '3', '3', '3', '3', '5213100122', 2, 5),
(196, '3', '3', '3', '3', '3', '3', '3', '5213100178', 2, 5),
(197, '3', '3', '3', '3', '3', '3', '3', '5213100185', 2, 5),
(198, '3', '3', '3', '3', '3', '3', '3', '5213100191', 2, 5),
(199, '2', '3', '3', '3', '3', '3', '3', '5213100192', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rapat`
--
-- Creation: Mar 29, 2015 at 12:38 PM
--

DROP TABLE IF EXISTS `rapat`;
CREATE TABLE IF NOT EXISTS `rapat` (
  `ID_Rapat` int(5) NOT NULL,
  `Nama` varchar(1000) DEFAULT NULL,
  `Tanggal` timestamp NULL DEFAULT NULL,
  `Tempat` varchar(100) DEFAULT NULL,
  `ID_Departemen` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `rapat`:
--   `ID_Departemen`
--       `departemen` -> `ID_Departemen`
--

--
-- Dumping data for table `rapat`
--

INSERT INTO `rapat` (`ID_Rapat`, `Nama`, `Tanggal`, `Tempat`, `ID_Departemen`) VALUES
(54, 'Rapat 1 FTIf Festival', '2015-03-29 17:00:00', 'Sekretariat BEM FTIf', 5),
(55, 'Rapat Pammits I', '2015-03-17 17:00:00', 'Taman Alumni', 2),
(56, 'Rapat Extrarius', '2015-03-24 17:00:00', 'Gedung Informatika', 5);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--
-- Creation: Mar 29, 2015 at 04:14 PM
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `ID_Staff` char(10) NOT NULL,
  `ID_Departemen` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Jurusan` enum('Teknik Informatika','Sistem Informasi') NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Tempat_Lahir` varchar(100) NOT NULL,
  `Foto` blob,
  `Hadir` int(11) NOT NULL,
  `Izin` int(11) NOT NULL,
  `Absen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `staff`:
--   `ID_Departemen`
--       `departemen` -> `ID_Departemen`
--

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID_Staff`, `ID_Departemen`, `Nama`, `Jurusan`, `Email`, `Tanggal_Lahir`, `Tempat_Lahir`, `Foto`, `Hadir`, `Izin`, `Absen`) VALUES
('5112100139', 3, 'Daniel Henry ', 'Teknik Informatika', 'daniel12@mhs.is.its.ac.id', '1994-03-10', '', NULL, 0, 0, 0),
('5112100185', 6, 'Dwi Al Aji Suseno', 'Teknik Informatika', 'alaji13@mhs.if.its.ac.id', '1994-11-18', 'Malang', NULL, 0, 0, 0),
('5112100187', 3, 'Ardhya Perdana Putra', 'Teknik Informatika', 'ardhyaperdana@mhs.if.its.ac.id', '1994-04-02', 'Surabaya', NULL, 0, 0, 0),
('5113100007', 2, 'Novia Laksmi Devi', 'Teknik Informatika', 'vita12@mhs.is.its.ac.id', '1993-03-10', '', NULL, 1, 0, 0),
('5113100016', 4, 'Novita Retno Puji L', 'Teknik Informatika', 'vitaa13@mhs.if.its.ac.id', '1994-11-08', 'Malang', NULL, 0, 0, 0),
('5113100033', 2, 'David Victor Giandly', 'Teknik Informatika', 'victorDavid13@mhs.if.its.ac.id', '1994-04-08', 'Surabaya', NULL, 1, 0, 0),
('5113100035', 3, 'Yuna Sugianela', 'Sistem Informasi', 'yuna@is.its.ac.id', '1994-02-25', 'Surabaya', NULL, 0, 0, 0),
('5113100041', 6, 'Ahmad Fauzi Triyanto', 'Teknik Informatika', 'ahmaduji12@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100048', 3, 'Elisa Dian Ristianasari', 'Sistem Informasi', 'Elisa13@mhs.is.its.ac.id', '1994-04-04', 'Surabaya', NULL, 0, 0, 0),
('5113100092', 6, 'Fajar Ade Putra', 'Teknik Informatika', 'fajarade13@mhs.if.its.ac.id', '1994-09-08', 'Palembang', NULL, 0, 0, 0),
('5113100097', 5, 'Zikrul Ihsan', 'Teknik Informatika', 'zikrul@mhs.if.its.ac.id', '0000-00-00', 'Sumbawa', NULL, 2, 0, 0),
('5113100102', 1, 'Achmad Affandi', 'Sistem Informasi', 'fandi13@mhs.is.its.ac.id', '1995-03-09', 'Magetan', NULL, 0, 0, 0),
('5113100107', 1, 'Son Ardhynata Sukarno\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 0, 0, 0),
('5113100110', 6, 'Alexander Siringoringgo', 'Sistem Informasi', 'alexander13@mhs.if.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5113100114', 5, 'Ken Genesius Meta', 'Teknik Informatika', 'ken@mhs.if.its.ac.id', '0000-00-00', 'Sidoarjo', NULL, 2, 0, 0),
('5113100116', 4, 'Wildan Fajria Lazuardy', 'Teknik Informatika', 'wildan13@mhs.if.its.ac.id', '1994-09-08', 'Rembang', NULL, 0, 0, 0),
('5113100123', 2, 'Johan', 'Teknik Informatika', 'asdasd', '2015-03-03', 'asdsad', NULL, 1, 0, 0),
('5113100128', 4, 'Relaci Aprilia Istiqomah', 'Teknik Informatika', 'relaci13@mhs.if.its.ac.id', '1994-11-08', 'Malang', NULL, 0, 0, 0),
('5113100140', 2, 'Reza andriyunanto', 'Teknik Informatika', 'Reza13@if.its.ac.id', '1994-02-25', 'Surabaya', NULL, 1, 0, 0),
('5113100146', 4, 'Lusiana Nurul Aini', 'Teknik Informatika', 'lusiana@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100150', 1, 'Ibnu Prayogi\r\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 0, 0, 0),
('5113100162', 6, 'Muhammad Gupron', 'Teknik Informatika', 'gupron13@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100182', 4, 'Ishardan', 'Teknik Informatika', 'Ishardan13@mhs.if.its.ac.id', '1994-09-08', 'Palembang', NULL, 0, 0, 0),
('5113100183', 4, 'Nanang Taufan Budian', 'Teknik Informatika', 'nanangtaufan13@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5113100184', 1, 'Hanif Sudira\r\n', 'Teknik Informatika', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 0, 0, 0),
('5113100193', 6, 'Mohammad Rijal', 'Teknik Informatika', 'rijal13@mhs.if.its.ac.id', '1994-09-08', 'Bandung', NULL, 0, 0, 0),
('5212100015', 2, 'Eka Mulya Agustina', 'Sistem Informasi', 'Ekamulya@mhs.is.its.ac.id', '1993-12-04', 'Surabaya', NULL, 1, 0, 0),
('5212100033', 2, 'Jauhar Fatawi', 'Sistem Informasi', 'jauhar12@mhs.is.its.ac.id', '1994-04-04', 'Surabaya', NULL, 1, 0, 0),
('5212100094', 3, 'Erwin Wilbert', 'Sistem Informasi', 'Erwin13@mhs.is.its.ac.id', '1993-07-04', 'Surabaya', NULL, 0, 0, 0),
('5213100002', 5, 'Ervi Ritya Zulvima', 'Teknik Informatika', 'ervi.si12@mhs.if.its.ac.id', '1994-06-07', 'Madiun', NULL, 1, 1, 0),
('5213100011', 6, 'Bintang Setyawan', 'Sistem Informasi', 'bintang13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100015', 2, 'Rifatun khasanah', 'Sistem Informasi', 'rifatun13@mhs.is.its.ac.id', '1995-12-12', 'Surabaya', NULL, 1, 0, 0),
('5213100017', 1, 'Dinar Permatasari\r\n', 'Sistem Informasi', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 0, 0, 0),
('5213100018', 4, 'Mia Eka Setyaningsih', 'Sistem Informasi', 'miaeka2@mhs.if.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100023', 5, 'Nanda Puji Nugroho', 'Sistem Informasi', 'nanda@mhs.is.its.ac.id', '1994-06-07', 'Madiun', NULL, 1, 1, 0),
('5213100024', 6, 'Unsa Rokhiti', 'Sistem Informasi', 'unsa13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100025', 2, 'Muhammad asrar amir', 'Sistem Informasi', 'asrar13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 1, 0, 0),
('5213100028', 2, 'Safrina Kharisma imandani', 'Sistem Informasi', 'safrina13@mhs.is.its.ac.id', '1994-12-04', 'Surabaya', NULL, 1, 0, 0),
('5213100029', 1, 'Oriehanna Esesiawati\r\n', 'Sistem Informasi', 'Orief@gmail.com', '2015-03-09', 'Mataram', NULL, 0, 0, 0),
('5213100032', 2, 'Andre Firmansyah', 'Sistem Informasi', 'andre13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 1, 0, 0),
('5213100036', 5, 'Riza Rahmah Angelia', 'Sistem Informasi', 'riza@gmail.com', '1994-06-07', 'Cianjur', NULL, 2, 0, 0),
('5213100047', 4, 'Made mira diani', 'Sistem Informasi', 'made13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100050', 3, 'Wiqaksono Jati R', 'Sistem Informasi', 'wiqaa13@mhs.is.its.ac.id', '1995-02-03', 'Surabaya', NULL, 0, 0, 0),
('5213100051', 6, 'Nabilah Sofiani', 'Sistem Informasi', 'sofii13@mhs.is.its.ac.id', '1995-10-08', 'Cilegon', NULL, 0, 0, 0),
('5213100054', 4, 'Agung Firdamansyah', 'Sistem Informasi', 'agung13@mhs.is.its.ac.id', '1994-09-08', 'jombang', NULL, 0, 0, 0),
('5213100056', 4, 'Kirana Gita Larasati', 'Sistem Informasi', 'kikin13@mhs.is.its.ac.id', '1995-10-08', 'Cilegon', NULL, 0, 0, 0),
('5213100057', 6, 'Alvisha Farrasita Istifani', 'Sistem Informasi', 'vishaa13@mhs.if.its.ac.id', '1994-09-18', 'Aceh', NULL, 0, 0, 0),
('5213100058', 5, 'Daniel Surya Anjas', 'Sistem Informasi', 'danielmarbun@mhs.if.its.ac.id', '1995-09-08', 'Medan', NULL, 1, 1, 0),
('5213100063', 4, 'Risa Perdana Sujanawati', 'Sistem Informasi', 'Risa12@mhs.if.its.ac.id', '1994-09-18', 'Aceh', NULL, 0, 0, 0),
('5213100070', 2, 'Rr Khairunnisa Amalia', 'Sistem Informasi', 'rrkhairun13@mhs.is.its.ac.id', '1995-12-06', 'Surabaya', NULL, 0, 1, 0),
('5213100077', 3, 'Nur Sofia Arianti', 'Sistem Informasi', 'sofia13@mhs.is.its.ac.id', '1995-01-04', 'Surabaya', NULL, 0, 0, 0),
('5213100079', 2, 'Nabhihah Hanun Atikah', 'Sistem Informasi', 'Nabihah13@mhs.is.its.ac.id', '1994-12-04', 'Surabaya', NULL, 1, 0, 0),
('5213100080', 5, 'Haidar Tegar Revaldo', 'Sistem Informasi', 'edo13@mhs.is.its.ac.id', '1995-07-12', 'Malang', NULL, 2, 0, 0),
('5213100083', 1, 'Nurita Damayanti', 'Sistem Informasi', 'nurita@if.its.ac.id', '1994-11-08', 'Jakarta', NULL, 0, 0, 0),
('5213100089', 4, 'Muhammad Hafiz Egan', 'Sistem Informasi', 'egan13@mhs.is.its.ac.id', '1994-09-08', 'Madiun', NULL, 0, 0, 0),
('5213100097', 6, 'Tesar Akram Pratama', 'Sistem Informasi', 'tesar.akram13@mhs.is.its.ac.id', '1994-09-08', 'Madiun', NULL, 0, 0, 0),
('5213100099', 1, 'Tayomi Dwi Larasati', 'Sistem Informasi', 'tayomi13@mhs.is.its.ac.id', '1994-06-07', 'Cilegon', NULL, 0, 0, 0),
('5213100101', 3, 'Adimas Eka Putra', 'Sistem Informasi', 'adimas13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 0, 0, 0),
('5213100110', 1, 'Siti Oryza Khairunnisa', 'Sistem Informasi', 'oryza@mhs.is.its.ac.id', '1993-03-10', '', NULL, 0, 0, 0),
('5213100122', 5, 'Rani oktavia', 'Sistem Informasi', 'rani@mhs.is.its.ac.id', '1996-01-03', 'DKI. Jakarta', NULL, 1, 1, 0),
('5213100129', 3, 'Ahmad Sirajudding', 'Sistem Informasi', 'ahmadsira13@mhs.is.its.ac.id', '1995-01-06', 'Surabaya', NULL, 0, 0, 0),
('5213100131', 1, 'Stezar Priana', 'Sistem Informasi', 'stezar13@mhs.is.its.ac.id', '1994-09-08', 'Surabaya', NULL, 0, 0, 0),
('5213100140', 1, 'Ariska Nur Anggraini', 'Sistem Informasi', 'ariska@is.its.ac.id', '2015-03-25', 'Surabaya', NULL, 0, 0, 0),
('5213100155', 6, 'Faisal Setia Putra', 'Sistem Informasi', 'isol13@mhs.is.its.ac.id', '1994-09-08', 'banjarbaru', NULL, 0, 0, 0),
('5213100178', 5, 'Denny Angga Setiawan', 'Sistem Informasi', 'denny@mhs.is.its.ac.d', '1995-09-09', 'Jakarta', NULL, 1, 0, 1),
('5213100179', 2, 'Caesar Fajriansah', 'Sistem Informasi', 'caesar13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 1, 0, 0),
('5213100182', 2, 'Wisnu Tri Sugianto', 'Sistem Informasi', 'Wisnu13@mhs.is.its.ac.id', '1995-07-04', 'Surabaya', NULL, 0, 0, 1),
('5213100185', 5, 'Sarah Putri Ramadhani', 'Sistem Informasi', 'sarah@mhs.is.its.ac.id', '1995-08-07', 'Surabaya', NULL, 2, 0, 0),
('5213100189', 2, 'Arifianita Febrina Putri', 'Sistem Informasi', 'arifianitafebri13@mhs.is.its.ac.id', '1995-12-04', 'Surabaya', NULL, 1, 0, 0),
('5213100191', 5, 'Hemas Maselva Putri', 'Sistem Informasi', 'hemas@mhs.is.its.ac.id', '1994-12-12', 'Jember', NULL, 1, 1, 0),
('5213100192', 5, 'Zetry Prawira', 'Sistem Informasi', 'zetry@mhs', '1994-09-08', 'Malang', NULL, 1, 0, 1),
('5213100505', 4, 'Nur Annisa Istiqomah', 'Sistem Informasi', 'kokom13@mhs.is.its.ac.id', '1994-09-08', 'banjarbaru', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userx`
--
-- Creation: Mar 29, 2015 at 12:38 PM
--

DROP TABLE IF EXISTS `userx`;
CREATE TABLE IF NOT EXISTS `userx` (
  `ID_User` int(11) NOT NULL,
  `ID_Departemen` int(11) DEFAULT NULL,
  `Nama` varchar(100) NOT NULL,
  `Password` varchar(65) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `userx`:
--   `ID_Departemen`
--       `departemen` -> `ID_Departemen`
--

--
-- Dumping data for table `userx`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`ID_Departemen`), ADD UNIQUE KEY `ID_Departemen` (`ID_Departemen`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`), ADD KEY `id_rapat` (`id_rapat`), ADD KEY `id_staff` (`id_staff`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`ID_Nilai`), ADD KEY `ID_Staff` (`ID_Staff`), ADD KEY `ID_Departemen` (`ID_Departemen`);

--
-- Indexes for table `rapat`
--
ALTER TABLE `rapat`
  ADD PRIMARY KEY (`ID_Rapat`), ADD KEY `ID_Departemen` (`ID_Departemen`), ADD KEY `ID_Departemen_2` (`ID_Departemen`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID_Staff`), ADD KEY `ID_Departemen` (`ID_Departemen`);

--
-- Indexes for table `userx`
--
ALTER TABLE `userx`
  ADD PRIMARY KEY (`ID_User`), ADD UNIQUE KEY `ID_User` (`ID_User`), ADD UNIQUE KEY `ID_Departemen` (`ID_Departemen`), ADD KEY `ID_Departemen_2` (`ID_Departemen`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `ID_Nilai` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT for table `rapat`
--
ALTER TABLE `rapat`
  MODIFY `ID_Rapat` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `kehadiran`
--
ALTER TABLE `kehadiran`
ADD CONSTRAINT `kehadiran_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`ID_Staff`),
ADD CONSTRAINT `kehadiran_ibfk_3` FOREIGN KEY (`id_rapat`) REFERENCES `rapat` (`ID_Rapat`);

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`ID_Staff`) REFERENCES `staff` (`ID_Staff`),
ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`);

--
-- Constraints for table `rapat`
--
ALTER TABLE `rapat`
ADD CONSTRAINT `rapat_ibfk_1` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`);

--
-- Constraints for table `userx`
--
ALTER TABLE `userx`
ADD CONSTRAINT `userx_ibfk_1` FOREIGN KEY (`ID_Departemen`) REFERENCES `departemen` (`ID_Departemen`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
