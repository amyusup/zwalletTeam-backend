-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Nov 2020 pada 00.10
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
(50, '79335949879', 'bca', '500000', 'TOPUP-ID-qFULpOg15PGEzwckUt', 1, '2020-11-02 03:37:56'),
(52, '79335923671', 'bca', '10000', 'TOPUP-ID-fG73W5USuQtZHTc7Fg', 0, NULL),
(53, '79335518731', 'bca', '25000', 'TOPUP-ID-Aa6fZHUBJLovt2LGTU', 0, NULL),
(54, '79335811980', 'bca', '250000', 'TOPUP-ID-QtUNBcHF1WGFlXNVbm', 0, NULL),
(55, '79335941478', 'bca', '250000', 'TOPUP-ID-3kmSaB1VcfvWoCYkzf', 0, NULL),
(56, '79335469864', 'bca', '50000', 'TOPUP-ID-9IeqM6xS3a99uwDQDM', 0, NULL),
(57, '79335469864', 'bca', '50000', 'TOPUP-ID-9IeqM6xS3a99uwDQDM', 0, NULL),
(58, '71112091375', 'bca', '250000', 'TOPUP-ID-J9l0rh74wBCRpuzq7R', 0, NULL);

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
(73, 'topup', 26, NULL, 50, '2020-11-02 03:36:41'),
(75, 'topup', 2, NULL, 52, '2020-11-07 05:44:16'),
(76, 'topup', 18, NULL, 53, '2020-11-08 13:14:14'),
(77, 'topup', 18, NULL, 54, '2020-11-08 13:21:56'),
(78, 'topup', 18, NULL, 55, '2020-11-08 13:31:30'),
(79, 'topup', 18, NULL, 56, '2020-11-08 14:14:12'),
(80, 'topup', 18, NULL, 57, '2020-11-08 14:14:12'),
(81, 'topup', 18, NULL, 58, '2020-11-08 14:17:17'),
(82, 'transfer', 18, 26, NULL, '2020-11-12 09:41:20'),
(83, 'transfer', 2, 27, NULL, '2020-11-12 10:24:25'),
(84, 'transfer', 2, 28, NULL, '2020-11-12 10:29:12'),
(85, 'transfer', 2, 29, NULL, '2020-11-12 10:32:41'),
(86, 'transfer', 2, 30, NULL, '2020-11-12 10:36:53'),
(87, 'transfer', 2, 31, NULL, '2020-11-12 10:40:38'),
(88, 'transfer', 2, 32, NULL, '2020-11-12 10:41:36'),
(89, 'transfer', 2, 33, NULL, '2020-11-12 10:43:13'),
(90, 'transfer', 2, 34, NULL, '2020-11-12 10:44:48'),
(91, 'transfer', 2, 35, NULL, '2020-11-12 10:48:34'),
(92, 'transfer', 18, 36, NULL, '2020-11-12 10:54:47'),
(93, 'transfer', 2, 37, NULL, '2020-11-12 12:49:24'),
(94, 'transfer', 18, 38, NULL, '2020-11-12 12:53:32'),
(97, 'transfer', 2, 41, NULL, '2020-11-12 12:58:01'),
(98, 'transfer', 2, 42, NULL, '2020-11-12 13:03:07'),
(99, 'transfer', 2, 43, NULL, '2020-11-12 13:07:45'),
(100, 'transfer', 2, 44, NULL, '2020-11-12 13:18:57'),
(101, 'transfer', 2, 26, NULL, '2020-11-12 13:20:07'),
(102, 'transfer', 2, 45, NULL, '2020-11-12 13:21:08'),
(103, 'transfer', 2, 45, NULL, '2020-11-12 13:21:56'),
(104, 'transfer', 2, 42, NULL, '2020-11-12 13:24:07'),
(105, 'transfer', 2, 45, NULL, '2020-11-12 14:07:39'),
(106, 'transfer', 2, 45, NULL, '2020-11-12 14:08:30');

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
(18, 18, '213213', 100000, '8861688'),
(19, 18, '123213', 123213, '8761688'),
(20, 18, '123213', 123213, '8638475'),
(21, 18, '123213', 123213, '8515262'),
(22, 18, '123213', 123213, '8392049'),
(23, 18, 'notes', 12312, '8278836'),
(24, 18, 'Ini buat kamu aja aku sudah kaya', 2000000, '8276524'),
(25, 18, '123213', 123213, '6276524'),
(26, 2, '12', 1000, '4810688'),
(27, 26, 'beli cilok', 1000, '241000'),
(28, 26, 'beli cilok', 1000, '240000'),
(29, 26, 'beli seblak', 1000, '239000'),
(30, 23, '1000', 1000, '238000'),
(31, 24, 'beli sepatu', 1000, '237000'),
(32, 24, 'beli sepatu', 1000, '236000'),
(33, 26, 'beli celana', 1000, '235000'),
(34, 18, 'beli celana', 1000, '234000'),
(35, 26, 'beli baju', 1000, '233000'),
(36, 2, 'dari web', 1000, '4810688'),
(37, 26, 'beli baju tidur', 1000, '233000'),
(38, 2, 'dari web 2', 1000, '4809688'),
(39, 26, 'dari apk', 1000, '233000'),
(40, 26, 'dari apk', 1000, '232000'),
(41, 26, 'dari apk', 1000, '231000'),
(42, 26, 'test', 1000, '229000'),
(43, 18, 'notes example', 1000, '228000'),
(44, 2, 'this is note', 10000, '227000'),
(45, 2, 'this is note', 10000, '237000'),
(46, 2, 'this is note', 10000, '247000');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `balance`, `verified`, `photo`, `pin`, `role`, `created_at`, `updated_at`) VALUES
(2, 'admin zwallet', '88888', 'admin@gmail.com', '$2a$10$1RK16lUwhyDWPoiK3giPqOpslRL1dklIvOdME/kEfQugKzXLsQ.nO', 265000, 0, 'http://192.168.43.149:4444/images/photo-1604894724432-image-072a50f3-d12e-405e-b09a-42514527f764.jpg', '123123', 'admin', '2020-10-07 17:14:50', '2020-10-07 17:14:50'),
(18, 'Api Rahman123', NULL, 'apirahman55@gmail.com', '$2a$10$KMa5bDraLhjKjBpyrDxgY.v0vfXHj/r4Rb2v6944Fp5kl08K19Bvm', 4809688, 0, NULL, '123123', 'user', '2020-10-30 10:06:21', '2020-10-30 10:06:21'),
(23, 'ihsan', '81803707371', 'ihsan@mail.com', '$2a$10$YVCnOIbfBveG2WJq3qzaLetD43cgvcy9zCSAL5bnojO.Tb2z460MO', 2000, 0, NULL, '123123', 'user', '2020-11-02 02:27:45', '2020-11-02 02:27:45'),
(24, 'Muhammad Khoirul Wafa', NULL, 'wafa@gmail.com', '$2a$10$lqc.TU7xIfZb919tJcVXdepXe0MF3f.EChKnQEVxP0QImZCXtY7aK', 2000, 0, NULL, NULL, 'user', '2020-11-02 02:33:11', '2020-11-02 02:33:11'),
(26, 'Api Al Rahman', '123123', 'apirahman555@gmail.com', '$2a$10$JGRohrDYDkQN9AJF14ZmQe8tmutjf0fjvGAwHMXV9s95V.3cvXQFe', 1012000, 0, NULL, '123123', 'user', '2020-11-02 03:15:33', '2020-11-02 03:15:33'),
(72, '21321', NULL, '2131@gmail.com', '$2a$10$SKC38TBqTNDUemvxGpqt5.1E3gyV9Z5.OZVHPv4weTFnQKwjuhDfW', 0, 0, NULL, '123123', 'user', '2020-11-09 02:57:24', '2020-11-09 02:57:24');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT untuk tabel `transfer_history`
--
ALTER TABLE `transfer_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
