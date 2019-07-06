-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 22 2019 г., 00:43
-- Версия сервера: 10.3.9-MariaDB
-- Версия PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `e-lib`
--
CREATE DATABASE IF NOT EXISTS `e-lib` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `e-lib`;

-- --------------------------------------------------------

--
-- Структура таблицы `accepted_query`
--

DROP TABLE IF EXISTS `accepted_query`;
CREATE TABLE `accepted_query` (
  `id` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `deadline_date` date NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrator', '1', 1555852988),
('administrator', '7', 1555863892),
('manager', '7', 1555863892),
('user', '7', 1555863892);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrator', 1, 'Administrator', NULL, NULL, 1555852988, 1555852988),
('loginToBackend', 2, 'Login to backend', NULL, NULL, 1555852988, 1555852988),
('manager', 1, 'Manager', NULL, NULL, 1555852988, 1555852988),
('user', 1, 'User', NULL, NULL, 1555852988, 1555852988);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('administrator', 'manager'),
('manager', 'loginToBackend'),
('manager', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('ownModelRule', 0x4f3a32343a22636f6d6d6f6e5c726261635c4f776e4d6f64656c52756c65223a333a7b733a343a226e616d65223b733a31323a226f776e4d6f64656c52756c65223b733a393a22637265617465644174223b693a313535353835323938383b733a393a22757064617465644174223b693a313535353835323938383b7d, 1555852988, 1555852988);

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `release_year` int(11) NOT NULL,
  `description` text NOT NULL,
  `cover_img_url` varchar(255) NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `title`, `quantity`, `category_id`, `author`, `release_year`, `description`, `cover_img_url`, `file_url`, `created_at`, `updated_at`) VALUES
(1, 'Test-Book', 1, 1, 'Some author', 2014, 'This is a test description', '5cbca2268268e.png', '5cbca228dd64f.docx', 1555866154, 1555875006);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Mathematics', 1555866122, 1555866122);

-- --------------------------------------------------------

--
-- Структура таблицы `declined_query`
--

DROP TABLE IF EXISTS `declined_query`;
CREATE TABLE `declined_query` (
  `id` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `favorite_book`
--

DROP TABLE IF EXISTS `favorite_book`;
CREATE TABLE `favorite_book` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `favorite_book`
--

INSERT INTO `favorite_book` (`id`, `user_id`, `book_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1555875479, 1555875479);

-- --------------------------------------------------------

--
-- Структура таблицы `key_storage_item`
--

DROP TABLE IF EXISTS `key_storage_item`;
CREATE TABLE `key_storage_item` (
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `key_storage_item`
--

INSERT INTO `key_storage_item` (`key`, `value`, `comment`) VALUES
('backend.layout-boxed', '0', NULL),
('backend.layout-collapsed-sidebar', '0', NULL),
('backend.layout-fixed', '0', NULL),
('backend.layout-mini-sidebar', '0', NULL),
('backend.theme-skin', 'skin-blue', NULL),
('frontend.email-confirm', '1', NULL),
('frontend.registration', '0', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `log`
--

INSERT INTO `log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(1, 1, 'yii\\db\\Exception', 1555853229.9363, '[app-frontend][/]', 'PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'e-lib.navbar_menu\' doesn\'t exist in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php:1290\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1290): PDOStatement->execute()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1158): yii\\db\\Command->internalExecute(\'SELECT * FROM `...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(399): yii\\db\\Command->queryInternal(\'fetchAll\', NULL)\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Query.php(237): yii\\db\\Command->queryAll()\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveQuery.php(133): yii\\db\\Query->all(NULL)\n#5 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\query\\MenuQuery.php(41): yii\\db\\ActiveQuery->all(NULL)\n#6 D:\\OSPanel\\domains\\e-lib.local\\frontend\\models\\NavItem.php(24): common\\models\\query\\MenuQuery->all()\n#7 D:\\OSPanel\\domains\\e-lib.local\\frontend\\views\\layouts\\main.php(71): frontend\\models\\NavItem::getMenuItems()\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', \'[<span class=\"s...\')\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(399): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(frontend\\controllers\\SiteController))\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(385): yii\\base\\Controller->renderContent(\'<div class=\"sit...\')\n#12 D:\\OSPanel\\domains\\e-lib.local\\frontend\\controllers\\SiteController.php(41): yii\\base\\Controller->render(\'index\')\n#13 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/index\', Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#19 D:\\OSPanel\\domains\\e-lib.local\\frontend\\web\\index.php(32): yii\\base\\Application->run()\n#20 {main}\n\nNext yii\\db\\Exception: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'e-lib.navbar_menu\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `navbar_menu` WHERE (`parent_id` IS NULL) AND (`status`=1) ORDER BY `sort_index` in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php:664\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1295): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1158): yii\\db\\Command->internalExecute(\'SELECT * FROM `...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(399): yii\\db\\Command->queryInternal(\'fetchAll\', NULL)\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Query.php(237): yii\\db\\Command->queryAll()\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveQuery.php(133): yii\\db\\Query->all(NULL)\n#5 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\query\\MenuQuery.php(41): yii\\db\\ActiveQuery->all(NULL)\n#6 D:\\OSPanel\\domains\\e-lib.local\\frontend\\models\\NavItem.php(24): common\\models\\query\\MenuQuery->all()\n#7 D:\\OSPanel\\domains\\e-lib.local\\frontend\\views\\layouts\\main.php(71): frontend\\models\\NavItem::getMenuItems()\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', \'[<span class=\"s...\')\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(399): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(frontend\\controllers\\SiteController))\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(385): yii\\base\\Controller->renderContent(\'<div class=\"sit...\')\n#12 D:\\OSPanel\\domains\\e-lib.local\\frontend\\controllers\\SiteController.php(41): yii\\base\\Controller->render(\'index\')\n#13 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/index\', Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#19 D:\\OSPanel\\domains\\e-lib.local\\frontend\\web\\index.php(32): yii\\base\\Application->run()\n#20 {main}\r\nAdditional Information:\r\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'e-lib.navbar_menu\' doesn\'t exist\n)\n'),
(2, 1, 'yii\\db\\Exception', 1555854009.4096, '[app-backend][/admin/user/create]', 'PDOException: SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php:1290\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1290): PDOStatement->execute()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1091): yii\\db\\Command->internalExecute(\'INSERT INTO `us...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php(433): yii\\db\\Command->execute()\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(600): yii\\db\\Schema->insert(\'{{%user}}\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(566): yii\\db\\ActiveRecord->insertInternal(NULL)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(678): yii\\db\\ActiveRecord->insert(true, NULL)\n#6 D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php(106): yii\\db\\BaseActiveRecord->save()\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(62): backend\\models\\UserForm->save()\n#8 [internal function]: backend\\controllers\\UserController->actionCreate()\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#14 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#15 {main}\n\nNext yii\\db\\Exception: SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value\nThe SQL being executed was: INSERT INTO `user` (`username`, `status`, `password_hash`, `auth_key`, `created_at`, `updated_at`) VALUES (\'Bositkhon\', 1, \'$2y$13$W6nAIAzBELsusIBtvuYt0OAq2KkfsnJCCMXdM3fkXERoUCMaoYv4u\', \'MqdSh2tnt7gvgXQleF5LcGhG4BOQmcCY\', 1555854009, 1555854009) in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php:664\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1295): yii\\db\\Schema->convertException(Object(PDOException), \'INSERT INTO `us...\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1091): yii\\db\\Command->internalExecute(\'INSERT INTO `us...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php(433): yii\\db\\Command->execute()\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(600): yii\\db\\Schema->insert(\'{{%user}}\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(566): yii\\db\\ActiveRecord->insertInternal(NULL)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(678): yii\\db\\ActiveRecord->insert(true, NULL)\n#6 D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php(106): yii\\db\\BaseActiveRecord->save()\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(62): backend\\models\\UserForm->save()\n#8 [internal function]: backend\\controllers\\UserController->actionCreate()\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#14 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#15 {main}\r\nAdditional Information:\r\nArray\n(\n    [0] => HY000\n    [1] => 1364\n    [2] => Field \'email\' doesn\'t have a default value\n)\n'),
(3, 1, 'Error', 1555862728.4567, '[app-backend][/admin/user/create]', 'Error: Class \'UserProfile\' not found in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\user\\create.php:36\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\UserController))\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'create\', Array, Object(backend\\controllers\\UserController))\n#4 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(72): yii\\base\\Controller->render(\'create\', Array)\n#5 [internal function]: backend\\controllers\\UserController->actionCreate()\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#12 {main}'),
(4, 1, 'yii\\base\\InvalidCallException', 1555862753.4443, '[app-backend][/admin/user/create]', 'yii\\base\\InvalidCallException: Unable to link models: the primary key of common\\models\\UserProfile is null. in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php:1572\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(1350): yii\\db\\BaseActiveRecord->bindModels(Array, Object(common\\models\\UserProfile), Object(common\\models\\UserProfile))\n#1 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\User.php(212): yii\\db\\BaseActiveRecord->link(\'user\', Object(common\\models\\UserProfile))\n#2 D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php(108): common\\models\\User->afterSignup(Array)\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(65): backend\\models\\UserForm->save(Array)\n#4 [internal function]: backend\\controllers\\UserController->actionCreate()\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#11 {main}'),
(5, 1, 'Error', 1555862888.9233, '[app-backend][/admin/user/update?id=3]', 'Error: Call to a member function isAttributeRequired() on null in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php:924\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php(402): yii\\widgets\\ActiveField->addAriaAttributes(\'<span class=\"st...\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\user\\update.php(31): yii\\widgets\\ActiveField->textInput(\'<span class=\"st...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\UserController))\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'update\', Array, Object(backend\\controllers\\UserController))\n#6 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(101): yii\\base\\Controller->render(\'update\', Array)\n#7 [internal function]: backend\\controllers\\UserController->actionUpdate(\'3\')\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'update\', Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/update\', Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#13 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#14 {main}'),
(6, 1, 'Error', 1555862906.6409, '[app-backend][/admin/user/update?id=2]', 'Error: Call to a member function isAttributeRequired() on null in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php:924\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php(402): yii\\widgets\\ActiveField->addAriaAttributes(\'<span class=\"st...\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\user\\update.php(31): yii\\widgets\\ActiveField->textInput(\'<span class=\"st...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\UserController))\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'update\', Array, Object(backend\\controllers\\UserController))\n#6 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(101): yii\\base\\Controller->render(\'update\', Array)\n#7 [internal function]: backend\\controllers\\UserController->actionUpdate(\'2\')\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'update\', Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/update\', Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#13 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#14 {main}'),
(7, 1, 'Error', 1555862909.7463, '[app-backend][/admin/user/update?id=1]', 'Error: Call to a member function isAttributeRequired() on null in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php:924\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php(402): yii\\widgets\\ActiveField->addAriaAttributes(\'<span class=\"st...\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\user\\update.php(31): yii\\widgets\\ActiveField->textInput(\'<span class=\"st...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\UserController))\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'update\', Array, Object(backend\\controllers\\UserController))\n#6 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(101): yii\\base\\Controller->render(\'update\', Array)\n#7 [internal function]: backend\\controllers\\UserController->actionUpdate(\'1\')\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'update\', Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/update\', Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#13 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#14 {main}'),
(8, 1, 'Error', 1555862944.572, '[app-backend][/admin/user/update?id=1]', 'Error: Class \'UserProfile\' not found in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\user\\update.php:39\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\UserController))\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'update\', Array, Object(backend\\controllers\\UserController))\n#4 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(101): yii\\base\\Controller->render(\'update\', Array)\n#5 [internal function]: backend\\controllers\\UserController->actionUpdate(\'1\')\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'update\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/update\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#12 {main}'),
(9, 1, 'yii\\base\\InvalidCallException', 1555863074.3057, '[app-backend][/admin/user/create]', 'yii\\base\\InvalidCallException: Unable to link models: the primary key of common\\models\\UserProfile is null. in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php:1572\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(1350): yii\\db\\BaseActiveRecord->bindModels(Array, Object(common\\models\\UserProfile), Object(common\\models\\UserProfile))\n#1 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\User.php(212): yii\\db\\BaseActiveRecord->link(\'user\', Object(common\\models\\UserProfile))\n#2 D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php(108): common\\models\\User->afterSignup(Array)\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(65): backend\\models\\UserForm->save(Array)\n#4 [internal function]: backend\\controllers\\UserController->actionCreate()\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#11 {main}'),
(10, 1, 'yii\\base\\InvalidCallException', 1555863208.0645, '[app-backend][/admin/user/create]', 'yii\\base\\InvalidCallException: Unable to link models: the primary key of common\\models\\UserProfile is null. in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php:1572\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(1350): yii\\db\\BaseActiveRecord->bindModels(Array, Object(common\\models\\UserProfile), Object(common\\models\\UserProfile))\n#1 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\User.php(212): yii\\db\\BaseActiveRecord->link(\'user\', Object(common\\models\\UserProfile))\n#2 D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php(108): common\\models\\User->afterSignup(Array)\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(65): backend\\models\\UserForm->save(Array)\n#4 [internal function]: backend\\controllers\\UserController->actionCreate()\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#11 {main}'),
(11, 1, 'yii\\db\\Exception', 1555863482.5508, '[app-backend][/admin/user/create]', 'PDOException: SQLSTATE[HY000]: General error: 1364 Field \'user_id\' doesn\'t have a default value in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php:1290\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1290): PDOStatement->execute()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1091): yii\\db\\Command->internalExecute(\'INSERT INTO `us...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php(433): yii\\db\\Command->execute()\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(600): yii\\db\\Schema->insert(\'user_profile\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(566): yii\\db\\ActiveRecord->insertInternal(NULL)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(678): yii\\db\\ActiveRecord->insert(true, NULL)\n#6 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\User.php(212): yii\\db\\BaseActiveRecord->save()\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php(108): common\\models\\User->afterSignup(Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(65): backend\\models\\UserForm->save(Array)\n#9 [internal function]: backend\\controllers\\UserController->actionCreate()\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#16 {main}\n\nNext yii\\db\\Exception: SQLSTATE[HY000]: General error: 1364 Field \'user_id\' doesn\'t have a default value\nThe SQL being executed was: INSERT INTO `user_profile` (`firstname`, `lastname`, `middlename`, `gender`) VALUES (\'Bositkhon\', \'Shoumarov\', \'\', 1) in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php:664\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1295): yii\\db\\Schema->convertException(Object(PDOException), \'INSERT INTO `us...\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1091): yii\\db\\Command->internalExecute(\'INSERT INTO `us...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php(433): yii\\db\\Command->execute()\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(600): yii\\db\\Schema->insert(\'user_profile\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(566): yii\\db\\ActiveRecord->insertInternal(NULL)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(678): yii\\db\\ActiveRecord->insert(true, NULL)\n#6 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\User.php(212): yii\\db\\BaseActiveRecord->save()\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php(108): common\\models\\User->afterSignup(Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(65): backend\\models\\UserForm->save(Array)\n#9 [internal function]: backend\\controllers\\UserController->actionCreate()\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/create\', Array)\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#16 {main}\r\nAdditional Information:\r\nArray\n(\n    [0] => HY000\n    [1] => 1364\n    [2] => Field \'user_id\' doesn\'t have a default value\n)\n'),
(12, 1, 'TypeError', 1555863524.9833, '[app-backend][/admin/user/update?id=7]', 'TypeError: Argument 1 passed to backend\\models\\UserForm::save() must be of the type array, boolean given, called in D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php on line 93 and defined in D:\\OSPanel\\domains\\e-lib.local\\backend\\models\\UserForm.php:96\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\UserController.php(93): backend\\models\\UserForm->save(false)\n#1 [internal function]: backend\\controllers\\UserController->actionUpdate(\'7\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'update\', Array)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/update\', Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#8 {main}'),
(13, 1, 'Error', 1555864636.766, '[app-backend][/admin/book/create]', 'Error: Class \'FileAPI\' not found in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\_form.php:31\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, NULL)\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\create.php(17): yii\\base\\View->render(\'_form\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\BookController))\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'create\', Array, Object(backend\\controllers\\BookController))\n#8 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\BookController.php(86): yii\\base\\Controller->render(\'create\', Array)\n#9 [internal function]: backend\\controllers\\BookController->actionCreate()\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'book/create\', Array)\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#16 {main}'),
(14, 1, 'yii\\base\\UnknownPropertyException', 1555865195.1881, '[app-backend][/admin/book/create]', 'yii\\base\\UnknownPropertyException: Setting unknown property: vova07\\fileapi\\behaviors\\UploadBehavior::uploadOnlyImage in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\BaseObject.php:163\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\BaseYii.php(546): yii\\base\\BaseObject->__set(\'uploadOnlyImage\', false)\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(107): yii\\BaseYii::configure(Object(vova07\\fileapi\\behaviors\\UploadBehavior), Array)\n#2 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(384): ReflectionClass->newInstanceArgs(Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(156): yii\\di\\Container->build(\'vova07\\\\fileapi\\\\...\', Array, Array)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\BaseYii.php(349): yii\\di\\Container->get(\'vova07\\\\fileapi\\\\...\', Array, Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php(750): yii\\BaseYii::createObject(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php(734): yii\\base\\Component->attachBehaviorInternal(1, Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php(603): yii\\base\\Component->ensureBehaviors()\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(933): yii\\base\\Component->trigger(\'init\')\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\db\\BaseActiveRecord->init()\n#11 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\BookController.php(79): yii\\base\\BaseObject->__construct()\n#12 [internal function]: backend\\controllers\\BookController->actionCreate()\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'book/create\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#18 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#19 {main}'),
(15, 1, 'Error', 1555866261.8937, '[app-backend][/admin/book/index]', 'Error: Call to a member function getCoverImageURL() on integer in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\index.php:39\nStack trace:\n#0 [internal function]: yii\\base\\View->{closure}(Object(common\\models\\Book), 1, 0, Object(yii\\grid\\DataColumn))\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(230): call_user_func(Object(Closure), Object(common\\models\\Book), 1, 0, Object(yii\\grid\\DataColumn))\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(244): yii\\grid\\DataColumn->getDataCellValue(Object(common\\models\\Book), 1, 0)\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\Column.php(111): yii\\grid\\DataColumn->renderDataCellContent(Object(common\\models\\Book), 1, 0)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(525): yii\\grid\\Column->renderDataCell(Object(common\\models\\Book), 1, 0)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(common\\models\\Book), 1, 0)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\grid\\GridView->renderSection(\'{items}\')\n#10 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}\\n{item...\')\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Widget.php(140): yii\\grid\\GridView->run()\n#14 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\index.php(23): yii\\base\\Widget::widget(Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\BookController))\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\controllers\\BookController))\n#19 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\BookController.php(56): yii\\base\\Controller->render(\'index\', Array)\n#20 [internal function]: backend\\controllers\\BookController->actionIndex()\n#21 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#22 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#23 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#24 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'book/index\', Array)\n#25 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#26 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#27 {main}'),
(16, 1, 'Error', 1555866280.1125, '[app-backend][/admin/book/index]', 'Error: Call to a member function getCoverImageURL() on integer in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\index.php:40\nStack trace:\n#0 [internal function]: yii\\base\\View->{closure}(Object(common\\models\\Book), 1, 0, Object(yii\\grid\\DataColumn))\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(230): call_user_func(Object(Closure), Object(common\\models\\Book), 1, 0, Object(yii\\grid\\DataColumn))\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(244): yii\\grid\\DataColumn->getDataCellValue(Object(common\\models\\Book), 1, 0)\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\Column.php(111): yii\\grid\\DataColumn->renderDataCellContent(Object(common\\models\\Book), 1, 0)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(525): yii\\grid\\Column->renderDataCell(Object(common\\models\\Book), 1, 0)\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(common\\models\\Book), 1, 0)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\grid\\GridView->renderSection(\'{items}\')\n#10 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}\\n{item...\')\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Widget.php(140): yii\\grid\\GridView->run()\n#14 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\index.php(23): yii\\base\\Widget::widget(Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\BookController))\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\controllers\\BookController))\n#19 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\BookController.php(56): yii\\base\\Controller->render(\'index\', Array)\n#20 [internal function]: backend\\controllers\\BookController->actionIndex()\n#21 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#22 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#23 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#24 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'book/index\', Array)\n#25 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#26 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#27 {main}'),
(17, 1, 'yii\\base\\ErrorException:2', 1555867007.7885, '[app-backend][/admin/book/view?id=1]', 'yii\\base\\ErrorException: Missing argument 3 for yii\\base\\View::{closure}() in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php:43\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php(43): yii\\base\\ErrorHandler->handleError(2, \'Missing argumen...\', \'D:\\\\OSPanel\\\\doma...\', 43, Array)\n#1 [internal function]: yii\\base\\View->{closure}(Object(common\\models\\Book), Object(yii\\widgets\\DetailView))\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\DetailView.php(245): call_user_func(Object(Closure), Object(common\\models\\Book), Object(yii\\widgets\\DetailView))\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\DetailView.php(143): yii\\widgets\\DetailView->normalizeAttributes()\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\widgets\\DetailView->init()\n#5 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(384): ReflectionClass->newInstanceArgs(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(156): yii\\di\\Container->build(\'yii\\\\widgets\\\\Det...\', Array, Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\widgets\\\\Det...\', Array, Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Widget.php(137): yii\\BaseYii::createObject(Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php(58): yii\\base\\Widget::widget(Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\BookController))\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'view\', Array, Object(backend\\controllers\\BookController))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\BookController.php(69): yii\\base\\Controller->render(\'view\', Array)\n#16 [internal function]: backend\\controllers\\BookController->actionView(\'1\')\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#19 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'view\', Array)\n#20 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'book/view\', Array)\n#21 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#22 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(18, 1, 'yii\\base\\ErrorException:2', 1555867024.879, '[app-backend][/admin/book/view?id=1]', 'yii\\base\\ErrorException: Missing argument 3 for yii\\base\\View::{closure}() in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php:43\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php(43): yii\\base\\ErrorHandler->handleError(2, \'Missing argumen...\', \'D:\\\\OSPanel\\\\doma...\', 43, Array)\n#1 [internal function]: yii\\base\\View->{closure}(Object(common\\models\\Book), Object(yii\\widgets\\DetailView))\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\DetailView.php(245): call_user_func(Object(Closure), Object(common\\models\\Book), Object(yii\\widgets\\DetailView))\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\DetailView.php(143): yii\\widgets\\DetailView->normalizeAttributes()\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\widgets\\DetailView->init()\n#5 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(384): ReflectionClass->newInstanceArgs(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(156): yii\\di\\Container->build(\'yii\\\\widgets\\\\Det...\', Array, Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\widgets\\\\Det...\', Array, Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Widget.php(137): yii\\BaseYii::createObject(Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php(58): yii\\base\\Widget::widget(Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\BookController))\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'view\', Array, Object(backend\\controllers\\BookController))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\BookController.php(69): yii\\base\\Controller->render(\'view\', Array)\n#16 [internal function]: backend\\controllers\\BookController->actionView(\'1\')\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#19 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'view\', Array)\n#20 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'book/view\', Array)\n#21 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#22 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#23 {main}'),
(19, 1, 'yii\\base\\ErrorException:8', 1555867083.8672, '[app-backend][/admin/book/view?id=1]', 'yii\\base\\ErrorException: Undefined variable: model in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php:54\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php(54): yii\\base\\ErrorHandler->handleError(8, \'Undefined varia...\', \'D:\\\\OSPanel\\\\doma...\', 54, Array)\n#1 [internal function]: yii\\base\\View->{closure}(Object(common\\models\\Book), Object(yii\\widgets\\DetailView))\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\DetailView.php(245): call_user_func(Object(Closure), Object(common\\models\\Book), Object(yii\\widgets\\DetailView))\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\widgets\\DetailView.php(143): yii\\widgets\\DetailView->normalizeAttributes()\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\widgets\\DetailView->init()\n#5 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(384): ReflectionClass->newInstanceArgs(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\di\\Container.php(156): yii\\di\\Container->build(\'yii\\\\widgets\\\\Det...\', Array, Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\widgets\\\\Det...\', Array, Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Widget.php(137): yii\\BaseYii::createObject(Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\book\\view.php(58): yii\\base\\Widget::widget(Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\BookController))\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'view\', Array, Object(backend\\controllers\\BookController))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\BookController.php(69): yii\\base\\Controller->render(\'view\', Array)\n#16 [internal function]: backend\\controllers\\BookController->actionView(\'1\')\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#19 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'view\', Array)\n#20 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'book/view\', Array)\n#21 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#22 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#23 {main}'),
(20, 1, 'ParseError', 1555868059.6791, '[app-backend][/admin/favorite-book/index?FavoriteBookSearch%5Bid%5D=&FavoriteBookSearch%5Buser_id%5D=&FavoriteBookSearch%5Bbook_id%5D=&FavoriteBookSearch%5Bcreated_at%5D=&FavoriteBookSearch%5Bupdated_at%5D=]', 'ParseError: syntax error, unexpected \'\'created_at\'\' (T_CONSTANT_ENCAPSED_STRING), expecting \']\' in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\favorite-book\\index.php:40\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\FavoriteBookController))\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\controllers\\FavoriteBookController))\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\FavoriteBookController.php(43): yii\\base\\Controller->render(\'index\', Array)\n#4 [internal function]: backend\\controllers\\FavoriteBookController->actionIndex()\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'favorite-book/i...\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#11 {main}'),
(21, 1, 'Error', 1555868828.3694, '[app-backend][/admin/reserve-query/index]', 'Error: Class \'ArrayHelper\' not found in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\reserve-query\\index.php:31\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\ReserveQueryController))\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\controllers\\ReserveQueryController))\n#4 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\ReserveQueryController.php(43): yii\\base\\Controller->render(\'index\', Array)\n#5 [internal function]: backend\\controllers\\ReserveQueryController->actionIndex()\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'reserve-query/i...\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#12 {main}'),
(22, 1, 'Error', 1555868832.4044, '[app-backend][/admin/reserve-query/index]', 'Error: Class \'User\' not found in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\reserve-query\\index.php:32\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\ReserveQueryController))\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\controllers\\ReserveQueryController))\n#4 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\ReserveQueryController.php(43): yii\\base\\Controller->render(\'index\', Array)\n#5 [internal function]: backend\\controllers\\ReserveQueryController->actionIndex()\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'reserve-query/i...\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#12 {main}'),
(23, 1, 'ParseError', 1555869579.5132, '[app-backend][/admin/reserve-query/index]', 'ParseError: syntax error, unexpected \'}\', expecting \';\' in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\reserve-query\\index.php:50\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\ReserveQueryController))\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\controllers\\ReserveQueryController))\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\ReserveQueryController.php(43): yii\\base\\Controller->render(\'index\', Array)\n#4 [internal function]: backend\\controllers\\ReserveQueryController->actionIndex()\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'reserve-query/i...\', Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#10 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#11 {main}'),
(24, 1, 'yii\\base\\UnknownPropertyException', 1555871906.9275, '[app-backend][/admin/accepted-query/create]', 'yii\\base\\UnknownPropertyException: Getting unknown property: common\\models\\ReserveQuery::reservation in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php:154\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(298): yii\\base\\Component->__get(\'reservation\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(209): yii\\db\\BaseActiveRecord->__get(\'reservation\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(580): yii\\helpers\\BaseArrayHelper::getValue(Object(common\\models\\ReserveQuery), \'reservation\')\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\_form.php(18): yii\\helpers\\BaseArrayHelper::map(Array, \'id\', \'reservation\')\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, NULL)\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\create.php(15): yii\\base\\View->render(\'_form\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\View.php(212): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Controller.php(49): yii\\web\\View->renderAjax(\'create\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#12 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\AcceptedQueryController.php(74): yii\\web\\Controller->renderAjax(\'create\', Array)\n#13 [internal function]: backend\\controllers\\AcceptedQueryController->actionCreate()\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'accepted-query/...\', Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#19 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#20 {main}'),
(25, 1, 'yii\\base\\UnknownPropertyException', 1555871970.2801, '[app-backend][/admin/accepted-query/create]', 'yii\\base\\UnknownPropertyException: Getting unknown property: common\\models\\ReserveQuery::reservation in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php:154\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(298): yii\\base\\Component->__get(\'reservation\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(209): yii\\db\\BaseActiveRecord->__get(\'reservation\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(580): yii\\helpers\\BaseArrayHelper::getValue(Object(common\\models\\ReserveQuery), \'reservation\')\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\_form.php(18): yii\\helpers\\BaseArrayHelper::map(Array, \'id\', \'reservation\')\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, NULL)\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\create.php(15): yii\\base\\View->render(\'_form\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\View.php(212): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Controller.php(49): yii\\web\\View->renderAjax(\'create\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#12 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\AcceptedQueryController.php(74): yii\\web\\Controller->renderAjax(\'create\', Array)\n#13 [internal function]: backend\\controllers\\AcceptedQueryController->actionCreate()\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'accepted-query/...\', Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#19 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#20 {main}'),
(26, 1, 'yii\\base\\UnknownPropertyException', 1555871974.7863, '[app-backend][/admin/accepted-query/create]', 'yii\\base\\UnknownPropertyException: Getting unknown property: common\\models\\ReserveQuery::reservation in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php:154\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(298): yii\\base\\Component->__get(\'reservation\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(209): yii\\db\\BaseActiveRecord->__get(\'reservation\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(580): yii\\helpers\\BaseArrayHelper::getValue(Object(common\\models\\ReserveQuery), \'reservation\')\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\_form.php(18): yii\\helpers\\BaseArrayHelper::map(Array, \'id\', \'reservation\')\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, NULL)\n#7 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\create.php(15): yii\\base\\View->render(\'_form\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\View.php(212): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Controller.php(49): yii\\web\\View->renderAjax(\'create\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#12 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\AcceptedQueryController.php(74): yii\\web\\Controller->renderAjax(\'create\', Array)\n#13 [internal function]: backend\\controllers\\AcceptedQueryController->actionCreate()\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#15 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'accepted-query/...\', Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#19 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#20 {main}'),
(27, 1, 'yii\\base\\UnknownMethodException', 1555871988.8828, '[app-backend][/admin/accepted-query/create]', 'yii\\base\\UnknownMethodException: Calling unknown method: common\\models\\User::getFullname() in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php:300\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\common\\models\\ReserveQuery.php(104): yii\\base\\Component->__call(\'getFullname\', Array)\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Component.php(139): common\\models\\ReserveQuery->getReservationInfO()\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(298): yii\\base\\Component->__get(\'reservationInfo\')\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(209): yii\\db\\BaseActiveRecord->__get(\'reservationInfo\')\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\helpers\\BaseArrayHelper.php(580): yii\\helpers\\BaseArrayHelper::getValue(Object(common\\models\\ReserveQuery), \'reservationInfo\')\n#5 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\_form.php(18): yii\\helpers\\BaseArrayHelper::map(Array, \'id\', \'reservationInfo\')\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, NULL)\n#9 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\accepted-query\\create.php(15): yii\\base\\View->render(\'_form\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\View.php(212): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Controller.php(49): yii\\web\\View->renderAjax(\'create\', Array, Object(backend\\controllers\\AcceptedQueryController))\n#14 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\AcceptedQueryController.php(74): yii\\web\\Controller->renderAjax(\'create\', Array)\n#15 [internal function]: backend\\controllers\\AcceptedQueryController->actionCreate()\n#16 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#17 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#18 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#19 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'accepted-query/...\', Array)\n#20 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#21 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#22 {main}'),
(28, 1, 'yii\\db\\IntegrityException', 1555874517.6535, '[app-backend][/admin/reserve-query/delete?id=1]', 'PDOException: SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`e-lib`.`accepted_query`, CONSTRAINT `accepted_query_ibfk_1` FOREIGN KEY (`query_id`) REFERENCES `reserve_query` (`id`)) in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php:1290\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1290): PDOStatement->execute()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1091): yii\\db\\Command->internalExecute(\'DELETE FROM `re...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(401): yii\\db\\Command->execute()\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(761): yii\\db\\ActiveRecord::deleteAll(Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(720): yii\\db\\ActiveRecord->deleteInternal()\n#5 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\ReserveQueryController.php(107): yii\\db\\ActiveRecord->delete()\n#6 [internal function]: backend\\controllers\\ReserveQueryController->actionDelete(\'1\')\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'delete\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'reserve-query/d...\', Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#12 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#13 {main}\n\nNext yii\\db\\IntegrityException: SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`e-lib`.`accepted_query`, CONSTRAINT `accepted_query_ibfk_1` FOREIGN KEY (`query_id`) REFERENCES `reserve_query` (`id`))\nThe SQL being executed was: DELETE FROM `reserve_query` WHERE `id`=1 in D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Schema.php:664\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1295): yii\\db\\Schema->convertException(Object(PDOException), \'DELETE FROM `re...\')\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\Command.php(1091): yii\\db\\Command->internalExecute(\'DELETE FROM `re...\')\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(401): yii\\db\\Command->execute()\n#3 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(761): yii\\db\\ActiveRecord::deleteAll(Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(720): yii\\db\\ActiveRecord->deleteInternal()\n#5 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\ReserveQueryController.php(107): yii\\db\\ActiveRecord->delete()\n#6 [internal function]: backend\\controllers\\ReserveQueryController->actionDelete(\'1\')\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#8 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#9 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'delete\', Array)\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'reserve-query/d...\', Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#12 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#13 {main}\r\nAdditional Information:\r\nArray\n(\n    [0] => 23000\n    [1] => 1451\n    [2] => Cannot delete or update a parent row: a foreign key constraint fails (`e-lib`.`accepted_query`, CONSTRAINT `accepted_query_ibfk_1` FOREIGN KEY (`query_id`) REFERENCES `reserve_query` (`id`))\n)\n'),
(29, 1, 'Error', 1555875110.1153, '[app-backend][/admin/declined-query/create]', 'Error: Class \'ArrayHelper\' not found in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\declined-query\\_form.php:16\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, NULL)\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\declined-query\\create.php(15): yii\\base\\View->render(\'_form\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\View.php(212): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\DeclinedQueryController))\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Controller.php(49): yii\\web\\View->renderAjax(\'create\', Array, Object(backend\\controllers\\DeclinedQueryController))\n#8 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\DeclinedQueryController.php(74): yii\\web\\Controller->renderAjax(\'create\', Array)\n#9 [internal function]: backend\\controllers\\DeclinedQueryController->actionCreate()\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'declined-query/...\', Array)\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#16 {main}'),
(30, 1, 'Error', 1555875114.828, '[app-backend][/admin/declined-query/create]', 'Error: Class \'ArrayHelper\' not found in D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\declined-query\\_form.php:16\nStack trace:\n#0 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require()\n#1 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#2 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, NULL)\n#3 D:\\OSPanel\\domains\\e-lib.local\\backend\\views\\declined-query\\create.php(15): yii\\base\\View->render(\'_form\', Array)\n#4 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(348): require(\'D:\\\\OSPanel\\\\doma...\')\n#5 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'D:\\\\OSPanel\\\\doma...\', Array)\n#6 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\View.php(212): yii\\base\\View->renderFile(\'D:\\\\OSPanel\\\\doma...\', Array, Object(backend\\controllers\\DeclinedQueryController))\n#7 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Controller.php(49): yii\\web\\View->renderAjax(\'create\', Array, Object(backend\\controllers\\DeclinedQueryController))\n#8 D:\\OSPanel\\domains\\e-lib.local\\backend\\controllers\\DeclinedQueryController.php(74): yii\\web\\Controller->renderAjax(\'create\', Array)\n#9 [internal function]: backend\\controllers\\DeclinedQueryController->actionCreate()\n#10 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#11 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#12 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'create\', Array)\n#13 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'declined-query/...\', Array)\n#14 D:\\OSPanel\\domains\\e-lib.local\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#15 D:\\OSPanel\\domains\\e-lib.local\\backend\\web\\index.php(32): yii\\base\\Application->run()\n#16 {main}');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1555852978),
('m140506_102106_rbac_init', 1555852981),
('m141106_185632_log_init', 1555852981),
('m160101_000001_user', 1555852982),
('m160101_000002_key_storage_item', 1555852982),
('m160101_000003_navbar_menu', 1555852983),
('m160101_000004_page', 1555852983),
('m160101_000005_article', 1555852985),
('m160101_000006_tag', 1555852987),
('m160101_000007_data', 1555852988),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1555852988),
('m180523_151638_rbac_updates_indexes_without_prefix', 1555852988);

-- --------------------------------------------------------

--
-- Структура таблицы `reserve_query`
--

DROP TABLE IF EXISTS `reserve_query`;
CREATE TABLE `reserve_query` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reserve_query`
--

INSERT INTO `reserve_query` (`id`, `user_id`, `book_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 1555868768, 1555875432);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `action_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `access_token`, `password_hash`, `status`, `ip`, `created_at`, `updated_at`, `action_at`) VALUES
(1, 'Administrator', 'A-vmUP6hXRN3wXvF8kLJ1xlr-sVOBX2u', 'O0rCQcMr3eqcsIAa8B7AxWhNbyp6SvEX', '$2y$13$MwbvAwvRagBqrEvFhJlAxeNcQeRzjUjhBNK9qtiysnmJZoSLK89ci', 1, '127.0.0.1', 1555852988, 1555882479, 1555882653),
(7, 'Bositkhonaka', 'tHIH67T9BrUgARYr5tDd1H6YrALWa0re', NULL, '$2y$13$Pr5gCscgtLDpYVBeaBg2B.71LGVNva2AvkBIZSGxdK33Bt/kS9.By', 1, NULL, 1555863509, 1555863892, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `gender` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `firstname`, `lastname`, `middlename`, `gender`) VALUES
(1, 'AdminFirstName', 'AdminLastName', NULL, 1),
(7, 'Bositkhon', 'Lastname', '', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accepted_query`
--
ALTER TABLE `accepted_query`
  ADD PRIMARY KEY (`id`),
  ADD KEY `query_id` (`query_id`);

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `declined_query`
--
ALTER TABLE `declined_query`
  ADD PRIMARY KEY (`id`),
  ADD KEY `query_id` (`query_id`);

--
-- Индексы таблицы `favorite_book`
--
ALTER TABLE `favorite_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `key_storage_item`
--
ALTER TABLE `key_storage_item`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `idx_key_storage_item_key` (`key`);

--
-- Индексы таблицы `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_level` (`level`),
  ADD KEY `idx_log_category` (`category`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `reserve_query`
--
ALTER TABLE `reserve_query`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accepted_query`
--
ALTER TABLE `accepted_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `declined_query`
--
ALTER TABLE `declined_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `favorite_book`
--
ALTER TABLE `favorite_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `reserve_query`
--
ALTER TABLE `reserve_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accepted_query`
--
ALTER TABLE `accepted_query`
  ADD CONSTRAINT `accepted_query_ibfk_1` FOREIGN KEY (`query_id`) REFERENCES `reserve_query` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `declined_query`
--
ALTER TABLE `declined_query`
  ADD CONSTRAINT `declined_query_ibfk_1` FOREIGN KEY (`query_id`) REFERENCES `reserve_query` (`id`);

--
-- Ограничения внешнего ключа таблицы `favorite_book`
--
ALTER TABLE `favorite_book`
  ADD CONSTRAINT `favorite_book_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `favorite_book_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Ограничения внешнего ключа таблицы `reserve_query`
--
ALTER TABLE `reserve_query`
  ADD CONSTRAINT `reserve_query_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `reserve_query_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
