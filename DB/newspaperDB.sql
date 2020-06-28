-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 28, 2020 lúc 05:36 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `newspaper`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assignedbtv`
--

CREATE TABLE `assignedbtv` (
  `IDUser` int(11) NOT NULL,
  `CatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `assignedbtv`
--

INSERT INTO `assignedbtv` (`IDUser`, `CatID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `ParentCatID` int(11) DEFAULT NULL,
  `CatID` int(50) NOT NULL,
  `CatName` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`ParentCatID`, `CatID`, `CatName`) VALUES
(NULL, 1, 'Kinh Doanh'),
(1, 2, 'Nông sản'),
(1, 3, 'Hải Sản'),
(1, 4, 'Khoáng Sản'),
(2, 5, 'Gạo'),
(3, 6, 'Cá'),
(4, 7, 'Than'),
(4, 8, 'Dầu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `IDPage` int(20) NOT NULL,
  `IDUser` int(20) NOT NULL,
  `Comment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`IDPage`, `IDUser`, `Comment`, `Time`) VALUES
(1, 2, '', '2020-06-10 10:22:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `newspapers`
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
  `ImgAvatar` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '32-450x260.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `newspapers`
--

INSERT INTO `newspapers` (`IDPage`, `Title`, `TinyContent`, `Content`, `CatID`, `Status`, `View`, `Day`, `Premium`, `ImgAvatar`) VALUES
(1, 'Tiếp tục miễn giảm thuế sử dụng đất nông nghiệp đến 2025', '<h1>Chiều 10/6, các đại biểu Quốc hội biểu quyết thông qua Nghị quyết kéo dài thời hạn miễn thuế sử ', '<h3>Sau khi biểu quyết, Nghị quyết kéo dài thời hạn miễn thuế sử dụng đất nông nghiệp được thông qua', 2, 'Đã được duyệt', 0, '2020-01-06 15:09:01', 0, '32-450x260.jpg'),
(2, '<h1> Doanh nghiệp Hải sản Việt Nam kiên định với Cam kết chống khai thác IUU</h1>', '<h1>Sau 2 năm EU cảnh báo thẻ vàng đối với hải sản khai thác của Việt Nam, xuất khẩu hải sản của Việ', '<h1>Nhận thức rõ ảnh hưởng của thẻ vàng IUU đối với XK hải sản Việt Nam sang thị trường EU và uy tín', 3, 'Bị từ chối', 0, '2020-05-06 17:09:01', 0, '32-450x260.jpg'),
(3, '<h1>Gói thầu 300.000 tấn gạo G2G của Philippines: Mới chỉ đạt 189.000 tấn.</h1>', '<h3>Philippines đã chính thức mở gói thầu 300.000 tấn gạo loại 25% tấm theo phương thức hợp đồng Chí', '<h4>Sáng ngày 8/6, tại Manila, Công ty Philippine International Trading Corporation (PITC) đại diện ', 5, 'Chưa được duyệt', 0, '2020-05-14 17:10:57', 0, '32-450x260.jpg'),
(4, '<h1>Doanh nghiệp than khó tiếp cận vốn</h1>\r\n', '<h2>Dịch Covid-19 ở nước ta đã tạm lắng, các doanh nghiệp (DN) đã bắt tay vào khôi phục sản xuất, ki', '<h3>Nguồn vốn hiện tại vẫn luôn là điều mà nhiều DN vừa và nhỏ quan tâm sau mùa dịch Covid-19. Trong', 6, 'Đã được duyệt & chờ xuất bản', 0, '0000-00-00 00:00:00', 0, '32-450x260.jpg'),
(5, 'Top Trending Test 100 view', '', '', 2, '', 100, '2020-06-19 11:00:33', 0, '32-450x260.jpg'),
(6, 'Top Trending Test 90 View', '', '', 2, '', 90, '2020-06-19 11:00:33', 0, '32-450x260.jpg'),
(7, 'Top Trending Test 100 view', '', '', 2, '', 100, '2020-06-19 11:00:33', 0, '32-450x260.jpg'),
(8, 'Top Trending Test 90 View', '', '', 2, '', 90, '2020-06-19 11:00:33', 0, '32-450x260.jpg'),
(9, 'Top Trending 120 view', '', '', 2, '', 120, '2020-06-20 11:08:56', 0, '32-450x260.jpg'),
(10, 'Top Trending Test 120 view', '', '', 2, '', 120, '2020-06-18 11:08:56', 0, '32-450x260.jpg'),
(11, 'Top Trending 120 view', '', '', 2, '', 120, '2020-06-20 11:08:56', 0, '32-450x260.jpg'),
(12, 'Top Trending Test 120 view', '', '', 2, '', 120, '2020-06-18 11:08:56', 0, '32-450x260.jpg'),
(13, 'day la tieu de', 'tom tat', '', 1, 'Chưa được duyệt', 0, '0000-00-00 00:00:00', 0, 'link'),
(14, 'tttttttttttttt', 'vvvvv', '<p><strong>vvvvvvvvvvv</strong></p>', 1, 'Chưa được duyệt', 0, '2020-06-28 21:01:25', 0, 'llllllllllllll'),
(15, 'final', 'tomtat', '<p><strong>ssdsdv</strong></p>\r\n<p><span style=\"text-decoration: underline;\"><strong>&aacute;dasdasd', 6, 'Chưa được duyệt', 0, '2020-06-28 21:04:48', 0, 'llink'),
(16, 'tieu de', 'tomtat', '<p>Content n&egrave;</p>', 3, 'Chưa được duyệt', 0, '2020-06-28 21:19:25', 0, 'avatar'),
(17, 'day la tieu de', 'ấdasdasd', '<p>hahaaaa</p>', 6, 'Chưa được duyệt', 0, '2020-06-28 21:22:26', 0, 'avatar nè'),
(18, '', '', '', 1, 'Chưa được duyệt', 0, '2020-06-28 21:25:45', 0, ''),
(19, '', '', '', 1, 'Chưa được duyệt', 0, '2020-06-28 21:27:30', 0, ''),
(20, 'sdfvsdfv', 'sdvsdv', '<p>sdvsdvsdv</p>', 1, 'Chưa được duyệt', 0, '2020-06-28 21:53:23', 0, 'vsdvsdvsdv'),
(21, 'cuoicung', 'cung xong', '<p><em>&aacute;dcfsdvsdv</em></p>', 1, 'Chưa được duyệt', 0, '2020-06-28 21:58:51', 0, 'linkkkkkkkkkk'),
(22, '', '', '', 1, 'Chưa được duyệt', 0, '2020-06-28 22:12:21', 0, ''),
(23, '', '', '', 1, 'Chưa được duyệt', 0, '2020-06-28 22:20:14', 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission`
--

CREATE TABLE `permission` (
  `PermissionID` int(20) NOT NULL,
  `Permission` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`PermissionID`, `Permission`) VALUES
(1, 'Admin'),
(2, 'Editer'),
(3, 'Writer'),
(4, 'Subscriber');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `IDNewspaper` int(11) NOT NULL,
  `TagName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
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
(23, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`IDUser`, `Name`, `Email`, `DOB`, `Password`, `PermisstionID`, `Author`, `Duration`) VALUES
(1, 'huuduc', 'duc@gmail.com', '1999-11-27', '123456', 1, '', '2020-06-26 01:53:00'),
(2, 'thanhduong', 'duong@gmail.com', '2020-06-18', '', 3, '', '2020-06-26 01:53:00'),
(3, 'thecong', 'cong@gmail.com', '2020-06-13', '', 2, '', '2020-06-26 01:53:00'),
(4, 'quangtrung', 'trung@gmail.com', '2020-06-10', '', 4, '', '2020-06-26 01:53:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD KEY `fk_comment_news` (`IDPage`);

--
-- Chỉ mục cho bảng `newspapers`
--
ALTER TABLE `newspapers`
  ADD PRIMARY KEY (`IDPage`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`PermissionID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDUser`),
  ADD KEY `fk_user_permission` (`PermisstionID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `newspapers`
--
ALTER TABLE `newspapers`
  MODIFY `IDPage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `permission`
--
ALTER TABLE `permission`
  MODIFY `PermissionID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `IDUser` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_news` FOREIGN KEY (`IDPage`) REFERENCES `newspapers` (`IDPage`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_permission` FOREIGN KEY (`PermisstionID`) REFERENCES `permission` (`PermissionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
