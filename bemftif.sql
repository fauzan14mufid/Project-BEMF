-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2015 at 08:10 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cibemftif`
--

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE IF NOT EXISTS `departemen` (
  `ID_Departemen` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Nama_Ketua` varchar(100) DEFAULT NULL,
  `Nama_Wakil` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `kehadiran` (
`id_kehadiran` int(11) NOT NULL,
  `id_rapat` int(10) NOT NULL,
  `id_staff` varchar(10) NOT NULL,
  `keterangan` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `id_rapat`, `id_staff`, `keterangan`) VALUES
(41, 25, '1', 1),
(42, 25, '2', 1),
(43, 25, '3', 0),
(44, 25, '4', 0),
(45, 25, '5', 2);

--
-- Triggers `kehadiran`
--
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
-- Table structure for table `penilaian`
--

CREATE TABLE IF NOT EXISTS `penilaian` (
  `ID_Nilai` varchar(12) NOT NULL,
  `Leadership` int(11) NOT NULL,
  `Teamwork` int(11) NOT NULL,
  `Problem_Solving` int(11) NOT NULL,
  `Loyalitas` int(11) NOT NULL,
  `Kinerja` int(11) NOT NULL,
  `Attitude` int(11) NOT NULL,
  `Total_Nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_staff`
--

CREATE TABLE IF NOT EXISTS `penilaian_staff` (
  `ID_Nilai` varchar(12) NOT NULL,
  `ID_Staff` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rapat`
--

CREATE TABLE IF NOT EXISTS `rapat` (
`ID_Rapat` int(5) NOT NULL,
  `Nama` varchar(1000) DEFAULT NULL,
  `Tanggal` timestamp NULL DEFAULT NULL,
  `Tempat` varchar(100) DEFAULT NULL,
  `ID_Departemen` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rapat`
--

INSERT INTO `rapat` (`ID_Rapat`, `Nama`, `Tanggal`, `Tempat`, `ID_Departemen`) VALUES
(25, '213 Rapat', '2015-02-01 17:00:00', 'SBY', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
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
  `Absen` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID_Staff`, `ID_Departemen`, `Nama`, `Jurusan`, `Email`, `Tanggal_Lahir`, `Tempat_Lahir`, `Foto`, `Hadir`, `Izin`, `Absen`) VALUES
('1', 1, 'Son Ardhynata Sukarno Mudha\r\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 8, 0, 5),
('2', 1, 'Ibnu Prayogi\r\n', 'Teknik Informatika', 'son@gmail.com', '2015-03-04', 'Nganjuk', NULL, 6, 1, 1),
('3', 1, 'Hanif Sudira\r\n', 'Teknik Informatika', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 2, 3, 3),
('4', 1, 'Dinar Permatasari\r\n', 'Sistem Informasi', 'hanif@gmail.com', '2015-03-09', 'Mataram', NULL, 4, 3, 2),
('5', 1, 'Oriehanna Esesiawati\r\n', 'Sistem Informasi', 'Orief@gmail.com', '2015-03-09', 'Mataram', NULL, 7, 1, 0),
('5113100123', 2, 'Johan', 'Teknik Informatika', 'asdasd', '2015-03-03', 'asdsad', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userx`
--

CREATE TABLE IF NOT EXISTS `userx` (
  `ID_User` int(11) NOT NULL,
  `ID_Departemen` int(11) DEFAULT NULL,
  `Nama` varchar(100) NOT NULL,
  `Password` varchar(65) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
 ADD PRIMARY KEY (`ID_Nilai`);

--
-- Indexes for table `penilaian_staff`
--
ALTER TABLE `penilaian_staff`
 ADD PRIMARY KEY (`ID_Nilai`,`ID_Staff`), ADD KEY `ID_Staff` (`ID_Staff`);

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
MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `rapat`
--
ALTER TABLE `rapat`
MODIFY `ID_Rapat` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
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
-- Constraints for table `penilaian_staff`
--
ALTER TABLE `penilaian_staff`
ADD CONSTRAINT `penilaian_staff_ibfk_1` FOREIGN KEY (`ID_Nilai`) REFERENCES `penilaian` (`ID_Nilai`),
ADD CONSTRAINT `penilaian_staff_ibfk_2` FOREIGN KEY (`ID_Staff`) REFERENCES `staff` (`ID_Staff`);

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
