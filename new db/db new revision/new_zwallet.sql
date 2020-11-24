-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Nov 2020 pada 17.31
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_zwallet`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `topup`
--

CREATE TABLE `topup` (
  `id` int(11) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `topup`
--

INSERT INTO `topup` (`id`, `detail`, `created_at`, `updated_at`) VALUES
(5, 'Type the virtual account number that we provide you at the top.', '2020-10-08 00:02:13', '2020-10-08 00:02:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `topup_history`
--

CREATE TABLE `topup_history` (
  `id` int(11) NOT NULL,
  `va_number` varchar(100) NOT NULL,
  `va_type` varchar(50) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `paydate_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `topup_history`
--

INSERT INTO `topup_history` (`id`, `va_number`, `va_type`, `amount`, `order_id`, `status`, `paydate_at`) VALUES
(1, '71112584525', 'bca', '10000', 'TOPUP-ID-MHO6SKfORDD22JqVNI', 1, NULL),
(2, '71112080838', 'bca', '25000', 'TOPUP-ID-bxD43cjJW2DbjgovaH', 1, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `type` enum('transfer','topup') NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_transfer` int(11) DEFAULT NULL,
  `id_topup` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `id_user`, `id_transfer`, `id_topup`, `created_at`) VALUES
(1, 'transfer', 2, 1, NULL, '2020-11-18 10:44:18'),
(2, 'transfer', 2, 2, NULL, '2020-11-18 10:46:18'),
(3, 'transfer', 2, 3, NULL, '2020-11-18 10:47:41'),
(4, 'topup', 2, NULL, 1, '2020-11-18 13:39:04'),
(5, 'transfer', 2, 4, NULL, '2020-11-18 17:01:22'),
(6, 'transfer', 2, 5, NULL, '2020-11-18 17:03:38'),
(7, 'transfer', 2, 6, NULL, '2020-11-18 17:06:43'),
(8, 'transfer', 2, 7, NULL, '2020-11-18 17:07:21'),
(9, 'topup', 2, NULL, 2, '2020-11-18 17:10:01'),
(10, 'transfer', 18, 8, NULL, '2020-11-19 09:59:35'),
(11, 'transfer', 2, 9, NULL, '2020-11-20 03:37:38'),
(12, 'transfer', 2, 10, NULL, '2020-11-20 03:40:37'),
(13, 'transfer', 2, 11, NULL, '2020-11-20 06:51:26'),
(14, 'transfer', 2, 12, NULL, '2020-11-20 07:03:49'),
(15, 'transfer', 2, 13, NULL, '2020-11-20 07:08:30'),
(16, 'transfer', 2, 14, NULL, '2020-11-20 07:08:57'),
(17, 'transfer', 2, 15, NULL, '2020-11-20 07:20:51'),
(18, 'transfer', 2, 16, NULL, '2020-11-20 07:30:03'),
(19, 'transfer', 18, 17, NULL, '2020-11-20 07:36:11'),
(20, 'transfer', 18, 18, NULL, '2020-11-20 07:46:40'),
(21, 'transfer', 18, 19, NULL, '2020-11-20 07:46:44'),
(22, 'transfer', 18, 20, NULL, '2020-11-20 07:47:39'),
(23, 'transfer', 18, 21, NULL, '2020-11-20 07:48:15'),
(24, 'transfer', 18, 22, NULL, '2020-11-20 07:48:59'),
(25, 'transfer', 18, 23, NULL, '2020-11-20 07:51:17'),
(26, 'transfer', 18, 24, NULL, '2020-11-20 07:52:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_history`
--

CREATE TABLE `transfer_history` (
  `id` int(11) NOT NULL,
  `id_receiver` int(11) NOT NULL,
  `note` text NOT NULL,
  `amount` int(11) NOT NULL,
  `balance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transfer_history`
--

INSERT INTO `transfer_history` (`id`, `id_receiver`, `note`, `amount`, `balance`) VALUES
(1, 26, 'beli sepatu', 1000, '263900'),
(2, 23, 'beli baju', 900, '262900'),
(3, 72, 'beli gorengan', 100, '262000'),
(4, 26, 'beli baju', 900, '261900'),
(5, 26, 'beli celana', 100, '261000'),
(6, 26, 'beli sepatu', 100, '260900'),
(7, 26, 'beli sepatu', 200, '260800'),
(8, 2, 'beli baju', 600, '4809688'),
(9, 18, 'beli sweater', 200, '261200'),
(10, 18, 'beli pensil', 100, '261000'),
(11, 18, 'beli permen', 50, '260900'),
(12, 24, 'beli permen', 10, '260850'),
(13, 24, 'beli ini', 10, '260840'),
(14, 24, 'beli ini', 10, '260830'),
(15, 18, 'itu', 10, '260820'),
(16, 18, 'w', 10, '260810'),
(17, 2, 'beli ini', 10000, '4809458'),
(18, 2, 'beli ini', 1000, '4799458'),
(19, 2, 'beli ini', 1000, '4798458'),
(20, 2, 'beli ini', 1000, '4797458'),
(21, 2, 'beli ini', 1000, '4796458'),
(22, 2, 'beli ini', 1000, '4795458'),
(23, 2, 'notes', 2000, '4794458'),
(24, 2, 'notes', 2000, '4792458');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `photo` varchar(255) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `device` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `balance`, `verified`, `photo`, `pin`, `role`, `device`, `created_at`, `updated_at`) VALUES
(2, 'admin zwallet', '88888', 'admin@gmail.com', '$2a$10$wyoluPglryUGVSA0HtZEjuFGzZwRmTi.7XRxGGwCZegmQ6cpuoVbG', 279800, 0, 'http://192.168.43.149:4444/images/photo-1604894724432-image-072a50f3-d12e-405e-b09a-42514527f764.jpg', '123123', 'admin', '', '2020-10-07 17:14:50', '2020-11-23 09:10:51'),
(18, 'Api Rahman123', '123', 'api@gmail.com', '$2a$10$KMa5bDraLhjKjBpyrDxgY.v0vfXHj/r4Rb2v6944Fp5kl08K19Bvm', 4790458, 0, 'http://192.168.43.149:4444/images/photo-1605782159066-image-0b7c3017-4ec8-4161-a4af-c5eefdbc2236.jpg', '123123', 'user', '', '2020-10-30 10:06:21', '2020-10-30 10:06:21'),
(23, 'ihsan', '81803707371', 'ihsan@mail.com', '$2a$10$YVCnOIbfBveG2WJq3qzaLetD43cgvcy9zCSAL5bnojO.Tb2z460MO', 2900, 0, NULL, '123123', 'user', '', '2020-11-02 02:27:45', '2020-11-02 02:27:45'),
(24, 'Muhammad Khoirul Wafa', NULL, 'wafa@gmail.com', '$2a$10$lqc.TU7xIfZb919tJcVXdepXe0MF3f.EChKnQEVxP0QImZCXtY7aK', 2030, 0, NULL, NULL, 'user', '', '2020-11-02 02:33:11', '2020-11-02 02:33:11'),
(26, 'Api Al Rahman', '123123', 'apirahman555@gmail.com', '$2a$10$JGRohrDYDkQN9AJF14ZmQe8tmutjf0fjvGAwHMXV9s95V.3cvXQFe', 1014400, 0, NULL, '123123', 'user', '', '2020-11-02 03:15:33', '2020-11-02 03:15:33'),
(72, '21321', NULL, '2131@gmail.com', '$2a$10$SKC38TBqTNDUemvxGpqt5.1E3gyV9Z5.OZVHPv4weTFnQKwjuhDfW', 1100, 0, NULL, '123123', 'user', '', '2020-11-09 02:57:24', '2020-11-09 02:57:24'),
(79, 'Ahmad Maulana Yusup', NULL, 'amy@gmail.com', '$2a$10$sfQZAeeTvcJPp1Cy.lDM.eFitE.0yS6QVcXVDhQKXie.C6ay1IrxC', 0, 0, NULL, NULL, 'user', '', '2020-11-20 08:45:47', '2020-11-23 15:56:32'),
(81, 'testing', NULL, 'testing@gmail.com', '$2a$10$cAU/aGKjl4VoKmLNppYS7OhdbekbhMRmRFYoQMVcAhsN0bGA3lQ/e', 0, 0, NULL, '123123', 'user', '', '2020-11-23 09:41:33', '2020-11-23 09:54:26'),
(82, '123', NULL, '123@gmail.com', '$2a$10$aJiraHrjRg/E5fPVqT4Fa.39CPXAzvyYUAbaKr3XsaNHqghK7kjR6', 0, 0, NULL, '123123', 'user', '', '2020-11-23 09:54:44', '2020-11-23 09:54:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `topup`
--
ALTER TABLE `topup`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `topup_history`
--
ALTER TABLE `topup_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frgn_id_topup_history` (`id_topup`),
  ADD KEY `frgn_id_transfer_history` (`id_transfer`),
  ADD KEY `frgn_id_users` (`id_user`);

--
-- Indeks untuk tabel `transfer_history`
--
ALTER TABLE `transfer_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frgn_id_to` (`id_receiver`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `topup`
--
ALTER TABLE `topup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `topup_history`
--
ALTER TABLE `topup_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `transfer_history`
--
ALTER TABLE `transfer_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `frgn_id_topup_history` FOREIGN KEY (`id_topup`) REFERENCES `topup_history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frgn_id_transfer_history` FOREIGN KEY (`id_transfer`) REFERENCES `transfer_history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frgn_id_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transfer_history`
--
ALTER TABLE `transfer_history`
  ADD CONSTRAINT `frgn_id_to` FOREIGN KEY (`id_receiver`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
