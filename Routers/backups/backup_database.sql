/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_notifications
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_payment_record
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_payment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount_paid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `PTA` int(11) NOT NULL,
  `lesson` int(11) NOT NULL,
  `tuition` int(11) NOT NULL,
  `expected_payment` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `term` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `session` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DOG` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DOP` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `balance_date` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `keyid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_for` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `accountant` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 68 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes` varchar(3500) COLLATE utf8mb4_bin DEFAULT NULL,
  `current_session` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sessions` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `current_term` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `terms` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `fees` varchar(3500) COLLATE utf8mb4_bin DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_for` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `backup_date` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_students
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guardian_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guardian_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `adm_no` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `discounts` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `last_login` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hightech_institute_notifications
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hightech_institute_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hightech_institute_payment_record
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hightech_institute_payment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount_paid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `PTA` int(11) NOT NULL,
  `lesson` int(11) NOT NULL,
  `tuition` int(11) NOT NULL,
  `expected_payment` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `term` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `session` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DOG` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DOP` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `balance_date` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `keyid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_for` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `accountant` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hightech_institute_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hightech_institute_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes` varchar(3500) COLLATE utf8mb4_bin DEFAULT NULL,
  `current_session` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sessions` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `current_term` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `terms` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `fees` varchar(3500) COLLATE utf8mb4_bin DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_for` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `backup_date` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hightech_institute_students
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hightech_institute_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guardian_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guardian_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `adm_no` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `discounts` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hightech_institute_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hightech_institute_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `last_login` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: school_cred
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `school_cred` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: teetech_institute_notifications
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `teetech_institute_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: teetech_institute_payment_record
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `teetech_institute_payment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount_paid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `PTA` int(11) NOT NULL,
  `lesson` int(11) NOT NULL,
  `tuition` int(11) NOT NULL,
  `expected_payment` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `term` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `session` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DOG` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DOP` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `balance_date` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `keyid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_for` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `accountant` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: teetech_institute_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `teetech_institute_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes` varchar(3500) COLLATE utf8mb4_bin DEFAULT NULL,
  `current_session` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sessions` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `current_term` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `terms` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `fees` varchar(3500) COLLATE utf8mb4_bin DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `payment_for` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `backup_date` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: teetech_institute_students
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `teetech_institute_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guardian_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guardian_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `adm_no` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `discounts` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: teetech_institute_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `teetech_institute_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `last_login` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_notifications
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_notifications` (
    `id`,
    `title`,
    `text`,
    `payment_id`,
    `status`,
    `created_at`
  )
VALUES
  (
    21,
    'Balance date expired.',
    'The balance date of samuel educa expired on 19th of January, 2023',
    '1fnidq6mgtj1fnidq6mgtj2p4l3h8esrh2p4l3h8esrh',
    '1',
    '2023-01-23 17:48:32'
  );
INSERT INTO
  `global_kids_academy_notifications` (
    `id`,
    `title`,
    `text`,
    `payment_id`,
    `status`,
    `created_at`
  )
VALUES
  (
    22,
    'Balance date expired.',
    'The balance date of emmanuel ndagana  expired on 6th of January, 2023',
    '82j9d9omsbj82j9d9omsbj27f5tram83jq27f5tram83jq',
    '1',
    '2023-01-23 17:48:32'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_payment_record
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    2,
    'samuel educa',
    '66394',
    '30000',
    1000,
    3000,
    26000,
    '72500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-05',
    '2023-01-19',
    'part payment made for 3rd term, through zenith bank transfer (2021/2022)',
    'ss 2 mercury',
    '1fnidq6mgtj1fnidq6mgtj2p4l3h8esrh2p4l3h8esrh',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-02-02 12:09:46'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    3,
    'jordan baker',
    '71432',
    '68500',
    1000,
    0,
    67500,
    '68500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-01',
    '',
    '3rd term payment for fees and pta (no lesson), through zenith bank transfer (2021/2022)',
    'ss 1 mercury',
    'cantrggfi2lcantrggfi2lbd695cke6h1bd695cke6h1',
    'fees and pta (no lesson)',
    'zenith bank transfer',
    'admin',
    '2023-01-06 16:20:27'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    4,
    'test usman ',
    '87042',
    '1000',
    1000,
    0,
    0,
    '1000',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-04',
    '',
    '3rd term payment for others, through zenith bank teller (2021/2022)',
    'jss 2 venus',
    'ks63f3gg3f6ks63f3gg3f66odcpi7sq9b6odcpi7sq9b',
    'others',
    'zenith bank teller',
    'admin',
    '2023-01-06 16:21:58'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    5,
    'fisher walls',
    '39513',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-04',
    '',
    '3rd term payment for fees ~ pta and lesson, through zenith bank transfer (2021/2022)',
    'nursery 2 venus',
    'b53tdp8af62b53tdp8af622rat4q43ck5c2rat4q43ck5c',
    'fees ~ pta and lesson',
    'zenith bank transfer',
    'admin',
    '2023-01-06 16:32:59'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    6,
    'dumebi samson',
    '36982',
    '59500',
    1000,
    0,
    58500,
    '59500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-04',
    '',
    '3rd term payment for fees and pta (no lesson), through zenith bank transfer (2021/2022)',
    'nursery 2 venus',
    '158j9ci8j8ic158j9ci8j8ic6a1437leor76a1437leor7',
    'fees and pta (no lesson)',
    'zenith bank transfer',
    'admin',
    '2023-01-06 16:34:01'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    7,
    'fatima nasiru kiryo',
    '74131',
    '20000',
    1000,
    3000,
    16000,
    '63500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-06',
    '2023-01-10',
    'part payment made for 3rd term, through zenith bank transfer (2021/2022)',
    'nursery 2 venus',
    '2rt45np67kmc2rt45np67kmc9bmnc0r7t9h9bmnc0r7t9h',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-01-06 16:38:14'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    8,
    'fatima nasiru kiryo',
    '74131',
    '43500',
    0,
    0,
    43500,
    '63500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-06',
    '',
    'others',
    'nursery 2 venus',
    '2rt45np67kmc2rt45np67kmc9bmnc0r7t9h9bmnc0r7t9h',
    'others',
    'zenith bank transfer',
    'admin',
    '2023-01-06 16:42:05'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    9,
    'ms tudu attahiru',
    '72798',
    '15000',
    0,
    0,
    15000,
    '15000',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-06',
    '',
    '3rd term payment for busfare, (arkilla area) through zenith bank teller (2021/2022)',
    'nursery 2 venus',
    '2j686l7lo82k2j686l7lo82k29mrh3616gko29mrh3616gko',
    'busfare',
    'zenith bank teller',
    'admin',
    '2023-01-06 16:51:01'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    10,
    'emmanuel ndagana',
    '70008',
    '10000',
    0,
    0,
    0,
    '10000',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-05',
    '',
    '3rd term payment for busfare, through zenith bank teller (2021/2022)',
    'ss 2 mars',
    'ddlk23r92c2ddlk23r92c2a6t150fo36ta6t150fo36t',
    'busfare',
    'zenith bank teller',
    'admin',
    '2023-01-06 17:00:02'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    11,
    'rehoboth samson',
    '97002',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-06',
    '',
    '3rd term payment for fees ~ pta and lesson, through zenith bank transfer (2021/2022)',
    'basic 2 venus',
    'efbs1cmegr9efbs1cmegr99hhfd8d11mk9hhfd8d11mk',
    'fees ~ pta and lesson',
    'zenith bank transfer',
    'admin',
    '2023-01-06 17:01:40'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    12,
    'samuel educa',
    '66394',
    '10000',
    0,
    0,
    0,
    '72500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-05',
    '2023-01-19',
    ' busfare',
    'ss 2 mercury',
    '1fnidq6mgtj1fnidq6mgtj2p4l3h8esrh2p4l3h8esrh',
    ' busfare',
    'zenith bank transfer',
    'admin',
    '2023-02-02 12:09:46'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    13,
    'destiny great',
    '61870',
    '10000',
    0,
    0,
    0,
    '10000',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-06',
    '',
    '3rd term payment for busfare, through zenith bank transfer (2021/2022)',
    'nursery 2 venus',
    'hosor42f0tqhosor42f0tqddpnkn3rq2oddpnkn3rq2o',
    'busfare',
    'zenith bank transfer',
    'admin',
    '2023-01-06 17:06:13'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    14,
    'samuel educa',
    '66394',
    '10000',
    0,
    0,
    0,
    '72500',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-04',
    '2023-01-19',
    ' busfare',
    'ss 2 mercury',
    '1fnidq6mgtj1fnidq6mgtj2p4l3h8esrh2p4l3h8esrh',
    ' busfare',
    'zenith bank transfer',
    'admin',
    '2023-02-02 12:09:46'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    15,
    'sungba aje',
    '14632',
    '15000',
    0,
    0,
    0,
    '15000',
    '0',
    '3rd term',
    '2021/2022',
    '06/01/2023',
    '2023-01-06',
    '',
    '3rd term payment for busfare, through zenith bank transfer (2021/2022)',
    'basic 2 venus',
    '19nrmp50gmdm19nrmp50gmdmdf01kabbg5sdf01kabbg5s',
    'busfare',
    'zenith bank transfer',
    'admin',
    '2023-01-06 17:15:40'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    16,
    'jason peter',
    '53614',
    '30000',
    1000,
    3000,
    26000,
    '59750',
    '0',
    '3rd term',
    '2021/2022',
    '01/01/2009',
    '2009-01-05',
    '2009-01-08',
    'part payment made for 3rd term, through zenith bank transfer (2021/2022)',
    'basic 1 venus',
    '17k9jqep59o417k9jqep59o41jg9p83k8hk1jg9p83k8hk',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-01-09 16:02:03'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    17,
    'jason peter',
    '53614',
    '29750',
    0,
    0,
    29750,
    '59750',
    '0',
    '3rd term',
    '2021/2022',
    '01/01/2009',
    '2009-01-01',
    '',
    'others',
    'basic 1 venus',
    '17k9jqep59o417k9jqep59o41jg9p83k8hk1jg9p83k8hk',
    'others',
    'zenith pos',
    'admin',
    '2023-01-09 16:02:03'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    18,
    'muhammad idris',
    '27780',
    '59750',
    1000,
    3000,
    55750,
    '59750',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-08',
    '',
    '2nd term payment for fees and pta (no lesson), through zenith pos (2021/2022)',
    'basic 3 jupiter',
    'bt5b209ackdbt5b209ackd9g4k8cfiq8a9g4k8cfiq8a',
    'fees and pta (no lesson)',
    'zenith pos',
    'admin',
    '2023-01-09 17:35:10'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    19,
    'fatima nasiru kiryo ',
    '35890',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-03',
    '',
    '2nd term payment for others, through zenith pos (2021/2022)',
    'nursery 1 mercury',
    '3drqcshsmgn3drqcshsmgnlm9ttjssg80lm9ttjssg80',
    'others',
    'zenith pos',
    'admin',
    '2023-01-09 18:01:09'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    20,
    'emmanuel ndagana ',
    '68352',
    '30000',
    1000,
    3000,
    26000,
    '70500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-08',
    '2023-01-24',
    'part payment made for 2nd term, through zenith bank teller (2021/2022)',
    'jss 1 venus',
    '82j9d9omsbj82j9d9omsbj27f5tram83jq27f5tram83jq',
    'part payment',
    'zenith bank teller',
    'admin',
    '2023-01-23 18:06:36'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    21,
    'emmanuel ndagana ',
    '68352',
    '30000',
    1000,
    3000,
    26000,
    '70500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-08',
    '2023-01-18',
    'part payment made for 2nd term, through zenith bank teller (2021/2022)',
    'jss 1 venus',
    'elmjj9g9er3elmjj9g9er37ln7hgg90617ln7hgg9061',
    'part payment',
    'zenith bank teller',
    'admin',
    '2023-01-11 09:53:14'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    22,
    'namaste future',
    '57076',
    '66500',
    1000,
    3000,
    62500,
    '66500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-19',
    '',
    '2nd term payment for fees and pta (no lesson), through zenith bank transfer (2021/2022)',
    'kindergaten earth',
    '2f9flsds8brs2f9flsds8brsfhm3dk46f5qfhm3dk46f5q',
    'fees and pta (no lesson)',
    'zenith bank transfer',
    'admin',
    '2023-01-09 18:24:14'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    23,
    'bello nana khadijat  sambo',
    '10749',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-06',
    '',
    '2nd term payment for fees and pta (no lesson), through zenith bank teller (2021/2022)',
    'nursery 2 new admission',
    '2h5c86r59s802h5c86r59s801776dsf8rl4o1776dsf8rl4o',
    'fees and pta (no lesson)',
    'zenith bank teller',
    'admin',
    '2023-01-09 18:28:14'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    24,
    'bello nana khadijat  sambo',
    '13749',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-06',
    '',
    '2nd term payment for fees and pta (no lesson), through zenith bank teller (2021/2022)',
    'nursery 1 new admission',
    '57si8gtafpn57si8gtafpn7el489p9gog7el489p9gog',
    'fees and pta (no lesson)',
    'zenith bank teller',
    'admin',
    '2023-01-22 20:27:33'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    25,
    'bello nana khadijat  sambo',
    '15649',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-06',
    '',
    '2nd term payment for fees and pta (no lesson), through zenith bank teller (2021/2022)',
    'nursery 1 new admission',
    '2kda31sorneg2kda31sornegn00fl3cr8bmn00fl3cr8bm',
    'fees and pta (no lesson)',
    'zenith bank teller',
    'admin',
    '2023-01-22 20:19:48'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    26,
    'bello nana khadijat  sambo',
    '10049',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-06',
    '',
    '2nd term payment for fees and pta (no lesson), through zenith bank teller (2021/2022)',
    'nursery 2 venus',
    'p112ie6jj1ep112ie6jj1edhcjo0ag2c2dhcjo0ag2c2',
    'fees and pta (no lesson)',
    'zenith bank teller',
    'admin',
    '2023-01-22 20:28:54'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    27,
    'fatima nasiru kiryo burodo',
    '57094',
    '70500',
    1000,
    3000,
    66500,
    '70500',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-09',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank teller (2021/2022)',
    'jss 3 new admission',
    '991441bgeff991441bgeff8rs58h1di5l8rs58h1di5l',
    'fees ~ pta and lesson',
    'zenith bank teller',
    'admin',
    '2023-01-09 18:38:01'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    28,
    'peter emmanuel',
    '42900',
    '59000',
    1000,
    3000,
    55000,
    '59000',
    '0',
    '2nd term',
    '2021/2022',
    '09/01/2023',
    '2023-01-09',
    '',
    'part payment made for 2nd term, through zenith bank teller (2021/2022)',
    'basic 4 venus',
    'a1doihbe6iqa1doihbe6iq7mdee38ok7s7mdee38ok7s',
    'part payment',
    'zenith bank teller',
    'admin',
    '2023-01-09 18:50:08'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    29,
    'jahv ndutum',
    '93358',
    '77500',
    1000,
    3000,
    73500,
    '77500',
    '0',
    '2nd term',
    '2021/2022',
    '10/01/2023',
    '2023-01-03',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank teller (2021/2022) 50% rebate in tuition',
    'ss 3 venus',
    'f4dtbb0abjmf4dtbb0abjmbhtaf13lotqbhtaf13lotq',
    'fees ~ pta and lesson',
    'zenith bank teller',
    'admin',
    '2023-01-10 10:41:52'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    30,
    'emmanuel ndagana ',
    '68352',
    '40500',
    0,
    0,
    40500,
    '70500',
    '0',
    '2nd term',
    '2021/2022',
    '11/01/2023',
    '2023-01-11',
    '',
    'others',
    'jss 1 venus',
    'elmjj9g9er3elmjj9g9er37ln7hgg90617ln7hgg9061',
    'others',
    'zenith pos',
    'admin',
    '2023-01-11 09:53:14'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    31,
    'sanusi zubairu',
    '91993',
    '59000',
    1000,
    3000,
    55000,
    '59000',
    '0',
    '2nd term',
    '2021/2022',
    '11/01/2023',
    '2023-01-11',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith pos (2021/2022)',
    'ss 3 mars',
    '76n070dajao76n070dajaollelnk0o5h2llelnk0o5h2',
    'fees ~ pta and lesson',
    'zenith pos',
    'jeho',
    '2023-01-30 15:23:08'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    32,
    'usman ishaq ibrahim',
    '73627',
    '50000',
    1000,
    3000,
    46000,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '12/01/2023',
    '2022-12-08',
    '2023-01-31',
    'part payment made for 2nd term, through zenith bank transfer (2021/2022)',
    'basic 2 earth',
    '15e8qmrmaq9a15e8qmrmaq9abrmo055tortbrmo055tort',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-01-23 18:20:37'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    33,
    'samuel educa',
    '66394',
    '2500',
    0,
    0,
    2500,
    '72500',
    '0',
    '3rd term',
    '2021/2022',
    '12/01/2023',
    '2023-01-12',
    '2023-01-19',
    'part payment',
    'ss 2 mercury',
    '1fnidq6mgtj1fnidq6mgtj2p4l3h8esrh2p4l3h8esrh',
    'part payment',
    'zenith bank teller',
    'admin',
    '2023-02-02 12:09:46'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    37,
    'samuel friday',
    '63045',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '14/01/2023',
    '2023-01-13',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank transfer (2021/2022)',
    'nursery 1 jupiter',
    'o9s831johmeo9s831johme95aa6mcnsbg95aa6mcnsbg',
    'fees ~ pta and lesson',
    'zenith bank transfer',
    'admin',
    '2023-01-14 08:50:38'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    38,
    'musty samaila',
    '14140',
    '30000',
    1000,
    3000,
    26000,
    '59000',
    '0',
    '2nd term',
    '2021/2022',
    '18/01/2023',
    '2023-01-18',
    '2023-01-26',
    'part payment made for 2nd term, through zenith bank transfer (2021/2022)',
    'middle basic 5 mercury',
    '9pb3iofbtdn9pb3iofbtdnnt8tmkmll1cnt8tmkmll1c',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-01-27 01:16:49'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    39,
    'bello nana khadijat  sambo',
    '69566',
    '63500',
    1000,
    3000,
    59500,
    '70500',
    '0',
    '1st term',
    '2021/2022',
    '18/01/2023',
    '2023-01-17',
    '2023-01-24',
    '1st term payment for fees ~ pta and lesson, through zenith bank teller (2021/2022)',
    'jss 2 mercury',
    '4aj73f461514aj73f46151dd3psmja54edd3psmja54e',
    'fees ~ pta and lesson',
    'zenith bank teller',
    'admin',
    '2023-01-23 18:02:03'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    40,
    'sanusi zubairu',
    '52221',
    '20000',
    0,
    0,
    0,
    '20000',
    '0',
    '2nd term',
    '2021/2022',
    '20/01/2023',
    '2023-01-19',
    '',
    '2nd term payment for busfare, through zenith bank transfer (2021/2022)',
    'ss 3 mars',
    'gmp9doq9cg0gmp9doq9cg0irj5io0in0sirj5io0in0s',
    'busfare',
    'zenith bank transfer',
    'jeho',
    '2023-01-30 15:23:08'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    41,
    'usama biladin',
    '52743',
    '50000',
    1000,
    3000,
    46000,
    '100000',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-23',
    '2023-01-31',
    'part payment made for 2nd term, through zenith bank teller (2021/2022)',
    'middle basic 5 mercury',
    'di487paittsdi487paitts15k39743fnao15k39743fnao',
    'part payment',
    'zenith bank teller',
    'admin',
    '2023-01-24 09:20:15'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    42,
    'usama biladin',
    '52743',
    '20000',
    0,
    0,
    20000,
    '100000',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-23',
    '2023-01-31',
    'others',
    'middle basic 5 mercury',
    'di487paittsdi487paitts15k39743fnao15k39743fnao',
    'others',
    'zenith pos',
    'admin',
    '2023-01-24 09:20:15'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    43,
    'usama biladin',
    '52743',
    '30000',
    0,
    0,
    30000,
    '100000',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-22',
    '',
    'others',
    'middle basic 5 mercury',
    'di487paittsdi487paitts15k39743fnao15k39743fnao',
    'others',
    'zenith bank transfer',
    'admin',
    '2023-01-24 09:20:15'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    44,
    'bello nana khadijat  sambo',
    '69566',
    '7000',
    0,
    0,
    7000,
    '70500',
    '0',
    '1st term',
    '2021/2022',
    '23/01/2023',
    '2023-01-23',
    '',
    'others',
    'jss 2 mercury',
    '4aj73f461514aj73f46151dd3psmja54edd3psmja54e',
    'others',
    'zenith bank transfer',
    'admin',
    '2023-01-23 18:02:03'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    45,
    'emmanuel ndagana ',
    '68352',
    '20000',
    0,
    0,
    20000,
    '70500',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-23',
    '2023-01-24',
    'part payment',
    'jss 1 venus',
    '82j9d9omsbj82j9d9omsbj27f5tram83jq27f5tram83jq',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-01-23 18:06:36'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    46,
    'emmanuel ndagana ',
    '68352',
    '20500',
    0,
    0,
    20500,
    '70500',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-22',
    '',
    'others',
    'jss 1 venus',
    '82j9d9omsbj82j9d9omsbj27f5tram83jq27f5tram83jq',
    'others',
    'zenith pos',
    'admin',
    '2023-01-23 18:06:36'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    47,
    'zion iche',
    '46888',
    '90000',
    1000,
    3000,
    86000,
    '90000',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-23',
    '',
    'z',
    'lower basic 3 mercury',
    '7i1itcp7n7m7i1itcp7n7m22sdd7aq72322sdd7aq723',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-01-23 18:18:02'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    48,
    'usman ishaq ibrahim',
    '73627',
    '10000',
    0,
    0,
    10000,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-23',
    '2023-01-31',
    'part payment',
    'basic 2 earth',
    '15e8qmrmaq9a15e8qmrmaq9abrmo055tortbrmo055tort',
    'part payment',
    'zenith pos',
    'admin',
    '2023-01-23 18:20:37'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    49,
    'usman ishaq ibrahim',
    '73627',
    '3500',
    0,
    0,
    3500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '23/01/2023',
    '2023-01-23',
    '',
    'others',
    'basic 2 earth',
    '15e8qmrmaq9a15e8qmrmaq9abrmo055tortbrmo055tort',
    'others',
    'zenith pos',
    'admin',
    '2023-01-23 18:20:37'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    50,
    'emenike godwin',
    '57664',
    '25000',
    0,
    0,
    0,
    '25000',
    '0',
    '2nd term',
    '2021/2022',
    '24/01/2023',
    '2023-01-24',
    '',
    '2nd term payment for busfare, through zenith pos (2021/2022)',
    'lower basic 1 mars',
    '9e2t1rq176r9e2t1rq176r1ttooc2ahe0g1ttooc2ahe0g',
    'busfare',
    'zenith pos',
    'admin',
    '2023-01-24 13:04:54'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    51,
    'chukwu paul',
    '58262',
    '59000',
    1000,
    3000,
    55000,
    '59000',
    '0',
    '2nd term',
    '2021/2022',
    '24/01/2023',
    '2023-01-23',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith pos (2021/2022)',
    'lower basic 1 mars',
    'e3dbo0tkfbje3dbo0tkfbjdc7pnbq0bi4dc7pnbq0bi4',
    'fees ~ pta and lesson',
    'zenith pos',
    'admin',
    '2023-01-24 14:32:32'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    52,
    'briana usman',
    '35076',
    '15000',
    0,
    0,
    0,
    '15000',
    '0',
    '2nd term',
    '2021/2022',
    '24/01/2023',
    '2023-01-24',
    '',
    '2nd term payment for busfare, through zenith bank transfer (2021/2022)',
    'middle basic 6',
    'e9jml5ri4mie9jml5ri4mindjlr5toqfqndjlr5toqfq',
    'busfare',
    'zenith bank transfer',
    'admin',
    '2023-01-24 14:38:23'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    55,
    'yunusa isman',
    '39911',
    '50000',
    0,
    0,
    0,
    '50000',
    '0',
    '2nd term',
    '2021/2022',
    '25/01/2023',
    '2023-01-25',
    '',
    '2nd term payment for busfare, through zenith pos (2021/2022) false',
    'middle basic 6',
    '96989kqh4tr96989kqh4tr13ait060eil13ait060eil',
    'busfare',
    'zenith pos',
    'admin',
    '2023-01-25 11:24:27'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    56,
    'blessing adamu',
    '81447',
    '59000',
    1000,
    3000,
    55000,
    '59000',
    '0',
    '2nd term',
    '2021/2022',
    '25/01/2023',
    '2023-01-20',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank teller (2021/2022) ',
    'lower basic 1 mars',
    '14k172jl83i14k172jl83ipoq6idm1tjspoq6idm1tjs',
    'fees ~ pta and lesson',
    'zenith bank teller',
    'admin',
    '2023-01-25 12:18:05'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    57,
    'abdullahi sanusi',
    '93389',
    '30000',
    1000,
    3000,
    26000,
    '50000',
    '5000',
    '2nd term',
    '2021/2022',
    '25/01/2023',
    '2023-01-25',
    '2023-02-28',
    '2nd term payment for part payment, through zenith bank teller (2021/2022) ',
    'middle basic 6',
    'crl2rdlt1qscrl2rdlt1qshnt7js6547khnt7js6547k',
    'part payment',
    'zenith bank teller',
    'admin',
    '2023-02-17 11:03:20'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    58,
    'sufyan musa',
    '47518',
    '59000',
    1000,
    3000,
    55000,
    '59000',
    '0',
    '2nd term',
    '2021/2022',
    '26/01/2023',
    '2023-01-26',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank transfer (2021/2022) ',
    'middle basic 6',
    '5t09904rd395t09904rd39gnhd42k5jpagnhd42k5jpa',
    'fees ~ pta and lesson',
    'zenith bank transfer',
    'admin',
    '2023-01-26 13:51:21'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    59,
    'musty samaila',
    '14140',
    '29000',
    0,
    0,
    29000,
    '59000',
    '0',
    '2nd term',
    '2021/2022',
    '27/01/2023',
    '2023-01-27',
    '',
    'others',
    'middle basic 5 mercury',
    '9pb3iofbtdn9pb3iofbtdnnt8tmkmll1cnt8tmkmll1c',
    'others',
    'zenith pos',
    'admin',
    '2023-01-27 01:16:49'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    61,
    'fatima bello',
    '32255',
    '5900',
    1000,
    3000,
    1900,
    '59000',
    '53100',
    '2nd term',
    '2021/2022',
    '27/01/2023',
    '2023-01-27',
    '2023-01-28',
    '2nd term payment for part payment, through zenith bank transfer (2021/2022) ',
    'lower basic 3 mercury',
    '8m97dj9b9d8m97dj9b9dejf8k0scc3jejf8k0scc3j',
    'part payment',
    'zenith bank transfer',
    'admin',
    '2023-01-30 05:01:33'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    62,
    'samuel adediran',
    '15670',
    '57000',
    1000,
    3000,
    53000,
    '57000',
    '0',
    '2nd term',
    '2021/2022',
    '30/01/2023',
    '2023-01-30',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank teller (2021/2022) ',
    'ss 3 venus',
    'a03e6b30j96a03e6b30j964gpo6o7ndjn4gpo6o7ndjn',
    'fees ~ pta and lesson',
    'zenith bank teller',
    'tee',
    '2023-01-30 15:26:14'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    63,
    'samuel educa',
    '66394',
    '20000',
    0,
    0,
    20000,
    '72500',
    '0',
    '3rd term',
    '2021/2022',
    '02/02/2023',
    '2023-02-02',
    '',
    'others',
    'ss 2 mercury',
    '1fnidq6mgtj1fnidq6mgtj2p4l3h8esrh2p4l3h8esrh',
    'others',
    'uba pos',
    'admin',
    '2023-02-02 12:09:46'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    64,
    'musty samaila',
    '34846',
    '63500',
    1000,
    3000,
    59500,
    '63500',
    '0',
    '2nd term',
    '2021/2022',
    '02/02/2023',
    '2023-02-02',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank teller (2021/2022) ',
    'middle basic 5 mercury',
    '1hjma6kl7j4q1hjma6kl7j4q8h2h13m9h6s8h2h13m9h6s',
    'fees ~ pta and lesson',
    'zenith bank teller',
    'admin',
    '2023-02-02 13:03:27'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    65,
    'abdullahi sanusi',
    '93389',
    '10000',
    0,
    0,
    10000,
    '50000',
    '5000',
    '2nd term',
    '2021/2022',
    '02/02/2023',
    '2023-02-02',
    '2023-02-28',
    'part payment',
    'middle basic 6',
    'crl2rdlt1qscrl2rdlt1qshnt7js6547khnt7js6547k',
    'part payment',
    'zenith pos',
    'admin',
    '2023-02-17 11:03:20'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    66,
    'samuel adediran',
    '63105',
    '50000',
    1000,
    3000,
    46000,
    '72500',
    '0',
    '2nd term',
    '2021/2022',
    '17/02/2023',
    '2023-02-17',
    '',
    '2nd term payment for fees ~ pta and lesson, through zenith bank teller (2021/2022) ',
    'ss 3 venus',
    '2it22ijndibm2it22ijndibmgccp7hlgnfigccp7hlgnfi',
    'fees ~ pta and lesson',
    'zenith bank teller',
    'tee',
    '2023-02-17 11:43:54'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    67,
    'abdullahi sanusi',
    '93389',
    '5000',
    0,
    0,
    5000,
    '50000',
    '5000',
    '2nd term',
    '2021/2022',
    '17/02/2023',
    '2023-02-17',
    '2023-02-28',
    'part payment made',
    'middle basic 6',
    'crl2rdlt1qscrl2rdlt1qshnt7js6547khnt7js6547k',
    'part payment',
    'zenith bank transfer',
    'tee',
    '2023-02-17 11:03:20'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_settings
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_settings` (
    `id`,
    `classes`,
    `current_session`,
    `sessions`,
    `current_term`,
    `terms`,
    `fees`,
    `payment_method`,
    `payment_for`,
    `backup_date`,
    `created_at`
  )
VALUES
  (
    1,
    '[\"pre nursery\",\"pre nursery new admission\",\"pre nursery mercury\",\"pre nursery venus\",\"nursery 1\",\"nursery 1 new admission\",\"nursery 1 mercury\",\"nursery 1 venus\",\"nursery 1 mars\",\"nursery 2\",\"nursery 2 new admission\",\"nursery 2 mercury\",\"nursery 2 venus\",\"nursery 2 mars\",\"nursery 2 jupiter\",\"kindergaten\",\"kindergaten new admission\",\"kindergaten mercury\",\"kindergaten venus\",\"kindergaten mars\",\"kindergaten jupiter\",\"kindergaten earth\",\"lower basic 1\",\"lower basic 1 new admission\",\"lower basic 1 mercury\",\"lower basic 1 venus\",\"lower basic 1 mars\",\"lower basic 1 jupiter\",\"lower basic 2 mercury\",\"lower basic 2\",\"lower basic 2 new admission\",\"lower basic 2 venus\",\"lower basic 2 mars\",\"lower basic 2 jupiter\",\"lower basic 2 earth\",\"lower basic 3\",\"lower basic 3 new admission\",\"lower basic 3 mercury\",\"lower basic 3 venus\",\"lower basic 3 mars\",\"middle basic 4\",\"middle basic 4 new admission\",\"middle basic 4 mercury\",\"middle basic 4 venus\",\"middle basic 4 mars\",\"middle basic 4 jupiter\",\"middle basic 5\",\"middle basic 5 new admission\",\"middle basic 5 mercury\",\"middle basic 5 venus\",\"middle basic 5 mars\",\"middle basic 6\",\"upper jss 1\",\"upper jss 1 new admission\",\"upper jss 1 mercury\",\"upper jss 1 venus\",\"upper jss 1 mars\",\"upper jss 1 jupiter\",\"upper jss 2\",\"upper jss 2 new admission\",\"upper jss 2 mercury\",\"upper jss 2 venus\",\"upper jss 2 mars\",\"upper jss 2 jupiter\",\"upper jss 3\",\"upper jss 3 new admission\",\"upper jss 3 mercury\",\"upper jss 3 venus\",\"upper jss 3 mars\",\"upper jss 3 jupiter\",\"ss 1\",\"ss 1 new admission\",\"ss 1 mercury\",\"ss 1 venus\",\"ss 1 mars\",\"ss 1 jupiter\",\"ss 2\",\"ss 2 new admission\",\"ss 2 mercury\",\"ss 2 venus\",\"ss 2 mars\",\"ss 2 jupiter\",\"ss 3\",\"ss 3 new admission\",\"ss 3 mercury\",\"ss 3 venus\",\"ss 3 mars\",\"ss 3 jupiter\"]',
    '2022/2023',
    '2019/2020,2020/2021,2022/2023,2021/2022',
    '2nd term',
    '1st term,3rd term,2nd term',
    '[[\"pre nursery\",\"60500\"],[\"nursery 1\",\"63500\"],[\"nursery 2\",\"63500\"],[\"kindergaten\",\"66500\"],[\"lower basic 1\",\"63500\"],[\"lower basic 2\",\"63500\"],[\"lower basic 3\",\"63500\"],[\"middle basic 4\",\"63500\"],[\"middle basic 5\",\"63500\"],[\"middle basic 6\",\"66500\"],[\"upper jss 1\",\"70500\"],[\"upper jss 2\",\"70500\"],[\"upper jss 3\",\"70500\"],[\"ss 1\",\"72500\"],[\"ss 2\",\"72500\"],[\"ss 3\",\"72500\"],[\"waec\",\"10000\"],[\"bece\",\"10000\"],[\"school uniform\",\"5000\"],[\"rardigan\",\"5000\"],[\"busfare\",\"20000\"],[\"waec/neco\",\"60000\"]]',
    'Zenith Bank Teller,zenith pos,uba pos,zenith bank transfer',
    'fees ~ pta and lesson,fees and pta (no lesson),part payment,others, busfare,waec/neco',
    'Thu Mar 09 2023 09:45:12 GMT+0',
    '2023-03-09 09:45:12'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_students
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    2,
    'samuel adediran',
    'ss 2 jupiter',
    'adediran sunday',
    '37fjd27pph937fjd27pph996939dr6i9a96939dr6i9a',
    '345',
    '09086865438',
    'unknown',
    '',
    'active',
    '2023-02-17 11:00:07'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    3,
    'sanusi zubairu',
    'ss 3 mars',
    'bello',
    'ajkdaklfandk',
    '',
    '07038393293',
    'nkanfkankfl',
    '',
    'active',
    '2023-01-30 15:23:08'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    4,
    'fatima bello',
    'lower basic 3 mercury',
    'BELLO',
    'AJKDAKLFANDK',
    '',
    '90038393293',
    'NKANFKANKFL',
    '',
    'active',
    '2023-01-30 05:01:33'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    5,
    'musty samaila',
    'middle basic 5 mercury',
    'hgvhjbk mnknjn',
    'eqjbrml2hp3eqjbrml2hp399k1ippgg0k99k1ippgg0k',
    '24',
    '7777',
    'uhihu',
    '',
    'active',
    '2023-01-24 09:20:17'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    6,
    'usama biladin',
    'middle basic 5 mercury',
    'spongebob',
    '545678',
    '',
    '987654',
    'gvczjkfnknbjksbjksb',
    '',
    'active',
    '2023-01-24 09:20:17'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    7,
    'jehoshaphat adediran',
    'ss 2 new admission',
    'adediran sunday',
    '37fjd27pph937fjd27pph996939dr6i9a96939dr6i9a',
    '',
    '+2349030850218',
    '',
    '',
    'active',
    '2023-01-30 15:31:50'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    8,
    'joshua adediran',
    'jss 3 mars',
    'adediran sunday',
    '37fjd27pph937fjd27pph996939dr6i9a96939dr6i9a',
    '',
    '+2349030850218',
    '',
    '',
    'active',
    '2023-01-19 17:59:49'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    9,
    'mary reuben',
    'basic 4 mercury',
    'reuben isaac',
    '',
    '',
    '+2349030850218',
    '',
    '',
    'active',
    '2023-01-19 10:42:27'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    10,
    'isaac eliora',
    'lower basic 3 mercury',
    'simonisaac',
    '',
    '',
    '+2349030850218',
    '',
    '',
    'active',
    '2023-01-30 05:01:33'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    11,
    'samuel friday',
    'nursery 1 mercury',
    'friay samson',
    '',
    '',
    '+2349030850218',
    '',
    '',
    'left',
    '2023-01-20 16:49:11'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    12,
    'muhammad usama',
    'basic 4 jupiter',
    'usama usman',
    '',
    '',
    '07035406812',
    '',
    '',
    'active',
    '2023-01-22 21:10:26'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    13,
    'blessing adamu',
    'lower basic 1 mars',
    'adamu godwin',
    'fhcebk5d6bgfhcebk5d6bggefbc9e5slgefbc9e5sl',
    '342',
    '09085214578',
    'old airport',
    '',
    'active',
    '2023-01-23 18:42:47'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    14,
    'yunusa isman',
    'middle basic 6',
    'isman liman',
    '',
    '',
    '07035406812',
    '',
    '100% rebate',
    'active',
    '2023-01-25 10:05:14'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    15,
    'muhammad usman',
    'upper basic 1 earth',
    'muhammad',
    '',
    '',
    '',
    '',
    '',
    'active',
    '2023-01-25 12:08:10'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    16,
    'abdullahi sanusi',
    'middle basic 6',
    'sanusi',
    '',
    '',
    '',
    '',
    '',
    'active',
    '2023-01-25 12:15:45'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    17,
    'rehoboth adediran',
    'upper basic 1 earth',
    'adediran sunday',
    '37fjd27pph937fjd27pph996939dr6i9a96939dr6i9a',
    '',
    '07036700669',
    '',
    'none',
    'active',
    '2023-01-26 01:26:39'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    18,
    'adamu sambo',
    'lower basic 3 mercury',
    'rrrr',
    'disji',
    'dsbh',
    '9090',
    'dnsnj',
    'none',
    'active',
    '2023-01-30 03:13:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    19,
    'aisha sambo',
    'upper basic 3 earth',
    'rrrr',
    'disji',
    'disnd',
    '9090',
    'dnsnj',
    'none',
    'active',
    '2023-01-30 03:13:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    20,
    'muhammad usma',
    'middle basic 5 mercury',
    'zknkb',
    'jdksb',
    'nnvnd',
    '93930',
    'fdnlsn',
    '100% rebate',
    'left',
    '2023-01-30 03:13:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    21,
    'adamu sambo',
    'lower basic 3 mercury',
    'rrrr',
    'disji',
    'dsbh',
    '9090',
    'dnsnj',
    'none',
    'active',
    '2023-01-30 03:31:25'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    22,
    'aisha sambo',
    'upper basic 3 earth',
    'rrrr',
    'disji',
    'disnd',
    '9090',
    'dnsnj',
    'none',
    'active',
    '2023-01-30 03:31:25'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    23,
    'muhammad usma',
    'middle basic 5 mercury',
    'zknkb',
    'jdksb',
    'nnvnd',
    '93930',
    'fdnlsn',
    '100% rebate',
    'left',
    '2023-01-30 03:31:25'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    25,
    'blessing shege',
    'nursery 1 mars',
    'shege shagari',
    '',
    '',
    '07036875423',
    '',
    '',
    'active',
    '2023-02-17 10:53:46'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_users
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'global kids academy',
    'admin',
    'admin',
    '',
    1,
    '2023-01-06 16:07:29'
  );
INSERT INTO
  `global_kids_academy_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    2,
    'global kids academy',
    'jeho',
    'jeho',
    '',
    0,
    '2023-01-30 15:35:42'
  );
INSERT INTO
  `global_kids_academy_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    4,
    'global kids academy',
    'tee',
    'tee',
    '',
    1,
    '2023-01-30 15:17:38'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hightech_institute_notifications
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hightech_institute_payment_record
# ------------------------------------------------------------

INSERT INTO
  `hightech_institute_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    1,
    'blessing adamu',
    '40527',
    '50000',
    1000,
    3000,
    46000,
    '63500',
    '0',
    '2nd term',
    '2022/2023',
    '19/02/2023',
    '2023-02-19',
    '2023-02-27',
    'part payment made for 2nd term, through zenith bank transfer (2022/2023) ',
    'middle basic 5 new',
    'c3noensj3mmc3noensj3mmft5pim36mc6ft5pim36mc6',
    'fees ~ pta and lesson',
    'zenith bank transfer',
    'admin',
    '2023-02-19 14:39:18'
  );
INSERT INTO
  `hightech_institute_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    2,
    'blessing adamu',
    '40527',
    '13500',
    0,
    0,
    13500,
    '63500',
    '0',
    '2nd term',
    '2022/2023',
    '19/02/2023',
    '2023-02-19',
    '',
    'balance payment pade ',
    'middle basic 5 new',
    'c3noensj3mmc3noensj3mmft5pim36mc6ft5pim36mc6',
    'others',
    'zenith bank transfer',
    'admin',
    '2023-02-19 14:39:18'
  );
INSERT INTO
  `hightech_institute_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `created_at`
  )
VALUES
  (
    3,
    'blessing adamu',
    '46939',
    '50000',
    1000,
    3000,
    46000,
    '63500',
    '13500',
    '2nd term',
    '2022/2023',
    '09/03/2023',
    '2023-03-09',
    '2023-03-10',
    'part payment made for 2nd term, through zenith bank pos (2022/2023) ',
    'middle basic 5 new',
    'e7cdq2leqg0e7cdq2leqg01gja627je981gja627je98',
    'pta',
    'zenith bank pos',
    'staff 1',
    '2023-03-09 08:45:36'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hightech_institute_settings
# ------------------------------------------------------------

INSERT INTO
  `hightech_institute_settings` (
    `id`,
    `classes`,
    `current_session`,
    `sessions`,
    `current_term`,
    `terms`,
    `fees`,
    `payment_method`,
    `payment_for`,
    `backup_date`,
    `created_at`
  )
VALUES
  (
    1,
    '[\"pre nursery\",\"pre nursery new admission\",\"pre nursery mercury\",\"pre nursery venus\",\"nursery 1\",\"nursery 1 new admission\",\"nursery 1 mercury\",\"nursery 1 venus\",\"nursery 1 mars\",\"nursery 2\",\"nursery 2 new admission\",\"nursery 2 mercury\",\"nursery 2 venus\",\"nursery 2 mars\",\"nursery 2 jupiter\",\"kindergaten\",\"kindergaten new admission\",\"kindergaten mercury\",\"kindergaten venus\",\"kindergaten mars\",\"kindergaten jupiter\",\"kindergaten earth\",\"lower basic 1\",\"lower basic 1 new admission\",\"lower basic 1 mercury\",\"lower basic 1 venus\",\"lower basic 1 mars\",\"lower basic 1 jupiter\",\"lower basic 2 mercury\",\"lower basic 2\",\"lower basic 2 new admission\",\"lower basic 2 venus\",\"lower basic 2 mars\",\"lower basic 2 jupiter\",\"lower basic 2 earth\",\"lower basic 3\",\"lower basic 3 new admission\",\"lower basic 3 mercury\",\"lower basic 3 venus\",\"lower basic 3 mars\",\"middle basic 4\",\"middle basic 4 new admission\",\"middle basic 4 mercury\",\"middle basic 4 venus\",\"middle basic 4 mars\",\"middle basic 4 jupiter\",\"middle basic 5 new\",\"middle basic 5 new admission\",\"middle basic 5 mercury\",\"middle basic 5 venus\",\"middle basic 5 mars\",\"middle basic 6\",\"upper jss 1\",\"upper jss 1 new admission\",\"upper jss 1 mercury\",\"upper jss 1 venus\",\"upper jss 1 mars\",\"upper jss 1 jupiter\",\"upper jss 2\",\"upper jss 2 new admission\",\"upper jss 2 mercury\",\"upper jss 2 venus\",\"upper jss 2 mars\",\"upper jss 2 jupiter\",\"upper jss 3\",\"upper jss 3 new admission\",\"upper jss 3 mercury\",\"upper jss 3 venus\",\"upper jss 3 mars\",\"upper jss 3 jupiter\",\"ss 1\",\"ss 1 new admission\",\"ss 1 mercury\",\"ss 1 venus\",\"ss 1 mars\",\"ss 1 jupiter\",\"ss 2\",\"ss 2 new admission\",\"ss 2 mercury\",\"ss 2 venus\",\"ss 2 mars\",\"ss 2 jupiter\",\"ss 3\",\"ss 3 new admission\",\"ss 3 mercury\",\"ss 3 venus\",\"ss 3 mars\",\"ss 3 jupiter\",\"middle basic 8\",\"upper basic 4\"]',
    '2022/2023',
    '2019/2020,2020/2021,2021/2022,2022/2023',
    '2nd term',
    '1st term,2nd term,3rd term',
    '[[\"pre nursery\",\"60500\"],[\"nursery 1\",\"63500\"],[\"nursery 2\",\"63500\"],[\"kindergaten\",\"66500\"],[\"lower basic 1\",\"63500\"],[\"lower basic 2\",\"63500\"],[\"lower basic 3\",\"63500\"],[\"middle basic 4\",\"63500\"],[\"middle basic 5\",\"63500\"],[\"middle basic 6\",\"66500\"],[\"upper jss 1\",\"70500\"],[\"upper jss 2\",\"70500\"],[\"upper jss 3\",\"70500\"],[\"ss 1\",\"72500\"],[\"ss 2\",\"72500\"],[\"ss 3\",\"72500\"],[\"waec\",\"10000\"],[\"bece\",\"10000\"],[\"school uniform\",\"5000\"],[\"rardigan\",\"5000\"],[\"upper basic 4\",\"120000\"]]',
    'zenith bank transfer,zenith bank teller,zenith bank pos,uba bank teller,uba bank transfer,uba pos,cash',
    'fees ~ pta and lesson,fees and pta (no lesson),others,busfare,pta,waec,neco,tuition',
    'Sun Feb 19 2023 14:39:50 GMT+0100 (West Africa Standard Time)',
    '2023-02-19 14:39:50'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hightech_institute_students
# ------------------------------------------------------------

INSERT INTO
  `hightech_institute_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'blessing adamu',
    'middle basic 5 new',
    'adamu jibril',
    'iq5keqa9aniq5keqa9anb1l8dde8o9jb1l8dde8o9j',
    '34',
    '09035406752',
    'old airport sokoto',
    'none',
    'active',
    '2023-02-19 14:39:18'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hightech_institute_users
# ------------------------------------------------------------

INSERT INTO
  `hightech_institute_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'hightech institute',
    'admin',
    'admin',
    '',
    1,
    '2023-02-19 14:05:57'
  );
INSERT INTO
  `hightech_institute_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    2,
    'hightech institute',
    'staff 1',
    'staff',
    '',
    1,
    '2023-02-19 14:29:02'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: school_cred
# ------------------------------------------------------------

INSERT INTO
  `school_cred` (`id`, `school`, `admin`, `password`, `created_at`)
VALUES
  (
    1,
    'global kids academy',
    'admin',
    'admin',
    '2023-01-06 16:07:29'
  );
INSERT INTO
  `school_cred` (`id`, `school`, `admin`, `password`, `created_at`)
VALUES
  (
    2,
    'global kids academy',
    'tee',
    'tee',
    '2023-01-30 15:15:24'
  );
INSERT INTO
  `school_cred` (`id`, `school`, `admin`, `password`, `created_at`)
VALUES
  (
    3,
    'teetech institute',
    'tee',
    'tee',
    '2023-02-19 13:53:19'
  );
INSERT INTO
  `school_cred` (`id`, `school`, `admin`, `password`, `created_at`)
VALUES
  (
    4,
    'hightech institute',
    'admin',
    'admin',
    '2023-02-19 14:05:57'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'kOA1E6XKw1NudaAePiMeMSmfY4OXC2Mc',
    1678524314,
    '{\"cookie\":{\"originalMaxAge\":172800000,\"expires\":\"2023-03-11T08:13:14.526Z\",\"secure\":false,\"httpOnly\":\"true\",\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"tee\",\"admin\":true},\"databaseName\":\"global_kids_academy\"}'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: teetech_institute_notifications
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: teetech_institute_payment_record
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: teetech_institute_settings
# ------------------------------------------------------------

INSERT INTO
  `teetech_institute_settings` (
    `id`,
    `classes`,
    `current_session`,
    `sessions`,
    `current_term`,
    `terms`,
    `fees`,
    `payment_method`,
    `payment_for`,
    `backup_date`,
    `created_at`
  )
VALUES
  (
    1,
    '[\"pre nursery\",\"pre nursery new admission\",\"pre nursery mercury\",\"pre nursery venus\",\"nursery 1\",\"nursery 1 new admission\",\"nursery 1 mercury\",\"nursery 1 venus\",\"nursery 1 mars\",\"nursery 2\",\"nursery 2 new admission\",\"nursery 2 mercury\",\"nursery 2 venus\",\"nursery 2 mars\",\"nursery 2 jupiter\",\"kindergaten\",\"kindergaten new admission\",\"kindergaten mercury\",\"kindergaten venus\",\"kindergaten mars\",\"kindergaten jupiter\",\"kindergaten earth\",\"lower basic 1\",\"lower basic 1 new admission\",\"lower basic 1 mercury\",\"lower basic 1 venus\",\"lower basic 1 mars\",\"lower basic 1 jupiter\",\"lower basic 2 mercury\",\"lower basic 2\",\"lower basic 2 new admission\",\"lower basic 2 venus\",\"lower basic 2 mars\",\"lower basic 2 jupiter\",\"lower basic 2 earth\",\"lower basic 3\",\"lower basic 3 new admission\",\"lower basic 3 mercury\",\"lower basic 3 venus\",\"lower basic 3 mars\",\"middle basic 4\",\"middle basic 4 new admission\",\"middle basic 4 mercury\",\"middle basic 4 venus\",\"middle basic 4 mars\",\"middle basic 4 jupiter\",\"middle basic 5\",\"middle basic 5 new admission\",\"middle basic 5 mercury\",\"middle basic 5 venus\",\"middle basic 5 mars\",\"middle basic 6\",\"upper jss 1\",\"upper jss 1 new admission\",\"upper jss 1 mercury\",\"upper jss 1 venus\",\"upper jss 1 mars\",\"upper jss 1 jupiter\",\"upper jss 2\",\"upper jss 2 new admission\",\"upper jss 2 mercury\",\"upper jss 2 venus\",\"upper jss 2 mars\",\"upper jss 2 jupiter\",\"upper jss 3\",\"upper jss 3 new admission\",\"upper jss 3 mercury\",\"upper jss 3 venus\",\"upper jss 3 mars\",\"upper jss 3 jupiter\",\"ss 1\",\"ss 1 new admission\",\"ss 1 mercury\",\"ss 1 venus\",\"ss 1 mars\",\"ss 1 jupiter\",\"ss 2\",\"ss 2 new admission\",\"ss 2 mercury\",\"ss 2 venus\",\"ss 2 mars\",\"ss 2 jupiter\",\"ss 3\",\"ss 3 new admission\",\"ss 3 mercury\",\"ss 3 venus\",\"ss 3 mars\",\"ss 3 jupiter\"]',
    '2021/2022',
    '2019/2020,2020/2021,2021/2022,2022/2023',
    '3rd term',
    '1st term,2nd term,3rd term',
    '[[\"pre nursery\",\"60500\"],[\"nursery 1\",\"63500\"],[\"nursery 2\",\"63500\"],[\"kindergaten\",\"66500\"],[\"lower basic 1\",\"63500\"],[\"lower basic 2\",\"63500\"],[\"lower basic 3\",\"63500\"],[\"middle basic 4\",\"63500\"],[\"middle basic 5\",\"63500\"],[\"middle basic 6\",\"66500\"],[\"upper jss 1\",\"70500\"],[\"upper jss 2\",\"70500\"],[\"upper jss 3\",\"70500\"],[\"ss 1\",\"72500\"],[\"ss 2\",\"72500\"],[\"ss 3\",\"72500\"],[\"waec\",\"10000\"],[\"bece\",\"10000\"],[\"school uniform\",\"5000\"],[\"rardigan\",\"5000\"]]',
    'zenith bank transfer,zenith bank teller,zenith bank pos,uba bank teller,uba bank transfer,uba pos',
    'fees ~ pta and lesson,fees and pta (no lesson),part payment,others,busfare,pta,waec,neco',
    '',
    '2023-02-19 13:52:14'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: teetech_institute_students
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: teetech_institute_users
# ------------------------------------------------------------

INSERT INTO
  `teetech_institute_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'teetech institute',
    'tee',
    'tee',
    '',
    1,
    '2023-02-19 13:53:19'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
