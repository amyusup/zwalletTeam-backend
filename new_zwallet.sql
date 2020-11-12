-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql_container:3306
-- Waktu pembuatan: 03 Nov 2020 pada 06.46
-- Versi server: 8.0.22
-- Versi PHP: 7.4.11

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
  `id` int NOT NULL,
  `detail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `id` int NOT NULL,
  `va_number` varchar(100) NOT NULL,
  `va_type` varchar(50) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `paydate_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `topup_history`
--

INSERT INTO `topup_history` (`id`, `va_number`, `va_type`, `amount`, `order_id`, `status`, `paydate_at`) VALUES
(37, '79335559580', 'bca', '10000', 'TOPUP-ID-MF2KlgAoWSrYt63KYf', 1, '2020-11-01 18:56:59'),
(38, '79335385651', 'bca', '500000', 'TOPUP-ID-YC2XFyfmGMDVdiPwKV', 0, '2020-11-03 01:50:37'),
(39, '79335385651', 'bca', '500000', 'TOPUP-ID-YC2XFyfmGMDVdiPwKV', 0, '2020-11-03 01:50:37'),
(40, '79335432689', 'bca', '500000', 'TOPUP-ID-RKISyKcJzsIgC73bA4', 0, '2020-11-03 01:51:07'),
(41, '79335964628', 'bca', '10000', 'TOPUP-ID-zudcyQalD8AmpfWbGb', 0, '2020-11-03 02:17:08'),
(42, '79335806614', 'bca', '10000', 'TOPUP-ID-gWtuvQ6j0D2oKZonxR', 0, '2020-11-03 02:17:38'),
(43, '79335000856', 'bca', '10000', 'TOPUP-ID-Bj7xCT5tNja1iSifAG', 0, '2020-11-03 02:29:48'),
(44, '79335610536', 'bca', '10000', 'TOPUP-ID-ljZugmrbjkWbVsa9UB', 1, '2020-11-02 03:04:28'),
(45, '79335700864', 'bca', '500000', 'TOPUP-ID-9bg9KpoFpfv8xt1WOf', 1, '2020-11-02 03:34:00'),
(46, '79335673478', 'bca', '500000', 'TOPUP-ID-Tk9NtuYaWpLElTSHfp', 1, '2020-11-02 03:34:49'),
(47, '79335268448', 'bca', '500000', 'TOPUP-ID-58WE1PAat1keUkUA46', 0, '2020-11-03 03:35:08'),
(48, '79335018668', 'bca', '500000', 'TOPUP-ID-AZmSCoFRp9t66vdreJ', 1, '2020-11-02 03:37:28'),
(49, '79335949879', 'bca', '500000', 'TOPUP-ID-qFULpOg15PGEzwckUt', 1, '2020-11-02 03:37:56'),
(50, '79335949879', 'bca', '500000', 'TOPUP-ID-qFULpOg15PGEzwckUt', 1, '2020-11-02 03:37:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `type` enum('transfer','topup') NOT NULL,
  `id_user` int NOT NULL,
  `id_transfer` int DEFAULT NULL,
  `id_topup` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `id_user`, `id_transfer`, `id_topup`, `created_at`) VALUES
(52, 'transfer', 2, 18, NULL, '2020-11-01 17:15:07'),
(53, 'transfer', 2, 19, NULL, '2020-11-01 17:18:16'),
(54, 'transfer', 2, 20, NULL, '2020-11-01 17:18:23'),
(55, 'transfer', 2, 21, NULL, '2020-11-01 17:18:28'),
(56, 'transfer', 2, 22, NULL, '2020-11-01 17:18:33'),
(57, 'topup', 2, NULL, 37, '2020-11-01 17:44:56'),
(58, 'topup', 2, NULL, 38, '2020-11-02 01:50:37'),
(59, 'topup', 2, NULL, 39, '2020-11-02 01:50:37'),
(60, 'topup', 2, NULL, 40, '2020-11-02 01:51:03'),
(61, 'topup', 2, NULL, 41, '2020-11-02 02:17:07'),
(62, 'topup', 2, NULL, 42, '2020-11-02 02:17:31'),
(63, 'transfer', 2, 23, NULL, '2020-11-02 02:23:54'),
(64, 'topup', 2, NULL, 43, '2020-11-02 02:29:52'),
(65, 'topup', 2, NULL, 44, '2020-11-02 03:03:49'),
(66, 'transfer', 2, 24, NULL, '2020-11-02 03:06:42'),
(67, 'transfer', 2, 25, NULL, '2020-11-02 03:13:47'),
(68, 'topup', 2, NULL, 45, '2020-11-02 03:33:42'),
(69, 'topup', 2, NULL, 46, '2020-11-02 03:34:31'),
(70, 'topup', 2, NULL, 47, '2020-11-02 03:35:07'),
(71, 'topup', 26, NULL, 48, '2020-11-02 03:36:15'),
(72, 'topup', 26, NULL, 49, '2020-11-02 03:36:40'),
(73, 'topup', 26, NULL, 50, '2020-11-02 03:36:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_history`
--

CREATE TABLE `transfer_history` (
  `id` int NOT NULL,
  `id_receiver` int NOT NULL,
  `note` text NOT NULL,
  `amount` int NOT NULL,
  `balance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transfer_history`
--

INSERT INTO `transfer_history` (`id`, `id_receiver`, `note`, `amount`, `balance`) VALUES
(18, 18, '213213', 100000, '8861688'),
(19, 18, '123213', 123213, '8761688'),
(20, 18, '123213', 123213, '8638475'),
(21, 18, '123213', 123213, '8515262'),
(22, 18, '123213', 123213, '8392049'),
(23, 18, 'notes', 12312, '8278836'),
(24, 18, 'Ini buat kamu aja aku sudah kaya', 2000000, '8276524'),
(25, 18, '123213', 123213, '6276524');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `balance` bigint NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `balance`, `verified`, `photo`, `pin`, `role`, `created_at`, `updated_at`) VALUES
(2, 'Api Rahman', '123213213', 'apirahman55@gmail.com', '$2a$10$1RK16lUwhyDWPoiK3giPqOpslRL1dklIvOdME/kEfQugKzXLsQ.nO', 8683311, 0, 'http://54.86.186.28:4444/images/photo-1604286453309-Screenshot from 2020-11-02 09-41-48.png', '123123', 'admin', '2020-10-07 17:14:50', '2020-10-07 17:14:50'),
(18, 'Api Rahman123', '213123', 'apirahman55@gmail.com', '$2a$10$KMa5bDraLhjKjBpyrDxgY.v0vfXHj/r4Rb2v6944Fp5kl08K19Bvm', 4810688, 0, NULL, '123123', 'user', '2020-10-30 10:06:21', '2020-10-30 10:06:21'),
(23, 'ihsan', '81803707371', 'ihsan@mail.com', '$2a$10$YVCnOIbfBveG2WJq3qzaLetD43cgvcy9zCSAL5bnojO.Tb2z460MO', 0, 0, NULL, '123123', 'user', '2020-11-02 02:27:45', '2020-11-02 02:27:45'),
(24, 'Muhammad Khoirul Wafa', NULL, 'wafa@gmail.com', '$2a$10$lqc.TU7xIfZb919tJcVXdepXe0MF3f.EChKnQEVxP0QImZCXtY7aK', 0, 0, NULL, NULL, 'user', '2020-11-02 02:33:11', '2020-11-02 02:33:11'),
(26, 'Api Al Rahman', '123123', 'apirahman555@gmail.com', '$2a$10$JGRohrDYDkQN9AJF14ZmQe8tmutjf0fjvGAwHMXV9s95V.3cvXQFe', 1000000, 0, 'http://54.86.186.28:4444/images/photo-1604286987761-Screenshot from 2020-11-02 09-41-38.png', '123123', 'user', '2020-11-02 03:15:33', '2020-11-02 03:15:33');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `topup_history`
--
ALTER TABLE `topup_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `transfer_history`
--
ALTER TABLE `transfer_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
