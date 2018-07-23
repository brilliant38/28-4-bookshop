-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- bookshop 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `bookshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookshop`;


-- 테이블 bookshop의 구조를 덤프합니다. admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_no` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(50) NOT NULL,
  `admin_pw` varchar(50) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_date` datetime NOT NULL,
  PRIMARY KEY (`admin_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.admin: ~0 rows (대략적)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. book
CREATE TABLE IF NOT EXISTS `book` (
  `book_no` int(10) NOT NULL AUTO_INCREMENT,
  `bookcode_no` int(10) NOT NULL,
  `publisher_no` int(10) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `book_author` varchar(50) NOT NULL,
  `book_price` int(11) NOT NULL,
  `book_point` int(11) NOT NULL,
  `book_amount` int(11) NOT NULL,
  `book_out` varchar(50) NOT NULL,
  `book_date` datetime NOT NULL,
  PRIMARY KEY (`book_no`),
  KEY `FK_book_bookcode` (`bookcode_no`),
  KEY `FK_book_publisher` (`publisher_no`),
  CONSTRAINT `FK_book_bookcode` FOREIGN KEY (`bookcode_no`) REFERENCES `bookcode` (`bookcode_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_book_publisher` FOREIGN KEY (`publisher_no`) REFERENCES `publisher` (`publisher_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.book: ~0 rows (대략적)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`book_no`, `bookcode_no`, `publisher_no`, `book_name`, `book_author`, `book_price`, `book_point`, `book_amount`, `book_out`, `book_date`) VALUES
	(1, 2, 2, '초경량 비행장치 드론실기 및 구술시험', '박장환', 25200, 2520, 20, '판매중', '2018-07-23 14:22:24'),
	(2, 1, 1, '진달래꽃', '김소월', 5000, 500, 20, '판매중', '2018-07-23 14:56:55'),
	(3, 3, 3, '물류창고', '이수명', 7200, 720, 5, '판매중', '2018-07-23 15:12:18'),
	(4, 4, 4, '댄 애리얼리 부의 감각', '댄 애리얼리', 16200, 1620, 10, '판매중', '2018-07-23 15:12:55'),
	(5, 5, 5, '적을 만들지 않는 대화법', '샘혼', 15300, 1530, 10, '판매중', '2018-07-23 15:13:18'),
	(6, 6, 6, '아파도 아프다 하지 못하면', '최기홍', 13500, 1350, 10, '판매중', '2018-07-23 15:13:52'),
	(7, 7, 7, '신사와 선비', '백승종', 15300, 1530, 10, '판매중', '2018-07-23 15:14:34'),
	(8, 8, 7, '보수의 민낯', '장성철', 14400, 1440, 10, '판매중', '2018-07-23 15:14:50'),
	(9, 9, 9, '클래식 음악 연표', '김동연', 8550, 855, 10, '판매중', '2018-07-23 15:15:23'),
	(10, 10, 10, '숨기지 마라', '송준기', 13500, 1350, 10, '판매중', '2018-07-23 15:15:46'),
	(11, 11, 11, '씽씽 한글 버스', '공해지', 24500, 2450, 10, '판매중', '2018-07-23 15:16:09'),
	(12, 12, 12, '세계 지리와 문화', '알렉스프리스', 12600, 1260, 10, '판매중', '2018-07-23 15:16:37'),
	(13, 13, 1, '고단백 저탄수화물 다이어트 레시피', '박지우', 13500, 1350, 10, '판매중', '2018-07-23 15:17:04'),
	(14, 14, 2, '월요단식', '세키구치마사루', 10800, 1080, 10, '판매중', '2018-07-23 15:18:02'),
	(15, 15, 3, '식물을 들이다', '최정윤', 15120, 1512, 10, '판매중', '2018-07-23 15:19:00'),
	(16, 16, 4, '강원도 여행백서', '강정임', 14400, 1440, 10, '판매중', '2018-07-23 15:19:19'),
	(17, 17, 5, '악필 손글씨 교정노트', '시사정보연구원', 4500, 450, 10, '판매중', '2018-07-23 15:19:45'),
	(18, 18, 6, '동아 새국어사전', '편집부', 39600, 3960, 10, '판매중', '2018-07-23 15:20:07'),
	(19, 19, 7, '스마트스토어', '김덕주', 11970, 1197, 10, '판매중', '2018-07-23 15:20:34'),
	(20, 20, 8, '혼자공부법', '송용섭', 12600, 1260, 10, '판매중', '2018-07-23 15:21:03'),
	(21, 21, 9, '고1 수학 총정리 한권으로 끝내기', '고희권', 15300, 1530, 10, '판매중', '2018-07-23 15:21:32'),
	(22, 22, 10, '법률저널 LEET 전국 봉투 모의고사 6회', '법률저널', 45000, 4500, 10, '판매중', '2018-07-23 15:21:55'),
	(23, 23, 11, '원피스', '오다에이치로', 4500, 450, 10, '판매중', '2018-07-23 15:22:39'),
	(24, 24, 12, '게이머즈 Gamer\'z 2018.7', '편집부', 13110, 1311, 10, '판매중', '2018-07-23 15:23:06');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. bookcode
CREATE TABLE IF NOT EXISTS `bookcode` (
  `bookcode_no` int(10) NOT NULL AUTO_INCREMENT,
  `bookcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`bookcode_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.bookcode: ~24 rows (대략적)
/*!40000 ALTER TABLE `bookcode` DISABLE KEYS */;
INSERT INTO `bookcode` (`bookcode_no`, `bookcode_name`) VALUES
	(1, '소설'),
	(2, '과학/공학'),
	(3, '시/에세이'),
	(4, '경제/경영'),
	(5, '자기계발'),
	(6, '인문'),
	(7, '역사/문화'),
	(8, '사회'),
	(9, '예술/대중문화'),
	(10, '종교'),
	(11, '유아'),
	(12, '어린이'),
	(13, '가정/생활/요리'),
	(14, '건강'),
	(15, '취미/레저'),
	(16, '여행/지도'),
	(17, '국어/외국어'),
	(18, '사전'),
	(19, '컴퓨터/IT'),
	(20, '청소년'),
	(21, '학습/참고서'),
	(22, '취업/수험서'),
	(23, '만화'),
	(24, '잡지');
/*!40000 ALTER TABLE `bookcode` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. bookintro
CREATE TABLE IF NOT EXISTS `bookintro` (
  `bookintro_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `bookintro_content` text NOT NULL,
  `bookintro_writer` varchar(50) NOT NULL,
  PRIMARY KEY (`bookintro_no`),
  KEY `FK_bookintro_book` (`book_no`),
  CONSTRAINT `FK_bookintro_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.bookintro: ~0 rows (대략적)
/*!40000 ALTER TABLE `bookintro` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookintro` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. bookreview
CREATE TABLE IF NOT EXISTS `bookreview` (
  `bookreview_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `member_no` int(10) NOT NULL,
  `bookreview_content` text NOT NULL,
  PRIMARY KEY (`bookreview_no`),
  KEY `FK_bookreview_book` (`book_no`),
  KEY `FK_bookreview_member` (`member_no`),
  CONSTRAINT `FK_bookreview_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bookreview_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.bookreview: ~0 rows (대략적)
/*!40000 ALTER TABLE `bookreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookreview` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `member_pw` varchar(50) NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `member_addr` varchar(50) NOT NULL,
  `member_point` varchar(50) NOT NULL,
  `member_date` datetime NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.member: ~0 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. memberinter
CREATE TABLE IF NOT EXISTS `memberinter` (
  `memberinter_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `bookcode_no` int(10) NOT NULL,
  PRIMARY KEY (`memberinter_no`),
  KEY `FK_memberinter_member` (`member_no`),
  KEY `FK_memberinter_bookcode` (`bookcode_no`),
  CONSTRAINT `FK_memberinter_bookcode` FOREIGN KEY (`bookcode_no`) REFERENCES `bookcode` (`bookcode_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_memberinter_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.memberinter: ~0 rows (대략적)
/*!40000 ALTER TABLE `memberinter` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberinter` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `member_no` int(10) NOT NULL,
  `orders_price` int(10) NOT NULL,
  `orders_amount` int(10) NOT NULL,
  `orders_date` datetime NOT NULL,
  `orders_addr` varchar(50) NOT NULL,
  `orders_state` varchar(50) NOT NULL,
  PRIMARY KEY (`orders_no`),
  KEY `FK_orders_book` (`book_no`),
  KEY `FK_orders_member` (`member_no`),
  CONSTRAINT `FK_orders_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_orders_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.orders: ~0 rows (대략적)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. publisher
CREATE TABLE IF NOT EXISTS `publisher` (
  `publisher_no` int(10) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(50) NOT NULL,
  `publisher_website` varchar(50) NOT NULL,
  PRIMARY KEY (`publisher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='출판사';

-- Dumping data for table bookshop.publisher: ~12 rows (대략적)
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` (`publisher_no`, `publisher_name`, `publisher_website`) VALUES
	(1, '동아출판사', 'http://www.dongapublishing.com/main.donga'),
	(2, '길벗출판사', 'https://www.gilbut.co.kr/'),
	(3, '삼성출판사', 'www.mylittletiger.co.kr/'),
	(4, '교원출판사', 'www.kyowon.co.kr/'),
	(5, '미래엔', 'https://www.mirae-n.com/'),
	(6, '금성출판사', 'kumsung.co.kr/'),
	(7, '와이비엠', 'www.ybmnet.co.kr/'),
	(8, '비상교육', 'www.visang.com/'),
	(9, '천재교과서', 'www.chunjae.co.kr/'),
	(10, '프린피아', 'prinpia.net/'),
	(11, '좋은책신사고', 'www.sinsago.co.kr/'),
	(12, '엔이능률', 'www.neungyule.com/');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. qna
CREATE TABLE IF NOT EXISTS `qna` (
  `qna_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `qna_title` varchar(50) NOT NULL,
  `qna_content` varchar(50) NOT NULL,
  `qna_date` datetime NOT NULL,
  PRIMARY KEY (`qna_no`),
  KEY `FK_qna_member` (`member_no`),
  CONSTRAINT `FK_qna_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.qna: ~0 rows (대략적)
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. qna_comment
CREATE TABLE IF NOT EXISTS `qna_comment` (
  `qna_comment_no` int(10) NOT NULL AUTO_INCREMENT,
  `qna_no` int(10) NOT NULL,
  `admin_no` int(11) NOT NULL,
  `comment_content` varchar(50) NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`qna_comment_no`),
  KEY `FK_qna_comment_admin` (`admin_no`),
  KEY `FK_qna_comment_qna` (`qna_no`),
  CONSTRAINT `FK_qna_comment_admin` FOREIGN KEY (`admin_no`) REFERENCES `admin` (`admin_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_qna_comment_qna` FOREIGN KEY (`qna_no`) REFERENCES `qna` (`qna_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.qna_comment: ~0 rows (대략적)
/*!40000 ALTER TABLE `qna_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna_comment` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. shoppingcart
CREATE TABLE IF NOT EXISTS `shoppingcart` (
  `shoppingcart_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `member_no` int(10) NOT NULL,
  `shoppingcart_amount` int(10) NOT NULL,
  `shoppingcart_price` int(10) NOT NULL,
  `shoppingcart_date` datetime NOT NULL,
  PRIMARY KEY (`shoppingcart_no`),
  KEY `FK_shoppingcart_book` (`book_no`),
  KEY `FK_shoppingcart_member` (`member_no`),
  CONSTRAINT `FK_shoppingcart_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_shoppingcart_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.shoppingcart: ~0 rows (대략적)
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
