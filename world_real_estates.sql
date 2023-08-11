-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2023 at 10:23 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `world_real_estates`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Single-family homes'),
(2, 'Duplexes'),
(3, 'Townhouses'),
(4, 'Multifamily residences'),
(5, 'Hotels');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_estates_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `real_estates_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nice house...', 10, 1, '2023-08-11 17:38:48', '2023-08-11 17:38:48'),
(2, 'Beautiful house!', 3, 1, '2023-08-11 17:45:34', '2023-08-11 17:45:34'),
(3, 'Really! :)', 3, 1, '2023-08-11 17:46:02', '2023-08-11 17:46:02'),
(4, 'I am thinking about buy this home...', 3, 1, '2023-08-11 17:47:17', '2023-08-11 17:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_07_25_113039_create_real_estates_table', 2),
(14, '2023_07_29_181947_create_statistics_table', 3),
(17, '2023_07_29_183707_create_comments_table', 4),
(22, '2023_08_02_201908_create_categories_table', 5),
(23, '2023_08_02_205225_add_category_id_in_real_estates_table', 6),
(24, '2023_08_03_210746_create_roles_table', 7),
(25, '2023_08_03_211137_add_role_id_to_users', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `real_estates`
--

CREATE TABLE `real_estates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `real_estates`
--

INSERT INTO `real_estates` (`id`, `title`, `images`, `country`, `city`, `description`, `price`, `user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'Nice house', '[\"1691768992.7197-images (1).jpeg\",\"1691768992.7197-images (2).jpeg\",\"1691768992.7197-images (3).jpeg\"]', 'England', 'London', 'Very nice house', '210000.00', 4, 1, '2023-08-11 13:49:52', '2023-08-11 13:49:52'),
(3, 'House beautiful', '[\"1691769051.5668-images (1).jpeg\",\"1691769051.5668-images (2).jpeg\",\"1691769051.5668-images.jpeg\"]', 'France', 'Paris', 'House is beautiful', '150000.00', 4, 2, '2023-08-11 13:50:51', '2023-08-11 13:50:51'),
(4, 'Big house', '[\"1691769106.6032-download.jpeg\",\"1691769106.6032-house-1836070_1280.jpg\",\"1691769106.6032-house-1867187_1920.jpg\"]', 'Spain', 'Madrid', 'House is big', '300000.00', 4, 3, '2023-08-11 13:51:46', '2023-08-11 13:51:46'),
(5, 'Little house', '[\"1691769201.6859-house-1867187_1920.jpg\",\"1691769201.6859-images (1).jpeg\",\"1691769201.6859-images.jpeg\"]', 'Serbia', 'Belgrade', 'Little house for sale', '100000.00', 1, 4, '2023-08-11 13:53:21', '2023-08-11 13:53:21'),
(6, 'Hotel', '[\"1691769255.8866-images (1).jpeg\",\"1691769255.8866-images (4).jpeg\",\"1691769255.8866-images.jpeg\"]', 'Italy', 'Rome', 'Nice hotel', '500000.00', 1, 5, '2023-08-11 13:54:15', '2023-08-11 13:54:15'),
(7, 'Small hotel', '[\"1691769324.537-house-1867187_1920.jpg\",\"1691769324.537-images (2).jpeg\",\"1691769324.537-images.jpeg\"]', 'Montenegro', 'Budva', 'Small hotel for sale', '400000.00', 1, 5, '2023-08-11 13:55:24', '2023-08-11 13:55:24'),
(8, 'Big Hotel', '[\"1691769496.3079-9ee431c428d6ef08e7d284f53a4351e39d1490a7_original.jpg\",\"1691769496.3079-640x480.jpg\",\"1691769496.3079-download.jpeg\"]', 'Germany', 'Freiburg', 'Very big hotel', '700000.00', 3, 5, '2023-08-11 13:58:16', '2023-08-11 13:58:16'),
(9, 'Townhouse', '[\"1691769563.714-download.jpeg\",\"1691769563.714-house-1836070_1280.jpg\",\"1691769563.714-house-1867187_1920.jpg\"]', 'Serbia', 'Novi Sad', 'Nice townhouse', '240000.00', 3, 1, '2023-08-11 13:59:23', '2023-08-11 13:59:23'),
(10, 'House', '[\"1691769995.3012-images (1).jpeg\",\"1691769995.3012-images (2).jpeg\",\"1691769995.3012-images (3).jpeg\"]', 'Russia', 'Moscow', 'House for sale', '350000.00', 3, 2, '2023-08-11 14:06:35', '2023-08-11 14:06:35'),
(11, 'House in Brazil', '[\"1691770059.5266-images (4).jpeg\",\"1691770059.5266-images (5).jpeg\",\"1691770059.5266-images.jpeg\"]', 'Brazil', 'Brasilia', 'House in Brazil for sale', '450000.00', 3, 4, '2023-08-11 14:07:39', '2023-08-11 14:07:39'),
(12, 'Nice apartment', '[\"1691770147.6585-images (4).jpeg\",\"1691770147.6585-images (5).jpeg\",\"1691770147.6585-images.jpeg\"]', 'Argentina', 'Buenos Aires', 'Very nice apartment', '250000.00', 3, 5, '2023-08-11 14:09:07', '2023-08-11 14:09:07'),
(13, 'Small apartment', '[\"1691770254.7115-images (1).jpeg\",\"1691770254.7115-images (2).jpeg\",\"1691770254.7115-luxury-real-estate.jpg\"]', 'Netherlands', 'Rotterdam', 'Small apartment for sale', '300000.00', 3, 1, '2023-08-11 14:10:54', '2023-08-11 14:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `activity`, `created_at`, `updated_at`) VALUES
(1, 'User with id-1 insert new datas', '2023-08-11 13:12:00', '2023-08-11 13:12:00'),
(2, 'User with id-1 edited datas for real_estate id-1', '2023-08-11 13:12:48', '2023-08-11 13:12:48'),
(3, 'User with id-1 delete datas', '2023-08-11 13:14:40', '2023-08-11 13:14:40'),
(4, 'User with id-4 insert new datas', '2023-08-11 13:49:52', '2023-08-11 13:49:52'),
(5, 'User with id-4 insert new datas', '2023-08-11 13:50:52', '2023-08-11 13:50:52'),
(6, 'User with id-4 insert new datas', '2023-08-11 13:51:46', '2023-08-11 13:51:46'),
(7, 'User with id-1 insert new datas', '2023-08-11 13:53:21', '2023-08-11 13:53:21'),
(8, 'User with id-1 insert new datas', '2023-08-11 13:54:15', '2023-08-11 13:54:15'),
(9, 'User with id-1 insert new datas', '2023-08-11 13:55:24', '2023-08-11 13:55:24'),
(10, 'User with id-3 insert new datas', '2023-08-11 13:58:16', '2023-08-11 13:58:16'),
(11, 'User with id-3 insert new datas', '2023-08-11 13:59:23', '2023-08-11 13:59:23'),
(12, 'User with id-3 insert new datas', '2023-08-11 14:06:35', '2023-08-11 14:06:35'),
(13, 'User with id-3 insert new datas', '2023-08-11 14:07:39', '2023-08-11 14:07:39'),
(14, 'User with id-3 insert new datas', '2023-08-11 14:09:07', '2023-08-11 14:09:07'),
(15, 'User with id-3 insert new datas', '2023-08-11 14:10:54', '2023-08-11 14:10:54'),
(16, 'User with id-1 insert new comment for real_estate id-10', '2023-08-11 17:38:48', '2023-08-11 17:38:48'),
(17, 'User with id-1 insert new comment for real_estate id-3', '2023-08-11 17:45:34', '2023-08-11 17:45:34'),
(18, 'User with id-1 insert new comment for real_estate id-3', '2023-08-11 17:46:02', '2023-08-11 17:46:02'),
(19, 'User with id-1 insert new comment for real_estate id-3', '2023-08-11 17:47:17', '2023-08-11 17:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dusan', 'ddusan@gmail.com', 1, NULL, '$2y$10$6lEinOP.lBX5QE3/.dASM.WIoL1xz8srSlNw3qSNa8SR8FO30WNMa', NULL, '2023-07-25 11:20:33', '2023-07-25 11:20:33'),
(3, 'Cane', 'cane@cane.com', 2, NULL, '$2y$10$bvTSAyHlvoc2YiIC.3NIv.FHsbMaJhtrF/8VaGfwC51K.0ErEmzDG', NULL, '2023-08-03 19:19:33', '2023-08-03 19:19:33'),
(4, 'John', 'john@john.com', 2, NULL, '$2y$10$HDzvYRiCQhaFlp0HyNRLbu3kMouhdTvHlWiAISkTRtYRpGDywgYGO', NULL, '2023-08-11 13:35:59', '2023-08-11 13:35:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_real_estates_id_index` (`real_estates_id`),
  ADD KEY `comments_user_id_index` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `real_estates`
--
ALTER TABLE `real_estates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `real_estates_user_id_index` (`user_id`),
  ADD KEY `real_estates_category_id_foreign` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real_estates`
--
ALTER TABLE `real_estates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_real_estates_id_foreign` FOREIGN KEY (`real_estates_id`) REFERENCES `real_estates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `real_estates`
--
ALTER TABLE `real_estates`
  ADD CONSTRAINT `real_estates_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `real_estates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
