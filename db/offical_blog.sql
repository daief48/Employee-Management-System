-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2024 at 03:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `offical_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `attendance` tinyint(4) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `attendance`, `date`, `created_at`, `updated_at`) VALUES
(16, '11', 1, '2024-03-30', '2024-03-30 02:02:34', '2024-03-30 02:02:34'),
(17, '12', 1, '2024-03-30', '2024-03-30 02:02:36', '2024-03-30 02:02:36'),
(18, '12', 1, '2024-03-31', '2024-03-30 02:02:48', '2024-03-30 02:02:48'),
(19, '11', 1, '2024-03-31', '2024-03-30 02:02:50', '2024-03-30 02:02:50'),
(20, '11', 1, '2024-03-27', '2024-03-30 02:07:41', '2024-03-30 02:07:41'),
(21, '11', 1, '2024-04-22', '2024-03-30 02:20:53', '2024-03-30 02:20:53'),
(22, '11', 1, '2024-03-21', '2024-03-30 02:21:17', '2024-03-30 02:21:17'),
(23, '11', 1, '2024-03-28', '2024-03-30 02:22:55', '2024-03-30 02:22:55'),
(24, '16', 1, '2024-03-30', '2024-03-30 02:28:07', '2024-03-30 02:28:22'),
(25, '11', 1, '2024-03-29', '2024-03-30 02:29:32', '2024-03-30 02:29:32'),
(26, '11', 1, '2024-03-19', '2024-03-30 02:42:29', '2024-03-30 02:42:29'),
(27, '11', 1, '2024-05-30', '2024-04-01 00:09:35', '2024-04-01 00:09:35'),
(28, '11', 1, '2024-04-30', '2024-04-01 00:09:51', '2024-04-01 00:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(14, 'Culture1', '2024-02-18 03:10:03', '2024-02-18 05:57:55'),
(15, 'Product', '2024-02-18 03:10:08', '2024-02-18 03:10:08'),
(16, 'Technology', '2024-02-19 00:08:38', '2024-02-19 00:08:38'),
(17, 'Coding', '2024-02-24 09:19:10', '2024-02-24 09:19:10');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Software', NULL, NULL),
(2, 'Management', NULL, NULL),
(3, 'Data Entry', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Seinor Programmer', NULL, NULL),
(2, 'Junior Programmer', NULL, NULL),
(3, 'Hr', NULL, NULL),
(4, 'CEO', NULL, NULL),
(5, 'Data Operator', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sttime` varchar(255) NOT NULL,
  `endtime` varchar(255) NOT NULL,
  `salaries` int(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `sttime`, `endtime`, `salaries`, `department`, `designation`, `user_id`, `imagePath`, `body`, `created_at`, `updated_at`) VALUES
(11, 'Daief Sikder1', '09:00', '18:00', 20000, '1', '1', 17, 'images/posts/1-6-2-2-FindADoctor.png', 'sdf w4ewerq sdfsd', '2024-03-29 22:52:58', '2024-03-30 01:02:02'),
(12, 'Hr', '09:00', '18:00', 40000, '1', '3', 18, 'images/posts/images.jfif', 'sfd sdfsdf', '2024-03-30 01:53:27', '2024-04-17 22:30:29'),
(13, 'Soad Islam', '09:00', '18:00', 2344, '1', '2', 19, 'images/posts/naruto3.webp', 'Good Boy.', '2024-04-01 01:32:29', '2024-04-01 01:32:29'),
(15, 'Mezba Mohamod', '09:00', '18:00', 30000, '1', '1', 25, 'images/posts/1614616868990__1_-removebg-preview.png', 'we  sd fs', '2024-04-17 22:27:19', '2024-04-17 22:27:19'),
(16, 'Galib', '09:00', '18:00', 2332, '2', '1', 26, 'images/posts/katros-honda-cb400-3-1451x952 (1).jpg', '23 4q43', '2024-04-28 22:49:31', '2024-04-28 22:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` int(50) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `insurances`
--

INSERT INTO `insurances` (`id`, `user_id`, `description`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(8, 17, '23 43', '2323', 1, '2024-05-05 22:21:33', '2024-05-05 22:57:18'),
(9, 17, '234 4343', '3', 1, '2024-05-05 22:29:10', '2024-05-05 22:57:19'),
(10, 26, '343 443', '342', 1, '2024-05-05 22:30:34', '2024-05-05 22:56:55'),
(11, 26, '344354', '23', 1, '2024-05-05 22:32:05', '2024-05-05 22:58:12'),
(12, 26, '234 23423', '32', 1, '2024-05-05 22:33:43', '2024-05-05 22:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `days` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `leave_type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `user_id`, `department`, `designation`, `days`, `status`, `leave_type`, `created_at`, `updated_at`) VALUES
(74, 17, 'Software', 'Seinor Programmer', 16, 1, 2, '2024-05-13 23:48:57', '2024-05-13 23:48:57'),
(75, 17, 'Software', 'Seinor Programmer', 7, 0, 1, '2024-05-13 23:49:33', '2024-05-13 23:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `day` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `day`, `created_at`, `updated_at`) VALUES
(1, 'Casual', 21, NULL, NULL),
(2, 'Sick', 15, NULL, NULL),
(3, 'Earned', 11, NULL, NULL),
(4, 'Maternity', 60, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_02_18_052638_create_categories_table', 2),
(7, '2024_02_18_092800_create_posts_table', 3),
(8, '2024_02_18_102714_create_posts_table', 4),
(9, '2024_03_16_092151_create_employees_table', 5),
(10, '2024_03_16_181119_create_table_name_table', 6),
(11, '2024_03_16_181651_create_attendances_table', 7),
(12, '2024_03_16_181718_create_attendances_table', 8),
(13, '2024_03_16_183434_create_attendances_table', 9),
(14, '2024_03_18_183711_create_department_name', 10),
(15, '2024_03_18_183841_create_department_table', 11),
(16, '2024_03_18_183958_create_designation_table', 12),
(17, '2024_03_31_045156_create_leaves_table', 13),
(18, '2024_03_31_045210_create_leave_types_table', 13),
(19, '2024_03_31_045404_create_leaves_table', 14),
(20, '2024_03_31_045422_create_leave__types_table', 14),
(21, '2024_04_18_054821_create_insurances_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `popularpost` varchar(50) NOT NULL DEFAULT 'N',
  `featurenews` varchar(50) NOT NULL DEFAULT 'N',
  `tending` varchar(50) NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `user_id`, `category_id`, `imagePath`, `body`, `popularpost`, `featurenews`, `tending`, `created_at`, `updated_at`) VALUES
(54, 'MEXT Scholarship Details for Bangladeshi students', 'mext-scholarship-details-for-bangladeshi-students-1', 5, 16, 'images/posts/download.png', '\"<p style=\\\"text-align: center;\\\"><span style=\'color: rgb(0, 0, 0); font-family: \\\"\\\"; font-size: 30px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\' id=\\\"isPasted\\\"><strong><u>Types of MEXT scholarship in Bangladesh</u></strong></span></p><p style=\\\"text-align: center;\\\"><span id=\\\"isPasted\\\" style=\\\"color: rgb(0, 0, 0);\\\"><strong><u>Types of MEXT scholarship in Bangladesh</u></strong></span></p><p id=\\\"isPasted\\\"><span style=\\\"color: rgb(0, 0, 0);\\\">（1）University Reccomendation (Research and Undergraduate)</span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\"><br></span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\">　a）University Recommendation is a type of selection that students are recommended to MEXT by the Japanese university which will accept you as a research student. The applicants submit their applications to Japanese Unviersities directly, and the &nbsp;selected candidates are recommended to MEXT from each university. MEXT conducts a screening and selects scholarship grantees at the end of June. They normally arrive in Japan in the end of September.</span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\"><br></span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\">&nbsp; &nbsp;b) &nbsp;The qualification and eligibility varies according to each university. Please visit website of Japanese universities for the details. Please visit website of each Japanese university for the details.</span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\">&nbsp; &nbsp;c) &nbsp;The application period normally starts in November-December and ends in January-February.</span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\"><br></span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\">(2) &nbsp;Embassy Reccomendation (Research, Undergraduate, College of Technology, Specialized Training College)</span></p><p><span style=\\\"color: rgb(0, 0, 0);\\\">In this type of scholarship, recipients are recruited and initially screened by Japanese Embassy.</span></p><p style=\\\"text-align: center;\\\"><img src=\\\"blob:http://127.0.0.1:8000/ef21dd39-2b10-4f7b-a7ac-5e2a11efce81\\\" style=\\\"width: 300px;\\\" class=\\\"fr-fic fr-dib\\\"></p>\"', 'Y', 'Y', '', '2024-02-24 09:10:54', '2024-02-24 09:10:54'),
(55, 'Hello World', 'hello-world-55', 5, 16, 'images/posts/WhatsApp Image 2023-12-01 at 22.21.39_09e4911c.jpg', '\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size: 36px;\\\"><u><strong>Hellow world</strong></u></span></p><p><img src=\\\"blob:http://127.0.0.1:8000/868f3585-6f0c-43d8-a3d0-ca2ccfe55a2c\\\" style=\\\"width: 300px;\\\" class=\\\"fr-fic fr-dib\\\"></p><p>sdl sflk slkf lsd ds</p><p>f sfdsfl sdfl s</p><p>f</p><p>dsf</p><p>sdf</p>\"', 'Y', 'Y', 'Y', '2024-02-24 09:17:58', '2024-02-24 09:17:58'),
(56, 'Departmental Transfer', 'departmental-transfer-56', 6, 17, 'images/posts/Image-2024-03-08T025555.777-185x278.png', '\"<p>SAD FDSASASASASASASASASASA</p>\"', 'Y', 'Y', 'N', '2024-05-14 03:20:24', '2024-05-14 03:20:24'),
(57, 'Departmental Transfer', 'departmental-transfer-57', 6, 17, 'images/posts/katros-honda-cb400-3-1451x952 (1).jpg', '\"<p>&nbsp;sadfsdasda adsf</p>\"', 'Y', 'Y', 'N', '2024-05-14 04:48:44', '2024-05-14 04:48:44'),
(58, 'Departmental Transfer', 'departmental-transfer-58', 6, 17, 'images/posts/pexels-james-wheeler-414612.jpg', '\"<p>we dsfaasdf&nbsp;</p>\"', 'Y', 'Y', 'N', '2024-05-15 04:49:00', '2024-05-15 04:49:00'),
(59, 'Departmental Transfer', 'departmental-transfer-59', 6, 17, 'images/posts/pexels-james-wheeler-414612.jpg', '\"<p>34 34 54</p>\"', 'N', 'N', 'N', '2024-05-20 04:01:28', '2024-05-20 04:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '$2y$12$Fhh9hXNPLnASeUpVM/Jw9uWFTQcsNbQMUtBmuZKr6aOb7bgKai4Wm',
  `role` int(10) NOT NULL DEFAULT 0,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Daief Sikder', 'daiefsikder@gmail.com', NULL, '$2y$12$iOeBLzy5T5J1I82C3dw0tu0ZzOuum1088LrPZ2xvo0EZCuL5BOZvq', 0, NULL, NULL, NULL, '1994-02-02 21:58:21', '2024-02-16 21:58:21'),
(6, 'Daief Sikder', 'daiefsikder425@gmail.com', NULL, '$2y$12$G7.HT.EKdJpvNbbOzDj1KuprvI22jlgAs0o409pbhPpGSuAvCC3W6', 1, NULL, NULL, NULL, '2024-03-29 13:19:40', '2024-03-29 13:19:40'),
(17, 'Daief Sikder1', 'daiefsikder222@gmail.com', NULL, '$2y$12$iOeBLzy5T5J1I82C3dw0tu0ZzOuum1088LrPZ2xvo0EZCuL5BOZvq', 0, NULL, NULL, NULL, '2019-04-10 03:34:55', '2024-04-29 03:35:00'),
(18, 'Hr', 'hr@gmail.com', NULL, '$2y$12$gyNubwWioIvnvjFMnOPx2e2AS1mA/t./91q96Dg7VI3sIAZHZx3pO', 0, NULL, NULL, NULL, NULL, NULL),
(19, 'Soad Islam', 'soad@gmail.com', NULL, '$2y$12$3Bo5IA.ltL9DBBF/c98EgeSUvRNNF7dB8g/InReNtm.q1PVedaTMa', 0, NULL, NULL, NULL, NULL, NULL),
(25, 'Mezba Mohamod', 'mezba@gmail.com', NULL, '$2y$12$b0/Wbvj33R4KEPwt8vDDC.45Zr/3freB7WxTaIz5caPwULbruScP2', 0, NULL, NULL, NULL, NULL, NULL),
(26, 'Galib', 'galib@gmail.com', NULL, '$2y$12$WbKILastwScI7euq5XewvOAjgUTpidHb4KTxaKFjw8i02E7VUdRmG', 0, NULL, NULL, NULL, '2014-04-02 22:49:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insurances_user_id_foreign` (`user_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurances`
--
ALTER TABLE `insurances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `insurances`
--
ALTER TABLE `insurances`
  ADD CONSTRAINT `insurances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
