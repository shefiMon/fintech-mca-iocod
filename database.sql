-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2025 at 08:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iocod`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

CREATE TABLE `bank_statements` (
  `id` bigint UNSIGNED NOT NULL,
  `merchant_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_statements`
--

INSERT INTO `bank_statements` (`id`, `merchant_id`, `file_name`, `file_path`, `file_type`, `month`, `year`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'sample-local-pdf.pdf', 'bank-statements/bank-statements', 'pdf', 1, 2025, 'uploaded', '2025-08-05 12:45:21', '2025-08-05 12:45:21'),
(2, 1, 'sample-local-pdf.pdf', 'bank-statements/bank-statements', 'pdf', 1, 2025, 'uploaded', '2025-08-05 12:46:09', '2025-08-05 12:46:09'),
(3, 1, 'sample-local-pdf.pdf', 'bank-statements/1754417901_1_sample-local-pdf.pdfpdf', 'pdf', 1, 2025, 'uploaded', '2025-08-05 12:48:21', '2025-08-05 12:48:21'),
(4, 1, 'sample-local-pdf.pdf', 'bank-statements/1754417949_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'uploaded', '2025-08-05 12:49:09', '2025-08-05 12:49:09'),
(5, 1, 'sample-local-pdf.pdf', 'bank-statements/1754418003_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'uploaded', '2025-08-05 12:50:03', '2025-08-05 12:50:03'),
(6, 1, 'sample-local-pdf.pdf', 'bank-statements/1754418138_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'uploaded', '2025-08-05 12:52:18', '2025-08-05 12:52:18'),
(7, 1, 'sample-local-pdf.pdf', 'bank-statements/1754419511_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'uploaded', '2025-08-05 13:15:11', '2025-08-05 13:15:11'),
(8, 1, 'sample-local-pdf.pdf', 'bank-statements/1754419567_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'uploaded', '2025-08-05 13:16:07', '2025-08-05 13:16:07'),
(9, 1, 'sample-local-pdf.pdf', 'bank-statements/1754419934_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'uploaded', '2025-08-05 13:22:14', '2025-08-05 13:22:14'),
(10, 1, 'sample-local-pdf.pdf', 'bank-statements/1754420041_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'UPLOADED', '2025-08-05 13:24:01', '2025-08-05 13:24:01'),
(11, 1, 'sample-local-pdf.pdf', 'bank-statements/1754420106_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'UPLOADED', '2025-08-05 13:25:06', '2025-08-05 13:25:06'),
(12, 1, 'sample-local-pdf.pdf', 'bank-statements/1754420848_1_sample-local-pdf.pdf', 'pdf', 1, 2025, 'UPLOADED', '2025-08-05 13:37:28', '2025-08-05 13:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `investor_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assigned',
  `assigned_at` timestamp NULL DEFAULT NULL,
  `funded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `lead_id`, `investor_id`, `amount`, `status`, `assigned_at`, `funded_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 18863.00, 'FUNDED', '2025-08-05 12:27:02', '2025-08-05 12:27:02', '2025-08-05 12:27:02', '2025-08-05 12:27:02'),
(2, 13, 3, 6345.00, 'FUNDED', '2025-08-05 12:27:38', '2025-08-05 12:27:38', '2025-08-05 12:27:38', '2025-08-05 12:27:38'),
(3, 15, 2, 49515.00, 'FUNDED', '2025-08-05 12:27:38', '2025-08-05 12:27:38', '2025-08-05 12:27:38', '2025-08-05 12:27:38'),
(4, 18, 2, 33521.00, 'FUNDED', '2025-08-05 12:27:38', '2025-08-05 12:27:38', '2025-08-05 12:27:38', '2025-08-05 12:27:38'),
(5, 22, 2, 39352.00, 'FUNDED', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31'),
(6, 23, 4, 29477.00, 'FUNDED', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31'),
(7, 24, 2, 45301.00, 'FUNDED', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31'),
(8, 25, 2, 12108.00, 'FUNDED', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31', '2025-08-05 13:47:31'),
(9, 27, 4, 16160.00, 'FUNDED', '2025-08-05 13:47:32', '2025-08-05 13:47:32', '2025-08-05 13:47:32', '2025-08-05 13:47:32'),
(10, 28, 1, 31359.00, 'FUNDED', '2025-08-05 13:47:32', '2025-08-05 13:47:32', '2025-08-05 13:47:32', '2025-08-05 13:47:32'),
(11, 31, 4, 23451.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35'),
(12, 32, 2, 27145.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35'),
(13, 33, 3, 15584.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35'),
(14, 34, 4, 49487.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35'),
(15, 35, 4, 34244.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35'),
(16, 37, 2, 13052.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35'),
(17, 38, 1, 8618.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35'),
(18, 40, 2, 12701.00, 'FUNDED', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35', '2025-08-05 13:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE `investors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `total_invested` decimal(14,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investors`
--

INSERT INTO `investors` (`id`, `name`, `email`, `available_amount`, `total_invested`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Alpha Capital', 'contact@alphacapital.com', 884318.00, 500000.00, 1, '2025-08-05 12:11:24', '2025-08-05 13:50:35'),
(2, 'Beta Investments', 'info@betainvest.com', 512033.00, 250000.00, 1, '2025-08-05 12:11:24', '2025-08-05 13:50:35'),
(3, 'Gamma Fund', 'hello@gammafund.com', 1608166.00, 1000000.00, 1, '2025-08-05 12:11:24', '2025-08-05 13:50:35'),
(4, 'Delta Ventures', 'contact@deltaventures.com', 299921.00, 100000.00, 1, '2025-08-05 12:11:24', '2025-08-05 13:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint UNSIGNED NOT NULL,
  `merchant_id` bigint UNSIGNED NOT NULL,
  `merchant_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_amount` decimal(12,2) NOT NULL,
  `lead_score` int NOT NULL DEFAULT '0',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `merchant_id`, `merchant_name`, `requested_amount`, `lead_score`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Leanne Graham', 18863.00, 83, 'COMPLETED', '2025-08-05 12:26:59', '2025-08-05 12:27:02'),
(2, 2, 'Ervin Howell', 47652.00, 76, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(3, 3, 'Clementine Bauch', 49751.00, 71, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(4, 4, 'Patricia Lebsack', 5579.00, 64, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(5, 5, 'Chelsey Dietrich', 9279.00, 75, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(6, 6, 'Mrs. Dennis Schulist', 24207.00, 61, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(7, 7, 'Kurtis Weissnat', 12814.00, 72, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(8, 8, 'Nicholas Runolfsdottir V', 3415.00, 75, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(9, 9, 'Glenna Reichert', 33001.00, 71, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(10, 10, 'Clementina DuBuque', 26056.00, 66, 'PENDING', '2025-08-05 12:26:59', '2025-08-05 12:26:59'),
(11, 1, 'Leanne Graham', 1314.00, 77, 'PENDING', '2025-08-05 12:27:35', '2025-08-05 12:27:35'),
(12, 2, 'Ervin Howell', 46746.00, 70, 'PENDING', '2025-08-05 12:27:35', '2025-08-05 12:27:35'),
(13, 3, 'Clementine Bauch', 6345.00, 84, 'COMPLETED', '2025-08-05 12:27:35', '2025-08-05 12:27:38'),
(14, 4, 'Patricia Lebsack', 34744.00, 69, 'PENDING', '2025-08-05 12:27:35', '2025-08-05 12:27:35'),
(15, 5, 'Chelsey Dietrich', 49515.00, 89, 'COMPLETED', '2025-08-05 12:27:35', '2025-08-05 12:27:38'),
(16, 6, 'Mrs. Dennis Schulist', 23488.00, 77, 'PENDING', '2025-08-05 12:27:35', '2025-08-05 12:27:35'),
(17, 7, 'Kurtis Weissnat', 12103.00, 68, 'PENDING', '2025-08-05 12:27:35', '2025-08-05 12:27:35'),
(18, 8, 'Nicholas Runolfsdottir V', 33521.00, 90, 'COMPLETED', '2025-08-05 12:27:35', '2025-08-05 12:27:38'),
(19, 9, 'Glenna Reichert', 27958.00, 63, 'PENDING', '2025-08-05 12:27:35', '2025-08-05 12:27:35'),
(20, 10, 'Clementina DuBuque', 39412.00, 74, 'PENDING', '2025-08-05 12:27:35', '2025-08-05 12:27:35'),
(21, 1, 'Leanne Graham', 24771.00, 74, 'PENDING', '2025-08-05 13:47:29', '2025-08-05 13:47:29'),
(22, 2, 'Ervin Howell', 39352.00, 95, 'COMPLETED', '2025-08-05 13:47:29', '2025-08-05 13:47:31'),
(23, 3, 'Clementine Bauch', 29477.00, 87, 'COMPLETED', '2025-08-05 13:47:29', '2025-08-05 13:47:31'),
(24, 4, 'Patricia Lebsack', 45301.00, 81, 'COMPLETED', '2025-08-05 13:47:29', '2025-08-05 13:47:31'),
(25, 5, 'Chelsey Dietrich', 12108.00, 89, 'COMPLETED', '2025-08-05 13:47:29', '2025-08-05 13:47:31'),
(26, 6, 'Mrs. Dennis Schulist', 16097.00, 79, 'PENDING', '2025-08-05 13:47:30', '2025-08-05 13:47:30'),
(27, 7, 'Kurtis Weissnat', 16160.00, 85, 'COMPLETED', '2025-08-05 13:47:30', '2025-08-05 13:47:32'),
(28, 8, 'Nicholas Runolfsdottir V', 31359.00, 94, 'COMPLETED', '2025-08-05 13:47:30', '2025-08-05 13:47:32'),
(29, 9, 'Glenna Reichert', 34669.00, 76, 'PENDING', '2025-08-05 13:47:30', '2025-08-05 13:47:30'),
(30, 10, 'Clementina DuBuque', 5601.00, 77, 'PENDING', '2025-08-05 13:47:30', '2025-08-05 13:47:30'),
(31, 1, 'Leanne Graham', 23451.00, 98, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35'),
(32, 2, 'Ervin Howell', 27145.00, 83, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35'),
(33, 3, 'Clementine Bauch', 15584.00, 90, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35'),
(34, 4, 'Patricia Lebsack', 49487.00, 83, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35'),
(35, 5, 'Chelsey Dietrich', 34244.00, 90, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35'),
(36, 6, 'Mrs. Dennis Schulist', 26992.00, 64, 'PENDING', '2025-08-05 13:50:34', '2025-08-05 13:50:34'),
(37, 7, 'Kurtis Weissnat', 13052.00, 90, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35'),
(38, 8, 'Nicholas Runolfsdottir V', 8618.00, 90, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35'),
(39, 9, 'Glenna Reichert', 31017.00, 78, 'PENDING', '2025-08-05 13:50:34', '2025-08-05 13:50:34'),
(40, 10, 'Clementina DuBuque', 12701.00, 92, 'COMPLETED', '2025-08-05 13:50:34', '2025-08-05 13:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Leanne Graham', 'Sincere@april.biz', '1-770-736-8031 x56442', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(2, 'Ervin Howell', 'Shanna@melissa.tv', '010-692-6593 x09125', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(3, 'Clementine Bauch', 'Nathan@yesenia.net', '1-463-123-4447', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(4, 'Patricia Lebsack', 'Julianne.OConner@kory.org', '493-170-9623 x156', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(5, 'Chelsey Dietrich', 'Lucio_Hettinger@annie.ca', '(254)954-1289', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(6, 'Mrs. Dennis Schulist', 'Karley_Dach@jasper.info', '1-477-935-8478 x6430', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(7, 'Kurtis Weissnat', 'Telly.Hoeger@billy.biz', '210.067.6132', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(8, 'Nicholas Runolfsdottir V', 'Sherwood@rosamond.me', '586.493.6943 x140', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(9, 'Glenna Reichert', 'Chaim_McDermott@dana.io', '(775)976-6794 x41206', '2025-08-05 12:05:08', '2025-08-05 12:05:08'),
(10, 'Clementina DuBuque', 'Rey.Padberg@karina.biz', '024-648-3804', '2025-08-05 12:05:08', '2025-08-05 12:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_05_144555_create_personal_access_tokens_table', 1),
(5, '2025_08_05_145752_create_merchants_table', 2),
(6, '2025_08_05_150036_create_leads_table', 2),
(7, '2025_08_05_150356_create_investors_table', 2),
(8, '2025_08_05_150619_create_deals_table', 2),
(9, '2025_08_05_150751_create_bank_statements_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 1, 'auth_token', 'e3bef448334cb2ce7e1970de76c4fc94c551186827c6338b6ff06252f5648f87', '[\"*\"]', '2025-08-05 13:32:11', NULL, '2025-08-05 10:36:19', '2025-08-05 13:32:11'),
(4, 'App\\Models\\User', 1, 'auth_token', '3c0e349a0a6169ef093319a941272172a41934ac03d3c6bd330f6e6701bab303', '[\"*\"]', NULL, NULL, '2025-08-05 13:33:23', '2025-08-05 13:33:23'),
(5, 'App\\Models\\User', 1, 'auth_token', '88f3608225387d0c5180b34eb864c060dcf0b5d2b35dfc765587e1ce96faf0f4', '[\"*\"]', NULL, NULL, '2025-08-05 13:34:12', '2025-08-05 13:34:12'),
(6, 'App\\Models\\User', 1, 'auth_token', 'c8891264fb5fad9473af1cb6ec6700694beb3cc8b13e7c4b3a8a2cd3881b2f6e', '[\"*\"]', '2025-08-05 14:01:38', NULL, '2025-08-05 13:34:39', '2025-08-05 14:01:38');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('VPdkqAW1BKEZKTCekdnQ3cDZWN11WEhOU3j9PCVs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0hkS2tiUnpBN2FwekFENExoMjl4QjJjRFgxVWZyaklHbUlndnlXUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754405333);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-08-05 10:28:17', '$2y$12$NQX.dLXuGlNKLBVLBtWoGeMXDdsjlay.k7ytc4pGQtGm6hTuqBVv2', 'hOA9FbhYWf', '2025-08-05 10:28:18', '2025-08-05 10:28:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_statements_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deals_lead_id_foreign` (`lead_id`),
  ADD KEY `deals_investor_id_foreign` (`investor_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `investors`
--
ALTER TABLE `investors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `investors_email_unique` (`email`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merchants_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investors`
--
ALTER TABLE `investors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD CONSTRAINT `bank_statements_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deals_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
