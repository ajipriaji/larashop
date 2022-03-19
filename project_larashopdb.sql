-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 19 Mar 2022 pada 15.24
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_larashopdb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `type`, `validation`, `is_required`, `is_unique`, `is_filterable`, `is_configurable`, `created_at`, `updated_at`) VALUES
(1, 'size', 'Size', 'select', NULL, 0, 0, 1, 1, '2022-03-14 02:34:23', '2022-03-14 21:29:48'),
(2, 'color', 'Color', 'select', NULL, 0, 0, 1, 1, '2022-03-14 02:37:23', '2022-03-14 21:29:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'XS', '2022-03-14 02:36:58', '2022-03-14 02:36:58'),
(2, 1, 'S', '2022-03-14 02:37:03', '2022-03-14 02:37:03'),
(3, 1, 'M', '2022-03-14 02:37:05', '2022-03-14 02:37:05'),
(4, 1, 'L', '2022-03-14 02:37:08', '2022-03-14 02:37:08'),
(5, 1, 'XL', '2022-03-14 02:37:11', '2022-03-14 02:37:11'),
(6, 2, 'Merah', '2022-03-14 02:37:30', '2022-03-14 02:37:30'),
(7, 2, 'Kuning', '2022-03-14 02:37:32', '2022-03-14 02:37:32'),
(8, 2, 'Hijau', '2022-03-14 02:37:35', '2022-03-14 02:37:35'),
(9, 2, 'Biru', '2022-03-15 16:39:08', '2022-03-15 16:39:08'),
(10, 2, 'Abu-Abu', '2022-03-15 16:39:12', '2022-03-15 16:39:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`) VALUES
(2, 'Pakaian Pria', 'pakaian-pria', 0, '2022-03-14 02:27:31', '2022-03-14 02:27:31'),
(3, 'Pakaian Wanita', 'pakaian-wanita', 0, '2022-03-14 02:27:36', '2022-03-14 02:27:42'),
(4, 'Kemeja', 'kemeja', 2, '2022-03-14 07:44:49', '2022-03-14 07:44:49'),
(5, 'Mukena', 'mukena', 3, '2022-03-14 07:45:51', '2022-03-14 07:45:51'),
(6, 'Gamis', 'gamis', 3, '2022-03-14 08:13:10', '2022-03-14 08:13:10'),
(7, 'Kaos', 'kaos', 2, '2022-03-15 01:44:12', '2022-03-15 01:44:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(84, '2014_10_12_000000_create_users_table', 1),
(85, '2014_10_12_100000_create_password_resets_table', 1),
(86, '2019_08_19_000000_create_failed_jobs_table', 1),
(87, '2022_03_13_050427_create_categories_table', 1),
(88, '2022_03_13_143340_create_products_table', 1),
(89, '2022_03_13_143804_create_attributes_table', 1),
(90, '2022_03_13_143941_create_product_attribute_values', 1),
(91, '2022_03_13_144232_create_product_inventories_table', 1),
(92, '2022_03_13_144353_create_product_categories_table', 1),
(93, '2022_03_13_144442_create_product_images_table', 1),
(94, '2022_03_14_054115_create_attribute_options_table', 1),
(95, '2022_03_14_082924_create_permission_tables', 1),
(96, '2022_03_15_035125_add_full_text_search_index_to_products_table', 2),
(97, '2022_03_15_043619_add_parent_product_id_to_product_attribute_values_table', 3),
(98, '2022_03_15_072119_rename_column_and_add_column_in_users_table', 4),
(102, '2022_03_15_085719_create_shipment_table', 5),
(107, '2022_03_15_084926_create_orders_table', 6),
(108, '2022_03_15_085439_create_order_items_table', 6),
(109, '2022_03_15_085531_create_payments_table', 6),
(110, '2022_03_15_085719_create_shipments_table', 6),
(111, '2022_03_15_193917_create_jobs_table', 7),
(112, '2022_03_16_104034_add_payment_token_to_orders_table', 8),
(113, '2022_03_16_104154_add_status_to_payments_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_due` datetime NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_total_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(16,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postcode` int(11) DEFAULT NULL,
  `shipping_courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `cancelled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancellation_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `code`, `status`, `order_date`, `payment_due`, `payment_status`, `payment_token`, `payment_url`, `base_total_price`, `tax_amount`, `tax_percent`, `discount_amount`, `discount_percent`, `shipping_cost`, `grand_total`, `note`, `customer_first_name`, `customer_last_name`, `customer_address1`, `customer_address2`, `customer_phone`, `customer_email`, `customer_city_id`, `customer_province_id`, `customer_postcode`, `shipping_courier`, `shipping_service_name`, `approved_by`, `approved_at`, `cancelled_by`, `cancelled_at`, `cancellation_note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 'INV/20220315/III/XV/00001', 'created', '2022-03-15 16:47:56', '2022-03-22 16:47:56', 'unpaid', NULL, NULL, '1000000.00', '100000.00', '10.00', '0.00', '0.00', '15000.00', '1115000.00', NULL, 'Jack', 'Oliver', 'Address 1', NULL, '083856363632', 'newuser@gmail.com', '248', '11', 46423, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 09:47:56', '2022-03-15 09:47:56'),
(2, 4, 'INV/20220315/III/XV/00002', 'created', '2022-03-15 18:53:51', '2022-03-22 18:53:51', 'unpaid', NULL, NULL, '1000000.00', '100000.00', '10.00', '0.00', '0.00', '8000.00', '1108000.00', NULL, 'Priaji', 'Oktawibyan Abror', 'Address 1', NULL, '083856363632', 'ajipriaji11@gmail.com', '42', '11', 54372, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 11:53:51', '2022-03-15 11:53:51'),
(3, 4, 'INV/20220315/III/XV/00003', 'created', '2022-03-15 20:31:05', '2022-03-22 20:31:05', 'unpaid', NULL, NULL, '1000000.00', '100000.00', '10.00', '0.00', '0.00', '15000.00', '1115000.00', NULL, 'Priaji', 'Oktawibyan Abror', 'Alamat broooo', NULL, '083856363632', 'ajipriaji11@gmail.com', '152', '6', 54372, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 13:31:05', '2022-03-15 13:31:05'),
(4, 5, 'INV/20220315/III/XV/00004', 'created', '2022-03-15 23:56:34', '2022-03-22 23:56:34', 'unpaid', NULL, NULL, '28000.00', '2800.00', '10.00', '0.00', '0.00', '29000.00', '59800.00', NULL, 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', 'Universitas Sebelas Maret', '083856363632', 'ajipriaji15@gmail.com', '445', '10', 57126, 'jne', 'JNE - YES', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:56:34', '2022-03-15 16:56:34'),
(8, 5, 'INV/20220316/III/XVI/00001', 'confirmed', '2022-03-16 10:51:37', '2022-03-23 10:51:37', 'paid', '8930df3d-c5ab-4b37-bfe5-7b77d8ee5383', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/8930df3d-c5ab-4b37-bfe5-7b77d8ee5383', '99000.00', '9900.00', '10.00', '0.00', '0.00', '12000.00', '120900.00', NULL, 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', NULL, '083856363632', 'ajipriaji15@gmail.com', '445', '10', 54372, 'jne', 'JNE - OKE', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 03:51:37', '2022-03-16 04:26:28'),
(9, 5, 'INV/20220316/III/XVI/00002', 'created', '2022-03-16 11:35:44', '2022-03-23 11:35:44', 'unpaid', '3e805e1d-43e5-4ae1-85c4-c87964e1b81a', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/3e805e1d-43e5-4ae1-85c4-c87964e1b81a', '112000.00', '11200.00', '10.00', '0.00', '0.00', '29000.00', '152200.00', 'Ndang di packing pack', 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', NULL, '083856363632', 'ajipriaji15@gmail.com', '445', '10', 54372, 'jne', 'JNE - YES', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 04:35:44', '2022-03-16 04:35:44'),
(10, 5, 'INV/20220316/III/XVI/00003', 'confirmed', '2022-03-16 11:40:11', '2022-03-23 11:40:11', 'paid', '8865b775-d6fa-4c57-b8d8-5a46a6689047', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/8865b775-d6fa-4c57-b8d8-5a46a6689047', '198000.00', '19800.00', '10.00', '0.00', '0.00', '29000.00', '246800.00', NULL, 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', NULL, '083856363632', 'ajipriaji15@gmail.com', '445', '10', 54372, 'jne', 'JNE - YES', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 04:40:11', '2022-03-16 04:42:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `base_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `base_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`attributes`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `base_price`, `base_total`, `tax_amount`, `tax_percent`, `discount_amount`, `discount_percent`, `sub_total`, `sku`, `type`, `name`, `weight`, `attributes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '1000000.00', '1000000.00', '0.00', '0.00', '0.00', '0.00', '1000000.00', 'BRG0001', 'simple', 'Kaos Oblong', '500.00', '[]', '2022-03-15 09:47:56', '2022-03-15 09:47:56'),
(2, 2, 1, 1, '1000000.00', '1000000.00', '0.00', '0.00', '0.00', '0.00', '1000000.00', 'BRG0001', 'simple', 'Kaos Oblong', '500.00', '[]', '2022-03-15 11:53:51', '2022-03-15 11:53:51'),
(3, 3, 1, 1, '1000000.00', '1000000.00', '0.00', '0.00', '0.00', '0.00', '1000000.00', 'BRG0001', 'simple', 'Kaos Oblong', '500.00', '[]', '2022-03-15 13:31:05', '2022-03-15 13:31:05'),
(4, 4, 26, 1, '28000.00', '28000.00', '0.00', '0.00', '0.00', '0.00', '28000.00', 'BRG0003-3-6', 'configurable', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - M - Merah', '185.00', '{\"size\":\"M\",\"color\":\"Merah\"}', '2022-03-15 16:56:34', '2022-03-15 16:56:34'),
(8, 8, 8, 1, '99000.00', '99000.00', '0.00', '0.00', '0.00', '0.00', '99000.00', 'BRG0002-3-10', 'configurable', 'Kemeja Polos Formal - M - Abu-Abu', '300.00', '{\"size\":\"M\",\"color\":\"Abu-Abu\"}', '2022-03-16 03:51:37', '2022-03-16 03:51:37'),
(9, 9, 26, 2, '28000.00', '56000.00', '0.00', '0.00', '0.00', '0.00', '56000.00', 'BRG0003-3-6', 'configurable', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - M - Merah', '185.00', '{\"size\":\"M\",\"color\":\"Merah\"}', '2022-03-16 04:35:44', '2022-03-16 04:35:44'),
(10, 9, 23, 2, '28000.00', '56000.00', '0.00', '0.00', '0.00', '0.00', '56000.00', 'BRG0003-2-8', 'configurable', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - S - Hijau', '185.00', '{\"size\":\"S\",\"color\":\"Hijau\"}', '2022-03-16 04:35:44', '2022-03-16 04:35:44'),
(11, 10, 7, 2, '99000.00', '198000.00', '0.00', '0.00', '0.00', '0.00', '198000.00', 'BRG0002-3-9', 'configurable', 'Kemeja Polos Formal - M - Biru', '300.00', '{\"size\":\"M\",\"color\":\"Biru\"}', '2022-03-16 04:40:11', '2022-03-16 04:40:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('newuser@gmail.com', '$2y$10$TTtZLbiyBIt4J.jOHZmC6.UfTNKAfn4mZec4tsxGjVQbkQ3PKwFWS', '2022-03-15 00:41:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payloads`)),
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biller_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `number`, `amount`, `method`, `status`, `token`, `payloads`, `payment_type`, `va_number`, `vendor_name`, `biller_code`, `bill_key`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 8, 'PAY/20220316/III/XVI/00001', '120900.00', 'midtrans', 'deny', '68a1bd10-2d67-4457-ae70-e3aa73b736f6', '{\"transaction_time\":\"2022-03-16 11:24:05\",\"transaction_status\":\"deny\",\"transaction_id\":\"68a1bd10-2d67-4457-ae70-e3aa73b736f6\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"202\",\"signature_key\":\"92e50b5bd248ebfb6f972256a17c6d2d17ce2145865cd1cc44230d3d119f26d8a522e177ed0fbd504503141bda84105e635be0c2e93902e100da9c68b4200525\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20220316/III/XVI/00001\",\"merchant_id\":\"G921150555\",\"masked_card\":\"491111-1113\",\"gross_amount\":\"120900.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Do not honour\",\"channel_response_code\":\"05\",\"card_type\":\"debit\",\"bank\":\"mandiri\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2022-03-16 04:24:57', '2022-03-16 04:24:57'),
(2, 8, 'PAY/20220316/III/XVI/00002', '120900.00', 'midtrans', 'success', '3dd1d85c-fc67-4588-a70f-34ea13eb32b7', '{\"transaction_time\":\"2022-03-16 11:26:22\",\"transaction_status\":\"capture\",\"transaction_id\":\"3dd1d85c-fc67-4588-a70f-34ea13eb32b7\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"35217c245ff0afaf388094aea73c1649845ae2ef4d7154e7e2f809ba81f13b2fbc52571dac55c276f90704d005014db31fbd17aa9f8d5aedea57364f0f63f4d8\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20220316/III/XVI/00001\",\"merchant_id\":\"G921150555\",\"masked_card\":\"481111-1114\",\"gross_amount\":\"120900.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Approved\",\"channel_response_code\":\"00\",\"card_type\":\"credit\",\"bank\":\"mandiri\",\"approval_code\":\"1647404787376\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2022-03-16 04:26:28', '2022-03-16 04:26:28'),
(3, 9, 'PAY/20220316/III/XVI/00003', '152200.00', 'midtrans', 'pending', '0f0d26e7-f72c-4c42-b765-4c85a4393cb9', '{\"transaction_time\":\"2022-03-16 11:37:18\",\"transaction_status\":\"pending\",\"transaction_id\":\"0f0d26e7-f72c-4c42-b765-4c85a4393cb9\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"201\",\"signature_key\":\"0da9aa905b15849716edd21bfc01e9aa6f56faee69215f0ebbd017da679d3e2e98e5b9d95298e0db5c3edf56131be1c8e976b9a85c1b8d976ed844586e9f6344\",\"payment_type\":\"gopay\",\"order_id\":\"INV/20220316/III/XVI/00002\",\"merchant_id\":\"G921150555\",\"gross_amount\":\"152200.00\",\"fraud_status\":\"accept\",\"currency\":\"IDR\"}', 'gopay', NULL, NULL, NULL, NULL, NULL, '2022-03-16 04:37:19', '2022-03-16 04:37:19'),
(4, 10, 'PAY/20220316/III/XVI/00004', '246800.00', 'midtrans', 'success', '1483a73b-7812-4943-9e01-8d8063d37ccf', '{\"transaction_time\":\"2022-03-16 11:42:20\",\"transaction_status\":\"capture\",\"transaction_id\":\"1483a73b-7812-4943-9e01-8d8063d37ccf\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"3c1a3e336e9b7daf000c8bc42bba974e26d152f1a65ffb1eca9821a8e4d17eed2d383f0ddc875347dc2b59003a8eee89446e0a0dbfe2fa1c66fe999235e456f2\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20220316/III/XVI/00003\",\"merchant_id\":\"G921150555\",\"masked_card\":\"481111-1114\",\"gross_amount\":\"246800.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Approved\",\"channel_response_code\":\"00\",\"card_type\":\"credit\",\"bank\":\"mandiri\",\"approval_code\":\"1647405746262\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2022-03-16 04:42:27', '2022-03-16 04:42:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_users', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(2, 'add_users', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(3, 'edit_users', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(4, 'delete_users', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(5, 'view_roles', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(6, 'add_roles', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(7, 'edit_roles', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(8, 'delete_roles', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(9, 'view_products', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(10, 'add_products', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(11, 'edit_products', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(12, 'delete_products', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(13, 'view_orders', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(14, 'add_orders', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(15, 'edit_orders', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(16, 'delete_orders', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(17, 'view_categories', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(18, 'add_categories', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(19, 'edit_categories', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(20, 'delete_categories', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(21, 'view_attributes', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(22, 'add_attributes', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(23, 'edit_attributes', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00'),
(24, 'delete_attributes', 'web', '2022-03-14 02:07:00', '2022-03-14 02:07:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `parent_id`, `user_id`, `sku`, `type`, `name`, `slug`, `price`, `weight`, `width`, `height`, `length`, `short_description`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'BRG0001', 'simple', 'Kaos Oblong', 'kaos-oblong', '1000000.00', '500.00', '100.00', '100.00', '100.00', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, '2022-03-14 02:19:50', '2022-03-14 09:27:52'),
(2, NULL, 1, 'BRG0002', 'configurable', 'Kemeja Polos Formal', 'kemeja-polos-formal', NULL, NULL, NULL, NULL, NULL, 'Kemeja dari bahasa Portugis: camisa, adalah sebuah baju atau pakaian atas, terutama untuk pria. Pakaian ini menutupi tangan, bahu, dada sampai ke perut. Nama lainnya adalah kamisa, yang masih dekat dengan bentuk aslinya; blus, dari bahasa Prancis, terutama untuk wanita dan hem dari bahasa Belanda.', 'PERHATIAN ! KETERSEDIAAN SIZE PRODUK ADA PADA GAMBAR .\r\n\r\nEstimasi ukuran :\r\n- M ( 50 lebar x 70 panjang )\r\n- L ( 52 lebar x 72 panjang )\r\n- XL ( 54 lebar x 74 panjang )\r\n\r\nnote :\r\n- Silahkan tanya dulu model dan size yang anda inginkan sebelum order ,untuk menghindari kekosongan stock .\r\n- Size , warna , dan bentuk di gambar sesuai 100% dengan keadaan asli .\r\n- Bahan Halus & tidak kasar.', 1, '2022-03-15 16:39:57', '2022-03-15 16:44:25'),
(6, 2, 1, 'BRG0002-3-6', 'simple', 'Kemeja Polos Formal - M - Merah', 'kemeja-polos-formal-m-merah', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(7, 2, 1, 'BRG0002-3-9', 'simple', 'Kemeja Polos Formal - M - Biru', 'kemeja-polos-formal-m-biru', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(8, 2, 1, 'BRG0002-3-10', 'simple', 'Kemeja Polos Formal - M - Abu-Abu', 'kemeja-polos-formal-m-abu-abu', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(9, 2, 1, 'BRG0002-4-6', 'simple', 'Kemeja Polos Formal - L - Merah', 'kemeja-polos-formal-l-merah', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(10, 2, 1, 'BRG0002-4-9', 'simple', 'Kemeja Polos Formal - L - Biru', 'kemeja-polos-formal-l-biru', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(11, 2, 1, 'BRG0002-4-10', 'simple', 'Kemeja Polos Formal - L - Abu-Abu', 'kemeja-polos-formal-l-abu-abu', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(12, 2, 1, 'BRG0002-5-6', 'simple', 'Kemeja Polos Formal - XL - Merah', 'kemeja-polos-formal-xl-merah', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(13, 2, 1, 'BRG0002-5-9', 'simple', 'Kemeja Polos Formal - XL - Biru', 'kemeja-polos-formal-xl-biru', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(14, 2, 1, 'BRG0002-5-10', 'simple', 'Kemeja Polos Formal - XL - Abu-Abu', 'kemeja-polos-formal-xl-abu-abu', '99000.00', '300.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:39:57', '2022-03-15 16:41:13'),
(15, NULL, 1, 'BRG0003', 'configurable', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s', NULL, NULL, NULL, NULL, NULL, NULL, 'Kaos Pria dan Wanita\r\nBahan CottonCombed 30s\r\n\r\nSemua warna REAKTIF\r\nSabloners, Reseller dan Dropshipper\r\n\r\nBebas pilih warna dan size (M / L / XL harga sama ). Beli satu kaos bisa\r\n\r\nSize Chart :\r\n\r\nXS = L(43) T(65)\r\nS = L(45) T(67)\r\nM = L(48) T(69)\r\nL = L(50) T(72)\r\nXL = L(53) T(74)\r\n\r\nBahan 100% Cotton Combed 30s Grade A\r\nHigh Quality\r\nJahitan Rantai di pundak\r\nPola Panjang, tidak mengantung\r\nBahan adem, Lembut dan nyaman dipakai\r\nGARANSI UANG KEMBALI jika bukan combed 100%\r\n\r\nAda Toleransi ukuran beda +- 2-3 cm', 1, '2022-03-15 16:49:11', '2022-03-15 16:51:17'),
(16, 15, 1, 'BRG0003-1-6', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XS - Merah', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xs-merah', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(17, 15, 1, 'BRG0003-1-7', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XS - Kuning', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xs-kuning', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(18, 15, 1, 'BRG0003-1-8', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XS - Hijau', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xs-hijau', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(19, 15, 1, 'BRG0003-1-9', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XS - Biru', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xs-biru', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(20, 15, 1, 'BRG0003-1-10', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XS - Abu-Abu', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xs-abu-abu', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(21, 15, 1, 'BRG0003-2-6', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - S - Merah', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-s-merah', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(22, 15, 1, 'BRG0003-2-7', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - S - Kuning', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-s-kuning', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(23, 15, 1, 'BRG0003-2-8', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - S - Hijau', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-s-hijau', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(24, 15, 1, 'BRG0003-2-9', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - S - Biru', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-s-biru', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(25, 15, 1, 'BRG0003-2-10', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - S - Abu-Abu', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-s-abu-abu', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(26, 15, 1, 'BRG0003-3-6', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - M - Merah', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-m-merah', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(27, 15, 1, 'BRG0003-3-7', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - M - Kuning', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-m-kuning', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(28, 15, 1, 'BRG0003-3-8', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - M - Hijau', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-m-hijau', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(29, 15, 1, 'BRG0003-3-9', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - M - Biru', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-m-biru', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(30, 15, 1, 'BRG0003-3-10', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - M - Abu-Abu', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-m-abu-abu', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(31, 15, 1, 'BRG0003-4-6', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - L - Merah', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-l-merah', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(32, 15, 1, 'BRG0003-4-7', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - L - Kuning', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-l-kuning', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(33, 15, 1, 'BRG0003-4-8', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - L - Hijau', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-l-hijau', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(34, 15, 1, 'BRG0003-4-9', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - L - Biru', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-l-biru', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(35, 15, 1, 'BRG0003-4-10', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - L - Abu-Abu', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-l-abu-abu', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(36, 15, 1, 'BRG0003-5-6', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XL - Merah', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xl-merah', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(37, 15, 1, 'BRG0003-5-7', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XL - Kuning', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xl-kuning', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(38, 15, 1, 'BRG0003-5-8', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XL - Hijau', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xl-hijau', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(39, 15, 1, 'BRG0003-5-9', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XL - Biru', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xl-biru', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45'),
(40, 15, 1, 'BRG0003-5-10', 'simple', 'KAOS DISTRO/KAOS OBLONG/KAOS POLOS LENGAN PENDEK COTTON COMBED 30S - XL - Abu-Abu', 'kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s-xl-abu-abu', '28000.00', '185.00', NULL, NULL, NULL, NULL, NULL, 1, '2022-03-15 16:49:11', '2022-03-15 16:52:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(8,2) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `parent_product_id`, `product_id`, `attribute_id`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `created_at`, `updated_at`) VALUES
(7, NULL, 6, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(8, NULL, 6, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(9, NULL, 7, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(10, NULL, 7, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(11, NULL, 8, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(12, NULL, 8, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(13, NULL, 9, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(14, NULL, 9, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(15, NULL, 10, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(16, NULL, 10, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(17, NULL, 11, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(18, NULL, 11, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(19, NULL, 12, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(20, NULL, 12, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(21, NULL, 13, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(22, NULL, 13, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(23, NULL, 14, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(24, NULL, 14, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:39:57', '2022-03-15 16:39:57'),
(25, NULL, 16, 1, 'XS', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(26, NULL, 16, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(27, NULL, 17, 1, 'XS', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(28, NULL, 17, 2, 'Kuning', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(29, NULL, 18, 1, 'XS', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(30, NULL, 18, 2, 'Hijau', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(31, NULL, 19, 1, 'XS', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(32, NULL, 19, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(33, NULL, 20, 1, 'XS', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(34, NULL, 20, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(35, NULL, 21, 1, 'S', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(36, NULL, 21, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(37, NULL, 22, 1, 'S', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(38, NULL, 22, 2, 'Kuning', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(39, NULL, 23, 1, 'S', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(40, NULL, 23, 2, 'Hijau', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(41, NULL, 24, 1, 'S', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(42, NULL, 24, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(43, NULL, 25, 1, 'S', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(44, NULL, 25, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(45, NULL, 26, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(46, NULL, 26, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(47, NULL, 27, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(48, NULL, 27, 2, 'Kuning', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(49, NULL, 28, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(50, NULL, 28, 2, 'Hijau', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(51, NULL, 29, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(52, NULL, 29, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(53, NULL, 30, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(54, NULL, 30, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(55, NULL, 31, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(56, NULL, 31, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(57, NULL, 32, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(58, NULL, 32, 2, 'Kuning', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(59, NULL, 33, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(60, NULL, 33, 2, 'Hijau', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(61, NULL, 34, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(62, NULL, 34, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(63, NULL, 35, 1, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(64, NULL, 35, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(65, NULL, 36, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(66, NULL, 36, 2, 'Merah', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(67, NULL, 37, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(68, NULL, 37, 2, 'Kuning', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(69, NULL, 38, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(70, NULL, 38, 2, 'Hijau', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(71, NULL, 39, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(72, NULL, 39, 2, 'Biru', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(73, NULL, 40, 1, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11'),
(74, NULL, 40, 2, 'Abu-Abu', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 16:49:11', '2022-03-15 16:49:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`) VALUES
(2, 2, 4),
(6, 6, 4),
(7, 7, 4),
(8, 8, 4),
(9, 9, 4),
(10, 10, 4),
(11, 11, 4),
(12, 12, 4),
(13, 13, 4),
(14, 14, 4),
(15, 15, 7),
(16, 16, 7),
(17, 17, 7),
(18, 18, 7),
(19, 19, 7),
(20, 20, 7),
(21, 21, 7),
(22, 22, 7),
(23, 23, 7),
(24, 24, 7),
(25, 25, 7),
(26, 26, 7),
(27, 27, 7),
(28, 28, 7),
(29, 29, 7),
(30, 30, 7),
(31, 31, 7),
(32, 32, 7),
(33, 33, 7),
(34, 34, 7),
(35, 35, 7),
(36, 36, 7),
(37, 37, 7),
(38, 38, 7),
(39, 39, 7),
(40, 40, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/images/kaos-oblong_1647275018.jpeg', '2022-03-14 09:23:38', '2022-03-14 09:23:38'),
(6, 2, 'uploads/images/kemeja-polos-formal_1647362760.jpeg', '2022-03-15 16:46:00', '2022-03-15 16:46:00'),
(7, 2, 'uploads/images/kemeja-polos-formal_1647362765.jpeg', '2022-03-15 16:46:05', '2022-03-15 16:46:05'),
(8, 2, 'uploads/images/kemeja-polos-formal_1647362770.jpeg', '2022-03-15 16:46:10', '2022-03-15 16:46:10'),
(9, 15, 'uploads/images/kaos-distrokaos-oblongkaos-polos-lengan-pendek-cotton-combed-30s_1647363099.jpeg', '2022-03-15 16:51:39', '2022-03-15 16:51:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_inventories`
--

INSERT INTO `product_inventories` (`id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-03-14 02:20:06', '2022-03-15 13:31:05'),
(5, 6, 10, '2022-03-15 16:41:13', '2022-03-15 16:41:13'),
(6, 7, 8, '2022-03-15 16:41:13', '2022-03-16 04:40:11'),
(7, 8, 9, '2022-03-15 16:41:13', '2022-03-16 03:51:37'),
(8, 9, 10, '2022-03-15 16:41:13', '2022-03-15 16:41:13'),
(9, 10, 10, '2022-03-15 16:41:13', '2022-03-15 16:41:13'),
(10, 11, 10, '2022-03-15 16:41:13', '2022-03-15 16:41:13'),
(11, 12, 10, '2022-03-15 16:41:13', '2022-03-15 16:41:13'),
(12, 13, 10, '2022-03-15 16:41:13', '2022-03-15 16:41:13'),
(13, 14, 10, '2022-03-15 16:41:13', '2022-03-15 16:41:13'),
(14, 16, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(15, 17, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(16, 18, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(17, 19, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(18, 20, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(19, 21, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(20, 22, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(21, 23, 48, '2022-03-15 16:51:17', '2022-03-16 04:35:44'),
(22, 24, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(23, 25, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(24, 26, 47, '2022-03-15 16:51:17', '2022-03-16 04:35:44'),
(25, 27, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(26, 28, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(27, 29, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(28, 30, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(29, 31, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(30, 32, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(31, 33, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(32, 34, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(33, 35, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(34, 36, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(35, 37, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(36, 38, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(37, 39, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17'),
(38, 40, 50, '2022-03-15 16:51:17', '2022-03-15 16:51:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-03-14 02:07:19', '2022-03-14 02:07:19'),
(2, 'Operator', 'web', '2022-03-14 02:07:19', '2022-03-14 02:07:19'),
(3, 'Custommer', 'web', '2022-03-14 08:14:55', '2022-03-14 08:14:55'),
(4, 'Coba', 'web', '2022-03-18 07:11:40', '2022-03-18 07:11:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(5, 4),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 2),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(13, 1),
(13, 2),
(13, 4),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(17, 4),
(18, 1),
(18, 2),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(21, 4),
(22, 1),
(23, 1),
(24, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `track_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_weight` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `shipped_by` bigint(20) UNSIGNED DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `shipments`
--

INSERT INTO `shipments` (`id`, `user_id`, `order_id`, `track_number`, `status`, `total_qty`, `total_weight`, `first_name`, `last_name`, `address1`, `address2`, `phone`, `email`, `city_id`, `province_id`, `postcode`, `shipped_by`, `shipped_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, 'pending', 1, 500, 'Shipper', 'Last', 'Address 2', NULL, '02193490124', 'shipper@mail.com', '445', '10', 58687, NULL, NULL, NULL, '2022-03-15 09:47:56', '2022-03-15 09:47:56'),
(2, 4, 2, NULL, 'pending', 1, 500, 'Priaji', 'Oktawibyan Abror', 'Address 1', NULL, '083856363632', 'ajipriaji11@gmail.com', '42', '11', 54372, NULL, NULL, NULL, '2022-03-15 11:53:51', '2022-03-15 11:53:51'),
(3, 4, 3, NULL, 'pending', 1, 500, 'Priaji', 'Oktawibyan Abror', 'Alamat broooo', NULL, '083856363632', 'ajipriaji11@gmail.com', '152', '6', 54372, NULL, NULL, NULL, '2022-03-15 13:31:05', '2022-03-15 13:31:05'),
(4, 5, 4, NULL, 'pending', 1, 185, 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', 'Universitas Sebelas Maret', '083856363632', 'ajipriaji15@gmail.com', '445', '10', 57126, NULL, NULL, NULL, '2022-03-15 16:56:34', '2022-03-15 16:56:34'),
(5, 5, 8, NULL, 'pending', 1, 300, 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', NULL, '083856363632', 'ajipriaji15@gmail.com', '445', '10', 54372, NULL, NULL, NULL, '2022-03-16 03:51:37', '2022-03-16 03:51:37'),
(6, 5, 9, NULL, 'pending', 4, 740, 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', NULL, '083856363632', 'ajipriaji15@gmail.com', '445', '10', 54372, NULL, NULL, NULL, '2022-03-16 04:35:44', '2022-03-16 04:35:44'),
(7, 5, 10, NULL, 'pending', 2, 600, 'Christoper', 'Diaz', 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', NULL, '083856363632', 'ajipriaji15@gmail.com', '445', '10', 54372, NULL, NULL, NULL, '2022-03-16 04:40:11', '2022-03-16 04:40:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `company`, `address1`, `address2`, `province_id`, `city_id`, `postcode`, `created_at`, `updated_at`) VALUES
(1, 'Hyman Toy', NULL, 'admin@example.com', NULL, '2022-03-14 02:07:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ayZD9dq09Y4Sg0YwGl5TAmndShl0kZqfdykMx0eXW83wxhmDdYKbOlvS9KF6', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-14 02:07:19', '2022-03-14 02:07:19'),
(2, 'Mabelle Zulauf', NULL, 'operator@example.com', NULL, '2022-03-14 02:07:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2la82i7bWU', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-14 02:07:19', '2022-03-14 02:07:19'),
(4, 'Priaji', 'Oktawibyan Abror', 'ajipriaji11@gmail.com', NULL, NULL, '$2y$10$nRJC/xscCg129Mbj.yK1ludF49tmgWjpD7aGeCfUEuEdAxlAQ0b.e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 00:37:18', '2022-03-15 00:37:18'),
(5, 'Christoper', 'Diaz', 'ajipriaji15@gmail.com', '083856363632', NULL, '$2y$10$SKmVc/gcAjtu0r5rKs7k2OulHXJDmMRfnmdtAx27uXWKjohUfxHRC', NULL, NULL, 'Jl. Ir. Sutami No.36, Kentingan, Kec. Jebres, Kota Surakarta, Jawa Tengah', NULL, NULL, NULL, NULL, '2022-03-15 16:55:22', '2022-03-15 16:55:22');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_unique` (`code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_approved_by_foreign` (`approved_by`),
  ADD KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  ADD KEY `orders_code_index` (`code`),
  ADD KEY `orders_code_order_date_index` (`code`,`order_date`),
  ADD KEY `orders_payment_token_index` (`payment_token`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_sku_index` (`sku`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_number_unique` (`number`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_number_index` (`number`),
  ADD KEY `payments_method_index` (`method`),
  ADD KEY `payments_token_index` (`token`),
  ADD KEY `payments_payment_type_index` (`payment_type`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);
ALTER TABLE `products` ADD FULLTEXT KEY `search` (`name`,`slug`,`short_description`,`description`);

--
-- Indeks untuk tabel `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  ADD KEY `product_attribute_values_parent_product_id_foreign` (`parent_product_id`);

--
-- Indeks untuk tabel `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_inventories_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_user_id_foreign` (`user_id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_shipped_by_foreign` (`shipped_by`),
  ADD KEY `shipments_track_number_index` (`track_number`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT untuk tabel `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_attribute_values_parent_product_id_foreign` FOREIGN KEY (`parent_product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `shipments_shipped_by_foreign` FOREIGN KEY (`shipped_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shipments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
