-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2026 at 03:08 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bot_answers`
--

CREATE TABLE `bot_answers` (
  `id` int NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bot_answers`
--

INSERT INTO `bot_answers` (`id`, `keywords`, `answer`) VALUES
(1, 'xin chào,hello,hi', 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?'),
(2, 'giá,bao nhiêu,tiền', 'Dạ, cắt tóc combo 7 bước là 100k. Nhuộm từ 200k ạ. Anh muốn xem chi tiết không?'),
(3, 'đặt lịch,book', 'Anh có thể bấm vào nút \"Đặt Lịch\" trên menu để chọn giờ đẹp nhất nhé!'),
(4, 'địa chỉ,ở đâu', 'Salon bên em ở Số 4 Lê Quang Đạo, Từ Sơn, Bắc Ninh ạ.'),
(5, 'giờ làm,mở cửa', 'Bên em mở cửa từ 8h00 sáng đến 21h00 tối tất cả các ngày trong tuần ạ.'),
(6, 'thợ cắt, thợ cắt đẹp', 'Dạ bên em có những thợ cắt đệp và ưng ý đối với mọi khách hàng đã từng trải nghiệm là: Nhật Minh, Mạnh Dũng, Công Huy và Việt Hùng.'),
(9, 'dịch vụ hot , hot', 'Dạ bên em có những dịch vụ HOT như là: Cắt tóc');

-- --------------------------------------------------------

--
-- Table structure for table `danhgia`
--

CREATE TABLE `danhgia` (
  `id` int NOT NULL,
  `ma_lich` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int NOT NULL,
  `dichvu_id` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`, `description`) VALUES
(4, 'DỊCH VỤ THƯ GIÃN', 'dịch vụ thư giãn'),
(8, 'DỊCH VỤ TÓC', 'Trải nghiệm cắt tóc phong cách dành riêng cho phái mạnh, vừa tiện lợi vừa thư giãn tại đây');

-- --------------------------------------------------------

--
-- Table structure for table `dichvu`
--

CREATE TABLE `dichvu` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `time` int DEFAULT NULL,
  `danhmuc_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dichvu`
--

INSERT INTO `dichvu` (`id`, `name`, `description`, `price`, `time`, `danhmuc_id`, `created_at`, `image`) VALUES
(7, 'Gội Đầu Thư Giãn', 'Dịch vụ gội đầu dưỡng sinh mang đến trải nghiệm thư giãn, xua tan căng thẳng.', '59000.00', 19, 4, '2025-11-17 21:51:37', '1763543251_goidauthugian.679Z.png'),
(8, 'Thay Đổi Màu Tóc', 'Màu tóc giúp định hình phong cách và thay đổi diện mạo một cách đột phá mà bất cứ ai cũng nên thử.', '190000.00', 30, 8, '2025-11-18 09:39:56', '1763433596_anhnhuomtoc.201Z.png'),
(11, 'Cắt xả tạo kiểu', 'Cắt xả tạo kiểu,xả sạch tóc con\r\ncạo mặt khai sáng ngũ quan', '194000.00', 40, 8, '2025-11-19 15:57:52', '1763542672_anhdichvutoc.png');

-- --------------------------------------------------------

--
-- Table structure for table `dichvu_tho`
--

CREATE TABLE `dichvu_tho` (
  `dichvu_id` int NOT NULL,
  `tho_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`id`, `name`, `email`, `password`, `phone`, `created_at`, `status`) VALUES
(1, 'Nhật Minh', 'daom73280@gmail.com', 'ddc83bf88c241349a4211172137545e0', '0862931725', '2025-11-18 20:47:16', 1),
(2, 'nguyễn hạ', 'hanguyen123@gmail.com', '27500f8ec124385d1605cc35e6aae5e1', '0862931725', '2025-11-23 17:39:41', 1),
(3, 'Nguyễn Trung', 'ha123@gmail.com', '4ba7fcb5a96146883323325320bca1e6', '0862931726', '2025-11-24 08:27:56', 1),
(4, 'hùng ngu', 'hung123@gmail.com', '5407cdb7621bf4688e069f627fc3a496', '0862931725', '2025-12-16 20:49:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khunggio`
--

CREATE TABLE `khunggio` (
  `id` int NOT NULL,
  `time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phan_cong_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `khunggio`
--

INSERT INTO `khunggio` (`id`, `time`, `phan_cong_id`) VALUES
(369, '08:00', 1),
(370, '16:00', 1),
(371, '19:00', 1),
(372, '10:00', 3),
(373, '14:00', 3),
(374, '19:00', 3),
(375, '11:00', 5),
(376, '12:00', 5),
(377, '13:00', 5),
(378, '15:00', 5),
(379, '16:00', 5),
(380, '18:00', 5),
(381, '08:00', 8),
(382, '10:00', 8),
(383, '12:00', 8),
(384, '14:00', 8),
(385, '16:00', 8),
(386, '18:00', 8),
(387, '20:00', 8),
(410, '08:40', 7),
(411, '10:40', 7),
(412, '11:40', 7),
(413, '13:40', 7),
(414, '15:40', 7),
(415, '17:40', 7),
(416, '19:40', 7),
(417, '20:40', 7),
(418, '21:40', 7),
(481, '08:00', 6),
(482, '09:00', 6),
(483, '10:00', 6),
(484, '11:00', 6),
(485, '12:00', 6),
(486, '13:00', 6),
(487, '14:00', 6),
(488, '15:00', 6),
(489, '16:00', 6),
(490, '17:00', 6),
(491, '19:30', 6),
(492, '20:00', 6),
(493, '08:00', 9),
(494, '09:00', 9),
(495, '10:00', 9),
(496, '11:00', 9),
(497, '12:00', 9),
(498, '13:30', 9),
(499, '14:30', 9),
(500, '16:00', 9),
(501, '17:00', 9),
(502, '18:30', 9),
(503, '19:30', 9),
(504, '08:00', 11),
(505, '09:00', 11),
(506, '10:00', 11),
(507, '11:00', 11),
(508, '12:00', 11),
(509, '13:30', 11),
(510, '14:30', 11),
(511, '16:00', 11),
(512, '17:00', 11),
(513, '15:00', 12),
(514, '15:30', 12),
(515, '16:00', 12),
(516, '16:30', 12),
(517, '17:00', 12),
(518, '17:30', 12),
(519, '19:00', 12),
(520, '19:30', 12),
(521, '20:00', 12),
(567, '08:00', 15),
(568, '08:30', 15),
(569, '09:00', 15),
(570, '09:30', 15),
(571, '10:00', 15),
(572, '10:30', 15),
(573, '11:00', 15),
(574, '11:30', 15),
(575, '12:00', 15),
(576, '12:30', 15),
(603, '08:00', 13),
(604, '08:30', 13),
(605, '09:00', 13),
(606, '09:30', 13),
(607, '10:00', 13),
(608, '10:30', 13),
(609, '11:00', 13),
(610, '11:30', 13),
(611, '12:00', 13),
(612, '13:00', 13),
(613, '08:00', 19),
(642, '08:00', 21),
(643, '08:30', 21),
(644, '09:00', 21),
(645, '09:30', 21),
(646, '10:00', 21),
(647, '11:00', 21),
(648, '11:30', 21),
(649, '12:00', 21),
(650, '12:30', 21),
(651, '13:30', 21),
(652, '16:00', 21),
(653, '16:30', 21),
(664, '09:00', 22),
(665, '10:00', 22),
(666, '11:00', 22),
(667, '12:00', 22),
(668, '12:30', 22),
(669, '13:30', 22),
(670, '14:30', 22),
(671, '15:00', 22),
(672, '16:00', 22),
(673, '16:30', 22),
(674, '08:00', 23),
(675, '09:00', 23),
(676, '09:30', 23),
(677, '10:00', 23),
(678, '10:30', 23),
(679, '11:00', 23),
(680, '11:30', 23),
(681, '12:00', 23),
(682, '12:30', 23),
(683, '13:00', 23),
(684, '13:30', 23),
(685, '14:00', 23),
(686, '14:30', 23),
(687, '15:00', 23),
(688, '08:30', 25),
(689, '09:30', 25),
(690, '11:00', 25),
(691, '12:00', 25),
(692, '12:30', 25),
(693, '13:30', 25),
(694, '14:30', 25),
(695, '15:00', 25),
(696, '16:00', 25),
(697, '17:00', 25),
(698, '17:30', 25),
(699, '15:30', 26),
(700, '16:30', 26),
(701, '17:30', 26),
(702, '18:00', 26),
(703, '19:00', 26),
(704, '20:00', 26),
(705, '20:30', 26),
(714, '08:30', 27),
(716, '10:30', 27),
(717, '12:00', 27),
(718, '12:30', 27),
(720, '14:00', 27),
(721, '14:30', 27),
(722, '16:30', 27),
(723, '17:00', 27),
(724, '17:30', 27),
(725, '19:00', 27),
(726, '19:30', 27),
(727, '08:30', 29),
(728, '09:00', 29),
(730, '10:00', 29),
(731, '16:30', 29),
(732, '17:00', 29),
(733, '19:30', 29),
(734, '09:00', 27),
(735, '20:00', 28),
(736, '20:30', 28),
(737, '08:30', 36),
(738, '09:00', 36),
(739, '09:30', 36),
(740, '13:30', 36),
(741, '14:00', 36),
(742, '14:30', 36),
(743, '16:00', 36),
(744, '16:30', 36),
(745, '17:00', 36),
(746, '08:30', 37),
(747, '09:30', 37),
(748, '10:00', 37),
(749, '08:00', 39),
(750, '08:30', 39),
(751, '09:00', 39),
(752, '09:30', 39),
(753, '14:00', 39),
(754, '14:30', 39),
(755, '20:00', 39),
(756, '08:00', 41),
(757, '08:30', 41),
(758, '10:00', 41),
(759, '08:00', 58),
(760, '09:30', 58),
(761, '10:00', 58),
(762, '10:30', 58),
(763, '11:30', 58),
(764, '12:00', 58),
(765, '12:30', 58);

-- --------------------------------------------------------

--
-- Table structure for table `lichdat`
--

CREATE TABLE `lichdat` (
  `id` int NOT NULL,
  `ma_lich` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `khachhang_id` int NOT NULL,
  `dichvu_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `khunggio_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','confirmed','done','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci,
  `cancel_reason` text COLLATE utf8mb4_unicode_ci,
  `rating` int DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `client_read` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lichdat`
--

INSERT INTO `lichdat` (`id`, `ma_lich`, `khachhang_id`, `dichvu_id`, `price`, `khunggio_id`, `created_at`, `status`, `note`, `cancel_reason`, `rating`, `review`, `client_read`) VALUES
(56, 'ML-F059B1', 1, 11, '194000.00', 648, '2025-11-29 09:47:59', 'cancelled', '', 'thợ đi ăn cưới', NULL, NULL, 1),
(57, 'ML-0BDE29', 1, 7, '59000.00', 650, '2025-11-29 09:56:16', 'cancelled', '', 'thợ ốm', NULL, NULL, 1),
(58, 'ML-7A8F4C', 1, 11, '194000.00', 644, '2025-11-29 09:59:19', 'done', '', NULL, NULL, NULL, 1),
(59, 'ML-0657B5', 1, 8, '199000.00', 653, '2025-11-29 10:16:48', 'cancelled', '', 'thợ dell thích cắt', NULL, NULL, 1),
(60, 'ML-A1874D', 1, 7, '59000.00', 649, '2025-11-29 10:20:42', 'cancelled', '', 'thích thì huỷ', NULL, NULL, 1),
(61, 'ML-F73DEA', 1, 8, '199000.00', 672, '2025-11-29 14:16:15', 'done', 'test', NULL, 4, 'ok', 1),
(62, 'ML-F73DEA', 1, 11, '194000.00', 672, '2025-11-29 14:16:15', 'pending', 'test', NULL, 4, 'ok', 1),
(63, 'ML-F00EA1', 1, 11, '194000.00', 675, '2025-11-30 12:48:15', 'done', '', NULL, NULL, NULL, 1),
(64, 'ML-419F5D', 1, 7, '59000.00', 676, '2025-11-30 12:54:28', 'cancelled', '', 'thích thì huyr', NULL, NULL, 1),
(65, 'ML-16BB97', 1, 11, '194000.00', 689, '2025-12-01 07:17:37', 'cancelled', '', 'huỷ', NULL, NULL, 1),
(66, 'ML-16BB97', 1, 8, '199000.00', 689, '2025-12-01 07:17:37', 'cancelled', '', 'dell thích cắt', NULL, NULL, 1),
(67, 'ML-B5B342', 1, 8, '199000.00', 694, '2025-12-01 08:41:15', 'cancelled', '', 'huỷ', NULL, NULL, 1),
(68, 'ML-692CC3', 1, 11, '194000.00', 678, '2025-12-01 10:20:22', 'cancelled', '', 'thích', NULL, NULL, 1),
(69, 'ML-8CE5C6', 1, 8, '199000.00', 690, '2025-12-01 16:47:20', 'done', '', NULL, NULL, NULL, 1),
(70, 'ML-588063', 1, 8, '199000.00', 724, '2025-12-03 15:58:45', 'done', '', NULL, NULL, NULL, 1),
(71, 'ML-588063', 1, 11, '194000.00', 724, '2025-12-03 15:58:45', 'pending', '', NULL, NULL, NULL, 1),
(72, 'ML-09D7D5', 1, 8, '199000.00', 725, '2025-12-03 16:48:32', 'done', 'nhuộm màu đỏ', NULL, NULL, NULL, 0),
(73, 'ML-7317B7', 1, 8, '299000.00', 726, '2025-12-03 17:01:27', 'cancelled', 'nhộm màu xanh', 'hẹ hẹ', NULL, NULL, 1),
(74, 'ML-411632', 1, 11, '194000.00', 727, '2025-12-03 17:23:16', 'cancelled', 'hẹ hẹ', 'hẹ hẹ', NULL, NULL, 1),
(75, 'ML-411632', 1, 8, '199000.00', 727, '2025-12-03 17:23:16', 'cancelled', 'hẹ hẹ', 'hẹ hẹ', NULL, NULL, 1),
(76, 'ML-411632', 1, 7, '59000.00', 727, '2025-12-03 17:23:16', 'cancelled', 'hẹ hẹ', 'hẹ hẹ', NULL, NULL, 1),
(77, 'ML-1E86AB', 1, 8, '190000.00', 744, '2025-12-06 22:25:21', 'done', '', NULL, NULL, NULL, 0),
(78, 'ML-1E86AB', 1, 11, '194000.00', 744, '2025-12-06 22:25:21', 'done', '', NULL, NULL, NULL, 0),
(79, 'ML-1E86AB', 1, 7, '59000.00', 744, '2025-12-06 22:25:21', 'done', '', NULL, NULL, NULL, 0),
(80, 'ML-3A2A58', 1, 11, '194000.00', 746, '2025-12-06 22:28:19', 'done', 'hẹ hẹ', NULL, NULL, NULL, 0),
(81, 'ML-9639F7', 1, 8, '190000.00', 757, '2025-12-10 21:32:57', 'cancelled', 'hẹ hẹ\r\n', 'Bận việc đột xuất', NULL, NULL, 1),
(82, 'ML-9639F7', 1, 11, '194000.00', 757, '2025-12-10 21:32:57', 'pending', 'hẹ hẹ\r\n', NULL, NULL, NULL, 0),
(83, 'ML-0E3D52', 1, 8, '190000.00', 758, '2025-12-10 21:33:52', 'cancelled', '', 'hẹ', NULL, NULL, 1),
(84, 'ML-987B1F', 1, 11, '194000.00', 756, '2025-12-10 21:34:33', 'done', '', NULL, NULL, NULL, 0),
(88, 'ML-BA92F2', 4, 8, '190000.00', 761, '2025-12-16 21:04:43', 'cancelled', '', 'thích', NULL, NULL, 1),
(89, 'ML-BA92F2', 4, 11, '194000.00', 761, '2025-12-16 21:04:43', 'cancelled', '', 'thích', NULL, NULL, 1),
(90, 'ML-33C17E', 4, 8, '190000.00', 760, '2025-12-16 21:07:15', 'cancelled', '', 'Tìm được chỗ khác', NULL, NULL, 1),
(91, 'ML-A1128A', 4, 11, '194000.00', 759, '2025-12-16 21:10:50', 'cancelled', '', 'Muốn đổi ngày/giờ khác', NULL, NULL, 1),
(92, 'ML-4BC655', 1, 8, '190000.00', 765, '2025-12-16 21:35:48', 'cancelled', '', 'ff', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ngay_lam_viec`
--

CREATE TABLE `ngay_lam_viec` (
  `id` int NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ngay_lam_viec`
--

INSERT INTO `ngay_lam_viec` (`id`, `date`) VALUES
(8, '2025-11-21'),
(9, '2025-11-22'),
(10, '2025-11-23'),
(11, '2025-11-24'),
(12, '2025-11-25'),
(13, '2025-11-26'),
(14, '2025-11-27'),
(15, '2025-11-28'),
(16, '2025-11-29'),
(17, '2025-11-30'),
(18, '2025-12-01'),
(19, '2025-12-02'),
(20, '2025-12-03'),
(21, '2025-12-04'),
(22, '2025-12-05'),
(23, '2025-12-06'),
(24, '2025-12-07'),
(25, '2025-12-08'),
(26, '2025-12-09'),
(27, '2025-12-10'),
(28, '2025-12-11'),
(29, '2025-12-12'),
(30, '2025-12-13'),
(31, '2025-12-14'),
(32, '2025-12-15'),
(33, '2025-12-16'),
(34, '2025-12-17'),
(35, '2025-12-18'),
(36, '2025-12-19'),
(37, '2025-12-20'),
(38, '2025-12-21'),
(39, '2025-12-22'),
(40, '2025-12-23'),
(41, '2025-12-24'),
(42, '2025-12-25'),
(43, '2025-12-26'),
(44, '2025-12-27'),
(45, '2025-12-28'),
(46, '2025-12-29'),
(47, '2025-12-30'),
(48, '2025-12-31'),
(49, '2026-01-01'),
(50, '2026-01-02'),
(51, '2026-01-03'),
(52, '2026-01-04'),
(53, '2026-01-05'),
(54, '2026-01-06'),
(55, '2026-01-07'),
(56, '2026-01-08'),
(57, '2026-01-09'),
(58, '2026-01-10'),
(59, '2026-01-11'),
(60, '2026-01-12'),
(61, '2026-01-13'),
(62, '2026-01-14'),
(63, '2026-01-15'),
(64, '2026-01-16'),
(65, '2026-01-17'),
(66, '2026-01-18'),
(67, '2026-01-19'),
(68, '2026-01-20'),
(69, '2026-01-21'),
(70, '2026-01-22'),
(71, '2026-01-23'),
(72, '2026-01-24'),
(73, '2026-01-25'),
(74, '2026-01-26'),
(75, '2026-01-27'),
(76, '2026-01-28'),
(77, '2026-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `id` int NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioitinh` enum('nam','nu','khac') COLLATE utf8mb4_unicode_ci DEFAULT 'nam',
  `password_plain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_reset_pass` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`id`, `phone`, `status`, `name`, `email`, `password`, `gioitinh`, `password_plain`, `last_reset_pass`) VALUES
(1, '08629331725', 1, 'Việt Hùng', 'hung123@gmail.com', '$2y$10$aKGycIEAJEitIYFY1ATN7.FMFkwr7JTR/.UHj7YDKQ3/1RK1jJeEC', 'nam', NULL, NULL),
(7, '0862931726', 1, 'Duy', 'duy123@gmail.com', '$2y$10$Visu5fbetIanCgT2iFklSe5jBlljiPepMcKS3JjAB1Np3boHgxVkm', 'nam', 'duy123456', NULL),
(8, '265894251', 1, 'minh', 'daom732380@gmail.com', '$2y$10$B8IL8o8Jn4u7c0nFKCwe8u1JRL.VnEYAoWPb.fngUp8M3cduYywm6', 'nam', 'minh123', NULL),
(15, '0265894251', 1, 'admin', 'daom73280@gmail.com', '$2y$10$zfEcuECfleh4UJKcn1V2iuJNtvk3sYzC6FPWj5qN4HH8/3QEtVmMO', 'nam', 'minh123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phan_cong`
--

CREATE TABLE `phan_cong` (
  `id` int NOT NULL,
  `ngay_lv_id` int NOT NULL,
  `tho_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phan_cong`
--

INSERT INTO `phan_cong` (`id`, `ngay_lv_id`, `tho_id`) VALUES
(1, 8, 2),
(2, 8, 3),
(5, 10, 2),
(6, 10, 3),
(7, 9, 2),
(8, 9, 3),
(9, 11, 2),
(10, 11, 3),
(11, 13, 2),
(12, 13, 3),
(15, 15, 2),
(16, 15, 3),
(17, 14, 2),
(18, 14, 3),
(19, 16, 2),
(20, 16, 3),
(21, 17, 2),
(22, 17, 3),
(23, 18, 2),
(24, 18, 3),
(25, 19, 2),
(26, 19, 3),
(27, 20, 2),
(28, 20, 3),
(30, 21, 2),
(31, 21, 3),
(32, 21, 4),
(33, 21, 5),
(34, 23, 3),
(35, 23, 4),
(36, 24, 2),
(37, 24, 3),
(38, 24, 5),
(39, 27, 2),
(40, 27, 4),
(41, 28, 2),
(42, 28, 5),
(43, 29, 2),
(44, 29, 5),
(45, 30, 2),
(46, 30, 3),
(47, 30, 5),
(48, 31, 2),
(49, 31, 3),
(50, 31, 4),
(51, 31, 5),
(54, 32, 3),
(55, 32, 4),
(56, 33, 2),
(57, 33, 4),
(58, 34, 3),
(59, 34, 4);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`) VALUES
(1, 'Nhân Viên', 'Chỉ xem và xử lý lịch đặt');

-- --------------------------------------------------------

--
-- Table structure for table `tho`
--

CREATE TABLE `tho` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `lylich` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tho`
--

INSERT INTO `tho` (`id`, `name`, `created_at`, `lylich`, `image`) VALUES
(2, 'Việt Hùng', '2025-11-20 16:55:00', '5 năm', '1764558431_tho3.png'),
(3, 'Dũng', '2025-11-21 14:30:40', '3 Năm', '1763710240_tho2.png'),
(4, 'Công Huy', '2025-12-01 10:07:31', '3 năm', '1764558451_tho4.png'),
(5, 'Nhật Minh', '2025-12-01 10:07:48', '4 năm', '1764558468_tho1.png');

-- --------------------------------------------------------

--
-- Table structure for table `thongke_tho_monthly`
--

CREATE TABLE `thongke_tho_monthly` (
  `id` int NOT NULL,
  `tho_id` int NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `total_bookings` int DEFAULT '0',
  `total_revenue` double DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `thongke_tho_monthly`
--

INSERT INTO `thongke_tho_monthly` (`id`, `tho_id`, `year`, `month`, `total_bookings`, `total_revenue`, `created_at`, `updated_at`) VALUES
(1, 2, 2025, 12, 7, 1234000, '2025-12-06 14:16:06', '2025-12-31 07:36:39'),
(58, 3, 2025, 12, 1, 194000, '2025-12-06 15:29:07', '2025-12-31 07:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `thongke_tho_weekly`
--

CREATE TABLE `thongke_tho_weekly` (
  `id` int NOT NULL,
  `tho_id` int NOT NULL,
  `year` int NOT NULL,
  `week` int NOT NULL,
  `total_bookings` int DEFAULT '0',
  `total_revenue` double DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `thongke_tho_weekly`
--

INSERT INTO `thongke_tho_weekly` (`id`, `tho_id`, `year`, `week`, `total_bookings`, `total_revenue`, `created_at`, `updated_at`) VALUES
(1, 2, 2025, 48, 2, 388000, '2025-12-06 14:16:06', '2025-12-31 07:36:39'),
(2, 3, 2025, 48, 1, 199000, '2025-12-06 14:16:06', '2025-12-31 07:36:39'),
(3, 2, 2025, 49, 6, 1040000, '2025-12-06 14:16:06', '2025-12-31 07:36:39'),
(60, 3, 2025, 49, 1, 194000, '2025-12-06 15:29:07', '2025-12-31 07:36:39'),
(165, 2, 2025, 50, 1, 194000, '2025-12-10 14:38:10', '2025-12-31 07:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `tin_nhan`
--

CREATE TABLE `tin_nhan` (
  `id` int NOT NULL,
  `khachhang_id` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` enum('client','bot') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tin_nhan`
--

INSERT INTO `tin_nhan` (`id`, `khachhang_id`, `message`, `sender`, `created_at`) VALUES
(1, 1, 'xin chào', 'client', '2025-11-29 16:17:12'),
(2, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-11-29 16:17:12'),
(3, 1, 'dịch vụ', 'client', '2025-11-29 17:57:05'),
(4, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2025-11-29 17:57:05'),
(5, 1, 'thợ cắt đẹp', 'client', '2025-11-29 17:57:23'),
(6, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2025-11-29 17:57:23'),
(7, 1, 'hi', 'client', '2025-11-29 17:57:31'),
(8, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-11-29 17:57:31'),
(9, 1, 'giá', 'client', '2025-11-29 17:57:51'),
(10, 1, 'Dạ, cắt tóc combo 7 bước là 100k. Nhuộm từ 200k ạ. Anh muốn xem chi tiết không?', 'bot', '2025-11-29 17:57:51'),
(11, 1, 'bao tiền', 'client', '2025-11-29 17:58:02'),
(12, 1, 'Dạ, cắt tóc combo 7 bước là 100k. Nhuộm từ 200k ạ. Anh muốn xem chi tiết không?', 'bot', '2025-11-29 17:58:02'),
(13, 1, 'xin chào', 'client', '2025-11-29 18:02:32'),
(14, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-11-29 18:02:32'),
(15, 1, 'thợ cắt đẹp', 'client', '2025-11-29 18:02:59'),
(16, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2025-11-29 18:02:59'),
(17, 1, 'đặt lịch', 'client', '2025-11-29 18:03:04'),
(18, 1, 'Anh có thể bấm vào nút \"Đặt Lịch\" trên menu để chọn giờ đẹp nhất nhé!', 'bot', '2025-11-29 18:03:04'),
(19, 1, 'địa chỉ ở đâu', 'client', '2025-11-29 18:03:21'),
(20, 1, 'Salon bên em ở Số 4 Lê Quang Đạo, Từ Sơn, Bắc Ninh ạ.', 'bot', '2025-11-29 18:03:21'),
(21, 1, 'chào em!', 'client', '2025-11-29 18:08:52'),
(22, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2025-11-29 18:08:52'),
(23, 1, 'xin chào', 'client', '2025-11-29 18:09:00'),
(24, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-11-29 18:09:00'),
(25, 1, 'giờ làm', 'client', '2025-11-29 18:12:04'),
(26, 1, 'Bên em mở cửa từ 8h00 sáng đến 21h00 tối tất cả các ngày trong tuần ạ.', 'bot', '2025-11-29 18:12:04'),
(27, 1, 'Thợ cắt đẹp nhất 31Shine là những ai', 'client', '2025-11-29 18:14:58'),
(28, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-11-29 18:14:58'),
(29, 1, 'Thợ cắt đẹp nhất 31Shine là những ai', 'client', '2025-11-29 18:15:04'),
(30, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-11-29 18:15:04'),
(31, 1, 'thợ cắt', 'client', '2025-11-29 18:15:34'),
(32, 1, 'Dạ bên em có những thợ cắt đệp và ưng ý đối với mọi khách hàng đã từng trải nghiệm là: Nhật Minh, Mạnh Dũng, Công Huy và Việt Hùng.', 'bot', '2025-11-29 18:15:34'),
(33, 1, 'em có yêu anh không', 'client', '2025-11-29 18:16:54'),
(34, 1, 'em yêu anh nhiều lắm :))', 'bot', '2025-11-29 18:16:54'),
(35, 1, 'hot', 'client', '2025-11-29 22:09:36'),
(36, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2025-11-29 22:09:36'),
(37, 1, 'dịch vụ hot', 'client', '2025-11-29 22:09:42'),
(38, 1, 'Dạ bên em có những dịch vụ HOT như là: Cắt tóc', 'bot', '2025-11-29 22:09:42'),
(39, 1, 'hoty', 'client', '2025-11-29 22:20:43'),
(40, 1, 'Dạ bên em có những dịch vụ HOT như là: Cắt tóc', 'bot', '2025-11-29 22:20:43'),
(41, 1, 'hi', 'client', '2025-11-29 23:10:46'),
(42, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-11-29 23:10:46'),
(43, 1, 'hi', 'client', '2025-12-01 07:10:36'),
(44, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-12-01 07:10:36'),
(45, 1, 'dịch vụ', 'client', '2025-12-01 07:10:40'),
(46, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2025-12-01 07:10:40'),
(47, 1, 'đặt lịch', 'client', '2025-12-01 07:10:49'),
(48, 1, 'Anh có thể bấm vào nút \"Đặt Lịch\" trên menu để chọn giờ đẹp nhất nhé!', 'bot', '2025-12-01 07:10:49'),
(49, 1, 'xin chào', 'client', '2025-12-01 09:58:19'),
(50, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-12-01 09:58:19'),
(51, 1, 'hẹ hẹ', 'client', '2025-12-01 10:20:55'),
(52, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2025-12-01 10:20:55'),
(53, 1, 'thợ cắt', 'client', '2025-12-01 10:21:01'),
(54, 1, 'Dạ bên em có những thợ cắt đệp và ưng ý đối với mọi khách hàng đã từng trải nghiệm là: Nhật Minh, Mạnh Dũng, Công Huy và Việt Hùng.', 'bot', '2025-12-01 10:21:01'),
(55, 1, 'hi', 'client', '2025-12-10 21:31:00'),
(56, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-12-10 21:31:00'),
(57, 4, 'xin chào', 'client', '2025-12-16 20:49:41'),
(58, 4, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2025-12-16 20:49:41'),
(59, 1, 'xin chào', 'client', '2026-01-18 16:31:00'),
(60, 1, 'Chào anh! Em là trợ lý ảo của 31Shine,rất vui được gặp anh. Anh cần giúp gì về đặt lịch hay bảng giá ạ?', 'bot', '2026-01-18 16:31:00'),
(61, 1, 'hẹ hẹ\'', 'client', '2026-01-18 16:31:09'),
(62, 1, 'Em chưa hiểu ý của anh lắm. Anh có thể hỏi về \'giá\', \'đặt lịch\' hoặc liên hệ với nhân viên bên em ạ!', 'bot', '2026-01-18 16:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(7, 1),
(15, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bot_answers`
--
ALTER TABLE `bot_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_booking_review` (`ma_lich`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `dichvu_id` (`dichvu_id`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dichvu`
--
ALTER TABLE `dichvu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `danhmuc_id` (`danhmuc_id`);

--
-- Indexes for table `dichvu_tho`
--
ALTER TABLE `dichvu_tho`
  ADD PRIMARY KEY (`dichvu_id`,`tho_id`),
  ADD KEY `tho_id` (`tho_id`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `khunggio`
--
ALTER TABLE `khunggio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ngay_id` (`phan_cong_id`);

--
-- Indexes for table `lichdat`
--
ALTER TABLE `lichdat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `khachhang_id` (`khachhang_id`),
  ADD KEY `dichvu_id` (`dichvu_id`),
  ADD KEY `khunggio_id` (`khunggio_id`),
  ADD KEY `ma_lich` (`ma_lich`);

--
-- Indexes for table `ngay_lam_viec`
--
ALTER TABLE `ngay_lam_viec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `phan_cong`
--
ALTER TABLE `phan_cong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ngay_lv_id` (`ngay_lv_id`),
  ADD KEY `tho_id` (`tho_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tho`
--
ALTER TABLE `tho`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thongke_tho_monthly`
--
ALTER TABLE `thongke_tho_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_monthly_stat` (`tho_id`,`year`,`month`),
  ADD KEY `fk_monthly_tho` (`tho_id`);

--
-- Indexes for table `thongke_tho_weekly`
--
ALTER TABLE `thongke_tho_weekly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_weekly_stat` (`tho_id`,`year`,`week`),
  ADD KEY `fk_weekly_tho` (`tho_id`);

--
-- Indexes for table `tin_nhan`
--
ALTER TABLE `tin_nhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bot_answers`
--
ALTER TABLE `bot_answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dichvu`
--
ALTER TABLE `dichvu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `khunggio`
--
ALTER TABLE `khunggio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=766;

--
-- AUTO_INCREMENT for table `lichdat`
--
ALTER TABLE `lichdat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `ngay_lam_viec`
--
ALTER TABLE `ngay_lam_viec`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `phan_cong`
--
ALTER TABLE `phan_cong`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tho`
--
ALTER TABLE `tho`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thongke_tho_monthly`
--
ALTER TABLE `thongke_tho_monthly`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `thongke_tho_weekly`
--
ALTER TABLE `thongke_tho_weekly`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `tin_nhan`
--
ALTER TABLE `tin_nhan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `khachhang` (`id`),
  ADD CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`dichvu_id`) REFERENCES `dichvu` (`id`);

--
-- Constraints for table `dichvu`
--
ALTER TABLE `dichvu`
  ADD CONSTRAINT `dichvu_ibfk_1` FOREIGN KEY (`danhmuc_id`) REFERENCES `danhmuc` (`id`);

--
-- Constraints for table `dichvu_tho`
--
ALTER TABLE `dichvu_tho`
  ADD CONSTRAINT `dichvu_tho_ibfk_1` FOREIGN KEY (`dichvu_id`) REFERENCES `dichvu` (`id`),
  ADD CONSTRAINT `dichvu_tho_ibfk_2` FOREIGN KEY (`tho_id`) REFERENCES `tho` (`id`);

--
-- Constraints for table `lichdat`
--
ALTER TABLE `lichdat`
  ADD CONSTRAINT `lichdat_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`id`),
  ADD CONSTRAINT `lichdat_ibfk_2` FOREIGN KEY (`dichvu_id`) REFERENCES `dichvu` (`id`),
  ADD CONSTRAINT `lichdat_ibfk_3` FOREIGN KEY (`khunggio_id`) REFERENCES `khunggio` (`id`);

--
-- Constraints for table `phan_cong`
--
ALTER TABLE `phan_cong`
  ADD CONSTRAINT `phan_cong_ibfk_1` FOREIGN KEY (`ngay_lv_id`) REFERENCES `ngay_lam_viec` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phan_cong_ibfk_2` FOREIGN KEY (`tho_id`) REFERENCES `tho` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `thongke_tho_monthly`
--
ALTER TABLE `thongke_tho_monthly`
  ADD CONSTRAINT `fk_monthly_tho` FOREIGN KEY (`tho_id`) REFERENCES `tho` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `thongke_tho_weekly`
--
ALTER TABLE `thongke_tho_weekly`
  ADD CONSTRAINT `fk_weekly_tho` FOREIGN KEY (`tho_id`) REFERENCES `tho` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `nhanvien` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
