-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2019 at 04:19 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bayu_ta`
--

-- --------------------------------------------------------

--
-- Table structure for table `aturan`
--

CREATE TABLE `aturan` (
  `id` int(10) NOT NULL,
  `aturan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aturan`
--

INSERT INTO `aturan` (`id`, `aturan`) VALUES
(1, 'IF penerimaan_kps = Tidak THEN penerima_kip = Tidak'),
(2, 'IF penerimaan_kps = Ya AND layak_pip = Tidak THEN penerima_kip = Ya'),
(3, 'IF penerimaan_kps = Ya AND layak_pip = Ya AND penghasilan_ortu = rendah THEN penerima_kip = Tidak'),
(4, 'IF penerimaan_kps = Ya AND layak_pip = Ya AND penghasilan_ortu = sedang THEN penerima_kip = Ya'),
(5, 'IF penerimaan_kps = Ya AND layak_pip = Ya AND penghasilan_ortu = tinggi THEN penerima_kip = Ya');

-- --------------------------------------------------------

--
-- Table structure for table `cf`
--

CREATE TABLE `cf` (
  `id` int(10) NOT NULL,
  `TP` int(10) NOT NULL,
  `FP` int(10) NOT NULL,
  `TN` int(10) NOT NULL,
  `FN` int(10) NOT NULL,
  `akurasi` double NOT NULL,
  `presisi` double NOT NULL,
  `recall` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cf`
--

INSERT INTO `cf` (`id`, `TP`, `FP`, `TN`, `FN`, `akurasi`, `presisi`, `recall`) VALUES
(1, 7, 0, 22, 14, 67.44, 100, 33.33);

-- --------------------------------------------------------

--
-- Table structure for table `data_training`
--

CREATE TABLE `data_training` (
  `id` int(11) NOT NULL,
  `instansi` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `jurusan` varchar(20) DEFAULT NULL,
  `rata_un` double DEFAULT NULL,
  `kerja` varchar(10) DEFAULT NULL,
  `motivasi` varchar(20) DEFAULT NULL,
  `ipk` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_training`
--

INSERT INTO `data_training` (`id`, `instansi`, `status`, `jurusan`, `rata_un`, `kerja`, `motivasi`, `ipk`) VALUES
(1, 'SMA', 'Negeri', 'IPS', 8.13, 'Belum', 'Orang Tua', 'Rendah'),
(2, 'SMA', 'Swasta', 'IPA', 8.73, 'Belum', 'Sendiri', 'Tinggi'),
(3, 'SMA', 'Swasta', 'IPA', 7.5, 'Belum', 'Orang Tua', 'Tinggi'),
(4, 'SMA', 'Swasta', 'IPS', 7.01, 'Belum', 'Sendiri', 'Tinggi'),
(5, 'SMA', 'Swasta', 'IPA', 8.2, 'Belum', 'Sendiri', 'Tinggi'),
(6, 'SMA', 'Swasta', 'IPS', 8.1, 'Belum', 'Sendiri', 'Tinggi'),
(7, 'SMA', 'Swasta', 'IPA', 8.28, 'Belum', 'Sendiri', 'Tinggi'),
(8, 'SMA', 'Negeri', 'IPS', 8.43, 'Belum', 'Sendiri', 'Tinggi'),
(9, 'SMA', 'Swasta', 'IPA', 8.26, 'Belum', 'Orang Tua', 'Tinggi'),
(10, 'SMK', 'Swasta', 'Teknik', 7.2, 'Belum', 'Sendiri', 'Tinggi'),
(11, 'SMA', 'Swasta', 'IPA', 8.66, 'Belum', 'Orang Tua', 'Tinggi'),
(12, 'SMA', 'Negeri', 'IPA', 8.68, 'Belum', 'Sendiri', 'Tinggi'),
(13, 'SMK', 'Negeri', 'Teknik', 8.5, 'Belum', 'Sendiri', 'Tinggi'),
(14, 'SMK', 'Swasta', 'Teknik', 6.08, 'Belum', 'Sendiri', 'Rendah'),
(15, 'SMA', 'Swasta', 'IPA', 8.17, 'Belum', 'Sendiri', 'Tinggi'),
(16, 'SMA', 'Negeri', 'IPA', 9, 'Belum', 'Sendiri', 'Tinggi'),
(17, 'SMA', 'Swasta', 'IPS', 7.38, 'Belum', 'Sendiri', 'Tinggi'),
(18, 'SMK', 'Swasta', 'Teknik', 8.58, 'Sudah', 'Sendiri', 'Tinggi'),
(19, 'SMK', 'Swasta', 'Teknik', 8.74, 'Belum', 'Sendiri', 'Tinggi'),
(20, 'SMK', 'Swasta', 'Administrasi', 7.7, 'Belum', 'Sendiri', 'Rendah'),
(21, 'SMA', 'Negeri', 'IPA', 8.29, 'Sudah', 'Sendiri', 'Tinggi'),
(22, 'SMK', 'Swasta', 'Teknik', 7.32, 'Belum', 'Sendiri', 'Tinggi'),
(23, 'SMA', 'Swasta', 'IPS', 8.13, 'Belum', 'Sendiri', 'Tinggi'),
(24, 'SMK', 'Swasta', 'Teknik', 7.98, 'Belum', 'Sendiri', 'Tinggi'),
(25, 'SMK', 'Swasta', 'Teknik', 8.91, 'Sudah', 'Sendiri', 'Tinggi'),
(26, 'SMK', 'Swasta', 'Teknik', 8.2, 'Sudah', 'Sendiri', 'Tinggi'),
(27, 'SMA', 'Negeri', 'IPS', 8.52, 'Belum', 'Orang Tua', 'Tinggi'),
(28, 'SMA', 'Negeri', 'Bahasa', 7.93, 'Belum', 'Sendiri', 'Tinggi'),
(29, 'SMA', 'Swasta', 'IPS', 8.23, 'Belum', 'Sendiri', 'Rendah'),
(30, 'SMK', 'Negeri', 'Teknik', 7.94, 'Belum', 'Sendiri', 'Rendah'),
(31, 'MA', 'Swasta', 'IPS', 7.51, 'Belum', 'Sendiri', 'Tinggi'),
(32, 'SMA', 'Swasta', 'IPS', 7.91, 'Belum', 'Sendiri', 'Tinggi'),
(33, 'SMA', 'Swasta', 'IPA', 7.96, 'Sudah', 'Sendiri', 'Tinggi'),
(34, 'SMK', 'Swasta', 'Teknik', 7.03, 'Belum', 'Orang Lain', 'Tinggi'),
(35, 'SMA', 'Swasta', 'IPA', 8.47, 'Sudah', 'Sendiri', 'Tinggi'),
(36, 'SMA', 'Swasta', 'IPS', 7.5, 'Sudah', 'Sendiri', 'Tinggi'),
(37, 'SMK', 'Swasta', 'Teknik', 8, 'Belum', 'Sendiri', 'Rendah'),
(38, 'SMA', 'Swasta', 'IPA', 8.11, 'Belum', 'Sendiri', 'Rendah'),
(39, 'SMK', 'Swasta', 'Teknik', 7.43, 'Belum', 'Sendiri', 'Rendah'),
(40, 'SMA', 'Negeri', 'IPA', 8.69, 'Sudah', 'Sendiri', 'Tinggi'),
(41, 'SMA', 'Negeri', 'IPS', 7.47, 'Belum', 'Sendiri', 'Rendah'),
(42, 'SMK', 'Swasta', 'Teknik', 8.66, 'Sudah', 'Sendiri', 'Rendah'),
(43, 'SMA', 'Negeri', 'IPA', 8.33, 'Belum', 'Sendiri', 'Rendah'),
(44, 'SMK', 'Swasta', 'Teknik', 7.89, 'Belum', 'Sendiri', 'Rendah'),
(45, 'SMA', 'Swasta', 'IPS', 7.87, 'Belum', 'Sendiri', 'Rendah'),
(46, 'SMK', 'Swasta', 'Teknik', 7.63, 'Belum', 'Sendiri', 'Rendah'),
(47, 'SMA', 'Swasta', 'IPA', 8.13, 'Belum', 'Sendiri', 'Tinggi'),
(48, 'SMK', 'Swasta', 'Teknik', 7.29, 'Belum', 'Sendiri', 'Tinggi'),
(49, 'SMA', 'Negeri', 'IPS', 7.81, 'Belum', 'Sendiri', 'Tinggi'),
(50, 'SMK', 'Negeri', 'Teknik', 8.5, 'Belum', 'Sendiri', 'Rendah'),
(51, 'SMK', 'Negeri', 'Administrasi', 8.78, 'Sudah', 'Sendiri', 'Tinggi'),
(52, 'SMA', 'Negeri', 'IPA', 6.49, 'Sudah', 'Sendiri', 'Rendah'),
(53, 'SMA', 'Swasta', 'IPA', 8.2, 'Belum', 'Sendiri', 'Tinggi'),
(54, 'MA', 'Swasta', 'IPS', 7.44, 'Sudah', 'Sendiri', 'Tinggi'),
(55, 'SMA', 'Swasta', 'IPA', 7.6, 'Sudah', 'Sendiri', 'Rendah'),
(56, 'SMK', 'Negeri', 'Teknik', 8.4, 'Sudah', 'Sendiri', 'Rendah'),
(57, 'SMA', 'Swasta', 'Bahasa', 8.35, 'Belum', 'Orang tua', 'Tinggi'),
(58, 'SMA', 'Swasta', 'Bahasa', 7.8, 'Belum', 'Orang tua', 'Tinggi'),
(59, 'MA', 'Swasta', 'IPA', 7.5, 'Sudah', 'Sendiri', 'Tinggi'),
(60, 'SMA', 'Negeri', 'IPA', 8.4, 'Belum', 'Sendiri', 'Tinggi');

-- --------------------------------------------------------

--
-- Table structure for table `data_training1`
--

CREATE TABLE `data_training1` (
  `id` int(11) NOT NULL,
  `penghasilan_ortu` varchar(20) DEFAULT NULL,
  `penerimaan_kps` varchar(10) DEFAULT NULL,
  `layak_pip` varchar(10) DEFAULT NULL,
  `jumlah_saudara` int(10) DEFAULT NULL,
  `penerima_kip` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_training1`
--

INSERT INTO `data_training1` (`id`, `penghasilan_ortu`, `penerimaan_kps`, `layak_pip`, `jumlah_saudara`, `penerima_kip`) VALUES
(1, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(2, 'rendah', 'Tidak', 'Ya', 1, 'Tidak'),
(3, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(4, 'rendah', 'Tidak', 'Ya', 2, 'Tidak'),
(5, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(6, 'sedang', 'Tidak', 'Tidak', 3, 'Tidak'),
(7, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(8, 'sedang', 'Tidak', 'Tidak', 2, 'Ya'),
(9, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(10, 'sedang', 'Tidak', 'Ya', 2, 'Tidak'),
(11, 'sedang', 'Tidak', 'Tidak', 2, 'Tidak'),
(12, 'sedang', 'Ya', 'Tidak', 1, 'Tidak'),
(13, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(14, 'tinggi', 'Tidak', 'Tidak', 1, 'Tidak'),
(15, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(16, 'rendah', 'Ya', 'Tidak', 2, 'Ya'),
(17, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(18, 'rendah', 'Tidak', 'Tidak', 1, 'Tidak'),
(19, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(20, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(21, 'rendah', 'Ya', 'Tidak', 1, 'Ya'),
(22, 'sedang', 'Ya', 'Ya', 1, 'Ya'),
(23, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(24, 'sedang', 'Tidak', 'Ya', 1, 'Ya'),
(25, 'rendah', 'Tidak', 'Tidak', 1, 'Tidak'),
(26, 'rendah', 'Ya', 'Ya', 2, 'Ya'),
(27, 'sedang', 'Ya', 'Ya', 1, 'Ya'),
(28, 'rendah', 'Tidak', 'Tidak', 1, 'Tidak'),
(29, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(30, 'rendah', 'Tidak', 'Ya', 1, 'Ya'),
(31, 'tinggi', 'Ya', 'Ya', 1, 'Ya'),
(32, 'rendah', 'Tidak', 'Ya', 1, 'Ya'),
(33, 'sedang', 'Ya', 'Ya', 1, 'Ya'),
(34, 'rendah', 'Ya', 'Tidak', 1, 'Ya'),
(35, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(36, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(37, 'rendah', 'Ya', 'Tidak', 2, 'Ya'),
(38, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(39, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(40, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(41, 'sedang', 'Tidak', 'Ya', 2, 'Tidak'),
(42, 'rendah', 'Tidak', 'Ya', 2, 'Tidak'),
(43, 'rendah', 'Ya', 'Tidak', 1, 'Ya'),
(44, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(45, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(46, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(47, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(48, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(49, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(50, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(51, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(52, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(53, 'rendah', 'Ya', 'Tidak', 1, 'Ya'),
(54, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(55, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(56, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(57, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(58, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(59, 'sedang', 'Tidak', 'Tidak', 2, 'Tidak'),
(60, 'sedang', 'Tidak', 'Ya', 2, 'Tidak'),
(61, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(62, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(63, 'sedang', 'Tidak', 'Tidak', 2, 'Tidak'),
(64, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(65, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(66, 'rendah', 'Tidak', 'Ya', 1, 'Tidak'),
(67, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(68, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(69, 'rendah', 'Tidak', 'Ya', 1, 'Tidak'),
(70, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(71, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(72, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(73, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(74, 'rendah', 'Tidak', 'Ya', 1, 'Tidak'),
(75, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(76, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(77, 'sedang', 'Tidak', 'Ya', 2, 'Tidak'),
(78, 'sedang', 'Tidak', 'Tidak', 2, 'Tidak'),
(79, 'sedang', 'Tidak', 'Ya', 2, 'Tidak'),
(80, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(81, 'rendah', 'Tidak', 'Tidak', 1, 'Ya'),
(82, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(83, 'sedang', 'Tidak', 'Tidak', 2, 'Tidak'),
(84, 'rendah', 'Tidak', 'Tidak', 1, 'Ya'),
(85, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(86, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(87, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(88, 'rendah', 'Ya', 'Ya', 1, 'Tidak'),
(89, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(90, 'rendah', 'Tidak', 'Ya', 1, 'Tidak'),
(91, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(92, 'sedang', 'Tidak', 'Ya', 2, 'Tidak'),
(93, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(94, 'sedang', 'Ya', 'Ya', 1, 'Tidak'),
(95, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(96, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(97, 'rendah', 'Tidak', 'Ya', 1, 'Tidak'),
(98, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(99, 'rendah', 'Tidak', 'Tidak', 2, 'Ya'),
(100, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(101, 'tinggi', 'Tidak', 'Ya', 1, 'Tidak'),
(102, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(103, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(104, 'sedang', 'Ya', 'Ya', 1, 'Tidak'),
(105, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(106, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(107, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(108, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(109, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(110, 'sedang', 'Ya', 'Tidak', 1, 'Ya'),
(111, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(112, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(113, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(114, 'sedang', 'Tidak', 'Ya', 1, 'Tidak'),
(115, 'sedang', 'Tidak', 'Tidak', 1, 'Ya'),
(116, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(117, 'sedang', 'Ya', 'Ya', 1, 'Tidak'),
(118, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak'),
(119, 'sedang', 'Ya', 'Ya', 1, 'Ya'),
(120, 'rendah', 'Tidak', 'Ya', 1, 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `data_uji`
--

CREATE TABLE `data_uji` (
  `id` int(11) NOT NULL,
  `instansi` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `jurusan` varchar(20) DEFAULT NULL,
  `rata_un` double DEFAULT NULL,
  `kerja` varchar(10) DEFAULT NULL,
  `motivasi` varchar(20) DEFAULT NULL,
  `ipk_asli` varchar(10) DEFAULT NULL,
  `ipk_prediksi` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_uji`
--

INSERT INTO `data_uji` (`id`, `instansi`, `status`, `jurusan`, `rata_un`, `kerja`, `motivasi`, `ipk_asli`, `ipk_prediksi`) VALUES
(1, 'SMA', 'Negeri', 'IPA', 8.13, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(2, 'SMA', 'Swasta', 'IPA', 8.4, 'Belum', 'Orang Lain', 'Tinggi', 'Ya'),
(3, 'MA', 'Negeri', 'IPA', 7.91, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(4, 'SMA', 'Negeri', 'IPS', 8.4, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(5, 'SMA', 'Swasta', 'IPS', 6.75, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(6, 'SMK', 'Negeri', 'Teknik', 8.23, 'Sudah', 'Sendiri', 'Rendah', 'Ya'),
(7, 'SMK', 'Swasta', 'Teknik', 7.7, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(8, 'SMK', 'Swasta', 'Teknik', 7.9, 'Sudah', 'Sendiri', 'Rendah', 'Ya'),
(9, 'SMA', 'Negeri', 'IPS', 8.21, 'Belum', 'Orang Tua', 'Rendah', 'Ya'),
(10, 'SMA', 'Negeri', 'IPA', 8.55, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(11, 'SMK', 'Swasta', 'Teknik', 8.45, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(12, 'SMK', 'Swasta', 'Teknik', 7, 'Belum', 'Sendiri', 'Rendah', 'Ya'),
(13, 'SMA', 'Swasta', 'IPA', 7.93, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(14, 'MA', 'Swasta', 'IPS', 7.8, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(15, 'MA', 'Swasta', 'IPA', 8.48, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(16, 'SMA', 'Swasta', 'Bahasa', 7.86, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(17, 'SMA', 'Swasta', 'IPA', 8.22, 'Belum', 'Orang Lain', 'Tinggi', 'Ya'),
(18, 'SMK', 'Swasta', 'Teknik', 8.39, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(19, 'SMA', 'Swasta', 'IPA', 8.78, 'Sudah', 'Sendiri', 'Rendah', 'Ya'),
(20, 'MA', 'Negeri', 'IPS', 7.9, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(21, 'MA', 'Negeri', 'IPA', 7.89, 'Belum', 'Sendiri', 'Tinggi', 'Ya'),
(22, 'SMK', 'Swasta', 'Teknik', 7.63, 'Sudah', 'Orang Tua', 'Rendah', 'Ya'),
(23, 'SMA', 'Swasta', 'IPA', 8.73, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(24, 'MA', 'Swasta', 'IPA', 7.5, 'Belum', 'Orang Lain', 'Tinggi', 'Ya'),
(25, 'SMK', 'Negeri', 'Teknik', 8.3, 'Sudah', 'Sendiri', 'Rendah', 'Ya'),
(26, 'SMK', 'Swasta', 'Administrasi', 7.59, 'Belum', 'Sendiri', 'Rendah', 'Ya'),
(27, 'SMA', 'Swasta', 'IPA', 8.1, 'Sudah', 'Sendiri', 'Tinggi', 'Ya'),
(28, 'SMK', 'Negeri', 'Teknik', 7.5, 'Belum', 'Sendiri', 'Rendah', 'Ya'),
(29, 'SMA', 'Negeri', 'IPA', 8.3, 'Sudah', 'Orang Tua', 'Tinggi', 'Ya'),
(30, 'SMK', 'Swasta', 'Teknik', 7.69, 'Sudah', 'Sendiri', 'Rendah', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `data_uji1`
--

CREATE TABLE `data_uji1` (
  `id` int(11) NOT NULL,
  `penghasilan_ortu` varchar(20) DEFAULT NULL,
  `penerimaan_kps` varchar(10) DEFAULT NULL,
  `layak_pip` varchar(10) DEFAULT NULL,
  `jumlah_saudara` int(10) DEFAULT NULL,
  `penerima_kip` varchar(10) DEFAULT NULL,
  `prediksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_uji1`
--

INSERT INTO `data_uji1` (`id`, `penghasilan_ortu`, `penerimaan_kps`, `layak_pip`, `jumlah_saudara`, `penerima_kip`, `prediksi`) VALUES
(121, 'rendah', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(122, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak'),
(123, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(124, 'rendah', 'Tidak', 'Tidak', 1, 'Ya', 'Tidak'),
(125, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(126, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(127, 'rendah', 'Ya', 'Ya', 1, 'Tidak', 'Tidak'),
(128, 'sedang', 'Tidak', 'Tidak', 1, 'Ya', 'Tidak'),
(129, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(130, 'rendah', 'Tidak', 'Tidak', 1, 'Ya', 'Tidak'),
(131, 'sedang', 'Ya', 'Ya', 1, 'Ya', 'Ya'),
(132, 'rendah', 'Tidak', 'Ya', 2, 'Ya', 'Tidak'),
(133, 'sedang', 'Tidak', 'Ya', 1, 'Ya', 'Tidak'),
(134, 'sedang', 'Ya', 'Ya', 3, 'Ya', 'Ya'),
(135, 'rendah', 'Tidak', 'Ya', 1, 'Ya', 'Tidak'),
(136, 'rendah', 'Tidak', 'Ya', 1, 'Ya', 'Tidak'),
(137, 'rendah', 'Tidak', 'Ya', 2, 'Ya', 'Tidak'),
(138, 'tinggi', 'Tidak', 'Tidak', 2, 'Tidak', 'Tidak'),
(139, 'rendah', 'Tidak', 'Ya', 1, 'Ya', 'Tidak'),
(140, 'sedang', 'Ya', 'Tidak', 1, 'Ya', 'Ya'),
(141, 'tinggi', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak'),
(142, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak'),
(143, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(144, 'rendah', 'Ya', 'Ya', 1, 'Ya', 'Tidak'),
(145, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(146, 'rendah', 'Tidak', 'Tidak', 1, 'Ya', 'Tidak'),
(147, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak'),
(148, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak'),
(149, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(150, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak'),
(151, 'rendah', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(152, 'rendah', 'Tidak', 'Ya', 1, 'Ya', 'Tidak'),
(153, 'sedang', 'Ya', 'Ya', 1, 'Ya', 'Ya'),
(154, 'sedang', 'Tidak', 'Tidak', 1, 'Ya', 'Tidak'),
(155, 'sedang', 'Ya', 'Tidak', 1, 'Ya', 'Ya'),
(156, 'tinggi', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak'),
(157, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(158, 'rendah', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(159, 'sedang', 'Tidak', 'Ya', 1, 'Tidak', 'Tidak'),
(160, 'rendah', 'Ya', 'Ya', 1, 'Ya', 'Tidak'),
(161, 'sedang', 'Ya', 'Ya', 2, 'Ya', 'Ya'),
(162, 'sedang', 'Ya', 'Ya', 1, 'Ya', 'Ya'),
(163, 'sedang', 'Tidak', 'Tidak', 1, 'Tidak', 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `gain`
--

CREATE TABLE `gain` (
  `id` int(11) NOT NULL,
  `atribut` varchar(20) DEFAULT NULL,
  `gain` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pohon_keputusan`
--

CREATE TABLE `pohon_keputusan` (
  `id` int(11) NOT NULL,
  `parent` text,
  `akar` text,
  `keputusan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pohon_keputusan`
--

INSERT INTO `pohon_keputusan` (`id`, `parent`, `akar`, `keputusan`) VALUES
(1, '(penerimaan_kps=\'Ya\') AND (layak_pip=\'Ya\')', '(penghasilan_ortu=\'tinggi\')', 'Ya'),
(2, '(penerimaan_kps=\'Ya\') AND (layak_pip=\'Ya\') AND (penghasilan_ortu=\'sedang\' OR penghasilan_ortu=\'rendah\') AND (jumlah_saudara=\'1\')', '(penghasilan_ortu=\'sedang\')', 'Ya'),
(3, '(penerimaan_kps=\'Ya\') AND (layak_pip=\'Ya\') AND (penghasilan_ortu=\'sedang\' OR penghasilan_ortu=\'rendah\') AND (jumlah_saudara=\'1\')', '(penghasilan_ortu=\'rendah\')', 'Tidak'),
(4, '(penerimaan_kps=\'Ya\') AND (layak_pip=\'Ya\') AND (penghasilan_ortu=\'sedang\' OR penghasilan_ortu=\'rendah\')', '(jumlah_saudara=\'2\')', 'Ya'),
(5, '(penerimaan_kps=\'Ya\') AND (layak_pip=\'Tidak\')', '(penghasilan_ortu=\'rendah\')', 'Ya'),
(6, '(penerimaan_kps=\'Tidak\') AND (layak_pip=\'Ya\')', '(penghasilan_ortu=\'tinggi\')', 'Tidak'),
(7, '(penerimaan_kps=\'Tidak\') AND (layak_pip=\'Ya\') AND (penghasilan_ortu=\'sedang\' OR penghasilan_ortu=\'rendah\') AND (penghasilan_ortu=\'sedang\')', '(jumlah_saudara=\'2\')', 'Tidak'),
(8, '(penerimaan_kps=\'Tidak\') AND (layak_pip=\'Ya\') AND (penghasilan_ortu=\'sedang\' OR penghasilan_ortu=\'rendah\') AND (penghasilan_ortu=\'rendah\')', '(jumlah_saudara=\'2\')', 'Tidak'),
(9, '(penerimaan_kps=\'Tidak\') AND (layak_pip=\'Tidak\')', '(penghasilan_ortu=\'tinggi\')', 'Tidak'),
(10, '(penerimaan_kps=\'Tidak\') AND (layak_pip=\'Tidak\') AND (penghasilan_ortu=\'rendah\' OR penghasilan_ortu=\'sedang\')', '(jumlah_saudara=\'3\')', 'Tidak'),
(11, '(penerimaan_kps=\'Tidak\') AND (layak_pip=\'Tidak\') AND (penghasilan_ortu=\'rendah\' OR penghasilan_ortu=\'sedang\') AND (jumlah_saudara=\'1\' OR jumlah_saudara=\'2\') AND (penghasilan_ortu=\'sedang\')', '(jumlah_saudara=\'2\')', 'Tidak'),
(12, '(penerimaan_kps=\'Tidak\') AND (layak_pip=\'Tidak\') AND (penghasilan_ortu=\'rendah\' OR penghasilan_ortu=\'sedang\') AND (jumlah_saudara=\'1\' OR jumlah_saudara=\'2\')', '(penghasilan_ortu=\'rendah\')', 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `rasio_gain`
--

CREATE TABLE `rasio_gain` (
  `id` int(11) NOT NULL,
  `opsi` varchar(10) DEFAULT NULL,
  `cabang1` varchar(50) DEFAULT NULL,
  `cabang2` varchar(50) DEFAULT NULL,
  `rasio_gain` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rasio_gain`
--

INSERT INTO `rasio_gain` (`id`, `opsi`, `cabang1`, `cabang2`, `rasio_gain`) VALUES
(1, 'opsi1', '3', '1 , 2', 0.096),
(2, 'opsi2', '1', '2 , 3', 0.021),
(3, 'opsi3', '2', '3 , 1', 0.023);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(25) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `password` text,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `nama`, `password`, `type`) VALUES
('14621001', 'IIN NURJAYANTI', '14621001', '1'),
('14621002', 'NOVITA INDAH SARI', '14621002', '1'),
('14621003', 'NANING PURWINTARI', '14621003', '1'),
('14621004', 'MUHAMMAD SUYUTI', '14621004', '1'),
('14621005', 'ISA AHMAD ANSHORI', '14621005', '1'),
('14621006', 'ACHMAD JAELANI', '14621006', '1'),
('14621007', 'KURNIAWATI LAILA FEBRINA', '14621007', '1'),
('14621008', 'RIRIN DWI JAYANTI', '14621008', '1'),
('14621009', 'ACHMAD YANI', '14621009', '1'),
('14621010', 'MUHAMMAD YANI BUDIHARTO', '14621010', '1'),
('14621011', 'MUHAMMAD CHANIF PUTRA', '14621011', '1'),
('14621012', 'EMILYA ERAWATI', '14621012', '1'),
('14621013', 'RIZAL RUSDYANTO', '14621013', '1'),
('14621014', 'HAMIDAH', '14621014', '1'),
('14621015', 'MUHAMMAD BACHTIAR IRWIANSYAH', '14621015', '1'),
('14621016', 'NENIY FATMAWATI', '14621016', '1'),
('14621017', 'ERIN TRISILIA WINDIYANTI', '14621017', '1'),
('14621018', 'NANDA NOVELAN', '14621018', '1'),
('14621019', 'RIFATUL INAYAH', '14621019', '1'),
('14621020', 'MUHAMMAD SYAMSUL QOMARI', '14621020', '1'),
('14621021', 'MUHAMMAD NUR SHOLEH ABIDIN', '14621021', '1'),
('14621022', 'MUHAMMAD MAULUDDIN', '14621022', '1'),
('14621023', 'FITRIA SETIA NINGRUM', '14621023', '1'),
('14621024', 'MERIS WAHYU LESTARI', '14621024', '1'),
('14621025', 'RISA FEBRIANA', '14621025', '1'),
('14621026', 'SITI RIZKI MAHARAYU NINGATI', '14621026', '1'),
('14622001', 'MISLIYAH', '14622001', '1'),
('14622002', 'EKA WAHYUNING TYAS', '14622002', '1'),
('14622003', 'EKO SISWANTO', '14622003', '1'),
('14622004', 'MUHAMMAD AMINUDDIN', '14622004', '1'),
('14622005', 'M. TARSAN', '14622005', '1'),
('14622006', 'AHMAD SHOBARI', '14622006', '1'),
('14622007', 'PUTRI AMALIAH', '14622007', '1'),
('14622008', 'MAS KHURIYAH', '14622008', '1'),
('14622009', 'ADHYATNA DWI LINGANTAR', '14622009', '1'),
('14622010', 'HABIB ALBAB', '14622010', '1'),
('14622011', 'UTSMAN HAQIQI', '14622011', '1'),
('14622012', 'SUPAAT PUTRA', '14622012', '1'),
('14622013', 'MUHAMMAD LUTHFIL HAKIM', '14622013', '1'),
('14622014', 'FERI KUSUMA', '14622014', '1'),
('14622015', 'AKHMAD ZAINUDIN', '14622015', '1'),
('14622016', 'MUCHAMAD SYAERUL', '14622016', '1'),
('14622017', 'HARIYANTO', '14622017', '1'),
('14622018', 'SHINTA DIANALITA', '14622018', '1'),
('14622019', 'ARIF SUNYOTO', '14622019', '1'),
('14622020', 'MOHAMMAD ROBITHUL FAHMI', '14622020', '1'),
('14622021', 'BAGUS SATRIYO PURNOMO', '14622021', '1'),
('14622022', 'ARIF SETIAWAN', '14622022', '1'),
('14622023', 'NUR HALIMAH', '14622023', '1'),
('14622024', 'NUR HIDAYAH', '14622024', '1'),
('admin', 'kaprodi', 'admin', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aturan`
--
ALTER TABLE `aturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cf`
--
ALTER TABLE `cf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_training`
--
ALTER TABLE `data_training`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_training1`
--
ALTER TABLE `data_training1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_uji`
--
ALTER TABLE `data_uji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_uji1`
--
ALTER TABLE `data_uji1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gain`
--
ALTER TABLE `gain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pohon_keputusan`
--
ALTER TABLE `pohon_keputusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rasio_gain`
--
ALTER TABLE `rasio_gain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aturan`
--
ALTER TABLE `aturan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `data_training`
--
ALTER TABLE `data_training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `data_training1`
--
ALTER TABLE `data_training1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `data_uji`
--
ALTER TABLE `data_uji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `data_uji1`
--
ALTER TABLE `data_uji1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `gain`
--
ALTER TABLE `gain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pohon_keputusan`
--
ALTER TABLE `pohon_keputusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `rasio_gain`
--
ALTER TABLE `rasio_gain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
