-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 10, 2020 lúc 12:24 PM
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
  `Like` int(100) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`IDPage`, `IDUser`, `Comment`, `Like`, `Time`) VALUES
(1, 2, '', 0, '2020-06-10 10:22:18');

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
  `LikeCount` int(11) NOT NULL,
  `Status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CommentCount` int(11) NOT NULL,
  `View` int(11) NOT NULL,
  `Day` datetime NOT NULL,
  `Premium` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `newspapers`
--

INSERT INTO `newspapers` (`IDPage`, `Title`, `TinyContent`, `Content`, `CatID`, `LikeCount`, `Status`, `CommentCount`, `View`, `Day`, `Premium`) VALUES
(1, 'Tiếp tục miễn giảm thuế sử dụng đất nông nghiệp đến 2025', '<h1>Chiều 10/6, các đại biểu Quốc hội biểu quyết thông qua Nghị quyết kéo dài thời hạn miễn thuế sử ', '<h3>Sau khi biểu quyết, Nghị quyết kéo dài thời hạn miễn thuế sử dụng đất nông nghiệp được thông qua', 2, 0, 'Đã được duyệt', 0, 0, '2020-01-06 15:09:01', 0),
(2, '<h1> Doanh nghiệp Hải sản Việt Nam kiên định với Cam kết chống khai thác IUU</h1>', '<h1>Sau 2 năm EU cảnh báo thẻ vàng đối với hải sản khai thác của Việt Nam, xuất khẩu hải sản của Việ', '<h1>Nhận thức rõ ảnh hưởng của thẻ vàng IUU đối với XK hải sản Việt Nam sang thị trường EU và uy tín', 3, 0, 'Bị từ chối', 0, 0, '2020-05-06 17:09:01', 0),
(3, '<h1>Gói thầu 300.000 tấn gạo G2G của Philippines: Mới chỉ đạt 189.000 tấn,/h1>', '<h3>Philippines đã chính thức mở gói thầu 300.000 tấn gạo loại 25% tấm theo phương thức hợp đồng Chí', '<h4>Sáng ngày 8/6, tại Manila, Công ty Philippine International Trading Corporation (PITC) đại diện ', 5, 0, 'Chưa được duyệt', 0, 0, '2020-05-14 17:10:57', 0),
(4, '<h1>Doanh nghiệp than khó tiếp cận vốn</h1>\r\n', '<h2>Dịch Covid-19 ở nước ta đã tạm lắng, các doanh nghiệp (DN) đã bắt tay vào khôi phục sản xuất, ki', '<h3>Nguồn vốn hiện tại vẫn luôn là điều mà nhiều DN vừa và nhỏ quan tâm sau mùa dịch Covid-19. Trong', 6, 0, 'Đã được duyệt & chờ xuất bản', 0, 0, '0000-00-00 00:00:00', 0);

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
(1, 'admin'),
(2, 'guest'),
(3, 'subscriber'),
(4, 'writer'),
(5, 'editor');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `IDPage` int(20) NOT NULL,
  `TagName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`IDPage`, `TagName`) VALUES
(1, '#Chuyennhanong'),
(2, '#Thuysan'),
(3, '#Khoangsan'),
(4, '#dautu');

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
  `Duration` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`IDUser`, `Name`, `Email`, `DOB`, `Password`, `PermisstionID`, `Author`, `Duration`) VALUES
(1, 'Phạm Quang Trung', 'trung@gmail.com', '2020-04-16', '123', 2, 'Phạm Quan Trung', 100),
(2, 'Phan Thế Công', 'congphan@gmail.com', '1999-03-26', '1234', 1, '', 200),
(3, 'Nguyễn Hữu Đức', 'ducnisan@gmail.com', '1999-07-08', '1234', 3, '', 150),
(4, 'Nguyễn Thanh Dương', 'duong@gmail.com', '1999-10-15', '123', 4, '', 300);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
