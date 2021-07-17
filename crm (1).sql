-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 10, 2021 lúc 08:59 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `crm`
--
CREATE DATABASE crm;
USE crm;
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(10) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Description` text NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `adm`
--

CREATE TABLE `adm` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pwd` varchar(300) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `create_at` date NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `competitors`
--

CREATE TABLE `competitors` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `potential` varchar(100) NOT NULL,
  `their_policy` text NOT NULL,
  `their_advantage` text NOT NULL,
  `information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `contact_lead_id` int(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contract_status` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `d_order`
--

CREATE TABLE `d_order` (
  `id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `ord_qoute_id` int(10) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `toltal` decimal(10,0) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
  `invoices_order_id` int(10) NOT NULL,
  `toltal` decimal(10,0) NOT NULL,
  `create_at` datetime NOT NULL,
  `buyer_name` varchar(200) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lead`
--

CREATE TABLE `lead` (
  `id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lead_status` varchar(100) NOT NULL,
  `products_purchased` int(10) NOT NULL COMMENT 'lượng san pham dã mua',
  `other_information` varchar(400) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `membership`
--

CREATE TABLE `membership` (
  `id` int(10) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(300) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `pwd` varchar(200) NOT NULL,
  `position` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `opportunity`
--

CREATE TABLE `opportunity` (
  `id` int(10) NOT NULL,
  `opp_title` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `opp_detail` varchar(500) NOT NULL,
  `date_created` date NOT NULL,
  `end_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `information_products` text NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quote`
--

CREATE TABLE `quote` (
  `id` int(10) NOT NULL,
  `quote_pro_id` int(10) NOT NULL,
  `quote_detail` varchar(400) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_management`
--

CREATE TABLE `service_management` (
  `id` int(10) NOT NULL,
  `email_sender` varchar(300) NOT NULL,
  `name_sender` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `question` text NOT NULL,
  `status` varchar(150) NOT NULL,
  `send_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `competitors`
--
ALTER TABLE `competitors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `d_order`
--
ALTER TABLE `d_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `ord_qoute_id` (`ord_qoute_id`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id` (`invoices_order_id`);

--
-- Chỉ mục cho bảng `lead`
--
ALTER TABLE `lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `opportunity`
--
ALTER TABLE `opportunity`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_pro_id` (`quote_pro_id`);

--
-- Chỉ mục cho bảng `service_management`
--
ALTER TABLE `service_management`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lead`
--
ALTER TABLE `lead`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `d_order`
--
ALTER TABLE `d_order`
  ADD CONSTRAINT `d_order_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `d_order_ibfk_2` FOREIGN KEY (`ord_qoute_id`) REFERENCES `quote` (`id`);

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`invoices_order_id`) REFERENCES `d_order` (`id`);

--
-- Các ràng buộc cho bảng `lead`
--
ALTER TABLE `lead`
  ADD CONSTRAINT `lead_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `lead_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `quote`
--
ALTER TABLE `quote`
  ADD CONSTRAINT `quote_ibfk_1` FOREIGN KEY (`quote_pro_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
