-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2020 at 08:56 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newspaper`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignedbtv`
--

CREATE TABLE `assignedbtv` (
  `IDUser` int(11) NOT NULL,
  `CatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignedbtv`
--

INSERT INTO `assignedbtv` (`IDUser`, `CatID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ParentCatID` int(11) DEFAULT NULL,
  `CatID` int(50) NOT NULL,
  `CatName` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ParentCatID`, `CatID`, `CatName`) VALUES
(NULL, 1, 'Kinh Doanh'),
(1, 2, 'Nông sản'),
(1, 3, 'Hải Sản'),
(1, 4, 'Khoáng Sản'),
(2, 5, 'Gạo'),
(3, 6, 'Cá'),
(4, 7, 'Than'),
(4, 8, 'Dầu'),
(1, 9, 'Thủy Sản'),
(1, 10, 'Chăn Nuôi');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `IDPage` int(20) NOT NULL,
  `IDUser` int(20) NOT NULL,
  `Comment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`IDPage`, `IDUser`, `Comment`, `Time`) VALUES
(1, 2, '', '2020-06-10 10:22:18');

-- --------------------------------------------------------

--
-- Table structure for table `newspapers`
--

CREATE TABLE `newspapers` (
  `IDPage` int(11) NOT NULL,
  `Title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TinyContent` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CatID` int(11) NOT NULL,
  `Status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `View` int(11) NOT NULL,
  `Day` datetime NOT NULL,
  `Premium` tinyint(1) NOT NULL,
  `ImgAvatar` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '32-450x260.jpg',
  `Tags` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newspapers`
--

INSERT INTO `newspapers` (`IDPage`, `Title`, `TinyContent`, `Content`, `CatID`, `Status`, `View`, `Day`, `Premium`, `ImgAvatar`, `Tags`) VALUES
(1, 'Tiếp tục miễn giảm thuế sử dụng đất nông nghiệp đến 2025', '<h1>Chiều 10/6, các đại biểu Quốc hội biểu quyết thông qua Nghị quyết kéo dài thời hạn miễn thuế sử ', '<h3>Sau khi biểu quyết, Nghị quyết kéo dài thời hạn miễn thuế sử dụng đất nông nghiệp được thông qua', 2, 'Đã được duyệt', 0, '2020-01-06 15:09:01', 0, '32-450x260.jpg', NULL),
(2, '<h1> Doanh nghiệp Hải sản Việt Nam kiên định với Cam kết chống khai thác IUU</h1>', '<h1>Sau 2 năm EU cảnh báo thẻ vàng đối với hải sản khai thác của Việt Nam, xuất khẩu hải sản của Việ', '<h1>Nhận thức rõ ảnh hưởng của thẻ vàng IUU đối với XK hải sản Việt Nam sang thị trường EU và uy tín', 3, 'Bị từ chối', 0, '2020-05-06 17:09:01', 0, '32-450x260.jpg', NULL),
(3, '<h1>Gói thầu 300.000 tấn gạo G2G của Philippines: Mới chỉ đạt 189.000 tấn.</h1>', '<h3>Philippines đã chính thức mở gói thầu 300.000 tấn gạo loại 25% tấm theo phương thức hợp đồng Chí', '<h4>Sáng ngày 8/6, tại Manila, Công ty Philippine International Trading Corporation (PITC) đại diện ', 5, 'Chưa được duyệt', 0, '2020-05-14 17:10:57', 0, '32-450x260.jpg', NULL),
(4, '<h1>Doanh nghiệp than khó tiếp cận vốn</h1>\r\n', '<h2>Dịch Covid-19 ở nước ta đã tạm lắng, các doanh nghiệp (DN) đã bắt tay vào khôi phục sản xuất, ki', '<h3>Nguồn vốn hiện tại vẫn luôn là điều mà nhiều DN vừa và nhỏ quan tâm sau mùa dịch Covid-19. Trong', 6, 'Đã được duyệt & chờ xuất bản', 0, '0000-00-00 00:00:00', 0, '32-450x260.jpg', NULL),
(5, 'Top Trending Test 100 view', '', '', 2, '', 100, '2020-06-19 11:00:33', 0, '32-450x260.jpg', NULL),
(6, 'Top Trending Test 90 View', '', '', 2, '', 90, '2020-06-19 11:00:33', 0, '32-450x260.jpg', NULL),
(7, 'Top Trending Test 100 view', '', '', 2, '', 100, '2020-06-19 11:00:33', 0, '32-450x260.jpg', NULL),
(8, 'Top Trending Test 90 View', '', '', 2, '', 90, '2020-06-19 11:00:33', 0, '32-450x260.jpg', NULL),
(9, 'Top Trending 120 view', '', '', 2, '', 120, '2020-06-20 11:08:56', 0, '32-450x260.jpg', NULL),
(10, 'Top Trending Test 120 view', '', '', 2, '', 120, '2020-06-18 11:08:56', 0, '32-450x260.jpg', NULL),
(11, 'Top Trending 120 view', '', '', 2, '', 120, '2020-06-20 11:08:56', 0, '32-450x260.jpg', NULL),
(12, 'Top Trending Test 120 view', '', '', 2, '', 120, '2020-06-18 11:08:56', 0, '32-450x260.jpg', NULL),
(13, 'day la tieu de', 'tom tat', '', 1, 'Chưa được duyệt', 0, '0000-00-00 00:00:00', 0, 'link', NULL),
(14, 'tttttttttttttt', 'vvvvv', '<p><strong>vvvvvvvvvvv</strong></p>', 1, 'Chưa được duyệt', 0, '2020-06-28 21:01:25', 0, 'llllllllllllll', NULL),
(15, 'final', 'tomtat', '<p><strong>ssdsdv</strong></p>\r\n<p><span style=\"text-decoration: underline;\"><strong>&aacute;dasdasd', 6, 'Chưa được duyệt', 0, '2020-06-28 21:04:48', 0, 'llink', NULL),
(16, 'tieu de', 'tomtat', '<p>Content n&egrave;</p>', 3, 'Chưa được duyệt', 0, '2020-06-28 21:19:25', 0, 'avatar', NULL),
(17, 'day la tieu de', 'ấdasdasd', '<p>hahaaaa</p>', 6, 'Chưa được duyệt', 0, '2020-06-28 21:22:26', 0, 'avatar nè', NULL),
(18, '', '', '', 1, 'Chưa được duyệt', 0, '2020-06-28 21:25:45', 0, '', NULL),
(19, '', '', '', 1, 'Chưa được duyệt', 0, '2020-06-28 21:27:30', 0, '', NULL),
(20, 'sdfvsdfv', 'sdvsdv', '<p>sdvsdvsdv</p>', 1, 'Chưa được duyệt', 0, '2020-06-28 21:53:23', 0, 'vsdvsdvsdv', NULL),
(21, 'cuoicung', 'cung xong', '<p><em>&aacute;dcfsdvsdv</em></p>', 1, 'Chưa được duyệt', 0, '2020-06-28 21:58:51', 0, 'linkkkkkkkkkk', NULL),
(26, 'Nắng nóng khốc liệt: Hơn 1.000 ha cây ăn quả đặc sản lay lắt chờ chết', 'Mặc dù đã dùng mọi biện pháp để cấp nước cho cây trồng, tuy nhiên nắng hạn quá khốc liệt đã khiến hơ', '', 2, 'Chưa được duyệt', 0, '2020-06-29 00:56:13', 0, '', NULL),
(31, ' 0 Xuất khẩu thủy sản đến 15/6 đạt 3,22 tỷ USD', '(Thủy sản Việt Nam) - Theo Tổng cục Hải quan, từ 1 - 15/6, kim ngạch xuất khẩu thủy sản đạt 333,5 tr', '<p>Xuất khẩu thủy sản trong th&aacute;ng 6 c&oacute; nhiều cải thiện so với th&aacute;ng 5. Trong th', 3, 'Chưa được duyệt', 0, '2020-06-29 01:21:46', 1, 'http://thuysanvietnam.com.vn/uploads/article/medium/2020/03/03/thuy-san-vuon-minh-vuot-covid-19_661514.jpg', NULL),
(32, 'Petrolimex điều chỉnh giá xăng dầu từ 15 giờ 00 ngày 27.6.2020', 'Petrolimex/PLX chính thức điều chỉnh giá xăng dầu từ 15 giờ 00 ngày 27.6.2020. Giá công bố tại TCBC ', '<p>H&agrave; Nội, ng&agrave;y 27.6.2020, Tập đo&agrave;n Xăng dầu Việt Nam (<a href=\"https://www.pet', 8, 'Chưa được duyệt', 0, '2020-06-29 01:26:18', 0, 'https://fs.petrolimex.com.vn/Thumbnails/6783DC1271FF449E95B74A9520964169/0/120/0/B844BEEE70B546168C294C1D8B4F542A/0/365016/Petrolimex-dieu-chinh-gia-xang-dau-tu-15-gio-00-ng.jpg', NULL),
(33, 'Ứng dụng công nghệ số để bứt phá trong nuôi tôm nước lợ', 'Tìm các giải pháp để phát triển nuôi tôm hiệu quả, bền vững thời kỳ hậu Covid-19 được người nuôi tôm', '<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" title=\"thu-hoach-tom-o-bac-lieu-2-1448_202006', 9, 'Chưa được duyệt', 0, '2020-06-29 01:31:38', 1, 'https://thumb.ex-cdn.com/EXP/media.nongnghiep.vn/resize/300x180/files/bao_in/2020/06/11/14_49_195_thu-hoach-tom-o-bac-lieu-2-161823.jpeg', NULL),
(34, 'Trồng bưởi da xanh không dùng phân, thuốc hóa học, cho quả quanh năm', 'Rời TP Hồ Chí Minh khi đang có công việc ổn định, anh Nguyễn Văn Đảm đã lên Tây Nguyên tìm đất phù h', '<p><strong>T&igrave;m đất sạch sản xuất bưởi hữu cơ</strong></p>\r\n<p>Anh Nguyễn Văn Đảm, sinh năm 19', 2, 'Chưa được duyệt', 0, '2020-06-29 01:35:37', 0, 'https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-2-1502_20200625_394-091832.jpeg', NULL),
(35, 'Đồng Tháp: Người nuôi cá tra thua lỗ nặng', '(Thủy sản Việt Nam) - Dịch COVID-19 lan rộng toàn cầu khiến xuất khẩu cá tra gặp khó khăn. Đa số các', '<p class=\"body-text\">Tại Đồng Th&aacute;p, hiện tại gi&aacute; c&aacute; tra nguy&ecirc;n liệu từ 18', 9, 'Chưa được duyệt', 0, '2020-06-29 01:38:40', 1, 'http://thuysanvietnam.com.vn/uploads/article/medium/2019/02/18/nam-2019-nganh-hang-ca-tra-phan-dau-2-4-ty-usd_891476.jpg', NULL),
(36, 'Chủ tịch T&T 159 chỉ ra bí quyết sản xuất 1kg bò hơi với 35.000 đồng', 'Nhờ ứng dụng mô hình kinh tế tuần hoàn trong chăn nuôi, chi phí tạo ra 1kg thịt bò có thể giảm 40 - ', '<p>Đ&oacute; l&agrave; chia sẻ của &ocirc;ng H&agrave; Văn Thắng, Chủ tịch HĐQT C&ocirc;ng ty Cổ phầ', 10, 'Chưa được duyệt', 0, '2020-06-29 01:41:35', 1, 'https://thumb.ex-cdn.com/EXP/media.nongnghiep.vn/resize/480x288/files/nghienmx/2020/06/28/4530-anh-chup-man-hinh-2020-05-13-luc-170109-175539_65.jpeg', NULL),
(37, 'Bắt giữ 7 sà lan của 2 công ty khai thác trái phép đất sét trên sông Hậu', '(NLĐO) - 7 sà lan của 2 công ty khai thác được khoảng 300 m3 đất sét thì bị lực lượng Công an TP Cần', '<p>Tại hiện trường, cơ quan c&ocirc;ng an ph&aacute;t hiện 7 s&agrave; lan n&agrave;y l&agrave; của ', 4, 'Chưa được duyệt', 0, '2020-06-29 01:45:50', 0, 'https://nld.mediacdn.vn/thumb_w/684/2020/3/29/dat-set-15854610872051862084438.jpg', NULL),
(38, 'Khai thác khoáng sản, đồi núi tan hoang', 'Đã hết hạn khai thác, dừng hoạt động từ nhiều năm nay nhưng hàng loạt mỏ khoáng sản trên địa bàn tỉn', '<p>Huyện Quỳ Hợp, tỉnh Nghệ An v&agrave;o những giai đoạn cao điểm c&oacute; tới h&agrave;ng trăm đi', 4, 'Chưa được duyệt', 0, '2020-06-29 01:49:10', 0, 'https://nld.mediacdn.vn/2017/7-chot-7-1504708493515.jpg', NULL),
(39, 'Doanh nghiệp khai thác đá kêu cứu', 'Khai khoáng sai chiến lược, phí tài nguyên\r\n“Chảy máu” tài nguyên: Khai thác lậu, trốn đóng thuế', '<p>Một số doanh nghiệp (DN) đang hoạt động phải đối diện nguy cơ ph&aacute; sản khi c&aacute;c loại ', 4, 'Chưa được duyệt', 0, '2020-06-29 01:51:35', 1, 'https://nld.mediacdn.vn/2017/11-chot-11-1499178805640.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `PermissionID` int(20) NOT NULL,
  `Permission` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`PermissionID`, `Permission`) VALUES
(1, 'Admin'),
(2, 'Editer'),
(3, 'Writer'),
(4, 'Subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `IDNewspaper` int(11) NOT NULL,
  `TagName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`IDNewspaper`, `TagName`) VALUES
(1, 'Nông Sản'),
(2, 'Hải sản'),
(3, 'Gạo'),
(4, 'Tôm'),
(5, 'Dưa hấu'),
(6, 'Cua'),
(7, 'Đất'),
(16, '0'),
(17, '0'),
(17, '1'),
(17, '2'),
(17, '3'),
(17, '5'),
(17, '6'),
(17, '10'),
(17, '12'),
(17, '13'),
(17, '9'),
(17, '8'),
(17, '7'),
(17, '4'),
(17, '18'),
(17, '21'),
(17, '11'),
(17, '17'),
(17, '16'),
(17, '19'),
(17, '20'),
(17, '15'),
(17, '14'),
(21, 'dm'),
(21, 'dcm'),
(21, 'dcmn'),
(22, 'a'),
(22, 'a'),
(23, ''),
(27, 'NongSan'),
(28, 'NongSan'),
(28, 'CayTrong'),
(29, ''),
(30, ''),
(31, 'XuatKhau'),
(32, 'XangDau'),
(33, 'Tom'),
(34, 'Buoi'),
(35, 'CaTra'),
(36, 'Bo'),
(37, 'KhoangSanCat'),
(38, 'KhaiThac'),
(39, 'KhaiThacDa');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `IDUser` int(20) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `Password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PermisstionID` int(20) NOT NULL,
  `Author` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Duration` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`IDUser`, `Name`, `Email`, `DOB`, `Password`, `PermisstionID`, `Author`, `Duration`) VALUES
(1, 'huuduc', 'duc@gmail.com', '1999-11-27', '123456', 1, '', '2020-06-26 01:53:00'),
(2, 'thanhduong', 'duong@gmail.com', '2020-06-18', '', 3, '', '2020-06-26 01:53:00'),
(3, 'thecong', 'cong@gmail.com', '2020-06-13', '', 2, '', '2020-06-26 01:53:00'),
(4, 'quangtrung', 'trung@gmail.com', '2020-06-10', '', 4, '', '2020-06-26 01:53:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD KEY `fk_comment_news` (`IDPage`);

--
-- Indexes for table `newspapers`
--
ALTER TABLE `newspapers`
  ADD PRIMARY KEY (`IDPage`),
  ADD KEY `fk_News_Tags` (`Tags`) USING BTREE;

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`PermissionID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDUser`),
  ADD KEY `fk_user_permission` (`PermisstionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `newspapers`
--
ALTER TABLE `newspapers`
  MODIFY `IDPage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `PermissionID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `IDUser` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_news` FOREIGN KEY (`IDPage`) REFERENCES `newspapers` (`IDPage`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_permission` FOREIGN KEY (`PermisstionID`) REFERENCES `permission` (`PermissionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
