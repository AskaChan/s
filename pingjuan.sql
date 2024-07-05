/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 80032
Source Host           : localhost:3306
Source Database       : pingjuan

Target Server Type    : MYSQL
Target Server Version : 80032
File Encoding         : 65001

Date: 2024-07-05 14:05:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add choice', '7', 'add_choice');
INSERT INTO `auth_permission` VALUES ('26', 'Can change choice', '7', 'change_choice');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete choice', '7', 'delete_choice');
INSERT INTO `auth_permission` VALUES ('28', 'Can view choice', '7', 'view_choice');
INSERT INTO `auth_permission` VALUES ('29', 'Can add exam', '8', 'add_exam');
INSERT INTO `auth_permission` VALUES ('30', 'Can change exam', '8', 'change_exam');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete exam', '8', 'delete_exam');
INSERT INTO `auth_permission` VALUES ('32', 'Can view exam', '8', 'view_exam');
INSERT INTO `auth_permission` VALUES ('33', 'Can add question', '9', 'add_question');
INSERT INTO `auth_permission` VALUES ('34', 'Can change question', '9', 'change_question');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete question', '9', 'delete_question');
INSERT INTO `auth_permission` VALUES ('36', 'Can view question', '9', 'view_question');
INSERT INTO `auth_permission` VALUES ('37', 'Can add user answer', '10', 'add_useranswer');
INSERT INTO `auth_permission` VALUES ('38', 'Can change user answer', '10', 'change_useranswer');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete user answer', '10', 'delete_useranswer');
INSERT INTO `auth_permission` VALUES ('40', 'Can view user answer', '10', 'view_useranswer');
INSERT INTO `auth_permission` VALUES ('41', 'Can add user exam', '11', 'add_userexam');
INSERT INTO `auth_permission` VALUES ('42', 'Can change user exam', '11', 'change_userexam');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete user exam', '11', 'delete_userexam');
INSERT INTO `auth_permission` VALUES ('44', 'Can view user exam', '11', 'view_userexam');
INSERT INTO `auth_permission` VALUES ('45', 'Can add user score', '12', 'add_userscore');
INSERT INTO `auth_permission` VALUES ('46', 'Can change user score', '12', 'change_userscore');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete user score', '12', 'delete_userscore');
INSERT INTO `auth_permission` VALUES ('48', 'Can view user score', '12', 'view_userscore');
INSERT INTO `auth_permission` VALUES ('49', 'Can add fill in blank answer', '13', 'add_fillinblankanswer');
INSERT INTO `auth_permission` VALUES ('50', 'Can change fill in blank answer', '13', 'change_fillinblankanswer');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete fill in blank answer', '13', 'delete_fillinblankanswer');
INSERT INTO `auth_permission` VALUES ('52', 'Can view fill in blank answer', '13', 'view_fillinblankanswer');
INSERT INTO `auth_permission` VALUES ('53', 'Can add incorrect answer', '14', 'add_incorrectanswer');
INSERT INTO `auth_permission` VALUES ('54', 'Can change incorrect answer', '14', 'change_incorrectanswer');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete incorrect answer', '14', 'delete_incorrectanswer');
INSERT INTO `auth_permission` VALUES ('56', 'Can view incorrect answer', '14', 'view_incorrectanswer');
INSERT INTO `auth_permission` VALUES ('57', 'Can add wrong name', '15', 'add_wrongname');
INSERT INTO `auth_permission` VALUES ('58', 'Can change wrong name', '15', 'change_wrongname');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete wrong name', '15', 'delete_wrongname');
INSERT INTO `auth_permission` VALUES ('60', 'Can view wrong name', '15', 'view_wrongname');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$260000$af65NWvuSL255d4WvvUspi$B2dyTR8bb9a+9HjKCIe760dWjSDc1MZw237QU2Z/5fI=', '2024-07-05 05:54:50.317095', '0', 'liuyi3b', '', '', '', '0', '1', '2024-03-01 14:53:46.179646');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$260000$3BLMUvIT73ULttGVXAY4le$F8GuY+UYx4V8yHPz1x/BLtJJVja8joERbgvqUH+3W/s=', '2024-07-05 05:08:16.711401', '1', 'admin', '', '', '1@1.com', '1', '1', '2024-03-05 02:47:57.928182');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$260000$RvN0OfuO8HZH2SGctQIsNT$5TZqRuDdYOBQrN9U4D/8DNR6i4aHvwg2apGSBGDC6qw=', '2024-03-26 00:14:45.022823', '0', 'liuyi4b', '', '', '', '0', '1', '2024-03-26 00:14:37.427986');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2024-03-05 02:50:50.820351', '1', '计算机第一章', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('2', '2024-03-05 02:52:05.305275', '1', 'django是属于以下哪个语言的', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"python\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"java\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"c\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('3', '2024-03-05 02:54:00.635097', '2', '在 Python 中，下列哪个不是合法的变量名？', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"my_variable\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"2nd_variable\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"_variable\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('4', '2024-03-26 01:16:42.535255', '2', '计算机第二章', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('5', '2024-03-26 12:58:51.306073', '3', 'flask是哪种语言的web框架', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"python\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"java\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"c\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('6', '2024-03-26 13:01:23.577149', '4', '下列哪个选项是Python中的注释？', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"// \\u8fd9\\u662f\\u6ce8\\u91ca\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"/* \\u8fd9\\u662f\\u6ce8\\u91ca */\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"# \\u8fd9\\u662f\\u6ce8\\u91ca\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('7', '2024-03-26 13:01:31.171664', '4', '下列哪个选项是Python中的注释？', '2', '[{\"changed\": {\"name\": \"choice\", \"object\": \"# \\u8fd9\\u662f\\u6ce8\\u91ca\", \"fields\": [\"\\u662f\\u5426\\u6b63\\u786e\\u7b54\\u6848\"]}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('8', '2024-03-27 15:40:33.463493', '3', '计算机基础第三章', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('9', '2024-07-04 03:08:29.025903', '3', '计算机基础第三章', '3', '', '8', '2');
INSERT INTO `django_admin_log` VALUES ('10', '2024-07-04 03:08:29.029590', '2', '计算机第二章', '3', '', '8', '2');
INSERT INTO `django_admin_log` VALUES ('11', '2024-07-04 03:08:29.033542', '1', '计算机第一章', '3', '', '8', '2');
INSERT INTO `django_admin_log` VALUES ('12', '2024-07-04 07:14:44.897768', '4', '测验1', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('13', '2024-07-04 07:16:09.274723', '5', 'Adventure翻译成中文是啥意思', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u5192\\u9669\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u7f8e\\u4e3d\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('14', '2024-07-04 07:18:14.090062', '6', 'Beautiful是啥意思', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u7f8e\\u4e3d\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u5192\\u9669\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('15', '2024-07-04 07:18:41.851950', '7', 'Courageous是啥意思', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u52c7\\u6562\\u7684\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u5192\\u9669\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('16', '2024-07-05 01:40:00.838972', '8', 'Dream是啥意思', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u68a6\\u60f3\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"\\u7f8e\\u4e3d\"}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('17', '2024-07-05 01:44:34.469292', '9', 'Passion是啥意思', '1', '[{\"added\": {}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('18', '2024-07-05 01:44:43.957057', '1', '激情', '1', '[{\"added\": {}}]', '13', '2');
INSERT INTO `django_admin_log` VALUES ('19', '2024-07-05 03:36:49.723104', '1', '激情', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u6b63\\u786e\\u7b54\\u6848\"]}}]', '13', '2');
INSERT INTO `django_admin_log` VALUES ('20', '2024-07-05 03:38:00.564565', '17', 'liuyi3b - Passion是啥意思 - 测试', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('21', '2024-07-05 03:38:00.569967', '16', 'liuyi3b - Dream是啥意思 - 梦想', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('22', '2024-07-05 03:38:00.573459', '15', 'liuyi3b - Adventure翻译成中文是啥意思 - 冒险', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('23', '2024-07-05 03:38:00.576232', '14', 'liuyi3b - Courageous是啥意思 - 勇敢的', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('24', '2024-07-05 03:38:00.579196', '13', 'liuyi3b - Beautiful是啥意思 - 美丽', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('25', '2024-07-05 03:38:00.581516', '12', 'liuyi3b - Dream是啥意思 - 梦想', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('26', '2024-07-05 03:38:00.583322', '11', 'liuyi3b - Adventure翻译成中文是啥意思 - 冒险', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('27', '2024-07-05 03:38:00.586207', '10', 'liuyi3b - Courageous是啥意思 - 勇敢的', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('28', '2024-07-05 03:38:00.588924', '9', 'liuyi3b - Beautiful是啥意思 - 美丽', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('29', '2024-07-05 03:38:00.590950', '8', 'liuyi3b - Courageous是啥意思 - 勇敢的', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('30', '2024-07-05 03:38:00.594324', '7', 'liuyi3b - Beautiful是啥意思 - 美丽', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('31', '2024-07-05 03:38:00.596398', '6', 'liuyi3b - Adventure翻译成中文是啥意思 - 冒险', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('32', '2024-07-05 03:38:00.598944', '5', 'liuyi3b - Adventure翻译成中文是啥意思 - 美丽', '3', '', '10', '2');
INSERT INTO `django_admin_log` VALUES ('33', '2024-07-05 03:38:08.075627', '10', 'liuyi3b - 测验1', '3', '', '11', '2');
INSERT INTO `django_admin_log` VALUES ('34', '2024-07-05 03:38:08.080997', '9', 'liuyi3b - 测验1', '3', '', '11', '2');
INSERT INTO `django_admin_log` VALUES ('35', '2024-07-05 03:38:08.084271', '8', 'liuyi3b - 测验1', '3', '', '11', '2');
INSERT INTO `django_admin_log` VALUES ('36', '2024-07-05 03:38:08.086968', '7', 'liuyi3b - 测验1', '3', '', '11', '2');
INSERT INTO `django_admin_log` VALUES ('37', '2024-07-05 03:38:08.089491', '6', 'liuyi3b - 测验1', '3', '', '11', '2');
INSERT INTO `django_admin_log` VALUES ('38', '2024-07-05 03:38:08.092487', '5', 'liuyi3b - 测验1', '3', '', '11', '2');
INSERT INTO `django_admin_log` VALUES ('39', '2024-07-05 03:38:08.095186', '4', 'liuyi3b - 测验1', '3', '', '11', '2');
INSERT INTO `django_admin_log` VALUES ('40', '2024-07-05 03:38:08.098300', '3', 'liuyi3b - 测验1', '3', '', '11', '2');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'exam', 'choice');
INSERT INTO `django_content_type` VALUES ('8', 'exam', 'exam');
INSERT INTO `django_content_type` VALUES ('13', 'exam', 'fillinblankanswer');
INSERT INTO `django_content_type` VALUES ('14', 'exam', 'incorrectanswer');
INSERT INTO `django_content_type` VALUES ('9', 'exam', 'question');
INSERT INTO `django_content_type` VALUES ('10', 'exam', 'useranswer');
INSERT INTO `django_content_type` VALUES ('11', 'exam', 'userexam');
INSERT INTO `django_content_type` VALUES ('12', 'exam', 'userscore');
INSERT INTO `django_content_type` VALUES ('15', 'exam', 'wrongname');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2024-03-01 14:49:16.508721');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2024-03-01 14:49:17.133673');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2024-03-01 14:49:17.255820');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2024-03-01 14:49:17.267881');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2024-03-01 14:49:17.278811');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2024-03-01 14:49:17.342252');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2024-03-01 14:49:17.388130');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2024-03-01 14:49:17.447269');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2024-03-01 14:49:17.458411');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2024-03-01 14:49:17.502313');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2024-03-01 14:49:17.506838');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2024-03-01 14:49:17.516015');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2024-03-01 14:49:17.563397');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2024-03-01 14:49:17.612098');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2024-03-01 14:49:17.659305');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2024-03-01 14:49:17.668312');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2024-03-01 14:49:17.716712');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2024-03-01 14:49:17.753792');
INSERT INTO `django_migrations` VALUES ('19', 'exam', '0001_initial', '2024-03-05 02:49:25.994699');
INSERT INTO `django_migrations` VALUES ('20', 'exam', '0002_useranswer_userexam_userscore', '2024-03-05 06:50:16.648745');
INSERT INTO `django_migrations` VALUES ('21', 'exam', '0003_useranswer_user', '2024-03-05 08:14:49.504123');
INSERT INTO `django_migrations` VALUES ('22', 'exam', '0004_auto_20240705_0936', '2024-07-05 01:36:17.609583');
INSERT INTO `django_migrations` VALUES ('23', 'exam', '0005_fillinblankanswer', '2024-07-05 01:41:21.129204');
INSERT INTO `django_migrations` VALUES ('24', 'exam', '0006_fillinblankanswer_is_correct', '2024-07-05 03:09:46.141244');
INSERT INTO `django_migrations` VALUES ('25', 'exam', '0007_incorrectanswer', '2024-07-05 04:26:04.094787');
INSERT INTO `django_migrations` VALUES ('26', 'exam', '0008_wrongname', '2024-07-05 04:59:30.454935');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3u9plymbpfoumxcw7fgpax8w08y89p6l', '.eJxVjMEOwiAQRP-FsyGwRWg9evcbyLILUjWQlPZk_Hdp0oMe5jLvzbyFx23Nfmtx8TOLi9Di9NsFpGcsO-AHlnuVVMu6zEHuijxok7fK8XU93L-DjC33tVVEPS5YGCHwGBTyYNlMxBHBIcXUBdARJrTmrICM4YGB3aAS6CQ-X_7MOHc:1rg5mx:SLAJ5J694xWP4zEjaL2suKS-HjyA-u6tVmdZLlRoSfo', '2024-03-15 16:31:11.461049');
INSERT INTO `django_session` VALUES ('fe1ay9iodvbf7beq0nbqueo4dslqmlnx', '.eJxVjDsOwjAQRO_iGllrb2K8lPQ5Q7RrGxxAtpRPhbg7jpQCminmvZm3Gnlb87gtaR6nqC7KqNNvJxyeqewgPrjcqw61rPMkelf0QRc91Jhe18P9O8i85Lb2PQqwQec6K5YCJuFkhSwJOmbXA0LLs3hIZPFG0HkCJOMBm2nU5wvD_jbO:1rpVVV:_TlZ-xXj0LrESv7NpwxJNgZy06qp_9fM_NteCd699cY', '2024-04-10 15:48:05.004744');
INSERT INTO `django_session` VALUES ('jnp2g8n2o38yg2a31eeizzyp5yxhhkos', '.eJxVjDsOwjAQRO_iGllrb2K8lPQ5Q7RrGxxAtpRPhbg7jpQCminmvZm3Gnlb87gtaR6nqC7KqNNvJxyeqewgPrjcqw61rPMkelf0QRc91Jhe18P9O8i85Lb2PQqwQec6K5YCJuFkhSwJOmbXA0LLs3hIZPFG0HkCJOMBm2nU5wvD_jbO:1rp6Qy:66KgnBtqF5y2hzSpwtayJaARNXyiDwv_DRyak0xE5NE', '2024-04-09 13:01:44.211585');
INSERT INTO `django_session` VALUES ('lm56hd39n7cb3yninret6mh3a2gkr866', '.eJzFlUtvnDAUhf8K8npmsOdNdmlVZdVFF1l1opHxY3ALdmODWjWa_14uTKOJC4M7CcoGoXuPj30--cIT2tOqzPaVE3avOLpBczQ5r6WUfRcaGvwb1QczY0aXVqUzkMxOXTf7bLjIP5y0Lwwy6rJ69UZKwdaJXKyWhKRbnq44Xm8ITrDETGzlgpANlukKz6HNKKFLyZJkkYqUkTVtTAuhK1d7fX3aIU0LsUM30Q7d1lsJXSpGS2V0RDWPoGSs-t1UdmhSqxSDN9BL6iJJpy5TIudTmpetoIAEDiQv7e-sqX64HhNI6KbMHNp-ZfO2HVNeKB0DhfgABnEroJzf92vq7kmXWkE5s1WRdpzoDQIfJ9FVIY8PoBCKg4BgPPeN7kH7r4_963OBE7QHMDWS96M0HM7ns_ALxPf89IsWPZZMWZaLy7fzY2YUE32HOnfwmYt645g1y_upn4sCuQcE8hmEhfBRrrpQXk2ieVzm0DzGoxByfJ_B2jf5UgkHt_tqDo8ngwEWz7LxeIRG8Zlsusa2nn_3s396B7HAeLcWA2DOhOOh-Y9EPp1tp5d4zehA5IDxeZaNzCUki08l6XRyzNjrv63NbxMcAri0upHBBMXxyBDso1oeH9DxD3HqQdI:1roxTk:Xf5m2lR5S-CxqcoSDmqd2mhYdkLbsaSMtW0ep--hkxk', '2024-04-09 03:28:00.507814');
INSERT INTO `django_session` VALUES ('yv2g84h6imzaa243gudhyak4t0wk59sl', '.eJxVjDsOwjAQRO_iGllrb2K8lPQ5Q7RrGxxAtpRPhbg7jpQCminmvZm3Gnlb87gtaR6nqC7KqNNvJxyeqewgPrjcqw61rPMkelf0QRc91Jhe18P9O8i85Lb2PQqwQec6K5YCJuFkhSwJOmbXA0LLs3hIZPFG0HkCJOMBm2nU5wvD_jbO:1rhXC7:glECittuvXJwCmtL4ELUQelWyr9ngjCDIvpAWRrFMCI', '2024-03-19 15:59:07.147818');

-- ----------------------------
-- Table structure for exam_choice
-- ----------------------------
DROP TABLE IF EXISTS `exam_choice`;
CREATE TABLE `exam_choice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(100) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_choice_question_id_e2ece949_fk_exam_question_id` (`question_id`),
  CONSTRAINT `exam_choice_question_id_e2ece949_fk_exam_question_id` FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_choice
-- ----------------------------
INSERT INTO `exam_choice` VALUES ('13', '冒险', '1', '5');
INSERT INTO `exam_choice` VALUES ('14', '美丽', '0', '5');
INSERT INTO `exam_choice` VALUES ('15', '美丽', '1', '6');
INSERT INTO `exam_choice` VALUES ('16', '冒险', '0', '6');
INSERT INTO `exam_choice` VALUES ('17', '勇敢的', '1', '7');
INSERT INTO `exam_choice` VALUES ('18', '冒险', '0', '7');
INSERT INTO `exam_choice` VALUES ('19', '梦想', '1', '8');
INSERT INTO `exam_choice` VALUES ('20', '美丽', '0', '8');

-- ----------------------------
-- Table structure for exam_exam
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam`;
CREATE TABLE `exam_exam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `total_marks` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_exam
-- ----------------------------
INSERT INTO `exam_exam` VALUES ('4', '测验1', '100');

-- ----------------------------
-- Table structure for exam_fillinblankanswer
-- ----------------------------
DROP TABLE IF EXISTS `exam_fillinblankanswer`;
CREATE TABLE `exam_fillinblankanswer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `correct_answer` varchar(200) NOT NULL,
  `question_id` bigint NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_fillinblankanswer_question_id_f521c6d2_fk_exam_question_id` (`question_id`),
  CONSTRAINT `exam_fillinblankanswer_question_id_f521c6d2_fk_exam_question_id` FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_fillinblankanswer
-- ----------------------------
INSERT INTO `exam_fillinblankanswer` VALUES ('1', '激情', '9', '1');

-- ----------------------------
-- Table structure for exam_incorrectanswer
-- ----------------------------
DROP TABLE IF EXISTS `exam_incorrectanswer`;
CREATE TABLE `exam_incorrectanswer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `incorrect_answer` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `question_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_incorrectanswer_question_id_6686517e_fk_exam_question_id` (`question_id`),
  KEY `exam_incorrectanswer_user_id_e8455fb9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `exam_incorrectanswer_question_id_6686517e_fk_exam_question_id` FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`),
  CONSTRAINT `exam_incorrectanswer_user_id_e8455fb9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_incorrectanswer
-- ----------------------------
INSERT INTO `exam_incorrectanswer` VALUES ('1', '测试', '2024-07-05 04:32:43.563486', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('2', '测试', '2024-07-05 04:32:57.495499', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('3', '美丽', '2024-07-05 04:32:57.517670', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('4', '冒险', '2024-07-05 04:32:57.521660', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('5', '美丽', '2024-07-05 04:32:57.528738', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('6', '测试', '2024-07-05 04:32:57.533728', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('7', '测试', '2024-07-05 04:36:05.726841', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('8', '美丽', '2024-07-05 04:36:05.749037', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('9', '冒险', '2024-07-05 04:36:05.753325', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('10', '美丽', '2024-07-05 04:36:05.760461', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('11', '测试', '2024-07-05 04:36:05.765446', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('12', '测试', '2024-07-05 04:36:13.603825', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('13', '美丽', '2024-07-05 04:36:13.625083', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('14', '冒险', '2024-07-05 04:36:13.630026', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('15', '美丽', '2024-07-05 04:36:13.637107', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('16', '测试', '2024-07-05 04:36:13.641895', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('17', '测试', '2024-07-05 04:36:36.702140', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('18', '美丽', '2024-07-05 04:36:36.726325', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('19', '冒险', '2024-07-05 04:36:36.731552', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('20', '美丽', '2024-07-05 04:36:36.738419', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('21', '测试', '2024-07-05 04:36:36.743140', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('22', '测试', '2024-07-05 04:39:30.907299', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('23', '美丽', '2024-07-05 04:39:30.928815', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('24', '冒险', '2024-07-05 04:39:30.934045', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('25', '美丽', '2024-07-05 04:39:30.940214', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('26', '测试', '2024-07-05 04:39:30.945898', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('27', '测试', '2024-07-05 04:46:20.611420', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('28', '美丽', '2024-07-05 04:46:20.633529', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('29', '冒险', '2024-07-05 04:46:20.638892', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('30', '美丽', '2024-07-05 04:46:20.645415', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('31', '测试', '2024-07-05 04:46:20.650668', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('32', '测试', '2024-07-05 04:46:23.460024', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('33', '美丽', '2024-07-05 04:46:23.481634', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('34', '冒险', '2024-07-05 04:46:23.485988', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('35', '美丽', '2024-07-05 04:46:23.492559', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('36', '测试', '2024-07-05 04:46:23.496620', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('37', '测试', '2024-07-05 04:53:24.438063', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('38', '美丽', '2024-07-05 04:53:24.460817', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('39', '冒险', '2024-07-05 04:53:24.465817', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('40', '美丽', '2024-07-05 04:53:24.472331', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('41', '测试', '2024-07-05 04:53:24.478063', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('42', '测试', '2024-07-05 04:54:32.078586', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('43', '美丽', '2024-07-05 04:54:32.100660', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('44', '冒险', '2024-07-05 04:54:32.105874', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('45', '美丽', '2024-07-05 04:54:32.111915', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('46', '测试', '2024-07-05 04:54:32.116723', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('47', '测试', '2024-07-05 04:56:20.759632', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('48', '美丽', '2024-07-05 04:56:20.782380', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('49', '冒险', '2024-07-05 04:56:20.786541', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('50', '美丽', '2024-07-05 04:56:20.794054', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('51', '测试', '2024-07-05 04:56:20.798537', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('52', '测试', '2024-07-05 04:57:17.425599', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('53', '美丽', '2024-07-05 04:57:17.447200', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('54', '冒险', '2024-07-05 04:57:17.452086', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('55', '美丽', '2024-07-05 04:57:17.459330', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('56', '测试', '2024-07-05 04:57:17.463320', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('57', '测试', '2024-07-05 04:58:14.675205', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('58', '美丽', '2024-07-05 04:58:14.697156', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('59', '冒险', '2024-07-05 04:58:14.702145', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('60', '美丽', '2024-07-05 04:58:14.708088', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('61', '测试', '2024-07-05 04:58:14.713075', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('62', '测试', '2024-07-05 05:00:13.463118', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('63', '美丽', '2024-07-05 05:00:13.485059', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('64', '冒险', '2024-07-05 05:00:13.489088', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('65', '美丽', '2024-07-05 05:00:13.496030', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('66', '测试', '2024-07-05 05:00:13.501018', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('67', '测试', '2024-07-05 05:00:35.322452', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('68', '美丽', '2024-07-05 05:00:35.345091', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('69', '冒险', '2024-07-05 05:00:35.352299', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('70', '美丽', '2024-07-05 05:00:35.359857', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('71', '测试', '2024-07-05 05:00:35.363789', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('72', '测试', '2024-07-05 05:06:32.110183', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('73', '美丽', '2024-07-05 05:06:32.131980', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('74', '冒险', '2024-07-05 05:06:32.136941', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('75', '美丽', '2024-07-05 05:06:32.143924', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('76', '测试', '2024-07-05 05:06:32.148226', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('77', '测试', '2024-07-05 05:06:32.164483', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('78', '测试', '2024-07-05 05:07:52.064423', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('79', '美丽', '2024-07-05 05:07:52.089356', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('80', '冒险', '2024-07-05 05:07:52.093344', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('81', '美丽', '2024-07-05 05:07:52.101324', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('82', '测试', '2024-07-05 05:07:52.107311', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('83', '测试', '2024-07-05 05:07:52.124300', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('84', '测试', '2024-07-05 05:54:56.537211', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('85', '美丽', '2024-07-05 05:54:56.559203', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('86', '冒险', '2024-07-05 05:54:56.564190', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('87', '美丽', '2024-07-05 05:54:56.570211', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('88', '测试', '2024-07-05 05:54:56.574164', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('89', '测试', '2024-07-05 05:54:56.591119', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('90', '测试', '2024-07-05 06:04:23.694032', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('91', '美丽', '2024-07-05 06:04:23.716394', '5', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('92', '冒险', '2024-07-05 06:04:23.721336', '6', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('93', '美丽', '2024-07-05 06:04:23.729209', '8', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('94', '测试', '2024-07-05 06:04:23.734421', '9', '1');
INSERT INTO `exam_incorrectanswer` VALUES ('95', '测试', '2024-07-05 06:04:23.750601', '9', '1');

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `marks` int NOT NULL,
  `exam_id` bigint NOT NULL,
  `question_type` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_question_exam_id_e32fc5a5_fk_exam_exam_id` (`exam_id`),
  CONSTRAINT `exam_question_exam_id_e32fc5a5_fk_exam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam_exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES ('5', 'Adventure翻译成中文是啥意思', '10', '4', 'MC');
INSERT INTO `exam_question` VALUES ('6', 'Beautiful是啥意思', '10', '4', 'MC');
INSERT INTO `exam_question` VALUES ('7', 'Courageous是啥意思', '10', '4', 'MC');
INSERT INTO `exam_question` VALUES ('8', 'Dream是啥意思', '10', '4', 'MC');
INSERT INTO `exam_question` VALUES ('9', 'Passion是啥意思', '10', '4', 'FB');

-- ----------------------------
-- Table structure for exam_useranswer
-- ----------------------------
DROP TABLE IF EXISTS `exam_useranswer`;
CREATE TABLE `exam_useranswer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choice_id` bigint DEFAULT NULL,
  `question_id` bigint NOT NULL,
  `user_exam_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `fill_in_blank_answer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_useranswer_question_id_015c9793_fk_exam_question_id` (`question_id`),
  KEY `exam_useranswer_user_exam_id_82af405b_fk_exam_userexam_id` (`user_exam_id`),
  KEY `exam_useranswer_user_id_e055c903_fk_auth_user_id` (`user_id`),
  KEY `exam_useranswer_choice_id_1bae37ab_fk_exam_choice_id` (`choice_id`),
  CONSTRAINT `exam_useranswer_choice_id_1bae37ab_fk_exam_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `exam_choice` (`id`),
  CONSTRAINT `exam_useranswer_question_id_015c9793_fk_exam_question_id` FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`),
  CONSTRAINT `exam_useranswer_user_exam_id_82af405b_fk_exam_userexam_id` FOREIGN KEY (`user_exam_id`) REFERENCES `exam_userexam` (`id`),
  CONSTRAINT `exam_useranswer_user_id_e055c903_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_useranswer
-- ----------------------------
INSERT INTO `exam_useranswer` VALUES ('18', '19', '8', '11', '1', null);
INSERT INTO `exam_useranswer` VALUES ('19', '15', '6', '11', '1', null);
INSERT INTO `exam_useranswer` VALUES ('20', '13', '5', '11', '1', null);
INSERT INTO `exam_useranswer` VALUES ('21', null, '9', '11', '1', '测试');
INSERT INTO `exam_useranswer` VALUES ('22', '17', '7', '11', '1', null);
INSERT INTO `exam_useranswer` VALUES ('23', '17', '7', '12', '1', null);
INSERT INTO `exam_useranswer` VALUES ('24', '15', '6', '12', '1', null);
INSERT INTO `exam_useranswer` VALUES ('25', '19', '8', '12', '1', null);
INSERT INTO `exam_useranswer` VALUES ('26', null, '9', '12', '1', '激情');
INSERT INTO `exam_useranswer` VALUES ('27', '13', '5', '12', '1', null);
INSERT INTO `exam_useranswer` VALUES ('28', '14', '5', '13', '1', null);
INSERT INTO `exam_useranswer` VALUES ('29', '20', '8', '13', '1', null);
INSERT INTO `exam_useranswer` VALUES ('30', null, '9', '13', '1', '测试');
INSERT INTO `exam_useranswer` VALUES ('31', '16', '6', '13', '1', null);
INSERT INTO `exam_useranswer` VALUES ('32', '17', '7', '13', '1', null);
INSERT INTO `exam_useranswer` VALUES ('33', '17', '7', '14', '1', null);
INSERT INTO `exam_useranswer` VALUES ('34', '15', '6', '14', '1', null);
INSERT INTO `exam_useranswer` VALUES ('35', null, '9', '14', '1', '测试');
INSERT INTO `exam_useranswer` VALUES ('36', '13', '5', '14', '1', null);
INSERT INTO `exam_useranswer` VALUES ('37', '19', '8', '14', '1', null);
INSERT INTO `exam_useranswer` VALUES ('38', null, '9', '15', '1', '激情');
INSERT INTO `exam_useranswer` VALUES ('39', '15', '6', '15', '1', null);
INSERT INTO `exam_useranswer` VALUES ('40', '19', '8', '15', '1', null);
INSERT INTO `exam_useranswer` VALUES ('41', '17', '7', '15', '1', null);
INSERT INTO `exam_useranswer` VALUES ('42', '13', '5', '15', '1', null);

-- ----------------------------
-- Table structure for exam_userexam
-- ----------------------------
DROP TABLE IF EXISTS `exam_userexam`;
CREATE TABLE `exam_userexam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `submitted` tinyint(1) NOT NULL,
  `exam_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_userexam_exam_id_ad4ffc00_fk_exam_exam_id` (`exam_id`),
  KEY `exam_userexam_user_id_3629c5c9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `exam_userexam_exam_id_ad4ffc00_fk_exam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam_exam` (`id`),
  CONSTRAINT `exam_userexam_user_id_3629c5c9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_userexam
-- ----------------------------
INSERT INTO `exam_userexam` VALUES ('11', '0', '4', '1');
INSERT INTO `exam_userexam` VALUES ('12', '0', '4', '1');
INSERT INTO `exam_userexam` VALUES ('13', '0', '4', '1');
INSERT INTO `exam_userexam` VALUES ('14', '0', '4', '1');
INSERT INTO `exam_userexam` VALUES ('15', '0', '4', '1');

-- ----------------------------
-- Table structure for exam_userscore
-- ----------------------------
DROP TABLE IF EXISTS `exam_userscore`;
CREATE TABLE `exam_userscore` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` int NOT NULL,
  `user_exam_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_exam_id` (`user_exam_id`),
  CONSTRAINT `exam_userscore_user_exam_id_4a3e4cf0_fk_exam_userexam_id` FOREIGN KEY (`user_exam_id`) REFERENCES `exam_userexam` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_userscore
-- ----------------------------

-- ----------------------------
-- Table structure for exam_wrongname
-- ----------------------------
DROP TABLE IF EXISTS `exam_wrongname`;
CREATE TABLE `exam_wrongname` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exam_wrongname
-- ----------------------------
INSERT INTO `exam_wrongname` VALUES ('1', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('2', 'Adventure翻译成中文是啥意思');
INSERT INTO `exam_wrongname` VALUES ('3', 'Beautiful是啥意思');
INSERT INTO `exam_wrongname` VALUES ('4', 'Dream是啥意思');
INSERT INTO `exam_wrongname` VALUES ('5', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('6', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('7', 'Adventure翻译成中文是啥意思');
INSERT INTO `exam_wrongname` VALUES ('8', 'Beautiful是啥意思');
INSERT INTO `exam_wrongname` VALUES ('9', 'Dream是啥意思');
INSERT INTO `exam_wrongname` VALUES ('10', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('11', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('12', 'Adventure翻译成中文是啥意思');
INSERT INTO `exam_wrongname` VALUES ('13', 'Beautiful是啥意思');
INSERT INTO `exam_wrongname` VALUES ('14', 'Dream是啥意思');
INSERT INTO `exam_wrongname` VALUES ('15', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('16', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('17', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('18', 'Adventure翻译成中文是啥意思');
INSERT INTO `exam_wrongname` VALUES ('19', 'Beautiful是啥意思');
INSERT INTO `exam_wrongname` VALUES ('20', 'Dream是啥意思');
INSERT INTO `exam_wrongname` VALUES ('21', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('22', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('23', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('24', 'Adventure翻译成中文是啥意思');
INSERT INTO `exam_wrongname` VALUES ('25', 'Beautiful是啥意思');
INSERT INTO `exam_wrongname` VALUES ('26', 'Dream是啥意思');
INSERT INTO `exam_wrongname` VALUES ('27', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('28', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('29', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('30', 'Adventure翻译成中文是啥意思');
INSERT INTO `exam_wrongname` VALUES ('31', 'Beautiful是啥意思');
INSERT INTO `exam_wrongname` VALUES ('32', 'Dream是啥意思');
INSERT INTO `exam_wrongname` VALUES ('33', 'Passion是啥意思');
INSERT INTO `exam_wrongname` VALUES ('34', 'Passion是啥意思');
