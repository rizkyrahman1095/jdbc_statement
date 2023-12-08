
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2023 at 08:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warung-samudra`
--

-- --------------------------------------------------------

--
-- Table structure for table `BRANCH`
--

CREATE TABLE `BRANCH` (
  `KODE_CABANG` varchar(20) DEFAULT NULL,
  `NAMA_CABANG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BRANCH`
--

INSERT INTO `BRANCH` (`KODE_CABANG`, `NAMA_CABANG`) VALUES
('0203', 'PANCORAN BARAT'),
('0204', 'KUNINGAN TENGAH'),
('0205', 'PASAR MINGGU'),
('0206', 'CILANDAK');

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCT`
--

CREATE TABLE `PRODUCT` (
  `KODE_PRODUCT` varchar(20) NOT NULL,
  `NAMA_PRODUCT` varchar(100) NOT NULL,
  `HARGA_SATUAN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PRODUCT`
--

INSERT INTO `PRODUCT` (`KODE_PRODUCT`, `NAMA_PRODUCT`, `HARGA_SATUAN`) VALUES
('01-001', 'NASI PUTIH', 5000),
('01-002', 'ANEKA TUMISAN', 2000),
('01-003', 'ANEKA GORENGAN', 1500),
('01-004', 'NASI GORENG BIASA', 16000),
('01-005', 'NASI GORENG SPESIAL', 19000),
('01-006', 'MIE GORENG BIASA ', 17000),
('01-007', 'ANEKA SOP', 7000),
('01-008', 'IKAN GURAME BAKAR', 55000),
('02-001', 'ES TEH TAWAR', 1000),
('02-002', 'JUICE STRAWBERRY', 23000),
('02-003', 'JUICE MANGGA', 20000),
('04-001', 'TELOR DADAR', 5000),
('04-002', 'SAMBAL MANGGA', 7000);

-- --------------------------------------------------------

--
-- Table structure for table `TRANSACTION`
--

CREATE TABLE `TRANSACTION` (
  `NO_STRUK` varchar(20) DEFAULT NULL,
  `TANGGAL_TRANSAKSI` date DEFAULT NULL,
  `JUMLAH` varchar(20) DEFAULT NULL,
  `TIPE_TRANSAKSI` varchar(100) DEFAULT NULL,
  `CABANG_ID` varchar(20) NOT NULL,
  `PRDUCT_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `TRANSACTION`
--

INSERT INTO `TRANSACTION` (`NO_STRUK`, `TANGGAL_TRANSAKSI`, `JUMLAH`, `TIPE_TRANSAKSI`, `CABANG_ID`, `PRDUCT_ID`) VALUES
('0203-2023-0001', '2023-01-03', '1', 'EAT IN', '0203', '01-001'),
('0203-2023-0001', '2023-01-03', '1', 'EAT IN', '0203', '01-002'),
('0203-2023-0001', '2023-01-03', '1', 'EAT IN', '0203', '02-001'),
('0203-2023-0002', '2023-01-03', '1', 'TAKE AWAY', '0203', '01-001'),
('0203-2023-0002', '2023-01-03', '1', 'TAKE AWAY', '0203', '01-007'),
('0203-2023-0002', '2023-01-03', '3', 'TAKE AWAY', '0203', '01-003'),
('0204-2023-0012', '2023-01-04', '1', 'ONLINE', '0204', '01-004'),
('0204-2023-0013', '2023-01-05', '1', 'TAKE AWAY', '0204', '01-006'),
('0204-2023-0014', '2023-01-05', '1', 'EAT IN', '0204', '01-005'),
('0204-2023-0014', '2023-01-05', '1', 'EAT IN', '0204', '04-001'),
('0205-2023-1000', '2023-01-03', '1', 'ONLINE', '0205', '01-008'),
('0205-2023-1000', '2023-01-03', '1', 'ONLINE', '0205', '02-002'),
('0205-2023-1000', '2023-01-03', '3', 'ONLINE', '0205', '01-001'),
('0205-2023-1000', '2023-01-03', '2', 'ONLINE', '0205', '04-002'),
('0206-2023-0923', '2023-01-06', '4', 'TAKE AWAY', '0206', '02-003');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD PRIMARY KEY (`KODE_PRODUCT`);

--
-- Indexes for table `TRANSACTION`
--
ALTER TABLE `TRANSACTION`
  ADD KEY `fk_transaction_customer` (`PRDUCT_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `TRANSACTION`
--
ALTER TABLE `TRANSACTION`
  ADD CONSTRAINT `fk_transaction_customer` FOREIGN KEY (`PRDUCT_ID`) REFERENCES `PRODUCT` (`KODE_PRODUCT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
