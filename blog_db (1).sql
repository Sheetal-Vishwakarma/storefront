-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2024 at 03:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add contactus', 8, 'add_contactus'),
(30, 'Can change contactus', 8, 'change_contactus'),
(31, 'Can delete contactus', 8, 'delete_contactus'),
(32, 'Can view contactus', 8, 'view_contactus'),
(33, 'Can add newsletter', 9, 'add_newsletter'),
(34, 'Can change newsletter', 9, 'change_newsletter'),
(35, 'Can delete newsletter', 9, 'delete_newsletter'),
(36, 'Can view newsletter', 9, 'view_newsletter'),
(37, 'Can add testimonial', 10, 'add_testimonial'),
(38, 'Can change testimonial', 10, 'change_testimonial'),
(39, 'Can delete testimonial', 10, 'delete_testimonial'),
(40, 'Can view testimonial', 10, 'view_testimonial'),
(41, 'Can add portfolio', 11, 'add_portfolio'),
(42, 'Can change portfolio', 11, 'change_portfolio'),
(43, 'Can delete portfolio', 11, 'delete_portfolio'),
(44, 'Can view portfolio', 11, 'view_portfolio'),
(45, 'Can add person', 12, 'add_person'),
(46, 'Can change person', 12, 'change_person'),
(47, 'Can delete person', 12, 'delete_person'),
(48, 'Can view person', 12, 'view_person');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$s5Idv6QRNtf8Y3FaJuRCAp$NprO66iYJ02oOUY/AxAFvZPTapy0ebTzMX7y7Xqjq0c=', '2024-09-12 06:12:18.319748', 1, 'sheetal.vishwakarma', 'Sheetal', 'Vishwakarma', 'sheetal@admin.com', 1, 1, '2024-08-26 10:33:10.000000'),
(2, 'pbkdf2_sha256$600000$r30sdu29EHwGBaDzratjsJ$RzpNQiitLQA9mROTpsW9EsdATXkQLyXsWDjD2ogYPoc=', '2024-08-26 10:37:07.013732', 1, 'Sub_User', 'Siya', 'Sharma', 'siya@admin.com', 1, 1, '2024-08-26 10:34:24.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(37, 1, 1),
(38, 1, 2),
(39, 1, 3),
(40, 1, 4),
(41, 1, 5),
(42, 1, 6),
(43, 1, 7),
(44, 1, 8),
(45, 1, 9),
(46, 1, 10),
(47, 1, 11),
(48, 1, 12),
(49, 1, 13),
(50, 1, 14),
(51, 1, 15),
(52, 1, 16),
(53, 1, 17),
(54, 1, 18),
(55, 1, 19),
(56, 1, 20),
(57, 1, 21),
(58, 1, 22),
(59, 1, 23),
(60, 1, 24),
(61, 1, 25),
(62, 1, 26),
(63, 1, 27),
(64, 1, 28),
(65, 1, 29),
(66, 1, 30),
(67, 1, 31),
(68, 1, 32),
(69, 1, 33),
(70, 1, 34),
(71, 1, 35),
(72, 1, 36),
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 2, 22),
(23, 2, 23),
(24, 2, 24),
(25, 2, 25),
(26, 2, 26),
(27, 2, 27),
(28, 2, 28),
(29, 2, 29),
(30, 2, 30),
(31, 2, 31),
(32, 2, 32),
(33, 2, 33),
(34, 2, 34),
(35, 2, 35),
(36, 2, 36);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `subject` longtext DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Test Abc', 'test@gmail.com', 'Test Subject', 'Test remark ', '2024-08-21 16:07:53', '2024-08-21 16:07:53'),
(2, 'Test Abc', 'test@gmail.com', 'Test Subject', 'Test remark ', '2024-08-21 16:08:08', '2024-08-21 16:08:08'),
(3, 'John sihna', 'john@netscribes.com', 'For website inquiry', 'This is request if we can schedule demo', '2024-08-21 16:21:06', '2024-08-21 16:21:06'),
(4, 'Test Sheetal', 'testsh@gmail.com', 'test sub', 'test msg', '2024-08-21 16:38:27', '2024-08-21 16:38:27'),
(6, 'Test', 'test@gmail.com', 'Test Subject', 'Test message', '2024-08-22 17:11:01', '2024-08-22 17:11:01'),
(7, 'Siya Sharma', 'siya@gmail.com', 'Request for website demo', 'This is test message from siya', '2024-09-12 19:24:20', '2024-09-12 19:24:20'),
(8, 'Vishal Koshik', 'vishal_koshik@gmail.com', 'Test Subject', 'Test message', '2024-09-12 19:26:31', '2024-09-12 19:26:31'),
(9, 'Shreya dev', 'shreya@gmail.com', 'Test Subject', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-09-12 19:28:41', '2024-09-12 19:28:41'),
(10, 'Sheetal Bajarangbali Vishwakarma', 'sheetal.vishwakarma@netscribes.com', 'Test Subject', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '2024-09-12 19:30:29', '2024-09-12 19:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-08-26 10:34:24.988984', '2', 'Sub_User', 1, '[{\"added\": {}}]', 4, 1),
(2, '2024-08-26 10:35:23.736013', '2', 'Sub_User', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\", \"User permissions\"]}}]', 4, 1),
(3, '2024-08-26 10:35:46.718486', '1', 'sheetal.vishwakarma', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"User permissions\"]}}]', 4, 1),
(4, '2024-08-26 10:45:10.246990', '6', 'Newsletter object (6)', 1, '[{\"added\": {}}]', 9, 2),
(5, '2024-08-26 11:22:44.491293', '1', 'Testimonial object (1)', 1, '[{\"added\": {}}]', 10, 1),
(6, '2024-08-26 11:24:18.861405', '2', 'Testimonial object (2)', 1, '[{\"added\": {}}]', 10, 1),
(7, '2024-08-26 11:27:26.292347', '3', 'Testimonial object (3)', 1, '[{\"added\": {}}]', 10, 1),
(8, '2024-08-26 11:29:58.526222', '3', 'Testimonial object (3)', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 10, 1),
(9, '2024-08-26 11:31:59.611264', '4', 'Testimonial object (4)', 1, '[{\"added\": {}}]', 10, 1),
(10, '2024-08-27 04:34:48.987994', '4', 'Testimonial object (4)', 2, '[]', 10, 1),
(11, '2024-08-27 04:35:06.498129', '4', 'Testimonial object (4)', 2, '[{\"changed\": {\"fields\": [\"Is active\"]}}]', 10, 1),
(12, '2024-08-27 04:49:17.667727', '3', 'Testimonial object (3)', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 10, 1),
(13, '2024-08-27 04:49:25.291713', '2', 'Testimonial object (2)', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 10, 1),
(14, '2024-08-27 04:49:57.059032', '2', 'Testimonial object (2)', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 10, 1),
(15, '2024-08-28 05:22:26.018465', '4', 'Testimonial object (4)', 2, '[{\"changed\": {\"fields\": [\"Is active\"]}}]', 10, 1),
(16, '2024-08-28 06:43:43.222558', '1', 'Portfolio object (1)', 1, '[{\"added\": {}}]', 11, 1),
(17, '2024-08-28 07:25:33.340736', '1', 'Portfolio object (1)', 2, '[{\"changed\": {\"fields\": [\"Type\", \"Short description\", \"Long description\"]}}]', 11, 1),
(18, '2024-08-28 07:27:25.309732', '1', 'Portfolio object (1)', 2, '[{\"changed\": {\"fields\": [\"Type\"]}}]', 11, 1),
(19, '2024-08-28 08:00:59.465341', '1', 'Portfolio object (1)', 2, '[{\"changed\": {\"fields\": [\"Project date\"]}}]', 11, 1),
(20, '2024-08-28 09:08:19.003762', '2', 'Portfolio object (2)', 1, '[{\"added\": {}}]', 11, 1),
(21, '2024-08-28 09:10:03.226078', '2', 'Portfolio object (2)', 2, '[]', 11, 1),
(22, '2024-08-28 09:11:25.673701', '2', 'Portfolio object (2)', 2, '[{\"changed\": {\"fields\": [\"Short description\"]}}]', 11, 1),
(23, '2024-08-28 09:35:21.316905', '2', 'Portfolio object (2)', 2, '[{\"changed\": {\"fields\": [\"Image 3\"]}}]', 11, 1),
(24, '2024-08-28 10:44:41.612997', '3', 'Portfolio object (3)', 1, '[{\"added\": {}}]', 11, 1),
(25, '2024-08-28 10:46:07.799539', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Short description\", \"Long description\"]}}]', 11, 1),
(26, '2024-08-28 10:48:02.847476', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Image 2\"]}}]', 11, 1),
(27, '2024-08-28 10:50:30.472883', '3', 'Portfolio object (3)', 2, '[]', 11, 1),
(28, '2024-08-28 10:50:45.207945', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Image 2\"]}}]', 11, 1),
(29, '2024-08-28 10:51:22.489861', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Long description\"]}}]', 11, 1),
(30, '2024-08-28 10:53:41.548236', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Short description\"]}}]', 11, 1),
(31, '2024-08-28 10:55:24.279835', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Long description\"]}}]', 11, 1),
(32, '2024-08-28 10:55:57.743138', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Long description\"]}}]', 11, 1),
(33, '2024-08-28 10:56:34.356970', '3', 'Portfolio object (3)', 2, '[{\"changed\": {\"fields\": [\"Long description\"]}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(12, 'api', 'person'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'playground', 'contactus'),
(9, 'playground', 'newsletter'),
(11, 'playground', 'portfolio'),
(10, 'playground', 'testimonial'),
(7, 'playground', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-14 08:37:19.268681'),
(2, 'auth', '0001_initial', '2024-08-14 08:37:20.384207'),
(3, 'admin', '0001_initial', '2024-08-14 08:37:20.630907'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-14 08:37:20.645916'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-14 08:37:20.664511'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-14 08:37:20.765016'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-14 08:37:20.882470'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-14 08:37:20.902725'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-14 08:37:20.904878'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-14 08:37:20.982976'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-14 08:37:21.000148'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-14 08:37:21.011012'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-14 08:37:21.025027'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-14 08:37:21.052061'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-14 08:37:21.067772'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-14 08:37:21.087802'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-14 08:37:21.101228'),
(18, 'playground', '0001_initial', '2024-08-14 08:37:21.140486'),
(19, 'playground', '0002_alter_user_contact_alter_user_password', '2024-08-14 08:37:21.382703'),
(20, 'playground', '0003_contactus_alter_user_email', '2024-08-14 08:37:21.524386'),
(21, 'sessions', '0001_initial', '2024-08-14 08:37:21.584887'),
(22, 'playground', '0004_newsletter', '2024-08-26 07:41:26.998488'),
(23, 'playground', '0005_alter_newsletter_created_at', '2024-08-26 07:54:06.880435'),
(24, 'playground', '0006_alter_newsletter_updated_at', '2024-08-26 08:59:51.741841'),
(25, 'playground', '0007_testimonial', '2024-08-26 11:06:28.039794'),
(26, 'playground', '0008_alter_testimonial_rating', '2024-08-26 11:08:14.224284'),
(27, 'playground', '0009_alter_testimonial_rating', '2024-08-26 11:11:04.172337'),
(28, 'playground', '0010_alter_testimonial_rating', '2024-08-26 11:29:43.065405'),
(29, 'playground', '0011_portfolio', '2024-08-28 06:23:11.473756'),
(30, 'playground', '0012_alter_portfolio_type', '2024-08-28 06:38:04.639846'),
(31, 'playground', '0013_alter_portfolio_type_alter_portfolio_updated_at', '2024-08-28 06:39:29.571340'),
(32, 'playground', '0014_alter_portfolio_type', '2024-08-28 06:43:12.826558'),
(33, 'playground', '0015_alter_portfolio_type', '2024-08-28 07:27:10.316119'),
(34, 'api', '0001_initial', '2024-10-08 11:14:11.660708'),
(35, 'api', '0002_alter_person_created_at_alter_person_updated_at', '2024-10-08 11:15:14.589568');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6hj0layrpxydfpjx6h1x9yao93kb9ec2', '.eJxVjDEOwjAQBP_iGlk-wE5MSc8brDvvgQPIkeKkQvwdIqWAdmdmXybxMpe0NJ3SAHMyZHa_m3B-aF0B7lxvo81jnadB7KrYjTZ7GaHP8-b-HRRu5Vt3DIkMR5w5gOXoWK7aBwpECna9imcA3gkEQWPQvHekIR868lHM-wMu8zmP:1siuYt:bEUGBB56MY4UXjAqbNPyydSYcVi4nO9UCMOk4Iaz6vk', '2024-09-10 11:40:35.870773'),
('ir6x5up8m2sg57166w3b4o867658orla', '.eJxVjDEOwjAQBP_iGlk-wE5MSc8brDvvgQPIkeKkQvwdIqWAdmdmXybxMpe0NJ3SAHMyZHa_m3B-aF0B7lxvo81jnadB7KrYjTZ7GaHP8-b-HRRu5Vt3DIkMR5w5gOXoWK7aBwpECna9imcA3gkEQWPQvHekIR868lHM-wMu8zmP:1sjXOL:KdKu9bI2Dnn_J_pz7xeNQ8vUy02_k8kYaJqCklAXGDs', '2024-09-12 05:08:17.642388'),
('tjgm3hlanpgy01adq07mek5ovw23msog', '.eJxVjDsOwjAQBe_iGlkbO_5R0nMGa71e4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVZDOL0uyWkB7cd5Du22yxpbusyJbkr8qBdXufMz8vh_h1U7PVbK6AClrPzAwMoKgGUNyqFcUwIZDk4bQwzeqDsKQSHGlgXRAveayPeH9oRN6I:1sod3y:9Oeg-Ev2gpvEAy-jiFfFYxK9sJUm6XRhi3JMIWSJJIE', '2024-09-26 06:12:18.331027');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `subscribed` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `subscribed`, `created_at`, `updated_at`) VALUES
(1, 'test@gmail.com', 1, '2024-08-26 15:41:59', '2024-08-26 15:41:59'),
(2, 'test1@gmail.com', 1, '2024-08-26 15:53:57', '2024-08-26 15:53:57'),
(3, 'test2@gmail.com', 1, '2024-08-26 15:54:46', '2024-08-26 15:54:46'),
(4, 'test3@gmail.com', 1, '2024-08-26 15:57:01', '2024-08-26 15:57:01'),
(5, 'test4@netscribes.com', 1, '2024-08-26 15:58:22', '2024-08-26 15:58:22'),
(6, 'sheetal.vishwakarma@netscribes.com', 1, '2024-08-26 10:44:57', '2024-08-26 10:45:06'),
(7, 'test5@gmail.com', 1, '2024-08-27 19:11:02', '2024-08-27 19:11:02'),
(8, 'vandana@gmail.com', 1, '2024-09-10 12:24:47', '2024-09-10 12:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`, `email`, `contact`, `created_at`, `updated_at`) VALUES
(1, 'Sheetal V', 'sheetal@gmail.com', '8169065254', NULL, NULL),
(2, 'Siya Sharma', 'siya@gmail.com', '8169062130', '2024-10-08 18:21:10.000000', NULL),
(3, 'Divya Mishra', 'divya@gmail.com', '9798788874', '2024-10-08 19:00:00.000000', NULL),
(4, 'Tanvi Seth', 'tanvi_seth@gmail.com', '88888888', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` bigint(20) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category` varchar(255) NOT NULL,
  `client` varchar(200) NOT NULL,
  `project_date` date NOT NULL,
  `project_url` varchar(200) NOT NULL,
  `short_description` longtext NOT NULL,
  `long_description` longtext NOT NULL,
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `image_3` varchar(255) DEFAULT NULL,
  `image_4` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `type`, `category`, `client`, `project_date`, `project_url`, `short_description`, `long_description`, `image_1`, `image_2`, `image_3`, `image_4`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'App', 'Infinite Stairs', 'App Company', '2024-04-15', 'https://play.google.com/store/apps/dev?id=6725928717461056431', 'Enjoy NFLY STUDIO games anytime, anywhere!', 'Arcade game loved around the world with over 12 million downloads to date!\r\nInfinite Stairs is addictive. Before you know it, you\'re hooked! \r\nBust out new records with your nimble skills!\r\nMeet games that anyone of all ages and genders can enjoy!', 'infinite-star-1.png', 'infinite-star-2.png', 'infinite-star-3.png', 'infinite-star-4.png', 1, '2024-08-28 11:54:58.000000', '2024-08-28 06:36:12.000000'),
(2, 'Product', 'NS Workflow', 'Carrefour', '2023-08-28', 'https://netscribes.app/', 'Data enrichment and validation', 'Providing auto text generation and correction using third party api that is open.ai. It also have permission and authorization for every user before accessing it.', 'ns-workflow-image1.png', 'ns-workflow-image2.png', NULL, NULL, 1, '2024-08-28 14:26:16.000000', NULL),
(3, 'Branding', 'Nike', 'B2C', '2000-10-31', 'https://www.nike.com/in/', 'Just do it!', 'Nike started their product with a focus on performance and innovation.Nike surpasses the test of time and continuously does excellent in the competitive market. It is the world\'s largest supplier of athletic shoes and apparel and a major manufacturer of sports equipment, with revenue in excess of US$46 billion in its fiscal year 2022.', 'nike-image1.png', NULL, NULL, NULL, 1, '2024-08-28 16:04:37.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `rating` int(2) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image_link` longtext DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `name`, `email`, `designation`, `rating`, `description`, `image_link`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Saul Goodman', 'saul.goodman@gmail.com', 'Ceo & Founder', 5, 'For the purpose of targeting, it is worth taking care of the results until the airline takes over. The accusers, however, need that, and need some discipline. Some faintness, but always a smile.', 'testimonials-1.jpg', 1, 1, '2024-08-26 16:49:34.000000', '2024-08-26 16:49:34.000000'),
(2, 'Sara Wilsson', 'sara.wilsson@gmail.com', 'Designer', 4, 'Export time, however, I was for the evils of the evils that I was going to be angry with the effort that I was going to be the one who was going to be.', 'testimonials-2.jpg', 1, NULL, '2024-08-26 16:53:06.000000', '2024-08-26 16:53:06.000000'),
(3, 'Jena Karlis', 'jena.karlis@gmail.com', 'Store Owner', 2, 'For if I did not export a hair from your house, which are great, none of which I would come to your house for a short time, I would have been my home, or I would have been the smallest.', 'testimonials-3.jpg', 1, NULL, '2024-08-26 16:54:30.000000', '2024-08-26 16:54:30.000000'),
(4, 'Matt Brandon', 'matt.brandon@gmail.com', 'Freelancer', 5, 'Good experiencence', 'testimonials-4.jpg', 1, NULL, '2024-08-26 17:00:24.000000', '2024-08-26 17:00:24.000000');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
