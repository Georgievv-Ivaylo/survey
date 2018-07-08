-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.0.34-MariaDB-0ubuntu0.16.04.1 - Ubuntu 16.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for survey
CREATE DATABASE IF NOT EXISTS `survey` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `survey`;

-- Dumping structure for table survey.answered_questionnaires
CREATE TABLE IF NOT EXISTS `answered_questionnaires` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` mediumint(10) NOT NULL,
  `questionnaire_json` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table survey.answered_questionnaires: ~29 rows (approximately)
/*!40000 ALTER TABLE `answered_questionnaires` DISABLE KEYS */;
INSERT IGNORE INTO `answered_questionnaires` (`id`, `questionnaire_id`, `questionnaire_json`, `status`, `created`) VALUES
	(1, 2, '{"morbi":["4","1","3"],"vivamus":"4"}', 'active', '2018-07-03 20:51:51.011507'),
	(2, 2, '{"vivamus":"4","morbi":["2","1","4"]}', 'active', '2018-07-03 20:53:19.031881'),
	(3, 2, '{"vivamus":"4","konec":"5","morbi":["4","1","3"]}', 'active', '2018-07-03 20:59:04.439230'),
	(4, 3, '{"ut":"Test Text","morbi":["4","1","3"]}', 'active', '2018-07-03 21:24:52.943076'),
	(5, 3, '{"lorem":["5","3"],"morbi":["4","1","3"],"vivamus":"4","ut":"Test Text 2"}', 'active', '2018-07-03 21:30:18.102312'),
	(6, 3, '{"lorem":["3"],"konec":"5","vivamus":"1","ut":"&lt;h1&gt;Test Special Chars&lt;\\/h1&gt;"}', 'active', '2018-07-03 21:34:40.506396'),
	(7, 3, '{"lorem":["3"],"vivamus":"1","konec":"5","ut":"&lt;h2&gt;Test Print&lt;\\/h2&gt;"}', 'active', '2018-07-03 21:36:40.226222'),
	(8, 3, '{"lorem":["3"],"konec":"5","vivamus":"4","morbi":["4","1","3"],"ut":"&lt;h3&gt; Print test 2&lt;\\/h3&gt;"}', 'active', '2018-07-03 21:40:17.683174'),
	(9, 3, '{"lorem":["3","5","1"],"konec":"5","ut":"&lt;h4&gt; Print Test 3&lt;\\/h4&gt;"}', 'active', '2018-07-03 21:42:22.471827'),
	(10, 3, '{"lorem":["3"],"morbi":["4"],"ut":"&lt;h5&gt;Test return data&lt;\\/h5&gt;"}', 'active', '2018-07-03 21:48:07.998000'),
	(11, 3, '{"lorem":["5"],"morbi":["2","4"],"ut":"&lt;h1&gt; Test New Print&lt;\\/h1&gt;"}', 'active', '2018-07-03 21:56:29.156650'),
	(12, 3, '{"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:50:33.603955'),
	(13, 3, '{"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:51:04.880870'),
	(14, 3, '{"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:51:47.481618'),
	(15, 3, '{"morbi":["4","2"],"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:52:03.513457'),
	(16, 3, '{"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:53:33.933436'),
	(17, 3, '{"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:54:40.854748'),
	(18, 3, '{"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:55:16.349832'),
	(19, 3, '{"ut":"&lt;p&gt;Test&lt;\\/p&gt;"}', 'active', '2018-07-03 23:56:35.827679'),
	(20, 3, '{"ut":"&lt;h2&gt;Test&lt;\\/h2&gt;"}', 'active', '2018-07-04 00:02:49.378211'),
	(21, 3, '{"ut":"&lt;h1&gt;Bla&lt;\\/h1&gt;"}', 'active', '2018-07-04 00:14:39.187509'),
	(22, 3, '{"ut":"&lt;h1&gt;Bla&lt;\\/h1&gt;"}', 'active', '2018-07-04 00:15:52.741606'),
	(23, 3, '{"ut":"&lt;h1&gt;Bla&lt;\\/h1&gt;"}', 'active', '2018-07-04 00:16:31.959112'),
	(24, 3, '{"ut":"&lt;h1&gt;Bla&lt;\\/h1&gt;"}', 'active', '2018-07-04 00:17:06.419679'),
	(25, 3, '{"ut":"&lt;h1&gt;Bla&lt;\\/h1&gt;"}', 'active', '2018-07-04 00:18:25.016749'),
	(26, 3, '{"ut":"&lt;h2&gt;Test HTML&lt;\\/h2&gt;"}', 'active', '2018-07-04 00:25:13.425493'),
	(27, 3, '{"ut":"&lt;h2&gt;Test HTML&lt;\\/h2&gt;"}', 'active', '2018-07-04 00:25:51.732503'),
	(28, 1, '{"konec":"5"}', 'active', '2018-07-04 03:28:48.934574'),
	(29, 3, '[]', 'active', '2018-07-04 04:52:13.827583');
/*!40000 ALTER TABLE `answered_questionnaires` ENABLE KEYS */;

-- Dumping structure for table survey.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Checkbox',
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table survey.answers: ~6 rows (approximately)
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT IGNORE INTO `answers` (`id`, `name`, `title`, `type`, `status`) VALUES
	(1, 'proin', 'Proin ut molestie lorem.', 'Checkbox', 'active'),
	(2, 'aenean', 'Aenean eros tortor, viverra sit amet lacus non, pretium aliquet leo. Integer in luctus diam.', 'Checkbox', 'active'),
	(3, 'nullam', 'Nullam a pretium mi, in feugiat justo. Cras ac magna nec lectus iaculis hendrerit.', 'Checkbox', 'active'),
	(4, 'vivamus', 'Vivamus condimentum augue vitae libero scelerisque vulputate.', 'Radio', 'active'),
	(5, 'cras', 'Cras tristique eros at lectus rhoncus tristique.', 'Radio', 'active'),
	(6, 'pellentesque', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque iaculis feugiat nibh. Ut pharetra sem vel dolor varius, non suscipit lectus varius. Praesent eleifend est eget est lacinia fermentum. Nulla aliquet tortor et sapien euismod elementum. Nam non ullamcorper sapien. Sed ligula eros, aliquam a nisi et, ornare vehicula mi.', 'Text', 'active');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table survey.questionnaires
CREATE TABLE IF NOT EXISTS `questionnaires` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `questions_json` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table survey.questionnaires: ~4 rows (approximately)
/*!40000 ALTER TABLE `questionnaires` DISABLE KEYS */;
INSERT IGNORE INTO `questionnaires` (`id`, `title`, `questions_json`, `status`) VALUES
	(1, 'Type 1', '{\r\n  "questions": ["2"]\r\n}\r\n', 'active'),
	(2, 'Type 2', '{\r\n  "questions": ["2", "3", "4"]\r\n}', 'active'),
	(3, 'Type 3', '{\r\n  "questions": ["1", "2", "3", "4", "5"]\r\n}', 'active'),
	(4, 'Type 4', '{\r\n  "questions": ["1", "4"]\r\n}', 'active');
/*!40000 ALTER TABLE `questionnaires` ENABLE KEYS */;

-- Dumping structure for table survey.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `answers_json` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'checkbox',
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table survey.questions: ~5 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT IGNORE INTO `questions` (`id`, `name`, `title`, `answers_json`, `type`, `status`) VALUES
	(1, 'lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit:', '[\r\n  {\r\n    "id": "1",\r\n    "connected_questions": ["3", "4"]\r\n  },\r\n  {\r\n    "id": "3",\r\n    "connected_questions": ["6"]\r\n  },\r\n  {\r\n    "id": "5",\r\n    "connected_questions": []\r\n  }\r\n]', 'Checkbox', 'active'),
	(2, 'konec', 'Konec consectetur, mauris porta consectetur malesuada, sem diam porta leo, in hendrerit augue dui in lectus:', '[\r\n  {\r\n    "id": "5",\r\n    "connected_questions": []\r\n  }\r\n]\r\n', 'Mixed', 'active'),
	(3, 'vivamus', 'Vivamus luctus eleifend eros a gravida. Praesent at dui odio. Etiam ut ex quis massa convallis pulvinar. Aliquam condimentum pretium porta:', '[\r\n  {\r\n    "id": "2",\r\n    "connected_questions": ["4"]\r\n  },\r\n  {\r\n    "id": "4",\r\n    "connected_questions": []\r\n  },\r\n  {\r\n    "id": "1",\r\n    "connected_questions": ["4"]\r\n  }\r\n]', 'Radio', 'active'),
	(4, 'morbi', 'Morbi maximus aliquet fermentum. Etiam volutpat quam varius, commodo orci vel, semper purus:', '[\r\n  {\r\n    "id": "2",\r\n    "connected_questions": ["5"]\r\n  },\r\n  {\r\n    "id": "4",\r\n    "connected_questions": ["5"]\r\n  },\r\n  {\r\n    "id": "1",\r\n    "connected_questions": ["5"]\r\n  },\r\n  {\r\n    "id": "3",\r\n    "connected_questions": ["5"]\r\n  },\r\n  {\r\n    "id": "5",\r\n    "connected_questions": ["5"]\r\n  }\r\n]', 'Mixed', 'active'),
	(5, 'ut', 'Ut iaculis suscipit neque id venenatis. Fusce pharetra elit vel risus ornare, a rhoncus nulla elementum. Etiam vitae sapien ex:', '', 'Text', 'active');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
