-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2020 at 05:19 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

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
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IDComment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`IDPage`, `IDUser`, `Comment`, `Time`, `IDComment`) VALUES
(26, 13, 'alo', '2020-07-06 03:22:26', 6);

-- --------------------------------------------------------

--
-- Table structure for table `newspapers`
--

CREATE TABLE `newspapers` (
  `IDPage` int(11) NOT NULL,
  `Title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TinyContent` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `CatID` int(11) NOT NULL,
  `Status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `View` int(11) NOT NULL,
  `Day` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Premium` tinyint(1) NOT NULL,
  `ImgAvatar` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '../../public/images/32-450x260.jpg',
  `Author` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newspapers`
--

INSERT INTO `newspapers` (`IDPage`, `Title`, `TinyContent`, `Content`, `CatID`, `Status`, `View`, `Day`, `Premium`, `ImgAvatar`, `Author`) VALUES
(26, 'Nắng nóng khốc liệt: Hơn 1.000 ha cây ăn quả đặc sản lay lắt chờ chết', 'Mặc dù đã dùng mọi biện pháp để cấp nước cho cây trồng, tuy nhiên nắng hạn quá khốc liệt đã khiến hơ', '<h3><strong>Thiếu nước thiếu cả điện</strong></h3> <p>T&iacute;nh đến ng&agrave;y h&ocirc;m nay (28/6) &ldquo;chảo lửa&rdquo; huyện Hương Kh&ecirc; (H&agrave; Tĩnh) tr&ograve;n 1 th&aacute;ng kh&ocirc;ng c&oacute; giọt mưa n&agrave;o. C&aacute; biệt, một số x&atilde; như Hương Đ&ocirc;, Lộc Y&ecirc;n, Ph&uacute;c Trạch... số ng&agrave;y nắng ch&oacute;i chang đ&atilde; l&ecirc;n đến con số 60.</p> <figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"img_20200628_085606-0848_20200628_48.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/img_20200628_085606-0848_20200628_48-090736.jpeg\" alt=\"Hơn 200 ha cam, bưởi đặc sản ở đồi Trạng Nẹo, x&atilde; Ph&uacute;c Trạch thiếu nước trầm trọng. Ảnh: Gia Hưng.\" width=\"680\" height=\"510\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/img_20200628_085606-0848_20200628_48-090736.jpeg\" data-was-processed=\"true\" /> <figcaption> <h2 class=\"expEdit\">Hơn 200 ha cam, bưởi đặc sản ở đồi Trạng Nẹo, x&atilde; Ph&uacute;c Trạch thiếu nước trầm trọng. Ảnh:&nbsp;<em>Gia Hưng.</em></h2> </figcaption> </figure> <p>Nắng như thi&ecirc;u đốt khiến con người uể oải, mệt mỏi, c&ograve;n c&acirc;y trồng h&eacute;o &uacute;a, chết ch&aacute;y, thiếu sức sống.</p> <p>Đồi Trạng Nẹo, x&atilde; Ph&uacute;c Trạch l&agrave; &ldquo;thủ phủ&rdquo; cam đặc sản Khe M&acirc;y, bưởi Ph&uacute;c Trạch với hơn 100 hộ d&acirc;n v&agrave;o khai hoang, lập nghiệp. Những năm trước hơn 200 ha cam, bưởi nơi đ&acirc;y đem về h&agrave;ng trăm tỷ đồng cho người sản xuất.</p> <p>Tuy nhi&ecirc;n, năm nay nguy cơ mất m&ugrave;a đ&atilde; hiện diện trước mắt khi những đồi cam, bưởi h&eacute;o hắt, ch&aacute;y x&eacute;m v&igrave; nắng n&oacute;ng d&agrave;i ng&agrave;y.</p> <p>&ldquo;B&ecirc;n cạnh việc 2 th&aacute;ng trời kh&ocirc;ng c&oacute; giọt mưa n&agrave;o khiến hồ đập cạn trơ đ&aacute;y th&igrave; mấy chục năm nay khu vực n&agrave;y kh&ocirc;ng c&oacute; điện sinh hoạt. Ch&uacute;ng t&ocirc;i phải sử dụng m&aacute;y ph&aacute;t điện bơm nước tưới cứu c&acirc;y trồng nhưng lực ph&aacute;t yếu, chi ph&iacute; xăng dầu kh&aacute; cao, phải bơm d&agrave;i ng&agrave;y qu&aacute; n&ecirc;n cũng kh&ocirc;ng thể kham nổi&rdquo;, &ocirc;ng Nguyễn Đ&igrave;nh Sen, x&atilde; Ph&uacute;c Trạch n&oacute;i.</p> <figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"received_367293254242615-0850_20200628_291.jpeg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/received_367293254242615-0850_20200628_291-090738.jpeg\" alt=\"Nhiều diện t&iacute;ch đ&atilde; chết ch&aacute;y cả c&acirc;y lẫn quả hoặc lay lắt chờ chết. Ảnh: Gia Hưng.\" width=\"680\" height=\"510\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/received_367293254242615-0850_20200628_291-090738.jpeg\" data-was-processed=\"true\" /> <figcaption> <h2 class=\"expEdit\">Nhiều diện t&iacute;ch đ&atilde; chết ch&aacute;y cả c&acirc;y lẫn quả hoặc lay lắt chờ chết. Ảnh:&nbsp;<em>Gia Hưng.</em></h2> </figcaption> </figure> <p>Năm 1990, &ocirc;ng Sen c&ugrave;ng vợ v&agrave;o khu vực đồi Trạng Nẹo khai hoang, trồng c&acirc;y đặc sản bưởi Ph&uacute;c Trạch v&agrave; cam Khe M&acirc;y. Ngo&agrave;i việc đầu tư h&agrave;ng tỷ đồng cho c&ocirc;ng t&aacute;c &ldquo;vỡ đất&rdquo; ban đầu, h&agrave;ng năm gia đ&igrave;nh &ocirc;ng bỏ ra khoảng 150 triệu đồng tiền nh&acirc;n c&ocirc;ng, vật tư chăm s&oacute;c bưởi, cam.</p> <p>Hiện trang trại của &ocirc;ng đ&atilde; c&oacute; 1.200 gốc cam cho tr&aacute;i non v&agrave; hơn 1.000 gốc bưởi cho khoảng 5.000 quả. Tuy nhi&ecirc;n nắng n&oacute;ng k&eacute;o d&agrave;i khiến đồi cam, bưởi của gia đ&igrave;nh đứng trước nguy cơ chết ch&aacute;y.</p> <p>&ldquo;Những năm trước, b&igrave;nh qu&acirc;n thu nhập từ trại đạt khoảng 400 triệu đồng; trừ chi ph&iacute; vẫn l&atilde;i được khoảng 250 triệu đồng. Thế nhưng năm nay khả năng mất trắng v&igrave; nắng hạn. Hiện đ&atilde; c&oacute; khoảng 30% diện t&iacute;ch cam, bưởi trong vườn h&eacute;o, chết; quả ch&aacute;y v&agrave;ng, co r&uacute;m v&agrave; rụng do nắng đốt&rdquo;, &ocirc;ng Sen đưa tay nhặt những quả cam chưa &ldquo;khai sinh&rdquo; đ&atilde; &ldquo;khai tử&rdquo; buồn b&atilde; cho biết.</p> <p>Đồng thời khẳng định, 30 năm v&agrave;o l&agrave;m trang trại tại đồi Trạng Nẹo th&igrave; năm nay l&agrave; năm c&oacute; số ng&agrave;y nắng n&oacute;ng k&eacute;o d&agrave;i nhất.</p> <p>Đồng cảnh ngộ, trang trại của chị Nguyễn Thị Lĩnh cũng đang đứng trước nguy cơ thất thu v&igrave; thiếu nước tưới thiếu lu&ocirc;n cả điện.</p> <p>&ldquo;Hạn h&aacute;n k&eacute;o d&agrave;i nhưng ch&uacute;ng t&ocirc;i đ&agrave;nh bất lực v&igrave; điện kh&ocirc;ng c&oacute;, m&aacute;y ph&aacute;t tải kh&ocirc;ng được, bơm chuyền th&igrave; phải đ&agrave;o hồ đ&atilde; mới bơm chuyền nước được. Ở v&ugrave;ng &ldquo;chảo lửa&rdquo; n&agrave;y sức người c&oacute; hạn, chỉ mong sớm c&oacute; trạm biến &aacute;p để b&agrave; con ch&uacute;ng t&ocirc;i y&ecirc;n t&acirc;m sản xuất&rdquo;, chị Lĩnh n&oacute;i.</p> <figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"received_1340930532764258-0851_20200628_811.jpeg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/received_1340930532764258-0851_20200628_811-090748.jpeg\" alt=\"Những quả cam non của hộ &ocirc;ng Sen ch&aacute;y x&eacute;m, rụng xuống gốc v&igrave; thiếu nước. Ảnh: Gia Hưng.\" width=\"680\" height=\"510\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/received_1340930532764258-0851_20200628_811-090748.jpeg\" data-was-processed=\"true\" /> <figcaption> <h2 class=\"expEdit\">Những quả cam non của hộ &ocirc;ng Sen ch&aacute;y x&eacute;m, rụng xuống gốc v&igrave; thiếu nước. Ảnh:&nbsp;<em>Gia Hưng.</em></h2> </figcaption> </figure> <p>Người đ&agrave;n b&agrave; tứ tuần quệt vội mồ h&ocirc;i, mặt đỏ ửng v&igrave; nắng n&oacute;ng n&oacute;i tiếp: &ldquo;Trại của t&ocirc;i c&oacute; gần 1.000 gốc cam, bưởi nhưng đa phần đ&atilde; h&eacute;o do nắng n&oacute;ng, c&aacute; biệt c&oacute; những c&acirc;y chết kh&ocirc; cả c&acirc;y lẫn quả&rdquo;.</p> <p>B&agrave; Phạm Thị Hạnh, Ph&oacute; Chủ tịch UBND x&atilde; Ph&uacute;c Trạch cho hay: &ldquo;Đồi cam, bưởi Trạng Nẹo hằng năm đưa lại doanh thu hơn 60 tỷ đồng cho người d&acirc;n. Tuy nhi&ecirc;n, hiện đang đứng trước nguy cơ chết ch&aacute;y do nắng n&oacute;ng. Ch&iacute;nh quyền địa phương cũng như người d&acirc;n nơi đ&acirc;y tha thiết mong muốn tỉnh, huyện hỗ trợ đường điện, đ&aacute;p ứng nhu cầu sinh hoạt, sản xuất ổn định, l&acirc;u d&agrave;i cho b&agrave; con&rdquo;.</p> <h3><strong>Ảnh hưởng nặng nề trọng lượng, chất lượng quả</strong></h3> <p>&Ocirc;ng L&ecirc; Quang Vinh, Trưởng ph&ograve;ng N&ocirc;ng nghiệp huyện Hương Kh&ecirc;, cho biết, mặc d&ugrave; chưa c&oacute; thống k&ecirc; cụ thể nhưng qua kiểm tra, đ&aacute;nh gi&aacute;, to&agrave;n huyện c&oacute; hơn 1.000/3.200 ha cam, bưởi đ&atilde; cho thu hoạch bị ảnh hưởng nặng nề trong việc tăng trọng lượng, chất lượng quả do hạn h&aacute;n. Tập trung chủ yếu ở đồi Trạng Nẹo, x&atilde; Ph&uacute;c Trạch (khoảng 200 ha); Khe M&acirc;y, x&atilde; Hương Đ&ocirc;; x&atilde; Lộc Y&ecirc;n; x&atilde; Hương Giang; Hương Thủy...</p> <p>&ldquo;Nắng hạn 2 th&aacute;ng qua kh&ocirc;ng chỉ khiến hơn 1.000 ha cam, bưởi v&ugrave;ng cao cưỡng đứng trước nguy cơ mất m&ugrave;a, những diện t&iacute;ch c&ograve;n lại thiếu nước tưới, kh&ocirc;ng thể cung cấp dinh dưỡng nu&ocirc;i quả cũng sẽ ảnh hưởng đến năng suất, tổng sản lượng v&agrave;o cuối vụ&rdquo;, &ocirc;ng Vinh lo ngại.</p> <figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"img_20200628_085322-0854_20200628_389.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/img_20200628_085322-0854_20200628_389-090752.jpeg\" alt=\"Những diện t&iacute;ch c&ograve;n trụ được đến b&acirc;y giờ cũng kh&oacute; c&oacute; thể giữ được năng suất như năm ngo&aacute;i v&igrave; giai đoạn cần nước nhất lại gặp đại hạn. Ảnh: Gia Hưng.\" width=\"680\" height=\"510\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/img_20200628_085322-0854_20200628_389-090752.jpeg\" data-was-processed=\"true\" /> <figcaption> <h2 class=\"expEdit\">Những diện t&iacute;ch c&ograve;n trụ được đến b&acirc;y giờ cũng kh&oacute; c&oacute; thể giữ được năng suất như năm ngo&aacute;i v&igrave; giai đoạn cần nước nhất lại gặp đại hạn. Ảnh:&nbsp;<em>Gia Hưng.</em></h2> </figcaption> </figure> <p>Hiện tại, ng&agrave;nh NN-PTNT H&agrave; Tĩnh đ&atilde; th&agrave;nh lập c&aacute;c đo&agrave;n đi kiểm tra, hướng dẫn người d&acirc;n thực hiện c&aacute;c giải ph&aacute;p chống hạn cho cam, bưởi như tăng cường tận dụng nước khe suối, hồ đập bơm chống hạn; khoan giếng bổ sung nước tưới...</p> <p>&ldquo;Tuy nhi&ecirc;n c&aacute;c giải ph&aacute;p tr&ecirc;n cũng chỉ mang t&iacute;nh đối ph&oacute; ngắn hạn. Giờ cần c&oacute; mưa chứ bơm tưới kh&ocirc;ng đẫm c&acirc;y trồng cũng rất kh&oacute; phục hồi. Đ&aacute;ng ngại hơn, kể cả c&oacute; nước th&igrave; những v&ugrave;ng như Khe M&acirc;y, Trạng Nẹo cũng kh&ocirc;ng c&oacute; điện để bơm tưới&rdquo;, &ocirc;ng Nguyễn Tr&iacute; H&agrave;, Chi cục trưởng Chi cục Trồng trọt v&agrave; Bảo vệ thực vật H&agrave; Tĩnh n&oacute;i.</p>', 2, 'Chưa được duyệt', 1000, '2020-06-28 17:56:13', 0, 'https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/received_1340930532764258-0851_20200628_811-090748.jpeg', 1),
(31, ' 0 Xuất khẩu thủy sản đến 15/6 đạt 3,22 tỷ USD', '(Thủy sản Việt Nam) - Theo Tổng cục Hải quan, từ 1 - 15/6, kim ngạch xuất khẩu thủy sản đạt 333,5 tr', '<p>Xuất khẩu thủy sản trong th&aacute;ng 6 c&oacute; nhiều cải thiện so với th&aacute;ng 5. Trong th&aacute;ng 5/2020, xuất khẩu thủy sản cả nước đạt 641,8 triệu USD, giảm 15% so c&ugrave;ng kỳ năm trước; xuất khẩu sang hầu hết c&aacute;c thị trường lớn đều giảm.</p>\r\n<p>Thị trường Trung Quốc ghi nhận sự tăng trưởng trở lại cho sản phẩm thủy sản của Việt Nam. Trong th&aacute;ng 5 Trung Quốc trở th&agrave;nh thị trường xuất khẩu thủy sản lớn nhất của Việt Nam, đạt 129,03 triệu USD, tăng 18,5% so c&ugrave;ng kỳ. Tuy nhi&ecirc;n, theo Cục Xuất nhập khẩu (Bộ C&ocirc;ng thương), việc Trung Quốc ph&aacute;t hiện ổ dịch COVID-19 mới c&oacute; li&ecirc;n quan đến chợ b&aacute;n bu&ocirc;n&nbsp;n&ocirc;ng sản&nbsp;T&acirc;n Ph&aacute;t Địa tại Bắc Kinh sẽ phần n&agrave;o t&aacute;c động đến hoạt động xuất khẩu h&agrave;ng thủy sản của Việt Nam trong thời gian tới. Theo đ&oacute;, c&aacute;c doanh nghiệp sản xuất h&agrave;ng thủy sản xuất khẩu sang thị trường Trung Quốc cần ch&uacute; &yacute; theo d&otilde;i tiến độ xuất khẩu v&agrave; tăng cường gi&aacute;m s&aacute;t chất lượng h&agrave;ng h&oacute;a.</p>', 3, 'Chưa được duyệt', 900, '2020-06-28 18:21:46', 1, 'http://thuysanvietnam.com.vn/uploads/article/medium/2020/03/03/thuy-san-vuon-minh-vuot-covid-19_661514.jpg', 1),
(32, 'Petrolimex điều chỉnh giá xăng dầu từ 15 giờ 00 ngày 27.6.2020', 'Petrolimex/PLX chính thức điều chỉnh giá xăng dầu từ 15 giờ 00 ngày 27.6.2020. Giá công bố tại TCBC ', '<p><a><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://fs.petrolimex.com.vn/Files/6783DC1271FF449E95B74A9520964169/image=jpeg/ae83c79039164a7fa54d4ff5a01b1295/Giabanle.jpg\" alt=\"\" border=\"0\" /></a></p>\r\n<p style=\"text-align: center;\"><em>Mức gi&aacute; mới c&oacute; hiệu lực từ thời điểm 15 giờ 00 ng&agrave;y 27 th&aacute;ng 6 năm 2020 cho đến khi c&oacute; th&ocirc;ng c&aacute;o b&aacute;o ch&iacute; (TCBC) mới.</em></p>\r\n<p>Gi&aacute; xăng dầu&nbsp;do Petrolimex c&ocirc;ng bố tại TCBC n&agrave;y &aacute;p dụng tại hệ thống ph&acirc;n phối của Petrolimex tr&ecirc;n l&atilde;nh thổ Việt Nam; gồm: (a) C&aacute;c cửa h&agrave;ng xăng dầu (CHXD) Petrolimex; (b) CHXD của c&aacute;c thương nh&acirc;n l&agrave;m đại l&yacute;, tổng đại l&yacute; b&aacute;n xăng dầu của Petrolimex v&agrave; (c) CHXD của c&aacute;c thương nh&acirc;n nhận quyền b&aacute;n lẻ dưới h&igrave;nh thức&nbsp;<a href=\"https://www.petrolimex.com.vn/nd/minh-bach-xang-dau/thiet-lap-he-thong-phan-phoi-xang-dau-theo-nd-83-gop-phan-minh-bach-xang-dau/default.aspx\">nhượng quyền thương mại</a>&nbsp;từ Petrolimex.</p>\r\n<p>Gi&aacute; xăng dầu do Petrolimex c&ocirc;ng bố tại TCBC n&agrave;y kh&ocirc;ng &aacute;p dụng đối với c&aacute;c CHXD thuộc hệ thống ph&acirc;n phối của thương nh&acirc;n ph&acirc;n phối xăng dầu v&agrave; kh&ocirc;ng c&oacute; dấu hiệu nhận diện thương hiệu Petrolimex.</p>\r\n<p>Gi&aacute; c&ocirc;ng bố tại TCBC n&agrave;y được c&ocirc;ng khai tại trang tin điện tử (website)&nbsp;<a href=\"https://www.petrolimex.com.vn/\">www.petrolimex.com.vn</a>, c&aacute;c c&ocirc;ng ty xăng dầu th&agrave;nh vi&ecirc;n Petrolimex.</p>\r\n<p>Đối với c&aacute;c địa b&agrave;n xa cảng, xa kho đầu mối, xa cơ sở sản xuất xăng dầu theo quy định tại Điểm a, Khoản 1, Điều 5 Th&ocirc;ng tư li&ecirc;n tịch số 39/2014/TTLT-BCT-BTC ng&agrave;y 29.10.2014 của Li&ecirc;n bộ C&ocirc;ng Thương - T&agrave;i ch&iacute;nh (Petrolimex gọi tắt l&agrave; &ldquo;V&ugrave;ng 2&rdquo;); Tổng gi&aacute;m đốc Petrolimex trao quyền Gi&aacute;m đốc c&aacute;c c&ocirc;ng ty xăng dầu th&agrave;nh vi&ecirc;n Petrolimex trực tiếp quyết định gi&aacute; b&aacute;n thực tế tại địa b&agrave;n tổ chức kinh doanh nhưng&nbsp;kh&ocirc;ng được vượt mức gi&aacute;&nbsp;<a href=\"https://www.petrolimex.com.vn/nd/huong-dan-tieu-dung/vung_2.html\">v&ugrave;ng 2</a>&nbsp;n&ecirc;u tr&ecirc;n.</p>\r\n<p>Việc điều chỉnh gi&aacute; xăng dầu lần n&agrave;y xuất ph&aacute;t từ thực tiễn diễn biến gi&aacute; xăng dầu th&agrave;nh phẩm tr&ecirc;n thị trường thế giới trong chu kỳ t&iacute;nh gi&aacute;, ph&ugrave; hợp với nguy&ecirc;n tắc x&aacute;c định gi&aacute; b&aacute;n tại Nghị định số 83/2014/NĐ-CP ng&agrave;y 03.9.2014 của Ch&iacute;nh phủ về kinh doanh xăng dầu (NĐ 83) v&agrave; c&aacute;c văn bản hướng dẫn thi h&agrave;nh NĐ 83 của Li&ecirc;n Bộ C&ocirc;ng Thương - T&agrave;i ch&iacute;nh.</p>\r\n<p>Quyết định về gi&aacute; b&aacute;n xăng dầu số 326/PLX-QĐ-TGĐ ng&agrave;y 27.6.2020 đ&atilde; được gửi đến tất cả c&aacute;c đơn vị th&agrave;nh vi&ecirc;n Petrolimex v&agrave; b&aacute;o c&aacute;o Văn ph&ograve;ng Ch&iacute;nh phủ, Bộ C&ocirc;ng Thương, Bộ T&agrave;i ch&iacute;nh, Tổ li&ecirc;n ng&agrave;nh điều h&agrave;nh gi&aacute; xăng dầu.</p>\r\n<p>C&aacute;c đơn vị th&agrave;nh vi&ecirc;n Petrolimex&nbsp;khi ban h&agrave;nh quyết định gi&aacute; b&aacute;n lẻ xăng dầu tr&ecirc;n hệ thống ph&acirc;n phối của m&igrave;nh phải gửi Quyết định gi&aacute; đ&atilde; ban h&agrave;nh về Sở C&ocirc;ng Thương tỉnh/th&agrave;nh phố v&agrave; Tập đo&agrave;n để b&aacute;o c&aacute;o.</p>\r\n<p>Theo văn bản số&nbsp;<a href=\"https://www.petrolimex.com.vn/nd/minh-bach-xang-dau/van-ban-so-4686-bct-tttn-ngay-27-6-2020-ve-dieu-hanh-kinh-doanh-xang-dau.html\" target=\"_blank\" rel=\"noopener\">4686/BCT-TTTN</a>&nbsp;ng&agrave;y 27.6.2020 của Bộ C&ocirc;ng Thương về việc điều h&agrave;nh kinh doanh xăng dầu, mức tr&iacute;ch lập v&agrave; chi sử dụng Quỹ b&igrave;nh ổn gi&aacute; xăng dầu (BOG) từ 15 giờ 00 cụ thể như sau:</p>\r\n<p><a><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://fs.petrolimex.com.vn/Files/6783DC1271FF449E95B74A9520964169/image=jpeg/8241dc8b2eb04072bc75df86daa799cf/BOG.jpg\" alt=\"\" border=\"0\" /></a></p>', 8, 'Chưa được duyệt', 800, '2020-06-28 18:26:18', 0, 'https://fs.petrolimex.com.vn/Thumbnails/6783DC1271FF449E95B74A9520964169/0/120/0/B844BEEE70B546168C294C1D8B4F542A/0/365016/Petrolimex-dieu-chinh-gia-xang-dau-tu-15-gio-00-ng.jpg', 1),
(33, 'Ứng dụng công nghệ số để bứt phá trong nuôi tôm nước lợ', 'Tìm các giải pháp để phát triển nuôi tôm hiệu quả, bền vững thời kỳ hậu Covid-19 được người nuôi tôm', '<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"thu-hoach-tom-o-bac-lieu-2-1448_20200611_1.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/thu-hoach-tom-o-bac-lieu-2-1448_20200611_1-161807.jpeg\" alt=\"Phấn đấu năm 2020, sản lượng t&ocirc;m nu&ocirc;i đạt 830.000 tấn (280.000 tấn t&ocirc;m s&uacute; v&agrave; 550.00 tấn t&ocirc;m thẻ ch&acirc;n trắng), kim ngạch xuất khẩu đạt 3,5 tỷ USD. Ảnh: L&ecirc; Ho&agrave;ng Vũ.\" width=\"680\" height=\"456\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/thu-hoach-tom-o-bac-lieu-2-1448_20200611_1-161807.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<h2 class=\"expEdit\">Phấn đấu năm 2020, sản lượng t&ocirc;m nu&ocirc;i đạt 830.000 tấn (280.000 tấn t&ocirc;m s&uacute; v&agrave; 550.00 tấn t&ocirc;m thẻ ch&acirc;n trắng), kim ngạch xuất khẩu đạt 3,5 tỷ USD. Ảnh:&nbsp;<em>L&ecirc; Ho&agrave;ng Vũ.</em></h2>\r\n</figcaption>\r\n</figure>\r\n<h2><strong>Tận dụng tối đa c&ocirc;ng nghệ số&nbsp;</strong></h2>\r\n<p>Ng&agrave;y 11/6, tại S&oacute;c Trăng, Tổng cục Thủy sản tổ chức Diễn đ&agrave;n &ldquo;Ứng dụng c&aacute;c giải ph&aacute;p kỹ thuật v&agrave; quản l&yacute; ph&aacute;t triển nu&ocirc;i t&ocirc;m nước lợ hiệu quả, bền vững&rdquo;.&nbsp;</p>\r\n<p>Diễn đ&agrave;n thu h&uacute;t sự quan t&acirc;m đặc biệt của người nu&ocirc;i t&ocirc;m v&ugrave;ng ĐBSCL v&agrave; c&aacute;c doanh nghiệp trong lĩnh vực nu&ocirc;i trồng thủy sản.</p>\r\n<p>Đặc biệt, một số tổ chức quốc tế như GIZ, WWF Việt Nam đ&atilde; c&oacute; c&aacute;c b&agrave;i tham luận tại diễn đ&agrave;n n&agrave;y. Trong một ng&agrave;y, diễn đ&agrave;n tập trung v&agrave;o những nội dung trọng t&acirc;m để ph&aacute;t triển ng&agrave;nh t&ocirc;m nước lợ thời kỳ hậu Covid-19.&nbsp;</p>\r\n<p>Theo Tổng cục Thủy sản, năm 2020 diện t&iacute;ch thả nu&ocirc;i t&ocirc;m theo kế hoạch l&agrave; 730.000 ha, trong đ&oacute; c&oacute; 630.000 ha t&ocirc;m s&uacute;, 110.000 ha t&ocirc;m thẻ ch&acirc;n trắng.</p>\r\n<p>Nhu cầu t&ocirc;m bố mẹ cần khoảng 260.000 con, trong đ&oacute; t&ocirc;m thẻ ch&acirc;n trắng 200.000 con, t&ocirc;m s&uacute; 60.000 con. Nhu cầu con giống khoảng 130 tỷ con (100 tỷ t&ocirc;m thẻ ch&acirc;n trắng v&agrave; 30 tỷ t&ocirc;m s&uacute;). Phấn đấu năm 2020, sản lượng t&ocirc;m nu&ocirc;i đạt 830.000 tấn (280.000 tấn t&ocirc;m s&uacute; v&agrave; 550.000 tấn t&ocirc;m thẻ ch&acirc;n trắng), kim ngạch xuất khẩu đạt 3,5 tỷ USD.</p>\r\n<p>Tuy nhi&ecirc;n, năm 2020 dự b&aacute;o ng&agrave;nh t&ocirc;m Việt Nam sẽ tiếp tục đối mặt với nhiều kh&oacute; khăn, th&aacute;ch thức. Cụ thể, cuộc chiến thương mại Mỹ - Trung vẫn tiếp diễn v&agrave; kh&oacute; dự b&aacute;o. Đặc biệt, hạn h&aacute;n x&acirc;m nhập mặn ở ĐBSCL diễn ra sớm, khốc liệt v&agrave; dịch Covid-19 đ&atilde; ảnh hưởng s&acirc;u rộng đến hoạt động thương mại.</p>\r\n<p>Để đạt được tất cả c&aacute;c mục ti&ecirc;u n&agrave;y, Tổng cục Thủy sản đề nghị c&aacute;c địa phương theo d&otilde;i chặt chẽ diễn biến thời tiết để kịp thời khuyến c&aacute;o người d&acirc;n. C&aacute;c doanh nghiệp v&agrave; người nu&ocirc;i t&ocirc;m &aacute;p dụng c&aacute;c h&igrave;nh thức nu&ocirc;i c&oacute; chứng nhận VietGAP, GolbalGAP, ASC để n&acirc;ng cao gi&aacute; trị sản phẩm. Đặc biệt, kh&ocirc;ng sử dụng chất cấm, h&oacute;a chất trong nu&ocirc;i t&ocirc;m. Giảm kh&acirc;u trung gian để hạ gi&aacute; th&agrave;nh sản xuất, n&acirc;ng cao chất lượng sản phẩm.&nbsp;</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"dsc_0080-1448_20200611_865.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/dsc_0080-1448_20200611_865-161813.jpeg\" alt=\"Đưa c&ocirc;ng nghệ 4.0 v&agrave;o nu&ocirc;i t&ocirc;m đều đạt kết quả tốt. B&igrave;nh qu&acirc;n, một ao t&ocirc;m 800 m2 đạt sản lượng từ 6,5-12 tấn, thu tiền tỷ dễ d&agrave;ng. Ảnh: L&ecirc; Ho&agrave;ng Vũ.\" width=\"680\" height=\"454\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/dsc_0080-1448_20200611_865-161813.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<h2 class=\"expEdit\">Đưa c&ocirc;ng nghệ 4.0 v&agrave;o nu&ocirc;i t&ocirc;m đều đạt kết quả tốt. B&igrave;nh qu&acirc;n, một ao t&ocirc;m 800 m2 đạt sản lượng từ 6,5-12 tấn, thu tiền tỷ dễ d&agrave;ng. Ảnh:&nbsp;<em>L&ecirc; Ho&agrave;ng Vũ.</em></h2>\r\n</figcaption>\r\n</figure>\r\n<p>&Ocirc;ng L&ecirc; Văn Quang, TGĐ&nbsp;Cty XNK Thủy sản&nbsp;Minh Ph&uacute; cho rằng phải nhanh ch&oacute;ng đưa c&ocirc;ng nghệ 4.0 v&agrave;o nu&ocirc;i t&ocirc;m.</p>\r\n<p>Thực tế, để xuất khẩu t&ocirc;m thuận lợi, nhiều năm qua Cty Minh Ph&uacute; &aacute;p dụng nu&ocirc;i theo c&ocirc;ng nghệ cao để đ&aacute;p ứng theo từng thị trường y&ecirc;u cầu. Đặc biệt, hơn 10 năm nay Cty &aacute;p dụng nu&ocirc;i t&ocirc;m c&ocirc;ng nghệ ao đều đạt 90% trở l&ecirc;n.</p>\r\n<p>Cụ thể, như vụ t&ocirc;m hiện nay đang nu&ocirc;i 200 ao ở tỉnh Long An sau khi trừ chi ph&iacute; c&ograve;n l&atilde;i khoảng 30%. C&ograve;n tại Ki&ecirc;n Giang cũng thả nu&ocirc;i 200 ao đang chuẩn bị thu hoạch. Đưa c&ocirc;ng nghệ 4.0 v&agrave;o nu&ocirc;i t&ocirc;m đều đạt kết quả tốt. B&igrave;nh qu&acirc;n, một ao t&ocirc;m 800 m2 đạt sản lượng từ 6,5-12 tấn, thu tiền tỷ dễ d&agrave;ng.</p>\r\n<p>Tuy nhi&ecirc;n, c&aacute;i kh&oacute; hiện nay muốn li&ecirc;n kết với b&agrave; con n&ocirc;ng d&acirc;n để nu&ocirc;i theo chuỗi gi&aacute; trị cao xuất khẩu vẫn c&ograve;n gặp kh&oacute; ở kh&acirc;u đ&aacute;nh gi&aacute; chứng nhận. Bởi đa phần n&ocirc;ng d&acirc;n vẫn nu&ocirc;i theo truyền thống v&agrave; c&ograve;n sử dụng kh&aacute;ng sinh. Để c&oacute; chứng nhận trong nu&ocirc;i t&ocirc;m hiện nay vẫn chủ yếu từ c&aacute;c v&ugrave;ng nu&ocirc;i của doanh nghiệp. Trong khi đ&oacute;, nguồn nguy&ecirc;n liệu t&ocirc;m dồi d&agrave;o nhất vẫn chủ yếu từ c&aacute;c hộ d&acirc;n.</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" title=\"dsc_0423-1448_20200611_349.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/dsc_0423-1448_20200611_349-161819.jpeg\" alt=\"Hiện nay người nu&ocirc;i t&ocirc;m c&ograve;n gặp kh&oacute; khăn ở kh&acirc;u t&ocirc;m giống, thức ăn v&agrave; chuỗi li&ecirc;n kết để hướng đến xuất khẩu. Ảnh: L&ecirc; Ho&agrave;ng Vũ..\" width=\"680\" height=\"454\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/dsc_0423-1448_20200611_349-161819.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<h2 class=\"expEdit\">Hiện nay người nu&ocirc;i t&ocirc;m c&ograve;n gặp kh&oacute; khăn ở kh&acirc;u t&ocirc;m giống, thức ăn v&agrave; chuỗi li&ecirc;n kết để hướng đến xuất khẩu. Ảnh:&nbsp;<em>L&ecirc; Ho&agrave;ng Vũ..</em></h2>\r\n</figcaption>\r\n</figure>\r\n<h2><strong>Cơ hội những th&aacute;ng cuối năm</strong></h2>\r\n<p>&Ocirc;ng Ng&ocirc; Tiến Chương, đại diện cho GIZ (Tổ chức hợp t&aacute;c quốc tế CHLB Đức) chia sẻ: C&aacute;c dự &aacute;n do GIZ thực hiện trong lĩnh vực thủy sản l&agrave; ứng dụng c&ocirc;ng nghệ v&agrave; đổi mới s&aacute;ng tạo trong sản xuất t&ocirc;m. M&ocirc; h&igrave;nh th&iacute;ch ứng BĐKH cải thiện chuỗi gi&aacute; trị t&ocirc;m. Dự &aacute;n cải thiện chất lượng cơ sở sản xuất t&ocirc;m giống tại Việt Nam&hellip;</p>\r\n<p>Theo đ&oacute; &ocirc;ng Chương cho rằng, xu hướng ti&ecirc;u d&ugrave;ng tr&ecirc;n thế giới đ&atilde; quan t&acirc;m nhiều hơn đến sản phẩm hữu cơ v&agrave; nguồn gốc sản phẩm. V&igrave; vậy, việc đổi mới c&ocirc;ng nghệ trong nu&ocirc;i t&ocirc;m phải thay đổi từ tư duy đến h&agrave;nh động.&nbsp;</p>\r\n<p>&Ocirc;ng Trương Đ&igrave;nh H&ograve;e, Tổng thư k&yacute; Hiệp hội Chế biến v&agrave; Xuất khẩu Thủy sản Việt Nam (VASEP) cho biết: Thị trường EU bị ảnh hưởng nhiều nhất bởi dịch Covid-19. C&aacute;c lệnh cấm, phong tỏa tại EU đ&atilde; ảnh hưởng đến xuất khẩu t&ocirc;m v&agrave; tiếp tục giảm 7,7% trong 4 th&aacute;ng đầu năm.</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"thu-hoach-tom-o-bac-lieu-1-1448_20200611_481.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/thu-hoach-tom-o-bac-lieu-1-1448_20200611_481-161821.jpeg\" alt=\"Thị trường Trung Quốc đang phục hồi dần sau dịch Covid-19, trong th&aacute;ng 4 v&agrave; 5 xuất khẩu t&ocirc;m sang thị trường n&agrave;y tăng li&ecirc;n tụ. Ảnh: L&ecirc; Ho&agrave;ng Vũ.&nbsp;\" width=\"680\" height=\"498\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/11/thu-hoach-tom-o-bac-lieu-1-1448_20200611_481-161821.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<h2 class=\"expEdit\">Thị trường Trung Quốc đang phục hồi dần sau dịch Covid-19, trong th&aacute;ng 4 v&agrave; 5 xuất khẩu t&ocirc;m sang thị trường n&agrave;y tăng li&ecirc;n tụ. Ảnh:&nbsp;<em>L&ecirc; Ho&agrave;ng Vũ.&nbsp;</em></h2>\r\n</figcaption>\r\n</figure>\r\n<p>Ri&ecirc;ng thị trường Trung Quốc đang phục hồi dần, trong th&aacute;ng 4 xuất khẩu t&ocirc;m sang Trung Quốc lần đầu ti&ecirc;n tăng sau 3 th&aacute;ng giảm li&ecirc;n tục.</p>\r\n<p>Đối với thị trường Canada v&agrave; &Uacute;c, tại Canada xuất khẩu t&ocirc;m Việt Nam vẫn tiếp tục tăng trưởng tốt với 31,2%, tuy nhi&ecirc;n thị trường &Uacute;c đ&atilde; bắt đầu chậm lại v&agrave; giảm mạnh trong th&aacute;ng 4/2020 gần 50%. Nguy&ecirc;n nh&acirc;n một phần do t&aacute;c động của quy định mới về y&ecirc;u cầu r&uacute;t chỉ t&ocirc;m bắt đầu c&oacute; hiệu lực đối với c&aacute;c l&ocirc; h&agrave;ng đến &Uacute;c từ ng&agrave;y 1/7/2020.&nbsp;</p>\r\n<p>Tuy nhi&ecirc;n, cơ hội cho ng&agrave;nh t&ocirc;m Việt Nam l&agrave; sự cạnh tranh từ c&aacute;c nước xuất khẩu t&ocirc;m giảm: Ấn Độ, Ecuador, Th&aacute;i Lan, Indonesia vẫn c&ograve;n ảnh hưởng dịch Covid-19. Trung Quốc xuất hiện virus CIV-1, từ đ&oacute; sẽ c&oacute; sự dịch chuyển lớn c&aacute;c đơn h&agrave;ng sang Việt Nam.</p>\r\n<p>Theo đ&oacute;, nếu c&aacute;c nước kiểm so&aacute;t được dịch bệnh th&igrave; nguồn cung t&ocirc;m cũng mất nhiều thời gian để phục hồi bằng mức trước khi c&oacute; dịch. Do đ&oacute;, đ&acirc;y sẽ l&agrave; cơ hội tốt cho ng&agrave;nh t&ocirc;m Việt Nam đẩy mạnh xuất khẩu trong những th&aacute;ng cuối năm nay.</p>\r\n<p>B&ecirc;n cạnh đ&oacute;, nguồn cung t&ocirc;m thế giới sau dịch Covid c&oacute; khả năng sẽ thiếu hụt trong khi nhu cầu ti&ecirc;u thụ c&oacute; thể bằng hoặc tăng 1-2% so với trước khi c&oacute; dịch. Hiện nay, 4 thị trường nhập khẩu chủ yếu l&agrave; Nhật, Hoa Kỳ, EU v&agrave; Trung Quốc&nbsp; đang mạnh tay kh&ocirc;i phục kinh tế đều l&agrave; những thị trường ch&iacute;nh của t&ocirc;m Việt Nam. Xu hướng ti&ecirc;u d&ugrave;ng của thế giới c&oacute; thể thay đổi lớn sau dịch, tuy nhi&ecirc;n tập qu&aacute;n ưa chuộng thủy sản vẫn kh&ocirc;ng thay đổi nhiều, &ocirc;ng H&ograve;e nhận định.</p>\r\n<blockquote class=\"expNoEdit\">\r\n<div class=\"bl expEdit\">\r\n<h2><strong>Quản l&yacute; sức khỏe t&ocirc;m nu&ocirc;i</strong></h2>\r\n<p>Viện Nghi&ecirc;n cứu Nu&ocirc;i trồng thủy sản II khuyến c&aacute;o: Đối với t&ocirc;m nu&ocirc;i khi ph&aacute;t hiện c&aacute;c dấu hiệu bất thường ở gan tụy v&agrave; đường ruột cần giảm 50% lượng thức ăn đồng thời tăng cường quạt nước, kiểm tra c&aacute;c yếu tố pH, &ocirc;xy h&ograve;a tan, độ kiềm, nitrite, ammonia. Tăng cường xy ph&ocirc;ng, thay nước khi ph&aacute;t hiện h&agrave;m lượng nitrite v&agrave; ammonia cao kết hợp tăng cường quạt nước v&agrave; duy tr&igrave; &ocirc;xy h&ograve;a tan ở mức &ge; 5 mg/L.</p>\r\n<p>Từ giai đoạn 30-60 ng&agrave;y tuổi n&ecirc;n kiểm tra tăng trọng 2 tuần/lần, sau 60 ng&agrave;y n&ecirc;n kiểm tra tăng trọng h&agrave;ng tuần. Trường hợp t&ocirc;m nu&ocirc;i c&oacute; biểu hiện chậm lớn cần gửi mẫu x&eacute;t nghiệm để x&aacute;c định nguy&ecirc;n nh&acirc;n&hellip;</p>\r\n</div>\r\n</blockquote>\r\n<blockquote class=\"expNoEdit\">\r\n<div class=\"bl expEdit\">\r\n<p>Việc ứng dụng c&aacute;c c&ocirc;ng nghệ hiện đại như x&acirc;y dựng chuỗi cung ứng hợp nhất của Cty xpertSea gồm: năng suất trại giống, quản l&yacute; trại nu&ocirc;i, chứng nhận quốc tế, nh&agrave; m&aacute;y chế biến. Cty xpertSea cũng giới thiệu ứng dụng c&ocirc;ng nghệ Mobile để kiểm tra tăng trưởng của t&ocirc;m. Kỹ thuật số h&oacute;a bằng lưu trữ dữ liệu, thức ăn, m&ocirc;i trường nước.</p>\r\n</div>\r\n</blockquote>', 9, 'Chưa được duyệt', 700, '2020-06-28 18:31:38', 1, 'https://thumb.ex-cdn.com/EXP/media.nongnghiep.vn/resize/300x180/files/bao_in/2020/06/11/14_49_195_thu-hoach-tom-o-bac-lieu-2-161823.jpeg', 1),
(34, 'Trồng bưởi da xanh không dùng phân, thuốc hóa học, cho quả quanh năm', 'Rời TP Hồ Chí Minh khi đang có công việc ổn định, anh Nguyễn Văn Đảm đã lên Tây Nguyên tìm đất phù h', '<p><strong>T&igrave;m đất sạch sản xuất bưởi hữu cơ</strong></p>\r\n<p>Anh Nguyễn Văn Đảm, sinh năm 1981, tốt nghiệp kỹ sư H&agrave;ng hải, đ&atilde; l&ecirc;nh đ&ecirc;nh tr&ecirc;n biển 2 năm, rồi chuyển qua l&agrave;m h&agrave;ng h&oacute;a, tr&aacute;i c&acirc;y xuất khẩu nhưng lại rẽ hướng chọn sang sản xuất n&ocirc;ng nghiệp bằng m&ocirc; h&igrave;nh trồng bưởi da xanh hữu cơ.&nbsp;</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"buoihuuco-2-1502_20200625_394.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-2-1502_20200625_394-091832.jpeg\" alt=\"Vườn bưởi da xanh của anh Đảm được bọc quả để tr&aacute;nh c&ocirc;n tr&ugrave;ng ch&iacute;nh h&uacute;t. Ảnh: Đinh L&acirc;m.\" width=\"680\" height=\"476\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-2-1502_20200625_394-091832.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<h2 class=\"expEdit\">Vườn bưởi da xanh của anh Đảm được bọc quả để tr&aacute;nh c&ocirc;n tr&ugrave;ng ch&iacute;nh h&uacute;t. Ảnh:&nbsp;<em>Đinh L&acirc;m.</em></h2>\r\n</figcaption>\r\n</figure>\r\n<p>Xuất ph&aacute;t từ c&ocirc;ng việc l&agrave;m h&agrave;ng h&oacute;a xuất khẩu, anh Đảm nhận thấy bưởi da xanh c&oacute; nhiều gi&aacute; trị v&agrave; thị trường xuất khẩu ưa chuộng, tiềm năng.</p>\r\n<p>Từ đ&oacute;, anh Đảm t&igrave;m hiểu nhiều th&ocirc;ng tin về giống bưởi n&agrave;y. Anh lặn lội đến những vườn bưởi quy m&ocirc; lớn nổi tiếng trong nước để học c&aacute;ch trồng, chăm s&oacute;c. Sau khi định hướng v&agrave; lựa chọn sản xuất bưởi theo c&aacute;ch ri&ecirc;ng của m&igrave;nh, anh Đảm rong ruổi dọc c&aacute;c tỉnh Đăk Lăk, L&acirc;m Đồng, Đăk N&ocirc;ng để t&igrave;m đất bắt đầu khởi nghiệp. Thấy v&ugrave;ng đất ở th&ocirc;n Đức Long, x&atilde; Đăk Săk, huyện Đăk Mil c&oacute; nhiều lợi thế, kh&iacute; hậu, thổ nhưỡng ph&ugrave; hợp, c&acirc;y cối xanh tốt, anh Đảm đ&atilde; lấy mẫu đất, nước&nbsp; gửi cơ quan chức năng ở TP Hồ Ch&iacute; Minh kiểm định v&agrave; kết quả đạt chuẩn, đủ điều kiện sản xuất n&ocirc;ng nghiệp hữu cơ.</p>\r\n<p>&ldquo;Th&ocirc;ng số kiểm tra cho thấy nhiều yếu tố thuận lợi để trồng bưởi da xanh nhưng khi đi tham khảo người d&acirc;n xung quanh th&igrave; ai cũng can bảo trồng bưởi chua, kh&ocirc;ng ngon. Dựa v&agrave;o kết quả kiểm tra nước, đất t&ocirc;i tin tưởng m&igrave;nh l&agrave;m được&rdquo;, anh Đảm chia sẻ.&nbsp;</p>\r\n<p>Th&aacute;ng 8/2015, anh Đảm mua 5 ha đất v&agrave; bắt tay v&agrave;o sản xuất. X&aacute;c định từ đầu sản xuất bưởi da xanh hữu cơ n&ecirc;n vườn bưởi anh để cỏ mọc tự nhi&ecirc;n, chỉ cắt khi cỏ qu&aacute; cao, ph&acirc;n b&oacute;n được ủ hoai mục với men vi sinh. Ngo&agrave;i ra, anh c&ograve;n ủ đậu tương với men để l&agrave;m ph&acirc;n b&oacute;n. Anh d&ugrave;ng v&ocirc;i xịt l&ecirc;n c&acirc;y để hạn chế c&ocirc;n tr&ugrave;ng ch&iacute;ch h&uacute;t v&agrave; xua đuổi c&ocirc;n tr&ugrave;ng bằng c&aacute;ch treo long n&atilde;o ở th&acirc;n mỗi c&acirc;y.</p>\r\n<p>Anh Đảm cho hay, qua t&igrave;m hiểu anh nhận thấy xu hướng sản xuất n&ocirc;ng nghiệp hữu cơ l&agrave; xu thế tất yếu v&agrave; bền vững trong n&ocirc;ng nghiệp. Do đ&oacute; anh chọn hướng n&agrave;y v&igrave; an to&agrave;n cho người sản xuất v&agrave; người sử dụng sản phẩm.&nbsp;</p>\r\n<p><strong>Thu quả ngọt&nbsp;</strong></p>\r\n<p>Năm 2018 bưởi bắt đầu cho quả b&oacute;i. Anh Đảm gửi sản phẩm l&ecirc;n một số si&ecirc;u thị, cửa h&agrave;ng TP Hồ Ch&iacute; Minh để kh&aacute;ch h&agrave;ng đ&aacute;nh gi&aacute; kiểm tra chất lượng. Kết quả được kh&aacute;ch h&agrave;ng h&agrave;i l&ograve;ng v&agrave; đặt h&agrave;ng. Anh Đảm chia sẻ: Để hạn chế bưởi da xanh bị c&ocirc;n tr&ugrave;ng ch&iacute;ch h&uacute;t, khi tr&aacute;i bưởi bằng ng&oacute;n tay c&aacute;i t&ocirc;i d&ugrave;ng bao bọc k&iacute;n. Khi tỉ lệ c&ocirc;n tr&ugrave;ng mật độ lớn th&igrave; d&ugrave;ng hạt na ng&acirc;m rượu hay d&ugrave;ng giấm, gừng, tỏi, ớt gi&atilde; nhỏ phun l&ecirc;n c&acirc;y để xua đuổi\".&nbsp;</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"buoihuuco-3-1502_20200625_853.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-3-1502_20200625_853-091838.jpeg\" alt=\"Vườn bưởi nh&agrave; anh Đảm c&ograve;n sử dụng l&ocirc;ng n&atilde;o để xua đuổi c&ocirc;n tr&ugrave;ng. Ảnh: Đinh L&acirc;m.\" width=\"680\" height=\"399\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-3-1502_20200625_853-091838.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<h2 class=\"expEdit\">Vườn bưởi nh&agrave; anh Đảm c&ograve;n sử dụng l&ocirc;ng n&atilde;o để xua đuổi c&ocirc;n tr&ugrave;ng. Ảnh:&nbsp;<em>Đinh L&acirc;m.</em></h2>\r\n</figcaption>\r\n</figure>\r\n<p>Anh Đảm chia sẻ kinh nghiệm, bộ rễ c&acirc;y quan trọng nhất, rễ tốt c&acirc;y sẽ hấp thụ được nhiều chất từ đất, xử l&yacute; đất tốt, c&acirc;y sẽ ph&aacute;t triển v&agrave; chất lượng quả được n&acirc;ng cao. Bưởi da xanh l&agrave; loại c&acirc;y kh&oacute; t&iacute;nh, cho quả đẹp nhưng chưa chắc đ&atilde; b&aacute;n được nếu quả bị chua hoặc sần, v&igrave; thế người trồng phải hiểu về bưởi mới l&agrave;m được.</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"buoihuuco-4-1502_20200625_683.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-4-1502_20200625_683-091842.jpeg\" alt=\"Sử dụng ph&acirc;n từ đậu n&agrave;nh ủ để cung cấp chất dinh dưỡng cho c&acirc;y. Ảnh: Đinh L&acirc;m.\" width=\"680\" height=\"510\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-4-1502_20200625_683-091842.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<h2 class=\"expEdit\">Sử dụng ph&acirc;n từ đậu n&agrave;nh ủ để cung cấp chất dinh dưỡng cho c&acirc;y. Ảnh:<em>&nbsp;Đinh L&acirc;m.</em></h2>\r\n</figcaption>\r\n</figure>\r\n<p>Vườn của anh Đảm hiện c&oacute; nhiều lứa quả tr&ecirc;n c&ugrave;ng 1 c&acirc;y, quả 5 th&aacute;ng tuổi, loại 3 th&aacute;ng, quả mới đậu, hoa. C&aacute;ch để bưởi ra quả được thực hiện sau mỗi đợt ra đọt của c&acirc;y. Mỗi năm c&oacute; 4 - 5 đợt bưởi th&aacute;o đọt cũng l&agrave; dịp \"siết&rdquo; để c&acirc;y cho quả quanh năm, đ&acirc;y l&agrave; c&aacute;ch l&agrave;m rất hay để rải vụ.&nbsp;</p>\r\n<p>Với vườn bưởi 5 ha, anh Đảm trồng 1.500&nbsp; c&acirc;y, vụ bưởi năm nay dự kiến thu được 30 tấn quả. Với gi&aacute; b&aacute;n từ 30-70 ng&agrave;n đồng/kg th&igrave; năm nay anh c&oacute; thu nhập khoảng 1,5 tỷ đồng.</p>\r\n<blockquote class=\"expNoEdit\">\r\n<div class=\"bl expEdit\">\r\n<p>Vườn bưởi của gia đ&igrave;nh anh Đảm đ&atilde; đạt ti&ecirc;u chuẩn 3 sao xếp hạng sản phẩm OCOP của huyện Đăk Mil. Hiện anh đang l&agrave;m hồ sơ để chứng nhận ti&ecirc;u chuẩn hữu cơ USDA của Mỹ v&agrave; đăng k&yacute; m&atilde; vạch, truy xuất nguồn gốc h&agrave;ng h&oacute;a nhằm phục vụ quảng b&aacute;, giới thiệu v&agrave; b&aacute;n sản phẩm.</p>\r\n</div>\r\n</blockquote>', 2, 'Chưa được duyệt', 600, '2020-06-28 18:35:37', 0, 'https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/bao_in/2020/06/28/buoihuuco-2-1502_20200625_394-091832.jpeg', 1),
(35, 'Đồng Tháp: Người nuôi cá tra thua lỗ nặng', '(Thủy sản Việt Nam) - Dịch COVID-19 lan rộng toàn cầu khiến xuất khẩu cá tra gặp khó khăn. Đa số các', '<p class=\"body-text\">Tại Đồng Th&aacute;p, hiện tại gi&aacute; c&aacute; tra nguy&ecirc;n liệu từ 18', 9, 'Chưa được duyệt', 500, '2020-06-28 18:38:40', 1, 'http://thuysanvietnam.com.vn/uploads/article/medium/2019/02/18/nam-2019-nganh-hang-ca-tra-phan-dau-2-4-ty-usd_891476.jpg', 1),
(36, 'Chủ tịch T&T 159 chỉ ra bí quyết sản xuất 1kg bò hơi với 35.000 đồng', 'Nhờ ứng dụng mô hình kinh tế tuần hoàn trong chăn nuôi, chi phí tạo ra 1kg thịt bò có thể giảm 40 - ', '<p>Đ&oacute; l&agrave; chia sẻ của &ocirc;ng H&agrave; Văn Thắng, Chủ tịch HĐQT C&ocirc;ng ty Cổ phần T&amp;T 159, đơn vị ti&ecirc;n phong trong chăn nu&ocirc;i b&ograve; thịt quy m&ocirc; c&ocirc;ng nghiệp tại Việt Nam hiện nay.</p>\r\n<h3><strong>Ứng dụng kinh tế tuần ho&agrave;n trong n&ocirc;ng nghiệp</strong></h3>\r\n<p>&Ocirc;ng H&agrave; Văn Thắng chia sẻ: Mấy năm gần đ&acirc;y, ng&agrave;nh c&ocirc;ng nghiệp chăn nu&ocirc;i b&ograve; sữa c&oacute; bước tăng trưởng thần tốc, đem lại hiệu quả v&ocirc; c&ugrave;ng to lớn. Nhưng chăn nu&ocirc;i b&ograve; thịt ph&aacute;t triển c&ograve;n chậm.</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"ec36542a8c9b76c52f8a-173516_408.jpg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/phucpm/2020/06/07/ec36542a8c9b76c52f8a-173516_408.jpg\" alt=\"&Ocirc;ng H&agrave; Văn Thắng - Chủ tịch C&ocirc;ng ty Cổ phần T&amp;T 159 trong buổi tọa đ&agrave;m với chủ đề \'Chăn nu&ocirc;i đại gia s&uacute;c, l&agrave;m g&igrave; để bứt ph&aacute;?\'. Ảnh: Minh Ph&uacute;c.\" width=\"680\" height=\"382\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/phucpm/2020/06/07/ec36542a8c9b76c52f8a-173516_408.jpg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<p class=\"expEdit h2\">&Ocirc;ng H&agrave; Văn Thắng - Chủ tịch C&ocirc;ng ty Cổ phần T&amp;T 159 trong buổi tọa đ&agrave;m với chủ đề \"Chăn nu&ocirc;i đại gia s&uacute;c, l&agrave;m g&igrave; để bứt ph&aacute;?\". Ảnh:&nbsp;<em>Minh Ph&uacute;c.</em></p>\r\n</figcaption>\r\n</figure>\r\n<p>Nguy&ecirc;n nh&acirc;n l&agrave; do ch&uacute;ng ta chưa c&oacute; giải ph&aacute;p c&ocirc;ng nghệ ph&ugrave; hợp, chưa c&oacute; c&aacute;ch tiếp cận đ&uacute;ng hướng để khai th&aacute;c lợi thế của quốc gia.</p>\r\n<p>C&oacute; thể n&oacute;i c&oacute; dư địa tăng đ&agrave;n gia s&uacute;c ăn cỏ ở nước ta c&ograve;n rất lớn. Kh&ocirc;ng c&oacute; l&yacute; g&igrave; ch&uacute;ng ta ph&aacute;t triển được con b&ograve; sữa m&agrave; kh&ocirc;ng l&agrave;m được với con b&ograve; thịt. Nhưng, đ&acirc;y l&agrave; một h&agrave;nh tr&igrave;nh d&agrave;i v&agrave; cần c&oacute; chiến lược ph&aacute;t triển đồng bộ, kh&eacute;p k&iacute;n.</p>\r\n<p>Mặc d&ugrave; ch&uacute;ng ta chưa c&oacute; những đồng cỏ tự nhi&ecirc;n như một số quốc gia ph&aacute;t triển nu&ocirc;i b&ograve;. Tuy nhi&ecirc;n, Việt Nam l&agrave; nước thuần n&ocirc;ng, ng&agrave;nh sản xuất c&acirc;y lương thực tạo ra sản lượng rất lớn. C&aacute;c loại c&acirc;y trồng như l&uacute;a, ng&ocirc;, khoai, sắn v&agrave; nhiều loại phụ phẩm n&ocirc;ng nghiệp đều c&oacute; thể l&agrave;m nguy&ecirc;n liệu thức ăn cho b&ograve;.</p>\r\n<p>Do đ&oacute;, ch&uacute;ng ta phải giải quyết đồng bộ từ ứng dụng khoa học kỹ thuật v&agrave; c&ocirc;ng nghệ sinh học để thu gom, chế biến thức ăn cho gia s&uacute;c ăn cỏ; x&acirc;y dựng c&aacute;c trung t&acirc;m v&ugrave;ng l&otilde;i để thực hiện li&ecirc;n kết với c&aacute;c n&ocirc;ng hộ.</p>\r\n<p>Tr&ecirc;n nền tảng chăn nu&ocirc;i truyền thống, ch&uacute;ng ta ho&agrave;n thiện lại m&ocirc; h&igrave;nh chăn nu&ocirc;i cổ xưa để tạo ra một m&ocirc; h&igrave;nh kinh tế mới. Ch&uacute;ng t&ocirc;i gọi đ&oacute; l&agrave; nền kinh tế n&ocirc;ng nghiệp tuần ho&agrave;n.</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"anh-chup-man-hinh-2020-06-07-luc-174512-175200_987.jpeg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/phucpm/2020/06/07/anh-chup-man-hinh-2020-06-07-luc-174512-175200_987.jpeg\" alt=\"&Ocirc;ng H&agrave; Văn Thắng (thứ hai từ phải sang) giới thiệu với Bộ trưởng Bộ NN-PTNT Nguyễn Xu&acirc;n Cường (thứ tư từ phải sang) c&ocirc;ng nghệ chăn nu&ocirc;i b&ograve; của T&amp;T 159. Ảnh: Minh Ph&uacute;c.\" width=\"680\" height=\"377\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/phucpm/2020/06/07/anh-chup-man-hinh-2020-06-07-luc-174512-175200_987.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<p class=\"expEdit h2\">&Ocirc;ng H&agrave; Văn Thắng (thứ hai từ phải sang) giới thiệu với Bộ trưởng Bộ NN-PTNT Nguyễn Xu&acirc;n Cường (thứ tư từ phải sang) c&ocirc;ng nghệ chăn nu&ocirc;i b&ograve; của T&amp;T 159. Ảnh:&nbsp;<em>Minh Ph&uacute;c.</em></p>\r\n</figcaption>\r\n</figure>\r\n<p>Thực tế, C&ocirc;ng ty Cổ phần T&amp;T 159 đ&atilde; x&acirc;y dựng th&agrave;nh c&ocirc;ng một số khu li&ecirc;n hợp kh&eacute;p k&iacute;n từ sản xuất thức ăn gia s&uacute;c bằng phụ phẩm n&ocirc;ng nghiệp, chăn nu&ocirc;i b&ograve; sinh sản, b&ograve; thịt v&agrave; sản xuất đệm l&oacute;t sinh học xử l&yacute; chất thải chăn nu&ocirc;i, sản xuất ph&acirc;n b&oacute;n hữu cơ vi sinh.</p>\r\n<p>T&amp;T 159 đầu tư hệ thống m&aacute;y thu gom phụ phẩm n&ocirc;ng nghiệp hiện đại trị gi&aacute; h&agrave;ng chục tỷ đồng. Ch&uacute;ng t&ocirc;i li&ecirc;n kết với h&agrave;ng chục ng&agrave;n n&ocirc;ng d&acirc;n để mua rơm rạ, ng&ocirc;, sắn&hellip; với chi ph&iacute; rất thấp (bởi đ&oacute; l&agrave; thứ n&ocirc;ng d&acirc;n bỏ đi tr&ecirc;n đồng ruộng, sau khi thu hoạch sản phẩm). Sau khi thu gom về nh&agrave; m&aacute;y, c&aacute;c nguy&ecirc;n liệu tr&ecirc;n được chế biến v&agrave; phối trộn TMR để l&agrave;m thức ăn nu&ocirc;i b&ograve;.</p>\r\n<p>Nhờ đ&oacute;, gi&aacute; th&agrave;nh sản xuất 1kg thức ăn với đầy đủ dưỡng chất cho b&ograve; chỉ khoảng 1.000 đồng. Trong khi đ&oacute;, t&ocirc;i được biết, b&igrave;nh qu&acirc;n chi ph&iacute; thu mua nguy&ecirc;n liệu thức ăn th&ocirc; xanh (chưa phối trộn tinh bột v&agrave; c&aacute;c dưỡng chất kh&aacute;c) của nhiều doanh nghiệp đ&atilde; l&ecirc;n tới 800 - 1.000 đồng, nếu phối trộn TMR, th&igrave; gi&aacute; th&agrave;nh sẽ phải dao động gần 2.000 đồng/kg thức ăn.</p>\r\n<p>Mỗi ng&agrave;y, một con b&ograve; ăn b&igrave;nh qu&acirc;n 35kg thức ăn. Do đ&oacute;, chi ph&iacute; sản xuất b&ograve; hơi của T&amp;T 159 chỉ dao động 35.000 - 40.000 đồng; trong khi nhiều doanh nghiệp phải chi ph&iacute; tới 70.000 - 75.000 đồng/kg tăng trọng.</p>\r\n<h3><strong>Kh&ocirc;ng c&oacute; thứ g&igrave; bỏ đi</strong></h3>\r\n<p>B&ecirc;n cạnh đ&oacute;, ch&uacute;ng t&ocirc;i cũng tự sản xuất đệm l&oacute;t sinh học từ những thứ bỏ đi của c&aacute;c hoạt động kinh tế như vỏ c&acirc;y, m&ugrave;n cưa, l&aacute; kh&ocirc;&hellip; để nghiền n&aacute;t, đưa c&aacute;c chủng vi sinh hữu &iacute;ch v&agrave;o để sản xuất đệm l&oacute;t sinh học.</p>\r\n<p>Đệm l&oacute;t sinh học được rải xuống nền chuồng nu&ocirc;i b&ograve;. Ph&acirc;n v&agrave; nước tiểu rơi xuống sẽ được giữ lại to&agrave;n bộ; được c&aacute;c chủng vi sinh ph&acirc;n giải c&aacute;c hợp chất hữu cơ, tạo th&agrave;nh sản phẩm ph&acirc;n b&oacute;n cho c&acirc;y trồng rất gi&agrave;u dưỡng chất.</p>\r\n<figure class=\"expNoEdit\"><img class=\"lazyload loaded\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"anh-chup-man-hinh-2020-05-13-luc-170109-175539_65.jpeg\" src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/phucpm/2020/06/07/anh-chup-man-hinh-2020-05-13-luc-170109-175539_65.jpeg\" alt=\"B&ecirc;n trong khu nu&ocirc;i vỗ b&eacute;o b&ograve; thịt của C&ocirc;ng ty Cổ phần Giống, thức ăn chăn nu&ocirc;i T&amp;T 159 H&ograve;a B&igrave;nh (thuộc C&ocirc;ng ty Cổ phần T&amp;T 159). Ảnh: Minh Ph&uacute;c.\" width=\"680\" height=\"431\" data-src=\"https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/phucpm/2020/06/07/anh-chup-man-hinh-2020-05-13-luc-170109-175539_65.jpeg\" data-was-processed=\"true\" />\r\n<figcaption>\r\n<p class=\"expEdit h2\">B&ecirc;n trong khu nu&ocirc;i vỗ b&eacute;o b&ograve; thịt của C&ocirc;ng ty Cổ phần Giống, thức ăn chăn nu&ocirc;i T&amp;T 159 H&ograve;a B&igrave;nh (thuộc C&ocirc;ng ty Cổ phần T&amp;T 159). Ảnh:&nbsp;<em>Minh Ph&uacute;c.</em></p>\r\n</figcaption>\r\n</figure>\r\n<p>Một con b&ograve; thịt thải ra khoảng 20kg ph&acirc;n v&agrave; 30 l&iacute;t nước tiểu. Nếu thu gom hết nguồn phế thải của hệ thống trang trại nu&ocirc;i b&ograve; T&amp;T 159, c&oacute; thể sản xuất được 100 tấn ph&acirc;n b&oacute;n hữu cơ vi sinh/ng&agrave;y, tương đương khoảng 300 - 500 triệu đồng. Số tiền n&agrave;y đủ để vận h&agrave;nh to&agrave;n bộ trang trại trong ng&agrave;y.</p>\r\n<p>Hiện nay, T&amp;T 159 c&oacute; 4 d&ograve;ng ph&acirc;n b&oacute;n hữu cơ vi sinh. C&aacute;c sản phẩm tr&ecirc;n được cung ứng cho n&ocirc;ng d&acirc;n v&ugrave;ng cam Cao Phong (H&ograve;a B&igrave;nh) v&agrave; một số v&ugrave;ng chuy&ecirc;n canh c&acirc;y ăn quả.</p>\r\n<p>Ri&ecirc;ng một tập đo&agrave;n chuy&ecirc;n ph&aacute;t triển sản phẩm mắc ca đ&atilde; k&yacute; hợp đồng mua 10.000 tấn ph&acirc;n b&oacute;n vi sinh mỗi năm với ch&uacute;ng t&ocirc;i. V&agrave; trong chiến lược d&agrave;i hạn, ch&uacute;ng t&ocirc;i c&oacute; kế hoạch sản xuất khoảng 1 triệu tấn ph&acirc;n b&oacute;n hữu cơ.</p>\r\n<p>Kinh tế tuần ho&agrave;n sẽ l&agrave; tương lai của nền n&ocirc;ng nghiệp Việt Nam, tạo ra những bước ph&aacute;t triển bền vững v&agrave; hiệu quả cao. Theo đ&oacute;, r&aacute;c thải của chu kỳ n&agrave;y sẽ l&agrave; đầu v&agrave;o của chu kỳ kh&aacute;c như một v&ograve;ng tr&ograve;n kh&eacute;p k&iacute;n.</p>\r\n<p>Tuy nhi&ecirc;n, đ&acirc;y l&agrave; li&ecirc;n kết rất mở, n&oacute; kh&ocirc;ng b&oacute; hẹp trong một kh&ocirc;ng gian n&agrave;o. Tất cả c&aacute;c hoạt động xoay quanh gi&aacute; trị mục ti&ecirc;u cốt l&otilde;i đều tạo ra lợi nhuận. Đặc biệt, đ&acirc;y l&agrave; m&ocirc; h&igrave;nh giải quyết triệt để vấn đề m&ocirc;i trường, bởi kh&ocirc;ng c&oacute; thứ g&igrave; bỏ đi.</p>', 10, 'Chưa được duyệt', 400, '2020-06-28 18:41:35', 1, 'https://thumb.ex-cdn.com/EXP/media.nongnghiep.vn/resize/480x288/files/nghienmx/2020/06/28/4530-anh-chup-man-hinh-2020-05-13-luc-170109-175539_65.jpeg', 1),
(37, 'Bắt giữ 7 sà lan của 2 công ty khai thác trái phép đất sét trên sông Hậu', '(NLĐO) - 7 sà lan của 2 công ty khai thác được khoảng 300 m3 đất sét thì bị lực lượng Công an TP Cần', '<p>Ng&agrave;y 29-3, C&ocirc;ng an TP Cần Thơ cho biết vừa bắt giữ 7 s&agrave; lan c&oacute; dấu hiệu khai th&aacute;c tr&aacute;i ph&eacute;p kho&aacute;ng sản l&agrave; đất s&eacute;t tr&ecirc;n s&ocirc;ng Hậu (thuộc phường T&acirc;n Lộc, quận Thốt Nốt).</p>\r\n<div class=\"VCSortableInPreviewMode active\">\r\n<div><img id=\"img_5074e760-7181-11ea-8829-b17a220f8a01\" title=\"Bắt giữ 7 s&agrave; lan của 2 c&ocirc;ng ty khai th&aacute;c tr&aacute;i ph&eacute;p đất s&eacute;t tr&ecirc;n s&ocirc;ng Hậu - Ảnh 1.\" src=\"https://nld.mediacdn.vn/thumb_w/684/2020/3/29/dat-set-15854610872051862084438.jpg\" alt=\"Bắt giữ 7 s&agrave; lan của 2 c&ocirc;ng ty khai th&aacute;c tr&aacute;i ph&eacute;p đất s&eacute;t tr&ecirc;n s&ocirc;ng Hậu - Ảnh 1.\" width=\"\" height=\"\" data-original=\"https://nld.mediacdn.vn/2020/3/29/dat-set-15854610872051862084438.jpg\" /></div>\r\n<div class=\"PhotoCMS_Caption\">\r\n<p class=\"\" data-placeholder=\"[nhập ch&uacute; th&iacute;ch]\">Phương tiện khai th&aacute;c đất s&eacute;t tr&aacute;i ph&eacute;p</p>\r\n</div>\r\n</div>\r\n<p>Tại hiện trường, cơ quan c&ocirc;ng an ph&aacute;t hiện 7 s&agrave; lan n&agrave;y l&agrave; của C&ocirc;ng ty TNHH Sa Mộc v&agrave; C&ocirc;ng ty TNHH Lan Anh đang khai th&aacute;c đất s&eacute;t với khối lượng lớn. Tr&ecirc;n 7 s&agrave; lan khai th&aacute;c được khoảng 300 m3 đất s&eacute;t, c&ocirc;ng an đ&atilde; thu giữ 3 th&ugrave;ng hồ sơ, sổ s&aacute;ch giao nhận, mua b&aacute;n của những người li&ecirc;n quan. Đồng thời đ&atilde; lập bi&ecirc;n bản, &aacute;p tải, điều 7 s&agrave; lan n&ecirc;u tr&ecirc;n về neo đậu v&agrave; giao chủ phương tiện, người đại diện quản l&yacute;.</p>', 4, 'Chưa được duyệt', 300, '2020-06-28 18:45:50', 0, 'https://nld.mediacdn.vn/thumb_w/684/2020/3/29/dat-set-15854610872051862084438.jpg', 1);
INSERT INTO `newspapers` (`IDPage`, `Title`, `TinyContent`, `Content`, `CatID`, `Status`, `View`, `Day`, `Premium`, `ImgAvatar`, `Author`) VALUES
(38, 'Khai thác khoáng sản, đồi núi tan hoang', 'Đã hết hạn khai thác, dừng hoạt động từ nhiều năm nay nhưng hàng loạt mỏ khoáng sản trên địa bàn tỉn', '<p>Huyện Quỳ Hợp, tỉnh Nghệ An v&agrave;o những giai đoạn cao điểm c&oacute; tới h&agrave;ng trăm điểm khai th&aacute;c đ&aacute;, quặng. Tuy nhi&ecirc;n, hiện nay, do chi ph&iacute; sản xuất cao, đầu ra gặp kh&oacute; khăn n&ecirc;n h&agrave;ng loạt doanh nghiệp đ&oacute;ng cửa mỏ, ngừng hoạt động nhưng kh&ocirc;ng phục hồi m&ocirc;i trường.</p>\r\n<p>Hệ quả, tại c&aacute;c x&atilde; Ch&acirc;u Quang, Ch&acirc;u Lộc, Ch&acirc;u Th&agrave;nh, Ch&acirc;u Hồng..., đồi n&uacute;i bị c&agrave;y xới tan hoang, nham nhở. B&aacute;o động nhất l&agrave; một số mỏ khai th&aacute;c đ&aacute; hết hạn, ngừng hoạt động dẫn đến t&igrave;nh trạng c&aacute;c ngọn n&uacute;i bị đục kho&eacute;t gần hết phần ch&acirc;n, c&aacute;c khối đ&aacute; lớn c&oacute; nguy cơ đổ sập xuống ph&iacute;a dưới đe dọa sự an to&agrave;n của người d&acirc;n. Chị Vi Thị Hoa, ngụ x&atilde; Ch&acirc;u Quang, cho biết: \"Họ ngừng hoạt động rồi nhưng mỗi lần đi qua khu vực c&oacute; mỏ đ&aacute;, t&ocirc;i vẫn cứ sợ. Nhiều tảng đ&aacute; lớn ở tr&ecirc;n n&uacute;i kh&ocirc;ng biết lăn xuống l&uacute;c n&agrave;o\".</p>\r\n<p>Tại x&atilde; Tri Lễ, huyện miền n&uacute;i Quế Phong, tỉnh Nghệ An, trước đ&acirc;y c&oacute; 4 doanh nghiệp được cấp ph&eacute;p khai th&aacute;c quặng sắt gồm: C&ocirc;ng ty TNHH X&acirc;y lắp tổng hợp miền Trung, C&ocirc;ng ty CP L&acirc;m Lệ Phong, C&ocirc;ng ty CP Đầu tư x&acirc;y dựng - Ph&aacute;t triển n&ocirc;ng th&ocirc;n 171 v&agrave; C&ocirc;ng ty TNHH Ngọc S&aacute;ng. Đến nay, c&aacute;c doanh nghiệp n&agrave;y đ&atilde; dừng hoạt động, để lại h&agrave;ng loạt hầm - hố s&acirc;u hoắm v&agrave; những n&uacute;i b&ugrave;n thải, đất thải. Nguy hiểm nhất l&agrave; c&aacute;c mỏ đều ở tr&ecirc;n n&uacute;i cao, do kh&ocirc;ng thực hiện c&ocirc;ng t&aacute;c ho&agrave;n thổ n&ecirc;n trở th&agrave;nh c&aacute;c \"t&uacute;i nước\" đe dọa sự an to&agrave;n của người d&acirc;n khi xảy ra mưa, lũ. &Ocirc;ng Vi Văn Nam, ngụ x&atilde; Tri Lễ, lo lắng: \"Nơi th&igrave; họ đ&agrave;o th&agrave;nh hố s&acirc;u hoắm, nơi th&igrave; đất đ&aacute; chất cao. Lo nhất l&agrave; những h&ocirc;m trời mưa to, nước - đất đ&aacute; ph&iacute;a tr&ecirc;n tr&agrave;n xuống c&oacute; thể cuốn tr&ocirc;i mọi thứ\".</p>\r\n<div class=\"VCSortableInPreviewMode\">\r\n<div><img id=\"img_8606c580-9310-11e7-822c-7ffdcb76f4ad\" title=\"Khai th&aacute;c kho&aacute;ng sản, đồi n&uacute;i tan hoang - Ảnh 1.\" src=\"https://nld.mediacdn.vn/2017/7-chot-7-1504708493515.jpg\" alt=\"Khai th&aacute;c kho&aacute;ng sản, đồi n&uacute;i tan hoang - Ảnh 1.\" width=\"\" height=\"\" data-original=\"https://nld.mediacdn.vn/2017/7-chot-7-1504708493515.jpg\" /></div>\r\n<div class=\"PhotoCMS_Caption\">\r\n<p data-placeholder=\"[nhập ch&uacute; th&iacute;ch]\">Nhiều mỏ ở huyện Quỳ Hợp, tỉnh Nghệ An chưa được cải tạo phục hồi m&ocirc;i trường</p>\r\n</div>\r\n</div>\r\n<p>Ở huyện Diễn Ch&acirc;u, tỉnh Nghệ An c&oacute; 8 mỏ<strong>&nbsp;kho&aacute;ng sản&nbsp;</strong>th&igrave; 6 mỏ đ&atilde; hết ph&eacute;p. Sau khi ngừng hoạt động, hầu hết c&aacute;c doanh nghiệp đ&atilde; kh&ocirc;ng thực hiện c&ocirc;ng t&aacute;c phục hồi m&ocirc;i trường. Điển h&igrave;nh l&agrave; c&aacute;c mỏ đất ở x&atilde; Diễn Đo&agrave;i, sau khi doanh nghiệp r&uacute;t đi để lại cả \"b&atilde;i chiến trường\" nham nhở với h&agrave;ng loạt hố s&acirc;u, g&acirc;y nguy hiểm cho người v&agrave; gia s&uacute;c sống quanh khu vực.</p>\r\n<p>Tại một số địa phương kh&aacute;c của tỉnh Nghệ An như c&aacute;c huyện Tương Dương, Hưng Nguy&ecirc;n, Nam Đ&agrave;n, Nghi Lộc, Nghĩa Đ&agrave;n..., t&igrave;nh trạng doanh nghiệp \"qu&ecirc;n\" ho&agrave;n thổ, phục hồi m&ocirc;i trường cũng diễn ra kh&aacute; phổ biến.</p>\r\n<p>Theo thống k&ecirc; của c&aacute;c cơ quan chức năng tỉnh Nghệ An, địa phương n&agrave;y c&oacute; tr&ecirc;n 140 mỏ kho&aacute;ng sản đ&atilde; hết hạn khai th&aacute;c hoặc ngừng hoạt động, cần phải thực hiện c&aacute;c thủ tục đ&oacute;ng cửa, cải tạo phục hồi m&ocirc;i trường theo quy định. Thế nhưng, hầu hết c&aacute;c chủ mỏ sau khi dừng hoạt động đều \"qu&ecirc;n\" nghĩa vụ phục hồi m&ocirc;i trường.</p>\r\n<p>&Ocirc;ng Nguyễn Quốc L&acirc;m, Trưởng Ph&ograve;ng T&agrave;i nguy&ecirc;n v&agrave; M&ocirc;i trường huyện Quế Phong, cho biết: \"Khi khai th&aacute;c, doanh nghiệp đ&agrave;o cả quả n&uacute;i, giờ họ ngừng hoạt động với &iacute;t tiền k&yacute; quỹ để lại th&igrave; kh&ocirc;ng thể phục hồi m&ocirc;i trường như ban đầu. Giải ph&aacute;p trước mắt m&agrave; huyện c&oacute; thể l&agrave;m l&agrave; xử l&yacute; những điểm n&agrave;o qu&aacute; nguy hiểm, c&oacute; nguy cơ sập, g&acirc;y ảnh hưởng trực tiếp đến đời sống người d&acirc;n\".</p>\r\n<p>Trong khi đ&oacute;, &ocirc;ng L&ecirc; Sỹ H&agrave;o, Trưởng Ph&ograve;ng T&agrave;i nguy&ecirc;n v&agrave; M&ocirc;i trường huyện Quỳ Hợp, khẳng định tr&ecirc;n địa b&agrave;n, một số doanh nghiệp thực hiện chưa tốt việc phục hồi m&ocirc;i trường. Đo&agrave;n kiểm tra của huyện, tỉnh đ&atilde; l&agrave;m việc với một số doanh nghiệp v&agrave; y&ecirc;u cầu phải thực hiện đ&uacute;ng như cam kết. Đơn vị n&agrave;o kh&ocirc;ng chịu thực hiện, nếu c&oacute; nhu cầu xin ph&eacute;p cấp mỏ lại th&igrave; tỉnh sẽ kh&ocirc;ng đồng &yacute;.</p>\r\n<div id=\"ObjectBoxContent_1504708940028\" class=\"VCSortableInPreviewMode alignCenter\" data-back=\"#FFFEC7\" data-border=\"#999\">\r\n<div>\r\n<p><strong>Ch&acirc;y &igrave;, kh&ocirc;ng k&yacute; quỹ</strong></p>\r\n<p>Thời gian qua, c&aacute;c ng&agrave;nh chức năng tỉnh Nghệ An đ&atilde; kiểm tra, xử phạt h&agrave;ng loạt doanh nghiệp khai th&aacute;c kho&aacute;ng sản kh&ocirc;ng phục hồi m&ocirc;i trường. Ngo&agrave;i ra, tỉnh c&ograve;n thường xuy&ecirc;n đ&ocirc;n đốc, y&ecirc;u cầu c&aacute;c doanh nghiệp phải thực hiện k&yacute; quỹ, cải tạo phục hồi m&ocirc;i trường. Tuy nhi&ecirc;n, t&iacute;nh tới th&aacute;ng 4-2017, vẫn c&ograve;n 33 tổ chức/34 điểm mỏ ch&acirc;y &igrave;, kh&ocirc;ng thực hiện k&yacute; quỹ.</p>\r\n</div>\r\n</div>', 4, 'Chưa được duyệt', 200, '2020-06-28 18:49:10', 0, 'https://nld.mediacdn.vn/2017/7-chot-7-1504708493515.jpg', 1),
(39, 'Doanh nghiệp khai thác đá kêu cứu', 'Khai khoáng sai chiến lược, phí tài nguyên\r\n“Chảy máu” tài nguyên: Khai thác lậu, trốn đóng thuế', '<p>Một số doanh nghiệp (DN) đang hoạt động phải đối diện nguy cơ ph&aacute; sản khi c&aacute;c loại ph&iacute;, thuế t&agrave;i nguy&ecirc;n tăng l&ecirc;n gấp 3-4 lần theo Th&ocirc;ng tư 44/2017 của Bộ T&agrave;i ch&iacute;nh.</p>\r\n<p><strong>Kh&oacute; đủ đường</strong></p>\r\n<p>Th&aacute;ng 6-2017, Hiệp hội C&aacute;c DN nhỏ v&agrave; vừa tại huyện Quỳ Hợp, tỉnh Nghệ An đ&atilde; c&oacute; đơn gửi Thủ tướng Ch&iacute;nh phủ v&agrave; c&aacute;c bộ, ng&agrave;nh li&ecirc;n quan kiến nghị xem x&eacute;t giải quyết kh&oacute; khăn, vướng mắc khi thực hiện Th&ocirc;ng tư 44/2017 về khung gi&aacute; t&iacute;nh thuế t&agrave;i nguy&ecirc;n kho&aacute;ng sản.</p>\r\n<p>Theo đ&oacute;, nếu thu theo Th&ocirc;ng tư 44 sẽ đẩy mức thuế t&agrave;i nguy&ecirc;n v&agrave; tiền cấp quyền khai th&aacute;c kho&aacute;ng sản l&ecirc;n gấp 3-4 lần. Việc tăng thu thuế với mức cao trong một thời gian ngắn như vậy sẽ khiến nhiều DN đối diện nguy cơ ngừng sản xuất, ph&aacute; sản.</p>\r\n<div class=\"VCSortableInPreviewMode\">\r\n<div><img id=\"img_bef94340-60c5-11e7-b531-d568978fc04f\" title=\"Doanh nghiệp khai th&aacute;c đ&aacute; k&ecirc;u cứu - Ảnh 1.\" src=\"https://nld.mediacdn.vn/2017/11-chot-11-1499178805640.jpg\" alt=\"Doanh nghiệp khai th&aacute;c đ&aacute; k&ecirc;u cứu - Ảnh 1.\" width=\"\" height=\"\" data-original=\"https://nld.mediacdn.vn/2017/11-chot-11-1499178805640.jpg\" /></div>\r\n<div class=\"PhotoCMS_Caption\">\r\n<p data-placeholder=\"[nhập ch&uacute; th&iacute;ch]\">Hoạt động của c&aacute;c doanh nghiệp&nbsp;khai th&aacute;c đ&aacute;&nbsp;gặp kh&oacute; khăn nếu mức thuế tăng l&ecirc;n 3-4 lần</p>\r\n</div>\r\n</div>\r\n<p>&Ocirc;ng Nguyễn Trung Hải - Chủ tịch HĐQT C&ocirc;ng ty CP Kho&aacute;ng sản v&agrave; Thương mại Trung Hải - Nghệ An, cho biết: \"Hiện nay, tr&ecirc;n địa b&agrave;n huyện Quỳ Hợp c&oacute; 36 DN được cấp ph&eacute;p&nbsp;<strong>khai th&aacute;c đ&aacute;</strong>. Do hoạt động kh&oacute; khăn, 26 đơn vị đ&atilde; ngừng hoạt động; trong 10 đơn vị c&ograve;n lại, chỉ một số hoạt động hiệu quả c&ograve;n hầu hết sản xuất cầm chừng. Nếu thuế tăng l&ecirc;n gấp 3-4 lần th&igrave; sẽ c&agrave;ng c&oacute; th&ecirc;m nhiều DN ngừng hoạt động\".</p>\r\n<p>Theo &ocirc;ng Hải, với c&aacute;ch t&iacute;nh thuế mới của Th&ocirc;ng tư 44, c&ocirc;ng ty &ocirc;ng phải đ&oacute;ng th&ecirc;m 21,6 tỉ đồng. Việc phải đ&oacute;ng một khoản tiền lớn như vậy sẽ khiến chi ph&iacute; sản xuất tăng cao, h&agrave;ng l&agrave;m ra kh&ocirc;ng b&aacute;n được, DN c&agrave;ng hoạt động c&agrave;ng thua lỗ.</p>\r\n<p>&Ocirc;ng Chhagan Lal Patel, Gi&aacute;m đốc điều h&agrave;nh C&ocirc;ng ty CP Sản xuất - Thương mại Quang Long (một DN Ấn Độ đang khai th&aacute;c mỏ tại huyện Quỳ Hợp), lo lắng: \"Đ&aacute; xấu, khai th&aacute;c ra b&aacute;n kh&ocirc;ng được, nếu thuế tăng nữa th&igrave; chắc chắn DN sẽ ph&aacute; sản, ch&uacute;ng t&ocirc;i phải bỏ về nước th&ocirc;i\".</p>\r\n<p>Theo c&aacute;c DN khai th&aacute;c đ&aacute; tr&ecirc;n địa b&agrave;n, hiện c&aacute;c nước Trung Quốc, Malaysia đang cạnh tranh thị phần với DN Việt Nam trong việc xuất khẩu đ&aacute; trắng. Nếu thuế tăng, gi&aacute; th&agrave;nh sản phẩm sẽ tăng l&ecirc;n, l&uacute;c đ&oacute; đ&aacute; của Việt Nam kh&oacute; c&oacute; thể xuất ra nước ngo&agrave;i.</p>\r\n<p>\"Đơn gi&aacute; đ&aacute; ốp xuất khẩu hiện khoảng 280.000 đồng/m2, nếu &aacute;p ở mức tăng thấp nhất theo Th&ocirc;ng tư 44 th&igrave; b&igrave;nh qu&acirc;n mỗi m2 phải tăng th&ecirc;m khoảng 30.000 đồng. Gi&aacute; th&agrave;nh sản phẩm tăng cao như vậy th&igrave; kh&ocirc;ng thể cạnh tranh được tr&ecirc;n thị trường quốc tế\" - &ocirc;ng Chu Đức Mạnh, C&ocirc;ng ty CP X&acirc;y dựng v&agrave; Hợp t&aacute;c đầu tư Đất Việt, ph&acirc;n t&iacute;ch.</p>\r\n<p><strong>H&agrave;ng chục ng&agrave;n lao động sẽ mất việc l&agrave;m</strong></p>\r\n<p>Theo thống k&ecirc; của Hiệp hội C&aacute;c DN nhỏ v&agrave; vừa tại huyện Quỳ Hợp, nếu mức thu thuế như Th&ocirc;ng tư 44 được &aacute;p dụng, c&oacute; tới 95% DN tr&ecirc;n địa b&agrave;n rơi v&agrave;o t&igrave;nh cảnh ph&aacute; sản, h&agrave;ng chục ng&agrave;n lao động địa phương đối diện nguy cơ mất việc. &Ocirc;ng Ho&agrave;ng Văn Sơn, Gi&aacute;m đốc C&ocirc;ng ty CP An Sơn, băn khoăn: \"Hơn 90% sản phẩm đ&aacute; của c&ocirc;ng ty đều xuất khẩu, nếu c&aacute;ch t&iacute;nh thuế mới được &aacute;p dụng th&igrave; DN kh&ocirc;ng trụ nổi. Ch&uacute;ng t&ocirc;i ngừng hoạt động th&igrave; hơn 300 c&ocirc;ng nh&acirc;n đang l&agrave;m việc sẽ kh&ocirc;ng biết về đ&acirc;u\".</p>\r\n<p>&Ocirc;ng Nguyễn Th&agrave;nh Trung, Gi&aacute;m đốc C&ocirc;ng ty TNHH Th&agrave;nh Trung, trăn trở: \"Người d&acirc;n Quỳ Hợp l&acirc;u nay sống phụ thuộc v&agrave;o c&aacute;c mỏ đ&aacute;, nh&agrave; m&aacute;y chế biến đ&aacute;. Nếu c&aacute;c DN khai th&aacute;c đ&aacute; gặp kh&oacute;, phải ngừng hoạt động th&igrave; sẽ c&oacute; h&agrave;ng ng&agrave;n người mất việc l&agrave;m, nhiều gia đ&igrave;nh l&acirc;m v&agrave;o cảnh khốn kh&oacute;\".</p>\r\n<p>Theo &ocirc;ng Nguyễn Đ&igrave;nh T&ugrave;ng, Chủ tịch UBND huyện Quỳ Hợp, hiện c&aacute;c DN khai th&aacute;c kho&aacute;ng sản, đặc biệt l&agrave; đ&aacute; trắng, tr&ecirc;n địa b&agrave;n rất kh&oacute; khăn, nhiều đơn vị đ&atilde; phải ngừng hoạt động. Một số DN c&ograve;n nợ đọng thuế kh&oacute; c&oacute; khả năng chi trả, nếu c&ograve;n tăng thuế theo Th&ocirc;ng tư 44 th&igrave; họ sẽ kh&oacute; trụ được. Huyện mong cấp tr&ecirc;n c&oacute; ch&iacute;nh s&aacute;ch hợp l&yacute;, tạo điều kiện cho DN của địa phương ph&aacute;t triển ổn định\".</p>\r\n<div id=\"ObjectBoxContent_1499181063515\" class=\"VCSortableInPreviewMode alignCenter\" data-back=\"#FFFEC7\" data-border=\"#999\">\r\n<div>\r\n<p>Doanh nghiệp đồng loạt kiến nghị</p>\r\n<p>Nghệ An v&agrave; Y&ecirc;n B&aacute;i l&agrave; 2 địa phương c&oacute; trữ lượng đ&aacute; hoa trắng lớn nhất nước. Trước th&ocirc;ng tin mức thu thuế t&agrave;i nguy&ecirc;n kho&aacute;ng sản tăng l&ecirc;n 3-4 lần, Hội Đ&aacute; trắng tỉnh Y&ecirc;n B&aacute;i cũng đ&atilde; c&oacute; c&ocirc;ng văn gửi Ch&iacute;nh phủ v&agrave; c&aacute;c bộ, ng&agrave;nh li&ecirc;n quan kiến nghị xem x&eacute;t lại.</p>\r\n</div>\r\n</div>', 4, 'Chưa được duyệt', 100, '2020-06-28 18:51:35', 1, 'https://nld.mediacdn.vn/2017/11-chot-11-1499178805640.jpg', 1);

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
-- Table structure for table `referencetagsnews`
--

CREATE TABLE `referencetagsnews` (
  `ID` int(11) NOT NULL,
  `IDPage` int(11) DEFAULT NULL,
  `IDTags` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `referencetagsnews`
--

INSERT INTO `referencetagsnews` (`ID`, `IDPage`, `IDTags`) VALUES
(1, 31, 42),
(4, 35, 46),
(5, 34, 45),
(6, 33, 44),
(7, 32, 43),
(9, 39, 50),
(10, 36, 47),
(11, 33, 44),
(12, 38, 48),
(13, 39, 49),
(14, 35, 2),
(15, 33, 4),
(16, 26, 1),
(17, 37, 49);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `TagName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDTags` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`TagName`, `IDTags`) VALUES
('Nông Sản', 1),
('Hải sản', 2),
('Gạo', 3),
('Tôm', 4),
('Dưa hấu', 5),
('Cua', 6),
('Đất', 7),
('NongSan', 38),
('CayTrong', 39),
('XuatKhau', 42),
('XangDau', 43),
('Tom', 44),
('Buoi', 45),
('CaTra', 46),
('Bo', 47),
('KhoangSanCat', 48),
('KhaiThac', 49),
('KhaiThacDa', 50);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `IDUser` int(20) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `Password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PermissionID` int(20) NOT NULL DEFAULT 4,
  `Duration` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Avatar` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '../../public/images/download.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`IDUser`, `Name`, `Email`, `DOB`, `Password`, `PermissionID`, `Duration`, `Avatar`) VALUES
(1, 'test', 'test@gmail.com', '2020-07-09', '12345678', 4, '2020-07-06 04:23:33', '../../public/images/download.jpg'),
(13, 'huuduc99', 'ducnguyen.27111999@gmail.com', '2020-07-06', '$2a$08$DhO.Dio5ztzBacaAUUvrWek7K5QW8HgZ04E/vFgnwaQhTma6u0u5u', 4, '2020-07-06 03:18:47', '../../public/images/download.jpg'),
(14, 'aBC', 'asc@gmail.com', '2020-07-15', '$2a$08$63U7nVwpBLhXwAik0klWdeWbb05DLbQQiCj/Av2fDi4Vk8jVBiHjK', 4, '2020-07-07 03:16:55', '../../public/images/download.jpg');

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
  ADD PRIMARY KEY (`IDComment`),
  ADD KEY `fk_comment_news` (`IDPage`),
  ADD KEY `fk_comment_user` (`IDUser`);

--
-- Indexes for table `newspapers`
--
ALTER TABLE `newspapers`
  ADD PRIMARY KEY (`IDPage`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`PermissionID`);

--
-- Indexes for table `referencetagsnews`
--
ALTER TABLE `referencetagsnews`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_rtn_tag` (`IDTags`),
  ADD KEY `fk_rtn_news` (`IDPage`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`IDTags`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDUser`),
  ADD KEY `fk_user_permission` (`PermissionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `IDComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `referencetagsnews`
--
ALTER TABLE `referencetagsnews`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `IDTags` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `IDUser` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_news` FOREIGN KEY (`IDPage`) REFERENCES `newspapers` (`IDPage`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`IDUser`) REFERENCES `users` (`IDUser`);

--
-- Constraints for table `referencetagsnews`
--
ALTER TABLE `referencetagsnews`
  ADD CONSTRAINT `fk_rtn_news` FOREIGN KEY (`IDPage`) REFERENCES `newspapers` (`IDPage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rtn_tag` FOREIGN KEY (`IDTags`) REFERENCES `tags` (`IDTags`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_permission` FOREIGN KEY (`PermissionID`) REFERENCES `permission` (`PermissionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
