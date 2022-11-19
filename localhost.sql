-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 10 2022 г., 14:58
-- Версия сервера: 5.6.43-84.3-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sportcrm_uroboro`
--
CREATE DATABASE IF NOT EXISTS `sportcrm_uroboro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sportcrm_uroboro`;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_actiondom`
--

CREATE TABLE `mx_access_actiondom` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_actions`
--

CREATE TABLE `mx_access_actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_category`
--

CREATE TABLE `mx_access_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_context`
--

CREATE TABLE `mx_access_context` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_access_context`
--

INSERT INTO `mx_access_context` (`id`, `target`, `principal_class`, `principal`, `authority`, `policy`) VALUES
(1, 'web', 'modUserGroup', 0, 9999, 3),
(2, 'mgr', 'modUserGroup', 1, 0, 2),
(3, 'web', 'modUserGroup', 1, 0, 2),
(4, 'web', 'modUserGroup', 2, 9999, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_elements`
--

CREATE TABLE `mx_access_elements` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_media_source`
--

CREATE TABLE `mx_access_media_source` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_menus`
--

CREATE TABLE `mx_access_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_namespace`
--

CREATE TABLE `mx_access_namespace` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_permissions`
--

CREATE TABLE `mx_access_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `value` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_access_permissions`
--

INSERT INTO `mx_access_permissions` (`id`, `template`, `name`, `description`, `value`) VALUES
(1, 1, 'about', 'perm.about_desc', 1),
(2, 1, 'access_permissions', 'perm.access_permissions_desc', 1),
(3, 1, 'actions', 'perm.actions_desc', 1),
(4, 1, 'change_password', 'perm.change_password_desc', 1),
(5, 1, 'change_profile', 'perm.change_profile_desc', 1),
(6, 1, 'charsets', 'perm.charsets_desc', 1),
(7, 1, 'class_map', 'perm.class_map_desc', 1),
(8, 1, 'components', 'perm.components_desc', 1),
(9, 1, 'content_types', 'perm.content_types_desc', 1),
(10, 1, 'countries', 'perm.countries_desc', 1),
(11, 1, 'create', 'perm.create_desc', 1),
(12, 1, 'credits', 'perm.credits_desc', 1),
(13, 1, 'customize_forms', 'perm.customize_forms_desc', 1),
(14, 1, 'dashboards', 'perm.dashboards_desc', 1),
(15, 1, 'database', 'perm.database_desc', 1),
(16, 1, 'database_truncate', 'perm.database_truncate_desc', 1),
(17, 1, 'delete_category', 'perm.delete_category_desc', 1),
(18, 1, 'delete_chunk', 'perm.delete_chunk_desc', 1),
(19, 1, 'delete_context', 'perm.delete_context_desc', 1),
(20, 1, 'delete_document', 'perm.delete_document_desc', 1),
(21, 1, 'delete_weblink', 'perm.delete_weblink_desc', 1),
(22, 1, 'delete_symlink', 'perm.delete_symlink_desc', 1),
(23, 1, 'delete_static_resource', 'perm.delete_static_resource_desc', 1),
(24, 1, 'delete_eventlog', 'perm.delete_eventlog_desc', 1),
(25, 1, 'delete_plugin', 'perm.delete_plugin_desc', 1),
(26, 1, 'delete_propertyset', 'perm.delete_propertyset_desc', 1),
(27, 1, 'delete_snippet', 'perm.delete_snippet_desc', 1),
(28, 1, 'delete_template', 'perm.delete_template_desc', 1),
(29, 1, 'delete_tv', 'perm.delete_tv_desc', 1),
(30, 1, 'delete_role', 'perm.delete_role_desc', 1),
(31, 1, 'delete_user', 'perm.delete_user_desc', 1),
(32, 1, 'directory_chmod', 'perm.directory_chmod_desc', 1),
(33, 1, 'directory_create', 'perm.directory_create_desc', 1),
(34, 1, 'directory_list', 'perm.directory_list_desc', 1),
(35, 1, 'directory_remove', 'perm.directory_remove_desc', 1),
(36, 1, 'directory_update', 'perm.directory_update_desc', 1),
(37, 1, 'edit_category', 'perm.edit_category_desc', 1),
(38, 1, 'edit_chunk', 'perm.edit_chunk_desc', 1),
(39, 1, 'edit_context', 'perm.edit_context_desc', 1),
(40, 1, 'edit_document', 'perm.edit_document_desc', 1),
(41, 1, 'edit_weblink', 'perm.edit_weblink_desc', 1),
(42, 1, 'edit_symlink', 'perm.edit_symlink_desc', 1),
(43, 1, 'edit_static_resource', 'perm.edit_static_resource_desc', 1),
(44, 1, 'edit_locked', 'perm.edit_locked_desc', 1),
(45, 1, 'edit_plugin', 'perm.edit_plugin_desc', 1),
(46, 1, 'edit_propertyset', 'perm.edit_propertyset_desc', 1),
(47, 1, 'edit_role', 'perm.edit_role_desc', 1),
(48, 1, 'edit_snippet', 'perm.edit_snippet_desc', 1),
(49, 1, 'edit_template', 'perm.edit_template_desc', 1),
(50, 1, 'edit_tv', 'perm.edit_tv_desc', 1),
(51, 1, 'edit_user', 'perm.edit_user_desc', 1),
(52, 1, 'element_tree', 'perm.element_tree_desc', 1),
(53, 1, 'empty_cache', 'perm.empty_cache_desc', 1),
(54, 1, 'error_log_erase', 'perm.error_log_erase_desc', 1),
(55, 1, 'error_log_view', 'perm.error_log_view_desc', 1),
(56, 1, 'export_static', 'perm.export_static_desc', 1),
(57, 1, 'file_create', 'perm.file_create_desc', 1),
(58, 1, 'file_list', 'perm.file_list_desc', 1),
(59, 1, 'file_manager', 'perm.file_manager_desc', 1),
(60, 1, 'file_remove', 'perm.file_remove_desc', 1),
(61, 1, 'file_tree', 'perm.file_tree_desc', 1),
(62, 1, 'file_update', 'perm.file_update_desc', 1),
(63, 1, 'file_upload', 'perm.file_upload_desc', 1),
(64, 1, 'file_unpack', 'perm.file_unpack_desc', 1),
(65, 1, 'file_view', 'perm.file_view_desc', 1),
(66, 1, 'flush_sessions', 'perm.flush_sessions_desc', 1),
(67, 1, 'frames', 'perm.frames_desc', 1),
(68, 1, 'help', 'perm.help_desc', 1),
(69, 1, 'home', 'perm.home_desc', 1),
(70, 1, 'import_static', 'perm.import_static_desc', 1),
(71, 1, 'languages', 'perm.languages_desc', 1),
(72, 1, 'lexicons', 'perm.lexicons_desc', 1),
(73, 1, 'list', 'perm.list_desc', 1),
(74, 1, 'load', 'perm.load_desc', 1),
(75, 1, 'logout', 'perm.logout_desc', 1),
(76, 1, 'logs', 'perm.logs_desc', 1),
(77, 1, 'menu_reports', 'perm.menu_reports_desc', 1),
(78, 1, 'menu_security', 'perm.menu_security_desc', 1),
(79, 1, 'menu_site', 'perm.menu_site_desc', 1),
(80, 1, 'menu_support', 'perm.menu_support_desc', 1),
(81, 1, 'menu_system', 'perm.menu_system_desc', 1),
(82, 1, 'menu_tools', 'perm.menu_tools_desc', 1),
(83, 1, 'menu_trash', 'perm.menu_trash_desc', 1),
(84, 1, 'menu_user', 'perm.menu_user_desc', 1),
(85, 1, 'menus', 'perm.menus_desc', 1),
(86, 1, 'messages', 'perm.messages_desc', 1),
(87, 1, 'namespaces', 'perm.namespaces_desc', 1),
(88, 1, 'new_category', 'perm.new_category_desc', 1),
(89, 1, 'new_chunk', 'perm.new_chunk_desc', 1),
(90, 1, 'new_context', 'perm.new_context_desc', 1),
(91, 1, 'new_document', 'perm.new_document_desc', 1),
(92, 1, 'new_static_resource', 'perm.new_static_resource_desc', 1),
(93, 1, 'new_symlink', 'perm.new_symlink_desc', 1),
(94, 1, 'new_weblink', 'perm.new_weblink_desc', 1),
(95, 1, 'new_document_in_root', 'perm.new_document_in_root_desc', 1),
(96, 1, 'new_plugin', 'perm.new_plugin_desc', 1),
(97, 1, 'new_propertyset', 'perm.new_propertyset_desc', 1),
(98, 1, 'new_role', 'perm.new_role_desc', 1),
(99, 1, 'new_snippet', 'perm.new_snippet_desc', 1),
(100, 1, 'new_template', 'perm.new_template_desc', 1),
(101, 1, 'new_tv', 'perm.new_tv_desc', 1),
(102, 1, 'new_user', 'perm.new_user_desc', 1),
(103, 1, 'packages', 'perm.packages_desc', 1),
(104, 1, 'policy_delete', 'perm.policy_delete_desc', 1),
(105, 1, 'policy_edit', 'perm.policy_edit_desc', 1),
(106, 1, 'policy_new', 'perm.policy_new_desc', 1),
(107, 1, 'policy_save', 'perm.policy_save_desc', 1),
(108, 1, 'policy_view', 'perm.policy_view_desc', 1),
(109, 1, 'policy_template_delete', 'perm.policy_template_delete_desc', 1),
(110, 1, 'policy_template_edit', 'perm.policy_template_edit_desc', 1),
(111, 1, 'policy_template_new', 'perm.policy_template_new_desc', 1),
(112, 1, 'policy_template_save', 'perm.policy_template_save_desc', 1),
(113, 1, 'policy_template_view', 'perm.policy_template_view_desc', 1),
(114, 1, 'property_sets', 'perm.property_sets_desc', 1),
(115, 1, 'providers', 'perm.providers_desc', 1),
(116, 1, 'publish_document', 'perm.publish_document_desc', 1),
(117, 1, 'purge_deleted', 'perm.purge_deleted_desc', 1),
(118, 1, 'remove', 'perm.remove_desc', 1),
(119, 1, 'remove_locks', 'perm.remove_locks_desc', 1),
(120, 1, 'resource_duplicate', 'perm.resource_duplicate_desc', 1),
(121, 1, 'resourcegroup_delete', 'perm.resourcegroup_delete_desc', 1),
(122, 1, 'resourcegroup_edit', 'perm.resourcegroup_edit_desc', 1),
(123, 1, 'resourcegroup_new', 'perm.resourcegroup_new_desc', 1),
(124, 1, 'resourcegroup_resource_edit', 'perm.resourcegroup_resource_edit_desc', 1),
(125, 1, 'resourcegroup_resource_list', 'perm.resourcegroup_resource_list_desc', 1),
(126, 1, 'resourcegroup_save', 'perm.resourcegroup_save_desc', 1),
(127, 1, 'resourcegroup_view', 'perm.resourcegroup_view_desc', 1),
(128, 1, 'resource_quick_create', 'perm.resource_quick_create_desc', 1),
(129, 1, 'resource_quick_update', 'perm.resource_quick_update_desc', 1),
(130, 1, 'resource_tree', 'perm.resource_tree_desc', 1),
(131, 1, 'save', 'perm.save_desc', 1),
(132, 1, 'save_category', 'perm.save_category_desc', 1),
(133, 1, 'save_chunk', 'perm.save_chunk_desc', 1),
(134, 1, 'save_context', 'perm.save_context_desc', 1),
(135, 1, 'save_document', 'perm.save_document_desc', 1),
(136, 1, 'save_plugin', 'perm.save_plugin_desc', 1),
(137, 1, 'save_propertyset', 'perm.save_propertyset_desc', 1),
(138, 1, 'save_role', 'perm.save_role_desc', 1),
(139, 1, 'save_snippet', 'perm.save_snippet_desc', 1),
(140, 1, 'save_template', 'perm.save_template_desc', 1),
(141, 1, 'save_tv', 'perm.save_tv_desc', 1),
(142, 1, 'save_user', 'perm.save_user_desc', 1),
(143, 1, 'search', 'perm.search_desc', 1),
(144, 1, 'set_sudo', 'perm.set_sudo_desc', 1),
(145, 1, 'settings', 'perm.settings_desc', 1),
(146, 1, 'events', 'perm.events_desc', 1),
(147, 1, 'source_save', 'perm.source_save_desc', 1),
(148, 1, 'source_delete', 'perm.source_delete_desc', 1),
(149, 1, 'source_edit', 'perm.source_edit_desc', 1),
(150, 1, 'source_view', 'perm.source_view_desc', 1),
(151, 1, 'sources', 'perm.sources_desc', 1),
(152, 1, 'steal_locks', 'perm.steal_locks_desc', 1),
(153, 1, 'tree_show_element_ids', 'perm.tree_show_element_ids_desc', 1),
(154, 1, 'tree_show_resource_ids', 'perm.tree_show_resource_ids_desc', 1),
(155, 1, 'undelete_document', 'perm.undelete_document_desc', 1),
(156, 1, 'unpublish_document', 'perm.unpublish_document_desc', 1),
(157, 1, 'unlock_element_properties', 'perm.unlock_element_properties_desc', 1),
(158, 1, 'usergroup_delete', 'perm.usergroup_delete_desc', 1),
(159, 1, 'usergroup_edit', 'perm.usergroup_edit_desc', 1),
(160, 1, 'usergroup_new', 'perm.usergroup_new_desc', 1),
(161, 1, 'usergroup_save', 'perm.usergroup_save_desc', 1),
(162, 1, 'usergroup_user_edit', 'perm.usergroup_user_edit_desc', 1),
(163, 1, 'usergroup_user_list', 'perm.usergroup_user_list_desc', 1),
(164, 1, 'usergroup_view', 'perm.usergroup_view_desc', 1),
(165, 1, 'view', 'perm.view_desc', 1),
(166, 1, 'view_category', 'perm.view_category_desc', 1),
(167, 1, 'view_chunk', 'perm.view_chunk_desc', 1),
(168, 1, 'view_context', 'perm.view_context_desc', 1),
(169, 1, 'view_document', 'perm.view_document_desc', 1),
(170, 1, 'view_element', 'perm.view_element_desc', 1),
(171, 1, 'view_eventlog', 'perm.view_eventlog_desc', 1),
(172, 1, 'view_offline', 'perm.view_offline_desc', 1),
(173, 1, 'view_plugin', 'perm.view_plugin_desc', 1),
(174, 1, 'view_propertyset', 'perm.view_propertyset_desc', 1),
(175, 1, 'view_role', 'perm.view_role_desc', 1),
(176, 1, 'view_snippet', 'perm.view_snippet_desc', 1),
(177, 1, 'view_sysinfo', 'perm.view_sysinfo_desc', 1),
(178, 1, 'view_template', 'perm.view_template_desc', 1),
(179, 1, 'view_tv', 'perm.view_tv_desc', 1),
(180, 1, 'view_user', 'perm.view_user_desc', 1),
(181, 1, 'view_unpublished', 'perm.view_unpublished_desc', 1),
(182, 1, 'workspaces', 'perm.workspaces_desc', 1),
(183, 2, 'add_children', 'perm.add_children_desc', 1),
(184, 2, 'copy', 'perm.copy_desc', 1),
(185, 2, 'create', 'perm.create_desc', 1),
(186, 2, 'delete', 'perm.delete_desc', 1),
(187, 2, 'list', 'perm.list_desc', 1),
(188, 2, 'load', 'perm.load_desc', 1),
(189, 2, 'move', 'perm.move_desc', 1),
(190, 2, 'publish', 'perm.publish_desc', 1),
(191, 2, 'remove', 'perm.remove_desc', 1),
(192, 2, 'save', 'perm.save_desc', 1),
(193, 2, 'steal_lock', 'perm.steal_lock_desc', 1),
(194, 2, 'undelete', 'perm.undelete_desc', 1),
(195, 2, 'unpublish', 'perm.unpublish_desc', 1),
(196, 2, 'view', 'perm.view_desc', 1),
(197, 3, 'load', 'perm.load_desc', 1),
(198, 3, 'list', 'perm.list_desc', 1),
(199, 3, 'view', 'perm.view_desc', 1),
(200, 3, 'save', 'perm.save_desc', 1),
(201, 3, 'remove', 'perm.remove_desc', 1),
(202, 4, 'add_children', 'perm.add_children_desc', 1),
(203, 4, 'create', 'perm.create_desc', 1),
(204, 4, 'copy', 'perm.copy_desc', 1),
(205, 4, 'delete', 'perm.delete_desc', 1),
(206, 4, 'list', 'perm.list_desc', 1),
(207, 4, 'load', 'perm.load_desc', 1),
(208, 4, 'remove', 'perm.remove_desc', 1),
(209, 4, 'save', 'perm.save_desc', 1),
(210, 4, 'view', 'perm.view_desc', 1),
(211, 5, 'create', 'perm.create_desc', 1),
(212, 5, 'copy', 'perm.copy_desc', 1),
(213, 5, 'list', 'perm.list_desc', 1),
(214, 5, 'load', 'perm.load_desc', 1),
(215, 5, 'remove', 'perm.remove_desc', 1),
(216, 5, 'save', 'perm.save_desc', 1),
(217, 5, 'view', 'perm.view_desc', 1),
(218, 6, 'load', 'perm.load_desc', 1),
(219, 6, 'list', 'perm.list_desc', 1),
(220, 6, 'view', 'perm.view_desc', 1),
(221, 6, 'save', 'perm.save_desc', 1),
(222, 6, 'remove', 'perm.remove_desc', 1),
(223, 6, 'view_unpublished', 'perm.view_unpublished_desc', 1),
(224, 6, 'copy', 'perm.copy_desc', 1),
(225, 7, 'list', 'perm.list_desc', 1),
(226, 7, 'load', 'perm.load_desc', 1),
(227, 7, 'view', 'perm.view_desc', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_policies`
--

CREATE TABLE `mx_access_policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `template` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `class` varchar(191) NOT NULL DEFAULT '',
  `data` text,
  `lexicon` varchar(191) NOT NULL DEFAULT 'permissions'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_access_policies`
--

INSERT INTO `mx_access_policies` (`id`, `name`, `description`, `parent`, `template`, `class`, `data`, `lexicon`) VALUES
(1, 'Resource', 'MODX Resource Policy with all attributes.', 0, 2, '', '{\"add_children\":true,\"create\":true,\"copy\":true,\"delete\":true,\"list\":true,\"load\":true,\"move\":true,\"publish\":true,\"remove\":true,\"save\":true,\"steal_lock\":true,\"undelete\":true,\"unpublish\":true,\"view\":true}', 'permissions'),
(2, 'Administrator', 'Context administration policy with all permissions.', 0, 1, '', '{\"about\":true,\"access_permissions\":true,\"actions\":true,\"change_password\":true,\"change_profile\":true,\"charsets\":true,\"class_map\":true,\"components\":true,\"content_types\":true,\"countries\":true,\"create\":true,\"credits\":true,\"customize_forms\":true,\"dashboards\":true,\"database\":true,\"database_truncate\":true,\"delete_category\":true,\"delete_chunk\":true,\"delete_context\":true,\"delete_document\":true,\"delete_weblink\":true,\"delete_symlink\":true,\"delete_static_resource\":true,\"delete_eventlog\":true,\"delete_plugin\":true,\"delete_propertyset\":true,\"delete_role\":true,\"delete_snippet\":true,\"delete_template\":true,\"delete_tv\":true,\"delete_user\":true,\"directory_chmod\":true,\"directory_create\":true,\"directory_list\":true,\"directory_remove\":true,\"directory_update\":true,\"edit_category\":true,\"edit_chunk\":true,\"edit_context\":true,\"edit_document\":true,\"edit_weblink\":true,\"edit_symlink\":true,\"edit_static_resource\":true,\"edit_locked\":true,\"edit_plugin\":true,\"edit_propertyset\":true,\"edit_role\":true,\"edit_snippet\":true,\"edit_template\":true,\"edit_tv\":true,\"edit_user\":true,\"element_tree\":true,\"empty_cache\":true,\"error_log_erase\":true,\"error_log_view\":true,\"events\":true,\"export_static\":true,\"file_create\":true,\"file_list\":true,\"file_manager\":true,\"file_remove\":true,\"file_tree\":true,\"file_update\":true,\"file_upload\":true,\"file_unpack\":true,\"file_view\":true,\"flush_sessions\":true,\"frames\":true,\"help\":true,\"home\":true,\"import_static\":true,\"languages\":true,\"lexicons\":true,\"list\":true,\"load\":true,\"logout\":true,\"logs\":true,\"menus\":true,\"menu_reports\":true,\"menu_security\":true,\"menu_site\":true,\"menu_support\":true,\"menu_system\":true,\"menu_tools\":true,\"menu_user\":true,\"messages\":true,\"namespaces\":true,\"new_category\":true,\"new_chunk\":true,\"new_context\":true,\"new_document\":true,\"new_document_in_root\":true,\"new_plugin\":true,\"new_propertyset\":true,\"new_role\":true,\"new_snippet\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_template\":true,\"new_tv\":true,\"new_user\":true,\"new_weblink\":true,\"packages\":true,\"policy_delete\":true,\"policy_edit\":true,\"policy_new\":true,\"policy_save\":true,\"policy_template_delete\":true,\"policy_template_edit\":true,\"policy_template_new\":true,\"policy_template_save\":true,\"policy_template_view\":true,\"policy_view\":true,\"property_sets\":true,\"providers\":true,\"publish_document\":true,\"purge_deleted\":true,\"remove\":true,\"remove_locks\":true,\"resource_duplicate\":true,\"resourcegroup_delete\":true,\"resourcegroup_edit\":true,\"resourcegroup_new\":true,\"resourcegroup_resource_edit\":true,\"resourcegroup_resource_list\":true,\"resourcegroup_save\":true,\"resourcegroup_view\":true,\"resource_quick_create\":true,\"resource_quick_update\":true,\"resource_tree\":true,\"save\":true,\"save_category\":true,\"save_chunk\":true,\"save_context\":true,\"save_document\":true,\"save_plugin\":true,\"save_propertyset\":true,\"save_role\":true,\"save_snippet\":true,\"save_template\":true,\"save_tv\":true,\"save_user\":true,\"search\":true,\"set_sudo\":true,\"settings\":true,\"sources\":true,\"source_delete\":true,\"source_edit\":true,\"source_save\":true,\"source_view\":true,\"steal_locks\":true,\"tree_show_element_ids\":true,\"tree_show_resource_ids\":true,\"undelete_document\":true,\"unlock_element_properties\":true,\"unpublish_document\":true,\"usergroup_delete\":true,\"usergroup_edit\":true,\"usergroup_new\":true,\"usergroup_save\":true,\"usergroup_user_edit\":true,\"usergroup_user_list\":true,\"usergroup_view\":true,\"view\":true,\"view_category\":true,\"view_chunk\":true,\"view_context\":true,\"view_document\":true,\"view_element\":true,\"view_eventlog\":true,\"view_offline\":true,\"view_plugin\":true,\"view_propertyset\":true,\"view_role\":true,\"view_snippet\":true,\"view_sysinfo\":true,\"view_template\":true,\"view_tv\":true,\"view_unpublished\":true,\"view_user\":true,\"workspaces\":true}', 'permissions'),
(3, 'Load Only', 'A minimal policy with permission to load an object.', 0, 3, '', '{\"load\":true}', 'permissions'),
(4, 'Load, List and View', 'Provides load, list and view permissions only.', 0, 3, '', '{\"load\":true,\"list\":true,\"view\":true}', 'permissions'),
(5, 'Object', 'An Object policy with all permissions.', 0, 3, '', '{\"load\":true,\"list\":true,\"view\":true,\"save\":true,\"remove\":true}', 'permissions'),
(6, 'Element', 'MODX Element policy with all attributes.', 0, 4, '', '{\"add_children\":true,\"create\":true,\"delete\":true,\"list\":true,\"load\":true,\"remove\":true,\"save\":true,\"view\":true,\"copy\":true}', 'permissions'),
(7, 'Content Editor', 'Context administration policy with limited, content-editing related Permissions, but no publishing.', 0, 1, '', '{\"change_profile\":true,\"class_map\":true,\"countries\":true,\"edit_document\":true,\"edit_weblink\":true,\"edit_symlink\":true,\"edit_static_resource\":true,\"frames\":true,\"help\":true,\"home\":true,\"load\":true,\"list\":true,\"logout\":true,\"menu_reports\":true,\"menu_site\":true,\"menu_support\":true,\"menu_tools\":true,\"menu_user\":true,\"resource_duplicate\":true,\"resource_tree\":true,\"save_document\":true,\"source_view\":true,\"tree_show_resource_ids\":true,\"view\":true,\"view_document\":true,\"view_template\":true,\"new_document\":true,\"new_weblink\":true,\"new_symlink\":true,\"new_static_resource\":true,\"delete_document\":true,\"delete_weblink\":true,\"delete_symlink\":true,\"delete_static_resource\":true}', 'permissions'),
(8, 'Media Source Admin', 'Media Source administration policy.', 0, 5, '', '{\"create\":true,\"copy\":true,\"load\":true,\"list\":true,\"save\":true,\"remove\":true,\"view\":true}', 'permissions'),
(9, 'Media Source User', 'Media Source user policy, with basic viewing and using - but no editing - of Media Sources.', 0, 5, '', '{\"load\":true,\"list\":true,\"view\":true}', 'permissions'),
(10, 'Developer', 'Context administration policy with most Permissions except Administrator and Security functions.', 0, 1, '', '{\"about\":true,\"change_password\":true,\"change_profile\":true,\"charsets\":true,\"class_map\":true,\"components\":true,\"content_types\":true,\"countries\":true,\"create\":true,\"credits\":true,\"customize_forms\":true,\"dashboards\":true,\"database\":true,\"delete_category\":true,\"delete_chunk\":true,\"delete_context\":true,\"delete_document\":true,\"delete_eventlog\":true,\"delete_plugin\":true,\"delete_propertyset\":true,\"delete_snippet\":true,\"delete_template\":true,\"delete_tv\":true,\"delete_role\":true,\"delete_user\":true,\"directory_chmod\":true,\"directory_create\":true,\"directory_list\":true,\"directory_remove\":true,\"directory_update\":true,\"edit_category\":true,\"edit_chunk\":true,\"edit_context\":true,\"edit_document\":true,\"edit_weblink\":true,\"edit_symlink\":true,\"edit_static_resource\":true,\"edit_locked\":true,\"edit_plugin\":true,\"edit_propertyset\":true,\"edit_role\":true,\"edit_snippet\":true,\"edit_template\":true,\"edit_tv\":true,\"edit_user\":true,\"element_tree\":true,\"empty_cache\":true,\"error_log_erase\":true,\"error_log_view\":true,\"export_static\":true,\"file_create\":true,\"file_list\":true,\"file_manager\":true,\"file_remove\":true,\"file_tree\":true,\"file_update\":true,\"file_upload\":true,\"file_unpack\":true,\"file_view\":true,\"frames\":true,\"help\":true,\"home\":true,\"import_static\":true,\"languages\":true,\"lexicons\":true,\"list\":true,\"load\":true,\"logout\":true,\"logs\":true,\"menu_reports\":true,\"menu_site\":true,\"menu_support\":true,\"menu_system\":true,\"menu_tools\":true,\"menu_user\":true,\"menus\":true,\"messages\":true,\"namespaces\":true,\"new_category\":true,\"new_chunk\":true,\"new_context\":true,\"new_document\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_weblink\":true,\"new_document_in_root\":true,\"new_plugin\":true,\"new_propertyset\":true,\"new_role\":true,\"new_snippet\":true,\"new_template\":true,\"new_tv\":true,\"new_user\":true,\"packages\":true,\"property_sets\":true,\"providers\":true,\"publish_document\":true,\"purge_deleted\":true,\"remove\":true,\"resource_duplicate\":true,\"resource_quick_create\":true,\"resource_quick_update\":true,\"resource_tree\":true,\"save\":true,\"save_category\":true,\"save_chunk\":true,\"save_context\":true,\"save_document\":true,\"save_plugin\":true,\"save_propertyset\":true,\"save_snippet\":true,\"save_template\":true,\"save_tv\":true,\"save_user\":true,\"search\":true,\"settings\":true,\"source_delete\":true,\"source_edit\":true,\"source_save\":true,\"source_view\":true,\"sources\":true,\"tree_show_element_ids\":true,\"tree_show_resource_ids\":true,\"undelete_document\":true,\"unpublish_document\":true,\"unlock_element_properties\":true,\"view\":true,\"view_category\":true,\"view_chunk\":true,\"view_context\":true,\"view_document\":true,\"view_element\":true,\"view_eventlog\":true,\"view_offline\":true,\"view_plugin\":true,\"view_propertyset\":true,\"view_role\":true,\"view_snippet\":true,\"view_sysinfo\":true,\"view_template\":true,\"view_tv\":true,\"view_user\":true,\"view_unpublished\":true,\"workspaces\":true}', 'permissions'),
(11, 'Context', 'A standard Context policy that you can apply when creating Context ACLs for basic read/write and view_unpublished access within a Context.', 0, 6, '', '{\"load\":true,\"list\":true,\"view\":true,\"save\":true,\"remove\":true,\"copy\":true,\"view_unpublished\":true}', 'permissions'),
(12, 'Hidden Namespace', 'Hidden Namespace policy, will not show Namespace in lists.', 0, 7, '', '{\"load\":false,\"list\":false,\"view\":true}', 'permissions');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_policy_templates`
--

CREATE TABLE `mx_access_policy_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_group` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` mediumtext,
  `lexicon` varchar(191) NOT NULL DEFAULT 'permissions'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_access_policy_templates`
--

INSERT INTO `mx_access_policy_templates` (`id`, `template_group`, `name`, `description`, `lexicon`) VALUES
(1, 1, 'AdministratorTemplate', 'Context administration policy template with all permissions.', 'permissions'),
(2, 3, 'ResourceTemplate', 'Resource Policy Template with all attributes.', 'permissions'),
(3, 2, 'ObjectTemplate', 'Object Policy Template with all attributes.', 'permissions'),
(4, 4, 'ElementTemplate', 'Element Policy Template with all attributes.', 'permissions'),
(5, 5, 'MediaSourceTemplate', 'Media Source Policy Template with all attributes.', 'permissions'),
(6, 2, 'ContextTemplate', 'Context Policy Template with all attributes.', 'permissions'),
(7, 6, 'NamespaceTemplate', 'Namespace Policy Template with all attributes.', 'permissions');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_policy_template_groups`
--

CREATE TABLE `mx_access_policy_template_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_access_policy_template_groups`
--

INSERT INTO `mx_access_policy_template_groups` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'All admin policy templates.'),
(2, 'Object', 'All Object-based policy templates.'),
(3, 'Resource', 'All Resource-based policy templates.'),
(4, 'Element', 'All Element-based policy templates.'),
(5, 'MediaSource', 'All Media Source-based policy templates.'),
(6, 'Namespace', 'All Namespace based policy templates.');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_resources`
--

CREATE TABLE `mx_access_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_resource_groups`
--

CREATE TABLE `mx_access_resource_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_access_resource_groups`
--

INSERT INTO `mx_access_resource_groups` (`id`, `target`, `principal_class`, `principal`, `authority`, `policy`, `context_key`) VALUES
(1, '1', 'modUserGroup', 2, 9999, 1, 'web');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_access_templatevars`
--

CREATE TABLE `mx_access_templatevars` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999',
  `policy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_actiondom`
--

CREATE TABLE `mx_actiondom` (
  `id` int(10) UNSIGNED NOT NULL,
  `set` int(11) NOT NULL DEFAULT '0',
  `action` varchar(191) NOT NULL DEFAULT '',
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text,
  `xtype` varchar(100) NOT NULL DEFAULT '',
  `container` varchar(191) NOT NULL DEFAULT '',
  `rule` varchar(100) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `constraint` varchar(191) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `for_parent` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_actions`
--

CREATE TABLE `mx_actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) NOT NULL DEFAULT 'core',
  `controller` varchar(191) NOT NULL,
  `haslayout` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `lang_topics` text NOT NULL,
  `assets` text NOT NULL,
  `help_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_actions_fields`
--

CREATE TABLE `mx_actions_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(191) NOT NULL DEFAULT '',
  `name` varchar(191) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL DEFAULT 'field',
  `tab` varchar(191) NOT NULL DEFAULT '',
  `form` varchar(191) NOT NULL DEFAULT '',
  `other` varchar(191) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_actions_fields`
--

INSERT INTO `mx_actions_fields` (`id`, `action`, `name`, `type`, `tab`, `form`, `other`, `rank`) VALUES
(81, 'resource/update', 'modx-resource-settings', 'tab', '', 'modx-panel-resource', '', 0),
(82, 'resource/update', 'modx-resource-main-left', 'tab', '', 'modx-panel-resource', '', 1),
(83, 'resource/update', 'id', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 0),
(84, 'resource/update', 'pagetitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 1),
(85, 'resource/update', 'longtitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 2),
(86, 'resource/update', 'description', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 3),
(87, 'resource/update', 'introtext', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 4),
(88, 'resource/update', 'modx-resource-main-right', 'tab', '', 'modx-panel-resource', '', 2),
(89, 'resource/update', 'template', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 0),
(90, 'resource/update', 'alias', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 1),
(91, 'resource/update', 'menutitle', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 2),
(92, 'resource/update', 'link_attributes', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 3),
(93, 'resource/update', 'hidemenu', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 4),
(94, 'resource/update', 'published', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 5),
(95, 'resource/update', 'modx-page-settings', 'tab', '', 'modx-panel-resource', '', 3),
(96, 'resource/update', 'modx-page-settings-left', 'tab', '', 'modx-panel-resource', '', 4),
(97, 'resource/update', 'parent-cmb', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 0),
(98, 'resource/update', 'class_key', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 1),
(99, 'resource/update', 'content_type', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 2),
(100, 'resource/update', 'content_dispo', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 3),
(101, 'resource/update', 'menuindex', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 4),
(102, 'resource/update', 'modx-page-settings-right', 'tab', '', 'modx-panel-resource', '', 5),
(103, 'resource/update', 'publishedon', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 0),
(104, 'resource/update', 'pub_date', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 1),
(105, 'resource/update', 'unpub_date', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 2),
(106, 'resource/update', 'modx-page-settings-right-box-left', 'tab', '', 'modx-panel-resource', '', 6),
(107, 'resource/update', 'isfolder', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 0),
(108, 'resource/update', 'searchable', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 1),
(109, 'resource/update', 'alias_visible', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 2),
(110, 'resource/update', 'richtext', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 3),
(111, 'resource/update', 'uri_override', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 4),
(112, 'resource/update', 'uri', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 5),
(113, 'resource/update', 'modx-page-settings-right-box-right', 'tab', '', 'modx-panel-resource', '', 7),
(114, 'resource/update', 'cacheable', 'field', 'modx-page-settings-right-box-right', 'modx-panel-resource', '', 0),
(115, 'resource/update', 'syncsite', 'field', 'modx-page-settings-right-box-right', 'modx-panel-resource', '', 1),
(116, 'resource/update', 'deleted', 'field', 'modx-page-settings-right-box-right', 'modx-panel-resource', '', 2),
(117, 'resource/update', 'modx-panel-resource-tv', 'tab', '', 'modx-panel-resource', 'tv', 8),
(118, 'resource/update', 'modx-resource-access-permissions', 'tab', '', 'modx-panel-resource', '', 9),
(119, 'resource/update', 'modx-resource-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 0),
(120, 'resource/update', 'modx-symlink-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 1),
(121, 'resource/update', 'modx-weblink-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 2),
(122, 'resource/create', 'modx-resource-settings', 'tab', '', 'modx-panel-resource', '', 0),
(123, 'resource/create', 'modx-resource-main-left', 'tab', '', 'modx-panel-resource', '', 1),
(124, 'resource/create', 'id', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 0),
(125, 'resource/create', 'pagetitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 1),
(126, 'resource/create', 'longtitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 2),
(127, 'resource/create', 'description', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 3),
(128, 'resource/create', 'introtext', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 4),
(129, 'resource/create', 'modx-resource-main-right', 'tab', '', 'modx-panel-resource', '', 2),
(130, 'resource/create', 'template', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 0),
(131, 'resource/create', 'alias', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 1),
(132, 'resource/create', 'menutitle', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 2),
(133, 'resource/create', 'link_attributes', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 3),
(134, 'resource/create', 'hidemenu', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 4),
(135, 'resource/create', 'published', 'field', 'modx-resource-main-right', 'modx-panel-resource', '', 5),
(136, 'resource/create', 'modx-page-settings', 'tab', '', 'modx-panel-resource', '', 3),
(137, 'resource/create', 'modx-page-settings-left', 'tab', '', 'modx-panel-resource', '', 4),
(138, 'resource/create', 'parent-cmb', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 0),
(139, 'resource/create', 'class_key', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 1),
(140, 'resource/create', 'content_type', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 2),
(141, 'resource/create', 'content_dispo', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 3),
(142, 'resource/create', 'menuindex', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 4),
(143, 'resource/create', 'modx-page-settings-right', 'tab', '', 'modx-panel-resource', '', 5),
(144, 'resource/create', 'publishedon', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 0),
(145, 'resource/create', 'pub_date', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 1),
(146, 'resource/create', 'unpub_date', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 2),
(147, 'resource/create', 'modx-page-settings-right-box-left', 'tab', '', 'modx-panel-resource', '', 6),
(148, 'resource/create', 'isfolder', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 0),
(149, 'resource/create', 'searchable', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 1),
(150, 'resource/create', 'alias_visible', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 2),
(151, 'resource/create', 'richtext', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 3),
(152, 'resource/create', 'uri_override', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 4),
(153, 'resource/create', 'uri', 'field', 'modx-page-settings-right-box-left', 'modx-panel-resource', '', 5),
(154, 'resource/create', 'modx-page-settings-right-box-right', 'tab', '', 'modx-panel-resource', '', 7),
(155, 'resource/create', 'cacheable', 'field', 'modx-page-settings-right-box-right', 'modx-panel-resource', '', 0),
(156, 'resource/create', 'syncsite', 'field', 'modx-page-settings-right-box-right', 'modx-panel-resource', '', 1),
(157, 'resource/create', 'deleted', 'field', 'modx-page-settings-right-box-right', 'modx-panel-resource', '', 2),
(158, 'resource/create', 'modx-panel-resource-tv', 'tab', '', 'modx-panel-resource', 'tv', 8),
(159, 'resource/create', 'modx-resource-access-permissions', 'tab', '', 'modx-panel-resource', '', 9),
(160, 'resource/create', 'modx-resource-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_active_users`
--

CREATE TABLE `mx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(191) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_categories`
--

CREATE TABLE `mx_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED DEFAULT '0',
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_categories`
--

INSERT INTO `mx_categories` (`id`, `parent`, `category`, `rank`) VALUES
(1, 0, 'clubStuff', 0),
(2, 0, 'pdoTools', 0),
(3, 0, 'Login', 0),
(4, 0, 'Console', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_categories_closure`
--

CREATE TABLE `mx_categories_closure` (
  `ancestor` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `descendant` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `depth` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_categories_closure`
--

INSERT INTO `mx_categories_closure` (`ancestor`, `descendant`, `depth`) VALUES
(0, 1, 0),
(0, 2, 0),
(0, 3, 0),
(0, 4, 0),
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_class_map`
--

CREATE TABLE `mx_class_map` (
  `id` int(10) UNSIGNED NOT NULL,
  `class` varchar(120) NOT NULL DEFAULT '',
  `parent_class` varchar(120) NOT NULL DEFAULT '',
  `name_field` varchar(191) NOT NULL DEFAULT 'name',
  `path` tinytext,
  `lexicon` varchar(191) NOT NULL DEFAULT 'core:resource'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_class_map`
--

INSERT INTO `mx_class_map` (`id`, `class`, `parent_class`, `name_field`, `path`, `lexicon`) VALUES
(1, 'modDocument', 'modResource', 'pagetitle', '', 'core:resource'),
(2, 'modWebLink', 'modResource', 'pagetitle', '', 'core:resource'),
(3, 'modSymLink', 'modResource', 'pagetitle', '', 'core:resource'),
(4, 'modStaticResource', 'modResource', 'pagetitle', '', 'core:resource'),
(5, 'modTemplate', 'modElement', 'templatename', '', 'core:resource'),
(6, 'modTemplateVar', 'modElement', 'name', '', 'core:resource'),
(7, 'modChunk', 'modElement', 'name', '', 'core:resource'),
(8, 'modSnippet', 'modElement', 'name', '', 'core:resource'),
(9, 'modPlugin', 'modElement', 'name', '', 'core:resource');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_content_type`
--

CREATE TABLE `mx_content_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` tinytext,
  `mime_type` tinytext,
  `file_extensions` tinytext,
  `headers` mediumtext,
  `binary` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_content_type`
--

INSERT INTO `mx_content_type` (`id`, `name`, `description`, `mime_type`, `file_extensions`, `headers`, `binary`) VALUES
(1, 'HTML', 'HTML content', 'text/html', '.html', NULL, 0),
(2, 'XML', 'XML content', 'text/xml', '.xml', NULL, 0),
(3, 'text', 'plain text content', 'text/plain', '.txt', NULL, 0),
(4, 'CSS', 'CSS content', 'text/css', '.css', NULL, 0),
(5, 'javascript', 'javascript content', 'text/javascript', '.js', NULL, 0),
(6, 'RSS', 'For RSS feeds', 'application/rss+xml', '.rss', NULL, 0),
(7, 'JSON', 'JSON', 'application/json', '.json', NULL, 0),
(8, 'PDF', 'PDF Files', 'application/pdf', '.pdf', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_context`
--

CREATE TABLE `mx_context` (
  `key` varchar(100) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` tinytext,
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_context`
--

INSERT INTO `mx_context` (`key`, `name`, `description`, `rank`) VALUES
('mgr', 'Manager', 'The default manager or administration context for content management activity.', 0),
('web', 'Website', 'The default front-end context for your web site.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_context_resource`
--

CREATE TABLE `mx_context_resource` (
  `context_key` varchar(191) NOT NULL,
  `resource` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_context_setting`
--

CREATE TABLE `mx_context_setting` (
  `context_key` varchar(191) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` mediumtext,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(191) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_context_setting`
--

INSERT INTO `mx_context_setting` (`context_key`, `key`, `value`, `xtype`, `namespace`, `area`, `editedon`) VALUES
('mgr', 'allow_tags_in_post', '1', 'combo-boolean', 'core', 'system', NULL),
('mgr', 'modRequest.class', 'modManagerRequest', 'textfield', 'core', 'system', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_dashboard`
--

CREATE TABLE `mx_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text,
  `hide_trees` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_dashboard`
--

INSERT INTO `mx_dashboard` (`id`, `name`, `description`, `hide_trees`) VALUES
(1, 'Default', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_dashboard_widget`
--

CREATE TABLE `mx_dashboard_widget` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(100) NOT NULL,
  `content` mediumtext,
  `namespace` varchar(191) NOT NULL DEFAULT '',
  `lexicon` varchar(191) NOT NULL DEFAULT 'core:dashboards',
  `size` varchar(191) NOT NULL DEFAULT 'half'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_dashboard_widget`
--

INSERT INTO `mx_dashboard_widget` (`id`, `name`, `description`, `type`, `content`, `namespace`, `lexicon`, `size`) VALUES
(1, 'w_newsfeed', 'w_newsfeed_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.modx-news.php', 'core', 'core:dashboards', 'half'),
(2, 'w_securityfeed', 'w_securityfeed_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.modx-security.php', 'core', 'core:dashboards', 'half'),
(3, 'w_whosonline', 'w_whosonline_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.grid-online.php', 'core', 'core:dashboards', 'half'),
(4, 'w_recentlyeditedresources', 'w_recentlyeditedresources_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.grid-rer.php', 'core', 'core:dashboards', 'half'),
(5, 'w_configcheck', 'w_configcheck_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.configcheck.php', 'core', 'core:dashboards', 'full');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_dashboard_widget_placement`
--

CREATE TABLE `mx_dashboard_widget_placement` (
  `dashboard` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `widget` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rank` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_dashboard_widget_placement`
--

INSERT INTO `mx_dashboard_widget_placement` (`dashboard`, `widget`, `rank`) VALUES
(1, 5, 0),
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_documentgroup_names`
--

CREATE TABLE `mx_documentgroup_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `private_webgroup` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_documentgroup_names`
--

INSERT INTO `mx_documentgroup_names` (`id`, `name`, `private_memgroup`, `private_webgroup`) VALUES
(1, 'idAdmin', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_document_groups`
--

CREATE TABLE `mx_document_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_document_groups`
--

INSERT INTO `mx_document_groups` (`id`, `document_group`, `document`) VALUES
(1, 1, 5),
(2, 1, 3),
(3, 1, 4),
(4, 1, 2),
(5, 1, 6),
(6, 1, 7),
(7, 1, 9),
(8, 1, 10),
(9, 1, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_element_property_sets`
--

CREATE TABLE `mx_element_property_sets` (
  `element` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `element_class` varchar(100) NOT NULL DEFAULT '',
  `property_set` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_extension_packages`
--

CREATE TABLE `mx_extension_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT 'core',
  `path` text,
  `table_prefix` varchar(191) NOT NULL DEFAULT '',
  `service_class` varchar(191) NOT NULL DEFAULT '',
  `service_name` varchar(191) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_fc_profiles`
--

CREATE TABLE `mx_fc_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_fc_profiles_usergroups`
--

CREATE TABLE `mx_fc_profiles_usergroups` (
  `usergroup` int(11) NOT NULL DEFAULT '0',
  `profile` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_fc_sets`
--

CREATE TABLE `mx_fc_sets` (
  `id` int(10) UNSIGNED NOT NULL,
  `profile` int(11) NOT NULL DEFAULT '0',
  `action` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `template` int(11) NOT NULL DEFAULT '0',
  `constraint` varchar(191) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_lexicon_entries`
--

CREATE TABLE `mx_lexicon_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `topic` varchar(191) NOT NULL DEFAULT 'default',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `language` varchar(20) NOT NULL DEFAULT 'en',
  `createdon` datetime DEFAULT NULL,
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_manager_log`
--

CREATE TABLE `mx_manager_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `occurred` datetime DEFAULT NULL,
  `action` varchar(100) NOT NULL DEFAULT '',
  `classKey` varchar(100) NOT NULL DEFAULT '',
  `item` varchar(191) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_manager_log`
--

INSERT INTO `mx_manager_log` (`id`, `user`, `occurred`, `action`, `classKey`, `item`) VALUES
(1, 1, '2022-04-09 11:19:10', 'login', 'modContext', 'mgr'),
(2, 1, '2022-04-09 11:22:26', 'login', 'modContext', 'mgr'),
(3, 1, '2022-04-09 11:22:57', 'setting_update', 'modSystemSetting', 'enable_gravatar'),
(4, 1, '2022-04-09 11:23:45', 'setting_update', 'modSystemSetting', 'upload_files'),
(5, 1, '2022-04-09 11:24:03', 'setting_update', 'modSystemSetting', 'site_name'),
(6, 1, '2022-04-09 11:24:13', 'category_create', 'modCategory', '1'),
(7, 1, '2022-04-09 11:25:47', 'template_create', 'modTemplate', '2'),
(8, 1, '2022-04-09 11:31:54', 'setting_update', 'modSystemSetting', 'which_element_editor'),
(9, 1, '2022-04-09 11:34:33', 'resource_update', 'modResource', '1'),
(10, 1, '2022-04-09 11:40:57', 'resource_update', 'modResource', '1'),
(11, 1, '2022-04-09 11:43:09', 'setting_update', 'modSystemSetting', 'which_editor'),
(12, 1, '2022-04-09 11:43:42', 'setting_update', 'modSystemSetting', 'use_editor'),
(13, 1, '2022-04-09 11:43:51', 'setting_update', 'modSystemSetting', 'use_editor'),
(14, 1, '2022-04-09 11:44:25', 'resource_update', 'modResource', '1'),
(15, 1, '2022-04-09 11:47:45', 'template_update', 'modTemplate', '2'),
(16, 1, '2022-04-09 11:47:45', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(17, 1, '2022-04-09 11:47:58', 'template_update', 'modTemplate', '2'),
(18, 1, '2022-04-09 11:47:59', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(19, 1, '2022-04-09 11:48:12', 'template_update', 'modTemplate', '2'),
(20, 1, '2022-04-09 11:48:12', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(21, 1, '2022-04-09 11:48:22', 'template_update', 'modTemplate', '2'),
(22, 1, '2022-04-09 11:48:22', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(23, 1, '2022-04-09 11:48:27', 'template_update', 'modTemplate', '2'),
(24, 1, '2022-04-09 11:48:27', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(25, 1, '2022-04-09 11:48:34', 'template_update', 'modTemplate', '2'),
(26, 1, '2022-04-09 11:48:34', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(27, 1, '2022-04-09 12:00:04', 'directory_create', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id'),
(28, 1, '2022-04-09 12:00:20', 'directory_create', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/wss'),
(29, 1, '2022-04-09 12:19:44', 'template_update', 'modTemplate', '2'),
(30, 1, '2022-04-09 12:19:45', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(31, 1, '2022-04-09 14:52:12', 'setting_create', 'modSystemSetting', 'crm_url'),
(32, 1, '2022-04-09 14:52:45', 'template_update', 'modTemplate', '2'),
(33, 1, '2022-04-09 14:52:45', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(34, 1, '2022-04-09 14:54:30', 'setting_delete', 'modSystemSetting', 'crm_url'),
(35, 1, '2022-04-09 14:56:46', 'plugin_create', 'modPlugin', '3'),
(36, 1, '2022-04-09 14:57:31', 'plugin_create', 'modPlugin', '4'),
(37, 1, '2022-04-09 14:59:38', 'plugin_update', 'modPlugin', '3'),
(38, 1, '2022-04-09 14:59:38', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(39, 1, '2022-04-09 15:00:05', 'plugin_update', 'modPlugin', '4'),
(40, 1, '2022-04-09 15:00:05', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 4 Default'),
(41, 1, '2022-04-09 15:01:34', 'setting_update', 'modSystemSetting', 'friendly_urls'),
(42, 1, '2022-04-09 15:01:55', 'setting_update', 'modSystemSetting', 'use_alias_path'),
(43, 1, '2022-04-09 15:07:47', 'clear_cache', '', 'mgr'),
(44, 1, '2022-04-09 15:08:06', 'login', 'modContext', 'web'),
(45, 1, '2022-04-09 16:02:06', 'plugin_update', 'modPlugin', '3'),
(46, 1, '2022-04-09 16:02:06', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(47, 1, '2022-04-09 16:02:31', 'resource_create', 'modDocument', '2'),
(48, 1, '2022-04-09 16:04:00', 'plugin_delete', 'modPlugin', '4'),
(49, 1, '2022-04-09 16:07:01', 'plugin_update', 'modPlugin', '3'),
(50, 1, '2022-04-09 16:07:01', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(51, 1, '2022-04-09 16:07:07', 'plugin_update', 'modPlugin', '3'),
(52, 1, '2022-04-09 16:07:07', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(53, 1, '2022-04-09 16:16:59', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(54, 1, '2022-04-09 16:17:53', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(55, 1, '2022-04-09 16:18:14', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(56, 1, '2022-04-09 16:21:48', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(57, 1, '2022-04-09 16:22:40', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(58, 1, '2022-04-09 16:37:30', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(59, 1, '2022-04-09 16:43:53', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(60, 1, '2022-04-09 16:43:57', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(61, 1, '2022-04-09 16:45:00', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(62, 1, '2022-04-09 16:45:11', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(63, 1, '2022-04-09 16:48:04', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(64, 1, '2022-04-09 16:49:18', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(65, 1, '2022-04-09 16:55:19', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(66, 1, '2022-04-09 17:19:48', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(67, 1, '2022-04-09 17:20:36', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/scrm_log/'),
(68, 1, '2022-04-09 17:20:52', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/club_log/'),
(69, 1, '2022-04-09 17:20:59', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/start/'),
(70, 1, '2022-04-09 17:21:16', 'file_rename', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/userfix.php'),
(71, 1, '2022-04-09 17:23:04', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/createdb.php'),
(72, 1, '2022-04-09 17:24:47', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/createdb.php'),
(73, 1, '2022-04-09 17:25:25', 'plugin_update', 'modPlugin', '3'),
(74, 1, '2022-04-09 17:25:25', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(75, 1, '2022-04-09 17:26:02', 'plugin_update', 'modPlugin', '3'),
(76, 1, '2022-04-09 17:30:26', 'plugin_update', 'modPlugin', '3'),
(77, 1, '2022-04-09 17:30:26', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(78, 1, '2022-04-09 17:30:38', 'plugin_update', 'modPlugin', '3'),
(79, 1, '2022-04-09 17:30:38', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(80, 1, '2022-04-09 17:30:49', 'plugin_update', 'modPlugin', '3'),
(81, 1, '2022-04-09 17:30:50', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(82, 1, '2022-04-09 17:30:52', 'plugin_update', 'modPlugin', '3'),
(83, 1, '2022-04-09 17:30:52', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(84, 1, '2022-04-09 17:31:41', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/createdb.php'),
(85, 1, '2022-04-09 17:32:08', 'plugin_update', 'modPlugin', '3'),
(86, 1, '2022-04-09 17:32:08', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(87, 1, '2022-04-09 17:32:39', 'plugin_update', 'modPlugin', '3'),
(88, 1, '2022-04-09 17:32:39', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(89, 1, '2022-04-09 17:32:57', 'plugin_update', 'modPlugin', '3'),
(90, 1, '2022-04-09 17:32:57', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(91, 1, '2022-04-09 17:33:08', 'plugin_update', 'modPlugin', '3'),
(92, 1, '2022-04-09 17:33:08', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(93, 1, '2022-04-09 17:33:16', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/createdb.php'),
(94, 1, '2022-04-09 17:33:53', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/createdb.php'),
(95, 1, '2022-04-09 17:34:11', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/createdb.php'),
(96, 1, '2022-04-09 17:34:24', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/createdb.php'),
(97, 1, '2022-04-09 17:35:48', 'plugin_update', 'modPlugin', '3'),
(98, 1, '2022-04-09 17:35:48', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(99, 1, '2022-04-09 17:36:50', 'resource_update', 'modResource', '2'),
(100, 1, '2022-04-09 17:37:29', 'resource_update', 'modResource', '2'),
(101, 1, '2022-04-09 17:37:30', 'resource_update', 'modResource', '2'),
(102, 1, '2022-04-09 17:38:08', 'plugin_update', 'modPlugin', '3'),
(103, 1, '2022-04-09 17:38:08', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(104, 1, '2022-04-09 17:38:58', 'template_update', 'modTemplate', '2'),
(105, 1, '2022-04-09 17:38:59', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(106, 1, '2022-04-09 17:39:47', 'plugin_update', 'modPlugin', '3'),
(107, 1, '2022-04-09 17:39:47', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(108, 1, '2022-04-09 17:40:11', 'plugin_update', 'modPlugin', '3'),
(109, 1, '2022-04-09 17:40:11', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(110, 1, '2022-04-09 17:40:16', 'plugin_update', 'modPlugin', '3'),
(111, 1, '2022-04-09 17:40:16', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 3 Default'),
(112, 1, '2022-04-09 17:40:45', 'template_update', 'modTemplate', '2'),
(113, 1, '2022-04-09 17:40:45', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(114, 1, '2022-04-09 17:47:17', 'snippet_create', 'modSnippet', '21'),
(115, 1, '2022-04-09 17:47:40', 'template_update', 'modTemplate', '2'),
(116, 1, '2022-04-09 17:47:40', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(117, 1, '2022-04-09 17:48:42', 'snippet_update', 'modSnippet', '21'),
(118, 1, '2022-04-09 17:48:42', 'propertyset_update_from_element', 'modPropertySet', 'modSnippet 21 Default'),
(119, 1, '2022-04-09 17:48:55', 'resource_update', 'modResource', '2'),
(120, 1, '2022-04-09 17:49:18', 'snippet_update', 'modSnippet', '21'),
(121, 1, '2022-04-09 17:49:18', 'propertyset_update_from_element', 'modPropertySet', 'modSnippet 21 Default'),
(122, 1, '2022-04-09 17:51:05', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/crm_logo.png'),
(123, 1, '2022-04-09 17:51:10', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/favicon-32x32.png'),
(124, 1, '2022-04-09 17:51:14', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/img-shop.jpg'),
(125, 1, '2022-04-09 17:51:22', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/no-imagecrm.png'),
(126, 1, '2022-04-09 17:51:26', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/sportcrm_logo.png'),
(127, 1, '2022-04-09 17:51:36', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/paymethod.gif'),
(128, 1, '2022-04-09 17:51:39', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/user_profile1.jpg'),
(129, 1, '2022-04-09 17:51:42', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/user_profile0.jpg'),
(130, 1, '2022-04-09 17:51:49', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/1с/'),
(131, 1, '2022-04-09 17:51:54', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/elements/'),
(132, 1, '2022-04-09 17:52:12', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/hook/'),
(133, 1, '2022-04-09 17:52:18', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/scripts/'),
(134, 1, '2022-04-09 17:52:24', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/tmpl/'),
(135, 1, '2022-04-09 17:52:30', 'directory_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/trigger/'),
(136, 1, '2022-04-09 17:52:37', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/setup_test.php'),
(137, 1, '2022-04-09 17:53:24', 'file_upload', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/'),
(138, 1, '2022-04-09 17:53:55', 'template_update', 'modTemplate', '2'),
(139, 1, '2022-04-09 17:53:56', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(140, 1, '2022-04-09 17:54:14', 'resource_update', 'modResource', '1'),
(141, 1, '2022-04-09 17:56:20', 'template_update', 'modTemplate', '2'),
(142, 1, '2022-04-09 17:56:20', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(143, 1, '2022-04-09 17:56:22', 'template_update', 'modTemplate', '2'),
(144, 1, '2022-04-09 17:56:23', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(145, 1, '2022-04-09 17:56:45', 'setting_update', 'modSystemSetting', 'site_name'),
(146, 1, '2022-04-09 17:56:51', 'setting_update', 'modSystemSetting', 'site_name'),
(147, 1, '2022-04-09 18:21:44', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(148, 1, '2022-04-09 18:21:47', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(149, 1, '2022-04-09 18:24:36', 'resource_update', 'modResource', '2'),
(150, 1, '2022-04-09 18:27:12', 'resource_update', 'modResource', '2'),
(151, 1, '2022-04-09 18:31:45', 'clear_cache', '', 'mgr'),
(152, 1, '2022-04-09 18:35:33', 'snippet_create', 'modSnippet', '22'),
(153, 1, '2022-04-09 18:37:45', 'template_update', 'modTemplate', '2'),
(154, 1, '2022-04-09 18:37:45', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(155, 1, '2022-04-09 18:37:48', 'template_update', 'modTemplate', '2'),
(156, 1, '2022-04-09 18:37:48', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(157, 1, '2022-04-09 18:41:37', 'resource_create', 'modDocument', '3'),
(158, 1, '2022-04-09 18:41:42', 'resource_sort', '', 'unknown'),
(159, 1, '2022-04-09 18:42:07', 'resource_create', 'modDocument', '4'),
(160, 1, '2022-04-09 18:42:20', 'resource_sort', '', 'unknown'),
(161, 1, '2022-04-09 18:42:51', 'resource_create', 'modDocument', '5'),
(162, 1, '2022-04-09 18:42:59', 'resource_sort', '', 'unknown'),
(163, 1, '2022-04-09 18:43:06', 'resource_update', 'modResource', '5'),
(164, 1, '2022-04-09 18:43:24', 'resource_create', 'modDocument', '6'),
(165, 1, '2022-04-09 18:44:18', 'resource_update', 'modResource', '2'),
(166, 1, '2022-04-09 18:45:41', 'resource_update', 'modResource', '2'),
(167, 1, '2022-04-09 18:46:21', 'login', 'modContext', 'web'),
(168, 1, '2022-04-09 18:48:20', 'resource_create', 'modDocument', '7'),
(169, 1, '2022-04-09 18:48:49', 'resource_update', 'modResource', '5'),
(170, 1, '2022-04-09 18:49:24', 'user_group_create', 'modUserGroup', '2'),
(171, 1, '2022-04-09 18:49:44', 'resource_update', 'modResource', '5'),
(172, 1, '2022-04-09 18:50:00', 'resource_update', 'modResource', '1'),
(173, 1, '2022-04-09 18:50:05', 'resource_update', 'modResource', '3'),
(174, 1, '2022-04-09 18:50:11', 'resource_update', 'modResource', '4'),
(175, 1, '2022-04-09 18:50:22', 'resource_update', 'modResource', '2'),
(176, 1, '2022-04-09 18:50:28', 'resource_update', 'modResource', '6'),
(177, 1, '2022-04-09 18:51:05', 'resource_update', 'modResource', '7'),
(178, 1, '2022-04-09 18:52:23', 'resource_create', 'modDocument', '8'),
(179, 1, '2022-04-09 18:52:30', 'resource_update', 'modResource', '7'),
(180, 1, '2022-04-09 18:52:37', 'resource_update', 'modResource', '7'),
(181, 1, '2022-04-09 18:53:15', 'snippet_create', 'modSnippet', '23'),
(182, 1, '2022-04-09 18:54:10', 'resource_update', 'modResource', '3'),
(183, 1, '2022-04-09 18:54:47', 'resource_update', 'modResource', '3'),
(184, 1, '2022-04-09 18:54:59', 'resource_update', 'modResource', '3'),
(185, 1, '2022-04-09 18:55:08', 'resource_update', 'modResource', '3'),
(186, 1, '2022-04-09 18:55:36', 'resource_update', 'modResource', '3'),
(187, 1, '2022-04-09 18:58:33', 'resource_update', 'modResource', '3'),
(188, 1, '2022-04-09 18:58:40', 'resource_update', 'modResource', '3'),
(189, 1, '2022-04-09 18:59:28', 'resource_update', 'modResource', '3'),
(190, 1, '2022-04-09 19:31:54', 'file_remove', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/snake.png'),
(191, 1, '2022-04-09 19:32:04', 'file_upload', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/'),
(192, 1, '2022-04-09 19:36:03', 'chunk_create', 'modChunk', '13'),
(193, 1, '2022-04-09 19:36:58', 'chunk_create', 'modChunk', '14'),
(194, 1, '2022-04-09 19:37:54', 'login', 'modContext', 'web'),
(195, 1, '2022-04-09 19:39:42', 'save_profile', 'modUser', '1'),
(196, 1, '2022-04-09 19:40:08', 'chunk_update', 'modChunk', '13'),
(197, 1, '2022-04-09 19:40:09', 'propertyset_update_from_element', 'modPropertySet', 'modChunk 13 Default'),
(198, 1, '2022-04-09 19:40:29', 'chunk_update', 'modChunk', '13'),
(199, 1, '2022-04-09 19:40:29', 'propertyset_update_from_element', 'modPropertySet', 'modChunk 13 Default'),
(200, 1, '2022-04-09 19:44:08', 'setting_update', 'modSystemSetting', 'site_name'),
(201, 1, '2022-04-09 20:08:50', 'login', 'modContext', 'web'),
(202, 1, '2022-04-09 20:09:37', 'plugin_create', 'modPlugin', '5'),
(203, 1, '2022-04-09 20:10:01', 'plugin_update', 'modPlugin', '5'),
(204, 1, '2022-04-09 20:10:01', 'propertyset_update_from_element', 'modPropertySet', 'modPlugin 5 Default'),
(205, 1, '2022-04-09 20:10:31', 'login', 'modContext', 'web'),
(206, 1, '2022-04-09 20:12:59', 'login', 'modContext', 'mgr'),
(207, 1, '2022-04-09 20:13:17', 'login', 'modContext', 'web'),
(208, 1, '2022-04-09 20:15:09', 'template_update', 'modTemplate', '2'),
(209, 1, '2022-04-09 20:15:09', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(210, 1, '2022-04-09 20:15:20', 'template_update', 'modTemplate', '2'),
(211, 1, '2022-04-09 20:15:21', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(212, 1, '2022-04-09 20:16:52', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/wss/start.js'),
(213, 1, '2022-04-09 20:18:51', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/wss/start.js'),
(214, 1, '2022-04-09 20:19:15', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/wss/start.js'),
(215, 1, '2022-04-09 20:19:34', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/wss/start.js'),
(216, 1, '2022-04-09 20:24:13', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/wss/start.js'),
(217, 1, '2022-04-09 20:24:54', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/wss/start.js'),
(218, 1, '2022-04-09 20:27:28', 'chunk_create', 'modChunk', '15'),
(219, 1, '2022-04-09 20:32:45', 'plugin_create', 'modPlugin', '6'),
(220, 1, '2022-04-09 20:34:51', 'login', 'modContext', 'web'),
(221, 1, '2022-04-09 20:35:52', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/club_func.php'),
(222, 1, '2022-04-09 20:36:03', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/club_func.php'),
(223, 1, '2022-04-09 20:36:42', 'clear_cache', '', 'mgr'),
(224, 1, '2022-04-09 20:37:05', 'login', 'modContext', 'web'),
(225, 1, '2022-04-09 20:39:30', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/hook/chunk/help.html'),
(226, 1, '2022-04-09 20:39:51', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/hook/chunk/help.html'),
(227, 1, '2022-04-09 20:43:10', 'snippet_create', 'modSnippet', '24'),
(228, 1, '2022-04-09 20:44:46', 'resource_update', 'modResource', '2'),
(229, 1, '2022-04-09 20:44:58', 'login', 'modContext', 'web'),
(230, 1, '2022-04-09 21:12:01', 'file_upload', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/'),
(231, 1, '2022-04-09 21:12:03', 'file_upload', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/'),
(232, 1, '2022-04-09 21:12:05', 'file_upload', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/'),
(233, 1, '2022-04-09 21:12:06', 'file_upload', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/images/'),
(234, 1, '2022-04-09 21:36:54', 'resource_create', 'modDocument', '9'),
(235, 1, '2022-04-09 21:37:18', 'resource_update', 'modResource', '9'),
(236, 1, '2022-04-09 21:37:36', 'resource_update', 'modResource', '9'),
(237, 1, '2022-04-09 21:37:41', 'clear_cache', '', 'mgr'),
(238, 1, '2022-04-10 08:56:58', 'resource_update', 'modResource', '8'),
(239, 1, '2022-04-10 08:59:48', 'resource_create', 'modDocument', '10'),
(240, 1, '2022-04-10 09:00:14', 'resource_update', 'modResource', '10'),
(241, 1, '2022-04-10 09:02:12', 'login', 'modContext', 'web'),
(242, 1, '2022-04-10 09:02:56', 'clear_cache', '', 'mgr'),
(243, 1, '2022-04-10 09:03:52', 'login', 'modContext', 'mgr'),
(244, 1, '2022-04-10 09:08:13', 'snippet_create', 'modSnippet', '25'),
(245, 1, '2022-04-10 09:09:07', 'resource_update', 'modResource', '8'),
(246, 1, '2022-04-10 09:19:50', 'template_update', 'modTemplate', '2'),
(247, 1, '2022-04-10 09:19:51', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(248, 1, '2022-04-10 09:21:00', 'resource_update', 'modResource', '1'),
(249, 1, '2022-04-10 09:21:35', 'resource_update', 'modResource', '10'),
(250, 1, '2022-04-10 09:24:29', 'template_update', 'modTemplate', '2'),
(251, 1, '2022-04-10 09:24:29', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(252, 1, '2022-04-10 09:34:19', 'resource_update', 'modResource', '2'),
(253, 1, '2022-04-10 09:34:30', 'resource_update', 'modResource', '2'),
(254, 1, '2022-04-10 09:34:54', 'login', 'modContext', 'web'),
(255, 1, '2022-04-10 09:36:40', 'resource_update', 'modResource', '2'),
(256, 1, '2022-04-10 09:37:06', 'resource_update', 'modResource', '2'),
(257, 1, '2022-04-10 09:37:27', 'resource_update', 'modResource', '2'),
(258, 1, '2022-04-10 09:39:10', 'resource_update', 'modResource', '2'),
(259, 1, '2022-04-10 09:40:57', 'resource_update', 'modResource', '2'),
(260, 1, '2022-04-10 09:41:16', 'resource_update', 'modResource', '2'),
(261, 1, '2022-04-10 09:42:42', 'resource_update', 'modResource', '2'),
(262, 1, '2022-04-10 09:42:53', 'resource_update', 'modResource', '2'),
(263, 1, '2022-04-10 09:42:57', 'resource_update', 'modResource', '2'),
(264, 1, '2022-04-10 09:43:21', 'resource_update', 'modResource', '2'),
(265, 1, '2022-04-10 09:44:25', 'snippet_create', 'modSnippet', '26'),
(266, 1, '2022-04-10 09:45:01', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/setup/clubStuff.xml'),
(267, 1, '2022-04-10 09:45:25', 'snippet_update', 'modSnippet', '26'),
(268, 1, '2022-04-10 09:45:25', 'propertyset_update_from_element', 'modPropertySet', 'modSnippet 26 Default'),
(269, 1, '2022-04-10 09:45:42', 'snippet_update', 'modSnippet', '26'),
(270, 1, '2022-04-10 09:45:42', 'propertyset_update_from_element', 'modPropertySet', 'modSnippet 26 Default'),
(271, 1, '2022-04-10 09:46:23', 'snippet_update', 'modSnippet', '26'),
(272, 1, '2022-04-10 09:46:23', 'propertyset_update_from_element', 'modPropertySet', 'modSnippet 26 Default'),
(273, 1, '2022-04-10 09:51:32', 'resource_update', 'modResource', '2'),
(274, 1, '2022-04-10 09:54:03', 'resource_update', 'modResource', '2'),
(275, 1, '2022-04-10 11:19:47', 'resource_update', 'modResource', '4'),
(276, 1, '2022-04-10 11:40:53', 'login', 'modContext', 'web'),
(277, 1, '2022-04-10 12:27:44', 'resource_create', 'modDocument', '11'),
(278, 1, '2022-04-10 12:27:59', 'resource_update', 'modResource', '11'),
(279, 1, '2022-04-10 12:32:33', 'file_rename', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/edit/idLead_modify_before.php'),
(280, 1, '2022-04-10 12:33:23', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/edit/idIncome_modify_before.php'),
(281, 1, '2022-04-10 12:36:10', 'resource_update', 'modResource', '4'),
(282, 1, '2022-04-10 12:36:59', 'resource_update', 'modResource', '4'),
(283, 1, '2022-04-10 12:37:07', 'resource_update', 'modResource', '4'),
(284, 1, '2022-04-10 12:42:09', 'resource_update', 'modResource', '4'),
(285, 1, '2022-04-10 12:44:05', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/edit/idIncome_modify_before.php'),
(286, 1, '2022-04-10 12:44:13', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/id/edit/idIncome_modify_before.php'),
(287, 1, '2022-04-10 12:44:17', 'resource_update', 'modResource', '4'),
(288, 1, '2022-04-10 12:44:47', 'login', 'modContext', 'web'),
(289, 1, '2022-04-10 12:47:36', 'file_create', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(290, 1, '2022-04-10 12:48:31', 'resource_update', 'modResource', '10'),
(291, 1, '2022-04-10 12:48:41', 'resource_create', 'modDocument', '12'),
(292, 1, '2022-04-10 12:48:50', 'resource_update', 'modResource', '12'),
(293, 1, '2022-04-10 12:49:05', 'resource_update', 'modResource', '10'),
(294, 1, '2022-04-10 12:49:35', 'resource_create', 'modDocument', '13'),
(295, 1, '2022-04-10 12:50:01', 'resource_update', 'modResource', '13'),
(296, 1, '2022-04-10 12:50:21', 'resource_update', 'modResource', '13'),
(297, 1, '2022-04-10 12:51:00', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(298, 1, '2022-04-10 12:51:08', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(299, 1, '2022-04-10 12:51:16', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(300, 1, '2022-04-10 12:52:23', 'resource_update', 'modResource', '13'),
(301, 1, '2022-04-10 12:53:07', 'resource_update', 'modResource', '4'),
(302, 1, '2022-04-10 12:53:17', 'resource_update', 'modResource', '13'),
(303, 1, '2022-04-10 12:53:53', 'resource_update', 'modResource', '4'),
(304, 1, '2022-04-10 12:54:37', 'resource_update', 'modResource', '4'),
(305, 1, '2022-04-10 12:54:40', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(306, 1, '2022-04-10 12:54:59', 'resource_update', 'modResource', '4'),
(307, 1, '2022-04-10 12:55:13', 'resource_update', 'modResource', '4'),
(308, 1, '2022-04-10 12:55:20', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(309, 1, '2022-04-10 12:55:45', 'resource_update', 'modResource', '4'),
(310, 1, '2022-04-10 12:56:31', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(311, 1, '2022-04-10 12:57:13', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(312, 1, '2022-04-10 13:23:31', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(313, 1, '2022-04-10 13:23:59', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(314, 1, '2022-04-10 13:24:09', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(315, 1, '2022-04-10 13:26:50', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(316, 1, '2022-04-10 13:28:20', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(317, 1, '2022-04-10 13:30:00', 'resource_update', 'modResource', '13'),
(318, 1, '2022-04-10 13:30:34', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(319, 1, '2022-04-10 13:31:18', 'file_update', '', '/home/s/sportcrm/uroboros_start123_ru/public_html/assets/clubtools/hook/hackaton.php'),
(320, 1, '2022-04-10 14:20:16', 'template_update', 'modTemplate', '2'),
(321, 1, '2022-04-10 14:20:16', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(322, 1, '2022-04-10 14:20:37', 'template_update', 'modTemplate', '2'),
(323, 1, '2022-04-10 14:20:37', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(324, 1, '2022-04-10 14:22:59', 'resource_update', 'modResource', '13'),
(325, 1, '2022-04-10 14:23:29', 'resource_update', 'modResource', '13'),
(326, 1, '2022-04-10 14:23:46', 'resource_update', 'modResource', '13'),
(327, 1, '2022-04-10 14:24:07', 'template_update', 'modTemplate', '2'),
(328, 1, '2022-04-10 14:24:08', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(329, 1, '2022-04-10 14:24:52', 'template_update', 'modTemplate', '2'),
(330, 1, '2022-04-10 14:24:52', 'propertyset_update_from_element', 'modPropertySet', 'modTemplate 2 Default'),
(331, 1, '2022-04-10 14:25:22', 'resource_update', 'modResource', '13');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_media_sources`
--

CREATE TABLE `mx_media_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text,
  `class_key` varchar(100) NOT NULL DEFAULT 'sources.modFileMediaSource',
  `properties` mediumtext,
  `is_stream` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_media_sources`
--

INSERT INTO `mx_media_sources` (`id`, `name`, `description`, `class_key`, `properties`, `is_stream`) VALUES
(1, 'Filesystem', '', 'sources.modFileMediaSource', 'a:0:{}', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_media_sources_contexts`
--

CREATE TABLE `mx_media_sources_contexts` (
  `source` int(11) NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_media_sources_elements`
--

CREATE TABLE `mx_media_sources_elements` (
  `source` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `object_class` varchar(100) NOT NULL DEFAULT 'modTemplateVar',
  `object` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_membergroup_names`
--

CREATE TABLE `mx_membergroup_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rank` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dashboard` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_membergroup_names`
--

INSERT INTO `mx_membergroup_names` (`id`, `name`, `description`, `parent`, `rank`, `dashboard`) VALUES
(1, 'Administrator', NULL, 0, 0, 1),
(2, 'idAdmin', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_member_groups`
--

CREATE TABLE `mx_member_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_group` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `rank` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_member_groups`
--

INSERT INTO `mx_member_groups` (`id`, `user_group`, `member`, `role`, `rank`) VALUES
(1, 1, 1, 2, 0),
(2, 2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_menus`
--

CREATE TABLE `mx_menus` (
  `text` varchar(191) NOT NULL DEFAULT '',
  `parent` varchar(191) NOT NULL DEFAULT '',
  `action` varchar(191) NOT NULL DEFAULT '',
  `description` varchar(191) NOT NULL DEFAULT '',
  `icon` varchar(191) NOT NULL DEFAULT '',
  `menuindex` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `handler` text NOT NULL,
  `permissions` text NOT NULL,
  `namespace` varchar(100) NOT NULL DEFAULT 'core'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_menus`
--

INSERT INTO `mx_menus` (`text`, `parent`, `action`, `description`, `icon`, `menuindex`, `params`, `handler`, `permissions`, `namespace`) VALUES
('about', 'usernav', 'help', '', '<i class=\"icon-question-circle icon icon-large\"></i>', 7, '', '', 'help', 'core'),
('acls', 'admin', 'security/permission', 'acls_desc', '', 5, '', '', 'access_permissions', 'core'),
('admin', 'usernav', '', '', '<i class=\"icon-gear icon icon-large\"></i>', 6, '', '', 'settings', 'core'),
('bespoke_manager', 'admin', 'security/forms', 'bespoke_manager_desc', '', 1, '', '', 'customize_forms', 'core'),
('components', 'topnav', '', '', '', 2, '', '', 'components', 'core'),
('console', 'components', 'index', 'console_desc', 'images/icons/plugin.gif', 0, '', '', 'console', 'console'),
('content_types', 'site', 'system/contenttype', 'content_types_desc', '', 8, '', '', 'content_types', 'core'),
('contexts', 'admin', 'context', 'contexts_desc', '', 3, '', '', 'view_context', 'core'),
('dashboards', 'admin', 'system/dashboards', 'dashboards_desc', '', 2, '', '', 'dashboards', 'core'),
('edit_menu', 'admin', 'system/action', 'edit_menu_desc', '', 4, '', '', 'actions', 'core'),
('eventlog_viewer', 'reports', 'system/event', 'eventlog_viewer_desc', '', 2, '', '', 'view_eventlog', 'core'),
('file_browser', 'media', 'media/browser', 'file_browser_desc', '', 0, '', '', 'file_manager', 'core'),
('flush_access', 'manage', '', 'flush_access_desc', '', 3, '', 'MODx.msg.confirm({\n    title: _(\'flush_access\')\n    ,text: _(\'flush_access_confirm\')\n    ,url: MODx.config.connector_url\n    ,params: {\n        action: \'security/access/flush\'\n    }\n    ,listeners: {\n        \'success\': {fn:function() { location.href = \'./\'; },scope:this},\n        \'failure\': {fn:function(response) { Ext.MessageBox.alert(\'failure\', response.responseText); },scope:this},\n    }\n});', 'access_permissions', 'core'),
('flush_sessions', 'manage', '', 'flush_sessions_desc', '', 4, '', 'MODx.msg.confirm({\n    title: _(\'flush_sessions\')\n    ,text: _(\'flush_sessions_confirm\')\n    ,url: MODx.config.connector_url\n    ,params: {\n        action: \'security/flush\'\n    }\n    ,listeners: {\n        \'success\': {fn:function() { location.href = \'./\'; },scope:this}\n    }\n});', 'flush_sessions', 'core'),
('import_resources', 'site', 'system/import', 'import_resources_desc', '', 6, '', '', 'import_static', 'core'),
('import_site', 'site', 'system/import/html', 'import_site_desc', '', 5, '', '', 'import_static', 'core'),
('installer', 'components', 'workspaces', 'installer_desc', '', 0, '', '', 'packages', 'core'),
('lexicon_management', 'admin', 'workspaces/lexicon', 'lexicon_management_desc', '', 7, '', '', 'lexicons', 'core'),
('logout', 'user', 'security/logout', 'logout_desc', '', 2, '', 'MODx.logout(); return false;', 'logout', 'core'),
('manage', 'topnav', '', '', '', 3, '', '', 'menu_tools', 'core'),
('media', 'topnav', '', 'media_desc', '', 1, '', '', 'file_manager', 'core'),
('messages', 'user', 'security/message', 'messages_desc', '', 1, '', '', 'messages', 'core'),
('namespaces', 'admin', 'workspaces/namespace', 'namespaces_desc', '', 8, '', '', 'namespaces', 'core'),
('new_resource', 'site', 'resource/create', 'new_resource_desc', '', 0, '', '', 'new_document', 'core'),
('preview', 'site', '', 'preview_desc', '', 4, '', 'MODx.preview(); return false;', '', 'core'),
('profile', 'user', 'security/profile', 'profile_desc', '', 0, '', '', 'change_profile', 'core'),
('propertysets', 'admin', 'element/propertyset', 'propertysets_desc', '', 6, '', '', 'property_sets', 'core'),
('refreshuris', 'refresh_site', '', 'refreshuris_desc', '', 0, '', 'MODx.refreshURIs(); return false;', 'empty_cache', 'core'),
('refresh_site', 'manage', '', 'refresh_site_desc', '', 1, '', 'MODx.clearCache(); return false;', 'empty_cache', 'core'),
('remove_locks', 'manage', '', 'remove_locks_desc', '', 2, '', 'MODx.removeLocks();return false;', 'remove_locks', 'core'),
('reports', 'manage', '', 'reports_desc', '', 5, '', '', 'menu_reports', 'core'),
('resource_groups', 'site', 'security/resourcegroup', 'resource_groups_desc', '', 7, '', '', 'access_permissions', 'core'),
('site', 'topnav', '', '', '', 0, '', '', 'menu_site', 'core'),
('site_schedule', 'reports', 'resource/site_schedule', 'site_schedule_desc', '', 0, '', '', 'view_document', 'core'),
('sources', 'media', 'source', 'sources_desc', '', 1, '', '', 'sources', 'core'),
('system_settings', 'admin', 'system/settings', 'system_settings_desc', '', 0, '', '', 'settings', 'core'),
('topnav', '', '', 'topnav_desc', '', 0, '', '', '', 'core'),
('user', 'usernav', '', '', '<span id=\"user-avatar\">{$userImage}</span> <span id=\"user-username\">{$username}</span>', 5, '', '', 'menu_user', 'core'),
('usernav', '', '', 'usernav_desc', '', 0, '', '', '', 'core'),
('users', 'manage', 'security/user', 'user_management_desc', '', 0, '', '', 'view_user', 'core'),
('view_logging', 'reports', 'system/logs', 'view_logging_desc', '', 1, '', '', 'logs', 'core'),
('view_sysinfo', 'reports', 'system/info', 'view_sysinfo_desc', '', 3, '', '', 'view_sysinfo', 'core');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_namespaces`
--

CREATE TABLE `mx_namespaces` (
  `name` varchar(40) NOT NULL DEFAULT '',
  `path` text,
  `assets_path` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_namespaces`
--

INSERT INTO `mx_namespaces` (`name`, `path`, `assets_path`) VALUES
('ace', '{core_path}components/ace/', ''),
('console', '{core_path}components/console/', '{assets_path}components/console/'),
('core', '{core_path}', '{assets_path}'),
('login', '{core_path}components/login/', '{assets_path}components/login/'),
('pdotools', '{core_path}components/pdotools/', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_property_set`
--

CREATE TABLE `mx_property_set` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `category` int(10) NOT NULL DEFAULT '0',
  `description` varchar(191) NOT NULL DEFAULT '',
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_register_messages`
--

CREATE TABLE `mx_register_messages` (
  `topic` int(10) UNSIGNED NOT NULL,
  `id` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `valid` datetime NOT NULL,
  `accessed` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `accesses` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires` int(20) NOT NULL DEFAULT '0',
  `payload` mediumtext NOT NULL,
  `kill` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_register_queues`
--

CREATE TABLE `mx_register_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `options` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_register_queues`
--

INSERT INTO `mx_register_queues` (`id`, `name`, `options`) VALUES
(1, 'locks', 'a:1:{s:9:\"directory\";s:5:\"locks\";}'),
(2, 'resource_reload', 'a:1:{s:9:\"directory\";s:15:\"resource_reload\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_register_topics`
--

CREATE TABLE `mx_register_topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `queue` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `options` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_register_topics`
--

INSERT INTO `mx_register_topics` (`id`, `queue`, `name`, `created`, `updated`, `options`) VALUES
(1, 1, '/resource/', '2022-04-09 11:34:17', NULL, NULL),
(2, 2, '/resourcereload/', '2022-04-09 11:34:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_session`
--

CREATE TABLE `mx_session` (
  `id` varchar(191) NOT NULL DEFAULT '',
  `access` int(20) UNSIGNED NOT NULL,
  `data` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_session`
--

INSERT INTO `mx_session` (`id`, `access`, `data`) VALUES
('1001a32d79cc5cf196402a1f56a2aa8b', 1649584211, 'modx.user.contextTokens|a:2:{s:3:\"mgr\";i:1;s:3:\"web\";i:1;}login_failed|i:1;modx.mgr.user.token|s:52:\"modx625140e78d43a8.14783859_16251417e7dbfc7.18528794\";modx.mgr.session.cookie.lifetime|i:604800;modx.mgr.user.config|a:0:{}newResourceTokens|a:17:{i:0;s:23:\"62514509992ed5.19237259\";i:1;s:23:\"625145135fd419.15734095\";i:2;s:23:\"62514568d506d6.50240044\";i:3;s:23:\"6251457a39e3d4.20177408\";i:4;s:23:\"625146a69235c4.79775012\";i:5;s:23:\"6251474944c141.74934402\";i:6;s:23:\"625173b3d31613.24051919\";i:7;s:23:\"62517689a26b46.78583152\";i:8;s:23:\"6251769abdd662.52118685\";i:9;s:23:\"625176ad833100.00514414\";i:10;s:23:\"625176f825e084.55072471\";i:11;s:23:\"62517e17822780.34906965\";i:12;s:23:\"62517e490544d7.93796936\";i:13;s:23:\"625183901df226.16142040\";i:14;s:23:\"6252a7fd0a6005.36605861\";i:15;s:23:\"6252a8340adde0.66289061\";i:16;s:23:\"6252a852f29dc9.74965902\";}modx.user.1.userGroupNames|a:1:{i:0;s:13:\"Administrator\";}club_crew|b:0;modx.user.1.userGroups|a:1:{i:0;i:1;}modx.web.user.token|s:52:\"modx625140e78d43a8.14783859_16251bda2549683.92865064\";modx.web.session.cookie.lifetime|i:3024000;modx.web.user.config|a:0:{}'),
('2234adde0f3b97e89bcf18e09b9ae0d6', 1649590079, 'modx.user.contextTokens|a:0:{}modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}'),
('2afda85f53399668354b57b4ddb37f20', 1649589754, 'modx.user.contextTokens|a:0:{}modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}'),
('3b2e21afc3609dfe5c7196720db112b4', 1649584026, 'modx.user.contextTokens|a:0:{}modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}'),
('4964e8821244115ac047c3e2dfe1d02d', 1649570645, 'modx.user.contextTokens|a:0:{}modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}'),
('5c098b6779539f26d7cb87abac4bf3cb', 1649582922, 'modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}modx.user.contextTokens|a:0:{}'),
('61e0c7c0b1675a3945ac6c17c39ec9a8', 1649589839, 'modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}modx.user.contextTokens|a:0:{}'),
('6df52a80f043d97352d082ab65e758e2', 1649589954, 'modx.user.contextTokens|a:0:{}modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}'),
('6e5bbec42b275b3f78e2af9183b69830', 1649590063, 'modx.user.contextTokens|a:0:{}modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}'),
('895540c5448c7aa85d91e227370f2201', 1649492263, 'modx.user.contextTokens|a:0:{}'),
('94b8dddfff4ee893d647d6ab669c1bbf', 1649589897, 'modx.user.contextTokens|a:2:{s:3:\"mgr\";i:1;s:3:\"web\";i:1;}modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}modx.mgr.user.token|s:52:\"modx625140e78d43a8.14783859_162527348de1618.79926070\";modx.mgr.session.cookie.lifetime|i:0;modx.mgr.user.config|a:0:{}newResourceTokens|a:26:{i:0;s:23:\"625273490b55f4.96072291\";i:1;s:23:\"625274174904e3.62357312\";i:2;s:23:\"6252746a037e09.08120287\";i:3;s:23:\"62527617b696d2.01323744\";i:4;s:23:\"625277446fe6c3.94151615\";i:5;s:23:\"6252776d046e57.55343660\";i:6;s:23:\"6252779dda8dc9.33890929\";i:7;s:23:\"62527a3c5c7245.80738713\";i:8;s:23:\"62527a43bf09c4.13478663\";i:9;s:23:\"62527e1a586c18.08459131\";i:10;s:23:\"6252927a38c215.60999732\";i:11;s:23:\"625293389e1965.77286345\";i:12;s:23:\"6252a2b391a713.12174402\";i:13;s:23:\"6252a3120b0da2.28983563\";i:14;s:23:\"6252a31701f5e2.47953017\";i:15;s:23:\"6252a46d6782a5.80950040\";i:16;s:23:\"6252a54b52c095.50236432\";i:17;s:23:\"6252a6b95686e7.24448207\";i:18;s:23:\"6252a7d807f302.13599467\";i:19;s:23:\"6252a8e044b450.75889302\";i:20;s:23:\"6252af631d1861.84799285\";i:21;s:23:\"6252af8d847046.61034710\";i:22;s:23:\"6252bbe9ebed58.25972676\";i:23;s:23:\"6252bc09c78515.43225115\";i:24;s:23:\"6252be2f7c1294.79965545\";i:25;s:23:\"6252be89643701.51926561\";}modx.user.1.userGroupNames|a:2:{i:0;s:13:\"Administrator\";i:1;s:7:\"idAdmin\";}club_crew|b:1;modx.user.1.userGroups|a:2:{i:0;i:1;i:1;i:2;}modx.web.user.token|s:52:\"modx625140e78d43a8.14783859_16252a68026e1e6.28573756\";modx.web.session.cookie.lifetime|i:3024000;club_groups|s:21:\"Administrator;idAdmin\";scrm_thislogin|s:25:\"2022-04-10T12:42:24+03:00\";club_admin|i:1;club_debug|b:1;user_fullname|s:26:\"Администратор\";club_cityname|s:0:\"\";club_loginUrl|s:15:\"/dashboard.html\";modx.web.user.config|a:0:{}'),
('e179754ad4e439eb1375cc39ff19c11e', 1649492216, 'modx.user.contextTokens|a:0:{}'),
('fc4c4001413c7fa665051bf57feb40bb', 1649583887, 'modx.user.contextTokens|a:1:{s:3:\"web\";i:1;}modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}s:28:\"sources.modAccessMediaSource\";a:0:{}s:18:\"modAccessNamespace\";a:0:{}}}modx.web.user.token|s:52:\"modx625140e78d43a8.14783859_16252a70f8add90.10459469\";modx.web.session.cookie.lifetime|i:3024000;modx.user.1.userGroupNames|a:2:{i:0;s:13:\"Administrator\";i:1;s:7:\"idAdmin\";}club_groups|s:21:\"Administrator;idAdmin\";scrm_thislogin|s:25:\"2022-04-10T12:44:47+03:00\";club_admin|i:1;club_debug|b:1;user_fullname|s:26:\"Администратор\";club_cityname|s:0:\"\";modx.web.user.config|a:0:{}club_crew|b:1;club_loginUrl|s:15:\"/dashboard.html\";');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_content`
--

CREATE TABLE `mx_site_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(191) NOT NULL DEFAULT '',
  `longtitle` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `alias` varchar(191) DEFAULT '',
  `alias_visible` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `link_attributes` varchar(191) NOT NULL DEFAULT '',
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `introtext` text,
  `content` mediumtext,
  `richtext` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `cacheable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0',
  `publishedby` int(10) NOT NULL DEFAULT '0',
  `menutitle` varchar(191) NOT NULL DEFAULT '',
  `donthit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `privateweb` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `privatemgr` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0',
  `hidemenu` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `class_key` varchar(100) NOT NULL DEFAULT 'modDocument',
  `context_key` varchar(100) NOT NULL DEFAULT 'web',
  `content_type` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `uri` text,
  `uri_override` tinyint(1) NOT NULL DEFAULT '0',
  `hide_children_in_tree` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_tree` tinyint(1) NOT NULL DEFAULT '1',
  `properties` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_site_content`
--

INSERT INTO `mx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `alias_visible`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`) VALUES
(1, 'document', 'text/html', 'Главная', '', '', 'index', 1, '', 1, 0, 0, 0, 0, '', '[[!loginWay]]\r\n<div class=\"card card-body animated fadeInDown\">\r\n    [[!+rcode:notempty=`\r\n    <div class=\"alert alert-danger\">Error: [[+rcode]]</div>\r\n    `]]\r\n<div class=\"row flex-column-reverse flex-md-row\">\r\n    <div class=\"col-md-8\">\r\n        [[-<h3>Вход для родителей или законных представителей</h3>]]\r\n        <div class=\"loginBlocks\" style=\"display:none\">Вы вошли в систему как <b class=\"user_fullname\"></b>.\r\n            <a href=\"/?service=logout\">Выйти?</a>\r\n        </div>\r\n        <div class=\"loginBlocks\">\r\n            <a href=\"/?action=login\" class=\"btn btn-primary showLogin\"><i class=\"fa fa-unlock-alt\"></i> Войти в личный кабинет</a>\r\n        \r\n<div class=\"text-center mx-auto mt-2\" style=\"display:none;max-width:480px\" id=\"loginForm\">\r\n    <form method=\"post\" action=\"?action=login\" role=\"form\">\r\n        [[+errors]]\r\n        <input type=\"hidden\" name=\"returnUrl\" value=\"[[+rurl]]\">\r\n        <input type=\"hidden\" name=\"service\" value=\"login\">\r\n        <div class=\"form-group\">\r\n          <div class=\"form-label-group\">\r\n            <input type=\"text\" id=\"username\" name=\"username\" class=\"form-control placeholder-shown\" required=\"\" autofocus=\"\">\r\n            <label for=\"username\">E-mail</label>\r\n          </div>\r\n        </div>\r\n        <div class=\"form-group\">\r\n          <div class=\"form-label-group\">\r\n            <input type=\"password\" id=\"password\" name=\"password\" class=\"form-control placeholder-shown\" required=\"\">\r\n            <label for=\"password\">********</label>\r\n          </div>\r\n        </div>\r\n        <div class=\"form-group text-center\">\r\n          <div class=\"custom-control custom-control-inline custom-checkbox\">\r\n            <input type=\"checkbox\" class=\"custom-control-input\" id=\"rememberme\" value=\"1\" name=\"rememberme\" checked>\r\n            <label class=\"custom-control-label\" for=\"rememberme\">Запомнить меня</label>\r\n          </div>\r\n        </div>\r\n        <button type=\"submit\" class=\"btn btn-primary btn-block mb-2\">Вход</button><br>\r\n        <a href=\"/login/forgotpassword.html\">Восстановление доступа</a>\r\n    </form>\r\n</div>\r\n\r\n        </div>\r\n    </div>\r\n    <div class=\"col-md-4 animated fadeInRight mb-3\">\r\n        <img src=\"/assets/id/images/snake.png\" class=\"img-fluid mx-auto d-block\" />\r\n    </div>\r\n</div>\r\n</div>\r\n\r\n<script>\r\n$(function(){\r\n    var user = $(\'#user_fullname\');\r\n    if (user.length>0) {\r\n        $(\'.loginBlocks\').toggle();\r\n        $(\'.user_fullname\').text( user.text() );\r\n    } else {\r\n        function goLogin(e){\r\n            if (e) e.preventDefault();\r\n            $(\'.showLogin.btn\').hide();\r\n            var lgnfrm = $(\'#loginForm\').show();\r\n            clubScroll(lgnfrm);\r\n        }\r\n        $(\'.showLogin\').click(goLogin);\r\n        var param = getUrlVars();\r\n        if (param.action && param.action==\'login\') goLogin();\r\n    }\r\n    $(\'.form-label-group:eq(0) > input\').trigger(\'focus\');\r\n});\r\n</script>', 0, 2, 0, 1, 1, 1, 1649492122, 1, 1649571660, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 'modDocument', 'web', 1, 'index.html', 0, 0, 1, NULL);
INSERT INTO `mx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `alias_visible`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`) VALUES
(2, 'document', 'text/html', 'Настройки', '', '', 'opts', 1, '', 1, 0, 0, 5, 0, '', '<style>\r\n    /*header.page-navs{display:none;}*/\r\n    .cp-color-picker {\r\n        z-index: 1051;\r\n    }\r\n</style>\r\n\r\n<div class=\"card card-fluid\" id=\"optsPanel\">\r\n    <div class=\"tab-content card-body\">\r\n        <div id=\"tab_idConfig\" class=\"tab-pane active\">\r\n            <div data-link=\"{include tmpl=\'#tplIdConfig\'}\"></div>\r\n        </div>\r\n        <div id=\"tab_idCity\" class=\"tab-pane\">\r\n            <table id=\"grid_idCity\" data-entity=\"idCity\"></table>\r\n            \r\n        </div>\r\n        <div id=\"tab_idInvoiceType\" class=\"tab-pane\">\r\n            <div class=\"nav nav-pills mb-2\" role=\"tablist\">\r\n                <a class=\"nav-item nav-link active\" data-toggle=\"tab\" href=\"#itype_list\">Услуги</a>\r\n                <a class=\"nav-item nav-link\" data-toggle=\"tab\" href=\"#itype_stype\">Абонементы</a>\r\n            </div>\r\n            <div class=\"tab-content\">\r\n                <div id=\"itype_list\" class=\"tab-pane active\">\r\n                    <div class=\"small mb-1\">\r\n                        <i class=\"fa fa-info-circle\"></i>\r\n                        Списание занятий происходит только если указан тип в столбце \"Абонемент\" и настроены\r\n                        <a href=\"#\" onclick=\"$(\'[href$=itype_stype]\').click();return false;\">правила списания</a>\r\n                    </div>\r\n                    <table id=\"grid_idInvoiceType\" data-entity=\"idInvoiceType\"></table>\r\n                </div>\r\n                <div id=\"itype_stype\" class=\"tab-pane\">\r\n                    <table class=\"table w-auto\">\r\n                        <tbody data-link=\"{include tmpl=\'#tpl_stype_ed\'}\"></tbody>\r\n                    </table>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div id=\"tab_idMedobj\" class=\"tab-pane\">\r\n            <table id=\"grid_idMedobj\" data-entity=\"idMedobj\"></table>\r\n        </div>\r\n        <div id=\"tab_idTypes\" class=\"tab-pane\">\r\n            <table id=\"grid_idTypes\" data-entity=\"idTypes\"></table>\r\n        </div>\r\n        <div id=\"tab_idStatus\" class=\"tab-pane\">\r\n            <div class=\"mb-2 d-flex\" data-link=\"{include tmpl=\'#statusTypes\'}\"></div>\r\n            <table id=\"grid_idStatus\" data-entity=\"idStatus\"></table>\r\n            <div class=\"mt-2\" data-link=\"visible{:showArcStatus}\">\r\n                <h6>Архивные статусы</h6>\r\n                <a href=\"#\" data-roinplace=\"CfgInpSave\" data-link=\"text{:cfgArcStatus} data-name{:statusType+\'_arc\'}\" class=\"dashed\"></a>\r\n            </div>\r\n        </div>\r\n        <div id=\"tab_idTmpl\" class=\"tab-pane\" data-link=\"{if tmplEdit tmpl=\'#tpl_tmpl\'}\"></div>\r\n    </div>\r\n</div>\r\n\r\n<script>\r\nvar optsData = $.extend({\r\n    opts: {},\r\n    idSchedule: [],\r\n    cS: SCRM.clubStatus\r\n}, SCRM.setClubStatus([[!clubStatus?tbl=`idStatus,idConfig`]]));\r\n\r\nSCRM.link(SCRM.app, {\r\n    topNavTabs: [\r\n        {href: \'#tab_idConfig\', html: \'Настройки\', active: true},\r\n        {href: \'#tab_idCity\', html: \'Города\'},\r\n        {href: \'#tab_idMedobj\', html: \'Медучреждения\'},\r\n        {href: \'#tab_idTypes\', html: \'Классификатор\'},\r\n        {href: \'#tab_idStatus\', html: \'Списки\'},\r\n        {href: \'#tab_idTmpl\', html: \'Шаблоны\'}\r\n    ]\r\n});\r\n\r\n[[!+modx.user.id:userinfo=`sudo`:notempty=`\r\noptsData.sudo = true;\r\n`]]\r\n\r\nfunction setConfigValue(key, value) {\r\n    return pEDIT(\'idConfig\', {\r\n        id: key,\r\n        val: value\r\n    }, function(result) {\r\n        SCRM.success(\'Saved\');\r\n        optsData.opts[key] = value;\r\n    });\r\n}\r\n\r\nfunction bindAceEditor(opts) {\r\n    $(\'[data-ace]\')\r\n    .clubAce(opts)\r\n    .removeAttr(\'[data-ace]\');\r\n}\r\n\r\n$.extend(SCRM._service, {\r\n    optsHTML: function(runOpts) {\r\n        SCRM.link(optsData, {\r\n            optsTmpl: \'#tpl_optsHTML\',\r\n            addHTMLBlock: function() {\r\n                var alias = prompt(\'Alias блока (латиница)\');\r\n                if (alias) {\r\n                    var ad = {\r\n                        oper:\'add\',\r\n                        tbl:\'idHTML\',\r\n                        name: alias,\r\n                        alias: alias\r\n                    };\r\n                    pEDIT(\'idStatus\', ad, function(){\r\n                        SCRM.link(SCRM.clubStatus.idHTML).insert(ad);\r\n                        SCRM.link(optsData, {selHTML: alias});\r\n                        SCRM.success(\'Добавил\');\r\n                    });\r\n                }\r\n            }\r\n        });\r\n        if (!optsData.selHTML) {\r\n            $.observe(optsData, \'selHTML\', function(e, data){\r\n                //var d = array2obj(SCRM.clubStatus.idHTML, {}, \'alias\')[data.value];\r\n                var d = SCRM.getClubStatus(\'idHTML\', data.value, \'alias\');\r\n                var cfg_key = data.value+\'HTMLBlock\';\r\n                getConfigFields(cfg_key, function(fields, opts) {\r\n                    SCRM.link(optsData, {\r\n                        optsHTMLEdit: [{\r\n                            key: cfg_key,\r\n                            val: opts[cfg_key],\r\n                            cls: d.cls||\'html\'\r\n                        }]\r\n                    });\r\n                    bindAceEditor();\r\n                });\r\n            });\r\n            SCRM.link(optsData, {\r\n                selHTML: \'Startup\'\r\n            });\r\n        } else {\r\n            bindAceEditor();\r\n        }\r\n    },\r\n    optsMain: function(runOpts) {\r\n        SCRM.link(optsData, {\r\n            optsTmpl: \'#tpl_optsMain\'\r\n        });\r\n        \r\n        pJSON(SCRM.files_url, {\r\n            uid: \'logoClub\',\r\n            thumb: 1\r\n        }, function(logodata){\r\n            $(\'#logoClub\').trigger(\'logoClub\', logodata);\r\n        });\r\n    },\r\n    optsPays: function(runOpts) {\r\n        getConfigFields(runOpts.paym, function(fields, opts) {\r\n            SCRM.link(optsData, {\r\n                payOpts: runOpts,\r\n                paym: opts,\r\n                optsTmpl: \'#tpl_optsPays\'\r\n            });\r\n            bindAceEditor();\r\n        });\r\n    }\r\n});\r\n\r\nSCRM.getPayMethods = function(parent, ptype) {\r\n    ptype = ptype || \'idCity_Pay\';\r\n    pDATA(\'idStatus\', {\r\n        rows: 1001,\r\n        sidx: \'menuindex\',\r\n        _where: {\r\n            //tbl: \'idPayMethod\',\r\n            idPayMethod: ptype,\r\n            \'idPayMethod.parent\': [0, parent]\r\n        }\r\n    }, function(data) {\r\n        var nd = {};\r\n        nd[ptype] = data.rows;\r\n        SCRM.link(optsData, nd);\r\n    });\r\n}\r\n\r\n$.views.helpers({\r\n    PayMethods: function(rows, parent){\r\n        var nr = $.map(rows, function(v, i){\r\n            //if (!v.ext) v.ext = v.extended? JSON.parse(v.extended) : {};\r\n            return (v.parent == parent)? v : null;\r\n        });\r\n        return nr;\r\n    },\r\n    editPayMethod: function(e, data) {\r\n        console.log(e, data);\r\n        var d = data.linkCtx.data;\r\n        var cfg_key = \'idPayMethod_\'+d.id;\r\n        d.oper = \'edit\';\r\n        var epmData = {\r\n            post: d,\r\n            body: \'#tpl_editPayMethod\',\r\n            onOK: function(e, md) {\r\n                pEDIT(\'idStatus\', epmData.post, function(){\r\n                    var ext = epmData.getValue();\r\n                    if (ext) setConfigValue(cfg_key, ext);\r\n                    md.mdl_hide();\r\n                });\r\n            }\r\n        };\r\n        club_Modal(epmData);\r\n        \r\n        getConfigFields(cfg_key, function(fields, opts) {\r\n            $(\'#configPayMethod\')\r\n            .val(opts[cfg_key]||d.extended)\r\n            .clubAce();\r\n        });\r\n    },\r\n    addPayMethod: function(parent, ptype) {\r\n        var apmData = {\r\n            body: \'<select class=\"custom-select\" data-link=\"selPayMethod\">{^{for idPayMethods tmpl=\"#tpl_selectOption\" /}}</select>\',\r\n            onOK: function(e, md) {\r\n                if (md.selPayMethod) {\r\n                    var mtd = array2obj(md.idPayMethods)[md.selPayMethod];\r\n                    var postData = {\r\n                        oper: \'add\',\r\n                        tbl: \'idPayMethod\',\r\n                        name: mtd.name,\r\n                        cls: mtd.alias,\r\n                        extended: mtd.extended,\r\n                        info: mtd.info,\r\n                        idExtid: ptype +\':\'+ parent\r\n                    };\r\n                    pEDIT(\'idStatus\', postData, function(data){\r\n                        SCRM.getPayMethods(parent, ptype);\r\n                        md.mdl_hide();\r\n                    });\r\n                }\r\n            }\r\n        };\r\n        club_Modal(apmData);\r\n        pJSON(\'/data/status/idPay\', function(data){\r\n            SCRM.link(apmData, {idPayMethods: data.rows});\r\n        })\r\n    }\r\n});\r\n\r\nfunction getConfigFields(fields, callback) {\r\n    fields = fields.split(\',\');\r\n    pDATA(\'idConfig\', {\r\n        rows: 1001,\r\n        _where: {\r\n            name: fields\r\n        }\r\n    }, function(data) {\r\n        var opts = {};\r\n        $.each(fields, function(i, v){\r\n            opts[v] = \'\';\r\n        });\r\n        $.each(data.rows, function(i, v){\r\n            opts[v.name] = v.val;\r\n        });\r\n        SCRM.link(optsData.opts, opts);\r\n        //console.log(\'getConfigFields\', optsData);\r\n        if (callback) callback(fields, opts);\r\n    });\r\n}\r\n\r\nSCRM.loadWSS(\'files\', function() {\r\n    var idConfig = function(cfg) {\r\n        cfg.extended = cfg.extended || {};\r\n        function showConfig(opts) {\r\n            if (cfg.extended.run) {\r\n                SCRM._run(cfg.extended.run, opts);\r\n                return true;\r\n            }\r\n            SCRM.link(optsData, {\r\n                optsFields: opts,\r\n                optsTmpl: \'#tpl_optsDefault\'\r\n            });\r\n            bindAceEditor();\r\n        }\r\n        if (cfg.extended.fields) {\r\n            getConfigFields(cfg.extended.fields, function(fields, opts){\r\n                showConfig(opts);\r\n            });\r\n        } else showConfig({});\r\n    };\r\n    \r\n    var optsPanel = $(\'#optsPanel\')\r\n    .link(true, optsData, {\r\n        checkOpts: function(key, e, data){\r\n            var el = $(e.target),\r\n                val = el.prop(\'checked\')? el.val() : \'\';\r\n            setConfigValue(key, val);\r\n        },\r\n        idConfig: function(e, data) {\r\n            idConfig(data.linkCtx.data);\r\n        },\r\n        idConfigCustom: function(e, data) {\r\n            e.preventDefault();\r\n            if (optsData.cfgCustom) idConfig({\r\n                extended: {\r\n                    fields: optsData.cfgCustom\r\n                }\r\n            });\r\n        },\r\n        saveConfig: function(e, data) {\r\n            //console.log(\'saveConfig\', e, data)\r\n            var d = data.linkCtx.data;\r\n            SCRM.link(d, {val: d.getValue()})\r\n            setConfigValue(d.key, d.val);\r\n        },\r\n        delConfig: function(e, data) {\r\n            var d = data.linkCtx.data;\r\n            var cfg_name = d.key;\r\n            rocnfrm(\'Delete <b>\'+cfg_name+\'</b>?\', function(){\r\n                //console.log(e, data)\r\n                pEDIT(\'idConfig\', {\r\n                    oper: \'del\',\r\n                    id: cfg_name\r\n                }, function(){\r\n                    $(e.target).closest(\'.card\').remove();\r\n                });\r\n            });\r\n        },\r\n        resizeEditor: function(e, data) {\r\n            var d = data.linkCtx.data;\r\n            d.resizeEditor(d);\r\n        },\r\n        setIsMain: function(e, data) {\r\n            setConfigValue(optsData.statusType+\'_main\', optsData.showIsMainBtn)\r\n            .always(function(e){\r\n                grids.idStatus\r\n                .trigger(\'reloadGrid\');\r\n            });\r\n        }\r\n    })\r\n    .on(\'CfgInpSave\', function(e, txt) {\r\n        setConfigValue($(e.target).data(\'name\'), txt);\r\n    });\r\n    \r\n    $(document)\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idTmpl\"]\', function (e) { // Работа с Шаблонами\r\n        $.views.helpers({\r\n            newTmpl: function(e, data){\r\n                SCRM.link(optsData, {\r\n                    tmplEdit: {\r\n                        oper: \'add\',\r\n                        type: \'email\',\r\n                        content: \'\'\r\n                    }\r\n                });\r\n            },\r\n            saveTmpl: function(e, data){\r\n                if (!optsData.tmplEdit.name) {\r\n                    SCRM.alert(\'Name field empty\');\r\n                    return;\r\n                }\r\n                var d = data.linkCtx.data;\r\n                //console.log(\'saveTmpl\', optsData.tmplEdit, d )\r\n                pEDIT(\'idTmpl\', $.extend(optsData.tmplEdit, {\r\n                    content: d.getValue()\r\n                }), function(result) {\r\n                    SCRM.success(\'Saved\');\r\n                    if (optsData.tmplEdit.oper==\'add\') SCRM.link(optsData, {tmplEdit: {}});\r\n                    refreshTmpl();\r\n                });\r\n            },\r\n            delTmpl: function(e, data){\r\n                rocnfrm(\'Delete tmpl?\', function(){\r\n                    pEDIT(\'idTmpl\', {oper: \'del\', id: optsData.tmplEdit.id}, function(data){\r\n                        SCRM.link(optsData, {tmplEdit: {}});\r\n                        refreshTmpl();\r\n                    });\r\n                });\r\n            },\r\n            editTmpl: function(e, data){\r\n                var d = $.extend({oper:\'edit\'}, data.linkCtx.data);\r\n                SCRM.link(optsData, {tmplEdit: d});\r\n            }\r\n        });\r\n        \r\n        SCRM.link(optsData, {tmplEdit: {}});\r\n        \r\n        var ed_elm = $(\'#tab_idTmpl textarea\')\r\n        .on(\'clubAce\', function(e, editor){\r\n            $.observe(optsData, \'tmplEdit^content\', function(e, data){\r\n                editor.setValue(data.value.content || \'\');\r\n            });\r\n        })\r\n        .clubAce({\r\n            mode: \'html\'\r\n        });\r\n        \r\n        function refreshTmpl(opts){\r\n            return pDATA(\'idTmpl\', $.extend({\r\n                rows: 1001\r\n            }, opts), function(data) {\r\n                SCRM.link(optsData, {idTmpl: data});\r\n            });\r\n        }\r\n        \r\n        // Загрузить документы при первом запуске:\r\n        refreshTmpl({_process: \'idTmplFile\'})\r\n        .done(function(data){\r\n            if (data.usertmpl) {\r\n                $.extend(data.usertmpl, {\r\n                    post: {filetype: \'sysfile\'}\r\n                });\r\n                $(\'#tmplFiles\').trigger(\'usertmpl\', data.usertmpl);\r\n            }\r\n        })\r\n        \r\n    })\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idInvoiceType\"]\', function (e) {\r\n        var sch = {},\r\n        keys = $.map(optsData.idSchedule, function(v, i) {\r\n            var key = \'schedule_\' + v.alias;\r\n            sch[key] = {idx: i, chLesson:[]};\r\n            return key;\r\n        });\r\n        getConfigFields(keys.join(\',\'), function(fields, opts) {\r\n            $.each(opts, function(i, v){\r\n                sch[i].chLesson = v.split(\'\');\r\n            });\r\n            $.each(sch, function(i, v){\r\n                SCRM.link(optsData.idSchedule[v.idx], {chLesson: v.chLesson});\r\n            });\r\n            $.observable(optsData.idSchedule).observeAll(function(e, data){\r\n                if (data.path == \'chLesson\') {\r\n                    setConfigValue(\'schedule_\' + e.target.alias, data.value.join(\'\'));\r\n                }\r\n            });\r\n        });\r\n    })\r\n    \r\n\r\n    idConfig(optsData.idConfig[0]);\r\n});\r\n\r\n(function ( $ ) {\r\n    $.fn.clubAce = function(opts){\r\n        opts = $.extend({mode:\'javascript\'}, opts);\r\n        var elms = this;\r\n        \r\n        SCRM.loadWSS(\'ace\', function(){\r\n            elms.each(function(i, v) {\r\n                var textarea = $(this),\r\n                    view = textarea.view(),\r\n                    editor = ace.edit(this);\r\n                \r\n                console.log(textarea.data(\'ace\') || opts.mode, view, editor);\r\n\r\n                editor.setTheme(\'ace/theme/chrome\');\r\n                editor.session.setMode(\'ace/mode/\' + (textarea.data(\'ace\') || opts.mode));\r\n                editor.setOptions({\r\n                    minLines: 8,\r\n                    //maxLines: Infinity,\r\n                    maxLines: 20,\r\n                    useWorker: false,\r\n                    wrap: true\r\n                });\r\n\r\n                editor.commands.addCommand({\r\n                    name: \'save\',\r\n                    bindKey: {win: \'Ctrl-S\', mac: \'Cmd-S\'},\r\n                    exec: function(editor) {\r\n                        textarea.trigger(\'saveAce\')\r\n                    }\r\n                });\r\n\r\n                editor.session.on(\'change\', function () {\r\n                    SCRM.link(view.data, {edited: true});\r\n                });\r\n                SCRM.link(view.data, {\r\n                    getValue: function(){\r\n                        return editor.session.getValue();\r\n                    },\r\n                    resizeEditor: function(){\r\n                        var eparent = $(editor.container).parent(),\r\n                            maxLines = editor.getOption(\'maxLines\'),\r\n                            minLines = editor.getOption(\'minLines\'),\r\n                        mdl = club_Drawer({\r\n                            cm_size: \'lg\',\r\n                            title: view.data.key,\r\n                            body: \'\'\r\n                        })\r\n                        .on(\'shown.bs.modal\', function(e) {\r\n                            var mb = $(\'.modal-body\', mdl).toggleClass(\'p-0 my-2 m-0\'),\r\n                                rowcnt = Math.ceil(mb.height() / editor.renderer.lineHeight);\r\n                            mb.append(editor.container);\r\n                            editor.setOptions({\r\n                                minLines: rowcnt-2,\r\n                                maxLines: rowcnt-2\r\n                            });\r\n                        })\r\n                        .on(\'hide.bs.modal\', function(e) {\r\n                            eparent.append(editor.container);\r\n                            editor.setOptions({\r\n                                minLines: minLines,\r\n                                maxLines: maxLines\r\n                            });\r\n                        });\r\n                    }\r\n                });\r\n                textarea.trigger(\'clubAce\', editor);\r\n            });\r\n        });\r\n        return this;\r\n    }\r\n}( jQuery ));\r\n\r\n\r\nSCRM.loadWSS(\'grid\', function() {\r\n\r\n    $(document)\r\n    .on(\'click\', \'.fmtStype\', function(e){\r\n        e.preventDefault();\r\n        var lnk = $(this), typeinvoice = lnk.data(\'id\');\r\n        var sitdata = {\r\n            body: \'#tpl_idSInvType_edit\',\r\n            cm_size: \'sm\'\r\n        };\r\n        club_Modal(sitdata, {\r\n            idSInvType: function(e, data) {\r\n                var ch = $(e.target).prop(\'checked\'),\r\n                    d = data.linkCtx.data,\r\n                    ed;\r\n                    \r\n                if (ch && !d.SInvType) ed = {oper: \'add\', stype: d.alias, typeinvoice: typeinvoice};\r\n                if (!ch && d.SInvType) {\r\n                    ed = {oper: \'del\', id: d.SInvType};\r\n                    $.observable(d).setProperty(\'SInvType\', null);\r\n                }\r\n                if (ed) pEDIT(\'idSInvType\', ed, function(data){\r\n                    if (data.oper==\'add\' && data.row) $.observable(d).setProperty(\'SInvType\', data.row.id);\r\n                    grids.idInvoiceType.trigger(\'reloadGrid\', [{current:true}]);\r\n                });\r\n            }\r\n        });\r\n        \r\n        pDATA(\'idSInvType\', {\r\n            rows: 1001,\r\n            _where: {typeinvoice: typeinvoice}\r\n        }, function(data){\r\n            var SInvType = {};\r\n            $.each(data.rows, function(i, v) {\r\n                SInvType[ v.stype ] = v.id;\r\n            });\r\n            var newSched = $.map(optsData.idSchedule, function(v, i) {\r\n                return $.extend({\r\n                    SInvType: SInvType[v.alias]\r\n                }, v);\r\n            });\r\n            SCRM.link(sitdata, {idSchedule: newSched});\r\n        });\r\n    })\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idInvoiceType\"]\', function (e) {\r\n        grids.idInvoiceType = $(\"#grid_idInvoiceType\").jqGridInit({\r\n            postData: {\r\n                // clubStatus: \'idSchedule,idLesson\',\r\n                filters: SCRM.obj2Filter({published: 1})\r\n            },\r\n            multiSort: true,\r\n            sortname: \'menuindex asc, name\',\r\n            sortorder: \'asc\',\r\n            search: true,\r\n            rowNum: 25, rowList: false, pginput: false,\r\n            colModel:[\r\n                {name:\'id\', hidden: true, template: idFieldTemplate},\r\n                {name:\'name\', label:\'Наименование\', width:250, editable: true,\r\n                    editrules:{required:true, edithidden:true},\r\n                    template: editRowLinkTemplate\r\n                },\r\n                {name:\'price\', label:\'Стоимость\', editable: true,\r\n                    template:numberTemplate\r\n                },\r\n                {name:\'amount\', label:\'Количество занятий\', editable: true,\r\n                    template:numberTemplate\r\n                },\r\n                {name:\'period\', label:\'Период\', editable: true, width: 200,\r\n                    formoptions: {\r\n                        //elmprefix:\"&nbsp;&nbsp;(<span class=\'mystar\' style=\'color:red\'>*</span>)&nbsp;\",\r\n                        label: \'Период \'+SCRM.hintLink(\'options_typeinvoice_period\')\r\n                        //label: \"<span>Date<span><span style=\'float:right\'>XXX</span>\"\r\n                    }\r\n                },\r\n                {name:\'stype\', label:\'Абонемент\', width:150,\r\n                    search: false,\r\n                    formatter: function(cellValue, opts, rObj) {\r\n                        return \'<a href=\"#\" class=\"fmtStype\" data-id=\"\'+ rObj.id +\'\">\' +\r\n                            ((cellValue)? cellValue : \'<i class=\"fa fa-plus\"></i>\') +\r\n                            \'</a>\';\r\n                    }\r\n                },\r\n                {template: menuindexTemplate},\r\n                {template: publishedTemplate}\r\n            ],\r\n            navOpts: {add: true, edit: true, del: false, search: false}\r\n        })\r\n        .jqGrid(\'filterToolbar\', {autosearch: true})\r\n        .jqGridColumns()\r\n        .jqGridExport();\r\n    })\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idCity\"]\', function (e) {\r\n        grids.idCity = $(\"#grid_idCity\")\r\n        .jqGridInit({\r\n            sortname: \'name\', sortorder: \'asc\',\r\n            autowidth: true,\r\n            colModel:[\r\n                {name:\'id\', hidden: true, template: idFieldTemplate},\r\n                {name:\'name\', label:\'Наименование\', width:300, editable: true,\r\n                    template: editRowLinkTemplate\r\n                }\r\n                //,{template: publishedTemplate}\r\n            ],\r\n            rowattr: function(data) {\r\n                /*if (data.published != \'1\'){\r\n                    return {\'class\': \'rowArc\'};\r\n                }*/\r\n            },\r\n            navOpts: {add: true, edit: true, del: false}\r\n        })\r\n        .jqGridColumns()\r\n        .jqGridExport()\r\n        .on(\'jqGridSelectRow\', function(e, rid) {\r\n            var city = $(e.target).jqGrid(\'getRowData\', rid);\r\n            SCRM.link(optsData, {\r\n                selCity: city\r\n            });\r\n            SCRM.getPayMethods(city.id);\r\n        });\r\n        \r\n        SCRM.getPayMethods(0);\r\n    })\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idMedobj\"]\', function (e) {\r\n        grids.Level = $(\"#grid_idMedobj\").jqGridInit({\r\n            sortname: \'name\', sortorder: \'asc\',\r\n            colModel:[\r\n                {name:\'id\', hidden: true, template: idFieldTemplate},\r\n                {name:\'name\', label:\'Наименование\', width:450, editable: true,\r\n                    template: editRowLinkTemplate\r\n                },\r\n                {name:\'city\', label: \'Город\', width: 150, editable: true,\r\n                    template: selTemplate,\r\n                    //template: lookTemplate,\r\n                    dbvalues: \'idCity\'\r\n                },\r\n            ],\r\n            navOpts: {add: true, edit: true, del: false}\r\n        })\r\n        .jqGridColumns();\r\n    })\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idTypes\"]\', function (e) {\r\n        grids.idSport = $(\"#grid_idTypes\")\r\n        .jqGridInit({\r\n            multiSort: true,\r\n            //sortname: \'menuindex asc, name\',\r\n            sortorder: \'asc\',\r\n            colModel: [\r\n                {name:\'id\', hidden: true, template: idFieldTemplate},\r\n                {name:\'name\', label:\'Наименование\', width:200, editable: true,\r\n                    editrules:{required:true, edithidden:true},\r\n                    template: editRowLinkTemplate\r\n                },\r\n                /*{name: \'shortname\', label: \'Сокращенно\', width: 50, editable: true,\r\n                    editrules: {required: true, edithidden: true}\r\n                },\r\n                {name: \'color\', label: \'Цвет\', width: 80, editable: true,\r\n                    editoptions: {\r\n                        dataInit: function(elem) {\r\n                            var el = $(elem);\r\n                            if (!el.val()) el.val(\'#FFFFFF\');\r\n                            el.css(\'background\', el.val());\r\n                            SCRM.loadWSS(\'colorpick\', function() {\r\n                                el.colorPicker();\r\n                            });\r\n                        }\r\n                    },\r\n                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){\r\n                        return \' style=\"background:\'+ (cellValue || \'#fff\') +\';\"\';\r\n                    }\r\n                },\r\n                {template: menuindexTemplate,\r\n                    formoptions:{rowpos:1, colpos:2}\r\n                },\r\n                {template: publishedTemplate}*/\r\n            ],\r\n            rowattr: function(data) {\r\n                /*if (data.published != \'1\'){\r\n                    return {\'class\': \'rowArc\'};\r\n                }*/\r\n            },\r\n            navOpts:  {add: true, edit: true, del: false}\r\n        })\r\n        .jqGridColumns();\r\n    })\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idStatus\"]\', function (e) {\r\n        grids.idStatus = $(\"#grid_idStatus\")\r\n        .on(\'jqGridSerializeGridData\', function(e, postData) {\r\n            postData._where = {tbl: optsData.statusType};\r\n        })\r\n        .on(\'jqGridAddEditSerializeEditData\', function(e, data){\r\n            if (data.oper==\'add\') data.tbl = optsData.statusType;\r\n        })\r\n        .one(\'reloadGrid\', function(e){\r\n            var gr = $(this)\r\n            .jqGridInit({\r\n                //rowNum: 50,\r\n                sortname: \'menuindex\', sortorder: \'asc\',\r\n                colModel: [\r\n                    {name:\'id\', hidden: true, template: idFieldTemplate},\r\n                    {name:\'is_main\', label:\'По умолчанию\', template: \'booleanCheckbox\'},\r\n                    {name:\'name\', label:\'Наименование\', width:140, editable: true,\r\n                        editrules: {required: true, edithidden: true},\r\n                        template: editRowLinkTemplate\r\n                    },\r\n                    {name:\'alias\', width:75, editable: true,\r\n                        editrules: {required: true, edithidden: true}\r\n                    },\r\n                    {name:\'ico\', label:\'Значок\', width:75, editable: true},\r\n                    {name:\'cls\', label:\'Класс\', width:75, editable: true},\r\n                    {name:\'extended\', label: \'extended\', template: infoTemplate, \r\n                        width:250,\r\n                        hidden: false,\r\n                        editable: true, editrules: {edithidden: true},\r\n                        formatter: function(cellValue, opts, rObj) {\r\n                            if (cellValue) {\r\n                                var value = JSON.parse(cellValue);\r\n                                cellValue = JSON.stringify(value);\r\n                            }\r\n                            return cellValue || \'\';\r\n                        }\r\n                    },\r\n                    {name:\'info\', template: infoTemplate,\r\n                        hidden: true, editable: true, editrules: {edithidden:true}\r\n                    },\r\n                    {template: menuindexTemplate,\r\n                        formoptions: {rowpos: 1, colpos: 2}\r\n                    },\r\n                    {template: publishedTemplate},\r\n                    {name:\'club_id\', hidden: true}\r\n                ],\r\n                rowattr: function(data) {\r\n                    if (data.published != \'1\'){\r\n                        return {\'class\': \'rowArc\'};\r\n                    }\r\n                }\r\n                [[- grouping:true,\r\n               	groupingView : {\r\n               		groupField : [\'tbl\'],\r\n                    groupColumnShow : [false],\r\n                    groupText : [\'<b>{0} - {1}</b>\'],\r\n                    groupCollapse : true,\r\n                    groupOrder: [\'asc\']   		\r\n               	} ]]\r\n            })\r\n            .on(\'jqGridSelectRow\', function(e){\r\n                if (optsData.selStatus.ismain) {\r\n                    var nd = {showIsMainBtn: \'\'};\r\n                    var selRows = getGridSelRows(gr);\r\n                    if (selRows.length>0) {\r\n                        var row = gr.jqGrid(\'getRowData\', selRows[0]);\r\n                        if (row.is_main != \'1\') nd.showIsMainBtn = row[ optsData.selStatus.ismain ];\r\n                    }\r\n                    SCRM.link(optsData, nd);\r\n                }\r\n            })\r\n            .on(\'jqGridLoadComplete\', function(e){\r\n                $(this).jqGrid( optsData.selStatus.ismain? \'showCol\':\'hideCol\', [\'is_main\']);\r\n            })\r\n            .on(\'jqGridBeforeProcessing\', function(e, data, textStatus, jqXHR) {\r\n                var ismain_fld = optsData.selStatus.ismain;\r\n                $.each(data.rows, function(n, r) {\r\n                    r.is_main = (r.is_main == r[ismain_fld])? 1 : 0;\r\n                });\r\n            })\r\n            .on(\'jqGridAddEditInitializeForm\', function(e, form, oper) {\r\n                var tr = $(\'#tr_extended,#tr_info\', form);\r\n                $(\'td:eq(1)\', tr).attr(\'colspan\', 3); \r\n                $(\'td:gt(1)\', tr).remove();\r\n                if (oper==\'add\' && optsData.selStatus) {\r\n                    $.each(optsData.selStatus.default || {}, function(k, v) {\r\n                        $(\'#\'+k, form).val(v);\r\n                    });\r\n                }\r\n            })\r\n            .jqGridColumns();\r\n\r\n        });\r\n\r\n        $.observe(optsData, \'statusType\', function(e, data){\r\n            optsData.selStatus = (SCRM.getClubStatus(\'idStatus\', optsData.statusType)||{}).extended||{};\r\n            grids.idStatus.trigger(\'clearSelection\').trigger(\'reloadGrid\');\r\n            var nd = {\r\n                showArcStatus: optsData.selStatus.arc,\r\n                showIsMainBtn: \'\'\r\n            };\r\n            SCRM.link(optsData, nd);\r\n            if (nd.showArcStatus) {\r\n                var cfgArcStatusType = optsData.statusType+\'_arc\'\r\n                getConfigFields(cfgArcStatusType, function(fields, opts) {\r\n                    SCRM.link(optsData, {\r\n                        cfgArcStatus: opts[cfgArcStatusType]\r\n                    });\r\n                });\r\n            }\r\n        });\r\n        SCRM.link(optsData, {statusType: \'idIncome\'});\r\n    });\r\n});\r\n\r\n</script>\r\n\r\n<script id=\"tplIdConfig\" type=\"text/x-jsrender\">\r\n<div class=\"row\">\r\n    <div class=\"col-md-4 mb-3 mb-md-0\">\r\n        <div class=\"list-group\">\r\n        {^{for idConfig sort=\"menuindex\"}}\r\n        <a href=\"#\" class=\"list-group-item list-group-item-action list-group-item-primary prevent-default\"\r\n            data-link=\"{on ~idConfig}\">{{:name}}</a>\r\n        {{/for}}\r\n        </div>\r\n        <form class=\"input-group input-group-alt srch-group mt-3\" data-link=\"{on \'submit\' ~idConfigCustom}\">\r\n            <input type=\"text\" class=\"form-control\" data-link=\"cfgCustom\">\r\n            <div class=\"input-group-append\">\r\n                <button type=\"submit\" class=\"btn btn-secondary\"><i class=\"fa fa-edit\"></i></button>\r\n            </div>\r\n        </form>\r\n    </div>\r\n    <div class=\"col-md-8\" data-link=\"{if optsTmpl tmpl=optsTmpl}\">\r\n    </div>\r\n</div>\r\n</script>\r\n\r\n<script id=\"tpl_AceBox\" type=\"text/x-jsrender\">\r\n    <div class=\"card card-fluid ace-parent\">\r\n        <div class=\"card-header d-flex\">\r\n            <span class=\"cfgname\" data-link=\"key\"></span>\r\n            <span class=\"ml-auto mr-n1\">\r\n                <button class=\"btn btn-light btn-xs\" data-link=\"{on ~resizeEditor}\">\r\n                    <i class=\"fa fa-arrows-alt\"></i>\r\n                </button>\r\n            </span>\r\n        </div>\r\n        <div>\r\n        <textarea data-link=\"data-ace{:cls||\'\'} data-name{:key} {on \'saveAce\' ~saveConfig}\">{{>val||prop}}</textarea>\r\n        </div>\r\n        <div class=\"card-footer p-1 d-flex\">\r\n            <button class=\"btn btn-primary btn-xs\" data-link=\"disabled{:!edited} {on ~saveConfig}\">Сохранить</button>\r\n            <button class=\"btn btn-light btn-xs ml-2\" data-link=\"visible{:~root.sudo} {on ~root.save2git}\">.git</button>\r\n            \r\n            <button class=\"btn btn-light btn-xs ml-auto\" data-link=\"{on ~delConfig}\">\r\n                <i class=\"fa fa-trash\"></i>\r\n            </button>\r\n        </div>\r\n    </div>\r\n</script>\r\n\r\n<script id=\"tpl_optsHTML\" type=\"text/x-jsrender\">\r\n<div class=\"mb-2 d-flex\">\r\n    <select class=\"custom-select\" data-link=\"selHTML\">\r\n        {^{for cS.idHTML}}\r\n        <option value=\"{{:alias}}\">{{:name}}</option>\r\n        {{/for}}\r\n    </select>\r\n    <button class=\"btn btn-success ml-2\" data-link=\"{on addHTMLBlock}\"><i class=\"fa fa-plus\"></i></button>\r\n</div>\r\n{^{for optsHTMLEdit tmpl=\"#tpl_AceBox\" /}}\r\n</script>\r\n\r\n<script id=\"tpl_optsDefault\" type=\"text/x-jsrender\">\r\n{^{props optsFields tmpl=\"#tpl_AceBox\" /}}\r\n</script>\r\n\r\n<script id=\"tpl_optsPays\" type=\"text/x-jsrender\">\r\n{^{props payOpts tmpl=\"#tpl_AceBox\" /}}\r\n{^{props paym tmpl=\"#tpl_AceBox\" /}}\r\n</script>\r\n\r\n<script id=\"tpl_logoClub\" type=\"text/x-jsrender\">\r\n    <button type=\"button\" class=\"btn btn-subtle-primary btn-sm btn-block\"\r\n         data-link=\"{on ~S.uploadFile}\" accept=\"image/*\">\r\n    <i class=\"fa fa-picture-o\"></i> Загрузить логотип</button>\r\n    <img class=\"img-fluid mt-2\" src=\"\" alt=\"\" style=\"max-height:200px\"\r\n        data-link=\"src{:file1^logo||~S.emptyImg()}\">\r\n</script>\r\n\r\n<script id=\"tpl_optsMain\" type=\"text/x-jsrender\">\r\n    <div id=\"logoClub\" class=\"text-center mb-3\" data-linkfile=\"\" data-file1type=\"logo\"\r\n        data-link=\"{on \'logoClub\' ~S.linkFile \'#tpl_logoClub\'}\">\r\n    </div>\r\n\r\n    <h6>Заголовок</h6>\r\n    <p><a href=\"#\" data-name=\"site_name\" data-roinplace=\"CfgInpSave\" data-link=\"opts^site_name\" class=\"dashed\"></a></p>\r\n    <h6>Полное название</h6>\r\n    <p><a href=\"#\" data-name=\"site_fullname\" data-roinplace=\"CfgInpSave\" data-link=\"opts^site_fullname\" class=\"dashed\"></a></p>\r\n    <p class=\"custom-control custom-checkbox\">\r\n        <input type=\"checkbox\" class=\"custom-control-input\" id=\"https\" value=\"1\"\r\n            data-link=\"checked{:opts^https==\'1\'} {on \'change\' ~checkOpts \'https\'}\">\r\n        <label class=\"custom-control-label\" for=\"https\">https</label>\r\n    </p>\r\n    \r\n    [[-<h6>Email отправитель</h6>\r\n    <p><a href=\"#\" data-name=\"emailsender\" data-roinplace=\"CfgInpSave\" class=\"dashed\">[[-!++emailsender]]</a></p>]]\r\n    <h6>Email администрации</h6>\r\n    <p><a href=\"#\" data-name=\"emailtech\" data-roinplace=\"CfgInpSave\" data-link=\"opts^emailtech\" class=\"dashed\"></a></p>\r\n    <h6>Личный кабинет</h6>\r\n    <div class=\"custom-control custom-checkbox\">\r\n        <input type=\"checkbox\" class=\"custom-control-input\" id=\"autouser\" value=\"1\"\r\n            data-link=\"checked{:opts^autouser==\'1\'} {on \'change\' ~checkOpts \'autouser\'}\">\r\n        <label class=\"custom-control-label\" for=\"autouser\">Автосоздание (при внесении email)</label>\r\n    </div>\r\n</script>\r\n\r\n<script id=\"tpl_tmpl\" type=\"text/x-jsrender\">\r\n<div class=\"nav nav-pills mb-2\" role=\"tablist\">\r\n    <a class=\"nav-item nav-link active\" data-toggle=\"tab\" href=\"#tmpl_msg\">Сообщения</a>\r\n    <a class=\"nav-item nav-link\" data-toggle=\"tab\" href=\"#tmpl_file\">Документы</a>\r\n</div>\r\n<div class=\"tab-content\">\r\n    <div id=\"tmpl_msg\" class=\"tab-pane active\">\r\n\r\n<div class=\"row\" data-link=\"visible{:idTmpl}\">\r\n    <div class=\"col-md-4\">\r\n        <div class=\"list-group\">\r\n        {^{for idTmpl^rows}}\r\n        <a href=\"#\" class=\"list-group-item list-group-item-action list-group-item-primary prevent-default\"\r\n            data-link=\"{on ~editTmpl}\">{{:name}}</a>\r\n        {{/for}}\r\n        <a href=\"#\" class=\"list-group-item list-group-item-action list-group-item-success prevent-default\"\r\n            data-link=\"{on ~newTmpl}\">Создать</a>\r\n        </div>\r\n    </div>\r\n    <div class=\"col-md-8\" data-link=\"visible{:tmplEdit^oper}\">\r\n        <div class=\"card card-fluid mb-0\">\r\n            <div class=\"card-body\">\r\n                <div class=\"form-row\">\r\n                    <div class=\"col-sm-8\">\r\n                        <label>Name</label>\r\n                        <input class=\"form-control\" placeholder=\"name\" data-link=\"tmplEdit^name\">\r\n                    </div>\r\n                    <div class=\"col-sm-4\">\r\n                        <label>Type</label>\r\n                        <select class=\"form-control\" placeholder=\"type\" data-link=\"tmplEdit^type\">\r\n                            <option value=\"email\">Email</option>\r\n                            <option value=\"sms\">SMS</option>\r\n                            <option value=\"push\">Push</option>\r\n                            <option value=\"club\">Клуб</option>\r\n                        </select>\r\n                    </div>\r\n                </div>\r\n                <div class=\"form-group my-2\">\r\n                    <label>Handler</label>\r\n                    <input class=\"form-control\" placeholder=\"handler\" data-link=\"tmplEdit^handler\">\r\n                </div>\r\n                <div data-link=\"class{:tmplEdit^type==\'email\'? \'form-group\':\'d-none\'}\">\r\n                    <label>Subj</label>\r\n                    <input class=\"form-control\" placeholder=\"subj\" data-link=\"tmplEdit^subj\">\r\n                </div>\r\n            </div>\r\n            <textarea data-link=\"{on \'saveAce\' ~saveTmpl}\"></textarea>\r\n            <div class=\"card-footer p-1 d-flex\">\r\n                <button class=\"btn btn-primary btn-xs\" data-link=\"{on ~saveTmpl}\">Сохранить</button>\r\n                <button class=\"ml-auto btn btn-secondary btn-xs\" data-link=\"visible{:tmplEdit^id} {on ~delTmpl}\"><i class=\"fa fa-trash\"></i></button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n    </div>\r\n    <div id=\"tmpl_file\" class=\"tab-pane\">\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-6\">\r\n                <div class=\"list-group list-group-bordered list-group-reflow\">\r\n                    <div class=\"list-group-header\">Системные</div>\r\n                    {^{for idTmpl^systmpl}}\r\n                    <a href=\"[[++crm_url]]export/tmpl/{{:basename}}\" target=\"_blank\"\r\n                        class=\"list-group-item\">\r\n                        {{:filename}}\r\n                    </a>\r\n                    {{/for}}\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-6\" id=\"tmplFiles\" data-linkfile=\"\"\r\n                data-link=\"{on \'usertmpl\' ~S.linkFile \'#tpl_files\'}\">\r\n                \r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n</script>\r\n\r\n<script id=\"tpl_idSInvType_edit\" type=\"text/x-jsrender\">\r\n{^{for idSchedule}}\r\n    <div class=\"custom-control custom-checkbox\">\r\n        <input type=\"checkbox\" class=\"custom-control-input\" id=\"its_{{:id}}\" value=\"{{:alias}}\"\r\n            data-link=\"checked{:SInvType} {on \'change\' ~idSInvType}\">\r\n        <label class=\"custom-control-label\" for=\"its_{{:id}}\">\r\n            {{:name}}\r\n        </label>\r\n    </div>\r\n{{/for}}\r\n</script>\r\n\r\n<script id=\"tpl_stype_ed\" type=\"text/x-jsrender\">\r\n{^{for idSchedule itemVar=\"~sc\" ~lsn=cS.idLesson}}\r\n<tr>\r\n    <th>{{:name}}</th>\r\n    <td data-link=\"{checkboxgroup chLesson}\">\r\n    {{for ~lsn}}\r\n        <div class=\"custom-control custom-control-inline custom-checkbox\">\r\n            <input type=\"checkbox\" class=\"custom-control-input\"\r\n                id=\"cr_{{:~sc.id}}_{{:id}}\" value=\"{{:alias}}\">\r\n            <label class=\"custom-control-label\" for=\"cr_{{:~sc.id}}_{{:id}}\">\r\n                {{fmtStatus:alias tbl=\"idLesson\"}} {{:name}}\r\n            </label>\r\n        </div>\r\n    {{/for}}\r\n    </td>\r\n</tr>\r\n{{/for}}\r\n</script>\r\n\r\n<script id=\"statusTypes\" type=\"text/x-jsrender\">\r\n<div>\r\n    <select class=\"custom-select\" data-link=\"statusType\">\r\n        {{for idStatus}}\r\n        <option value=\"{{:alias}}\">{{:name}}</option>\r\n        {{/for}}\r\n    </select>\r\n</div>\r\n<button class=\"ml-2 btn btn-primary\" data-link=\"visible{:showIsMainBtn} {on \'click\' ~setIsMain}\">По умолчанию</button>\r\n</script>\r\n\r\n<script id=\"tpl_PayMethods\" type=\"text/x-jsrender\">\r\n<h6>Общие <button class=\"btn btn-light btn-xs\" data-link=\"{on ~addPayMethod \'0\' \'idCity_Pay\'}\"><i class=\"fa fa-plus\"></i></button></h6>\r\n{^{for ~PayMethods(idCity_Pay, \'0\') tmpl=\"#tpl_idCityPayRow\" /}}\r\n\r\n{^{if selCity}}\r\n    <h6 class=\"mt-2\">{^{:selCity^name}} <button class=\"btn btn-light btn-xs\" data-link=\"{on ~addPayMethod selCity^id \'idCity_Pay\'}\"><i class=\"fa fa-plus\"></i></button></h6>\r\n    {^{for ~PayMethods(idCity_Pay, selCity^id) tmpl=\"#tpl_idCityPayRow\" /}}\r\n{{/if}}\r\n</script>\r\n\r\n<script id=\"tpl_idCityPayRow\" type=\"text/x-jsrender\">\r\n    <p>\r\n        <a href=\"#\" class=\"prevent-default\" data-link=\"{:name} {on ~editPayMethod}\"></a>\r\n    </p>\r\n    [[-<div class=\"d-flex\" data-link=\"data-parent{:parent} data-id{:id}\">\r\n        <div><a href=\"#\" data-link=\"{:name||\'Name\'}\" data-roinplace=\"PayMethodName\" class=\"dashed\"></a></div>\r\n        <div class=\"ml-2\">\r\n            <button class=\"btn btn-subtle-primary btn-xs mr-1\" data-link=\"{on ~editPayMethod}\"><i class=\"fa fa-gear\"></i></button>\r\n            <button class=\"btn btn-subtle-primary btn-xs\"><i class=\"fa fa-ban\"></i></button>\r\n        </div>\r\n    </div>]]\r\n</script>\r\n\r\n<script id=\"tpl_editPayMethod\" type=\"text/x-jsrender\">\r\n    <div class=\"form-group\">\r\n        <input type=\"text\" class=\"form-control\" data-link=\"post^name\">\r\n    </div>\r\n    \r\n    <div class=\"form-group\">\r\n        <input type=\"text\" class=\"form-control\" data-link=\"post^menuindex\">\r\n    </div>\r\n    [[-<div class=\"form-group\">\r\n        <div class=\"input-group\">\r\n            <label class=\"input-group-prepend\" for=\"ni_sum\"><span class=\"input-group-text\"><i class=\"fa fa-money\"></i></span></label>\r\n            <input type=\"text\" class=\"form-control clubmodal-focus\" id=\"ni_sum\" placeholder=\"0.00\" data-link=\"post^sum\">\r\n        </div>\r\n        <label data-link=\"visible{:post^typeinvoice}\">\r\n            <input type=\"checkbox\" data-link=\"payd\"> Оплачено\r\n        </label>\r\n    </div>]]\r\n\r\n    <div class=\"form-group\">\r\n        <textarea rows=\"2\" class=\"form-control\" data-link=\"post^info\" placeholder=\"Шаблон\"></textarea>\r\n    </div>\r\n\r\n    <textarea id=\"configPayMethod\"></textarea>\r\n    \r\n    [[-<div class=\"d-flex\" data-link=\"data-parent{:parent} data-id{:id}\">\r\n        <div><a href=\"#\" data-link=\"{:name||\'Name\'}\" data-roinplace=\"PayMethodName\" class=\"dashed\"></a></div>\r\n        <div class=\"ml-2\">\r\n            <button class=\"btn btn-subtle-primary btn-xs mr-1\" data-link=\"{on ~editPayMethod}\"><i class=\"fa fa-gear\"></i></button>\r\n            <button class=\"btn btn-subtle-primary btn-xs\"><i class=\"fa fa-ban\"></i></button>\r\n        </div>\r\n    </div>]]\r\n</script>\r\n\r\n[[$tplFiles]]\r\n', 0, 2, 0, 0, 1, 1, 1649509351, 1, 1649573643, 0, 0, 0, 1649515680, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'adm/opts.html', 0, 0, 1, NULL),
(3, 'document', 'text/html', 'Дашборд', '', '', 'dashboard', 1, '', 1, 0, 0, 0, 0, '', '<style>\r\nheader.page-navs{display:none;}    \r\n</style>\r\n<iframe src=\"https://docs.google.com/spreadsheets/d/e/2PACX-1vQcA6Qb9e3DUc5zNHG082L2NUINCZYlQzi_keaiqlaHduIIb-AQAexI0Tq_5wbVP2ObE7gf1Kw-xOCr/pubhtml?gid=1446048072&amp;single=true&amp;widget=true&amp;headers=false\"\r\nwidth=\"100%\" height=\"700\" border=\"0\" frameBorder=\"0\"></iframe>', 0, 2, 1, 0, 1, 1, 1649518897, 1, 1649519968, 0, 0, 0, 1649518860, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'dashboard.html', 0, 0, 1, NULL);
INSERT INTO `mx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `alias_visible`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`) VALUES
(4, 'document', 'text/html', 'Реестр', '', '', 'reestr', 1, '', 1, 0, 0, 0, 0, '', '<div class=\"section-block my-0\">\r\n    <table id=\"grid_idIncome\" data-entity=\"idIncome\"></table>\r\n</div>\r\n\r\n[[$tplFiles]]\r\n\r\n<script>\r\nvar trainerData = { };\r\n\r\nSCRM.loadWSS([\'ready\',\'grid\'], function () {\r\n\r\n    $(\"#grid_idIncome\")\r\n    .one(\'jqGridBeforeInit\', function(e, grOpts){\r\n        \r\n    })\r\n    .jqGridInit({\r\n        sortname: \'name\', sortorder: \'asc\',\r\n        search: true,\r\n        postData: {\r\n            //filters: SCRM.obj2Filter({published: \'1\'})\r\n        },\r\n        colModel:[\r\n            {template: idFieldTemplate},\r\n            {index: \'created\', label: \'Создан\',\r\n                template:createdTemplate, hidden: false\r\n            },\r\n            {name:\'num\', label: \'Рег. номер\', hidden: false, width: 50},\r\n            {name:\'status\', label: \'Статус\', editable: true, template: selTemplate,\r\n                width: 100,\r\n                clubStatus: \'idIncome\', lookupKey: \'id\'\r\n            },\r\n            {name:\'name\', label:\'Ф.И.О.\', width:200, editable: true, editrules:{required:true}},\r\n            /*{name:\'gender\', label: \'Пол\', width:40, hidden: false, editable: true,\r\n                editoptions: {\r\n                    defaultValue: \'[[!clubConfig?name=`Gender_main`]]\'\r\n                },\r\n                formoptions:{rowpos:1, colpos:2},\r\n                template: selTemplate,\r\n                clubStatus: \'Gender\', lookupKey: \'alias\'\r\n            },\r\n            {name:\'birth\', label: \'Дата рождения\', editable: true,\r\n                template: dateTemplate,\r\n                fltrFunc: true // TODO: Что это?\r\n            },*/              \r\n            {template: telTemplate, editable: true},\r\n            {name: \'email\', label: \'E-mail\', width:100, editable: true, editrules: {email: true, required: false}}, \r\n            {name: \'info\', label: \'Текст обращения\', width: 500,\r\n                editable: true, editrules: {edithidden:true},\r\n                template: infoTemplate\r\n            },\r\n            /*\r\n            {name: \'categ\', label: \'Категория\', editable: true,\r\n                template: selTemplate,\r\n                clubStatus: \'TrainerCategory\', lookupKey: \'name\',\r\n                dbvalues0: \'-\'\r\n            },\r\n            {name:\'referee\', label: \'Судья\', editable: true,\r\n                template: selTemplate,\r\n                clubStatus: \'TrainerRank\', lookupKey: \'name\',\r\n                dbvalues0: \'-\'\r\n            },*/\r\n            [[-{name:\'sport\', label: \'Дисциплина\', editable: true, template: selTemplate,\r\n                editoptions: {value: makeGridOpts(club_opts.idSport)},\r\n                searchoptions: {value: makeGridOpts(club_opts.idSport, true)}\r\n            },]]\r\n        ],\r\n        rowattr: function(data) {\r\n            /*if (data.published != \'1\'){\r\n                return {\'class\': \'rowArc\'};\r\n            }*/\r\n        },\r\n        onSelectRow: function(rid,rr,ee) {\r\n            var rdata = grids.idTrainer.jqGrid(\'getRowData\', rid);\r\n            SCRM.link(formData, {\r\n                id: rid,\r\n                name: rdata.name,\r\n                rdata: rdata\r\n            });\r\n        },\r\n        navOpts: {add: false, edit:true, del:false}\r\n    })\r\n    .jqGrid(\'filterToolbar\')\r\n    .jqGridColumns()\r\n    .jqGridExport();\r\n\r\n});\r\n</script>\r\n\r\n<script id=\"tpl_trainers\" type=\"text/x-jsrender\">\r\n    <select class=\"custom-select\" data-link=\"{:trainer:} class{merge:bad_trainer toggle=\'is-invalid\'}\">\r\n    <option value=\"\"></option>\r\n    {^{for idTrainer}}\r\n        <option value=\"{{:id}}\">{{:name}}</option>\r\n    {{/for}}\r\n    </select>\r\n    <fieldset disabled1=\"disabled\" class=\"form-group mt-2\">\r\n        <div class=\"custom-control custom-control-inline custom-radio\">\r\n            <input type=\"radio\" class=\"custom-control-input\" name=\"change_type\" id=\"ct_repeat\"\r\n                value=\"repeat\" data-link=\"change_mode\">\r\n            <label class=\"custom-control-label\" for=\"ct_repeat\">Постоянно</label>\r\n        </div>\r\n        <div class=\"custom-control custom-control-inline custom-radio\">\r\n            <input type=\"radio\" class=\"custom-control-input\" name=\"change_type\" id=\"ct_once\"\r\n                value=\"once\" data-link=\"change_mode\">\r\n            <label class=\"custom-control-label\" for=\"ct_once\">Временно</label>\r\n        </div>\r\n    </fieldset>\r\n</script>\r\n\r\n<script id=\"tpl_schEditor\" type=\"text/x-jsrender\">\r\n<div class=\"mb-2 d-flex\">\r\n    <button class=\"btn btn-success btn-sm\" data-link=\"{on \'click\' schEditorAdd}\"><i class=\"fa fa-plus\"></i></button>\r\n    <div class=\"dropdown mx-1\">\r\n        <button data-toggle=\"dropdown\" class=\"btn btn-primary btn-sm d-flex flex-nowrap align-items-center\" data-link=\"disabled{:selRows^length==0}\"\r\n            disabled=\"disabled\">Действия\r\n            <small data-link=\"text{:selRows^length} visible{:selRows^length>0}\" class=\"badge badge-pill badge-warning ml-1\"></small>\r\n        </button>\r\n        <div class=\"dropdown-menu\">\r\n            <div class=\"dropdown-arrow\"></div>\r\n            <a href=\"#\" class=\"dropdown-item\" data-link=\"{on ~changeTrainer}\">Сменить тренера</a>\r\n            <div class=\"dropdown-divider\"></div>\r\n            <a href=\"#\" class=\"dropdown-item\" data-link=\"{on ~deleteSch}\">Удалить</a>\r\n        </div>\r\n    </div>\r\n    <button class=\"btn btn-secondary btn-sm\" data-link=\"{on ~showFilter}\"><i class=\"fa fa-filter\"></i></button>\r\n</div>\r\n<div id=\"schEditorFltr\" data-link=\"visible{:showFilter}\"></div>\r\n</script>\r\n\r\n<script id=\"tpl_trainerCabinet\" type=\"text/x-jsrender\">\r\n    <div class=\"d-flex justify-content-between align-items-center\">\r\n        <a href=\"#\" target=\"_blank\" data-link=\"href{:\'/trainer/lessons.html?trainer=\'+uid}\">\r\n            <i class=\"fa fa-sign-in\"></i>\r\n            <span data-link=\"html{:username || \'Кабинет\'}\"></span>\r\n        </a>\r\n        <div class=\"card-title-control\">\r\n            {^{if !iduser}}\r\n            <button class=\"btn btn-icon btn-light\" data-link=\"{on ~idUser}\"><i class=\"fa fa-key\"></i></button>\r\n            {{else}}\r\n            <div class=\"dropdown\">\r\n                <button class=\"btn btn-icon btn-subtle-success\" data-toggle=\"dropdown\"><i class=\"fa fa-key\"></i></button>\r\n                <div class=\"dropdown-menu dropdown-menu-right\">\r\n                    <div class=\"dropdown-arrow\"></div>\r\n                    <a href=\"#\" class=\"dropdown-item\"\r\n                        data-run=\"/chunk/forgotpassword\" data-link=\"data-username{:username}\">Восстановление пароля</a>\r\n                    <div class=\"dropdown-divider\"></div>\r\n                    <a href=\"#\" class=\"dropdown-item\"\r\n                        data-link=\"{on ~idUser}\">Отключить</a>\r\n                </div>\r\n            </div>\r\n            {{/if}}\r\n            [[-<label class=\"switcher-control\">\r\n                <input type=\"checkbox\" class=\"switcher-input\" data-link=\"checked{:sp^iduser} {on \'change\' ~idUser}\">\r\n                <span class=\"switcher-indicator\"></span>\r\n            </label>]]\r\n        </div>\r\n    </div>\r\n</script>\r\n\r\n[[-var confirm_schdel = true;\r\n    $(document).on(\'change\', \'#confirm_schdel\', function(){\r\n        confirm_schdel = !$(this).prop(\'checked\');\r\n    });]]\r\n    \r\n[[-<select id=\"h_start\" class=\"form-control sel-hour\"></select>\r\n<select id=\"m_start\" class=\"form-control sel-minute\"></select>]]\r\n\r\n[[-<input id=\"duration\" class=\"form-control\" size=\"3\" value=\"45\"> минут\r\n<select id=\"h_end\" class=\"form-control sel-hour\"></select>\r\n<select id=\"m_end\" class=\"form-control sel-minute\"></select>]]\r\n\r\n[[-for (var t = 0; t <= 23; t++){\r\n    var lzt = leadZero(t);\r\n    $(\'.sel-hour\').append(\'<option value=\"\'+ lzt +\':\">\'+ lzt +\':</option>\');\r\n}\r\nfor (var t = 0; t <= 55; t += 5){\r\n    var lzt = leadZero(t);\r\n    $(\'.sel-minute\').append(\'<option value=\"\'+ lzt +\':00\">\'+ lzt +\'</option>\');\r\n}]]', 0, 2, 3, 0, 1, 1, 1649518927, 1, 1649584545, 0, 0, 0, 1649518920, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'reestr.html', 0, 0, 1, NULL),
(5, 'document', 'text/html', 'Администрирование', '', '', 'adm', 1, '', 1, 0, 0, 0, 1, '', '/', 0, 0, 4, 0, 1, 1, 1649518971, 1, 1649519384, 0, 0, 0, 1649518920, 1, '', 0, 0, 0, 0, 0, 'modWebLink', 'web', 1, 'adm/', 0, 0, 1, '{\"core\":{\"responseCode\":\"HTTP\\/1.1 301 Moved Permanently\"}}'),
(6, 'document', 'text/html', 'Пользователи', '', '', 'users', 1, '', 1, 0, 0, 5, 0, '', '', 0, 2, 1, 0, 1, 1, 1649519004, 1, 1649519428, 0, 0, 0, 1649518980, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'adm/users.html', 0, 0, 1, NULL),
(7, 'document', 'text/html', 'Вход в систему', '', '', 'login', 1, '', 1, 0, 0, 0, 1, '', '/', 0, 0, 4, 0, 1, 1, 1649519300, 1, 1649519557, 0, 0, 0, 1649519460, 1, '', 0, 0, 0, 0, 1, 'modWebLink', 'web', 1, 'login/', 0, 0, 1, NULL),
(8, 'document', 'text/html', 'Восстановление пароля', '', '', 'forgotpassword', 1, '', 1, 0, 0, 7, 0, '', '<div class=\"section-block my-0\" id=\"clReAc\">\r\n    [[-!resetForgot]]\r\n    \r\n    <form action=\"\" method=\"post\" role=\"form\" data-link=\"{on \'submit\' ~resetPassword} visible{:!token}\">\r\n        <p>Для восстановления пароля, нам нужен Ваш адрес электронной почты, указанный при регистрации.</p>\r\n        <input type=\"hidden\" name=\"action\" value=\"[[-+loginfp.request_uri]]\" />\r\n        <input type=\"hidden\" name=\"returnUrl\" value=\"[[-+loginfp.request_uri]]\" />\r\n        <input type=\"hidden\" name=\"login_fp_service\" value=\"forgotpassword\" />\r\n        <div class=\"form-row\">\r\n            <div class=\"col-12 col-sm-auto\">\r\n                [[-<input type=\"email\" name=\"email\" value=\"[[+loginfp.post.email:default=`[[!#GET.email]]`]]\" \r\n                    placeholder=\"Ваш e-mail\" class=\"form-control mb-2\" />]]\r\n                <input type=\"email\" name=\"email\" placeholder=\"Ваш e-mail\" class=\"form-control mb-2\"\r\n                    data-link=\"sd^email\" />\r\n            </div>\r\n            <div class=\"col-auto\">\r\n                <button class=\"btn btn-primary\" type=\"submit\"\r\n                    data-link=\"disabled{:!sd^email||loading}\">\r\n                    Сбросить пароль\r\n                    <span class=\"spinner-border spinner-border-sm\" role=\"status\" data-link=\"visible{:loading}\"></span>\r\n                </button>\r\n            </div>\r\n        </div>\r\n        <div class=\"alert alert-success mt-2 mb-0\" role=\"alert\" style=\"display:none\"\r\n            data-link=\"visible{:sd^ok&&!sd^email}\">\r\n            Если пользователь с данным E-mail существует, вы получите на него ссылку для восстановления доступа.\r\n        </div>\r\n    </form>\r\n    <div class=\"alert alert-warning mt-2 mb-0\" role=\"alert\" style=\"display:none\"\r\n        data-link=\"visible{:token}\">Возможно, токен просрочен, попробуйте заполнить форму восстановления доступа заново.\r\n        <a href=\"[[~[[*id]]]]\">Обновить страницу</a></div>\r\n</div>\r\n\r\n<script>\r\n$(function(){\r\n    var clReAc = [[!clubRecoverAccess]];\r\n    //console.log(SCRM);\r\n    $.link(true, \'#clReAc\', clReAc, {\r\n        resetPassword: function(e, data) {\r\n            e.preventDefault();\r\n            var d = data.linkCtx.data;\r\n            d.sd.recoveraccess = true;\r\n\r\n            $.observable(d).setProperty(\'loading\', true);\r\n            $.post(window.location, d.sd, function(data){\r\n                $.observable(d).setProperty({\r\n                    sd: {ok: data},\r\n                    loading: false\r\n                });\r\n            })\r\n            .fail(failXHR);\r\n        }\r\n    });\r\n});\r\n</script>', 0, 2, 0, 0, 1, 1, 1649519543, 1, 1649570947, 0, 0, 0, 1649519520, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'login/forgotpassword.html', 0, 0, 1, NULL),
(9, 'document', 'text/html', 'Утилиты', '', '', 'util', 1, '', 1, 0, 0, 5, 0, '', '<!-- Использует /hook/logs.viewer -->\r\n<div class=\"ml-auto\" id=\"deletePanel\">\r\n    <div class=\"dropdown d-inline-block\">\r\n        <button type=\"button\" class=\"btn btn-light btn-icon\" data-toggle=\"dropdown\" data-display=\"static\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n            <i class=\"fa fa-trash-o\"></i>\r\n        </button> \r\n        <div class=\"dropdown-menu dropdown-menu-right\">\r\n            <div class=\"dropdown-arrow\"></div>\r\n            <a href=\"#\" class=\"dropdown-item\" data-period=\"1\" data-all=\"false\" data-link=\"{on deleteLogs}\">1 мес (только эта)</a>\r\n            <a href=\"#\" class=\"dropdown-item\" data-period=\"3\" data-all=\"false\" data-link=\"{on deleteLogs}\">3 мес (только эта)</a>\r\n            <hr>\r\n            <a href=\"#\" class=\"dropdown-item\" data-period=\"1\" data-all=\"true\" data-link=\"{on deleteLogs}\">1 мес (все)</a>\r\n            <a href=\"#\" class=\"dropdown-item\" data-period=\"3\" data-all=\"true\" data-link=\"{on deleteLogs}\">3 мес (все)</a>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<div class=\"tab-content section-block my-0\" id=\"logCard\">\r\n    <div id=\"tab_idLog\" class=\"tab-pane active\">\r\n    	<div class=\"mb-3\">\r\n    	   <table id=\"grid_params\"></table>\r\n    	</div>\r\n    	<pre class=\"mb-3\" data-link=\"visible{:code}\">\r\n            <code class=\"language-json Tomorrow\" data-link=\"text{:code}\"></code>\r\n        </pre>\r\n    </div>\r\n    <div id=\"tab_idExtid\" class=\"tab-pane\">\r\n        <table id=\"grExtid\" data-entity=\"idExtid\"></table>\r\n    </div>\r\n</div>\r\n\r\n<script>\r\n$(\"header\").append( $(\"#deletePanel\") );\r\n\r\nSCRM.link(SCRM.app, {\r\n    topNavTabs: [\r\n        {href: \'#tab_idLog\', html: \'.log\', active: true},\r\n        {href: \'#tab_idExtid\', html: \'idExtid\'}\r\n    ]\r\n});\r\n\r\nSCRM.wssRes[\'highlight\'] = [\r\n    \'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.4.0/styles/github.min.css\',\r\n    \'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.4.0/highlight.min.js\'\r\n];\r\n\r\nload_wss([\'grid\'], function(){\r\n    pJSON(\'/hook/logs.viewer\', function(data) {\r\n        app\r\n        .gr_logs = $(\"#grid_params\").jqGridInit({\r\n            sortname: \'key\', sortorder: \'desc\',\r\n            datatype: \'local\',\r\n            data: data.files,\r\n            autowidth: true,\r\n            multiSort: true,\r\n            sortname: \'date desc, name desc\',\r\n            //sortname: \'date\', sortorder: \'desc\',\r\n            colModel: [\r\n                {\r\n                    name:\'date\',\r\n                    label:\"Дата\",\r\n                    editable: false,\r\n                    template: selTemplate,\r\n                    searchoptions: {\r\n                        value: makeGridOpts(data.dates, {add_all: true}),\r\n                    }\r\n                },\r\n                {\r\n                    name:\'type\',\r\n                    label:\"Тип\",\r\n                    editable: false,\r\n                    template: selTemplate,\r\n                    searchoptions: {\r\n                        value: makeGridOpts(data.types, {add_all: true}),\r\n                    }\r\n                },\r\n                {\r\n                    name:\'name\',\r\n                    label:\"Имя файла\",\r\n                    editable: false\r\n                }\r\n            ],\r\n            searching: {\r\n    			loadFilterDefaults: true,\r\n    			multipleSearch: true,\r\n    			closeOnEscape: true,\r\n    			searchOperators: true,\r\n    			searchOnEnter: true\r\n    		},\r\n            navOpts: {add: false, edit: false, del: false},\r\n            onSelectRow: function(rid,rr,ee){\r\n                var rowData = $(this).jqGrid(\'getRowData\', rid);\r\n                $.post(\"/hook/logs.viewer\", rowData, function(data) {\r\n                    SCRM.loadWSS(\'highlight\', function(e){\r\n                        SCRM.link(app, {code: data});\r\n                        hljs.highlightAll();\r\n                    });\r\n                });\r\n            },\r\n        })\r\n        .jqGrid(\'filterToolbar\');\r\n    });\r\n    \r\n    var app = {\r\n        deleteLogs: function(e,d){\r\n            e.preventDefault();\r\n            pJSON(\'/hook/logs.viewer\', {\r\n                all: e.target.dataset.all,\r\n                period: e.target.dataset.period\r\n            }, function(data){\r\n                app.gr_logs\r\n                .jqGrid(\'clearGridData\')\r\n                .jqGrid(\'setGridParam\', {\r\n                    data: data.files\r\n                })\r\n                .trigger(\'reloadGrid\', [{ page: 1}]);\r\n            });\r\n        }\r\n    };\r\n    $(\'#logCard,#deletePanel\').link(true, app);\r\n\r\n    $(document)\r\n    .one(\'shown.bs.tab\', \'a[href=\"#tab_idExtid\"]\', function (e) {\r\n        $(\'#grExtid\')\r\n        .jqGridInit({\r\n            sortname: \'created\', sortorder: \'desc\',\r\n            colModel:[\r\n                {name:\'id\', hidden: true, template: idFieldTemplate},\r\n                {name:\'name\', index: \'wExtype.name\',\r\n                    template: editRowLinkTemplate\r\n                },\r\n                {name:\'cls\', index:\'wExtype.cls\', width:100},\r\n                {name:\'parent\', width:100, editable: true, template:numberTemplate},\r\n                {name:\'extid\', editable: true, template:numberTemplate},\r\n                {name:\'extoken\', editable: true},\r\n                {name:\'duedate\', editable: true, template: dateTimeTemplate},\r\n                {name:\'extended\', label: \'extended\', editable: true, template: infoTemplate},\r\n                {name:\'created\', hidden: false, label:\'Создано\', template: createdTemplate}\r\n            ],\r\n            navOpts: {add:false, edit:true, search:false}\r\n        })\r\n        .jqGrid(\'filterToolbar\')\r\n        .jqGridColumns();\r\n    })\r\n});\r\n</script>\r\n', 0, 2, 2, 0, 1, 1, 1649529414, 1, 1649529456, 0, 0, 0, 1649529456, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'adm/util.html', 0, 0, 1, NULL),
(10, 'document', 'text/html', 'Импорт', '', '', 'import', 1, '', 1, 0, 0, 5, 0, '', '<div class=\"card\" id=\"importData\">\r\n    <nav class=\"nav-scroller card-header\">\r\n        <div class=\"nav nav-tabs card-header-tabs\" role=\"tablist\">\r\n            <a class=\"nav-item nav-link active\" data-toggle=\"tab\" href=\"#tdata\">Данные</a>\r\n            <a class=\"nav-item nav-link\" data-toggle=\"tab\" href=\"#timport\" data-link=\"visible{:rows}\" style=\"display:none\">Импорт</a>\r\n        </div>\r\n    </nav>\r\n\r\n    <div class=\"tab-content\">\r\n        <div id=\"tdata\" class=\"tab-pane card-body active\">\r\n            <div class=\"form-group\">\r\n                <textarea name=\"text\" id=\"text\" class=\"form-control\" rows=\"12\" data-link=\"imText\"></textarea>\r\n                <small class=\"form-text text-muted\">Скопируйте из excel, word или аналогичных редакторов и вставьте данные в это поле. Каждая запись на отдельной строке, разделители - \r\n                    <span class=\"badge badge-secondary\">Tab</span>\r\n                </small>\r\n            </div>\r\n            <div class=\"form-group d-none\">\r\n                <label for=\"att\">Приложить файл (В разработке)</label>\r\n                <div class=\"custom-file\">\r\n                    <input type=\"file\" class=\"custom-file-input\" id=\"att\" name=\"att\" disabled>\r\n                    <label class=\"custom-file-label\" for=\"tf3\">Выбрать</label>\r\n                </div>\r\n            </div>\r\n            <div class=\"form-group\" data-link=\"{include ~link=imTable ~rows=imTables tmpl=\'#tpl_Select\'}\"></div>\r\n            <button type=\"button\" class=\"btn btn-primary btn-sm\" data-link=\"disabled{:!imText} {on ~prepareImport}\">Далее &raquo;</button>\r\n        </div>\r\n        <div id=\"timport\" class=\"tab-pane\">\r\n            <div class=\"alert alert-success border-0 d-flex\" id=\"importOpts\" data-link=\"{include tmpl=\'#tpl_addFiels\'}\">\r\n            </div>\r\n            <div class=\"table-responsive\">\r\n                <table class=\"table table-hover table-sm\" data-link=\"{if cols tmpl=\'#tpl_iTable\'}\"></table>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<script id=\"tpl_addFiels\" type=\"text/x-jsrender\">\r\n{^{props addF itemVar=\"~tbl\" ~dbv=dbValues ~addF=addF}}\r\n    <select class=\"custom-select custom-select-sm mr-2\"\r\n        data-link=\"id{:\'sel_\'+key} {:prop.value:} visible{:prop^visible}\">\r\n        <option value=\"\">-- {{:prop.name}} --</option>\r\n        {^{for ~dbv[key] tmpl=\"#tpl_selectOption\" /}}\r\n    </select>\r\n{{/props}}\r\n<button type=\"button\" class=\"btn btn-primary btn-sm\" data-link=\"{on ~goImport}\">Импорт</button>\r\n</script>\r\n\r\n<script id=\"tpl_iTable\" type=\"text/x-jsrender\">\r\n    <thead>\r\n        <tr>\r\n        {^{for cols ~flds=tableFields}}\r\n        <td>\r\n            <select data-link=\"value\">\r\n                <option value=\"\">-</option>\r\n                {^{for ~flds}}\r\n                <option value=\"{{:id}}\">{{:name}}</option>\r\n                {{/for}}\r\n            </select>\r\n        </td>\r\n        {{/for}}\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n    {^{for rows itemVar=\'~r\' ~cols=cols}}\r\n        <tr>\r\n        {^{for ~cols}}\r\n        <td>{{:~r[#index]}}</td>\r\n        {{/for}}\r\n        </tr>\r\n    {{/for}}\r\n    </tbody>\r\n</script>\r\n\r\n<script id=\"tpl_optTrainer\" type=\"text/x-jsrender\">\r\n    <select data-field=\"trainer\" class=\"custom-select custom-select-sm\">\r\n        <option value=\"\">-- Тренер --</option>\r\n        {^{for dbValues^idTrainer}}\r\n            <option value=\"{{:id}}\">{{:name}}</option>\r\n        {{/for}}\r\n    </select>\r\n</script>\r\n\r\n<script>\r\nvar imData = {\r\n    fields: {\r\n        gender: \'Пол\',\r\n        name: \'Ф.И.О.\',\r\n        birth: \'Дата рождения\',\r\n        contract: \'Договор\',\r\n        doc: \'Документ\',\r\n        email: \'E-mail\',\r\n        tel: \'Телефон\',\r\n        contract: \'Договор\',\r\n        contact: \'Контакт (ФИО)\',\r\n        price: \'Тариф\',\r\n        info: \'Заметки\',\r\n        id: \'xx\',\r\n        key: \'xx\',\r\n        status: \'xx\',\r\n        author: \'xx\',\r\n        iduser: \'xx\',\r\n        saldo: \'xx\',\r\n        sportsmen: \'xx\',\r\n        city: \'xx\',\r\n        published: \'xx\',\r\n        uid: \'xx\'\r\n    },\r\n    tableFields: [ ],\r\n    cols: [ ],\r\n    imTable : \'idIncome\',\r\n    imTables : [\r\n        {id: \'idIncome\', name: \'Заявки\'},\r\n        //{id: \'idClub\', name: \'Зал\'}\r\n    ],\r\n    addFields: {\r\n        idSportsmen: [\'idTrainer\',\'idSquad\'],\r\n        idLead: [\'idTrainer\',\'idSquad\',\'idClub\',\'idSport\'],\r\n        idTrainer: [\'idSport\']\r\n    },\r\n    addF: {\r\n        idTrainer: {name: \'Тренер\', field: \'trainer\'},\r\n        idSquad: {name: \'Группа\', field: \'squad\'},\r\n        idClub: {name: \'Зал\', field: \'club\'},\r\n        idSport: {name: \'Дисциплина\', field: \'sport\'}\r\n    }\r\n};\r\n\r\n$(function(){\r\n    $.link(true, \'#importData\', imData, {\r\n        prepareImport: function(){\r\n            $(\'a[href=\"#timport\"]\').tab(\'show\');\r\n            var nd = {\r\n                rows: $.map(imData.imText.split(\'\\n\'), function(r, i){\r\n                    return [ r.split(\'\\t\') ];\r\n                })\r\n            };\r\n            $.each(imData.addF, function(k, v){\r\n                nd[\'addF.\'+k+\'.visible\'] = $.inArray(k, imData.addFields[imData.imTable]) != -1;\r\n            });\r\n            SCRM.link(imData, nd);\r\n\r\n            pDATA(imData.imTable, {_where: {id: \'xx\'}}, function(data){\r\n                var tableFields = $.map(data.fields, function(v, key){\r\n                    var fname = imData.fields[key] || key;\r\n                    if (fname==\'xx\') return null;\r\n                    return {id: key, name: fname};\r\n                });\r\n                SCRM.link(imData, {\r\n                    tableFields: tableFields,\r\n                    cols: $.map(nd.rows[0], function(v, i) {\r\n                        return {value: (imData.cols[i])? imData.cols[i].value : \'\'};\r\n                    })\r\n                });\r\n                if (!imData.dbValues) pJSON(dbvaluesUrl, {mode:\'idTrainer,idClub,idSport\', city:\'my\', lesdata:1}, function(data){\r\n                    data.idSquad = [];\r\n                    SCRM.link(imData, {dbValues: data});\r\n                    SCRM._run(\'/chunk/squadlist\', {\r\n                        idSquad0: \'-- Группа --\',\r\n                        callback: function(html){\r\n                            $(\'#sel_idSquad\').html(html);\r\n                        }\r\n                    });\r\n                });\r\n            });\r\n        },\r\n        goImport: function(){\r\n            var ifields = { };\r\n            $.each(imData.cols, function(i, v){\r\n                if (v.value) key2obj(ifields, v.value).push(i);\r\n            });\r\n            if ($.isEmptyObject(ifields)) {\r\n                SCRM.alert(\'Не выбраны поля для импорта\');\r\n                return false;\r\n            }\r\n\r\n            var addData = {\r\n                oper: \'add\'\r\n            };\r\n            $.each(imData.addF, function(k, v){\r\n                if (v.visible && v.value) addData[ v.field ] = v.value;\r\n            });\r\n            function doImport() {\r\n                if (imData.rows.length == 0) return false;\r\n    \r\n                var row = imData.rows[0];\r\n                var iData = {};\r\n                $.each(ifields, function(k, v){\r\n                    iData[k] = $.map(v, function(idx, n) {\r\n                        return $.trim(row[idx]);\r\n                    }).join(\' \');\r\n                    if (k==\'birth\' && iData[k].length <= 4 ) iData[k] += \'-01-01\';\r\n                });\r\n                //console.log($.extend(iData, addData))\r\n                pEDIT(imData.imTable, $.extend(iData, addData), function(d){\r\n                    $.observable(imData.rows).remove(0);\r\n                    doImport();\r\n                });\r\n            }\r\n            doImport();\r\n        }\r\n    });\r\n});\r\n</script>', 0, 2, 3, 0, 1, 1, 1649570388, 1, 1649584145, 0, 0, 0, 1649571660, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'adm/import.html', 0, 0, 1, NULL),
(11, 'document', 'text/html', 'Пользовательское Соглашение', '', '', 'agreement', 1, '', 1, 0, 0, 7, 0, '', 'Настоящее Пользовательское Соглашение (Далее Соглашение) регулирует отношения между ООО Уроборос (далее Уроборос или Администрация) с одной стороны и пользователем сайта с другой.<br>Сайт Уроборос не является средством массовой информации.<br><br>Используя сайт, Вы соглашаетесь с условиями данного соглашения.<br><b>Если Вы не согласны с условиями данного соглашения, не используйте сайт Уроборос!</b><br><br><h3>Предмет соглашения</h3><b>Администрация предоставляет пользователю право на размещение на сайте следующей информации:</b><br><br><h3>Предмет соглашения</h3><b>Администрация предоставляет пользователю право на размещение на сайте следующей информации:</b><br>- Текстовой информации<br>- Фотоматериалов<br><br><h3>Права и обязанности сторон</h3><b>Пользователь имеет право:</b><br>- осуществлять поиск информации на сайте<br>- получать информацию на сайте<br>- копировать информацию на другие сайты с указанием источника<br>- требовать от администрации скрытия любой информации переданной пользователем сайту<br>- использовать информацию сайта в личных некоммерческих целях<br><br><b>Администрация имеет право:</b><br>- создавать, изменять, удалять информацию<br><br><b>Пользователь обязуется:</b><br>- обеспечить достоверность предоставляемой информации<br>- не распространять информацию, которая направлена на пропаганду войны, разжигание национальной, расовой или религиозной ненависти и вражды, а также иной информации, за распространение которой предусмотрена уголовная или административная ответственность<br>- не нарушать работоспособность сайта<br>- не совершать действия, направленные на введение других Пользователей в заблуждение<br>- не регистрировать учетную запись от имени или вместо другого лица за исключением случаев, предусмотренных законодательством РФ<br>- не размещать материалы рекламного, эротического, порнографического или оскорбительного характера, а также иную информацию, размещение которой запрещено или противоречит нормам действующего законодательства РФ<br>- не использовать скрипты (программы) для автоматизированного сбора информации и/или взаимодействия с Сайтом и его Сервисами<br><br><b>Администрация обязуется:</b><br>- поддерживать работоспособность сайта за исключением случаев, когда это невозможно по независящим от Администрации причинам.<br>- осуществлять разностороннюю защиту учетной записи Пользователя<br>- предоставить всю доступную информацию о Пользователе уполномоченным на то органам государственной власти в случаях, установленных законом<br><br><h3>Ответственность сторон</h3>- пользователь лично несет полную ответственность за распространяемую им информацию<br>- в случае возникновения форс-мажорной ситуации (боевые действия, чрезвычайное положение, стихийное бедствие и т. д.) Администрация не гарантирует сохранность информации, размещённой Пользователем, а также бесперебойную работу информационного ресурса<br><br><h3>Условия действия Соглашения</h3>Данное Соглашение вступает в силу при любом использовании данного сайта.<br>Соглашение перестает действовать при появлении его новой версии.<br>Администрация оставляет за собой право в одностороннем порядке изменять данное соглашение по своему усмотрению.<br>При изменении соглашения, в некоторых случаях, администрация может оповестить пользователей удобным для нее способом.', 0, 2, 1, 0, 1, 1, 1649582864, 1, 1649582879, 0, 0, 0, 1649582879, 1, '', 0, 0, 0, 0, 0, 'modDocument', 'web', 1, 'login/agreement.html', 0, 0, 1, NULL),
(12, 'document', 'text/html', 'projects', '', '', 'projects', 1, '', 1, 0, 0, 0, 1, '', '', 0, 1, 5, 0, 1, 1, 1649584121, 1, 1649584130, 0, 0, 0, 1649584130, 1, '', 0, 0, 0, 0, 1, 'modDocument', 'web', 1, 'projects/', 0, 0, 1, NULL),
(13, 'document', 'text/html', 'widget', '', '', 'widget', 1, '', 1, 0, 0, 12, 1, '', '<script id=\"modalBody\" type=\"text/x-jsrender\">\r\n    <div class=\"card\">\r\n        <div class=\"card-body\">\r\n            <form class=\"needs-validation\" data-link=\"{on \'submit\' formData.checkcaptha}\">\r\n                <div class=\"form-row\">\r\n                    <div class=\"col-md-6 mb-3\">\r\n                        <label for=\"name\">ФИО</label> \r\n                        <input type=\"text\" class=\"form-control\" id=\"name\" data-link=\"formData.name\" required>\r\n                    </div>\r\n                    <div class=\"col-md-6 mb-3\" data-link=\"visible{:formData.isOp}\">\r\n                        <label for=\"source\">Канал поступления</label> \r\n                        <select class=\"custom-select d-block w-100\" id=\"source\" data-link=\"{:formData.source:} required{:formData.isOp}\">\r\n                            {^{for formData.sourceList}}\r\n                                <option value=\"{{:id}}\"> {{:name}}</option>\r\n                            {{/for}}\r\n                        </select>\r\n                    </div>\r\n                    <div class=\"col-md-6 mb-3\">\r\n                        <label for=\"city\">Город</label> \r\n                        <select class=\"custom-select d-block w-100\" id=\"city\" data-link=\"formData.city\" required>\r\n                            {^{for formData.cityList}}\r\n                                <option value=\"{{:id}}\"> {{:name}}</option>\r\n                            {{/for}}\r\n                        </select>\r\n                    </div>\r\n                    <div class=\"col-md-6 mb-3\">\r\n                        <label for=\"city\">Мед. учреждение</label> \r\n                        <select class=\"custom-select d-block w-100\" id=\"city\" data-link=\"formData.medobj\" required>\r\n                            {^{for formData.companyList ~selcity=formData.city}}\r\n                                {^{if ~selcity != 0 }}\r\n                                    {^{if id == ~selcity}}\r\n                                        {^{for companyList}}\r\n                                            <option value=\"{{:id}}\"> {{:name}}</option>\r\n                                        {{/for}}\r\n                                    {{/if}}\r\n                                {{else}}\r\n                                    <optgroup label=\"{{:name}}\">\r\n                                        {^{for companyList}}\r\n                                            <option value=\"{{:id}}\"> {{:name}}</option>\r\n                                        {{/for}}\r\n                                    </optgroup>\r\n                                {{/if}}\r\n                            {{/for}}\r\n                        </select>\r\n                    </div>\r\n                </div>\r\n                \r\n                <div class=\"form-row\">\r\n                    <div class=\"col-md-12 mb-3\">\r\n                        <label for=\"info\">Опишите проблему</label> \r\n                        <textarea id=\"info\" data-link=\"formData.info\" class=\"form-control\" required></textarea>\r\n                    </div>\r\n                    <div class=\"col-md-12 mb-3\">\r\n                        <div class=\"custom-file1\">\r\n                            <input type=\"file\" class=\"custom-file-input1\" id=\"files\" multiple=\"\" data-link=\"formData.files\"> \r\n                            <label class=\"custom-file-label1\" for=\"files\">Прикрепить файлы</label>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"col-md-12 mb-3\">\r\n                        {^{radiogroup formData.totype}}\r\n                            <label class=\"d-block\">Как вы хотите получить ответ</label>\r\n                            <div class=\"custom-control custom-control-inline custom-radio\">\r\n                                <input type=\"radio\" class=\"custom-control-input\" name=\"rdGroup1\" value=\"1\" id=\"rd1\"> <label class=\"custom-control-label\" for=\"rd1\">Электронная почта</label>\r\n                            </div>\r\n                            <div class=\"custom-control custom-control-inline custom-radio\">\r\n                                <input type=\"radio\" class=\"custom-control-input\" name=\"rdGroup1\" value=\"2\" id=\"rd2\"> <label class=\"custom-control-label\" for=\"rd2\">Почтовое отправление</label>\r\n                            </div>\r\n                        {{/radiogroup}}\r\n                    </div>\r\n                </div>\r\n                \r\n                <div class=\"form-row\">\r\n                    {^{if formData.totype == \"1\"}}\r\n                        <div class=\"col-md-6 mb-3\">\r\n                            <input type=\"email\" class=\"form-control\" data-link=\"{:formData.email:} required{:formData.totype == \'1\'}\" id=\"email\" placeholder=\"Адрес электронной почты\" >\r\n                        </div>\r\n                    {{else formData.totype == \"2\"}}\r\n                        <div class=\"col-md-6 mb-3\">\r\n                            <input type=\"number\" class=\"form-control\" data-link=\"{:formData.zip:} required{:formData.totype == \'2\'}\" id=\"zip\" placeholder=\"Почтовый индекс\">\r\n                        </div>\r\n                        <div class=\"col-md-6 mb-3\">\r\n                            <input type=\"text\" class=\"form-control\" data-link=\"{:formData.address:} required{:formData.totype == \'2\'}\" id=\"address\" placeholder=\"Адрес (Населенный пункт, дом, квартира)\">\r\n                        </div>\r\n                    {{/if}}\r\n                </div>\r\n                \r\n                <div class=\"form-row\">\r\n                    <div class=\"col-md-6 mb-3\">\r\n                        <label for=\"name\">Номер телефона</label> \r\n                        <input type=\"tel\" class=\"form-control\" id=\"name\" data-link=\"formData.tel\" required>\r\n                    </div>\r\n                    <div class=\"col-md-12 mb-3\">\r\n                        <div class=\"custom-control custom-control-inline custom-checkbox\">\r\n                            <input type=\"checkbox\" class=\"custom-control-input\" id=\"ckb1\" required> <label class=\"custom-control-label\" for=\"ckb1\">Basic checkbox</label>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                \r\n                <div class=\"form-row\" data-link=\"visible{:!formData.capDone}\">\r\n                    <div class=\"col-md-3 mb-3\">\r\n                        <img style=\"width: 100%;\" src=\"http://uroboros.start123.ru/assets/id/images/captcha.png\">\r\n                    </div>\r\n                </div>\r\n                \r\n                <div class=\"form-row\" data-link=\"visible{:!formData.capDone}\">\r\n                    <div class=\"col-md-6 mb-3\">\r\n                        <input type=\"number\" class=\"form-control\" id=\"captha\" data-link=\"formData.captha\" placeholder=\"Введите код с картинки\" required>\r\n                    </div>\r\n                </div>\r\n                \r\n                <div class=\"form-actions\" data-link=\"visible{:!formData.capDone}\">\r\n                    <button type=\"submit\" class=\"btn btn-primary\">Продолжить</button>\r\n                </div>\r\n                \r\n                <div class=\"form-row\" data-link=\"visible{:formData.capDone}\">\r\n                    <div class=\"col-md-12 mb-3\">\r\n                        На ваш номер телефона сейчас будет совершен звонок, введите последние 4 цифры\r\n                    </div>\r\n                    <div class=\"col-md-3 mb-3\">\r\n                        <input type=\"number\" class=\"form-control\" id=\"code\" data-link=\"formData.code\">\r\n                    </div>\r\n                    <a class=\"btn btn-primary col-md-3 mb-3\" data-link=\"{on \'click\' formData.checkcode}\">Отправить</a>\r\n                </div>\r\n                \r\n            </form>\r\n        </div>\r\n    </div>\r\n</script>\r\n\r\n<script>\r\nvar formData = {\r\n    sourceList: [\r\n        {\r\n            id:1,\r\n            name: \"Элекронная почта\"\r\n        },\r\n        {\r\n            id:2,\r\n            name: \"Почтовое отправление\"\r\n        }\r\n    ],\r\n    cityList: [\r\n        {\r\n            id:1,\r\n            name: \"Краснодар\"\r\n        },\r\n        {\r\n            id:2,\r\n            name: \"Сочи\"\r\n        }\r\n    ],\r\n    companyList: [\r\n        {\r\n            id:1,\r\n            name: \"Краснодар\",\r\n            companyList: [\r\n                {\r\n                    id:1,\r\n                    name: \"Поликлиника 1\",\r\n                    city: \"Краснодар\"\r\n                },\r\n                {\r\n                    id:2,\r\n                    name: \"Поликлиника 3\",\r\n                    city: \"Краснодар\"\r\n                },\r\n            ]\r\n        },\r\n        {\r\n            id:2,\r\n            name: \"Сочи\",\r\n            companyList: [\r\n                {\r\n                    id:3,\r\n                    name: \"Поликлиника 1\",\r\n                    city: \"Сочи\"\r\n                },\r\n                {\r\n                    id:4,\r\n                    name: \"Поликлиника 2\",\r\n                    city: \"Сочи\"\r\n                }\r\n            ]\r\n        }\r\n    ],\r\n    //isOp: SCRM.app.ugroups.includes(\"Operator\"),\r\n    city: 0,\r\n    totype: \"1\",\r\n    checkcaptha: function(e,d){\r\n        e.preventDefault();\r\n        $.ajax({\r\n            url: \'/hook/hackaton\',\r\n            method: \'post\',\r\n            data: {\r\n                captcha: formData.captha,\r\n                phone: 79086876923\r\n            },\r\n            success: function(data){\r\n            	if (data == 1) $.observable(formData).setProperty(\"capDone\", true);\r\n            	else alert(\"Неверный код, попробуйте еще раз\");\r\n            }\r\n        });\r\n        \r\n    },\r\n    checkcode: function(e,d){\r\n        e.preventDefault();\r\n        if (formData.code && formData.code.length == 4) {\r\n            $.ajax({\r\n                url: \'/hook/hackaton\',\r\n                method: \'post\',\r\n                data: {\r\n                    action: \"confirm\",\r\n                    phone: 79086876923,\r\n                    code: formData.code,\r\n                    formData: {\r\n                        \"source\": formData[\"source\"],\r\n                        \"name\": formData[\"name\"],\r\n                        \"medobj\": formData[\"medobj\"],\r\n                        \"info\": formData[\"info\"],\r\n                        \"totype\": formData[\"totype\"],\r\n                        \"tel\": formData[\"tel\"],\r\n                        \"email\": formData[\"email\"],\r\n                        \"zip\": formData[\"zip\"],\r\n                        \"address\": formData[\"address\"]\r\n                    }\r\n                },\r\n                success: function(data){\r\n                	if (data == 1){\r\n                	    SCRM.success(\"Обращение подано\");\r\n                	} else {\r\n                	    alert(\"Неверный код\");\r\n                	}\r\n                }\r\n            });\r\n        } else {\r\n            alert(\"Неверно заполнен код\");\r\n        }\r\n    }\r\n    \r\n};\r\n\r\nSCRM._service[\'/projects/widget\'] = function(){\r\n    var modalVar = {\r\n        title: \'Новое обращение\',\r\n		body: \'#modalBody\',\r\n		formData: formData,\r\n		cm_size: \'lg\'\r\n	};\r\n	club_Drawer(modalVar);\r\n};\r\n</script>\r\n\r\n   ', 0, 0, 0, 0, 1, 1, 1649584175, 1, 1649589922, 0, 0, 0, 1649584200, 1, '', 0, 0, 0, 0, 1, 'modDocument', 'web', 1, 'projects/widget/', 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_htmlsnippets`
--

CREATE TABLE `mx_site_htmlsnippets` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `property_preprocess` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(191) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0',
  `snippet` mediumtext,
  `locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text,
  `static` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `static_file` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_site_htmlsnippets`
--

INSERT INTO `mx_site_htmlsnippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `static`, `static_file`) VALUES
(1, 0, 0, 'lgnLoginTpl', '', 0, 3, 0, '<div class=\"loginForm\">\n    <div class=\"loginMessage\">[[+errors]]</div>\n    <div class=\"loginLogin\">\n        <form class=\"loginLoginForm\" action=\"[[~[[*id]]]]\" method=\"post\">\n            <fieldset class=\"loginLoginFieldset\">\n                <legend class=\"loginLegend\">[[+actionMsg]]</legend>\n                <label class=\"loginUsernameLabel\">[[%login.username]]\n                    <input class=\"loginUsername\" type=\"text\" name=\"username\" />\n                </label>\n                \n                <label class=\"loginPasswordLabel\">[[%login.password]]\n                    <input class=\"loginPassword\" type=\"password\" name=\"password\" />\n                </label>\n                <input class=\"returnUrl\" type=\"hidden\" name=\"returnUrl\" value=\"[[+request_uri]]\" />\n\n                [[+login.recaptcha_html]]\n                \n                <input class=\"loginLoginValue\" type=\"hidden\" name=\"service\" value=\"login\" />\n                <span class=\"loginLoginButton\"><input type=\"submit\" name=\"Login\" value=\"[[+actionMsg]]\" /></span>\n            </fieldset>\n        </form>\n    </div>\n</div>', 0, 'a:0:{}', 0, ''),
(2, 0, 0, 'lgnLogoutTpl', '', 0, 3, 0, '<div class=\"loginMessage\">[[+errors]]</div>\n<br />\n<div class=\"loginLogin\">\n    <div class=\"loginRegister\">\n        <a href=\"[[+logoutUrl]]\" title=\"[[+actionMsg]]\">[[+actionMsg]]</a>\n    </div>\n</div>', 0, 'a:0:{}', 0, ''),
(3, 0, 0, 'lgnErrTpl', '', 0, 3, 0, '<p class=\"error\">[[+msg]]</p>', 0, 'a:0:{}', 0, ''),
(4, 0, 0, 'lgnForgotPassEmail', '', 0, 3, 0, '[[%login.forgot_password_email_text? &username=`[[+username]]` &confirmUrl=`[[+confirmUrl]]` &password=`[[+password]]`]]\n', 0, 'a:0:{}', 0, ''),
(5, 0, 0, 'lgnForgotPassSentTpl', '', 0, 3, 0, '<h2>Your Login Information Has Been Sent</h2>\n\n<p>Your login information has been sent to the email address [[+email]].</p>', 0, 'a:0:{}', 0, ''),
(6, 0, 0, 'lgnForgotPassTpl', '', 0, 3, 0, '<div class=\"loginFPErrors\">[[+loginfp.errors]]</div>\n<div class=\"loginFP\">\n    <form class=\"loginFPForm\" action=\"[[~[[*id]]]]\" method=\"post\">\n        <fieldset class=\"loginFPFieldset\">\n            <legend class=\"loginFPLegend\">[[%login.forgot_password]]</legend>\n            <label class=\"loginFPUsernameLabel\">[[%login.username]]\n                <input class=\"loginFPUsername\" type=\"text\" name=\"username\" value=\"[[+loginfp.post.username]]\" />\n            </label>\n            \n            <p>[[%login.or_forgot_username]]</p>\n            \n            <label class=\"loginFPEmailLabel\">[[%login.email]]\n                <input class=\"loginFPEmail\" type=\"text\" name=\"email\" value=\"[[+loginfp.post.email]]\" />\n            </label>\n            \n            <input class=\"returnUrl\" type=\"hidden\" name=\"returnUrl\" value=\"[[+loginfp.request_uri]]\" />\n            \n            <input class=\"loginFPService\" type=\"hidden\" name=\"login_fp_service\" value=\"forgotpassword\" />\n            <span class=\"loginFPButton\"><input type=\"submit\" name=\"login_fp\" value=\"[[%login.reset_password]]\" /></span>\n        </fieldset>\n    </form>\n</div>', 0, 'a:0:{}', 0, ''),
(7, 0, 0, 'lgnResetPassTpl', '', 0, 3, 0, '<div class=\"loginResetPass\">\n<p class=\"loginResetPassHeader\">[[+username]],</p>\n\n<p class=\"loginResetPassText\">Your password has been reset. Please return <a href=\"[[+loginUrl]]\">here</a> to log in.</p>  \n</div>', 0, 'a:0:{}', 0, ''),
(8, 0, 0, 'lgnRegisterFormTpl', '', 0, 3, 0, '<div class=\"register\">\n    <div class=\"registerMessage\">[[+error.message]]</div>\n    \n    <form class=\"form\" action=\"[[~[[*id]]]]\" method=\"post\">\n        <input type=\"hidden\" name=\"nospam:blank\" value=\"\" />\n        \n        <label for=\"username\">[[%register.username? &namespace=`login` &topic=`register`]]\n            <span class=\"error\">[[+error.username]]</span>\n        </label>\n        <input type=\"text\" name=\"username:required:minLength=6\" id=\"username\" value=\"[[+username]]\" />\n        \n        <label for=\"password\">[[%register.password]]\n            <span class=\"error\">[[+error.password]]</span>\n        </label>\n        <input type=\"password\" name=\"password:required:minLength=6\" id=\"password\" value=\"[[+password]]\" />\n        \n        <label for=\"password_confirm\">[[%register.password_confirm]]\n            <span class=\"error\">[[+error.password_confirm]]</span>\n        </label>\n        <input type=\"password\" name=\"password_confirm:password_confirm=`password`\" id=\"password_confirm\" value=\"[[+password_confirm]]\" />\n        \n        <label for=\"fullname\">[[%register.fullname]]\n            <span class=\"error\">[[+error.fullname]]</span>\n        </label>\n        <input type=\"text\" name=\"fullname:required\" id=\"fullname\" value=\"[[+fullname]]\" />\n        \n        <label for=\"email\">[[%register.email]]\n            <span class=\"error\">[[+error.email]]</span>\n        </label>\n        <input type=\"text\" name=\"email:email\" id=\"email\" value=\"[[+email]]\" />\n        \n        <br class=\"clear\" />\n\n        [[+register.recaptcha_html]]\n        [[+error.recaptcha]]\n        \n        <div class=\"form-buttons\">\n            <input type=\"submit\" name=\"login-register-btn\" value=\"Register\" />\n        </div>\n    </form>\n</div>', 0, 'a:0:{}', 0, ''),
(9, 0, 0, 'lgnActivateEmailTpl', '', 0, 3, 0, '<p>[[+username]],</p>\n\n<p>Thanks for registering! To activate your new account, please click on the following link:</p>\n\n<p><a href=\"[[+confirmUrl]]\">[[+confirmUrl]]</a></p>\n\n<p>If you did not request this message, please ignore it.</p>\n\n<p>Thanks,<br />\n<em>Site Administrator</em></p>\n', 0, 'a:0:{}', 0, ''),
(10, 0, 0, 'lgnActiveUser', '', 0, 3, 0, '<li>[[+username]]</li>', 0, 'a:0:{}', 0, ''),
(11, 0, 0, 'lgnResetPassChangePassTpl', '', 0, 3, 0, '[[!+logcp.error_message:notempty=`<p style=\"color: red;\">[[+logcp.error_message]]</p>`]]\n\n<form class=\"form inline\" action=\"[[~[[*id]]]]\" method=\"post\">\n    <input type=\"hidden\" name=\"nospam:blank\" value=\"\" />\n    <input type=\"hidden\" name=\"lp\" value=\"[[!+logcp.lp]]\"/>\n    <input type=\"hidden\" name=\"lu\" value=\"[[!+logcp.lu]]\"/>\n\n    <div class=\"ff\">\n        <label for=\"password_new\">[[!%login.password_new]]\n            <span class=\"error\">[[+logcp.error.password_new]]</span>\n        </label>\n        <input type=\"password\" name=\"password_new:required\" id=\"password_new\" value=\"[[+logcp.password_new]]\" />\n    </div>\n\n    <div class=\"ff\">\n        <label for=\"password_new_confirm\">[[!%login.password_new_confirm]]\n            <span class=\"error\">[[+logcp.error.password_new_confirm]]</span>\n        </label>\n        <input type=\"password\" name=\"password_new_confirm:required\" id=\"password_new_confirm\" value=\"[[+logcp.password_new_confirm]]\" />\n    </div>\n\n    <br class=\"clear\" />\n\n    <div class=\"form-buttons\">\n        <input type=\"submit\" name=\"logcp-submit\" value=\"[[!%login.change_password]]\" />\n    </div>\n</form>\n', 0, 'a:0:{}', 0, ''),
(12, 0, 0, 'lgnExpiredTpl', '', 0, 3, 0, '<p><strong>Password Reset Information</strong></p>\n<p>Your password has already been reset or the link expired. If you need to reset your password again, click <a href=\"#\">here</a>.</p>', 0, 'a:0:{}', 0, ''),
(13, 1, 0, 'idLogoutMenu4', '', 0, 0, 0, '<button class=\"btn-account\" type=\"button\" data-toggle=\"dropdown\"[[- data-display=\"static\" aria-haspopup=\"true\" aria-expanded=\"false\"]]>\n    <span class=\"d-block d-md-none\">\n        <i class=\"fa fa-user-circle-o\"></i>\n    </span>\n    <span class=\"account-summary d-none d-md-block\">\n        <span class=\"account-name\">[[!#SESSION.user_fullname]]</span>\n        [[-<span class=\"account-description\">[[-!#SESSION.club_cityname]]</span>]]\n    </span>\n</button>\n<!-- .dropdown-menu -->\n<div class=\"dropdown-menu dropdown-menu-right\">\n    <div class=\"dropdown-arrow\"></div>\n    <h6 class=\"dropdown-header d-md-none\" id=\"user_fullname\">[[!#SESSION.user_fullname]]</h6>\n    <a class=\"dropdown-item\" href=\"/login/profile.html\"><i class=\"dropdown-icon fa fa-id-card-o\"></i> Профиль</a>\n    <div class=\"dropdown-divider\"></div>\n    <a class=\"dropdown-item\" href=\"[[+logoutUrl]]\"><i class=\"dropdown-icon fa fa-sign-out\"></i> Выход</a>\n</div>\n<!-- /.dropdown-menu -->\n[[-#SESSION.club_manager:notempty=`\n<li class=\"dropdown\">\n    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" id=\"chCity\" aria-expanded=\"false\">\n        <i class=\"fa fa-map-marker\"></i> \n        [[-#SESSION.club_cityname]]\n        <span class=\"caret\"></span>\n    </a>\n    \n    <ul class=\"dropdown-menu\">\n        <li><a href=\"/database/db.html\">База данных</a></li>\n    </ul>\n</li>\n`]]', 0, 'a:0:{}', 0, ''),
(14, 1, 0, 'idLoginMenu4', '', 0, 0, 0, '[[-<li><a href=\"/?action=login\" class=\"showLogin\"><i class=\"fa fa-sign-in\"></i> Войти</a></li>]]\n\n<a href=\"/?action=login\" class=\"btn-account showLogin\"><i class=\"fa fa-sign-in\"></i>&nbsp;Войти</a>', 0, 'a:0:{}', 0, ''),
(15, 1, 0, 'tplModal', '', 0, 0, 0, '<div class=\"modal inmodal1 fade\" id=\"tpl_clubModal\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\" aria-labelledby=\"rmodalLabel\" data-link=\"aria-labelledby{:mdl_id+\'label\'}\">\n    <div class=\"modal-dialog\" data-link=\"class{merge:cm_size toggle=\'modal-\'+cm_size}\">\n        <div class=\"modal-content spinner-parent\" data-link=\"disabled{:loading}\">\n            <div class=\"color-line mb-3\"></div>\n            <div class=\"modal-header pt-0\" data-link=\"visible{:title||!onOK}\">\n                <h5 class=\"modal-title\" data-link=\"html{:title} id{:mdl_id+\'label\'}\" id=\"rmodalLabel\"></h5>\n                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n                    <span aria-hidden=\"true\">&times;</span>\n                </button>\n            </div>\n            <div class=\"modal-body pt-0 pb-3\" data-link=\"{include tmpl=body}\"></div>\n            <div class=\"modal-footer pt-0\" data-link=\"visible{:onOK||cancel||mdl_footer}\">\n                <div class=\"modal-footer-add flex-grow-1\" data-link=\"{if mdl_footer tmpl=mdl_footer}\"></div>\n                <button type=\"button\" class=\"btn btn-light btn-modal-cancel\"\n                    data-dismiss=\"modal\"\n                    data-link=\"html{:cancel? cancel:\'Отмена\'} visible{:onOK||cancel} disabled{:loading}\"></button>\n                <button type=\"button\" class=\"btn btn-primary btn-modal-ok\"\n                    data-link=\"visible{:onOK} {on \'click\' ~on_OK} disabled{:loading||disabledOK}\">\n                    <span data-link=\"html{:ok||\'OK\'}\"></span>\n                    <span class=\"spinner-border spinner-border-sm\" role=\"status\" data-link=\"visible{:loading}\"></span>\n                </button>\n            </div>\n        </div>\n    </div>\n</div>\n\n<div class=\"modal modal-drawer fade\" id=\"tpl_clubDrawer\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\" aria-labelledby=\"rdrawerLabel\" data-link=\"aria-labelledby{:mdl_id+\'label\'}\">\n    <div class=\"modal-dialog modal-drawer-right\" role=\"document\" data-link=\"class{merge:cm_size toggle=\'modal-\'+cm_size}\">\n        <div class=\"modal-content\" data-link=\"disabled{:loading}\">\n            <div class=\"modal-header d-flex\">\n                <div id=\"rdrawerLabel\" class=\"modal-title h6 flex-grow-1\" data-link=\"{include ^tmpl=title} id{:mdl_id+\'label\'}\"></div>\n                <button class=\"close d-print-none\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n            </div>\n            <div class=\"modal-body my-2\" data-link=\"{include tmpl=body}\"></div>\n        </div>\n    </div>\n</div>', 0, 'a:0:{}', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_plugins`
--

CREATE TABLE `mx_site_plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `property_preprocess` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(191) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0',
  `plugincode` mediumtext NOT NULL,
  `locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text,
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  `static` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `static_file` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_site_plugins`
--

INSERT INTO `mx_site_plugins` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `static`, `static_file`) VALUES
(1, 0, 0, 'Ace', 'Ace code editor plugin for MODx Revolution', 0, 0, 0, '/**\n * Ace Source Editor Plugin\n *\n * Events: OnManagerPageBeforeRender, OnRichTextEditorRegister, OnSnipFormPrerender,\n * OnTempFormPrerender, OnChunkFormPrerender, OnPluginFormPrerender,\n * OnFileCreateFormPrerender, OnFileEditFormPrerender, OnDocFormPrerender\n *\n * @author Danil Kostin <danya.postfactum(at)gmail.com>\n *\n * @package ace\n *\n * @var array $scriptProperties\n * @var Ace $ace\n */\nif ($modx->event->name == \'OnRichTextEditorRegister\') {\n    $modx->event->output(\'Ace\');\n    return;\n}\n\nif ($modx->getOption(\'which_element_editor\', null, \'Ace\') !== \'Ace\') {\n    return;\n}\n\n$corePath = $modx->getOption(\'ace.core_path\', null, $modx->getOption(\'core_path\').\'components/ace/\');\n$ace = $modx->getService(\'ace\', \'Ace\', $corePath.\'model/ace/\');\n$ace->initialize();\n\n$extensionMap = array(\n    \'tpl\'   => \'text/x-smarty\',\n    \'htm\'   => \'text/html\',\n    \'html\'  => \'text/html\',\n    \'css\'   => \'text/css\',\n    \'scss\'  => \'text/x-scss\',\n    \'less\'  => \'text/x-less\',\n    \'svg\'   => \'image/svg+xml\',\n    \'xml\'   => \'application/xml\',\n    \'xsl\'   => \'application/xml\',\n    \'js\'    => \'application/javascript\',\n    \'json\'  => \'application/json\',\n    \'php\'   => \'application/x-php\',\n    \'sql\'   => \'text/x-sql\',\n    \'md\'    => \'text/x-markdown\',\n    \'txt\'   => \'text/plain\',\n    \'twig\'  => \'text/x-twig\'\n);\n\n// Define default mime for html elements(templates, chunks and html resources)\n$html_elements_mime=$modx->getOption(\'ace.html_elements_mime\',null,false);\nif(!$html_elements_mime){\n    // this may deprecated in future because components may set ace.html_elements_mime option now\n    switch (true) {\n        case $modx->getOption(\'twiggy_class\'):\n            $html_elements_mime = \'text/x-twig\';\n            break;\n        case $modx->getOption(\'pdotools_fenom_parser\'):\n            $html_elements_mime = \'text/x-smarty\';\n            break;\n        default:\n            $html_elements_mime = \'text/html\';\n    }\n}\n\n// Defines wether we should highlight modx tags\n$modxTags = false;\nswitch ($modx->event->name) {\n    case \'OnSnipFormPrerender\':\n        $field = \'modx-snippet-snippet\';\n        $mimeType = \'application/x-php\';\n        break;\n    case \'OnTempFormPrerender\':\n        $field = \'modx-template-content\';\n        $modxTags = true;\n        $mimeType = $html_elements_mime;\n        break;\n    case \'OnChunkFormPrerender\':\n        $field = \'modx-chunk-snippet\';\n        if ($modx->controller->chunk && $modx->controller->chunk->isStatic()) {\n            $extension = pathinfo($modx->controller->chunk->name, PATHINFO_EXTENSION);\n            if(!$extension||!isset($extensionMap[$extension])){\n                $extension = pathinfo($modx->controller->chunk->getSourceFile(), PATHINFO_EXTENSION);\n            }\n            $mimeType = isset($extensionMap[$extension]) ? $extensionMap[$extension] : \'text/plain\';\n        } else {\n            $mimeType = $html_elements_mime;\n        }\n        $modxTags = true;\n        break;\n    case \'OnPluginFormPrerender\':\n        $field = \'modx-plugin-plugincode\';\n        $mimeType = \'application/x-php\';\n        break;\n    case \'OnFileCreateFormPrerender\':\n        $field = \'modx-file-content\';\n        $mimeType = \'text/plain\';\n        break;\n    case \'OnFileEditFormPrerender\':\n        $field = \'modx-file-content\';\n        $extension = pathinfo($scriptProperties[\'file\'], PATHINFO_EXTENSION);\n        $mimeType = isset($extensionMap[$extension])\n            ? $extensionMap[$extension]\n            : (\'@FILE:\'.pathinfo($scriptProperties[\'file\'], PATHINFO_BASENAME));\n        $modxTags = $extension == \'tpl\';\n        break;\n    case \'OnDocFormPrerender\':\n        if (!$modx->controller->resourceArray) {\n            return;\n        }\n        $field = \'ta\';\n        $mimeType = $modx->getObject(\'modContentType\', $modx->controller->resourceArray[\'content_type\'])->get(\'mime_type\');\n\n        if($mimeType == \'text/html\')$mimeType = $html_elements_mime;\n\n        if ($modx->getOption(\'use_editor\')){\n            $richText = $modx->controller->resourceArray[\'richtext\'];\n            $classKey = $modx->controller->resourceArray[\'class_key\'];\n            if ($richText || in_array($classKey, array(\'modStaticResource\',\'modSymLink\',\'modWebLink\',\'modXMLRPCResource\'))) {\n                $field = false;\n            }\n        }\n        $modxTags = true;\n        break;\n    case \'OnTVInputRenderList\':\n        $modx->event->output($corePath . \'elements/tv/input/\');\n        break;\n    default:\n        return;\n}\n\n$modxTags = (int) $modxTags;\n$script = \'\';\nif ($field) {\n    $script .= \"MODx.ux.Ace.replaceComponent(\'$field\', \'$mimeType\', $modxTags);\";\n}\n\nif ($modx->event->name == \'OnDocFormPrerender\' && !$modx->getOption(\'use_editor\')) {\n    $script .= \"MODx.ux.Ace.replaceTextAreas(Ext.query(\'.modx-richtext\'));\";\n}\n\nif ($script) {\n    $modx->controller->addHtml(\'<script>Ext.onReady(function() {\' . $script . \'});</script>\');\n}', 0, NULL, 0, '', 0, 'ace/elements/plugins/ace.plugin.php'),
(2, 1, 0, 'pdoTools', '', 0, 2, 0, '/** @var modX $modx */\r\nswitch ($modx->event->name) {\r\n\r\n    case \'OnMODXInit\':\r\n        $fqn = $modx->getOption(\'pdoTools.class\', null, \'pdotools.pdotools\', true);\r\n        $path = $modx->getOption(\'pdotools_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\n        $modx->loadClass($fqn, $path, false, true);\r\n\r\n        $fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n        $path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\n        $modx->loadClass($fqn, $path, false, true);\r\n        break;\r\n\r\n    case \'OnSiteRefresh\':\r\n        /** @var pdoTools $pdoTools */\r\n        if ($pdoTools = $modx->getService(\'pdoTools\')) {\r\n            if ($pdoTools->clearFileCache()) {\r\n                $modx->log(modX::LOG_LEVEL_INFO, $modx->lexicon(\'refresh_default\') . \': pdoTools\');\r\n            }\r\n        }\r\n        break;\r\n\r\n    case \'OnWebPagePrerender\':\r\n        $parser = $modx->getParser();\r\n        if ($parser instanceof pdoParser) {\r\n            foreach ($parser->pdoTools->ignores as $key => $val) {\r\n                $modx->resource->_output = str_replace($key, $val, $modx->resource->_output);\r\n            }\r\n        }\r\n        break;\r\n}', 0, NULL, 0, '', 0, 'core/components/pdotools/elements/plugins/plugin.pdotools.php'),
(3, 0, 0, 'clubPackage', '', 0, 1, 0, 'define(\'CRM_PATH\', MODX_ASSETS_PATH.\'id/\');\ndefine(\'CRM_URL\', MODX_ASSETS_URL.\'id/\');\ndefine(\'CRM_FILES\', MODX_BASE_PATH.\'files/\');\n\ndefine(\'CRMTOOLS_PATH\', MODX_ASSETS_PATH.\'clubtools/\');\ndefine(\'CRMTOOLS_URL\', MODX_ASSETS_URL.\'clubtools/\');\ndefine(\'CRM_LOGS\', MODX_ASSETS_PATH.\'scrm_log/\');\n\n//$modx->loadClass(\'modResource\'); // здесь потому что при сохранении в mgr \n/*$modx->map[\'modResource\'][\'fields\'][\'club_id\'] = 0;\n$modx->map[\'modResource\'][\'fieldMeta\'][\'club_id\'] = array(\n	\'dbtype\' => \'int\',\n	\'phptype\' => \'integer\',\n	\'null\' => false,\n	\'default\' => 0,\n);*/\n\nif ($modx->context->key == \'web\') {\n    include_once(CRM_PATH.\'club_func.php\');\n    \n    /*$www = $modx->cacheManager->get(\"www\");\n    if (empty($www)) {\n        $www = array();\n        foreach ($modx->getIterator(\'modUserGroup\', array(\'name:LIKE\' => \'www_%\')) as $gr) {\n            $www[$gr->get(\'description\')] = str_replace(\'www_\', \'\', $gr->get(\'name\'));\n        }\n        $modx->cacheManager->set(\"www\", $www, 604800*4); //4*7 дней\n    }*/\n    \n    define(\'CRM_PREFIX\', \'ur_\');\n    \n    $userID = clubUser();\n    if (!empty($userID)) {\n        $userGroups = $modx->user->getUserGroupNames();\n    } else {\n        $userGroups = array();\n    }\n    \n    $modx->addPackage(\'idDB\', CRM_PATH.\'start/model/\', CRM_PREFIX);\n\n    $cache_path = CRM_PREFIX.\'/clubConfig/init\';\n    $club_opts = $modx->cacheManager->get($cache_path);\n    if (empty($club_opts)) {\n        $club_opts = clubConfig(\'club_modules,https\', 0, 1);\n\n        $club_opts[\'club_modules\'] = empty($club_opts[\'club_modules\'])? array() : explode(\',\', $club_opts[\'club_modules\']);\n        array_unshift($club_opts[\'club_modules\'], \'clubStuff\', CRM_PREFIX);\n        $club_opts[\'crm_url\'] = CRM_URL;\n        $club_opts[\'crmtools_url\'] = CRMTOOLS_URL;\n        $modx->cacheManager->set($cache_path, $club_opts, 86400*3); // 3 дней\n    }\n    \n    $club_opts[\'club_name\'] = $modx->getOption(\'site_name\');\n    $club_opts[\'scrm_ugroups\'] = $userGroups;\n    $club_opts[\'scrm_grhash\'] = empty($userGroups)? \'empty\' : cacheHash($userGroups);\n    $club_opts[\'vers\'] = $modx->getOption(\'vers\');\n    $club_opts[\'scrm_prugv\'] = cacheHash(array(CRM_PREFIX, $userID, $club_opts[\'scrm_grhash\'], $club_opts[\'vers\']));\n    \n    foreach($club_opts as $okey => $oval) {\n        $modx->setOption($okey, $oval);\n    }\n    $club_opts[\'site_url\'] = $modx->getOption(\'site_url\');\n    $modx->setPlaceholders($club_opts, \'+\');\n    \n    $rq = explode(\'/\', $_REQUEST[\'q\']);\n    \n    $hooks = array(\n        \'hook\' => \"hook/{$rq[1]}.php\",\n        \'pay\' => \'hook/pay.php\',\n        \'paycb\' => \'hook/pay.php\',\n        \'js\' => \'hook/js.php\',\n        \'data\' => \'club_data.php\',\n        \'chunk\' => \'hook/chunk.php\',\n        \'setup\' => \'setup/hook.php\',\n    );\n    $hook_file = $hooks[ $rq[0] ];\n    if (!empty($hook_file)) {\n        foreach (glob(\'{\'.implode(\',\', [CRMTOOLS_PATH, CRM_PATH]).\'}\'.$hook_file, GLOB_BRACE) as $hf) {\n            include_once($hf);\n            if (!empty($json)) echo( json_encode($json, JSON_UNESCAPED_UNICODE) );\n            die;\n        }\n        /*if (file_exists(CRMTOOLS_PATH.$hook_file)){\n            include_once(CRMTOOLS_PATH.$hook_file);\n            die;\n        } elseif (file_exists(CRM_PATH.$hook_file)){\n            include_once(CRM_PATH.$hook_file);\n            die;\n        }*/\n    }\n}', 0, 'a:0:{}', 0, '', 0, ''),
(5, 1, 0, 'afterLogin', '', 0, 0, 0, '$ugroups = $user->getUserGroupNames();\n$_SESSION[\'club_groups\'] = implode(\';\', $ugroups);\n$_SESSION[\'scrm_thislogin\'] = date(\'c\');\n\nif (in_array(\'idAdmin\', $ugroups)) $_SESSION[\'club_admin\'] = 1;\nif (in_array(\'idManager\', $ugroups)) $_SESSION[\'club_manager\'] = 1;\n$_SESSION[\'club_debug\'] = $user->isMember(\'Administrator\');\n\nif (($userprofile = $user->getOne(\'Profile\')) !== null) {\n    $_SESSION[\'user_fullname\'] = $userprofile->get(\'fullname\');\n    $_SESSION[\'club_cityname\'] = $userprofile->get(\'city\');\n    /*$modx->loadClass(\'idExtid\');\n    $modx->map[\'idExtid\'][\'aggregates\'][\'idCity\'] = array (\n        \'class\' => \'idCity\',\n        \'local\' => \'extid\',\n        \'foreign\' => \'id\',\n        \'cardinality\' => \'one\',\n        \'owner\' => \'foreign\',\n    );\n    \n    $idUser_city = getClubExtId(array(\n        \'parent\' => $user->get(\'id\'),\n    ), \'idUser_city\', true, \'idCity\');\n\n    if (!empty($idUser_city)){\n        $_SESSION[\'club_city\'] = $idUser_city->idCity->get(\'id\');\n        $_SESSION[\'club_cityname\'] = $idUser_city->idCity->get(\'name\');\n    }*/\n}\n\n$returnUrl = $modx->getOption(\'returnUrl\', $scriptProperties, $_POST[\'returnUrl\']);\n//$returnUrl = $modx->getOption(\'returnUrl\', $_POST, $returnUrl);\n\n//$modx->log(modX::LOG_LEVEL_ERROR, \"afterLogin: $returnUrl; url:\".$_SERVER[\'HTTP_HOST\'].$_SERVER[\'REQUEST_URI\'].\'; user:\'.$user->get(\'id\'));\n\nif (empty($returnUrl)) {\n    $modx->runSnippet(\'loginWay\', array(\n        \'user\' => $user,\n    ));\n}', 0, 'a:0:{}', 0, '', 0, ''),
(6, 1, 0, 'clubScripts', '', 0, 0, 0, '$res = $modx->resource;\n$start = \'\'; $bottom = \'\'; $app = array(\n    \'club_id\' => $res->get(\'club_id\'),\n    \'club_city\' => $_SESSION[\'club_city\'],\n);\nif (defined(\'CRM_PREFIX\') && !empty($res->get(\'template\'))) {\n    //$modx->log(modX::LOG_LEVEL_ERROR,\"Log2 \".json_encode($res->toArray(), JSON_UNESCAPED_UNICODE));\n\n    $cfg = clubConfig(\'StartupHTMLBlock,BottomHTMLBlock\'); //grid_rows\n    $start = $cfg[\'StartupHTMLBlock\'];\n    $bottom = $cfg[\'BottomHTMLBlock\'];\n    //$app[\'res\'] = $res->toArray(\'\',false,false,true);\n    //$app[\'res\'][\'content\'] = null;\n\n    $userID = clubUser();\n    $app[\'ugroups\'] = $ugroups = $modx->getOption(\'scrm_ugroups\');\n    if (!empty($ugroups)){\n        $app[\'is_crew\'] = isCrew();\n    }\n    /*$users_scripts = array();\n    foreach($clubStatus as $cs) {\n        if ($cs[\'tbl\'] != \'idPermission\') continue;\n        if (!empty($cs[\'extended\'][\'crew\'])) $users_scripts[] = $cs[\'alias\'];\n    }\n    \n    $is_crew = !empty(array_intersect($ugroups, $users_scripts));\n    if ($is_crew) {\n        $start .= \"<script>\n            var club_city = \'{$_SESSION[\'club_city\']}\',\n            grid_rows = \'{$cfg[\'grid_rows\']}\';\n            dataUrl = \'\".CRM_URL.\"id_data.php\';\n            editUrl = \'/hook/dbedit\';\n        </script>\";\n    }*/\n    \n    $club_modules = $modx->getOption(\'club_modules\');\n    $clubStatus = getClubStatus(array(\n        \'tbl\' => \'idModule\',\n        \'cls:IN\' => $club_modules,\n    )); //idPermission\n    \n    //$bottom .= \'111\'.json_encode($club_modules);\n\n    $load_modules = array();\n    $pathReplace1 = array(\'{crm}\',\'{modules}\',\'{vers}\',\'{user}\', \'{prugv}\');\n    $pathReplace2 = array(\n        CRM_URL,\n        \'/handlers/modules/\',\n        \'v=\'.$modx->getOption(\'vers\'),\n        $userID,\n        $modx->getOption(\'scrm_prugv\'),\n    );\n    \n    foreach($clubStatus as $rowMod) {\n        if ($rowMod[\'tbl\'] != \'idModule\') continue;\n        $ext = $rowMod[\'extended\'];\n        //if (!in_array($rowMod[\'cls\'], $club_modules)) continue;\n        if (!empty($ext[\'group\'])) {\n            if (empty($ugroups)) continue;\n            $check_groups = array_merge(array(\'all\'), $ugroups);\n            if (empty(array_intersect(explode(\',\', $ext[\'group\']), $check_groups))) continue;\n        }\n        if (!empty($ext[\'club_id\']) && !in_array($app[\'club_id\'], explode(\',\', $ext[\'club_id\']))) continue;\n        if (!empty($ext[\'script\'])) {\n            $bottom .= \'<script src=\"\'. str_replace($pathReplace1, $pathReplace2, $ext[\'script\']) .\'\"></script>\';\n        }\n        if (!empty($ext[\'load\'])) {\n            $load_modules[] = str_replace($pathReplace1, $pathReplace2, $ext[\'load\']);\n        }\n    }\n    if (!empty($load_modules)) {\n        $bottom .= \'<script>$(function(){SCRM.loadSeries(\'.json_encode($load_modules).\');});</script>\';\n    }\n\n    foreach (glob(CRM_START.\'load.php\', GLOB_BRACE) as $data_handler) require($data_handler);\n}\n\n$modx->setPlaceholders(array(\n    \'StartupHTMLBlock\' => \'<script>$.extend(SCRM.app, \'. json_encode($app) .\');</script>\'.PHP_EOL.$start,\n    \'BottomHTMLBlock\' => $bottom,\n));', 0, 'a:0:{}', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_plugin_events`
--

CREATE TABLE `mx_site_plugin_events` (
  `pluginid` int(10) NOT NULL DEFAULT '0',
  `event` varchar(191) NOT NULL DEFAULT '',
  `priority` int(10) NOT NULL DEFAULT '0',
  `propertyset` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_site_plugin_events`
--

INSERT INTO `mx_site_plugin_events` (`pluginid`, `event`, `priority`, `propertyset`) VALUES
(1, 'OnChunkFormPrerender', 0, 0),
(1, 'OnDocFormPrerender', 0, 0),
(1, 'OnFileCreateFormPrerender', 0, 0),
(1, 'OnFileEditFormPrerender', 0, 0),
(1, 'OnManagerPageBeforeRender', 0, 0),
(1, 'OnPluginFormPrerender', 0, 0),
(1, 'OnRichTextEditorRegister', 0, 0),
(1, 'OnSnipFormPrerender', 0, 0),
(1, 'OnTempFormPrerender', 0, 0),
(1, 'OnTVInputRenderList', 0, 0),
(2, 'OnMODXInit', -100, 0),
(2, 'OnSiteRefresh', 0, 0),
(2, 'OnWebPagePrerender', -100, 0),
(3, 'OnMODXInit', 0, 0),
(5, 'OnWebLogin', 0, 0),
(6, 'OnLoadWebDocument', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_snippets`
--

CREATE TABLE `mx_site_snippets` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `property_preprocess` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(191) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0',
  `snippet` mediumtext,
  `locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text,
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  `static` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `static_file` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_site_snippets`
--

INSERT INTO `mx_site_snippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `static`, `static_file`) VALUES
(1, 1, 0, 'pdoResources', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var modX $modx */\r\nif (isset($parents) && $parents === \'\') {\r\n    $scriptProperties[\'parents\'] = $modx->resource->id;\r\n}\r\nif (!empty($returnIds)) {\r\n    $scriptProperties[\'return\'] = $return = \'ids\';\r\n} elseif (!isset($return)) {\r\n    $scriptProperties[\'return\'] = $return = \'chunks\';\r\n}\r\n\r\n// Adding extra parameters into special place so we can put them in a results\r\n/** @var modSnippet $snippet */\r\n$additionalPlaceholders = $properties = [];\r\nif (isset($this) && $this instanceof modSnippet && $this->get(\'properties\')) {\r\n    $properties = $this->get(\'properties\');\r\n}\r\nelseif ($snippet = $modx->getObject(\'modSnippet\', [\'name\' => \'pdoResources\'])) {\r\n    $properties = $snippet->get(\'properties\');\r\n}\r\nif (!empty($properties)) {\r\n    foreach ($scriptProperties as $k => $v) {\r\n        if (!isset($properties[$k])) {\r\n            $additionalPlaceholders[$k] = $v;\r\n        }\r\n    }\r\n}\r\n$scriptProperties[\'additionalPlaceholders\'] = $additionalPlaceholders;\r\n\r\n/** @var pdoFetch $pdoFetch */\r\n$fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n$path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoFetch = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoFetch->addTime(\'pdoTools loaded\');\r\n$output = $pdoFetch->run();\r\n\r\n$log = \'\';\r\nif ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n    $log .= \'<pre class=\"pdoResourcesLog\">\' . print_r($pdoFetch->getTime(), 1) . \'</pre>\';\r\n}\r\n\r\n// Return output\r\nif (!empty($returnIds)) {\r\n    $modx->setPlaceholder(\'pdoResources.log\', $log);\r\n    if (!empty($toPlaceholder)) {\r\n        $modx->setPlaceholder($toPlaceholder, $output);\r\n    } else {\r\n        return $output;\r\n    }\r\n} elseif ($return === \'data\') {\r\n    return $output;\r\n} elseif (!empty($toSeparatePlaceholders)) {\r\n    $output[\'log\'] = $log;\r\n    $modx->setPlaceholders($output, $toSeparatePlaceholders);\r\n} else {\r\n    $output .= $log;\r\n\r\n    if (!empty($tplWrapper) && (!empty($wrapIfEmpty) || !empty($output))) {\r\n        $output = $pdoFetch->getChunk($tplWrapper, array_merge($additionalPlaceholders, [\'output\' => $output]),\r\n            $pdoFetch->config[\'fastMode\']);\r\n    }\r\n\r\n    if (!empty($toPlaceholder)) {\r\n        $modx->setPlaceholder($toPlaceholder, $output);\r\n    } else {\r\n        return $output;\r\n    }\r\n}', 0, 'a:47:{s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:17:\"pdotools_prop_tpl\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"returnIds\";a:7:{s:4:\"name\";s:9:\"returnIds\";s:4:\"desc\";s:23:\"pdotools_prop_returnIds\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"showLog\";a:7:{s:4:\"name\";s:7:\"showLog\";s:4:\"desc\";s:21:\"pdotools_prop_showLog\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"fastMode\";a:7:{s:4:\"name\";s:8:\"fastMode\";s:4:\"desc\";s:22:\"pdotools_prop_fastMode\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"sortby\";a:7:{s:4:\"name\";s:6:\"sortby\";s:4:\"desc\";s:20:\"pdotools_prop_sortby\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:11:\"publishedon\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"sortbyTV\";a:7:{s:4:\"name\";s:8:\"sortbyTV\";s:4:\"desc\";s:22:\"pdotools_prop_sortbyTV\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"sortbyTVType\";a:7:{s:4:\"name\";s:12:\"sortbyTVType\";s:4:\"desc\";s:26:\"pdotools_prop_sortbyTVType\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sortdir\";a:7:{s:4:\"name\";s:7:\"sortdir\";s:4:\"desc\";s:21:\"pdotools_prop_sortdir\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:4:\"text\";s:3:\"ASC\";s:5:\"value\";s:3:\"ASC\";}i:1;a:2:{s:4:\"text\";s:4:\"DESC\";s:5:\"value\";s:4:\"DESC\";}}s:5:\"value\";s:4:\"DESC\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"sortdirTV\";a:7:{s:4:\"name\";s:9:\"sortdirTV\";s:4:\"desc\";s:23:\"pdotools_prop_sortdirTV\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:4:\"text\";s:3:\"ASC\";s:5:\"value\";s:3:\"ASC\";}i:1;a:2:{s:4:\"text\";s:4:\"DESC\";s:5:\"value\";s:4:\"DESC\";}}s:5:\"value\";s:3:\"ASC\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:19:\"pdotools_prop_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:10;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"offset\";a:7:{s:4:\"name\";s:6:\"offset\";s:4:\"desc\";s:20:\"pdotools_prop_offset\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"depth\";a:7:{s:4:\"name\";s:5:\"depth\";s:4:\"desc\";s:19:\"pdotools_prop_depth\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:10;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"outputSeparator\";a:7:{s:4:\"name\";s:15:\"outputSeparator\";s:4:\"desc\";s:29:\"pdotools_prop_outputSeparator\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"\n\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"parents\";a:7:{s:4:\"name\";s:7:\"parents\";s:4:\"desc\";s:21:\"pdotools_prop_parents\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"includeContent\";a:7:{s:4:\"name\";s:14:\"includeContent\";s:4:\"desc\";s:28:\"pdotools_prop_includeContent\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"includeTVs\";a:7:{s:4:\"name\";s:10:\"includeTVs\";s:4:\"desc\";s:24:\"pdotools_prop_includeTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"prepareTVs\";a:7:{s:4:\"name\";s:10:\"prepareTVs\";s:4:\"desc\";s:24:\"pdotools_prop_prepareTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"processTVs\";a:7:{s:4:\"name\";s:10:\"processTVs\";s:4:\"desc\";s:24:\"pdotools_prop_processTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tvPrefix\";a:7:{s:4:\"name\";s:8:\"tvPrefix\";s:4:\"desc\";s:22:\"pdotools_prop_tvPrefix\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\"tv.\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"tvFilters\";a:7:{s:4:\"name\";s:9:\"tvFilters\";s:4:\"desc\";s:23:\"pdotools_prop_tvFilters\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:21:\"tvFiltersAndDelimiter\";a:7:{s:4:\"name\";s:21:\"tvFiltersAndDelimiter\";s:4:\"desc\";s:35:\"pdotools_prop_tvFiltersAndDelimiter\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\",\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:20:\"tvFiltersOrDelimiter\";a:7:{s:4:\"name\";s:20:\"tvFiltersOrDelimiter\";s:4:\"desc\";s:34:\"pdotools_prop_tvFiltersOrDelimiter\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:2:\"||\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"where\";a:7:{s:4:\"name\";s:5:\"where\";s:4:\"desc\";s:19:\"pdotools_prop_where\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"showUnpublished\";a:7:{s:4:\"name\";s:15:\"showUnpublished\";s:4:\"desc\";s:29:\"pdotools_prop_showUnpublished\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showDeleted\";a:7:{s:4:\"name\";s:11:\"showDeleted\";s:4:\"desc\";s:25:\"pdotools_prop_showDeleted\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"showHidden\";a:7:{s:4:\"name\";s:10:\"showHidden\";s:4:\"desc\";s:24:\"pdotools_prop_showHidden\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"hideContainers\";a:7:{s:4:\"name\";s:14:\"hideContainers\";s:4:\"desc\";s:28:\"pdotools_prop_hideContainers\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"context\";a:7:{s:4:\"name\";s:7:\"context\";s:4:\"desc\";s:21:\"pdotools_prop_context\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:3:\"idx\";a:7:{s:4:\"name\";s:3:\"idx\";s:4:\"desc\";s:17:\"pdotools_prop_idx\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"first\";a:7:{s:4:\"name\";s:5:\"first\";s:4:\"desc\";s:19:\"pdotools_prop_first\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:4:\"last\";a:7:{s:4:\"name\";s:4:\"last\";s:4:\"desc\";s:18:\"pdotools_prop_last\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tplFirst\";a:7:{s:4:\"name\";s:8:\"tplFirst\";s:4:\"desc\";s:22:\"pdotools_prop_tplFirst\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplLast\";a:7:{s:4:\"name\";s:7:\"tplLast\";s:4:\"desc\";s:21:\"pdotools_prop_tplLast\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"tplOdd\";a:7:{s:4:\"name\";s:6:\"tplOdd\";s:4:\"desc\";s:20:\"pdotools_prop_tplOdd\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"tplWrapper\";a:7:{s:4:\"name\";s:10:\"tplWrapper\";s:4:\"desc\";s:24:\"pdotools_prop_tplWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"wrapIfEmpty\";a:7:{s:4:\"name\";s:11:\"wrapIfEmpty\";s:4:\"desc\";s:25:\"pdotools_prop_wrapIfEmpty\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"totalVar\";a:7:{s:4:\"name\";s:8:\"totalVar\";s:4:\"desc\";s:22:\"pdotools_prop_totalVar\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:5:\"total\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"resources\";a:7:{s:4:\"name\";s:9:\"resources\";s:4:\"desc\";s:23:\"pdotools_prop_resources\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"tplCondition\";a:7:{s:4:\"name\";s:12:\"tplCondition\";s:4:\"desc\";s:26:\"pdotools_prop_tplCondition\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"tplOperator\";a:7:{s:4:\"name\";s:11:\"tplOperator\";s:4:\"desc\";s:25:\"pdotools_prop_tplOperator\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:10:{i:0;a:2:{s:4:\"text\";s:11:\"is equal to\";s:5:\"value\";s:2:\"==\";}i:1;a:2:{s:4:\"text\";s:15:\"is not equal to\";s:5:\"value\";s:2:\"!=\";}i:2;a:2:{s:4:\"text\";s:9:\"less than\";s:5:\"value\";s:1:\"<\";}i:3;a:2:{s:4:\"text\";s:21:\"less than or equal to\";s:5:\"value\";s:2:\"<=\";}i:4;a:2:{s:4:\"text\";s:24:\"greater than or equal to\";s:5:\"value\";s:2:\">=\";}i:5;a:2:{s:4:\"text\";s:8:\"is empty\";s:5:\"value\";s:5:\"empty\";}i:6;a:2:{s:4:\"text\";s:12:\"is not empty\";s:5:\"value\";s:6:\"!empty\";}i:7;a:2:{s:4:\"text\";s:7:\"is null\";s:5:\"value\";s:4:\"null\";}i:8;a:2:{s:4:\"text\";s:11:\"is in array\";s:5:\"value\";s:7:\"inarray\";}i:9;a:2:{s:4:\"text\";s:10:\"is between\";s:5:\"value\";s:7:\"between\";}}s:5:\"value\";s:2:\"==\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"conditionalTpls\";a:7:{s:4:\"name\";s:15:\"conditionalTpls\";s:4:\"desc\";s:29:\"pdotools_prop_conditionalTpls\";s:4:\"type\";s:8:\"textarea\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"select\";a:7:{s:4:\"name\";s:6:\"select\";s:4:\"desc\";s:20:\"pdotools_prop_select\";s:4:\"type\";s:8:\"textarea\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:22:\"toSeparatePlaceholders\";a:7:{s:4:\"name\";s:22:\"toSeparatePlaceholders\";s:4:\"desc\";s:36:\"pdotools_prop_toSeparatePlaceholders\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"loadModels\";a:7:{s:4:\"name\";s:10:\"loadModels\";s:4:\"desc\";s:24:\"pdotools_prop_loadModels\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"scheme\";a:7:{s:4:\"name\";s:6:\"scheme\";s:4:\"desc\";s:20:\"pdotools_prop_scheme\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:6:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:4:\"text\";s:14:\"System default\";}i:1;a:2:{s:5:\"value\";i:-1;s:4:\"text\";s:25:\"-1 (relative to site_url)\";}i:2;a:2:{s:5:\"value\";s:4:\"full\";s:4:\"text\";s:40:\"full (absolute, prepended with site_url)\";}i:3;a:2:{s:5:\"value\";s:3:\"abs\";s:4:\"text\";s:39:\"abs (absolute, prepended with base_url)\";}i:4;a:2:{s:5:\"value\";s:4:\"http\";s:4:\"text\";s:38:\"http (absolute, forced to http scheme)\";}i:5;a:2:{s:5:\"value\";s:5:\"https\";s:4:\"text\";s:40:\"https (absolute, forced to https scheme)\";}}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"useWeblinkUrl\";a:7:{s:4:\"name\";s:13:\"useWeblinkUrl\";s:4:\"desc\";s:27:\"pdotools_prop_useWeblinkUrl\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdoresources.php'),
(2, 1, 0, 'pdoUsers', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var pdoFetch $pdoFetch */\r\n/** @var modX $modx */\r\nif (!empty($returnIds)) {\r\n    $scriptProperties[\'return\'] = $return = \'ids\';\r\n} elseif (!isset($return)) {\r\n    $scriptProperties[\'return\'] = $return = \'chunks\';\r\n}\r\n$fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n$path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoFetch = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoFetch->addTime(\'pdoTools loaded\');\r\n\r\n$class = \'modUser\';\r\n$profile = \'modUserProfile\';\r\n$member = \'modUserGroupMember\';\r\n\r\n// Start building \"Where\" expression\r\n$where = [];\r\nif (empty($showInactive)) {\r\n    $where[$class . \'.active\'] = 1;\r\n}\r\nif (empty($showBlocked)) {\r\n    $where[$profile . \'.blocked\'] = 0;\r\n}\r\n\r\n// Add users profiles and groups\r\n$innerJoin = [\r\n    $profile => [\'alias\' => $profile, \'on\' => \"$class.id = $profile.internalKey\"],\r\n];\r\n\r\n// Filter by users, groups and roles\r\n$tmp = [\r\n    \'users\' => [\r\n        \'class\' => $class,\r\n        \'name\' => \'username\',\r\n        \'join\' => $class . \'.id\',\r\n    ],\r\n    \'groups\' => [\r\n        \'class\' => \'modUserGroup\',\r\n        \'name\' => \'name\',\r\n        \'join\' => $member . \'.user_group\',\r\n    ],\r\n    \'roles\' => [\r\n        \'class\' => \'modUserGroupRole\',\r\n        \'name\' => \'name\',\r\n        \'join\' => $member . \'.role\',\r\n    ],\r\n];\r\nforeach ($tmp as $k => $p) {\r\n    if (!empty($$k)) {\r\n        $$k = array_map(\'trim\', explode(\',\', $$k));\r\n        ${$k . \'_in\'} = ${$k . \'_out\'} = $fetch_in = $fetch_out = [];\r\n        foreach ($$k as $v) {\r\n            if (is_numeric($v)) {\r\n                if ($v[0] == \'-\') {\r\n                    ${$k . \'_out\'}[] = abs($v);\r\n                } else {\r\n                    ${$k . \'_in\'}[] = abs($v);\r\n                }\r\n            } else {\r\n                if ($v[0] == \'-\') {\r\n                    $fetch_out[] = $v;\r\n                } else {\r\n                    $fetch_in[] = $v;\r\n                }\r\n            }\r\n        }\r\n\r\n        if (!empty($fetch_in) || !empty($fetch_out)) {\r\n            $q = $modx->newQuery($p[\'class\'], [$p[\'name\'] . \':IN\' => array_merge($fetch_in, $fetch_out)]);\r\n            $q->select(\'id,\' . $p[\'name\']);\r\n            $tstart = microtime(true);\r\n            if ($q->prepare() && $q->stmt->execute()) {\r\n                $modx->queryTime += microtime(true) - $tstart;\r\n                $modx->executedQueries++;\r\n                while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)) {\r\n                    if (in_array($row[$p[\'name\']], $fetch_in)) {\r\n                        ${$k . \'_in\'}[] = $row[\'id\'];\r\n                    } else {\r\n                        ${$k . \'_out\'}[] = $row[\'id\'];\r\n                    }\r\n                }\r\n            }\r\n        }\r\n\r\n        if (!empty(${$k . \'_in\'})) {\r\n            $where[$p[\'join\'] . \':IN\'] = ${$k . \'_in\'};\r\n        }\r\n        if (!empty(${$k . \'_out\'})) {\r\n            $where[$p[\'join\'] . \':NOT IN\'] = ${$k . \'_out\'};\r\n        }\r\n    }\r\n}\r\n\r\nif (!empty($groups_in) || !empty($groups_out) || !empty($roles_in) || !empty($roles_out)) {\r\n    $innerJoin[$member] = [\'alias\' => $member, \'on\' => \"$class.id = $member.member\"];\r\n}\r\n\r\n// Fields to select\r\n$select = [\r\n    $profile => implode(\',\', array_diff(array_keys($modx->getFieldMeta($profile)), [\'sessionid\'])),\r\n    $class => implode(\',\', array_diff(array_keys($modx->getFieldMeta($class)), [\'password\', \'cachepwd\', \'salt\', \'session_stale\', \'remote_key\', \'remote_data\', \'hash_class\'])),\r\n];\r\n\r\n// Add custom parameters\r\nforeach ([\'where\', \'innerJoin\', \'select\'] as $v) {\r\n    if (!empty($scriptProperties[$v])) {\r\n        $tmp = $scriptProperties[$v];\r\n        if (!is_array($tmp)) {\r\n            $tmp = json_decode($tmp, true);\r\n        }\r\n        if (is_array($tmp)) {\r\n            $$v = array_merge($$v, $tmp);\r\n        }\r\n    }\r\n    unset($scriptProperties[$v]);\r\n}\r\n$pdoFetch->addTime(\'Conditions prepared\');\r\n\r\n$default = [\r\n    \'class\' => $class,\r\n    \'innerJoin\' => json_encode($innerJoin),\r\n    \'where\' => json_encode($where),\r\n    \'select\' => json_encode($select),\r\n    \'groupby\' => $class . \'.id\',\r\n    \'sortby\' => $class . \'.id\',\r\n    \'sortdir\' => \'ASC\',\r\n    \'fastMode\' => false,\r\n    \'return\' => $return,\r\n    \'disableConditions\' => true,\r\n];\r\n\r\nif (!empty($users_in) && (empty($scriptProperties[\'sortby\']) || $scriptProperties[\'sortby\'] == $class . \'.id\')) {\r\n    $scriptProperties[\'sortby\'] = \"find_in_set(`$class`.`id`,\'\" . implode(\',\', $users_in) . \"\')\";\r\n    $scriptProperties[\'sortdir\'] = \'\';\r\n}\r\n\r\n// Merge all properties and run!\r\n$pdoFetch->addTime(\'Query parameters ready\');\r\n$pdoFetch->setConfig(array_merge($default, $scriptProperties), false);\r\n$output = $pdoFetch->run();\r\n\r\n$log = \'\';\r\nif ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n    $log .= \'<pre class=\"pdoUsersLog\">\' . print_r($pdoFetch->getTime(), 1) . \'</pre>\';\r\n}\r\n\r\n// Return output\r\nif (!empty($returnIds)) {\r\n    $modx->setPlaceholder(\'pdoUsers.log\', $log);\r\n    if (!empty($toPlaceholder)) {\r\n        $modx->setPlaceholder($toPlaceholder, $output);\r\n    } else {\r\n        return $output;\r\n    }\r\n} elseif ($return === \'data\') {\r\n    return $output;\r\n} elseif (!empty($toSeparatePlaceholders)) {\r\n    $output[\'log\'] = $log;\r\n    $modx->setPlaceholders($output, $toSeparatePlaceholders);\r\n} else {\r\n    $output .= $log;\r\n\r\n    if (!empty($tplWrapper) && (!empty($wrapIfEmpty) || !empty($output))) {\r\n        $output = $pdoFetch->getChunk($tplWrapper, [\'output\' => $output], $pdoFetch->config[\'fastMode\']);\r\n    }\r\n\r\n    if (!empty($toPlaceholder)) {\r\n        $modx->setPlaceholder($toPlaceholder, $output);\r\n    } else {\r\n        return $output;\r\n    }\r\n}', 0, 'a:30:{s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:17:\"pdotools_prop_tpl\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"returnIds\";a:7:{s:4:\"name\";s:9:\"returnIds\";s:4:\"desc\";s:23:\"pdotools_prop_returnIds\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"showLog\";a:7:{s:4:\"name\";s:7:\"showLog\";s:4:\"desc\";s:21:\"pdotools_prop_showLog\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"fastMode\";a:7:{s:4:\"name\";s:8:\"fastMode\";s:4:\"desc\";s:22:\"pdotools_prop_fastMode\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"sortby\";a:7:{s:4:\"name\";s:6:\"sortby\";s:4:\"desc\";s:20:\"pdotools_prop_sortby\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:10:\"modUser.id\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sortdir\";a:7:{s:4:\"name\";s:7:\"sortdir\";s:4:\"desc\";s:21:\"pdotools_prop_sortdir\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:4:\"text\";s:3:\"ASC\";s:5:\"value\";s:3:\"ASC\";}i:1;a:2:{s:4:\"text\";s:4:\"DESC\";s:5:\"value\";s:4:\"DESC\";}}s:5:\"value\";s:3:\"ASC\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:19:\"pdotools_prop_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:10;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"offset\";a:7:{s:4:\"name\";s:6:\"offset\";s:4:\"desc\";s:20:\"pdotools_prop_offset\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"outputSeparator\";a:7:{s:4:\"name\";s:15:\"outputSeparator\";s:4:\"desc\";s:29:\"pdotools_prop_outputSeparator\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"\n\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"groups\";a:7:{s:4:\"name\";s:6:\"groups\";s:4:\"desc\";s:20:\"pdotools_prop_groups\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"roles\";a:7:{s:4:\"name\";s:5:\"roles\";s:4:\"desc\";s:19:\"pdotools_prop_roles\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"users\";a:7:{s:4:\"name\";s:5:\"users\";s:4:\"desc\";s:19:\"pdotools_prop_users\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"where\";a:7:{s:4:\"name\";s:5:\"where\";s:4:\"desc\";s:19:\"pdotools_prop_where\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"showInactive\";a:7:{s:4:\"name\";s:12:\"showInactive\";s:4:\"desc\";s:26:\"pdotools_prop_showInactive\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showBlocked\";a:7:{s:4:\"name\";s:11:\"showBlocked\";s:4:\"desc\";s:25:\"pdotools_prop_showBlocked\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:3:\"idx\";a:7:{s:4:\"name\";s:3:\"idx\";s:4:\"desc\";s:17:\"pdotools_prop_idx\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"first\";a:7:{s:4:\"name\";s:5:\"first\";s:4:\"desc\";s:19:\"pdotools_prop_first\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:4:\"last\";a:7:{s:4:\"name\";s:4:\"last\";s:4:\"desc\";s:18:\"pdotools_prop_last\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tplFirst\";a:7:{s:4:\"name\";s:8:\"tplFirst\";s:4:\"desc\";s:22:\"pdotools_prop_tplFirst\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplLast\";a:7:{s:4:\"name\";s:7:\"tplLast\";s:4:\"desc\";s:21:\"pdotools_prop_tplLast\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"tplOdd\";a:7:{s:4:\"name\";s:6:\"tplOdd\";s:4:\"desc\";s:20:\"pdotools_prop_tplOdd\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"tplWrapper\";a:7:{s:4:\"name\";s:10:\"tplWrapper\";s:4:\"desc\";s:24:\"pdotools_prop_tplWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"wrapIfEmpty\";a:7:{s:4:\"name\";s:11:\"wrapIfEmpty\";s:4:\"desc\";s:25:\"pdotools_prop_wrapIfEmpty\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"totalVar\";a:7:{s:4:\"name\";s:8:\"totalVar\";s:4:\"desc\";s:22:\"pdotools_prop_totalVar\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:5:\"total\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"tplCondition\";a:7:{s:4:\"name\";s:12:\"tplCondition\";s:4:\"desc\";s:26:\"pdotools_prop_tplCondition\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"tplOperator\";a:7:{s:4:\"name\";s:11:\"tplOperator\";s:4:\"desc\";s:25:\"pdotools_prop_tplOperator\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:10:{i:0;a:2:{s:4:\"text\";s:11:\"is equal to\";s:5:\"value\";s:2:\"==\";}i:1;a:2:{s:4:\"text\";s:15:\"is not equal to\";s:5:\"value\";s:2:\"!=\";}i:2;a:2:{s:4:\"text\";s:9:\"less than\";s:5:\"value\";s:1:\"<\";}i:3;a:2:{s:4:\"text\";s:21:\"less than or equal to\";s:5:\"value\";s:2:\"<=\";}i:4;a:2:{s:4:\"text\";s:24:\"greater than or equal to\";s:5:\"value\";s:2:\">=\";}i:5;a:2:{s:4:\"text\";s:8:\"is empty\";s:5:\"value\";s:5:\"empty\";}i:6;a:2:{s:4:\"text\";s:12:\"is not empty\";s:5:\"value\";s:6:\"!empty\";}i:7;a:2:{s:4:\"text\";s:7:\"is null\";s:5:\"value\";s:4:\"null\";}i:8;a:2:{s:4:\"text\";s:11:\"is in array\";s:5:\"value\";s:7:\"inarray\";}i:9;a:2:{s:4:\"text\";s:10:\"is between\";s:5:\"value\";s:7:\"between\";}}s:5:\"value\";s:2:\"==\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"conditionalTpls\";a:7:{s:4:\"name\";s:15:\"conditionalTpls\";s:4:\"desc\";s:29:\"pdotools_prop_conditionalTpls\";s:4:\"type\";s:8:\"textarea\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"select\";a:7:{s:4:\"name\";s:6:\"select\";s:4:\"desc\";s:20:\"pdotools_prop_select\";s:4:\"type\";s:8:\"textarea\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:22:\"toSeparatePlaceholders\";a:7:{s:4:\"name\";s:22:\"toSeparatePlaceholders\";s:4:\"desc\";s:36:\"pdotools_prop_toSeparatePlaceholders\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdousers.php'),
(3, 1, 0, 'pdoCrumbs', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var pdoFetch $pdoFetch */\r\n/** @var modX $modx */\r\n$fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n$path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoFetch = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoFetch->addTime(\'pdoTools loaded\');\r\n\r\nif (!isset($from) || $from == \'\') {\r\n    $from = 0;\r\n}\r\nif (empty($to)) {\r\n    $to = $modx->resource->id;\r\n}\r\nif (empty($direction)) {\r\n    $direction = \'ltr\';\r\n}\r\nif ($outputSeparator == \'&nbsp;&rarr;&nbsp;\' && $direction == \'rtl\') {\r\n    $outputSeparator = \'&nbsp;&larr;&nbsp;\';\r\n}\r\nif ($limit == \'\') {\r\n    $limit = 10;\r\n}\r\n\r\n// For compatibility with BreadCrumb\r\nif (!empty($maxCrumbs)) {\r\n    $limit = $maxCrumbs;\r\n}\r\nif (!empty($containerTpl)) {\r\n    $tplWrapper = $containerTpl;\r\n}\r\nif (!empty($currentCrumbTpl)) {\r\n    $tplCurrent = $currentCrumbTpl;\r\n}\r\nif (!empty($linkCrumbTpl)) {\r\n    $scriptProperties[\'tpl\'] = $linkCrumbTpl;\r\n}\r\nif (!empty($maxCrumbTpl)) {\r\n    $tplMax = $maxCrumbTpl;\r\n}\r\nif (isset($showBreadCrumbsAtHome)) {\r\n    $showAtHome = $showBreadCrumbsAtHome;\r\n}\r\nif (isset($showHomeCrumb)) {\r\n    $showHome = $showHomeCrumb;\r\n}\r\nif (isset($showCurrentCrumb)) {\r\n    $showCurrent = $showCurrentCrumb;\r\n}\r\n// --\r\n$fastMode = !empty($fastMode);\r\n$siteStart = $modx->getOption(\'siteStart\', $scriptProperties, $modx->getOption(\'site_start\'));\r\n\r\nif (empty($showAtHome) && $modx->resource->id == $siteStart) {\r\n    return \'\';\r\n}\r\n\r\n$class = $modx->getOption(\'class\', $scriptProperties, \'modResource\');\r\n// Start building \"Where\" expression\r\n$where = array();\r\nif (empty($showUnpublished) && empty($showUnPub)) {\r\n    $where[\'published\'] = 1;\r\n}\r\nif (empty($showHidden)) {\r\n    $where[\'hidemenu\'] = 0;\r\n}\r\nif (empty($showDeleted)) {\r\n    $where[\'deleted\'] = 0;\r\n}\r\nif (!empty($hideContainers) && empty($showContainer)) {\r\n    $where[\'isfolder\'] = 0;\r\n}\r\n\r\n$resource = ($to == $modx->resource->id)\r\n    ? $modx->resource\r\n    : $modx->getObject($class, $to);\r\n\r\nif (!$resource) {\r\n    $message = \'Could not build breadcrumbs to resource \"\' . $to . \'\"\';\r\n\r\n    return \'\';\r\n}\r\n\r\nif (!empty($customParents)) {\r\n    $customParents = is_array($customParents) ? $customParents : array_map(\'trim\', explode(\',\', $customParents));\r\n    $parents = is_array($customParents) ? array_reverse($customParents) : array();\r\n}\r\nif (empty($parents)) {\r\n    $parents = $modx->getParentIds($resource->id, $limit, array(\'context\' => $resource->get(\'context_key\')));\r\n}\r\nif (!empty($showHome)) {\r\n    $parents[] = $siteStart;\r\n}\r\n\r\n$ids = array($resource->id);\r\nforeach ($parents as $parent) {\r\n    if (!empty($parent)) {\r\n        $ids[] = $parent;\r\n    }\r\n    if (!empty($from) && $parent == $from) {\r\n        break;\r\n    }\r\n}\r\n$where[\'id:IN\'] = $ids;\r\n\r\nif (!empty($exclude)) {\r\n    $where[\'id:NOT IN\'] = array_map(\'trim\', explode(\',\', $exclude));\r\n}\r\n\r\n// Fields to select\r\n$resourceColumns = array_keys($modx->getFieldMeta($class));\r\n$select = array($class => implode(\',\', $resourceColumns));\r\n\r\n// Add custom parameters\r\nforeach (array(\'where\', \'select\') as $v) {\r\n    if (!empty($scriptProperties[$v])) {\r\n        $tmp = $scriptProperties[$v];\r\n        if (!is_array($tmp)) {\r\n            $tmp = json_decode($tmp, true);\r\n        }\r\n        if (is_array($tmp)) {\r\n            $$v = array_merge($$v, $tmp);\r\n        }\r\n    }\r\n    unset($scriptProperties[$v]);\r\n}\r\n$pdoFetch->addTime(\'Conditions prepared\');\r\n\r\n// Default parameters\r\n$default = array(\r\n    \'class\' => $class,\r\n    \'where\' => json_encode($where),\r\n    \'select\' => json_encode($select),\r\n    \'groupby\' => $class . \'.id\',\r\n    \'sortby\' => \"find_in_set(`$class`.`id`,\'\" . implode(\',\', $ids) . \"\')\",\r\n    \'sortdir\' => \'\',\r\n    \'return\' => \'data\',\r\n    \'totalVar\' => \'pdocrumbs.total\',\r\n    \'disableConditions\' => true,\r\n);\r\n\r\n// Merge all properties and run!\r\n$pdoFetch->addTime(\'Query parameters ready\');\r\n$pdoFetch->setConfig(array_merge($default, $scriptProperties), false);\r\n$rows = $pdoFetch->run();\r\n\r\n$output = [];\r\nif (!empty($rows) && is_array($rows)) {\r\n    if (strtolower($direction) == \'ltr\') {\r\n        $rows = array_reverse($rows);\r\n    }\r\n\r\n    foreach ($rows as $row) {\r\n        if (!empty($useWeblinkUrl) && $row[\'class_key\'] == \'modWebLink\') {\r\n            $row[\'link\'] = is_numeric(trim($row[\'content\'], \'[]~ \'))\r\n                ? $pdoFetch->makeUrl((int)trim($row[\'content\'], \'[]~ \'), $row)\r\n                : $row[\'content\'];\r\n        } else {\r\n            $row[\'link\'] = $pdoFetch->makeUrl($row[\'id\'], $row);\r\n        }\r\n\r\n        $row = array_merge(\r\n            $scriptProperties,\r\n            $row,\r\n            [\'idx\' => $pdoFetch->idx++]\r\n        );\r\n        if (empty($row[\'menutitle\'])) {\r\n            $row[\'menutitle\'] = $row[\'pagetitle\'];\r\n        }\r\n\r\n        if (isset($return) && $return === \'data\') {\r\n            $output[] = $row;\r\n            continue;\r\n        }\r\n        if ($row[\'id\'] == $resource->id && empty($showCurrent)) {\r\n            continue;\r\n        } elseif ($row[\'id\'] == $resource->id && !empty($tplCurrent)) {\r\n            $tpl = $tplCurrent;\r\n        } elseif ($row[\'id\'] == $siteStart && !empty($tplHome)) {\r\n            $tpl = $tplHome;\r\n        } else {\r\n            $tpl = $pdoFetch->defineChunk($row);\r\n        }\r\n        $output[] = empty($tpl)\r\n            ? \'<pre>\' . $pdoFetch->getChunk(\'\', $row) . \'</pre>\'\r\n            : $pdoFetch->getChunk($tpl, $row, $fastMode);\r\n    }\r\n}\r\nif (isset($return) && $return === \'data\') {\r\n    return $output;\r\n}\r\n\r\n$pdoFetch->addTime(\'Chunks processed\');\r\n\r\nif (count($output) == 1 && !empty($hideSingle)) {\r\n    $pdoFetch->addTime(\'The only result was hidden, because the parameter \"hideSingle\" activated\');\r\n    $output = array();\r\n}\r\n\r\n$log = \'\';\r\nif ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n    $log .= \'<pre class=\"pdoCrumbsLog\">\' . print_r($pdoFetch->getTime(), 1) . \'</pre>\';\r\n}\r\n\r\nif (!empty($toSeparatePlaceholders)) {\r\n    $output[\'log\'] = $log;\r\n    $modx->setPlaceholders($output, $toSeparatePlaceholders);\r\n} else {\r\n    $output = implode($outputSeparator, $output);\r\n    if ($pdoFetch->idx >= $limit && !empty($tplMax) && !empty($output)) {\r\n        $output = ($direction == \'ltr\')\r\n            ? $pdoFetch->getChunk($tplMax, array(), $fastMode) . $output\r\n            : $output . $pdoFetch->getChunk($tplMax, array(), $fastMode);\r\n    }\r\n    $output .= $log;\r\n\r\n    if (!empty($tplWrapper) && (!empty($wrapIfEmpty) || !empty($output))) {\r\n        $output = $pdoFetch->getChunk($tplWrapper, array(\'output\' => $output, \'crumbs\' => $output), $fastMode);\r\n    }\r\n\r\n    if (!empty($toPlaceholder)) {\r\n        $modx->setPlaceholder($toPlaceholder, $output);\r\n    } else {\r\n        return $output;\r\n    }\r\n}', 0, 'a:31:{s:7:\"showLog\";a:7:{s:4:\"name\";s:7:\"showLog\";s:4:\"desc\";s:21:\"pdotools_prop_showLog\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"fastMode\";a:7:{s:4:\"name\";s:8:\"fastMode\";s:4:\"desc\";s:22:\"pdotools_prop_fastMode\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:4:\"from\";a:7:{s:4:\"name\";s:4:\"from\";s:4:\"desc\";s:18:\"pdotools_prop_from\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:2:\"to\";a:7:{s:4:\"name\";s:2:\"to\";s:4:\"desc\";s:16:\"pdotools_prop_to\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"customParents\";a:7:{s:4:\"name\";s:13:\"customParents\";s:4:\"desc\";s:27:\"pdotools_prop_customParents\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:19:\"pdotools_prop_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:10;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"exclude\";a:7:{s:4:\"name\";s:7:\"exclude\";s:4:\"desc\";s:21:\"pdotools_prop_exclude\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"outputSeparator\";a:7:{s:4:\"name\";s:15:\"outputSeparator\";s:4:\"desc\";s:29:\"pdotools_prop_outputSeparator\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"\n\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"includeTVs\";a:7:{s:4:\"name\";s:10:\"includeTVs\";s:4:\"desc\";s:24:\"pdotools_prop_includeTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"prepareTVs\";a:7:{s:4:\"name\";s:10:\"prepareTVs\";s:4:\"desc\";s:24:\"pdotools_prop_prepareTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"processTVs\";a:7:{s:4:\"name\";s:10:\"processTVs\";s:4:\"desc\";s:24:\"pdotools_prop_processTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tvPrefix\";a:7:{s:4:\"name\";s:8:\"tvPrefix\";s:4:\"desc\";s:22:\"pdotools_prop_tvPrefix\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\"tv.\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"where\";a:7:{s:4:\"name\";s:5:\"where\";s:4:\"desc\";s:19:\"pdotools_prop_where\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"showUnpublished\";a:7:{s:4:\"name\";s:15:\"showUnpublished\";s:4:\"desc\";s:29:\"pdotools_prop_showUnpublished\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showDeleted\";a:7:{s:4:\"name\";s:11:\"showDeleted\";s:4:\"desc\";s:25:\"pdotools_prop_showDeleted\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"showHidden\";a:7:{s:4:\"name\";s:10:\"showHidden\";s:4:\"desc\";s:24:\"pdotools_prop_showHidden\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"hideContainers\";a:7:{s:4:\"name\";s:14:\"hideContainers\";s:4:\"desc\";s:28:\"pdotools_prop_hideContainers\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:17:\"pdotools_prop_tpl\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:79:\"@INLINE <li class=\"breadcrumb-item\"><a href=\"[[+link]]\">[[+menutitle]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"tplCurrent\";a:7:{s:4:\"name\";s:10:\"tplCurrent\";s:4:\"desc\";s:24:\"pdotools_prop_tplCurrent\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:62:\"@INLINE <li class=\"breadcrumb-item active\">[[+menutitle]]</li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"tplMax\";a:7:{s:4:\"name\";s:6:\"tplMax\";s:4:\"desc\";s:20:\"pdotools_prop_tplMax\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:65:\"@INLINE <li class=\"breadcrumb-item disabled\">&nbsp;...&nbsp;</li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplHome\";a:7:{s:4:\"name\";s:7:\"tplHome\";s:4:\"desc\";s:21:\"pdotools_prop_tplHome\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"tplWrapper\";a:7:{s:4:\"name\";s:10:\"tplWrapper\";s:4:\"desc\";s:24:\"pdotools_prop_tplWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:47:\"@INLINE <ol class=\"breadcrumb\">[[+output]]</ol>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"wrapIfEmpty\";a:7:{s:4:\"name\";s:11:\"wrapIfEmpty\";s:4:\"desc\";s:25:\"pdotools_prop_wrapIfEmpty\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showCurrent\";a:7:{s:4:\"name\";s:11:\"showCurrent\";s:4:\"desc\";s:25:\"pdotools_prop_showCurrent\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"showHome\";a:7:{s:4:\"name\";s:8:\"showHome\";s:4:\"desc\";s:22:\"pdotools_prop_showHome\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"showAtHome\";a:7:{s:4:\"name\";s:10:\"showAtHome\";s:4:\"desc\";s:24:\"pdotools_prop_showAtHome\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"hideSingle\";a:7:{s:4:\"name\";s:10:\"hideSingle\";s:4:\"desc\";s:24:\"pdotools_prop_hideSingle\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"direction\";a:7:{s:4:\"name\";s:9:\"direction\";s:4:\"desc\";s:23:\"pdotools_prop_direction\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:5:\"value\";s:3:\"ltr\";s:4:\"text\";s:19:\"Left To Right (ltr)\";}i:1;a:2:{s:5:\"value\";s:3:\"rtl\";s:4:\"text\";s:19:\"Right To Left (rtl)\";}}s:5:\"value\";s:3:\"ltr\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"scheme\";a:7:{s:4:\"name\";s:6:\"scheme\";s:4:\"desc\";s:20:\"pdotools_prop_scheme\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:6:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:4:\"text\";s:14:\"System default\";}i:1;a:2:{s:5:\"value\";i:-1;s:4:\"text\";s:25:\"-1 (relative to site_url)\";}i:2;a:2:{s:5:\"value\";s:4:\"full\";s:4:\"text\";s:40:\"full (absolute, prepended with site_url)\";}i:3;a:2:{s:5:\"value\";s:3:\"abs\";s:4:\"text\";s:39:\"abs (absolute, prepended with base_url)\";}i:4;a:2:{s:5:\"value\";s:4:\"http\";s:4:\"text\";s:38:\"http (absolute, forced to http scheme)\";}i:5;a:2:{s:5:\"value\";s:5:\"https\";s:4:\"text\";s:40:\"https (absolute, forced to https scheme)\";}}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"useWeblinkUrl\";a:7:{s:4:\"name\";s:13:\"useWeblinkUrl\";s:4:\"desc\";s:27:\"pdotools_prop_useWeblinkUrl\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdocrumbs.php');
INSERT INTO `mx_site_snippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `static`, `static_file`) VALUES
(4, 1, 0, 'pdoField', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var modX $modx */\r\nif (!empty($input)) {\r\n    $id = $input;\r\n}\r\nif (!isset($default)) {\r\n    $default = \'\';\r\n}\r\nif (!isset($output)) {\r\n    $output = \'\';\r\n}\r\n$class = $modx->getOption(\'class\', $scriptProperties, \'modResource\', true);\r\n$isResource = $class == \'modResource\' || in_array($class, $modx->getDescendants(\'modResource\'));\r\n\r\nif (empty($field)) {\r\n    $field = \'pagetitle\';\r\n}\r\n$top = isset($top) ? (int)$top : 0;\r\n$topLevel = isset($topLevel) ? (int)$topLevel : 0;\r\nif (!empty($options)) {\r\n    $options = trim($options);\r\n    if ($options[0] == \'{\') {\r\n        $tmp = json_decode($options, true);\r\n        if (is_array($tmp)) {\r\n            extract($tmp);\r\n            $scriptProperties = array_merge($scriptProperties, $tmp);\r\n        }\r\n    } else {\r\n        $field = $options;\r\n    }\r\n}\r\nif (empty($id)) {\r\n    if (!empty($modx->resource)) {\r\n        $id = $modx->resource->id;\r\n    } else {\r\n        return \'You must specify an id of \' . $class;\r\n    }\r\n}\r\nif (!isset($context)) {\r\n    $context = \'\';\r\n}\r\n\r\n// Gets the parent from root of context, if specified\r\nif ($isResource && $id && ($top || $topLevel)) {\r\n    // Select needed context for parents functionality\r\n    if (empty($context)) {\r\n        $q = $modx->newQuery($class, $id);\r\n        $q->select(\'context_key\');\r\n        $tstart = microtime(true);\r\n        if ($q->prepare() && $q->stmt->execute()) {\r\n            $modx->queryTime += microtime(true) - $tstart;\r\n            $modx->executedQueries++;\r\n            $context = $q->stmt->fetch(PDO::FETCH_COLUMN);\r\n        }\r\n    }\r\n    // Original pdoField logic\r\n    if (empty($ultimate)) {\r\n        if ($topLevel) {\r\n            $pids = $modx->getChildIds(0, $topLevel, [\'context\' => $context]);\r\n            $pid = $id;\r\n            while (true) {\r\n                $tmp = $modx->getParentIds($pid, 1, [\'context\' => $context]);\r\n                if (!$pid = current($tmp)) {\r\n                    break;\r\n                } elseif (in_array($pid, $pids)) {\r\n                    $id = $pid;\r\n                    break;\r\n                }\r\n            }\r\n        } elseif ($top) {\r\n            $pid = $id;\r\n            for ($i = 1; $i <= $top; $i++) {\r\n                $tmp = $modx->getParentIds($pid, 1, [\'context\' => $context]);\r\n                if (!$pid = current($tmp)) {\r\n                    break;\r\n                }\r\n                $id = $pid;\r\n            }\r\n        }\r\n    }\r\n    // UltimateParent logic\r\n    // https://github.com/splittingred/UltimateParent/blob/develop/core/components/ultimateparent/snippet.ultimateparent.php\r\n    elseif ($id != $top) {\r\n        $pid = $id;\r\n        $pids = $modx->getParentIds($id, 10, [\'context\' => $context]);\r\n        if (!$topLevel || count($pids) >= $topLevel) {\r\n            while ($parentIds = $modx->getParentIds($id, 1, [\'context\' => $context])) {\r\n                $pid = array_pop($parentIds);\r\n                if ($pid == $top) {\r\n                    break;\r\n                }\r\n                $id = $pid;\r\n                $parentIds = $modx->getParentIds($id, 10, [\'context\' => $context]);\r\n                if ($topLevel && count($parentIds) < $topLevel) {\r\n                    break;\r\n                }\r\n            }\r\n        }\r\n    }\r\n}\r\n\r\n/** @var pdoFetch $pdoFetch */\r\n$fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n$path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoFetch = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoFetch->addTime(\'pdoTools loaded\');\r\n\r\n$where = [$class . \'.id\' => $id];\r\n// Add custom parameters\r\nforeach (array(\'where\') as $v) {\r\n    if (!empty($scriptProperties[$v])) {\r\n        $tmp = $scriptProperties[$v];\r\n        if (!is_array($tmp)) {\r\n            $tmp = json_decode($tmp, true);\r\n        }\r\n        if (is_array($tmp)) {\r\n            $$v = array_merge($$v, $tmp);\r\n        }\r\n    }\r\n    unset($scriptProperties[$v]);\r\n}\r\n$pdoFetch->addTime(\'Conditions prepared\');\r\n\r\n// Fields to select\r\n$resourceColumns = array_keys($modx->getFieldMeta($class));\r\n$field = strtolower($field);\r\nif (in_array($field, $resourceColumns)) {\r\n    $scriptProperties[\'select\'] = [$class => $field];\r\n    $scriptProperties[\'includeTVs\'] = \'\';\r\n} elseif ($isResource) {\r\n    $scriptProperties[\'select\'] = [$class => \'id\'];\r\n    $scriptProperties[\'includeTVs\'] = $field;\r\n}\r\n// Additional default field\r\nif (!empty($default)) {\r\n    $default = strtolower($default);\r\n    if (in_array($default, $resourceColumns)) {\r\n        $scriptProperties[\'select\'][$class] .= \',\' . $default;\r\n    } elseif ($isResource) {\r\n        $scriptProperties[\'includeTVs\'] = empty($scriptProperties[\'includeTVs\'])\r\n            ? $default\r\n            : $scriptProperties[\'includeTVs\'] . \',\' . $default;\r\n    }\r\n}\r\n\r\n$scriptProperties[\'disableConditions\'] = true;\r\nif ($row = $pdoFetch->getObject($class, $where, $scriptProperties)) {\r\n    foreach ($row as $k => $v) {\r\n        if (strtolower($k) == $field && $v != \'\') {\r\n            $output = $v;\r\n            break;\r\n        }\r\n    }\r\n\r\n    if (empty($output) && !empty($default)) {\r\n        foreach ($row as $k => $v) {\r\n            if (strtolower($k) == $default && $v != \'\') {\r\n                $output = $v;\r\n                break;\r\n            }\r\n        }\r\n    }\r\n}\r\n\r\nif (!empty($toPlaceholder)) {\r\n    $modx->setPlaceholder($toPlaceholder, $output);\r\n} else {\r\n    return $output;\r\n}', 0, 'a:12:{s:2:\"id\";a:7:{s:4:\"name\";s:2:\"id\";s:4:\"desc\";s:16:\"pdotools_prop_id\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"field\";a:7:{s:4:\"name\";s:5:\"field\";s:4:\"desc\";s:19:\"pdotools_prop_field\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"pagetitle\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"prepareTVs\";a:7:{s:4:\"name\";s:10:\"prepareTVs\";s:4:\"desc\";s:24:\"pdotools_prop_prepareTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"processTVs\";a:7:{s:4:\"name\";s:10:\"processTVs\";s:4:\"desc\";s:24:\"pdotools_prop_processTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"where\";a:7:{s:4:\"name\";s:5:\"where\";s:4:\"desc\";s:19:\"pdotools_prop_where\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"context\";a:7:{s:4:\"name\";s:7:\"context\";s:4:\"desc\";s:27:\"pdotools_prop_field_context\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:3:\"top\";a:7:{s:4:\"name\";s:3:\"top\";s:4:\"desc\";s:17:\"pdotools_prop_top\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"topLevel\";a:7:{s:4:\"name\";s:8:\"topLevel\";s:4:\"desc\";s:22:\"pdotools_prop_topLevel\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"default\";a:7:{s:4:\"name\";s:7:\"default\";s:4:\"desc\";s:27:\"pdotools_prop_field_default\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"output\";a:7:{s:4:\"name\";s:6:\"output\";s:4:\"desc\";s:26:\"pdotools_prop_field_output\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"ultimate\";a:7:{s:4:\"name\";s:8:\"ultimate\";s:4:\"desc\";s:22:\"pdotools_prop_ultimate\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdofield.php'),
(5, 1, 0, 'pdoSitemap', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var pdoFetch $pdoFetch */\r\n$fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n$path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoFetch = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoFetch->addTime(\'pdoTools loaded\');\r\n\r\n// Default variables\r\nif (empty($tpl)) {\r\n    $tpl = \"@INLINE \\n<url>\\n\\t<loc>[[+url]]</loc>\\n\\t<lastmod>[[+date]]</lastmod>\\n\\t<changefreq>[[+update]]</changefreq>\\n\\t<priority>[[+priority]]</priority>\\n</url>\";\r\n}\r\nif (empty($tplWrapper)) {\r\n    $tplWrapper = \"@INLINE <?xml version=\\\"1.0\\\" encoding=\\\"[[++modx_charset]]\\\"?>\\n<urlset xmlns=\\\"[[+schema]]\\\">\\n[[+output]]\\n</urlset>\";\r\n}\r\nif (empty($sitemapSchema)) {\r\n    $sitemapSchema = \'http://www.sitemaps.org/schemas/sitemap/0.9\';\r\n}\r\nif (empty($outputSeparator)) {\r\n    $outputSeparator = \"\\n\";\r\n}\r\nif (empty($cacheKey)) {\r\n    $scriptProperties[\'cacheKey\'] = \'sitemap/\' . substr(md5(json_encode($scriptProperties)), 0, 6);\r\n}\r\n\r\n// Convert parameters from GoogleSiteMap if exists\r\nif (!empty($itemTpl)) {\r\n    $tpl = $itemTpl;\r\n}\r\nif (!empty($containerTpl)) {\r\n    $tplWrapper = $containerTpl;\r\n}\r\nif (!empty($allowedtemplates)) {\r\n    $scriptProperties[\'templates\'] = $allowedtemplates;\r\n}\r\nif (!empty($maxDepth)) {\r\n    $scriptProperties[\'depth\'] = $maxDepth;\r\n}\r\nif (isset($hideDeleted)) {\r\n    $scriptProperties[\'showDeleted\'] = !$hideDeleted;\r\n}\r\nif (isset($published)) {\r\n    $scriptProperties[\'showUnpublished\'] = !$published;\r\n}\r\nif (isset($searchable)) {\r\n    $scriptProperties[\'showUnsearchable\'] = !$searchable;\r\n}\r\nif (!empty($googleSchema)) {\r\n    $sitemapSchema = $googleSchema;\r\n}\r\nif (!empty($excludeResources)) {\r\n    $tmp = array_map(\'trim\', explode(\',\', $excludeResources));\r\n    foreach ($tmp as $v) {\r\n        if (!empty($scriptProperties[\'resources\'])) {\r\n            $scriptProperties[\'resources\'] .= \',-\' . $v;\r\n        } else {\r\n            $scriptProperties[\'resources\'] = \'-\' . $v;\r\n        }\r\n    }\r\n}\r\nif (!empty($excludeChildrenOf)) {\r\n    $tmp = array_map(\'trim\', explode(\',\', $excludeChildrenOf));\r\n    foreach ($tmp as $v) {\r\n        if (!empty($scriptProperties[\'parents\'])) {\r\n            $scriptProperties[\'parents\'] .= \',-\' . $v;\r\n        } else {\r\n            $scriptProperties[\'parents\'] = \'-\' . $v;\r\n        }\r\n    }\r\n}\r\nif (!empty($startId)) {\r\n    if (!empty($scriptProperties[\'parents\'])) {\r\n        $scriptProperties[\'parents\'] .= \',\' . $startId;\r\n    } else {\r\n        $scriptProperties[\'parents\'] = $startId;\r\n    }\r\n}\r\nif (!empty($sortBy)) {\r\n    $scriptProperties[\'sortby\'] = $sortBy;\r\n}\r\nif (!empty($sortDir)) {\r\n    $scriptProperties[\'sortdir\'] = $sortDir;\r\n}\r\nif (!empty($priorityTV)) {\r\n    if (!empty($scriptProperties[\'includeTVs\'])) {\r\n        $scriptProperties[\'includeTVs\'] .= \',\' . $priorityTV;\r\n    } else {\r\n        $scriptProperties[\'includeTVs\'] = $priorityTV;\r\n    }\r\n}\r\nif (!empty($itemSeparator)) {\r\n    $outputSeparator = $itemSeparator;\r\n}\r\n//---\r\n\r\n\r\n$class = \'modResource\';\r\n$where = [];\r\nif (empty($showHidden)) {\r\n    $where[] = [\r\n        $class . \'.hidemenu\' => 0,\r\n        \'OR:\' . $class . \'.class_key:IN\' => [\'Ticket\', \'Article\'],\r\n    ];\r\n}\r\nif (empty($context)) {\r\n    $scriptProperties[\'context\'] = $modx->context->key;\r\n}\r\n\r\n$select = [$class => \'id,editedon,createdon,context_key,class_key,uri\'];\r\nif (!empty($useWeblinkUrl)) {\r\n    $select[$class] .= \',content\';\r\n}\r\n// Add custom parameters\r\nforeach ([\'where\', \'select\'] as $v) {\r\n    if (!empty($scriptProperties[$v])) {\r\n        $tmp = $scriptProperties[$v];\r\n        if (!is_array($tmp)) {\r\n            $tmp = json_decode($tmp, true);\r\n        }\r\n        if (is_array($tmp)) {\r\n            $$v = array_merge($$v, $tmp);\r\n        }\r\n    }\r\n    unset($scriptProperties[$v]);\r\n}\r\n$pdoFetch->addTime(\'Conditions prepared\');\r\n\r\n// Default parameters\r\n$default = [\r\n    \'class\' => $class,\r\n    \'where\' => json_encode($where),\r\n    \'select\' => json_encode($select),\r\n    \'sortby\' => \"{$class}.parent ASC, {$class}.menuindex\",\r\n    \'sortdir\' => \'ASC\',\r\n    \'return\' => \'data\',\r\n    \'scheme\' => \'full\',\r\n    \'limit\' => 0,\r\n];\r\n// Merge all properties and run!\r\n$pdoFetch->addTime(\'Query parameters ready\');\r\n$pdoFetch->setConfig(array_merge($default, $scriptProperties), false);\r\n\r\nif (!empty($cache)) {\r\n    $data = $pdoFetch->getCache($scriptProperties);\r\n}\r\nif (!isset($return)) {\r\n    $return = \'chunks\';\r\n}\r\nif (empty($data)) {\r\n    $now = time();\r\n    $data = $urls = [];\r\n    $rows = $pdoFetch->run();\r\n    foreach ($rows as $row) {\r\n        if (!empty($useWeblinkUrl) && $row[\'class_key\'] == \'modWebLink\') {\r\n            $row[\'url\'] = is_numeric(trim($row[\'content\'], \'[]~ \'))\r\n                ? $pdoFetch->makeUrl((int)trim($row[\'content\'], \'[]~ \'), $row)\r\n                : $row[\'content\'];\r\n        } else {\r\n            $row[\'url\'] = $pdoFetch->makeUrl($row[\'id\'], $row);\r\n        }\r\n        unset($row[\'content\']);\r\n        $time = !empty($row[\'editedon\'])\r\n            ? $row[\'editedon\']\r\n            : $row[\'createdon\'];\r\n        $row[\'date\'] = date(\'c\', $time);\r\n\r\n        $datediff = floor(($now - $time) / 86400);\r\n        if ($datediff <= 1) {\r\n            $row[\'priority\'] = \'1.0\';\r\n            $row[\'update\'] = \'daily\';\r\n        } elseif (($datediff > 1) && ($datediff <= 7)) {\r\n            $row[\'priority\'] = \'0.75\';\r\n            $row[\'update\'] = \'weekly\';\r\n        } elseif (($datediff > 7) && ($datediff <= 30)) {\r\n            $row[\'priority\'] = \'0.50\';\r\n            $row[\'update\'] = \'weekly\';\r\n        } else {\r\n            $row[\'priority\'] = \'0.25\';\r\n            $row[\'update\'] = \'monthly\';\r\n        }\r\n        if (!empty($priorityTV) && !empty($row[$priorityTV])) {\r\n            $row[\'priority\'] = $row[$priorityTV];\r\n        }\r\n\r\n        // Fix possible duplicates made by modWebLink\r\n        if (!empty($urls[$row[\'url\']])) {\r\n            if ($urls[$row[\'url\']] > $row[\'date\']) {\r\n                continue;\r\n            }\r\n        }\r\n        $urls[$row[\'url\']] = $row[\'date\'];\r\n\r\n        // Add item to output\r\n        if ($return === \'data\') {\r\n            $data[$row[\'url\']] = $row;\r\n        } else {\r\n            $data[$row[\'url\']] = $pdoFetch->parseChunk($tpl, $row);\r\n            if (strpos($data[$row[\'url\']], \'[[\') !== false) {\r\n                $modx->parser->processElementTags(\'\', $data[$row[\'url\']], true, true, \'[[\', \']]\', array(), 10);\r\n            }\r\n        }\r\n    }\r\n    $pdoFetch->addTime(\'Rows processed\');\r\n    if (!empty($cache)) {\r\n        $pdoFetch->setCache($data, $scriptProperties);\r\n    }\r\n}\r\n\r\nif ($return === \'data\') {\r\n    $output = $data;\r\n} else {\r\n    $output = implode($outputSeparator, $data);\r\n    $output = $pdoFetch->getChunk($tplWrapper, [\r\n        \'schema\' => $sitemapSchema,\r\n        \'output\' => $output,\r\n        \'items\' => $output,\r\n    ]);\r\n    $pdoFetch->addTime(\'Rows wrapped\');\r\n\r\n    if ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n        $output .= \'<pre class=\"pdoSitemapLog\">\' . print_r($pdoFetch->getTime(), 1) . \'</pre>\';\r\n    }\r\n}\r\nif (!empty($forceXML)) {\r\n    header(\"Content-Type:text/xml\");\r\n    @session_write_close();\r\n    exit($output);\r\n} else {\r\n    return $output;\r\n}', 0, 'a:24:{s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:17:\"pdotools_prop_tpl\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:145:\"@INLINE <url>\n	<loc>[[+url]]</loc>\n	<lastmod>[[+date]]</lastmod>\n	<changefreq>[[+update]]</changefreq>\n	<priority>[[+priority]]</priority>\n</url>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"tplWrapper\";a:7:{s:4:\"name\";s:10:\"tplWrapper\";s:4:\"desc\";s:24:\"pdotools_prop_tplWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:110:\"@INLINE <?xml version=\"1.0\" encoding=\"[[++modx_charset]]\"?>\n<urlset xmlns=\"[[+schema]]\">\n[[+output]]\n</urlset>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"templates\";a:7:{s:4:\"name\";s:9:\"templates\";s:4:\"desc\";s:23:\"pdotools_prop_templates\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"context\";a:7:{s:4:\"name\";s:7:\"context\";s:4:\"desc\";s:21:\"pdotools_prop_context\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"depth\";a:7:{s:4:\"name\";s:5:\"depth\";s:4:\"desc\";s:19:\"pdotools_prop_depth\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:10;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showDeleted\";a:7:{s:4:\"name\";s:11:\"showDeleted\";s:4:\"desc\";s:25:\"pdotools_prop_showDeleted\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"showHidden\";a:7:{s:4:\"name\";s:10:\"showHidden\";s:4:\"desc\";s:24:\"pdotools_prop_showHidden\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"sitemapSchema\";a:7:{s:4:\"name\";s:13:\"sitemapSchema\";s:4:\"desc\";s:27:\"pdotools_prop_sitemapSchema\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:43:\"http://www.sitemaps.org/schemas/sitemap/0.9\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"showUnpublished\";a:7:{s:4:\"name\";s:15:\"showUnpublished\";s:4:\"desc\";s:29:\"pdotools_prop_showUnpublished\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:16:\"hideUnsearchable\";a:7:{s:4:\"name\";s:16:\"hideUnsearchable\";s:4:\"desc\";s:30:\"pdotools_prop_hideUnsearchable\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"resources\";a:7:{s:4:\"name\";s:9:\"resources\";s:4:\"desc\";s:23:\"pdotools_prop_resources\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"parents\";a:7:{s:4:\"name\";s:7:\"parents\";s:4:\"desc\";s:21:\"pdotools_prop_parents\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"sortby\";a:7:{s:4:\"name\";s:6:\"sortby\";s:4:\"desc\";s:20:\"pdotools_prop_sortby\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"menuindex\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sortdir\";a:7:{s:4:\"name\";s:7:\"sortdir\";s:4:\"desc\";s:21:\"pdotools_prop_sortdir\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\"asc\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"where\";a:7:{s:4:\"name\";s:5:\"where\";s:4:\"desc\";s:19:\"pdotools_prop_where\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"includeTVs\";a:7:{s:4:\"name\";s:10:\"includeTVs\";s:4:\"desc\";s:24:\"pdotools_prop_includeTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"prepareTVs\";a:7:{s:4:\"name\";s:10:\"prepareTVs\";s:4:\"desc\";s:24:\"pdotools_prop_prepareTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"processTVs\";a:7:{s:4:\"name\";s:10:\"processTVs\";s:4:\"desc\";s:24:\"pdotools_prop_processTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"outputSeparator\";a:7:{s:4:\"name\";s:15:\"outputSeparator\";s:4:\"desc\";s:29:\"pdotools_prop_outputSeparator\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"\n\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"forceXML\";a:7:{s:4:\"name\";s:8:\"forceXML\";s:4:\"desc\";s:22:\"pdotools_prop_forceXML\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"useWeblinkUrl\";a:7:{s:4:\"name\";s:13:\"useWeblinkUrl\";s:4:\"desc\";s:27:\"pdotools_prop_useWeblinkUrl\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"cache\";a:7:{s:4:\"name\";s:5:\"cache\";s:4:\"desc\";s:19:\"pdotools_prop_cache\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"cacheKey\";a:7:{s:4:\"name\";s:8:\"cacheKey\";s:4:\"desc\";s:22:\"pdotools_prop_cacheKey\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"cacheTime\";a:7:{s:4:\"name\";s:9:\"cacheTime\";s:4:\"desc\";s:23:\"pdotools_prop_cacheTime\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:600;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdositemap.php'),
(6, 1, 0, 'pdoNeighbors', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var pdoFetch $pdoFetch */\r\n/** @var modX $modx */\r\n$fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n$path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoFetch = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoFetch->addTime(\'pdoTools loaded\');\r\n\r\nif (empty($id)) {\r\n    $id = $modx->resource->id;\r\n}\r\nif (empty($limit)) {\r\n    $limit = 1;\r\n}\r\nif (!isset($outputSeparator)) {\r\n    $outputSeparator = \"\\n\";\r\n}\r\n$fastMode = !empty($fastMode);\r\n\r\n$class = \'modResource\';\r\n$resource = ($id == $modx->resource->id)\r\n    ? $modx->resource\r\n    : $modx->getObject($class, $id);\r\nif (!$resource) {\r\n    return \'\';\r\n}\r\n\r\n// We need to determine ids of neighbors\r\n$params = $scriptProperties;\r\n$params[\'select\'] = \'id\';\r\n$params[\'limit\'] = 0;\r\nif (!empty($parents) && is_string($parents)) {\r\n    $parents = array_map(\'trim\', explode(\',\', $parents));\r\n    if (!in_array($resource->parent, $parents)) {\r\n        $parents[] = $resource->parent;\r\n    }\r\n    $key = array_search($resource->parent * -1, $parents);\r\n    if ($key !== false) {\r\n        unset($parents[$key]);\r\n    }\r\n    $params[\'parents\'] = implode(\',\', $parents);\r\n    $ids = $pdoFetch->getCollection(\'modResource\', [], $params);\r\n    unset($scriptProperties[\'parents\']);\r\n} else {\r\n    $ids = $pdoFetch->getCollection(\'modResource\', [\'parent\' => $resource->parent], $params);\r\n}\r\n\r\n$found = false;\r\n$prev = $next = [];\r\nforeach ($ids as $v) {\r\n    if ($v[\'id\'] == $id) {\r\n        $found = true;\r\n        continue;\r\n    } elseif (!$found) {\r\n        $prev[] = $v[\'id\'];\r\n    } else {\r\n        $next[] = $v[\'id\'];\r\n        if (count($next) >= $limit) {\r\n            break;\r\n        }\r\n    }\r\n}\r\n$prev = array_splice($prev, $limit * -1);\r\nif (!empty($loop)) {\r\n    if (!count($prev)) {\r\n        $v = end($ids);\r\n        $prev[] = $v[\'id\'];\r\n    } else {\r\n        if (!count($next)) {\r\n            $v = reset($ids);\r\n            $next[] = $v[\'id\'];\r\n        }\r\n    }\r\n}\r\n$ids = array_merge($prev, $next, [$resource->parent]);\r\n$pdoFetch->addTime(\'Found ids of neighbors: \' . implode(\',\', $ids));\r\n\r\n// Query conditions\r\n$where = [$class . \'.id:IN\' => $ids];\r\n\r\n// Fields to select\r\n$resourceColumns = array_keys($modx->getFieldMeta($class));\r\nif (empty($includeContent) && empty($useWeblinkUrl)) {\r\n    $key = array_search(\'content\', $resourceColumns);\r\n    unset($resourceColumns[$key]);\r\n}\r\n$select = [$class => implode(\',\', $resourceColumns)];\r\n\r\n// Add custom parameters\r\nforeach ([\'where\', \'select\'] as $v) {\r\n    if (!empty($scriptProperties[$v])) {\r\n        $tmp = $scriptProperties[$v];\r\n        if (!is_array($tmp)) {\r\n            $tmp = json_decode($tmp, true);\r\n        }\r\n        if (is_array($tmp)) {\r\n            $$v = array_merge($$v, $tmp);\r\n        }\r\n    }\r\n    unset($scriptProperties[$v]);\r\n}\r\n$pdoFetch->addTime(\'Conditions prepared\');\r\n\r\n// Default parameters\r\n$default = [\r\n    \'class\' => $class,\r\n    \'where\' => json_encode($where),\r\n    \'select\' => json_encode($select),\r\n    //\'groupby\' => $class.\'.id\',\r\n    \'sortby\' => $class . \'.menuindex\',\r\n    \'sortdir\' => \'ASC\',\r\n    \'return\' => \'data\',\r\n    \'limit\' => 0,\r\n    \'totalVar\' => \'pdoneighbors.total\',\r\n];\r\n\r\n// Merge all properties and run!\r\nunset($scriptProperties[\'limit\']);\r\n$pdoFetch->addTime(\'Query parameters ready\');\r\n$pdoFetch->setConfig(array_merge($default, $scriptProperties), false);\r\n\r\n$rows = $pdoFetch->run();\r\n$prev = array_flip($prev);\r\n$next = array_flip($next);\r\n\r\nif (!isset($return)) {\r\n    $return = \'chunks\';\r\n}\r\n$output = [\'prev\' => [], \'up\' => [], \'next\' => []];\r\nforeach ($rows as $row) {\r\n    if (empty($row[\'menutitle\'])) {\r\n        $row[\'menutitle\'] = $row[\'pagetitle\'];\r\n    }\r\n    if (!empty($useWeblinkUrl) && $row[\'class_key\'] == \'modWebLink\') {\r\n        $row[\'link\'] = is_numeric(trim($row[\'content\'], \'[]~ \'))\r\n            ? $pdoFetch->makeUrl((int)trim($row[\'content\'], \'[]~ \'), $row)\r\n            : $row[\'content\'];\r\n    } else {\r\n        $row[\'link\'] = $pdoFetch->makeUrl($row[\'id\'], $row);\r\n    }\r\n\r\n    if (isset($prev[$row[\'id\']])) {\r\n        if ($return === \'data\') {\r\n            $output[\'prev\'][] = $row;\r\n        } else {\r\n            $output[\'prev\'][] = !empty($tplPrev)\r\n                ? $pdoFetch->getChunk($tplPrev, $row, $fastMode)\r\n                : $pdoFetch->getChunk(\'\', $row);\r\n        }\r\n    } elseif (isset($next[$row[\'id\']])) {\r\n        if ($return === \'data\') {\r\n            $output[\'next\'][] = $row;\r\n        } else {\r\n            $output[\'next\'][] = !empty($tplNext)\r\n                ? $pdoFetch->getChunk($tplNext, $row, $fastMode)\r\n                : $pdoFetch->getChunk(\'\', $row);\r\n        }\r\n    } else {\r\n        if ($return === \'data\') {\r\n            $output[\'up\'][] = $row;\r\n        } else {\r\n            $output[\'up\'][] = !empty($tplUp)\r\n                ? $pdoFetch->getChunk($tplUp, $row, $fastMode)\r\n                : $pdoFetch->getChunk(\'\', $row);\r\n        }\r\n    }\r\n}\r\n$pdoFetch->addTime(\'Chunks processed\');\r\n\r\n$log = \'\';\r\nif ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n    $log .= \'<pre class=\"pdoNeighborsLog\">\' . print_r($pdoFetch->getTime(), 1) . \'</pre>\';\r\n}\r\n\r\nforeach ($output as &$row) {\r\n    $row = implode($outputSeparator, $row);\r\n}\r\n\r\nif (!empty($toSeparatePlaceholders)) {\r\n    $output[\'log\'] = $log;\r\n    $modx->setPlaceholders($output, $toSeparatePlaceholders);\r\n} else {\r\n    if (!empty($rows) || !empty($wrapIfEmpty)) {\r\n        $output = !empty($tplWrapper)\r\n            ? $pdoFetch->getChunk($tplWrapper, $output, $fastMode)\r\n            : $pdoFetch->getChunk(\'\', $output);\r\n    } else {\r\n        $output = \'\';\r\n    }\r\n    $output .= $log;\r\n\r\n    if (!empty($toPlaceholder)) {\r\n        $modx->setPlaceholder($toPlaceholder, $output);\r\n    } else {\r\n        return $output;\r\n    }\r\n}', 0, 'a:27:{s:2:\"id\";a:7:{s:4:\"name\";s:2:\"id\";s:4:\"desc\";s:16:\"pdotools_prop_id\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:29:\"pdotools_prop_neighbors_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"sortby\";a:7:{s:4:\"name\";s:6:\"sortby\";s:4:\"desc\";s:20:\"pdotools_prop_sortby\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"menuindex\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sortdir\";a:7:{s:4:\"name\";s:7:\"sortdir\";s:4:\"desc\";s:21:\"pdotools_prop_sortdir\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\"asc\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"depth\";a:7:{s:4:\"name\";s:5:\"depth\";s:4:\"desc\";s:19:\"pdotools_prop_depth\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplPrev\";a:7:{s:4:\"name\";s:7:\"tplPrev\";s:4:\"desc\";s:21:\"pdotools_prop_tplPrev\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:106:\"@INLINE <span class=\"link-prev\"><a href=\"[[+link]]\" class=\"btn btn-light\">&larr; [[+menutitle]]</a></span>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"tplUp\";a:7:{s:4:\"name\";s:5:\"tplUp\";s:4:\"desc\";s:19:\"pdotools_prop_tplUp\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:104:\"@INLINE <span class=\"link-up\"><a href=\"[[+link]]\" class=\"btn btn-light\">&uarr; [[+menutitle]]</a></span>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplNext\";a:7:{s:4:\"name\";s:7:\"tplNext\";s:4:\"desc\";s:21:\"pdotools_prop_tplNext\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:106:\"@INLINE <span class=\"link-next\"><a href=\"[[+link]]\" class=\"btn btn-light\">[[+menutitle]] &rarr;</a></span>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"tplWrapper\";a:7:{s:4:\"name\";s:10:\"tplWrapper\";s:4:\"desc\";s:34:\"pdotools_prop_neighbors_tplWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:93:\"@INLINE <div class=\"neighbors d-flex justify-content-between\">[[+prev]][[+up]][[+next]]</div>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"wrapIfEmpty\";a:7:{s:4:\"name\";s:11:\"wrapIfEmpty\";s:4:\"desc\";s:25:\"pdotools_prop_wrapIfEmpty\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"showUnpublished\";a:7:{s:4:\"name\";s:15:\"showUnpublished\";s:4:\"desc\";s:29:\"pdotools_prop_showUnpublished\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showDeleted\";a:7:{s:4:\"name\";s:11:\"showDeleted\";s:4:\"desc\";s:25:\"pdotools_prop_showDeleted\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"showHidden\";a:7:{s:4:\"name\";s:10:\"showHidden\";s:4:\"desc\";s:24:\"pdotools_prop_showHidden\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"hideContainers\";a:7:{s:4:\"name\";s:14:\"hideContainers\";s:4:\"desc\";s:28:\"pdotools_prop_hideContainers\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:22:\"toSeparatePlaceholders\";a:7:{s:4:\"name\";s:22:\"toSeparatePlaceholders\";s:4:\"desc\";s:36:\"pdotools_prop_toSeparatePlaceholders\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"parents\";a:7:{s:4:\"name\";s:7:\"parents\";s:4:\"desc\";s:21:\"pdotools_prop_parents\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"outputSeparator\";a:7:{s:4:\"name\";s:15:\"outputSeparator\";s:4:\"desc\";s:29:\"pdotools_prop_outputSeparator\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"\n\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"showLog\";a:7:{s:4:\"name\";s:7:\"showLog\";s:4:\"desc\";s:21:\"pdotools_prop_showLog\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"fastMode\";a:7:{s:4:\"name\";s:8:\"fastMode\";s:4:\"desc\";s:22:\"pdotools_prop_fastMode\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"includeTVs\";a:7:{s:4:\"name\";s:10:\"includeTVs\";s:4:\"desc\";s:24:\"pdotools_prop_includeTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"prepareTVs\";a:7:{s:4:\"name\";s:10:\"prepareTVs\";s:4:\"desc\";s:24:\"pdotools_prop_prepareTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"processTVs\";a:7:{s:4:\"name\";s:10:\"processTVs\";s:4:\"desc\";s:24:\"pdotools_prop_processTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tvPrefix\";a:7:{s:4:\"name\";s:8:\"tvPrefix\";s:4:\"desc\";s:22:\"pdotools_prop_tvPrefix\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\"tv.\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"scheme\";a:7:{s:4:\"name\";s:6:\"scheme\";s:4:\"desc\";s:20:\"pdotools_prop_scheme\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:6:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:4:\"text\";s:14:\"System default\";}i:1;a:2:{s:5:\"value\";i:-1;s:4:\"text\";s:25:\"-1 (relative to site_url)\";}i:2;a:2:{s:5:\"value\";s:4:\"full\";s:4:\"text\";s:40:\"full (absolute, prepended with site_url)\";}i:3;a:2:{s:5:\"value\";s:3:\"abs\";s:4:\"text\";s:39:\"abs (absolute, prepended with base_url)\";}i:4;a:2:{s:5:\"value\";s:4:\"http\";s:4:\"text\";s:38:\"http (absolute, forced to http scheme)\";}i:5;a:2:{s:5:\"value\";s:5:\"https\";s:4:\"text\";s:40:\"https (absolute, forced to https scheme)\";}}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"useWeblinkUrl\";a:7:{s:4:\"name\";s:13:\"useWeblinkUrl\";s:4:\"desc\";s:27:\"pdotools_prop_useWeblinkUrl\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:4:\"loop\";a:7:{s:4:\"name\";s:4:\"loop\";s:4:\"desc\";s:18:\"pdotools_prop_loop\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdoneighbors.php');
INSERT INTO `mx_site_snippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `static`, `static_file`) VALUES
(7, 1, 0, 'pdoPage', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var modX $modx */\r\n// Default variables\r\nif (empty($pageVarKey)) {\r\n    $pageVarKey = \'page\';\r\n}\r\nif (empty($pageNavVar)) {\r\n    $pageNavVar = \'page.nav\';\r\n}\r\nif (empty($pageCountVar)) {\r\n    $pageCountVar = \'pageCount\';\r\n}\r\nif (empty($totalVar)) {\r\n    $totalVar = \'total\';\r\n}\r\nif (empty($page)) {\r\n    $page = 1;\r\n}\r\nif (empty($pageLimit)) {\r\n    $pageLimit = 5;\r\n} else {\r\n    $pageLimit = (integer)$pageLimit;\r\n}\r\nif (!isset($plPrefix)) {\r\n    $plPrefix = \'\';\r\n}\r\nif (!empty($scriptProperties[\'ajaxMode\'])) {\r\n    $scriptProperties[\'ajax\'] = 1;\r\n}\r\n\r\n// Convert parameters from getPage if exists\r\nif (!empty($namespace)) {\r\n    $plPrefix = $namespace;\r\n}\r\nif (!empty($pageNavTpl)) {\r\n    $scriptProperties[\'tplPage\'] = $pageNavTpl;\r\n}\r\nif (!empty($pageNavOuterTpl)) {\r\n    $scriptProperties[\'tplPageWrapper\'] = $pageNavOuterTpl;\r\n}\r\nif (!empty($pageActiveTpl)) {\r\n    $scriptProperties[\'tplPageActive\'] = $pageActiveTpl;\r\n}\r\nif (!empty($pageFirstTpl)) {\r\n    $scriptProperties[\'tplPageFirst\'] = $pageFirstTpl;\r\n}\r\nif (!empty($pagePrevTpl)) {\r\n    $scriptProperties[\'tplPagePrev\'] = $pagePrevTpl;\r\n}\r\nif (!empty($pageNextTpl)) {\r\n    $scriptProperties[\'tplPageNext\'] = $pageNextTpl;\r\n}\r\nif (!empty($pageLastTpl)) {\r\n    $scriptProperties[\'tplPageLast\'] = $pageLastTpl;\r\n}\r\nif (!empty($pageSkipTpl)) {\r\n    $scriptProperties[\'tplPageSkip\'] = $pageSkipTpl;\r\n}\r\nif (!empty($pageNavScheme)) {\r\n    $scriptProperties[\'scheme\'] = $pageNavScheme;\r\n}\r\nif (!empty($cache_expires)) {\r\n    $scriptProperties[\'cacheTime\'] = $cache_expires;\r\n}\r\n//---\r\n$strictMode = !empty($strictMode);\r\n\r\n$isAjax = !empty($scriptProperties[\'ajax\']) && !empty($_SERVER[\'HTTP_X_REQUESTED_WITH\']) && $_SERVER[\'HTTP_X_REQUESTED_WITH\'] == \'XMLHttpRequest\';\r\nif ($isAjax && !isset($_REQUEST[$pageVarKey])) {\r\n    return;\r\n}\r\n\r\n/** @var pdoPage $pdoPage */\r\n$fqn = $modx->getOption(\'pdoPage.class\', null, \'pdotools.pdopage\', true);\r\n$path = $modx->getOption(\'pdopage_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoPage = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoPage->pdoTools->addTime(\'pdoTools loaded\');\r\n\r\n// Script and styles\r\nif (!$isAjax && !empty($scriptProperties[\'ajaxMode\'])) {\r\n    $pdoPage->loadJsCss();\r\n}\r\n// Removing of default scripts and styles so they do not overwrote nested snippet parameters\r\nif ($snippet = $modx->getObject(\'modSnippet\', [\'name\' => \'pdoPage\'])) {\r\n    $properties = $snippet->get(\'properties\');\r\n    if ($scriptProperties[\'frontend_js\'] == $properties[\'frontend_js\'][\'value\']) {\r\n        unset($scriptProperties[\'frontend_js\']);\r\n    }\r\n    if ($scriptProperties[\'frontend_css\'] == $properties[\'frontend_css\'][\'value\']) {\r\n        unset($scriptProperties[\'frontend_css\']);\r\n    }\r\n}\r\n\r\n// Page\r\nif (isset($_REQUEST[$pageVarKey]) && $strictMode && (!is_numeric($_REQUEST[$pageVarKey]) || ($_REQUEST[$pageVarKey] <= 1 && !$isAjax))) {\r\n    return $pdoPage->redirectToFirst($isAjax);\r\n} elseif (!empty($_REQUEST[$pageVarKey])) {\r\n    $page = (integer)$_REQUEST[$pageVarKey];\r\n}\r\n$scriptProperties[\'page\'] = $page;\r\n$scriptProperties[\'request\'] = $_REQUEST;\r\n$scriptProperties[\'setTotal\'] = true;\r\n\r\n// Limit\r\nif (isset($_REQUEST[\'limit\'])) {\r\n    if (is_numeric($_REQUEST[\'limit\']) && abs($_REQUEST[\'limit\']) > 0) {\r\n        $scriptProperties[\'limit\'] = abs($_REQUEST[\'limit\']);\r\n    } elseif ($strictMode) {\r\n        unset($_GET[\'limit\']);\r\n\r\n        return $pdoPage->redirectToFirst($isAjax);\r\n    }\r\n}\r\nif (!empty($maxLimit) && !empty($scriptProperties[\'limit\']) && $scriptProperties[\'limit\'] > $maxLimit) {\r\n    $scriptProperties[\'limit\'] = $maxLimit;\r\n}\r\n\r\n// Offset\r\n$offset = !empty($scriptProperties[\'offset\']) && $scriptProperties[\'offset\'] > 0\r\n    ? (int)$scriptProperties[\'offset\']\r\n    : 0;\r\n$scriptProperties[\'offset\'] = $page > 1\r\n    ? $scriptProperties[\'limit\'] * ($page - 1) + $offset\r\n    : $offset;\r\nif (!empty($scriptProperties[\'offset\']) && empty($scriptProperties[\'limit\'])) {\r\n    $scriptProperties[\'limit\'] = 10000000;\r\n}\r\n\r\n$cache = !empty($cache) || (!$modx->user->id && !empty($cacheAnonymous));\r\n$url = $pdoPage->getBaseUrl();\r\n$output = $pagination = $total = $pageCount = \'\';\r\n\r\n$data = $cache\r\n    ? $pdoPage->pdoTools->getCache($scriptProperties)\r\n    : [];\r\n\r\nif (empty($data)) {\r\n    $output = $pdoPage->pdoTools->runSnippet($scriptProperties[\'element\'], $scriptProperties);\r\n    if ($output === false) {\r\n        return \'\';\r\n    } elseif (!empty($toPlaceholder)) {\r\n        $output = $modx->getPlaceholder($toPlaceholder);\r\n    }\r\n\r\n    // Pagination\r\n    $total = (int)$modx->getPlaceholder($totalVar);\r\n    $pageCount = !empty($scriptProperties[\'limit\']) && $total > $offset\r\n        ? ceil(($total - $offset) / $scriptProperties[\'limit\'])\r\n        : 0;\r\n\r\n    // Redirect to start if somebody specified incorrect page\r\n    if ($page > 1 && $page > $pageCount && $strictMode) {\r\n        return $pdoPage->redirectToFirst($isAjax);\r\n    }\r\n    if (!empty($pageCount) && $pageCount > 1) {\r\n        $pagination = [\r\n            \'first\' => $page > 1 && !empty($tplPageFirst)\r\n                ? $pdoPage->makePageLink($url, 1, $tplPageFirst)\r\n                : \'\',\r\n            \'prev\' => $page > 1 && !empty($tplPagePrev)\r\n                ? $pdoPage->makePageLink($url, $page - 1, $tplPagePrev)\r\n                : \'\',\r\n            \'pages\' => $pageLimit >= 7 && empty($disableModernPagination)\r\n                ? $pdoPage->buildModernPagination($page, $pageCount, $url)\r\n                : $pdoPage->buildClassicPagination($page, $pageCount, $url),\r\n            \'next\' => $page < $pageCount && !empty($tplPageNext)\r\n                ? $pdoPage->makePageLink($url, $page + 1, $tplPageNext)\r\n                : \'\',\r\n            \'last\' => $page < $pageCount && !empty($tplPageLast)\r\n                ? $pdoPage->makePageLink($url, $pageCount, $tplPageLast)\r\n                : \'\',\r\n        ];\r\n\r\n        if (!empty($pageCount)) {\r\n            foreach ([\'first\', \'prev\', \'next\', \'last\'] as $v) {\r\n                $tpl = \'tplPage\' . ucfirst($v) . \'Empty\';\r\n                if (!empty(${$tpl}) && empty($pagination[$v])) {\r\n                    $pagination[$v] = $pdoPage->pdoTools->getChunk(${$tpl});\r\n                }\r\n            }\r\n        }\r\n    } else {\r\n        $pagination = [\r\n            \'first\' => \'\',\r\n            \'prev\' => \'\',\r\n            \'pages\' => \'\',\r\n            \'next\' => \'\',\r\n            \'last\' => \'\'\r\n        ];\r\n    }\r\n\r\n    $data = [\r\n        \'output\' => $output,\r\n        $pageVarKey => $page,\r\n        $pageCountVar => $pageCount,\r\n        $pageNavVar => !empty($tplPageWrapper)\r\n            ? $pdoPage->pdoTools->getChunk($tplPageWrapper, $pagination)\r\n            : $pdoPage->pdoTools->parseChunk(\'\', $pagination),\r\n        $totalVar => $total,\r\n    ];\r\n    if ($cache) {\r\n        $pdoPage->pdoTools->setCache($data, $scriptProperties);\r\n    }\r\n}\r\n\r\nif ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n    $data[\'output\'] .= \'<pre class=\"pdoPageLog\">\' . print_r($pdoPage->pdoTools->getTime(), 1) . \'</pre>\';\r\n}\r\n\r\nif ($isAjax) {\r\n    if ($pageNavVar != \'pagination\') {\r\n        $data[\'pagination\'] = $data[$pageNavVar];\r\n        unset($data[$pageNavVar]);\r\n    }\r\n    if ($pageCountVar != \'pages\') {\r\n        $data[\'pages\'] = (int)$data[$pageCountVar];\r\n        unset($data[$pageCountVar]);\r\n    }\r\n    if ($pageVarKey != \'page\') {\r\n        $data[\'page\'] = (int)$data[$pageVarKey];\r\n        unset($data[$pageVarKey]);\r\n    }\r\n    if ($totalVar != \'total\') {\r\n        $data[\'total\'] = (int)$data[$totalVar];\r\n        unset($data[$totalVar]);\r\n    }\r\n\r\n    $maxIterations = (integer)$modx->getOption(\'parser_max_iterations\', null, 10);\r\n    $modx->getParser()->processElementTags(\'\', $data[\'output\'], false, false, \'[[\', \']]\', [], $maxIterations);\r\n    $modx->getParser()->processElementTags(\'\', $data[\'output\'], true, true, \'[[\', \']]\', [], $maxIterations);\r\n\r\n    @session_write_close();\r\n    exit(json_encode($data));\r\n} else {\r\n    if (!empty($setMeta)) {\r\n        $charset = $modx->getOption(\'modx_charset\', null, \'UTF-8\');\r\n        $canurl = $pdoPage->pdoTools->config[\'scheme\'] !== \'full\'\r\n            ? rtrim($modx->getOption(\'site_url\'), \'/\') . \'/\' . ltrim($url, \'/\')\r\n            : $url;\r\n        $modx->regClientStartupHTMLBlock(\'<link rel=\"canonical\" href=\"\' . htmlentities($canurl, ENT_QUOTES, $charset) . \'\"/>\');\r\n        if ($data[$pageVarKey] > 1) {\r\n            $prevUrl = $pdoPage->makePageLink($canurl, $data[$pageVarKey] - 1);\r\n            $modx->regClientStartupHTMLBlock(\r\n                \'<link rel=\"prev\" href=\"\' . htmlentities($prevUrl, ENT_QUOTES, $charset) . \'\"/>\'\r\n            );\r\n        }\r\n        if ($data[$pageVarKey] < $data[$pageCountVar]) {\r\n            $nextUrl = $pdoPage->makePageLink($canurl, $data[$pageVarKey] + 1);\r\n            $modx->regClientStartupHTMLBlock(\r\n                \'<link rel=\"next\" href=\"\' . htmlentities($nextUrl, ENT_QUOTES, $charset) . \'\"/>\'\r\n            );\r\n        }\r\n    }\r\n\r\n    $modx->setPlaceholders($data, $plPrefix);\r\n    if (!empty($toPlaceholder)) {\r\n        $modx->setPlaceholder($toPlaceholder, $data[\'output\']);\r\n    } else {\r\n        return $data[\'output\'];\r\n    }\r\n}', 0, 'a:41:{s:8:\"plPrefix\";a:7:{s:4:\"name\";s:8:\"plPrefix\";s:4:\"desc\";s:22:\"pdotools_prop_plPrefix\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:19:\"pdotools_prop_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:10;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"maxLimit\";a:7:{s:4:\"name\";s:8:\"maxLimit\";s:4:\"desc\";s:22:\"pdotools_prop_maxLimit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:100;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"offset\";a:7:{s:4:\"name\";s:6:\"offset\";s:4:\"desc\";s:20:\"pdotools_prop_offset\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:4:\"page\";a:7:{s:4:\"name\";s:4:\"page\";s:4:\"desc\";s:18:\"pdotools_prop_page\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"pageVarKey\";a:7:{s:4:\"name\";s:10:\"pageVarKey\";s:4:\"desc\";s:24:\"pdotools_prop_pageVarKey\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:4:\"page\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"totalVar\";a:7:{s:4:\"name\";s:8:\"totalVar\";s:4:\"desc\";s:22:\"pdotools_prop_totalVar\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:10:\"page.total\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"pageLimit\";a:7:{s:4:\"name\";s:9:\"pageLimit\";s:4:\"desc\";s:23:\"pdotools_prop_pageLimit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:5;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"element\";a:7:{s:4:\"name\";s:7:\"element\";s:4:\"desc\";s:21:\"pdotools_prop_element\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:12:\"pdoResources\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"pageNavVar\";a:7:{s:4:\"name\";s:10:\"pageNavVar\";s:4:\"desc\";s:24:\"pdotools_prop_pageNavVar\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:8:\"page.nav\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"pageCountVar\";a:7:{s:4:\"name\";s:12:\"pageCountVar\";s:4:\"desc\";s:26:\"pdotools_prop_pageCountVar\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"pageCount\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"pageLinkScheme\";a:7:{s:4:\"name\";s:14:\"pageLinkScheme\";s:4:\"desc\";s:28:\"pdotools_prop_pageLinkScheme\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplPage\";a:7:{s:4:\"name\";s:7:\"tplPage\";s:4:\"desc\";s:21:\"pdotools_prop_tplPage\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:88:\"@INLINE <li class=\"page-item\"><a class=\"page-link\" href=\"[[+href]]\">[[+pageNo]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"tplPageWrapper\";a:7:{s:4:\"name\";s:14:\"tplPageWrapper\";s:4:\"desc\";s:28:\"pdotools_prop_tplPageWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:83:\"@INLINE <ul class=\"pagination\">[[+first]][[+prev]][[+pages]][[+next]][[+last]]</ul>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"tplPageActive\";a:7:{s:4:\"name\";s:13:\"tplPageActive\";s:4:\"desc\";s:27:\"pdotools_prop_tplPageActive\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:95:\"@INLINE <li class=\"page-item active\"><a class=\"page-link\" href=\"[[+href]]\">[[+pageNo]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"tplPageFirst\";a:7:{s:4:\"name\";s:12:\"tplPageFirst\";s:4:\"desc\";s:26:\"pdotools_prop_tplPageFirst\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:95:\"@INLINE <li class=\"page-item\"><a class=\"page-link\" href=\"[[+href]]\">[[%pdopage_first]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"tplPageLast\";a:7:{s:4:\"name\";s:11:\"tplPageLast\";s:4:\"desc\";s:25:\"pdotools_prop_tplPageLast\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:94:\"@INLINE <li class=\"page-item\"><a class=\"page-link\" href=\"[[+href]]\">[[%pdopage_last]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"tplPagePrev\";a:7:{s:4:\"name\";s:11:\"tplPagePrev\";s:4:\"desc\";s:25:\"pdotools_prop_tplPagePrev\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:84:\"@INLINE <li class=\"page-item\"><a class=\"page-link\" href=\"[[+href]]\">&laquo;</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"tplPageNext\";a:7:{s:4:\"name\";s:11:\"tplPageNext\";s:4:\"desc\";s:25:\"pdotools_prop_tplPageNext\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:84:\"@INLINE <li class=\"page-item\"><a class=\"page-link\" href=\"[[+href]]\">&raquo;</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"tplPageSkip\";a:7:{s:4:\"name\";s:11:\"tplPageSkip\";s:4:\"desc\";s:25:\"pdotools_prop_tplPageSkip\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:81:\"@INLINE <li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\">...</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:17:\"tplPageFirstEmpty\";a:7:{s:4:\"name\";s:17:\"tplPageFirstEmpty\";s:4:\"desc\";s:31:\"pdotools_prop_tplPageFirstEmpty\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:96:\"@INLINE <li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\">[[%pdopage_first]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:16:\"tplPageLastEmpty\";a:7:{s:4:\"name\";s:16:\"tplPageLastEmpty\";s:4:\"desc\";s:30:\"pdotools_prop_tplPageLastEmpty\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:95:\"@INLINE <li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\">[[%pdopage_last]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:16:\"tplPagePrevEmpty\";a:7:{s:4:\"name\";s:16:\"tplPagePrevEmpty\";s:4:\"desc\";s:30:\"pdotools_prop_tplPagePrevEmpty\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:85:\"@INLINE <li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\">&laquo;</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:16:\"tplPageNextEmpty\";a:7:{s:4:\"name\";s:16:\"tplPageNextEmpty\";s:4:\"desc\";s:30:\"pdotools_prop_tplPageNextEmpty\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:85:\"@INLINE <li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\">&raquo;</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"cache\";a:7:{s:4:\"name\";s:5:\"cache\";s:4:\"desc\";s:19:\"pdotools_prop_cache\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"cacheTime\";a:7:{s:4:\"name\";s:9:\"cacheTime\";s:4:\"desc\";s:23:\"pdotools_prop_cacheTime\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:3600;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"cacheAnonymous\";a:7:{s:4:\"name\";s:14:\"cacheAnonymous\";s:4:\"desc\";s:28:\"pdotools_prop_cacheAnonymous\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:4:\"ajax\";a:7:{s:4:\"name\";s:4:\"ajax\";s:4:\"desc\";s:18:\"pdotools_prop_ajax\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"ajaxMode\";a:7:{s:4:\"name\";s:8:\"ajaxMode\";s:4:\"desc\";s:22:\"pdotools_prop_ajaxMode\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:4:\"text\";s:4:\"None\";s:5:\"value\";s:0:\"\";}i:1;a:2:{s:4:\"text\";s:7:\"Default\";s:5:\"value\";s:7:\"default\";}i:2;a:2:{s:4:\"text\";s:6:\"Scroll\";s:5:\"value\";s:6:\"scroll\";}i:3;a:2:{s:4:\"text\";s:6:\"Button\";s:5:\"value\";s:6:\"button\";}}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"ajaxElemWrapper\";a:7:{s:4:\"name\";s:15:\"ajaxElemWrapper\";s:4:\"desc\";s:29:\"pdotools_prop_ajaxElemWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:8:\"#pdopage\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"ajaxElemRows\";a:7:{s:4:\"name\";s:12:\"ajaxElemRows\";s:4:\"desc\";s:26:\"pdotools_prop_ajaxElemRows\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:14:\"#pdopage .rows\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:18:\"ajaxElemPagination\";a:7:{s:4:\"name\";s:18:\"ajaxElemPagination\";s:4:\"desc\";s:32:\"pdotools_prop_ajaxElemPagination\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:20:\"#pdopage .pagination\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"ajaxElemLink\";a:7:{s:4:\"name\";s:12:\"ajaxElemLink\";s:4:\"desc\";s:26:\"pdotools_prop_ajaxElemLink\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:22:\"#pdopage .pagination a\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"ajaxElemMore\";a:7:{s:4:\"name\";s:12:\"ajaxElemMore\";s:4:\"desc\";s:26:\"pdotools_prop_ajaxElemMore\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:18:\"#pdopage .btn-more\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"ajaxTplMore\";a:7:{s:4:\"name\";s:11:\"ajaxTplMore\";s:4:\"desc\";s:25:\"pdotools_prop_ajaxTplMore\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:75:\"@INLINE <button class=\"btn btn-primary btn-more\">[[%pdopage_more]]</button>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"ajaxHistory\";a:7:{s:4:\"name\";s:11:\"ajaxHistory\";s:4:\"desc\";s:25:\"pdotools_prop_ajaxHistory\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:3:{i:0;a:2:{s:4:\"text\";s:4:\"Auto\";s:5:\"value\";s:0:\"\";}i:1;a:2:{s:4:\"text\";s:7:\"Enabled\";s:5:\"value\";i:1;}i:2;a:2:{s:4:\"text\";s:8:\"Disabled\";s:5:\"value\";i:0;}}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"frontend_js\";a:7:{s:4:\"name\";s:11:\"frontend_js\";s:4:\"desc\";s:25:\"pdotools_prop_frontend_js\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:31:\"[[+assetsUrl]]js/pdopage.min.js\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"frontend_css\";a:7:{s:4:\"name\";s:12:\"frontend_css\";s:4:\"desc\";s:26:\"pdotools_prop_frontend_css\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:33:\"[[+assetsUrl]]css/pdopage.min.css\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"setMeta\";a:7:{s:4:\"name\";s:7:\"setMeta\";s:4:\"desc\";s:21:\"pdotools_prop_setMeta\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"strictMode\";a:7:{s:4:\"name\";s:10:\"strictMode\";s:4:\"desc\";s:24:\"pdotools_prop_strictMode\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdopage.php'),
(8, 1, 0, 'pdoMenu', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var modX $modx */\r\n\r\n// Convert parameters from Wayfinder if exists\r\nif (isset($startId)) {\r\n    $scriptProperties[\'parents\'] = $startId;\r\n}\r\nif (!empty($includeDocs)) {\r\n    $tmp = array_map(\'trim\', explode(\',\', $includeDocs));\r\n    foreach ($tmp as $v) {\r\n        if (!empty($scriptProperties[\'resources\'])) {\r\n            $scriptProperties[\'resources\'] .= \',\' . $v;\r\n        } else {\r\n            $scriptProperties[\'resources\'] = $v;\r\n        }\r\n    }\r\n}\r\nif (!empty($excludeDocs)) {\r\n    $tmp = array_map(\'trim\', explode(\',\', $excludeDocs));\r\n    foreach ($tmp as $v) {\r\n        if (!empty($scriptProperties[\'resources\'])) {\r\n            $scriptProperties[\'resources\'] .= \',-\' . $v;\r\n        } else {\r\n            $scriptProperties[\'resources\'] = \'-\' . $v;\r\n        }\r\n    }\r\n}\r\n\r\nif (!empty($previewUnpublished) && $modx->hasPermission(\'view_unpublished\')) {\r\n    $scriptProperties[\'showUnpublished\'] = 1;\r\n}\r\n\r\n$scriptProperties[\'depth\'] = empty($level) ? 100 : abs($level) - 1;\r\nif (!empty($contexts)) {\r\n    $scriptProperties[\'context\'] = $contexts;\r\n}\r\nif (empty($scriptProperties[\'context\'])) {\r\n    $scriptProperties[\'context\'] = $modx->resource->context_key;\r\n}\r\n\r\n// Save original parents specified by user\r\n$specified_parents = array_map(\'trim\', explode(\',\', $scriptProperties[\'parents\']));\r\n\r\nif ($scriptProperties[\'parents\'] === \'\') {\r\n    $scriptProperties[\'parents\'] = $modx->resource->id;\r\n} elseif ($scriptProperties[\'parents\'] === 0 || $scriptProperties[\'parents\'] === \'0\') {\r\n    if ($scriptProperties[\'depth\'] !== \'\' && $scriptProperties[\'depth\'] !== 100) {\r\n        $contexts = array_map(\'trim\', explode(\',\', $scriptProperties[\'context\']));\r\n        $parents = array();\r\n        if (!empty($scriptProperties[\'showDeleted\'])) {\r\n            /** @var pdoFetch $pdoFetch */\r\n            $pdoFetch = $modx->getService(\'pdoFetch\');\r\n            foreach ($contexts as $ctx) {\r\n                $parents = array_merge($parents, $pdoFetch->getChildIds(\'modResource\', 0, $scriptProperties[\'depth\'], array(\'context\' => $ctx)));\r\n            }\r\n        } else {\r\n            foreach ($contexts as $ctx) {\r\n                $parents = array_merge($parents, $modx->getChildIds(0, $scriptProperties[\'depth\'], array(\'context\' => $ctx)));\r\n            }\r\n        }\r\n        $scriptProperties[\'parents\'] = !empty($parents) ? implode(\',\', $parents) : \'+0\';\r\n        $scriptProperties[\'depth\'] = 0;\r\n    }\r\n    $scriptProperties[\'includeParents\'] = 1;\r\n    $scriptProperties[\'displayStart\'] = 0;\r\n} else {\r\n    $parents = array_map(\'trim\', explode(\',\', $scriptProperties[\'parents\']));\r\n    $parents_in = $parents_out = array();\r\n    foreach ($parents as $v) {\r\n        if (!is_numeric($v)) {\r\n            continue;\r\n        }\r\n        if ($v[0] == \'-\') {\r\n            $parents_out[] = abs($v);\r\n        } else {\r\n            $parents_in[] = abs($v);\r\n        }\r\n    }\r\n\r\n    if (empty($parents_in)) {\r\n        $scriptProperties[\'includeParents\'] = 1;\r\n        $scriptProperties[\'displayStart\'] = 0;\r\n    }\r\n}\r\n\r\nif (!empty($displayStart)) {\r\n    $scriptProperties[\'includeParents\'] = 1;\r\n}\r\nif (!empty($ph)) {\r\n    $toPlaceholder = $ph;\r\n}\r\nif (!empty($sortOrder)) {\r\n    $scriptProperties[\'sortdir\'] = $sortOrder;\r\n}\r\nif (!empty($sortBy)) {\r\n    $scriptProperties[\'sortby\'] = $sortBy;\r\n}\r\nif (!empty($permissions)) {\r\n    $scriptProperties[\'checkPermissions\'] = $permissions;\r\n}\r\nif (!empty($cacheResults)) {\r\n    $scriptProperties[\'cache\'] = $cacheResults;\r\n}\r\nif (!empty($ignoreHidden)) {\r\n    $scriptProperties[\'showHidden\'] = $ignoreHidden;\r\n}\r\n\r\n$wfTemplates = array(\r\n    \'outerTpl\' => \'tplOuter\',\r\n    \'rowTpl\' => \'tpl\',\r\n    \'parentRowTpl\' => \'tplParentRow\',\r\n    \'parentRowHereTpl\' => \'tplParentRowHere\',\r\n    \'hereTpl\' => \'tplHere\',\r\n    \'innerTpl\' => \'tplInner\',\r\n    \'innerRowTpl\' => \'tplInnerRow\',\r\n    \'innerHereTpl\' => \'tplInnerHere\',\r\n    \'activeParentRowTpl\' => \'tplParentRowActive\',\r\n    \'categoryFoldersTpl\' => \'tplCategoryFolder\',\r\n    \'startItemTpl\' => \'tplStart\',\r\n);\r\nforeach ($wfTemplates as $k => $v) {\r\n    if (isset(${$k})) {\r\n        $scriptProperties[$v] = ${$k};\r\n    }\r\n}\r\n//---\r\n\r\n/** @var pdoMenu $pdoMenu */\r\n$fqn = $modx->getOption(\'pdoMenu.class\', null, \'pdotools.pdomenu\', true);\r\n$path = $modx->getOption(\'pdomenu_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoMenu = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoMenu->pdoTools->addTime(\'pdoTools loaded\');\r\n\r\n$cache = !empty($cache) || (!$modx->user->id && !empty($cacheAnonymous));\r\nif (empty($scriptProperties[\'cache_key\'])) {\r\n    $scriptProperties[\'cache_key\'] = \'pdomenu/\' . sha1(serialize($scriptProperties));\r\n}\r\n\r\n$output = \'\';\r\n$tree = array();\r\nif ($cache) {\r\n    $tree = $pdoMenu->pdoTools->getCache($scriptProperties);\r\n}\r\nif (empty($tree)) {\r\n    $data = $pdoMenu->pdoTools->run();\r\n    $data = $pdoMenu->pdoTools->buildTree($data, \'id\', \'parent\', $specified_parents);\r\n    $tree = array();\r\n    foreach ($data as $k => $v) {\r\n        if (empty($v[\'id\'])) {\r\n            if (!in_array($k, $specified_parents) && !$pdoMenu->checkResource($k)) {\r\n                continue;\r\n            } else {\r\n                $tree = array_merge($tree, $v[\'children\']);\r\n            }\r\n        } else {\r\n            $tree[$k] = $v;\r\n        }\r\n    }\r\n    if ($cache) {\r\n        $pdoMenu->pdoTools->setCache($tree, $scriptProperties);\r\n    }\r\n}\r\nif (isset($return) && $return === \'data\') {\r\n    return $tree;\r\n}\r\nif (!empty($tree)) {\r\n    $output = $pdoMenu->templateTree($tree);\r\n}\r\n\r\nif ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n    $output .= \'<pre class=\"pdoMenuLog\">\' . print_r($pdoMenu->pdoTools->getTime(), 1) . \'</pre>\';\r\n}\r\n\r\nif (!empty($toPlaceholder)) {\r\n    $modx->setPlaceholder($toPlaceholder, $output);\r\n} else {\r\n    return $output;\r\n}', 0, 'a:51:{s:7:\"showLog\";a:7:{s:4:\"name\";s:7:\"showLog\";s:4:\"desc\";s:21:\"pdotools_prop_showLog\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"fastMode\";a:7:{s:4:\"name\";s:8:\"fastMode\";s:4:\"desc\";s:22:\"pdotools_prop_fastMode\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"level\";a:7:{s:4:\"name\";s:5:\"level\";s:4:\"desc\";s:19:\"pdotools_prop_level\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"parents\";a:7:{s:4:\"name\";s:7:\"parents\";s:4:\"desc\";s:21:\"pdotools_prop_parents\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"displayStart\";a:7:{s:4:\"name\";s:12:\"displayStart\";s:4:\"desc\";s:26:\"pdotools_prop_displayStart\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"resources\";a:7:{s:4:\"name\";s:9:\"resources\";s:4:\"desc\";s:23:\"pdotools_prop_resources\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"templates\";a:7:{s:4:\"name\";s:9:\"templates\";s:4:\"desc\";s:23:\"pdotools_prop_templates\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"context\";a:7:{s:4:\"name\";s:7:\"context\";s:4:\"desc\";s:21:\"pdotools_prop_context\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"cache\";a:7:{s:4:\"name\";s:5:\"cache\";s:4:\"desc\";s:19:\"pdotools_prop_cache\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"cacheTime\";a:7:{s:4:\"name\";s:9:\"cacheTime\";s:4:\"desc\";s:23:\"pdotools_prop_cacheTime\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:3600;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"cacheAnonymous\";a:7:{s:4:\"name\";s:14:\"cacheAnonymous\";s:4:\"desc\";s:28:\"pdotools_prop_cacheAnonymous\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"plPrefix\";a:7:{s:4:\"name\";s:8:\"plPrefix\";s:4:\"desc\";s:22:\"pdotools_prop_plPrefix\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\"wf.\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"showHidden\";a:7:{s:4:\"name\";s:10:\"showHidden\";s:4:\"desc\";s:24:\"pdotools_prop_showHidden\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"showUnpublished\";a:7:{s:4:\"name\";s:15:\"showUnpublished\";s:4:\"desc\";s:29:\"pdotools_prop_showUnpublished\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showDeleted\";a:7:{s:4:\"name\";s:11:\"showDeleted\";s:4:\"desc\";s:25:\"pdotools_prop_showDeleted\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:18:\"previewUnpublished\";a:7:{s:4:\"name\";s:18:\"previewUnpublished\";s:4:\"desc\";s:32:\"pdotools_prop_previewUnpublished\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"hideSubMenus\";a:7:{s:4:\"name\";s:12:\"hideSubMenus\";s:4:\"desc\";s:26:\"pdotools_prop_hideSubMenus\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"useWeblinkUrl\";a:7:{s:4:\"name\";s:13:\"useWeblinkUrl\";s:4:\"desc\";s:27:\"pdotools_prop_useWeblinkUrl\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sortdir\";a:7:{s:4:\"name\";s:7:\"sortdir\";s:4:\"desc\";s:21:\"pdotools_prop_sortdir\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:4:\"text\";s:3:\"ASC\";s:5:\"value\";s:3:\"ASC\";}i:1;a:2:{s:4:\"text\";s:4:\"DESC\";s:5:\"value\";s:4:\"DESC\";}}s:5:\"value\";s:3:\"ASC\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"sortby\";a:7:{s:4:\"name\";s:6:\"sortby\";s:4:\"desc\";s:20:\"pdotools_prop_sortby\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"menuindex\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:19:\"pdotools_prop_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"offset\";a:7:{s:4:\"name\";s:6:\"offset\";s:4:\"desc\";s:20:\"pdotools_prop_offset\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"rowIdPrefix\";a:7:{s:4:\"name\";s:11:\"rowIdPrefix\";s:4:\"desc\";s:25:\"pdotools_prop_rowIdPrefix\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"firstClass\";a:7:{s:4:\"name\";s:10:\"firstClass\";s:4:\"desc\";s:24:\"pdotools_prop_firstClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:5:\"first\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"lastClass\";a:7:{s:4:\"name\";s:9:\"lastClass\";s:4:\"desc\";s:23:\"pdotools_prop_lastClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:4:\"last\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"hereClass\";a:7:{s:4:\"name\";s:9:\"hereClass\";s:4:\"desc\";s:23:\"pdotools_prop_hereClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:6:\"active\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"parentClass\";a:7:{s:4:\"name\";s:11:\"parentClass\";s:4:\"desc\";s:25:\"pdotools_prop_parentClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"rowClass\";a:7:{s:4:\"name\";s:8:\"rowClass\";s:4:\"desc\";s:22:\"pdotools_prop_rowClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"outerClass\";a:7:{s:4:\"name\";s:10:\"outerClass\";s:4:\"desc\";s:24:\"pdotools_prop_outerClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"innerClass\";a:7:{s:4:\"name\";s:10:\"innerClass\";s:4:\"desc\";s:24:\"pdotools_prop_innerClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"levelClass\";a:7:{s:4:\"name\";s:10:\"levelClass\";s:4:\"desc\";s:24:\"pdotools_prop_levelClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"selfClass\";a:7:{s:4:\"name\";s:9:\"selfClass\";s:4:\"desc\";s:23:\"pdotools_prop_selfClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"webLinkClass\";a:7:{s:4:\"name\";s:12:\"webLinkClass\";s:4:\"desc\";s:26:\"pdotools_prop_webLinkClass\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tplOuter\";a:7:{s:4:\"name\";s:8:\"tplOuter\";s:4:\"desc\";s:22:\"pdotools_prop_tplOuter\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:41:\"@INLINE <ul[[+classes]]>[[+wrapper]]</ul>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:17:\"pdotools_prop_tpl\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:95:\"@INLINE <li[[+classes]]><a href=\"[[+link]]\" [[+attributes]]>[[+menutitle]]</a>[[+wrapper]]</li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"tplParentRow\";a:7:{s:4:\"name\";s:12:\"tplParentRow\";s:4:\"desc\";s:26:\"pdotools_prop_tplParentRow\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:16:\"tplParentRowHere\";a:7:{s:4:\"name\";s:16:\"tplParentRowHere\";s:4:\"desc\";s:30:\"pdotools_prop_tplParentRowHere\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplHere\";a:7:{s:4:\"name\";s:7:\"tplHere\";s:4:\"desc\";s:21:\"pdotools_prop_tplHere\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tplInner\";a:7:{s:4:\"name\";s:8:\"tplInner\";s:4:\"desc\";s:22:\"pdotools_prop_tplInner\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"tplInnerRow\";a:7:{s:4:\"name\";s:11:\"tplInnerRow\";s:4:\"desc\";s:25:\"pdotools_prop_tplInnerRow\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"tplInnerHere\";a:7:{s:4:\"name\";s:12:\"tplInnerHere\";s:4:\"desc\";s:26:\"pdotools_prop_tplInnerHere\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:18:\"tplParentRowActive\";a:7:{s:4:\"name\";s:18:\"tplParentRowActive\";s:4:\"desc\";s:32:\"pdotools_prop_tplParentRowActive\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:17:\"tplCategoryFolder\";a:7:{s:4:\"name\";s:17:\"tplCategoryFolder\";s:4:\"desc\";s:31:\"pdotools_prop_tplCategoryFolder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tplStart\";a:7:{s:4:\"name\";s:8:\"tplStart\";s:4:\"desc\";s:22:\"pdotools_prop_tplStart\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:55:\"@INLINE <h2[[+classes]]>[[+menutitle]]</h2>[[+wrapper]]\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:16:\"checkPermissions\";a:7:{s:4:\"name\";s:16:\"checkPermissions\";s:4:\"desc\";s:30:\"pdotools_prop_checkPermissions\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"hereId\";a:7:{s:4:\"name\";s:6:\"hereId\";s:4:\"desc\";s:20:\"pdotools_prop_hereId\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"where\";a:7:{s:4:\"name\";s:5:\"where\";s:4:\"desc\";s:19:\"pdotools_prop_where\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"select\";a:7:{s:4:\"name\";s:6:\"select\";s:4:\"desc\";s:20:\"pdotools_prop_select\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"scheme\";a:7:{s:4:\"name\";s:6:\"scheme\";s:4:\"desc\";s:20:\"pdotools_prop_scheme\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:6:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:4:\"text\";s:14:\"System default\";}i:1;a:2:{s:5:\"value\";i:-1;s:4:\"text\";s:25:\"-1 (relative to site_url)\";}i:2;a:2:{s:5:\"value\";s:4:\"full\";s:4:\"text\";s:40:\"full (absolute, prepended with site_url)\";}i:3;a:2:{s:5:\"value\";s:3:\"abs\";s:4:\"text\";s:39:\"abs (absolute, prepended with base_url)\";}i:4;a:2:{s:5:\"value\";s:4:\"http\";s:4:\"text\";s:38:\"http (absolute, forced to http scheme)\";}i:5;a:2:{s:5:\"value\";s:5:\"https\";s:4:\"text\";s:40:\"https (absolute, forced to https scheme)\";}}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"countChildren\";a:7:{s:4:\"name\";s:13:\"countChildren\";s:4:\"desc\";s:27:\"pdotools_prop_countChildren\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdomenu.php'),
(9, 1, 0, 'pdoTitle', '', 0, 2, 0, '/** @var array $scriptProperties */\r\n/** @var modX $modx */\r\nif (empty($outputSeparator)) {\r\n    $outputSeparator = \' / \';\r\n}\r\nif (empty($titleField)) {\r\n    $titleField = \'longtitle\';\r\n}\r\nif (!isset($pageVarKey)) {\r\n    $pageVarKey = \'page\';\r\n}\r\nif (!isset($queryVarKey)) {\r\n    $queryVarKey = \'query\';\r\n}\r\nif (empty($tplPages)) {\r\n    $tplPages = \'@INLINE [[%pdopage_page]] [[+page]] [[%pdopage_from]] [[+pageCount]]\';\r\n}\r\nif (empty($tplSearch)) {\r\n    $tplSearch = \'@INLINE «[[+mse2_query]]»\';\r\n}\r\nif (empty($minQuery)) {\r\n    $minQuery = 3;\r\n}\r\nif (empty($id)) {\r\n    $id = $modx->resource->id;\r\n}\r\nif (empty($cacheKey)) {\r\n    $cacheKey = \'title_crumbs\';\r\n}\r\nif (!isset($cacheTime)) {\r\n    $cacheTime = 0;\r\n}\r\n/** @var pdoTools $pdoTools */\r\n$fqn = $modx->getOption(\'pdoTools.class\', null, \'pdotools.pdotools\', true);\r\n$path = $modx->getOption(\'pdotools_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoTools = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$modx->lexicon->load(\'pdotools:pdopage\');\r\n\r\n/** @var modResource $resource */\r\n$resource = ($id == $modx->resource->id)\r\n    ? $modx->resource\r\n    : $modx->getObject(\'modResource\', $id);\r\nif (!$resource) {\r\n    return \'\';\r\n}\r\n\r\n$title = [];\r\n$pagetitle = trim($resource->get($titleField));\r\nif (empty($pagetitle)) {\r\n    $pagetitle = $resource->get(\'pagetitle\');\r\n}\r\n\r\n// Add search request if exists\r\nif (!empty($_GET[$queryVarKey]) && strlen($_GET[$queryVarKey]) >= $minQuery && !empty($tplSearch)) {\r\n    $pagetitle .= \' \' . $pdoTools->getChunk($tplSearch, [\r\n            $queryVarKey => $modx->stripTags($_GET[$queryVarKey]),\r\n        ]);\r\n}\r\n$title[] = $pagetitle;\r\n\r\n// Add pagination if exists\r\nif (!empty($_GET[$pageVarKey]) && !empty($tplPages)) {\r\n    $title[] = $pdoTools->getChunk($tplPages, [\r\n        \'page\' => (int)$_GET[$pageVarKey],\r\n    ]);\r\n}\r\n\r\n// Add parents\r\n$cacheKey = $resource->getCacheKey() . \'/\' . $cacheKey;\r\n$cacheOptions = [\'cache_key\' => $modx->getOption(\'cache_resource_key\', null, \'resource\')];\r\n$crumbs = \'\';\r\nif (empty($cache) || !$crumbs = $modx->cacheManager->get($cacheKey, $cacheOptions)) {\r\n    $crumbs = $pdoTools->runSnippet(\'pdoCrumbs\', array_merge(\r\n        [\r\n            \'to\' => $resource->id,\r\n            \'outputSeparator\' => $outputSeparator,\r\n            \'showHome\' => 0,\r\n            \'showAtHome\' => 0,\r\n            \'showCurrent\' => 0,\r\n            \'direction\' => \'rtl\',\r\n            \'tpl\' => \'@INLINE [[+menutitle]]\',\r\n            \'tplCurrent\' => \'@INLINE [[+menutitle]]\',\r\n            \'tplWrapper\' => \'@INLINE [[+output]]\',\r\n            \'tplMax\' => \'\',\r\n            \'tplHome\' => \'\',\r\n        ], $scriptProperties\r\n    ));\r\n}\r\nif (!empty($crumbs)) {\r\n    if (!empty($cache)) {\r\n        $modx->cacheManager->set($cacheKey, $crumbs, $cacheTime, $cacheOptions);\r\n    }\r\n    $title[] = $crumbs;\r\n}\r\n\r\nif (!empty($registerJs)) {\r\n    $config = [\r\n        \'separator\' => $outputSeparator,\r\n        \'tpl\' => str_replace([\'[[+\', \']]\'], [\'{\', \'}\'], $pdoTools->getChunk($tplPages)),\r\n    ];\r\n    /** @noinspection Annotator */\r\n    $modx->regClientStartupScript(\'<script>pdoTitle = \' . json_encode($config) . \';</script>\',\r\n        true);\r\n}\r\n\r\nreturn implode($outputSeparator, $title);', 0, 'a:13:{s:2:\"id\";a:7:{s:4:\"name\";s:2:\"id\";s:4:\"desc\";s:16:\"pdotools_prop_id\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"exclude\";a:7:{s:4:\"name\";s:7:\"exclude\";s:4:\"desc\";s:21:\"pdotools_prop_exclude\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:25:\"pdotools_prop_title_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:3;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"titleField\";a:7:{s:4:\"name\";s:10:\"titleField\";s:4:\"desc\";s:24:\"pdotools_prop_titleField\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"longtitle\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"cache\";a:7:{s:4:\"name\";s:5:\"cache\";s:4:\"desc\";s:25:\"pdotools_prop_title_cache\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"cacheTime\";a:7:{s:4:\"name\";s:9:\"cacheTime\";s:4:\"desc\";s:23:\"pdotools_prop_cacheTime\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tplPages\";a:7:{s:4:\"name\";s:8:\"tplPages\";s:4:\"desc\";s:22:\"pdotools_prop_tplPages\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:68:\"@INLINE [[%pdopage_page]] [[+page]] [[%pdopage_from]] [[+pageCount]]\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"pageVarKey\";a:7:{s:4:\"name\";s:10:\"pageVarKey\";s:4:\"desc\";s:24:\"pdotools_prop_pageVarKey\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:4:\"page\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"tplSearch\";a:7:{s:4:\"name\";s:9:\"tplSearch\";s:4:\"desc\";s:23:\"pdotools_prop_tplSearch\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:27:\"@INLINE «[[+mse2_query]]»\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"queryVarKey\";a:7:{s:4:\"name\";s:11:\"queryVarKey\";s:4:\"desc\";s:25:\"pdotools_prop_queryVarKey\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:5:\"query\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"minQuery\";a:7:{s:4:\"name\";s:8:\"minQuery\";s:4:\"desc\";s:22:\"pdotools_prop_minQuery\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:3;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"outputSeparator\";a:7:{s:4:\"name\";s:15:\"outputSeparator\";s:4:\"desc\";s:35:\"pdotools_prop_title_outputSeparator\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\" / \";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"registerJs\";a:7:{s:4:\"name\";s:10:\"registerJs\";s:4:\"desc\";s:24:\"pdotools_prop_registerJs\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdotitle.php');
INSERT INTO `mx_site_snippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `static`, `static_file`) VALUES
(10, 1, 0, 'pdoArchive', '', 0, 2, 0, '/** @var modX $modx */\r\n$modx->lexicon->load(\'pdotools:pdoarchive\');\r\n\r\n/** @var array $scriptProperties */\r\n$tplWrapper = $modx->getOption(\'tplWrapper\', $scriptProperties);\r\n$tplYear = $modx->getOption(\'tplYear\', $scriptProperties);\r\n$tplMonth = $modx->getOption(\'tplMonth\', $scriptProperties);\r\n$tplDay = $modx->getOption(\'tplDay\', $scriptProperties);\r\n$tpl = $modx->getOption(\'tpl\', $scriptProperties);\r\n$dateField = $modx->getOption(\'dateField\', $scriptProperties, \'createdon\', true);\r\n$dateFormat = $modx->getOption(\'dateFormat\', $scriptProperties, \'H:i\', true);\r\n$outputSeparator = $modx->getOption(\'outputSeparator\', $scriptProperties, \"\\n\");\r\n\r\n// Adding extra parameters into special place so we can put them in a results\r\n/** @var modSnippet $snippet */\r\n$additionalPlaceholders = $properties = [];\r\nif (isset($this) && $this instanceof modSnippet) {\r\n    $properties = $this->get(\'properties\');\r\n} elseif ($snippet = $modx->getObject(\'modSnippet\', [\'name\' => \'pdoResources\'])) {\r\n    $properties = $snippet->get(\'properties\');\r\n}\r\nif (!empty($properties)) {\r\n    foreach ($scriptProperties as $k => $v) {\r\n        if (!isset($properties[$k])) {\r\n            $additionalPlaceholders[$k] = $v;\r\n        }\r\n    }\r\n}\r\n$scriptProperties[\'additionalPlaceholders\'] = $additionalPlaceholders;\r\nif (isset($parents) && $parents === \'\') {\r\n    $scriptProperties[\'parents\'] = $modx->resource->id;\r\n}\r\n$scriptProperties[\'return\'] = \'data\';\r\n/** @var pdoFetch $pdoFetch */\r\n$fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);\r\n$path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);\r\nif ($pdoClass = $modx->loadClass($fqn, $path, false, true)) {\r\n    $pdoFetch = new $pdoClass($modx, $scriptProperties);\r\n} else {\r\n    return false;\r\n}\r\n$pdoFetch->addTime(\'pdoTools loaded\');\r\n$rows = $pdoFetch->run();\r\n\r\n// Process rows\r\n$tree = [];\r\nforeach ($rows as $row) {\r\n    $tmp = $row[$dateField];\r\n    if (!is_numeric($tmp)) {\r\n        $tmp = strtotime($tmp);\r\n    }\r\n    $year = date(\'Y\', $tmp);\r\n    $month = date(\'m\', $tmp);\r\n    $day = date(\'d\', $tmp);\r\n    $tree[$year][$month][$day][] = $row;\r\n}\r\n\r\n$output = \'\';\r\nforeach ($tree as $year => $months) {\r\n    $rows_year = \'\';\r\n    $count_year = 0;\r\n\r\n    foreach ($months as $month => $days) {\r\n        $rows_month = \'\';\r\n        $count_month = 0;\r\n\r\n        foreach ($days as $day => $resources) {\r\n            $rows_day = [];\r\n            $count_day = 0;\r\n            $idx = 1;\r\n\r\n            foreach ($resources as $resource) {\r\n                $resource[\'day\'] = $day;\r\n                $resource[\'month\'] = $month;\r\n                $resource[\'year\'] = $year;\r\n                $resource[\'date\'] = strftime($dateFormat, $resource[$dateField]);\r\n                $resource[\'idx\'] = $idx++;\r\n                $resource[\'menutitle\'] = !empty($resource[\'menutitle\'])\r\n                    ? $resource[\'menutitle\']\r\n                    : $resource[\'pagetitle\'];\r\n                // Add placeholder [[+link]] if specified\r\n                if (!empty($scriptProperties[\'useWeblinkUrl\'])) {\r\n                    if (!isset($resource[\'context_key\'])) {\r\n                        $resource[\'context_key\'] = \'\';\r\n                    }\r\n                    if (isset($resource[\'class_key\']) && ($resource[\'class_key\'] == \'modWebLink\')) {\r\n                        $resource[\'link\'] = isset($resource[\'content\']) && is_numeric(trim($resource[\'content\'], \'[]~ \'))\r\n                            ? $pdoFetch->makeUrl(intval(trim($resource[\'content\'], \'[]~ \')), $resource)\r\n                            : (isset($resource[\'content\']) ? $resource[\'content\'] : \'\');\r\n                    } else {\r\n                        $resource[\'link\'] = $pdoFetch->makeUrl($resource[\'id\'], $resource);\r\n                    }\r\n                } else {\r\n                    $resource[\'link\'] = \'\';\r\n                }\r\n                $tpl = $pdoFetch->defineChunk($resource);\r\n                $rows_day[] = $pdoFetch->getChunk($tpl, $resource);\r\n                $count_year++;\r\n                $count_month++;\r\n                $count_day++;\r\n            }\r\n\r\n            $rows_month .= !empty($tplDay)\r\n                ? $pdoFetch->getChunk($tplDay, [\r\n                    \'day\' => $day,\r\n                    \'month\' => $month,\r\n                    \'year\' => $year,\r\n                    \'count\' => $count_day,\r\n                    \'wrapper\' => implode($outputSeparator, $rows_day),\r\n                ], $pdoFetch->config[\'fastMode\'])\r\n                : implode($outputSeparator, $rows_day);\r\n        }\r\n\r\n        $rows_year .= !empty($tplMonth)\r\n            ? $pdoFetch->getChunk($tplMonth, [\r\n                \'month\' => $month,\r\n                \'month_name\' => $modx->lexicon(\'pdoarchive_month_\' . $month),\r\n                \'year\' => $year,\r\n                \'count\' => $count_month,\r\n                \'wrapper\' => $rows_month,\r\n            ], $pdoFetch->config[\'fastMode\'])\r\n            : $rows_month;\r\n    }\r\n\r\n    $output .= !empty($tplYear)\r\n        ? $pdoFetch->getChunk($tplYear, [\r\n            \'year\' => $year,\r\n            \'count\' => $count_year,\r\n            \'wrapper\' => $rows_year,\r\n        ], $pdoFetch->config[\'fastMode\'])\r\n        : $rows_year;\r\n}\r\n$pdoFetch->addTime(\'Rows processed\');\r\n\r\n// Return output\r\nif (!empty($tplWrapper) && (!empty($wrapIfEmpty) || !empty($output))) {\r\n    $output = $pdoFetch->getChunk(\r\n        $tplWrapper,\r\n        array_merge($additionalPlaceholders, [\'output\' => $output]),\r\n        $pdoFetch->config[\'fastMode\']\r\n    );\r\n    $pdoFetch->addTime(\'Rows wrapped\');\r\n}\r\n\r\nif ($modx->user->hasSessionContext(\'mgr\') && !empty($showLog)) {\r\n    $output .= \'<pre class=\"pdoArchiveLog\">\' . print_r($pdoFetch->getTime(), 1) . \'</pre>\';\r\n}\r\n\r\nif (!empty($toPlaceholder)) {\r\n    $modx->setPlaceholder($toPlaceholder, $output);\r\n} else {\r\n    return $output;\r\n}', 0, 'a:36:{s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:17:\"pdotools_prop_tpl\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:65:\"@INLINE <li>[[+date]] <a href=\"[[+link]]\">[[+menutitle]]</a></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplYear\";a:7:{s:4:\"name\";s:7:\"tplYear\";s:4:\"desc\";s:21:\"pdotools_prop_tplYear\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:71:\"@INLINE <h3>[[+year]] <sup>([[+count]])</sup></h3><ul>[[+wrapper]]</ul>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tplMonth\";a:7:{s:4:\"name\";s:8:\"tplMonth\";s:4:\"desc\";s:22:\"pdotools_prop_tplMonth\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:86:\"@INLINE <li><h4>[[+month_name]] <sup>([[+count]])</sup></h4><ul>[[+wrapper]]</ul></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"tplDay\";a:7:{s:4:\"name\";s:6:\"tplDay\";s:4:\"desc\";s:20:\"pdotools_prop_tplDay\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:79:\"@INLINE <li><h5>[[+day]] <sup>([[+count]])</sup></h5><ul>[[+wrapper]]</ul></li>\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"tplWrapper\";a:7:{s:4:\"name\";s:10:\"tplWrapper\";s:4:\"desc\";s:24:\"pdotools_prop_tplWrapper\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"wrapIfEmpty\";a:7:{s:4:\"name\";s:11:\"wrapIfEmpty\";s:4:\"desc\";s:25:\"pdotools_prop_wrapIfEmpty\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"dateField\";a:7:{s:4:\"name\";s:9:\"dateField\";s:4:\"desc\";s:23:\"pdotools_prop_dateField\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"createdon\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"dateFormat\";a:7:{s:4:\"name\";s:10:\"dateFormat\";s:4:\"desc\";s:24:\"pdotools_prop_dateFormat\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:5:\"%H:%M\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"showLog\";a:7:{s:4:\"name\";s:7:\"showLog\";s:4:\"desc\";s:21:\"pdotools_prop_showLog\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"sortby\";a:7:{s:4:\"name\";s:6:\"sortby\";s:4:\"desc\";s:20:\"pdotools_prop_sortby\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:9:\"createdon\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"sortbyTV\";a:7:{s:4:\"name\";s:8:\"sortbyTV\";s:4:\"desc\";s:22:\"pdotools_prop_sortbyTV\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:12:\"sortbyTVType\";a:7:{s:4:\"name\";s:12:\"sortbyTVType\";s:4:\"desc\";s:26:\"pdotools_prop_sortbyTVType\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sortdir\";a:7:{s:4:\"name\";s:7:\"sortdir\";s:4:\"desc\";s:21:\"pdotools_prop_sortdir\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:4:\"text\";s:3:\"ASC\";s:5:\"value\";s:3:\"ASC\";}i:1;a:2:{s:4:\"text\";s:4:\"DESC\";s:5:\"value\";s:4:\"DESC\";}}s:5:\"value\";s:4:\"DESC\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"sortdirTV\";a:7:{s:4:\"name\";s:9:\"sortdirTV\";s:4:\"desc\";s:23:\"pdotools_prop_sortdirTV\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:4:\"text\";s:3:\"ASC\";s:5:\"value\";s:3:\"ASC\";}i:1;a:2:{s:4:\"text\";s:4:\"DESC\";s:5:\"value\";s:4:\"DESC\";}}s:5:\"value\";s:3:\"ASC\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:19:\"pdotools_prop_limit\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"offset\";a:7:{s:4:\"name\";s:6:\"offset\";s:4:\"desc\";s:20:\"pdotools_prop_offset\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"depth\";a:7:{s:4:\"name\";s:5:\"depth\";s:4:\"desc\";s:19:\"pdotools_prop_depth\";s:4:\"type\";s:11:\"numberfield\";s:7:\"options\";a:0:{}s:5:\"value\";i:10;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"outputSeparator\";a:7:{s:4:\"name\";s:15:\"outputSeparator\";s:4:\"desc\";s:29:\"pdotools_prop_outputSeparator\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"\n\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:27:\"pdotools_prop_toPlaceholder\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"parents\";a:7:{s:4:\"name\";s:7:\"parents\";s:4:\"desc\";s:21:\"pdotools_prop_parents\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"includeContent\";a:7:{s:4:\"name\";s:14:\"includeContent\";s:4:\"desc\";s:28:\"pdotools_prop_includeContent\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"includeTVs\";a:7:{s:4:\"name\";s:10:\"includeTVs\";s:4:\"desc\";s:24:\"pdotools_prop_includeTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"prepareTVs\";a:7:{s:4:\"name\";s:10:\"prepareTVs\";s:4:\"desc\";s:24:\"pdotools_prop_prepareTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"processTVs\";a:7:{s:4:\"name\";s:10:\"processTVs\";s:4:\"desc\";s:24:\"pdotools_prop_processTVs\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"tvPrefix\";a:7:{s:4:\"name\";s:8:\"tvPrefix\";s:4:\"desc\";s:22:\"pdotools_prop_tvPrefix\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:3:\"tv.\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:5:\"where\";a:7:{s:4:\"name\";s:5:\"where\";s:4:\"desc\";s:19:\"pdotools_prop_where\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:15:\"showUnpublished\";a:7:{s:4:\"name\";s:15:\"showUnpublished\";s:4:\"desc\";s:29:\"pdotools_prop_showUnpublished\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:11:\"showDeleted\";a:7:{s:4:\"name\";s:11:\"showDeleted\";s:4:\"desc\";s:25:\"pdotools_prop_showDeleted\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:10:\"showHidden\";a:7:{s:4:\"name\";s:10:\"showHidden\";s:4:\"desc\";s:24:\"pdotools_prop_showHidden\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:14:\"hideContainers\";a:7:{s:4:\"name\";s:14:\"hideContainers\";s:4:\"desc\";s:28:\"pdotools_prop_hideContainers\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:0;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:7:\"context\";a:7:{s:4:\"name\";s:7:\"context\";s:4:\"desc\";s:21:\"pdotools_prop_context\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:8:\"totalVar\";a:7:{s:4:\"name\";s:8:\"totalVar\";s:4:\"desc\";s:22:\"pdotools_prop_totalVar\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:5:\"total\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:9:\"resources\";a:7:{s:4:\"name\";s:9:\"resources\";s:4:\"desc\";s:23:\"pdotools_prop_resources\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"select\";a:7:{s:4:\"name\";s:6:\"select\";s:4:\"desc\";s:20:\"pdotools_prop_select\";s:4:\"type\";s:8:\"textarea\";s:7:\"options\";a:0:{}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:6:\"scheme\";a:7:{s:4:\"name\";s:6:\"scheme\";s:4:\"desc\";s:20:\"pdotools_prop_scheme\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:6:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:4:\"text\";s:14:\"System default\";}i:1;a:2:{s:5:\"value\";i:-1;s:4:\"text\";s:25:\"-1 (relative to site_url)\";}i:2;a:2:{s:5:\"value\";s:4:\"full\";s:4:\"text\";s:40:\"full (absolute, prepended with site_url)\";}i:3;a:2:{s:5:\"value\";s:3:\"abs\";s:4:\"text\";s:39:\"abs (absolute, prepended with base_url)\";}i:4;a:2:{s:5:\"value\";s:4:\"http\";s:4:\"text\";s:38:\"http (absolute, forced to http scheme)\";}i:5;a:2:{s:5:\"value\";s:5:\"https\";s:4:\"text\";s:40:\"https (absolute, forced to https scheme)\";}}s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}s:13:\"useWeblinkUrl\";a:7:{s:4:\"name\";s:13:\"useWeblinkUrl\";s:4:\"desc\";s:27:\"pdotools_prop_useWeblinkUrl\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";a:0:{}s:5:\"value\";b:1;s:7:\"lexicon\";s:19:\"pdotools:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, 'core/components/pdotools/elements/snippets/snippet.pdoarchive.php'),
(11, 0, 0, 'ActiveUsers', 'Shows a list of active, logged-in users.', 0, 3, 0, '/**\n * Login\n *\n * Copyright 2010 by Shaun McCormick <shaun+login@modx.com>\n *\n * Login is free software; you can redistribute it and/or modify it under the\n * terms of the GNU General Public License as published by the Free Software\n * Foundation; either version 2 of the License, or (at your option) any later\n * version.\n *\n * Login is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * Login; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * Shows a list of active, signed-on users\n *\n * @var modX $modx\n * @var Login $login\n * @var array $scriptProperties\n *\n * @package login\n **/\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'ActiveUsers\');\n$output = $controller->run($scriptProperties);\nreturn $output;', 0, 'a:9:{s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:20:\"prop_activeusers.tpl\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:13:\"lgnActiveUser\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplType\";a:7:{s:4:\"name\";s:7:\"tplType\";s:4:\"desc\";s:24:\"prop_activeusers.tplType\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:6:\"sortBy\";a:7:{s:4:\"name\";s:6:\"sortBy\";s:4:\"desc\";s:23:\"prop_activeusers.sortBy\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:8:\"username\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sortDir\";a:7:{s:4:\"name\";s:7:\"sortDir\";s:4:\"desc\";s:24:\"prop_activeusers.sortDir\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:2:{i:0;a:2:{s:5:\"value\";s:3:\"ASC\";s:4:\"text\";s:16:\"opt_register.asc\";}i:1;a:2:{s:5:\"value\";s:4:\"DESC\";s:4:\"text\";s:17:\"opt_register.desc\";}}s:5:\"value\";s:4:\"DESC\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:5:\"limit\";a:7:{s:4:\"name\";s:5:\"limit\";s:4:\"desc\";s:22:\"prop_activeusers.limit\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:2:\"10\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:6:\"offset\";a:7:{s:4:\"name\";s:6:\"offset\";s:4:\"desc\";s:23:\"prop_activeusers.offset\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"0\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"classKey\";a:7:{s:4:\"name\";s:8:\"classKey\";s:4:\"desc\";s:25:\"prop_activeusers.classKey\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:7:\"modUser\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:17:\"placeholderPrefix\";a:7:{s:4:\"name\";s:17:\"placeholderPrefix\";s:4:\"desc\";s:39:\"prop_activeusers.placeholderprefix_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"au.\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:35:\"prop_activeusers.toplaceholder_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(12, 0, 0, 'ChangePassword', 'Processes a form for changing the password for a User.', 0, 3, 0, '/**\n * Login\n *\n * Copyright 2010 by Shaun McCormick <shaun+login@modx.com>\n *\n * Login is free software; you can redistribute it and/or modify it under the\n * terms of the GNU General Public License as published by the Free Software\n * Foundation; either version 2 of the License, or (at your option) any later\n * version.\n *\n * Login is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * Login; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * ChangePassword snippet\n *\n * @var modX $modx\n * @var Login $login\n * @var array $scriptProperties\n * \n * @package login\n **/\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'ChangePassword\');\n$output = $controller->run($scriptProperties);\nreturn $output;', 0, 'a:9:{s:9:\"submitVar\";a:7:{s:4:\"name\";s:9:\"submitVar\";s:4:\"desc\";s:34:\"prop_changepassword.submitvar_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:12:\"logcp-submit\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:16:\"fieldOldPassword\";a:7:{s:4:\"name\";s:16:\"fieldOldPassword\";s:4:\"desc\";s:41:\"prop_changepassword.fieldoldpassword_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:12:\"password_old\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:16:\"fieldNewPassword\";a:7:{s:4:\"name\";s:16:\"fieldNewPassword\";s:4:\"desc\";s:41:\"prop_changepassword.fieldnewpassword_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:12:\"password_new\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:23:\"fieldConfirmNewPassword\";a:7:{s:4:\"name\";s:23:\"fieldConfirmNewPassword\";s:4:\"desc\";s:48:\"prop_changepassword.fieldconfirmnewpassword_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:20:\"password_new_confirm\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"preHooks\";a:7:{s:4:\"name\";s:8:\"preHooks\";s:4:\"desc\";s:33:\"prop_changepassword.prehooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"postHooks\";a:7:{s:4:\"name\";s:9:\"postHooks\";s:4:\"desc\";s:34:\"prop_changepassword.posthooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"redirectToLogin\";a:7:{s:4:\"name\";s:15:\"redirectToLogin\";s:4:\"desc\";s:40:\"prop_changepassword.redirecttologin_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"reloadOnSuccess\";a:7:{s:4:\"name\";s:15:\"reloadOnSuccess\";s:4:\"desc\";s:40:\"prop_changepassword.reloadonsuccess_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:17:\"placeholderPrefix\";a:7:{s:4:\"name\";s:17:\"placeholderPrefix\";s:4:\"desc\";s:42:\"prop_changepassword.placeholderprefix_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:6:\"logcp.\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(13, 0, 0, 'ConfirmRegister', 'Handles activation of registered user.', 0, 3, 0, '/**\n * Register\n *\n * Copyright 2010 by Shaun McCormick <shaun@modx.com>\n *\n * Register is free software; you can redistribute it and/or modify it under the\n * terms of the GNU General Public License as published by the Free Software\n * Foundation; either version 2 of the License, or (at your option) any later\n * version.\n *\n * Register is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * Register; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx Confirm Register Activation Snippet. Snippet to place on an activation\n * page that the user using the Register snippet would be sent to via the\n * activation email.\n *\n * @var modX $modx\n * @var Login $login\n * @var array $scriptProperties\n *\n * @package login\n */\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'ConfirmRegister\');\n$output = $controller->run($scriptProperties);\nreturn $output;', 0, 'a:7:{s:10:\"redirectTo\";a:7:{s:4:\"name\";s:10:\"redirectTo\";s:4:\"desc\";s:36:\"prop_confirmregister.redirectto_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:14:\"redirectParams\";a:7:{s:4:\"name\";s:14:\"redirectParams\";s:4:\"desc\";s:40:\"prop_confirmregister.redirectparams_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:26:\"redirectUnsetDefaultParams\";a:7:{s:4:\"name\";s:26:\"redirectUnsetDefaultParams\";s:4:\"desc\";s:51:\"prop_confirmregister.redirectUnsetDefaultParam_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:0;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"authenticate\";a:7:{s:4:\"name\";s:12:\"authenticate\";s:4:\"desc\";s:38:\"prop_confirmregister.authenticate_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:20:\"authenticateContexts\";a:7:{s:4:\"name\";s:20:\"authenticateContexts\";s:4:\"desc\";s:46:\"prop_confirmregister.authenticatecontexts_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"errorPage\";a:7:{s:4:\"name\";s:9:\"errorPage\";s:4:\"desc\";s:35:\"prop_confirmregister.errorpage_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"activePage\";a:7:{s:4:\"name\";s:10:\"activePage\";s:4:\"desc\";s:36:\"prop_confirmregister.activepage_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(14, 0, 0, 'ForgotPassword', 'Displays a forgot password form.', 0, 3, 0, '/**\n * ForgotPassword\n *\n * Copyright 2010 by Jason Coward <jason@modx.com> and Shaun McCormick\n * <shaun@modx.com>\n *\n * ForgotPassword is free software; you can redistribute it and/or modify it\n * under the terms of the GNU General Public License as published by the Free\n * Software Foundation; either version 2 of the License, or (at your option) any\n * later version.\n *\n * ForgotPassword is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * ForgotPassword; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx ForgotPassword Snippet. Displays a form for users who have forgotten\n * their password and gives them the ability to retrieve it.\n *\n * @package login\n */\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'ForgotPassword\');\n$output = $controller->run($scriptProperties);\nreturn $output;', 0, 'a:13:{s:8:\"emailTpl\";a:7:{s:4:\"name\";s:8:\"emailTpl\";s:4:\"desc\";s:33:\"prop_forgotpassword.emailtpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:18:\"lgnForgotPassEmail\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:11:\"emailTplAlt\";a:7:{s:4:\"name\";s:11:\"emailTplAlt\";s:4:\"desc\";s:36:\"prop_forgotpassword.emailtplalt_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"emailTplType\";a:7:{s:4:\"name\";s:12:\"emailTplType\";s:4:\"desc\";s:37:\"prop_forgotpassword.emailtpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:7:\"sentTpl\";a:7:{s:4:\"name\";s:7:\"sentTpl\";s:4:\"desc\";s:32:\"prop_forgotpassword.senttpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:20:\"lgnForgotPassSentTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:11:\"sentTplType\";a:7:{s:4:\"name\";s:11:\"sentTplType\";s:4:\"desc\";s:36:\"prop_forgotpassword.senttpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:28:\"prop_forgotpassword.tpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:16:\"lgnForgotPassTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplType\";a:7:{s:4:\"name\";s:7:\"tplType\";s:4:\"desc\";s:32:\"prop_forgotpassword.tpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:6:\"errTpl\";a:7:{s:4:\"name\";s:6:\"errTpl\";s:4:\"desc\";s:31:\"prop_forgotpassword.errtpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:9:\"lgnErrTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"errTplType\";a:7:{s:4:\"name\";s:10:\"errTplType\";s:4:\"desc\";s:35:\"prop_forgotpassword.errtpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"emailSubject\";a:7:{s:4:\"name\";s:12:\"emailSubject\";s:4:\"desc\";s:37:\"prop_forgotpassword.emailsubject_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"resetResourceId\";a:7:{s:4:\"name\";s:15:\"resetResourceId\";s:4:\"desc\";s:40:\"prop_forgotpassword.resetresourceid_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"redirectTo\";a:7:{s:4:\"name\";s:10:\"redirectTo\";s:4:\"desc\";s:36:\"prop_confirmregister.redirectto_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:14:\"redirectParams\";a:7:{s:4:\"name\";s:14:\"redirectParams\";s:4:\"desc\";s:40:\"prop_confirmregister.redirectparams_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(15, 0, 0, 'isLoggedIn', 'Checks to see if the user is logged in. If not, redirects to Unauthorized Page.', 0, 3, 0, '/**\n * isLoggedIn\n *\n * Copyright 2009-2011 by Shaun McCormick <shaun@modx.com>\n *\n * isLoggedIn is free software; you can redistribute it and/or modify it under the\n * terms of the GNU General Public License as published by the Free Software\n * Foundation; either version 2 of the License, or (at your option) any later\n * version.\n *\n * isLoggedIn is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * isLoggedIn; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx isLoggedIn Snippet. Will check to see if user is logged into the current\n * or specific context. If not, redirects to unauthorized page.\n *\n * @package login\n */\n/* setup default properties */\n$ctxs = !empty($ctxs) ? $ctxs : $modx->context->get(\'key\');\nif (!is_array($ctxs)) $ctxs = explode(\',\',$ctxs);\n\nif (!$modx->user->hasSessionContext($ctxs)) {\n    if (!empty($redirectTo)) {\n        $redirectParams = !empty($redirectParams) ? $modx->fromJSON($redirectParams) : \'\';\n        $url = $modx->makeUrl($redirectTo,\'\',$redirectParams,\'full\');\n        $modx->sendRedirect($url);\n    } else {\n        $modx->sendUnauthorizedPage();\n    }\n}\nreturn \'\';', 0, 'a:3:{s:8:\"contexts\";a:7:{s:4:\"name\";s:8:\"contexts\";s:4:\"desc\";s:29:\"prop_isloggedin.contexts_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"redirectTo\";a:7:{s:4:\"name\";s:10:\"redirectTo\";s:4:\"desc\";s:31:\"prop_isloggedin.redirectto_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:14:\"redirectParams\";a:7:{s:4:\"name\";s:14:\"redirectParams\";s:4:\"desc\";s:35:\"prop_isloggedin.redirectparams_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(16, 0, 0, 'Login', 'Displays a login and logout form.', 0, 3, 0, '/**\n * Login\n *\n * Copyright 2010 by Jason Coward <jason@modx.com> and Shaun McCormick\n * <shaun@modx.com>\n *\n * Login is free software; you can redistribute it and/or modify it\n * under the terms of the GNU General Public License as published by the Free\n * Software Foundation; either version 2 of the License, or (at your option) any\n * later version.\n *\n * Login is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * Login; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx Login Snippet\n *\n * This snippet handles login POSTs, sending the user back to where they came from or to a specific\n * location if specified in the POST.\n *\n * @package login\n *\n * @property textfield actionKey The REQUEST variable containing the action to take.\n * @property textfield loginKey The actionKey for login.\n * @property textfield logoutKey The actionKey for logout.\n * @property boolean loginViaEmail Enable login via username or email address (either one!) [default: false]\n * @property list tplType The type of template to expect for the views:\n *  modChunk - name of chunk to use\n *  file - full path to file to use as tpl\n *  embedded - the tpl is embedded in the page content\n *  inline - the tpl is inline content provided directly\n * @property textfield loginTpl The template for the login view (content based on tplType)\n * @property textfield logoutTpl The template for the logout view (content based on tplType)\n * @property textfield errTpl The template for any errors that occur when processing an view\n * @property list errTplType The type of template to expect for the error messages:\n *  modChunk - name of chunk to use\n *  file - full path to file to use as tpl\n *  inline - the tpl is inline content provided directly\n * @property integer logoutResourceId An explicit resource id to redirect users to on logout\n * @property string loginMsg The string to use for the login action. Defaults to\n * the lexicon string \"login\".\n * @property string logoutMsg The string to use for the logout action. Defaults\n * to the lexicon string \"login.logout\"\n */\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\nif (!is_object($login) || !($login instanceof Login)) return \'\';\n\n$controller = $login->loadController(\'Login\');\n$output = $controller->run($scriptProperties);\nreturn $output;', 0, 'a:23:{s:9:\"actionKey\";a:7:{s:4:\"name\";s:9:\"actionKey\";s:4:\"desc\";s:25:\"prop_login.actionkey_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:7:\"service\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"loginKey\";a:7:{s:4:\"name\";s:8:\"loginKey\";s:4:\"desc\";s:24:\"prop_login.loginkey_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:5:\"login\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"logoutKey\";a:7:{s:4:\"name\";s:9:\"logoutKey\";s:4:\"desc\";s:25:\"prop_login.logoutkey_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:6:\"logout\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"loginViaEmail\";a:7:{s:4:\"name\";s:13:\"loginViaEmail\";s:4:\"desc\";s:29:\"prop_login.loginviaemail_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:0;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplType\";a:7:{s:4:\"name\";s:7:\"tplType\";s:4:\"desc\";s:23:\"prop_login.tpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"loginTpl\";a:7:{s:4:\"name\";s:8:\"loginTpl\";s:4:\"desc\";s:24:\"prop_login.logintpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:11:\"lgnLoginTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"logoutTpl\";a:7:{s:4:\"name\";s:9:\"logoutTpl\";s:4:\"desc\";s:25:\"prop_login.logouttpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:12:\"lgnLogoutTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"preHooks\";a:7:{s:4:\"name\";s:8:\"preHooks\";s:4:\"desc\";s:24:\"prop_login.prehooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"postHooks\";a:7:{s:4:\"name\";s:9:\"postHooks\";s:4:\"desc\";s:25:\"prop_login.posthooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:6:\"errTpl\";a:7:{s:4:\"name\";s:6:\"errTpl\";s:4:\"desc\";s:22:\"prop_login.errtpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:9:\"lgnErrTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"errTplType\";a:7:{s:4:\"name\";s:10:\"errTplType\";s:4:\"desc\";s:26:\"prop_login.errtpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"loginResourceId\";a:7:{s:4:\"name\";s:15:\"loginResourceId\";s:4:\"desc\";s:31:\"prop_login.loginresourceid_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"0\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:19:\"loginResourceParams\";a:7:{s:4:\"name\";s:19:\"loginResourceParams\";s:4:\"desc\";s:35:\"prop_login.loginresourceparams_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:16:\"logoutResourceId\";a:7:{s:4:\"name\";s:16:\"logoutResourceId\";s:4:\"desc\";s:32:\"prop_login.logoutresourceid_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"0\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:20:\"logoutResourceParams\";a:7:{s:4:\"name\";s:20:\"logoutResourceParams\";s:4:\"desc\";s:36:\"prop_login.logoutresourceparams_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"loginMsg\";a:7:{s:4:\"name\";s:8:\"loginMsg\";s:4:\"desc\";s:24:\"prop_login.loginmsg_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"logoutMsg\";a:7:{s:4:\"name\";s:9:\"logoutMsg\";s:4:\"desc\";s:25:\"prop_login.logoutmsg_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"redirectToPrior\";a:7:{s:4:\"name\";s:15:\"redirectToPrior\";s:4:\"desc\";s:31:\"prop_login.redirecttoprior_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:0;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:22:\"redirectToOnFailedAuth\";a:7:{s:4:\"name\";s:22:\"redirectToOnFailedAuth\";s:4:\"desc\";s:38:\"prop_login.redirecttoonfailedauth_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"rememberMeKey\";a:7:{s:4:\"name\";s:13:\"rememberMeKey\";s:4:\"desc\";s:29:\"prop_login.remembermekey_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:10:\"rememberme\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"contexts\";a:7:{s:4:\"name\";s:8:\"contexts\";s:4:\"desc\";s:24:\"prop_login.contexts_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"toPlaceholder\";a:7:{s:4:\"name\";s:13:\"toPlaceholder\";s:4:\"desc\";s:29:\"prop_login.toplaceholder_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:14:\"recaptchaTheme\";a:7:{s:4:\"name\";s:14:\"recaptchaTheme\";s:4:\"desc\";s:33:\"prop_register.recaptchaTheme_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:3:\"red\";s:4:\"text\";s:16:\"opt_register.red\";}i:1;a:2:{s:5:\"value\";s:5:\"white\";s:4:\"text\";s:18:\"opt_register.white\";}i:2;a:2:{s:5:\"value\";s:5:\"clean\";s:4:\"text\";s:18:\"opt_register.clean\";}i:3;a:2:{s:5:\"value\";s:10:\"blackglass\";s:4:\"text\";s:23:\"opt_register.blackglass\";}}s:5:\"value\";s:5:\"clean\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(17, 0, 0, 'Profile', 'Displays Profile data for a User.', 0, 3, 0, '/**\n * Profile\n *\n * Copyright 2010 by Shaun McCormick <shaun@modx.com>\n *\n * Register is free software; you can redistribute it and/or modify it under the\n * terms of the GNU General Public License as published by the Free Software\n * Foundation; either version 2 of the License, or (at your option) any later\n * version.\n *\n * Register is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * Register; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx Profile Snippet. Sets Profile data for a user to placeholders\n *\n * @package login\n */\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'Profile\');\nreturn $controller->run($scriptProperties);', 0, 'a:3:{s:6:\"prefix\";a:7:{s:4:\"name\";s:6:\"prefix\";s:4:\"desc\";s:24:\"prop_profile.prefix_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:4:\"user\";a:7:{s:4:\"name\";s:4:\"user\";s:4:\"desc\";s:22:\"prop_profile.user_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:11:\"useExtended\";a:7:{s:4:\"name\";s:11:\"useExtended\";s:4:\"desc\";s:29:\"prop_profile.useextended_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, '');
INSERT INTO `mx_site_snippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `static`, `static_file`) VALUES
(18, 0, 0, 'Register', 'Handles forms for registering users on the front-end.', 0, 3, 0, '/**\n * Register\n *\n * Copyright 2010 by Shaun McCormick <shaun@modx.com>\n *\n * Register is free software; you can redistribute it and/or modify it under the\n * terms of the GNU General Public License as published by the Free Software\n * Foundation; either version 2 of the License, or (at your option) any later\n * version.\n *\n * Register is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * Register; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx Register Snippet. Handles User registrations.\n * \n * @package login\n */\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'Register\');\n$output = $controller->run($scriptProperties);\nreturn $output;', 0, 'a:41:{s:9:\"submitVar\";a:7:{s:4:\"name\";s:9:\"submitVar\";s:4:\"desc\";s:28:\"prop_register.submitvar_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"usergroups\";a:7:{s:4:\"name\";s:10:\"usergroups\";s:4:\"desc\";s:29:\"prop_register.usergroups_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"usergroupsField\";a:7:{s:4:\"name\";s:15:\"usergroupsField\";s:4:\"desc\";s:34:\"prop_register.usergroupsfield_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:19:\"submittedResourceId\";a:7:{s:4:\"name\";s:19:\"submittedResourceId\";s:4:\"desc\";s:38:\"prop_register.submittedresourceid_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"usernameField\";a:7:{s:4:\"name\";s:13:\"usernameField\";s:4:\"desc\";s:32:\"prop_register.usernamefield_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:8:\"username\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"passwordField\";a:7:{s:4:\"name\";s:13:\"passwordField\";s:4:\"desc\";s:32:\"prop_register.passwordfield_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:8:\"password\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:16:\"validatePassword\";a:7:{s:4:\"name\";s:16:\"validatePassword\";s:4:\"desc\";s:35:\"prop_register.validatepassword_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:16:\"generatePassword\";a:7:{s:4:\"name\";s:16:\"generatePassword\";s:4:\"desc\";s:35:\"prop_register.generatepassword_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:0;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"trimPassword\";a:7:{s:4:\"name\";s:12:\"trimPassword\";s:4:\"desc\";s:31:\"prop_register.trimpassword_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:22:\"ensurePasswordStrength\";a:7:{s:4:\"name\";s:22:\"ensurePasswordStrength\";s:4:\"desc\";s:41:\"prop_register.ensurePasswordStrength_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:0;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:21:\"passwordWordSeparator\";a:7:{s:4:\"name\";s:21:\"passwordWordSeparator\";s:4:\"desc\";s:40:\"prop_register.passwordWordSeparator_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\" \";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:30:\"minimumStrongPasswordWordCount\";a:7:{s:4:\"name\";s:30:\"minimumStrongPasswordWordCount\";s:4:\"desc\";s:49:\"prop_register.minimumStrongPasswordWordCount_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"3\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:32:\"maximumPossibleStrongerPasswords\";a:7:{s:4:\"name\";s:32:\"maximumPossibleStrongerPasswords\";s:4:\"desc\";s:51:\"prop_register.maximumPossibleStrongerPasswords_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:2:\"25\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:33:\"ensurePasswordStrengthSuggestions\";a:7:{s:4:\"name\";s:33:\"ensurePasswordStrengthSuggestions\";s:4:\"desc\";s:52:\"prop_register.ensurePasswordStrengthSuggestions_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"5\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"allowedFields\";a:7:{s:4:\"name\";s:13:\"allowedFields\";s:4:\"desc\";s:32:\"prop_register.allowedfields_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"emailField\";a:7:{s:4:\"name\";s:10:\"emailField\";s:4:\"desc\";s:29:\"prop_register.emailfield_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:5:\"email\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"persistParams\";a:7:{s:4:\"name\";s:13:\"persistParams\";s:4:\"desc\";s:32:\"prop_register.persistparams_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"preHooks\";a:7:{s:4:\"name\";s:8:\"preHooks\";s:4:\"desc\";s:27:\"prop_register.prehooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"postHooks\";a:7:{s:4:\"name\";s:9:\"postHooks\";s:4:\"desc\";s:28:\"prop_register.posthooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:11:\"useExtended\";a:7:{s:4:\"name\";s:11:\"useExtended\";s:4:\"desc\";s:30:\"prop_register.useextended_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"excludeExtended\";a:7:{s:4:\"name\";s:15:\"excludeExtended\";s:4:\"desc\";s:34:\"prop_register.excludeextended_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"activation\";a:7:{s:4:\"name\";s:10:\"activation\";s:4:\"desc\";s:29:\"prop_register.activation_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"activationttl\";a:7:{s:4:\"name\";s:13:\"activationttl\";s:4:\"desc\";s:32:\"prop_register.activationttl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"180\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:20:\"activationResourceId\";a:7:{s:4:\"name\";s:20:\"activationResourceId\";s:4:\"desc\";s:39:\"prop_register.activationresourceid_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"activationEmail\";a:7:{s:4:\"name\";s:15:\"activationEmail\";s:4:\"desc\";s:34:\"prop_register.activationemail_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:22:\"activationEmailSubject\";a:7:{s:4:\"name\";s:22:\"activationEmailSubject\";s:4:\"desc\";s:41:\"prop_register.activationemailsubject_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:22:\"activationEmailTplType\";a:7:{s:4:\"name\";s:22:\"activationEmailTplType\";s:4:\"desc\";s:41:\"prop_register.activationemailtpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:18:\"activationEmailTpl\";a:7:{s:4:\"name\";s:18:\"activationEmailTpl\";s:4:\"desc\";s:37:\"prop_register.activationemailtpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:19:\"lgnActivateEmailTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:21:\"activationEmailTplAlt\";a:7:{s:4:\"name\";s:21:\"activationEmailTplAlt\";s:4:\"desc\";s:40:\"prop_register.activationemailtplalt_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:19:\"moderatedResourceId\";a:7:{s:4:\"name\";s:19:\"moderatedResourceId\";s:4:\"desc\";s:38:\"prop_register.moderatedresourceid_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:26:\"removeExpiredRegistrations\";a:7:{s:4:\"name\";s:26:\"removeExpiredRegistrations\";s:4:\"desc\";s:45:\"prop_register.removeexpiredregistrations_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:17:\"placeholderPrefix\";a:7:{s:4:\"name\";s:17:\"placeholderPrefix\";s:4:\"desc\";s:36:\"prop_register.placeholderprefix_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:14:\"recaptchaTheme\";a:7:{s:4:\"name\";s:14:\"recaptchaTheme\";s:4:\"desc\";s:33:\"prop_register.recaptchaTheme_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:3:\"red\";s:4:\"text\";s:16:\"opt_register.red\";}i:1;a:2:{s:5:\"value\";s:5:\"white\";s:4:\"text\";s:18:\"opt_register.white\";}i:2;a:2:{s:5:\"value\";s:5:\"clean\";s:4:\"text\";s:18:\"opt_register.clean\";}i:3;a:2:{s:5:\"value\";s:10:\"blackglass\";s:4:\"text\";s:23:\"opt_register.blackglass\";}}s:5:\"value\";s:5:\"clean\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"mathMinRange\";a:7:{s:4:\"name\";s:12:\"mathMinRange\";s:4:\"desc\";s:31:\"prop_register.mathminrange_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:2:\"10\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"mathMaxRange\";a:7:{s:4:\"name\";s:12:\"mathMaxRange\";s:4:\"desc\";s:31:\"prop_register.mathmaxrange_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"100\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"mathField\";a:7:{s:4:\"name\";s:9:\"mathField\";s:4:\"desc\";s:28:\"prop_register.mathfield_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:4:\"math\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"mathOp1Field\";a:7:{s:4:\"name\";s:12:\"mathOp1Field\";s:4:\"desc\";s:31:\"prop_register.mathop1field_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"op1\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"mathOp2Field\";a:7:{s:4:\"name\";s:12:\"mathOp2Field\";s:4:\"desc\";s:31:\"prop_register.mathop2field_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"op2\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:17:\"mathOperatorField\";a:7:{s:4:\"name\";s:17:\"mathOperatorField\";s:4:\"desc\";s:36:\"prop_register.mathoperatorfield_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:8:\"operator\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:27:\"preserveFieldsAfterRegister\";a:7:{s:4:\"name\";s:27:\"preserveFieldsAfterRegister\";s:4:\"desc\";s:46:\"prop_register.preservefieldsafterregister_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:26:\"redirectUnsetDefaultParams\";a:7:{s:4:\"name\";s:26:\"redirectUnsetDefaultParams\";s:4:\"desc\";s:44:\"prop_register.redirectUnsetDefaultParam_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:0;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(19, 0, 0, 'ResetPassword', 'Resets a password from a confirmation email.', 0, 3, 0, '/**\n * ResetPassword\n *\n * Copyright 2010 by Shaun McCormick <shaun@modx.com>\n *\n * ResetPassword is free software; you can redistribute it and/or modify it\n * under the terms of the GNU General Public License as published by the Free\n * Software Foundation; either version 2 of the License, or (at your option) any\n * later version.\n *\n * ResetPassword is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * ResetPassword; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx ResetPassword Snippet. Snippet to place on an activation\n * page that the user using the ForgotPassword snippet would be sent to via the\n * reset email.\n *\n * @package login\n */\nif (empty($_REQUEST[\'lp\']) || empty($_REQUEST[\'lu\'])) {\n    return \'\';\n}\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'ResetPassword\');\n$output = $controller->run($scriptProperties);\nreturn $output;', 0, 'a:3:{s:3:\"tpl\";a:7:{s:4:\"name\";s:3:\"tpl\";s:4:\"desc\";s:27:\"prop_resetpassword.tpl_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:15:\"lgnResetPassTpl\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:7:\"tplType\";a:7:{s:4:\"name\";s:7:\"tplType\";s:4:\"desc\";s:31:\"prop_resetpassword.tpltype_desc\";s:4:\"type\";s:4:\"list\";s:7:\"options\";a:4:{i:0;a:2:{s:5:\"value\";s:8:\"modChunk\";s:4:\"text\";s:18:\"opt_register.chunk\";}i:1;a:2:{s:5:\"value\";s:4:\"file\";s:4:\"text\";s:17:\"opt_register.file\";}i:2;a:2:{s:5:\"value\";s:6:\"inline\";s:4:\"text\";s:19:\"opt_register.inline\";}i:3;a:2:{s:5:\"value\";s:8:\"embedded\";s:4:\"text\";s:21:\"opt_register.embedded\";}}s:5:\"value\";s:8:\"modChunk\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"loginResourceId\";a:7:{s:4:\"name\";s:15:\"loginResourceId\";s:4:\"desc\";s:39:\"prop_resetpassword.loginresourceid_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"1\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(20, 0, 0, 'UpdateProfile', 'Allows front-end updating of a users own profile.', 0, 3, 0, '/**\n * Login\n *\n * Copyright 2010-2012 by Shaun McCormick <shaun+login@modx.com>\n *\n * Login is free software; you can redistribute it and/or modify it under the\n * terms of the GNU General Public License as published by the Free Software\n * Foundation; either version 2 of the License, or (at your option) any later\n * version.\n *\n * Login is distributed in the hope that it will be useful, but WITHOUT ANY\n * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR\n * A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n *\n * You should have received a copy of the GNU General Public License along with\n * Login; if not, write to the Free Software Foundation, Inc., 59 Temple\n * Place, Suite 330, Boston, MA 02111-1307 USA\n *\n * @package login\n */\n/**\n * MODx UpdateProfile Snippet. Handles updating of User Profiles.\n *\n * @var modX $modx\n * @var Login $login\n * @var array $scriptProperties\n * \n * @package login\n */\nrequire_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';\n$login = new Login($modx,$scriptProperties);\n\n$controller = $login->loadController(\'UpdateProfile\');\nreturn $controller->run($scriptProperties);', 0, 'a:13:{s:9:\"submitVar\";a:7:{s:4:\"name\";s:9:\"submitVar\";s:4:\"desc\";s:33:\"prop_updateprofile.submitvar_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:4:\"user\";a:7:{s:4:\"name\";s:4:\"user\";s:4:\"desc\";s:28:\"prop_updateprofile.user_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"redirectToLogin\";a:7:{s:4:\"name\";s:15:\"redirectToLogin\";s:4:\"desc\";s:39:\"prop_updateprofile.redirecttologin_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"reloadOnSuccess\";a:7:{s:4:\"name\";s:15:\"reloadOnSuccess\";s:4:\"desc\";s:39:\"prop_updateprofile.reloadonsuccess_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:12:\"syncUsername\";a:7:{s:4:\"name\";s:12:\"syncUsername\";s:4:\"desc\";s:36:\"prop_updateprofile.syncusername_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:10:\"emailField\";a:7:{s:4:\"name\";s:10:\"emailField\";s:4:\"desc\";s:34:\"prop_updateprofile.emailfield_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:5:\"email\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:11:\"useExtended\";a:7:{s:4:\"name\";s:11:\"useExtended\";s:4:\"desc\";s:35:\"prop_updateprofile.useextended_desc\";s:4:\"type\";s:13:\"combo-boolean\";s:7:\"options\";s:0:\"\";s:5:\"value\";b:1;s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:15:\"excludeExtended\";a:7:{s:4:\"name\";s:15:\"excludeExtended\";s:4:\"desc\";s:39:\"prop_updateprofile.excludeextended_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:13:\"allowedFields\";a:7:{s:4:\"name\";s:13:\"allowedFields\";s:4:\"desc\";s:37:\"prop_updateprofile.allowedfields_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:21:\"allowedExtendedFields\";a:7:{s:4:\"name\";s:21:\"allowedExtendedFields\";s:4:\"desc\";s:45:\"prop_updateprofile.allowedextendedfields_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:8:\"preHooks\";a:7:{s:4:\"name\";s:8:\"preHooks\";s:4:\"desc\";s:32:\"prop_updateprofile.prehooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:9:\"postHooks\";a:7:{s:4:\"name\";s:9:\"postHooks\";s:4:\"desc\";s:33:\"prop_updateprofile.posthooks_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}s:17:\"placeholderPrefix\";a:7:{s:4:\"name\";s:17:\"placeholderPrefix\";s:4:\"desc\";s:41:\"prop_updateprofile.placeholderprefix_desc\";s:4:\"type\";s:9:\"textfield\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";s:7:\"lexicon\";s:16:\"login:properties\";s:4:\"area\";s:0:\"\";}}', '', 0, ''),
(21, 1, 0, 'clubMenu', '', 0, 0, 0, '$menuGroups = $modx->getOption(\'scrm_grhash\');\n$id = $modx->resource->get(\'id\');\n\n$cache_path = CRM_PREFIX.\"/clubMenu/{$menuGroups}_\".$id;\n$menu = $modx->cacheManager->get($cache_path);\nif (empty($menu)) {\n    foreach($modx->getOption(\'club_modules\') as $midx => $module) {\n        $menuWhere[] = \'\"\'.$midx.\'\":{\"\'.\n        (($midx==0)? \'\':\'OR:\').\n        \'link_attributes:LIKE\":\"%\'. $module .\'%\"}\';\n    }\n    $menuWhere = \'{ \"0\":{\'. implode(\',\', $menuWhere) .\' } }\';\n    $menu = $modx->runSnippet(\'pdoMenu\', array(\n        \'level\' => 2,\n        \'scheme\' => \'abs\',\n        \'useWeblinkUrl\' => 1,\n        \'parents\' => 0,\n        \'firstClass\' => 0,\n        \'lastClass\' => 0,\n        \'checkPermissions\' => \'list\',\n        //\'where\' => $menuWhere,\n        //\'where\' => \'{\"0\":{\"0\":{\"link_attributes:LIKE\":\"%clubStuff%\"}, \"1\":{\"OR:link_attributes:LIKE\":\"%clubShop1%\"} } }\',\n        \'showLog\' => 0,\n        \'tplParentRow\' => \'@INLINE <li[[+classes]] id=\"menuitem[[+id]]\">\n        <a href=\"#menuwrapper[[+id]]\" class=\"nav-link collapsed\" data-toggle=\"collapse\" [[+attributes]]>[[+menutitle]]</a>\n        <div id=\"menuwrapper[[+id]]\" class=\"collapse\" data-parent=\"#left-menu\">\n        <ul class=\"nav flex-column\">[[+wrapper]]</ul>\n        </div>\n        </li>\',\n        \'tpl\' => \'@INLINE <li[[+classes]] id=\"mmenuitem[[+id]]\"><a href=\"[[+link]]\"[[+attributes]] class=\"nav-link\">[[+menutitle]]</a>[[+wrapper]]</li>\',\n        \n        \'tplInner\' => \'@INLINE [[+wrapper]]\',\n        \'tplOuter\' => \'@INLINE <ul id=\"left-menu\" class=\"nav nav-pills flex-column\">[[+wrapper]]</ul>\',\n        \'rowClass\' => \'nav-item\',\n    ));\n\n    $modx->cacheManager->set($cache_path, $menu, 1000); //7 дней // 604800\n}\nreturn $menu;\n\n/*\n[[!pdoMenu?\n    \n    &parents=`0`\n    &firstClass=`0` &lastClass=`0`\n    \n    &checkPermissions=`list`\n    &cache=`1`\n    &cache_key=`club_[[!#SESSION.club_groups]]`\n\n    &tplParentRow=`@INLINE <li[[+classes]]>\n        <a href=\"#menu[[+id]]\" class=\"nav-link collapsed\" data-toggle=\"collapse\" [[+attributes]]>[[+menutitle]]</a>\n        <div id=\"menu[[+id]]\" class=\"collapse\" data-parent=\"#left-menu\">\n        <ul class=\"nav flex-column\">[[+wrapper]]</ul>\n        </div>\n    </li>`\n    &tpl=`@INLINE <li[[+classes]]><a href=\"[[+link]]\"[[+attributes]] class=\"nav-link\">[[+menutitle]]</a>[[+wrapper]]</li>`\n    &rowClass=`nav-item`\n    &tplInner=`@INLINE [[+wrapper]]`\n    &tplOuter=`@INLINE <ul id=\"left-menu\" class=\"nav nav-pills flex-column\">[[+wrapper]]</ul>`\n    \n    &showLog=`0`\n]]\n*/', 0, 'a:0:{}', '', 0, ''),
(22, 1, 0, 'clubStatus', '', 0, 0, 0, '$tbl = $modx->getOption(\'tbl\', $scriptProperties, \'idSportsmen\');\n$addfields = $modx->getOption(\'addfields\', $scriptProperties, \'\');\n\n$json = getClubStatus($tbl, $addfields);\n\n$placeholderName = $modx->getOption(\'placeholder\', $scriptProperties, 0);\n$keyfield = $modx->getOption(\'keyfield\', $scriptProperties, \'\');\nif (!empty($keyfield)) {\n    $statuses = array();\n    foreach ($json as $status) {\n        $key = $status[$keyfield];\n        if (!empty( $key )) $statuses[$key] = $status;\n    }\n    $placeholderName = ($placeholderName)? :\'clubStatus\';\n    $json = $statuses;\n}\n\nif (!empty($placeholderName)) $modx->setPlaceholder($placeholderName, $json);\n\nreturn json_encode($json, JSON_UNESCAPED_UNICODE);', 0, 'a:0:{}', '', 0, ''),
(23, 1, 0, 'loginWay', '', 0, 0, 0, '$rcode = http_response_code();\n//$web = $modx->user->hasSessionContext($modx->context->get(\'key\'));\n//$modx->log(modX::LOG_LEVEL_ERROR, \"loginWay{$rcode}-{$web}.return: \".$_POST[\'returnUrl\'].\'; url:\'.$_SERVER[\'HTTP_HOST\'].$_SERVER[\'REQUEST_URI\'] );\n    \nif ($rcode!=200) {\n    $modx->setPlaceholders(array(\n       \'rcode\' => $rcode,\n       \'rurl\' => $_SERVER[\'REQUEST_URI\'],\n    ));\n} elseif ($user || $modx->user->hasSessionContext($modx->context->get(\'key\'))) {\n    //if (!empty($_SESSION[\'club_groups\'])){\n        //$ugroups = $modx->user->getUserGroupNames(); // при входе modx.user еще нету\n        \n        $ugroups = $modx->getOption(\'scrm_ugroups\');\n        foreach(getClubStatus(\'idPermission\', \'extended\') as $perm) {\n            if (in_array($perm[\'alias\'], $ugroups)) {\n                if (!empty($perm[\'extended\'][\'crew\'])) {\n                    $_SESSION[\'club_crew\'] = true;\n                }\n                if (empty($loginUrl)) {\n                    $loginUrl = $perm[\'extended\'][\'loginUrl\'];\n                }\n                //break;\n            }\n        }\n        if (!empty($loginUrl)) {\n            $_SESSION[\'club_loginUrl\'] = $loginUrl;\n            $modx->sendRedirect($loginUrl);\n        }\n    //}\n}\n\nreturn \"\";', 0, 'a:0:{}', '', 0, ''),
(24, 1, 0, 'dbedit', '', 0, 0, 0, '$data = ($data)? : $_REQUEST;\n$oper = $modx->getOption(\'oper\', $data, \'add\');\n$table = $data[\'table\'];\n//$modx->log(modX::LOG_LEVEL_ERROR, json_encode($data, JSON_UNESCAPED_UNICODE));\nif (empty($data[\"id\"])) {\n    if (!empty($row)) {\n        $data[\"id\"] = $row->get(\'id\');\n    } else {\n        $data[\"id\"] = \'\';\n    }\n}\n$ids = array_filter(explode(\',\', $data[\"id\"]));\n$out = array(\n    \'user_id\' => $userID = $modx->getLoginUserID(),\n);\n\nif (empty($table) || ($oper !== \'add\' && empty($ids)) ){ // || empty($userID)\n    $out[\'error\'] = \'Error: empty important param\';\n} else {\n    $flds = $modx->getFieldMeta($table);\n\n    unset($data[\"author\"]);\n    unset($data[\"edited\"]);\n    unset($data[\"editedby\"]);\n\n    $data_path = CRM_PATH.\"edit/{$table}_{modify,$oper}*_\";\n    foreach (glob($data_path.\"before.php\", GLOB_BRACE) as $data_handler) {\n        require($data_handler);\n    }\n    \n    $out = array_merge($out, array(\n        \'table\' => $table,\n        \'oper\' => $oper,\n    ));\n\n    if (!empty($row)) {\n        $ids = array($row->get(\'id\'));\n    }\n    \n    unset($flds[\"id\"]);\n    unset($flds[\"created\"]);\n\n    if ($oper==\"add\" || $oper==\"edit\") {\n        $e_array = array();\n        \n        if ($oper==\"add\") {\n            $data[\'author\'] = $userID;\n            if (empty($data[\'city\']) && !empty($_SESSION[\'club_city\'])) $data[\'city\'] = $_SESSION[\'club_city\'];\n        } else {\n            $data[\'edited\'] = date(\'c\');\n            $data[\'editedby\'] = $userID;\n        }\n        \n        foreach (array_keys($flds) as $_f) {\n            if (isset($data[$_f])) {\n                if ($data[$_f]===\'\' && in_array($flds[$_f][\'dbtype\'], [\'timestamp\',\'datetime\',\'date\',\'smallint\']) && $flds[$_f][\'null\'] == 1 ) {\n                    $e_array[$_f] = null;\n                } elseif ($flds[$_f][\'phptype\']==\'json\') {\n                    $e_ext = $data[$_f];\n                    if (!empty($e_ext) && gettype($e_ext)==\'string\') $e_ext = json_decode($e_ext, true);\n                    $e_array[$_f] = (empty($e_ext))? null : $e_ext;\n                    //array_merge(array(), json_decode($data[$_f], true)); //Работает только так\n                } elseif ($flds[$_f][\'phptype\']==\'string\') {\n                    $e_array[$_f] = trim($data[$_f]);\n                    if ($_f == \'email\') {\n                        $e_array[$_f] = $email = strtolower($e_array[$_f]);\n                    }\n                } else {\n                    $e_array[$_f] = $data[$_f];\n                }\n            }\n        }\n        \n        if ($oper==\"add\") {\n            $mfield = $data[\'addmulti\'];\n            foreach (explode(\',\', $data[$mfield]) as $mvalue) {\n                if (!empty($mfield)) $e_array[$mfield] = $mvalue;\n                if (($row = $modx->newObject($table, $e_array)) != null) {\n                    $row->save();\n                    $ids[] = $row->get(\'id\');\n                }\n            }\n        } elseif (sizeof($ids) == 1) { //редактируется один элемент\n            if (empty($row)) $row = $modx->getObject($table, $ids[0]);\n            if (!empty($row)) {\n                $old_data = $row->toArray();\n                $row->fromArray($e_array);\n                $row->save();\n            }\n        } else {\n            $out[\'result\'] = $modx->updateCollection($table, $e_array, array(\"id:IN\" => $ids));\n        }\n        \n        $out[\'data\'] = $e_array;\n    } // END add or edit\n    \n    if ( $oper == \"del\" ) {\n        if (empty($del_rows)) $del_rows = $modx->getIterator($table, array(\'id:IN\' => $ids));\n        foreach ($del_rows as $del_row) {\n            $del_row->remove();\n        }\n        //$modx->removeCollection($table, array(\"id:IN\" => $ids));\n    }\n    \n    $out[\'ids\'] = $ids;\n    $out[\'id\'] = implode(\',\', $ids);\n\n    foreach (glob($data_path.\"after.php\", GLOB_BRACE) as $data_handler) {\n        require($data_handler);\n    }\n    \n    if (!empty($row)) {\n        $modx->setPlaceholder($modx->getOption(\'placeholder\', $scriptProperties, \'dbeditRow\'), $row);\n        $out[\'row\'] = $row->toArray();\n    }\n}\n\nreturn json_encode($out, JSON_UNESCAPED_UNICODE);', 0, 'a:0:{}', '', 0, ''),
(25, 1, 0, 'clubRecoverAccess', '', 0, 0, 0, '$data = $_POST;\n\n$json = array(\n    \'pd\' => $data,\n    \'sd\' => array(\n        \'email\' => $_GET[\'email\'],\n    ),\n    \'token\' => $_GET[\'token\'],\n    \'created\' => date(\'c\'),\n);\n\nif (!empty($_GET[\'token\'])) {\n    $idUserPassword = getClubExtId(array(\n        \'extoken\' => $_GET[\'token\'],\n    ), \'idUser_password\');\n    /*$modx->getService(\'registry\', \'registry.modRegistry\');\n    $modx->registry->addRegister(\'login\',\'registry.modFileRegister\');\n    $modx->registry->login->connect();\n    $modx->registry->login->subscribe(\'/clubrecover/\'.$_GET[\'token\']);\n    $msgs = $modx->registry->login->read(array(\n        \'poll_limit\' => 1,\n        \'remove_read\' => false,\n    ));\n    $internalKey = reset($msgs);*/\n    if (!empty($idUserPassword) && !empty($idUserPassword[\'parent\'])) {\n        $user = $modx->getObject(\'modUser\', $idUserPassword[\'parent\']);\n        if (!empty($user)) {\n            if (!$user->hasSessionContext(\'web\')) {\n                $user->addSessionContext(\'web\');\n                $modx->invokeEvent(\'OnWebLogin\',array(\n                    \'user\' => $user,\n                    \'returnUrl\' => true,\n                ));\n            }\n            $modx->sendRedirect(\'/login/change-password.html\');\n        }\n    }\n} elseif (!empty($_POST[\'email\'])&&!empty($_POST[\'recoveraccess\'])) {\n    $Profile = $modx->getObject(\'modUserProfile\', array(\'email\' => $_POST[\'email\']));\n    //$modx->log(modX::LOG_LEVEL_ERROR, \"Log2 \".$_POST[\'email\']);\n    if (!empty($Profile)) {\n        $bytes = openssl_random_pseudo_bytes(32);\n        $data[\'token\'] = bin2hex($bytes);\n        setClubExtId(array(\n            \'parent\' => $Profile->get(\'internalKey\'),\n            \'extoken\' => $data[\'token\'],\n            \'duedate\' => (new DateTime(\'today +1 week\'))->format(\'c\'),\n        ), \'idUser_password\');\n        /*$modx->getService(\'registry\', \'registry.modRegistry\');\n        $modx->registry->addRegister(\'login\', \'registry.modFileRegister\', array(\'directory\' => \'login\'));\n        $modx->registry->login->connect();\n        $modx->registry->login->subscribe(\'/clubrecover/\');\n        $modx->registry->login->send(\'/clubrecover/\', array(\n            $data[\'token\'] => $Profile->get(\'internalKey\'),\n        ), array(\n            \'ttl\' => 7*24*60*60,\n        ));*/\n        \n        //$modx->log(modX::LOG_LEVEL_ERROR, \"Log2 \".json_encode($Profile->toArray(), JSON_UNESCAPED_UNICODE));\n        \n        $modx->runSnippet(\'makeMsg\', array(\n            \'handler\' => \'clubRecoverAccess\',\n            \'data\' => $data,\n        ));\n    }\n} else {\n    $cookie_domain = $modx->getOption(\'session_cookie_domain\', null, \'PHPSESSID\', true);\n    $servname = explode(\'.\', $_SERVER[\'SERVER_NAME\']);\n    setcookie($cookie_domain, \'\', time() - 3600, \"/\");\n    setcookie($cookie_domain, \'\', time() - 3600, \"/\", \'.\'.$servname[sizeof($servname)-2].\'.\'.$servname[sizeof($servname)-1]);\n    unset($_COOKIE[$cookie_domain]);\n    \n    /*return $modx->runSnippet(\'ForgotPassword\', array(\n        \'resetResourceId\' => $id,\n        \'redirectTo\' => $id,\n        \'redirectParams\' => \'{\"rpas\":\"ok\"}\',\n        \'emailSubject\' => \'Восстановление пароля\',\n        \'tpl\' => \'idForgotPassTpl\',\n        \'emailTpl\' => \'idForgotPassEmail\',\n        \'sentTpl\' => \'idForgotPassSentTpl\',\n    ));*/\n}\n\necho json_encode($json, JSON_UNESCAPED_UNICODE);', 0, 'a:0:{}', '', 0, ''),
(26, 1, 0, 'dbvalues', '', 0, 0, 0, '$json = array(\n    \'club_city\' => $_SESSION[\'club_city\'],    \n);\n\n$mode = $modx->getOption(\'mode\', $scriptProperties, $_REQUEST[\'mode\']);\n$city = $modx->getOption(\'city\', $scriptProperties, $_REQUEST[\'city\']);\n$lessdata = $modx->getOption(\'lessdata\', $scriptProperties, $_REQUEST[\'lessdata\']);\n\nif ($city == \'my\') $city = $_SESSION[\'club_city\'];\n$mode = empty($mode)? array() : explode(\',\', $mode);\n\nif (in_array(\'idLevel\', $mode)) {\n    $q = $modx->newQuery(\'idLevel\');\n    $q->sortby(\'name\',\'ASC\')->select(array(\'idLevel.*\'));\n    $stmt = $q->prepare();\n    $stmt->execute();\n    $json[\'idLevel\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);\n}\n\nif (in_array(\'idInvoiceType\', $mode)) {\n    $q = $modx->newQuery(\'idInvoiceType\', array(\n        \'published\' => 1,\n    ));\n    $stype = $modx->getOption(\'stype\', $scriptProperties, $_REQUEST[\'stype\']);\n    if (empty($stype)) {\n        $q->leftJoin(\'idSInvType\');\n    } else {\n        $q->innerJoin(\'idSInvType\');\n        $q->where(array(\n            \'idSInvType.stype\' => $stype,\n        ));\n    }\n    $q->groupby(\'idInvoiceType.id\');\n    $q->sortby(\'menuindex\',\'ASC\');\n    $q->sortby(\'name\',\'ASC\');\n    $q->select(array(\n        \'idInvoiceType.*\', // Так выдает нормально все поля\n        \"GROUP_CONCAT(idSInvType.stype SEPARATOR \',\') as stype\",\n        //\'idSInvType.stype\',\n    ));\n    $q->prepare(); //$json[\'sqq\'] = $q->toSQL();\n    $q->stmt->execute();\n    $json[\'idInvoiceType\'] = $q->stmt->fetchAll(PDO::FETCH_ASSOC);\n}\n\nif (empty($mode) || in_array(\'idSport\', $mode)) {\n    $q = $modx->newQuery(\'idSport\', array(\n        \'published\' => 1,\n    ));\n    $q->sortby(\'menuindex\',\'ASC\');\n    $q->sortby(\'name\',\'ASC\');\n    $q->select(array(\'idSport.*\'));\n    $stmt = $q->prepare();\n    $stmt->execute();\n    $json[\'idSport\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);\n}\n\nif (empty($mode) || in_array(\'idTrainer\', $mode)) {\n    $q = $modx->newQuery(\'idTrainer\', array(\n        \'published\' => 1,\n        \'name:!=\' => \'_\',\n    ));\n    $q->sortby(\'name\',\'ASC\');\n    $q->select(explode(\',\',\'idTrainer.id,idTrainer.name,idTrainer.city,idTrainer.uid,gender,categ,iduser\'));\n    if (empty($lessdata)) {\n        $q->select(\'content\');\n        $q->groupby(\'idTrainer.id\');\n        $q->leftJoin(\'idFiles\', \'idFiles\', \"idFiles.uid = idTrainer.uid AND idFiles.filetype=\'tr_photo\'\");\n        $q->select(\"GROUP_CONCAT(CONCAT_WS(\'.\', idFiles.key, idFiles.fileext) SEPARATOR \',\') as photo\");\n    }\n    \n    if (!empty($city)) $q->where(array(\'city\' => $city));\n    $stmt = $q->prepare();\n    $stmt->execute();\n    $json[\'idTrainer\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);\n    \n    if (empty($lessdata)) {\n        $psize = $modx->getOption(\'size\', $scriptProperties, \'md\');\n        include_once(CRM_PATH.\'club_thumb.php\');\n        foreach($json[\'idTrainer\'] as $n => $v) {\n            $fn = explode(\',\', $v[\'photo\'])[0];\n            if (!empty($fn)) $fn = \"tr_photo/{$fn}\";\n            $json[\'idTrainer\'][$n][\'photo\'] = getClubThumb($fn, $psize, $v[\'gender\']);\n        }\n    }\n}\n\nif (in_array(\'idSquad\', $mode)) {\n    $q = $modx->newQuery(\'idSquad\', array(\n        \'published\' => 1,\n    ));\n    if (!empty($city)) {\n        $q->where(array(\'idClub.city\' => $city));\n        $q->innerJoin(\'idClub\');\n    }\n    $q->leftJoin(\'idLevel\');\n    $q->leftJoin(\'idSport\');\n    $q->sortby(\'lvl_name\',\'ASC\');\n    $q->sortby(\'idSquad.name\',\'ASC\');\n    $q->select(array(\n        \'idSquad.id\',\n        \'idSquad.name\',\n        \'club\',\n        \"CONCAT_WS(\', \', idLevel.name, idSquad.name) as squad_name\",\n        \'idLevel.name as lvl_name\',\n        \'idSport.name as sport_name\',\n        \'idSport.shortname as ssport_name\'\n    ));\n    $stmt = $q->prepare();\n    $stmt->execute();\n    \n    $json[\'idSquad\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);\n}\n\nif (empty($mode) || in_array(\'idClub\', $mode)) {\n    $q = $modx->newQuery(\'idClub\', array(\n        \'published\' => 1,\n    ));\n    if (!empty($city)) $q->where(array(\'city\' => $city));\n    $q->sortby(\'name\',\'ASC\');\n    $q->select(explode(\',\',\'id,name,address,city\'));\n    $stmt = $q->prepare();\n    $stmt->execute();\n    \n    $json[\'idClub\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);\n    if (!empty($json[\'idSquad\'])) {\n        foreach ($json[\'idClub\'] as $idx => $club) {\n            $inner = array();\n            foreach($json[\'idSquad\'] as $row) {\n                if ($row[\'club\'] == $club[\'id\']) $inner[] = $row;\n            }\n            $json[\'idClub\'][$idx][\'idSquad\'] = $inner;\n        }\n        //unset($json[\'idSquad\']);\n    }\n}\n\nif (empty($mode) || in_array(\'idCity\', $mode)) {\n    $q = $modx->newQuery(\'idCity\', array(\n        //\'published\' => 1,\n    ));\n    if (!empty($city)) $q->where(array(\'id\' => $city));\n    //$q->sortby(\'menuindex\',\'ASC\');\n    $q->sortby(\'name\',\'ASC\');\n    $q->select(explode(\',\',\'id,name\'));\n    $stmt = $q->prepare();\n    $stmt->execute();\n    $json[\'idCity\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);\n\n    foreach ($json[\'idCity\'] as $idx => $city){\n        if (!empty($json[\'idClub\'])) {\n            $inner = array();\n            foreach($json[\'idClub\'] as $idClub) {\n                if ($idClub[\'city\'] == $city[\'id\']) $inner[] = $idClub;\n            }\n            $json[\'idCity\'][$idx][\'idClub\'] = $inner;\n        }\n        \n        if (!empty($json[\'idTrainer\'])) {\n            $inner = array();\n            foreach($json[\'idTrainer\'] as $idTrainer) {\n                if ($idTrainer[\'city\'] == $city[\'id\']) $inner[] = $idTrainer;\n            }\n            $json[\'idCity\'][$idx][\'idTrainer\'] = $inner;\n        }\n    }\n    unset($json[\'idClub\']);\n    unset($json[\'idTrainer\']);\n}\n\nif (!empty($placeholder)) $modx->setPlaceholder($placeholder, $json);\nclubAllowOrigin();\nreturn json_encode($json, JSON_UNESCAPED_UNICODE);', 0, 'a:0:{}', '', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_templates`
--

CREATE TABLE `mx_site_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `property_preprocess` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(191) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(191) NOT NULL DEFAULT '',
  `template_type` int(11) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text,
  `static` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `static_file` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_site_templates`
--

INSERT INTO `mx_site_templates` (`id`, `source`, `property_preprocess`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `properties`, `static`, `static_file`) VALUES
(1, 0, 0, 'Начальный шаблон', 'Template', 0, 0, '', 0, '<!doctype html>\n<html lang=\"en\">\n<head>\n    <title>[[*pagetitle]] - [[++site_name]]</title>\n    <base href=\"[[!++site_url]]\" />\n    <meta charset=\"[[++modx_charset]]\" />\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\" />\n\n    <style type=\"text/css\">\n        body {\n            background-color: #eee;\n            font-family: sans-serif;\n            font-size: 20px;\n            line-height: 1.4em;\n            padding: 0;\n            margin: 0;\n        }\n        body.loaded {\n            font-family: \'Open Sans\', sans-serif;\n        }\n        .container {\n            display: block;\n            max-width: 960px;\n            margin: 2em auto 2em;\n            padding: 2em;\n            background: #fff;\n            border: 1px solid #ddd;\n            border-radius: 3px;\n        }\n        .container > section {\n            height: 100%;\n            width: 60%;\n            display: inline-block;\n            float: left;\n            margin-bottom: 2em;\n        }\n        .container > aside {\n            height: 100%;\n            display: inline-block;\n            width: 30%;\n            border-left: 2px dashed #eee;\n            float: right;\n            padding-left: 1.5em;\n        }\n        .logo {\n            background: url(\'[[++manager_url]]templates/default/images/modx-logo-color.svg\') no-repeat center transparent;\n            width: 220px;\n            height: 85px;\n            background-size: contain;\n            display: block;\n            position: relative;\n            text-indent: -9999px;\n            margin: 2em auto;\n        }\n        h1, h2, h3, h4, h5 {\n            color: #494949;\n            font-family: \'Open Sans\', sans-serif;\n            font-weight: 700;\n        }\n        h1 {\n            font-size: 36px;\n            color: #137899;\n        }\n        h2 {\n            font-size: 29px;\n        }\n        h3 {\n            font-size: 24px;\n        }\n\n        a {\n            color: #0f7096;\n        }\n\n        ul {\n            padding-left: 2em;\n        }\n\n        img {\n            max-width: 100%;\n        }\n\n        .cta-button {\n            display: block;\n            text-align: center;\n            vertical-align: middle;\n            -webkit-transform: translateZ(0);\n            transform: translateZ(0);\n            box-shadow: 0 0 1px rgba(0, 0, 0, 0);\n            -webkit-backface-visibility: hidden;\n            backface-visibility: hidden;\n            -moz-osx-font-smoothing: grayscale;\n            position: relative;\n            overflow: hidden;\n            margin: .2em 0;\n            padding: 1em;\n            cursor: pointer;\n            background: #67a749;\n            text-decoration: none;\n            border-radius: 3px;\n            color: #fff;\n            -webkit-tap-highlight-color: rgba(0,0,0,0);\n        }\n        .cta-button:before {\n            content: \"\";\n            position: absolute;\n            z-index: -1;\n            left: 50%;\n            right: 50%;\n            bottom: 0;\n            background: #137899;\n            height: 5px;\n            -webkit-transition-property: left, right;\n            transition-property: left, right;\n            -webkit-transition-duration: 0.3s;\n            transition-duration: 0.3s;\n            -webkit-transition-timing-function: ease-out;\n            transition-timing-function: ease-out;\n        }\n        .cta-button:hover:before, .cta-button:focus:before, .cta-button:active:before {\n            left: 0;\n            right: 0;\n        }\n\n        .companies {\n            clear: both;\n            display: block;\n            width: 100%;\n            padding: 1em 0 0;\n            border-top: 2px dashed #eee;\n        }\n\n        .companies h3 {\n            text-align: center;\n            margin: 0;\n        }\n\n        .companies ul {\n            margin: 0;\n            padding: 0;\n            list-style: none;\n            text-align: center;\n        }\n\n        .companies ul li {\n            display: inline-block;\n            padding: 0 1em;\n        }\n\n        .companies ul li:first-child {\n            padding-left: 0;\n        }\n\n        .companies ul li:last-child {\n            padding-right: 0;\n        }\n\n        .companies ul li a {\n            display: block;\n            position: relative;\n            text-indent: -99999px;\n            width: 200px;\n            height: 75px;\n            background-repeat: no-repeat;\n            background-size: 200px;\n            background-position: center;\n        }\n\n        .companies ul li.modmore a {\n            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAABxCAMAAAAUAqFnAAADAFBMVEUgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToB8YRCjAAAA/3RSTlMAAQIDBAUGBwgJCgsMDQ4PEBESExQVFhcYGRobHB0eHyAhIiMkJSYnKCkqKywtLi8wMTIzNDU2Nzg5Ojs8PT4/QEFCQ0RFRkdISUpLTE1OT1BRUlNUVVZXWFlaW1xdXl9gYWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXp7fH1+f4CBgoOEhYaHiImKi4yNjo+QkZKTlJWWl5iZmpucnZ6foKGio6SlpqeoqaqrrK2ur7CxsrO0tba3uLm6u7y9vr/AwcLDxMXGx8jJysvMzc7P0NHS09TV1tfY2drb3N3e3+Dh4uPk5ebn6Onq6+zt7u/w8fLz9PX29/j5+vv8/f7rCNk1AAAXa0lEQVR4Ae3deVxU5eLH8e+wMCigqICguSSiiUiauedSmUtYXVtysbr6u+WtrpmWy22xunmte7Ml762riVppmpaauZuaqKSmLbmgoKip4CKOCrIzzPc3nDPnzHNmgQGGQJn3n3OYM/D6zGHOeeac80Cr48Sl+84YzOajXEJSDGapO+aMagaP64nXyJ1FtFiOcgk10OLqkm64bnh02k6rZeWMfoEq4+z6uD54DM+ke6KTP0XB43rwUDHdFp3HmqHm82ifSTdGZ4IvajoP7wS6NTonoabzeJBujn4xFDcAr9FTJptNGaPDjUe33d3R+QJuAN4nKDnpjRtPe6Pbo+/zuhGiH6Dk4I0YfTxtrUG5hOXSRmEbT/SabSlF22fN+NcIlEvAK2/PiD9M0QhP9BpN9yutMgajguq8RsEMT/Qard5ZWv0fKm4lrRZ5otdoTa9QdTEYFfcnWq1GjeaJfpWq3aiEdkaqvsf1whN9AyqhSQ5ViZ7otS/6Tk90T3RPdE90T3RP9BrJE13nY+WJXkui33pItat+1Uf3C2nbqVfvbu0b+8BWUMsO3Xrf0SkyCC7RBYQ1btw40NVuviGtoju2aVHfG2auRfeq08j8CiH+sOPfMLxxeAM9XKavW7euHuWir39TVCsdHPEPbx0bGxnqV+HoPanKbVSl0f06PP7BxpSMfJoVGpK+ejYKisYDXvpyb/o1I81y0hJmDghAqRoMfH3lL2mXDAZD+v41M4aEoXT1Bs5Yl5yRU2jKyzp/cM3bQyPLil633dAp8zf+euqi+RUyTiYu+GsMLCL6jH3/m90nLpgXXEjdvuBvnX1QhtYj3l390/G0tLRje755a2hzlCmk4yNT567+MfX81dxfvGCrQdy7W05czjUacy6lrH3tDr8KRe9O1eWGVRe93pA5R4zUylk9AGa3Tv7OQBvHXguFU70XpFPj4rLBcC72P6eolZ1fSvQ63SatSi2iVuHOJwMROWrOT1doY/+rzeBc2LiduRRlbvxzPTjlGzNmzp4LJiqSbKN3+DidGgcmNayp0bv/5yQdWtb1uV1GOnLqCTjWcRUd2NoPjoV9lEdHHEcPvn/eMTqWtC2HDl2aXh+OBb6UTnvHnvaGI+EPxycVUeOgNnqj/+TRzskna2J0n6FbTKyAj33hwAu5dMj4tg8cuDOVdDW6z53z0lgRh3rAkV6/0bGEaNhqNGrlJcqcRu9+hA6tCK150duygr70gi2veDr1bT3YGZlHl6N7r2VFZT8Ie2Ny6UzGIGgEvXeGAsfRh1yjE/tvruLoO1Be0UWsoBmwNY+l2KiHjbgiuh7d5wwrLH8QbD3FUuTeC1EUWWb0Pjl0Kikcish8qja6K3oiyqtdIV11zWC4aqKquA+0XqZVYVrKvr3Jp/NoNQdakQaq8k7s27xxx6Gzxc6jH2PFZbSC1mAjS3P1Vggi88qM3iSdpdjqC4uBtFpZmeghl6hKC6h49Is/xE8ZNaBrp9vuHDU9IZ8i0+HFLwzp2DKiSbMOw+Iv0WKXF0TdimiRs2T4LfW9Ae+gqKHzrGkfgki3kYpNf46qIz3UIGbk7OQqiM610Ig4x9L9Vrd80b9iqV51dMLLrMpE90uh1ZiKRv+pdyMI2i+iomjP1Nv8YNX8K1oMgMArkRbrYiBoqa7peJDDs/5PPwCRftA590fnIIg+Z1leL1f0gdQyUSv3FkgmUDC6MtHxDa0u3lbB6F/CxlRaPKWDlk6p/gUE99Nivhe0ptHieVh576XsRGvY+LUKom+BoLORZbnStBzRdTsoKnq7Y6dZ1FgMs+YfUZDdHE7EUmXwgxNjKDCMrVOh6MthazllU2Ar7CIlaYGw+p6y77xg6zPKUvRQ9aEsr7v92LuL0S+fNtCBjJQf95ygjaJoWC2mVvrCd5ZdptY/y45+2Ev4WwSPwWwyRQVtgPkGij6F6PZBVhOouvbIIKtmEASnUXTkefdE72J0upc5h7LOwnqKKMm5BXYapVPWH6r/UfY+KhQ9+Y2HY5sGRdy9lFprhsc29gHq9t1IrRehapZNjYWhAG7+jhqn6pYe3VSQs0+JHk/RIki2UPQWUEjRpRYQJbBs4yB6nBo/uCe6z1FKjvnD1jDKRkI1mbL5cOBVyj6GQm9pmNOyYtHfEVYtehcW3kupsRqqp6mxSYcSQQepMdBZ9CMLp4+9v2/ndjffBFnAKQoKYyHpr32SHwwUFN4HjY0s29PQ+Iii79wTHespyWzsdFfj7/a/dR840Drf0tEHFrcWU7IeFYv+ARSJFP3m5eSir+N6KFZTVBAL2RBqzHIWfRRs3EHRXsj8jlJQ3EkT3TAUlY6Od6si+leUFETBVnQhJf+Gov5ZSn6vA0d2UZLXChajKZtQ6eh/oSirKRQfU3StBSyC0inaBAufJIr2OYv+OGy8SNGHsJhL0TNi9PXRcEN0DDvq/ugL1J0QW7cU2EaPNZU64vAeZffCYiZld1Q6esdiCoQVDqdGJydPeA6K9ym60thJ9CdgY7HjNM9QFK9ELzy+eBDgluio/9Smi6bqiz6Ustfh0Gjbg7YVlGQ2rXT0FtcoGg5FH2r0g8XDFJm6QzFMu6CLi9F1eylK2ZEo2ZFC0Q4l+qU3m8Ad0WVdlhVWX/TxlD0Gh/pS9p7N//sT+kpHD7/sZBe3t5PoUyjKioCis4mih12MHpBGF6TAQIusRR3dFP3BnSay+qLPoOzu0r/WWawkPEjJL3B39IllRv+AIuFt1yyLoudcjN40iy64CANVua+6I3rECpLVGf1/lHWFQy2vacfAA45Tst3t0SeUGf1Tin7VQVHvAkXTXIzeroAuuAwDBZ95Vzp6ZDKrOfo8SoyxcCjsEiVbbKKvr4boyylKhKrOSYrecTH67Sa6wIDLFH0EjS0s298gapRE0eZqiB5PSX7b0qPvqgHRV1G0VfPNleh9F6P3oGvRs6kxBKLFZ9MVaRlUFZ9LS1ecfRyiudTYWn1belEMHAq1RP9eiX6Ckm3VEP0birZD5X+covfcGj0D9yw0UrDXB4LAhg0UwfdQdaVVA1VDPQTtiyhInx5TDdE/oawLHGqWqd2yfZMo2VcN0RdS9LMOiqDzFL3hYvTbiumCdAB9TlLQA07cTtXlenBiOgUrmgDVEP3flPUr/VWWweJHSlJ8/vjo/6UoxReKiCsUTXQxetsCCozHjiQ7shJm7Q20mlKZ79N1P9Bqqw+qJfqLlD1a+kUb/4XFOkouhPzx0V+hyBACRQcjRSNcjB5+lYKc1n6O6OUur9NqQWWiB52mqrAzqif6MMqmwqHhtu/u2ZQY2//x0R+nyNgRivuocYeL0fUnSjlHp5SPgrWViR6eSdUhr2qK3pWyhaV/Aj0Ei4mUPfjHR+9GjdHCLynKbu5idGynaANK0TzbXWfD5lK1HdUUPcRASZIPHNlCiTEaFv0pm/nHR2+UQdFSKPbYnoHtYvSPqTER9jo0tLS6Uv0XO7gvOnZqR2ccf+yl+tv+e9rv7TT6oSqKju8putoEstuNFC2Aq9GfoIZpEmx0nJfZVrzY4YaJPoOyt+HAWPszKRM0X3KJvPZT8rNXFUV/mRpzHY+EDnc1urxctKYHVN5tn9lcxMJWN2T0HpSdD4Ed/WHKHoFqEmVfwVbQOUo2oIqity9ycJt83/epcSnE5ehIoI3ihFfiune/Y/Djb3x5MJ9meTdmdJ/92g1H9AplZ+vD7gKf4ntg4z5tV/dHxxZqbR0/YspeasXD9ehPsXQ3bHQ8TYvxsDG8kPY/jhWUnY6ERr3fKHugyqLfyzIVxpYjenC6W6P3oqqoUc2OHpBKi3cCIfCbVETZ5aYQdC2m7FhvCKK2U3Y+uMqi67ayLPNRjuh43q3Rw8epnvKv2dHxEBVHpnSoA4lv23G/OJt34lNaFM7tGQhJo94fGmgxE1UWHR3zWLpzTcoVXb/PndE1anh0LBBHoLct/eKLL7cczqfqO29ohJ2i6uTWJV98sWrPOarOR1RhdIxj6e5DuaLj1qzaGj0gkaVIjoCNfvl0bhiqMjo+YGleQDmj4xEjS1MYeaNGR9gPdOpIJOwMLaAz01C10fEunTK9CNeiu35XjWs33bDREbSQTqyLgAMDz9Ih42RUdXSMvULHzjyACkRHnyN0akMPnX309aiEiJoRXTYqhQ6kjdPBoZu/pgP77kLVR0f0cjqQ/8lNqFB0NPjXVTpSsGYQZNrom1EJzfMqc/uR9s7fd19SdgtsRTu/mULQsz/SxsGpjeHUwDV51DAmjtbDns85imZDEVFE0RQo+lGjP+z0mn+BWqc+iIWdKGr8Bc5ETk+mjdzdr3WA1U2ZVB3QoeLEszE3orwiZsfPNZv3NOyMnj/XLH62fbJwy5MeggO6rlPXJGcV06w4J3Xjm331KFW751cdzTHRrOjqoRUvdoJDXjPi51rNHwZF/Q/FBfOsbaPihQXx8W3hQNjQd79PzSww0ZR/JXnjW4OC4UDox5pX6AHn6vad9u1BQ14xWZRz8eDGmSNaQ6Oxgaq8SFTc87RaiZpB3/TWvv379+vUrC5cUadZ57v69+/VvrEv/nh1w9t07npb6zA93MMnpFWnrl2imzf0gR3/k7SKR4U1PEqrOajRPHZQsOD2+np/X5SLTu/vHxa3j4LJqNE8PqLGmZRjs1AuDfccPZpBjf6o0Twepq2VKJewq7RxuRFqNI9Qg9tnVV6JGs4j3u3R41DDeUTnuTn6Lm/UdB5vuTe6sRdqPA//HW6NPg3XAY+IX90YfQ6uCx5ha90V3TgN1wkP3bOn3BJ9Rz9cPzwaPp2QRdkalEtYLmVpiwfrcH3xaD5o4vvzF8xf8DTKJehD83M+efupnvVRq3h4eHh4eHh4eHh4eHh4eHh4eHh4eLSIiQmBKDomJhAK/07Dnx3317iWUDWJaS+JiQyEIlJ6TBbTEhpB4rIoHWS+HR41r/f+1lA1Vtbbuh7sBcbEtIOocUxMc6iaDnpy3N9GdQmAwr99jLSy9k29YVGvU/uYAKhuiYltCUWL+8dNHHtnMGqLdUbjIbH6S0VG492QNXgt2cQS2ZsfhMVco0X+yS/7Q6L72SjYYjsVtiBJjxIBkw8YWSJvx2OweNtoUXB6eRxsDTQaC5+DVUSq0fgNLPp/e4WSE+80hayjUVaUdeDj7pCEHDFZn4IxBcbCAZDdt42kicya3wG1wyaSK6C620jyHki6JtPqi7qQLKDgvz5S9AMU7IVGHAVnpejRP9Pq22BI3qHg8zrQGqyd69Vrk/WbTp9ZtEobDEknWhXPDkKJu0zkeMiirpD/giRiNX9/o2/z8Kj75xfxdR1qgw2ay22anLFeiNHhInlt0V/j7h360g6Sq3yUOQJWvG42fcnvyuS2ut9YuOLzhbJFf4fGveSpz5Rl//YF0PIUmf/Vs0PufWDSZpIJdZU7km983ezNhakkZ0NrEM2ONoTFmzT71nqm8k9vPHTvvWPiL5H5/ZToaa+bzVybQXJroHKiY3YHlPBOIHf6osQtvxdPqANZy4Vc5ltrohf2gcR7I9XoPrvJfTGQPZFDTlCiD4UkeCaZ20qOnhkKkTb6Moh068mkrpA9eIWcoUR/GpKAV8niTg6iczlkQ0zW6I+SxS94W6JtIo8HW6LvgqTpm0XKNCz6H8k9fjB7ibwchRKhqVe7wepFLqgd0QtPkCcbo8Q/yNyzlugPk2lNxUnAzwZboj8Gi63kM3L0rBalRF8B0d3klTZQ3F/MzKaW6BOFCXtes4t+rpB8QW57njxjkqP7HRJPMw08SE60RP8RFiOLWRSLErHZ8lusS776Ryw1dQPm7d5/4MDP/+sM4A2OqBXRi+KOkWt0AOJM5LhlluhrtFPn7yZH2kYfT84qd/TPyOmwWkc+Zxt9JLnYLvoXfycL+pR0TiD3D7dE76udS/pB8hdvm+j4TJ1WdQJp7IvAA1Q26L6cAuAAf97741Hm/wnw2pseWBuis1XPYvIVeQtagTVy9AYZzL4JVs+Rn9pGf5z8pLzR/VO1cwaNIFfbRo8jV9hFX45N5PFQYCaZH9udcvTp5DuwqnuGhVG20buZmOSLEroNZEq9mWRSPUi+ueAP4JdMf0A3pOC4PzCAo2pF9E54hSy6EwlkagjWy9FvV2fKkXUh9+psos8gp1mih5cS/WsIogqZqodVmwIe87OJPoGcZRd9FZqklZQeSnI8BliiryLvh2AdeZ9tdP1x5raApEUGuTuf+d0gCc77AFL0AJitZxTgc2ZNLYmONeTReWReTyjR77OJ1TSLp+rK0UcoD50i75SjZ/eLaiNp29A++iZlWWMAvcnvIQg6z0vhcvTxkDVIIh92EB0DjeT/0sglUKPvpakjBLPIZ2yjYyvZC7KRLDEJsu4cLEevA7PveDOAxedqS/TwkywxHmr0x8h5EDQ8R0OwHH1sveDg+g1aPZFM7vaVozMvV5b3d/voxlxZ/ifyv+7VEOiPMedmOfrLJesNbvHoz2RyoKPomMYSScFqdO+jzImEYBr5kl30ZcLM4PPEcYmH2U6KntXQ17feKNNPPgBeLa4t0dG3iOQSOI/e6Lwa3XD6zJkz6Xkkz3eAHN3qn/bRVcscRT/K7JZy9Csl603LIZnZEw6je60nmd0ZanSf47x2MwSTyH/YRf+UjIPFAyZhXpBRbAWzH02nTx0/zQvdYTaRtSY6pshbkBp9OPkpBCEXeLG+HF1RtD4aluhF65Z9LVn+kH30tGVfycueBTCQXAeB/wleayFHVxgTusBxdISfIsfCGt3rEAvaQjCDfMEu+ipyAGShx8UJcOPYWYpenHQgjQkRKPFOXu2JjtXGzhCi301ugCCygMl+cvT0pCOHU0jTY4ASPTPM1cGZztYccoUrPBssRz9vXm+yiXwOcBYdd/FzCNGxnewJwXzyz3bRd9HUCbKvyHwyqx0kt3CMsiMX+vv5lijx/eFaFL35gxCjty3kCX/t6PcWyNFH++n9/BeRX1ujZzV39ZAt4iozGsCqWzF/0cnRJ/vp9foPyS3ezqNjeKgm+mfkk4DYl71toze6pE7k9ySZf892MtEXJXzT1srR6wJ/4maYhebPqjXRZUJ0v2QWd4XVB+QMS/SRUrwL8h0Zy3ucrttNDtZOIDIHcvTnYVbvBDnVaXSZEP0Z7UFGi2y5ryb6MHVCtHZZ5EuIzSH/Acl0tpGiBwL4mk8BmMqutTc6ZpFfaC/B7KYZnPk/MqNZ+aPjVc3nRsBxcrBmcOYB8lq0y9Fb5TG7LVRvkStgE13/m3I06LeL3OYFTCCLeqNERPYGAMcYBKBZFmPRXHqg1kaPLmDxSFh4LyO36TTRsZlcqUZv4nL05lnkOChmk/v9NNGxlEzwcjU6viR3BMGify55t030oGVkeiOU+Cd5OUodmEOJpzgNeGycL8zunnx7wO7cqNocHf8ii2bcDDO/XpvIwq7QRm+XTT5uiX6tY6MQWWj9MqJjEslZUTDz7voNyYHQRr8pg5zgcvTIy+SeAXVh1mRKNrkQYvTANs8cUicTvstIjlEH5j6B5GO+5Q1FRCL/hFod3W8pyazdK5esP0LS+GfYRMcr5LlwObop49x52YUVZUXHJySz965asvagieTzsImOsWRWlKvREZdD8vh3S77+wUByR30les4Bs9/zSRaPR4mGx61H6COts8m+x5/jfFEi7MXM/KGoDbaRnSH6Xtn24DP9GhWHB0O2iBwNmf5X8lsfQJdSypkz95FrYWOqgYrUYdYdxSmQ6baRiXUgiiM3QDSY3ARZzz1U5H0UCElnWiX2Rwnfb8jTYbD+GdfaQDL0GE8tmjrhzfW53BCNWuHdxJ1REM1MTLwdFlEvbz5hMGQcWDIyQA2WmDgAFj13JO7qDOg+TdypSvwPNHokJv4Ttpq/uD7VYLiU9PXoYFg8k5j4KCxitu3ccydE3RIT34aoq/CAzwPzf7loMJzeMb0DLKIsv8zWpS/3gKzH7sSdA6FotDZxz0uQ+T/y9WljccHh2b0g+X8Vbbf7yuo/YwAAAABJRU5ErkJggg==);\n        }\n\n        .companies ul li.extrasio a {\n            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAA9CAYAAAAXgFT/AAAoo0lEQVR4AexabZAcRRm+fBxmd2dmdy+3M5sFQ8APxCiISFF+KKhBDZDszGwWyZ1A1JLSglJL/YNllbEKSn9QWohawQ/QBLRELH9oFVh+4EcplkZF4okYDZQhF3M7M7t3iblwd8n4PDvTVtfUZWe93WIP6bfqqZ6d6X777X7ffvrtvhsanCgJh3auFM9+yd3WNN1wwbom9Cxnb1Cs56U63YoSJSuAVYl3/K1EiSIsJc8ZWUZxpEQRlhKVWRGQkUzmLEMzdho5fbee03fg1fCyIS0lirCUKBHHvmKxmDdy2g/zmhG2kQOy+scTxKZEiSIsJYPPrvSsfjUyqxA4BcyQtFD+Vdf1teo+S4kirGUlirDyudwmElYeQDlPwsKx8FFmXoqwlCjCUrJcRBBRBkfCe0lYcXY1m89q708SmxIlirCUDD7TEvdYmnYTSOt2HhHV/ZUSRVhKlqusTHmvJARzc2GFQ/VVDw9dvpolwXedWV3Nm0xYQUxYvuX+zh8ZN/7fCItjuR9xIeKEEHHCuViOsSxspN07nzu+WBWDc7p6AGS1UrJhdVwOlgvoxImN9TNCOLRzPTr/xuGJIdRFm34FPvumzjSwb9ZlyWBcchCzfawnrc/F+uMzxy+DdbggIsKyrwlMp01YATKs6bPqI3wv6sjtxG9Zf9LeDvXSZAUXJ/0qxrx36OLhpcaI8AF91nv9/oscn8IXvcfzwGWFTBbPEkENE12QI206g+WzQmB7xSLrEHSdgo0LgegpK+kxQPvfX+/tm5ZTbYoMq+T8NtywY00/9afVo0+4CDk/vfZFguvkY5m802JN6Om3CEJOI1BB+Knx/PwUjns4PdNLJbr+E1cywEhagVV9ZcNyrg1K7i1YZHf4pn0PsoR7cbTZDdyFTOEzvmV/COXVR0z7RWwnt1/qDjVVqpcbo1vPa1lbzjli1c5tdUT9nKlS7SV+pfrCXhZ5Y9Rd1xh1Xso+qbcTWMdbW3sZbNQXzXo6ZFjziQyLJNJ9hpXIkgCUKZnY4tkMbffW1s+cjudO1OkUXMI2+V0LfsfcXeWV7Ju9knObZ7pf8k3n64wTYI9vOV/zLPvzvunuDCz7Rs+qbvJH6KsEKbD/PsUx9SXGWmmOOpchht8NWz6B4/nngK/SPtpJe2l3UHJuBW4KStUr0+N58BmWhP6KyN4kKWaK642c8Q5DM27Wc/qndU2/y8jpe/gXS5T3oLyD/8CKOmOFbOEiNMkkdA73NasSz0fMrRaC7H0IsAc8094Ph56Ys+phWN4ehuvGgXfFGMO7a8NjVi0EkU3D6Y+h7jcaljvWLNgFWXe35EHw2bNql0Lfo9D3d5T7EGh/8QBfgvjN78Df+Nyw7O0iaLvdhVk2y+6b0dfvoecfHEesd4J9EIn+/gQcAr5zuFwvSYviNYFp38f3XASo+y0BzgvwS3wLZ0zOl+Njbh/wUE+q88243IP33/VYWtVLxXhke4NKfX1guXdicf2UC88vV18uvp+OBPyRzUYD40TfHyOJwGcP4fkRlAdoM/8I0GnuZN0kW2SL13kRKT2G9i2OKyy/ExhLxMk4Y4dEzXETHja7P9BuYNtkZUtWJoVesyqZkKkf/e1CLP8G5b8AZri0ZxEbo3g+injmeOhnbszw03Wt9WNFObsc9P9iaZq2EQRxH/CQkTXuxO9SHy/e5fFl9Kxug5x2gZT2Ak0j/neKgpaX0X5H4Ps8cAD4Pojto7qunydnbD3ZKLICcZQiUfG4AmedZPCJYDtmbaMTp4GngCe8NpG4hxGscwiAmLzGRFA+g/e/QJ3rRT/d3rPQBmEXbLmb/Z+EzjmA5cJpQEJl/wiw/cyAqCPtOCC+t/JXFWHzz9kX9SR1y3gG3xnUtAcZxQ7Z5gBETR1h5XrOBxeCDLbj3Jzi3GJRSAsmAS6cyg3tsllybpBt5X1TlIFuvQhzPBVWdrTnG1nDW0W2lhz75Dr37AZICvV+7KHNtOnGxLKdYF/U8fRMZctoctEvRiQeiAr1fw3M09+0k+M9BZ3x+DzgScYJ/YE4eRo49m9rW9xnVPeEVWf9ORDmj4KSvVkmnV7JKsCpABvMwxjvcfpKkCh90DJdEcsHuSHHdh7gfOJ5QcRzHHvCxl/h+7jc14D/efQKEkdBz5MgGvk1+XNFZtSLfjmrAtE40P2gkdWPSgQlSOkEMIlv+1E+ATyVIDNRD8B3zbh1bSZzZoK4/jeR/3LD9Jc7vjiyIKDFTrMP776AY997Pct5y1TJfpW3zjnfL9c2cvdvWu7WeMf+NgOTC5rByCBh8DJjaJbtDYKEur2YZck7HgTezxjoDDzgBBdnEkFUHkdfc7Sd2U1SV1Lul97zGEC7GazsJ9a3CNxZ2nA8Iu9Pifa8gI+zwk2Yh8cZ/MzOImKPEGdmh4CwGS2YWS4W1pfrRc/2RBBtDH/2zdrbxQKRCQnz8goPbWMSPIgjzBv5fv+LN79AzPGTGy5f41vuh+lD9sm6IosgaTErhl3/xPcmyewgsqbknMm/mWUwK+IY6N95IJ63SWbjIPBboLOG8b8+MGsXiDhh5olj49t4HMTYvsjMmaRBwmJWRoLgvLL9UgmBNkqbz5cD+DKOY2HjIRDt92DfJ7mxMKPGMfbVzExpJ04VF/hm9XWwz0bdj6DczU15Fr6mjvk4nqF3F08PwsYBZliXgQimY1J4vLCmcHaPhLUyxlA2m60go/pKPqcfp/42YuJBeTePhMjqrgQuYaYHnF/I5S6MbDLG0fY2ZFY/AdheIi7jjwVNc1NIK52s4IjXAhN0ChcjncQg592UOMenCReKV3Yv4Z0WAxjByKOicPQ+klu3pMU6YkcHmbwB7Y/GJLEAhIshiMr5o1gAfGamKAJZvpNJpvU+FhLazcRjnmPb0/fhzjF4mY0xaBOZDO/dNN678W5rBndh4pkl74qw438Q+sUC2tcatS8mmXPBsM5/gbZRu7YOXcyJnGHxbpHHYBKQh6POVMl9k/ADSxIFfPGDlsimImI7CTwCfBZE9R6UV0zDZ/RN03QuFGNhX0kimET2hfoPklxIMvQHxtLA/N3O9iC7TLexd5hjNu0PcA5mIz3/ae9cYOSqzjsuwKDau6wJsAZME5UqqqJIlYJE0zZ9iL6rNsB6jYWCAq2apmmC0qYQSNskFPJIk1SEUKklbVOFkjZBRFACgRZCCuUBQoRHqNIQqWhxINjeHc/ugr1r76x3+/0833/96XTv3Hs9987OuB7paPYxc+65557zP9/j+/5fi0OJNYN9KV67DFjxTMzWeidjpD/6dknvWtbmztN+fajoGFl/zCG2WxvfC9wv6xmJq2nAJ3BnHa0FYNnGP1eAgJQTAasbsNq4YeM5Bi5PxsRqu853rF0OMBVV58hrJKAVtZVIfPpakcw2DH+kFGhdYxeltTfshW/jhF7wheib/wssqhTgsEXJpS/XdDhlgoFz6zkGNHchoXGyA1qc5Hba/0wEy6KePrMLXeULO4LWUgCT+PsCal2ThYpdJwGVKKWgAmFXclVmv/ppZPRrY+A+mtxHVHOLGvlRe4jDYtFjUynrhVwdsN7B2HZgUD40/2PnNux/zPui7EYGXiYdXYRjoei1kEJ1n3Z43XLgtIPzBBjw/hiHyaoG77BOtFZYJ6Fvt6mN/yi2Pe+vBSA0DVSRcsIaKLxOkKyYWwNp1jJAfgfztJp0/e3VxpjhHQe44nq2eWAd/EO857UALJNY9lYAWDLeAzK/YIAyESSq/QY419N3h9CF2I5f5frHbhwevhDQA/xoriZeFw38hWxWnOaoJWxwVATEcqQq/hc3CA+x04Yk2I6ThoceJS5bQNe5veAgaKH+zI6e/8aixtVoaG7YgvHNZ4A1dhBEArDEnw/Q+CxqSjwx08VlKtVfcu/he7Gf2BYBSwALKWnVharYsRTQbR4EMthVXOXmOk8BmFLd0pgzvpOGIGRJWAAW6jp/593mZzubym1EE0iby0hAyTqQ21+AkgUErAmXqAArxn4vjpl4AAAA+k7e2uMeYoAmzgPvfz+HR8McCXIAML5O/QlUpzBNuG2QhjMgSn1lYr80NzyTKD1j9uD+AUPmoiH7ImMYVAkL4KG/DRvOHhk+8YVgd5qy/rm/+CoWW8UY9Fl/mY3tLOvzTvpWM9Xy4xHYOoIACxgvUctPJNtM+01y+P24MXi4hxtIuAIKZh+addBiEyFOA2aFbAABXJGWsEO4mN+S5JMhZbW4Jq0xOv7+KNVxTUk79rm9bBRsX6nU1vDmf2uhVllYwi0aDwBdVjqawb4TIt3x2hWVzjpIWGyeBrZFNhUeOza9z9PD0/b3FFC5h6IS7rQZ7AE9NirN+n9mr0tpy13EUAFYEx6HxnpAlUNV9gNugTAZrZGC0tXtADT3zdy+euaWU9R3N4ACIHKg8PMeA2m7zhOsGQ46DPEv+3UA7AEErOPdHrbJ+ngkgNWkqXPnRaA6XM9elLpOPfXUE00qvDWCFuSDAbCO6WRo/lMeLpuaRcLvicrU1YuNFUV1FjvidPskHX9f0SDP+H8Dn9/ldGO8Ug0bGaDFac0GwBEwPbr17IN9nXbJkMI2sOVIFczrB1BvmLeLWK8ErErnEja7zCXMkLBeRk3FViMDMZ43VK4Yi8V72THbeK/a6/Ybm6P5SYtP0hxUETclMMBQb+OfYn3M89xGxz+et0a0nmdHt73Rvr9dgEeslb5XwRg1f7J5bt3ta4twH2LrNB+DBFjxc8RPCawwtBNHVWnsFGAE6DFue2GQl3poP7+E4X4Ve5Ybu10nJyaFxUHDk5e6+nlVBFry3Dwugz72FU7uop6WeEIS6sCGl+qXoxouHgAc7PTG4xgA9LPex1JOHy236zFH26LTYK2SnyNgMY+43jFeN+zAwatIWAQnP4Gtep7a2KXGLC+tORiQXGioRPpMlUGewVZ5M0DAMyMmTWuD906mDUAULzHfQx0mkLXKMcZDHKnYrnUf12Ito87GORkUwBIQ4e0zoNoDeKRqGp+peOyS6N5sILldIRD2M/gTwC1ZGEwyC2POvShIDilYVf2gEfFRwTipedAm0X2ojNFSNqjGKW8/E48m4y+iGnLick1JkIwDqckNvauqggK8pgMeXrXU3d4PgEVQrcIa6M/DUHbLKVA2tzIFZCRT1E2XJgj5GOfvVScy69naNf6QeXdHwj1KDuc+Otmvpi3ej2foHtzHYgBsHawbeDJZU+6EuF/XQy0cEMDSGl5PcGcIXXgQCUhqYJ0sExYR/wcu0bnncOS3w9h8wt0WZAtvxz43tNsiuVLidfeLMNfO8BXp/002GFHiAoESUfBTbfBbRPopoBruA3TY3EQsoyr5Jt+fglXoRwZgVMpHiWaPG6cfAGtnWyWcaHkME8/SQfjybrxXeI9X5tkCJZkLAIsYMUIz6pAkNK8elf6aq7n3EfdVBLA8RGMZwCJuD1te1YAV1imBs1sYp6+j50ht0uE8QICFpDOukIP2+/DW+P+aXur7R0z1vH+Fk374xH9d1XZFcB4SjmKBdp62ZVO9no64ILf8JjFPCtIkGTiCURn1gXivVrZaF1sEpHmXnJblaUzBKoQw8D6jcAF5SvsRsIgit80KyD5CvJQ+V8EBc/U+V9Hs2X2D+68TsCbNHsS9CLAwJej/nVXC8YvkGCGd5rVa1nTIMmjHBs4sn3Epc76bOEb9fwAAa536Ig8wxEfdCYhEVbCWVzCuG0Bug5fer9+0sIqfDxudRX7JEDYJFiAi7dSmsWsiYNRNYrfcDnX4FoDFRiMBNaoFZU45NjteMDZ/qhpmgZbc0YBWNlgphGGbpM8ELKsBrGZFgOXgv4B0ZeEHH+j2ecaxEGuk9B0cJ/Ez9UguY+/kUOF6ZQCLKH8AxA+w2TROrup8WwJ68Wri7GCcqM4yvPc9YMn4PTT0FsVc2fsi3roe8sGvkwHeQike9zFggP/0iguZdx4k6RhsGPKmSE1IH2zdoGWpPB9RLhuAUzbNIaoCpFKwQBV4KODpAFqoj51iuPgf0ez87XYANt0wfSZhvYiK7ff/QzZOdyd9wl5x+ti5hIXAwjB7+thb089UbcPCeywbFqp7BKxOc0u4AalP8wprGB27PtpQ62A1wfhOAjjPMK7dPgcsvnusSzfvldGboE7ipGqxXeV4KIl6l5Rn4PXo6Ojo8MqnWHwsbj+J7mXie+HdiIBEvh2noQPWK7ssJaSsBBM/awv7in15wZ/5TdLZfp+bCXL14mbpR8BqenyUB7/eSxpPncZfgKqWdeH9kubD/Xi4ybfyASuwuRrVkXITsS/hXInXqMpG24nGp98BK/7PjN3/KKAgb7CXJe8jcBJdr+RqglVH1o+YdOwvKEVYDCwKuIl6OdkCGWKD8PK5IXyxkdixygIgi5kUDO4rqoaN8mDVksoIy4TGhHTaj4DVdJVQIQdN45tKbZb99JL3kRbptaVGEYwK5cy8AzBMC0UAS+uqYRIgByFrG88w+ZVK8Uk/3y1l83IOF1kfA9YJntx8hkkzjzlILFFxp4dglRr+N5G7qLHgPTzEDWRGWTfOtgiAk8jMohExW9WNfmP0O+kSuII90ZqFednh2kboP0TBvyS6knzAyo7ZgsQtBcV+BSyScq0vZ14YvyICf/Ugky1ZRB73SD5YFBxISsZe5mEZCxw+RQBL14/hBqiFCoaGXcP6/TxhO1nPRuPttj7BIAEWLAvmofuBg8ROWBb0/14DFi8bwz/JjkXuoi+K886C9sRVsR3kEa7VrDcs4RVwcYP5tVEKO1wwIBYHCWlWUfAFAYvWdLsVPGAwU1Zm+6g/cFRxWAtNM1hHEK/bHqkDqewhEyl5YIpl3Db+h2SLI0SDZwExYQSswjFSRoWElCZJi34xjjftIIJFFA9ikXtbDoyvRwpgCSQg5CNYNNivfjwFrLWyY5mEddvBP0Kvgcjsp9d/k7WvBa7Ym1pbOGXhRGIhsTBNTb2hG7bJIAVBQfxF+nSJaamgdNXyRf0qYRexz34HLMjx3KM20zSK4rqCf1N65CLPBKmJfL7m5vPeQGYFoQB271uwo2IUJ4+14bmh3IPbnqYJLgaEUxtWGbsmQcI4l/CgKlCZnzmYCOWB5hsDP2wTHFB8t1NcWgSvwQWsYHDfMPyeQ1HmI98MwaLHr0WpMjyUjMfv5WH+Jt6nlnuUGiSLkv5ggHErKRe9ag0ohA0wGYsbi/++KqZJAhuhbXHVcDEPtBSTBYdWjLwHQAYBsAK9zK5p8+jV5RWT6pT+ncBfOL08v+5yjObQxUBlA20P4GA//8DZPbG1rZAI0vhZhwWSNnZV64M4rBwvYT5ozUKxzZqza3MNrq1wGhpAhnEeeyrEfuQuNo1eG34wvI4RnOI8iCZnQAFLBvcPCSBM2vpaAKp1a3EvNobzFY8FY8TB/3K6WeOUQVQOlLG897BxTTf88zN5jNVS445/ipQJAVaOLWvRVchARayTdKAAawcEfnUAVgpUEA7C5e7Mo88CMEgwgI/WFI1nzdj4u/LuuHckKLzD1p6xdhvSENK/IutxxPC9Ri5g5c+3Ql/sugDpUwAUkhzgJSpsNA4avzM+A7kmwaeAHWOjYAbB1TkA3v+AFSQayxe8luhytxvdVL+HMDfE4pdtHAtuw9qrzXIRQOUbdM652V9o0/nSxsI7Lf49/i3vM6GfjL7xbvnPs3b9z3QTnBnjsogzwzvkp+diR7BKCP+YC0BAG2SwAGt8x3QErBrACgZVG/OnuSYSi6SkQKU9D3DaAQTl8yMknGOrbKt/4x/FuWLP5yL4unCSqGJQfEGhjOSdG4dVok6BXsT7wXtv1/8wPGku/TVFSCjp64CDmEAWhgqAmftAio2HI+rxgALWJ0L+4BfXGLDwFP6ic8QDoAdWAIvN4mycz8K5TYgBhHoUbehlg3aZRsQweXrxJg5XusILimfJbVitEjYseLqV1nGbAIFNMhiAdXEtgMWGj0ACxzybGInJo+tfRf02YPk7Cyx9P/xirClsQlTBKTM/4keDj60KwIp9Z0nMUAxBaePX/Jy93+2mihmekexetAV/xyEAnxuVh+I8DSBgfUwSFhztawxY3MsvwW7qgDWvNIttqIMq4qmJHuRXvAdsIGluYYmwhkVxdVFQI8Yz/X8ELO5b44I1Vtz8nl+5w+btxhkCgGFTyHuFsvBpqIOcPRw6+YBVTWl63rM+gw0UKQqGVWxxXs5tzmmYVDBDifPX6lkgaQ0SYBlI/Vkwut/Cd9bShgVTA5KV+LH8lNx6HhuZhcdJAk1LWiZ9bVq6gMrToLB5YGVANclP0ckm6sO2QTKrKtCwkQYasLqnUfmUPG2YE2wj3429KatwqdZRjN1KW3Y8XX2Ala4bgJJx5nn/kMKoCkUUPTUJ5twONxt43SN7bl8DVgSI4eH3BS6qf4cJdC29hAaa79R47L1d6wDWAQyefkK8pDisnkbqhk0RF3U3hnY8VWx+v6+FRBUsDVqohtbfg9hYtFn6FbDg41fVnCoAK0b2s1EpCLHXWWnJkoh9My/dr536Aau0BJZR3Rm7W9PCcTgY3Q7s0tbYxwaIwG9dYEkQrcy3qei8lnFYdh9XJawR7Tp2sIz6xn5tymlTBBqDqgoSyXwgMJAGLvbSTfFbSKEYmOOG6mcJqyrAivUMKWUWSB7v47pp3UO91hKwBDJVhxvIcB/zMoMnc2rmEP/YDHtJ4xyASHfy936OIqh8FxWM/L21jHSn5L0i3U09bGea4JqFbMyZGiDqf1ftgFVD4mgcL6EaAE2Mbs8Gq7HI1tDRa0iVa96RMqIUeiQDlqSMwFuGipwcbgKFeg4ggkp5fhj28wGrd0nI9Mm8x6rSpP0AWgvt/XRjtP/1O2AhUSFZOUgsUB0nBZFeUswQLBqKrf7xysYhSXhR7trIRd0DwOL6wZt3Gbzq00YQR55XmRw4ncZEUFsfzy9EquQO/O4AhXNcZbM6BNYGl9qeo8y7Ns2RDFhxDJQ/mzvE6nEP/6trM8Zn3rTrYi9zep/MSHe+IwDF1EEhCOib8XrXClwBtHA8zB+ao+9Qo0Dz3+8qIe/wqIvt037+fGJb6sUrFm5tOGBN4zFc+QSRxIr4pSgEVLI9p5chqx5WyTMuYQwLDYtI1ilbzis4/iVAJYvjSn9TgU5ivsz9/iQno7MyZEpkCnUgHod0n3gP3QJWcwAAy/r7OpIDa8UA9qPxM3VJVxxEhJUoHqpTLmEskoG9ke/wTKm/WOdY4/wT00Ucl5MJNGbsd421z/mwZDf6oAzdkOgNDQ2dviZ8WMMjfxQ8lk+bunrqymmDqI9hWXE0ELT1hMAvSkZGBgcg+IN+aLsWJf8vXO5rjHJfipxezGNh8BP7JmKEkBiKcLrH2oaUjYrjOJIlrGU7xDjMVK+S5OQ6QUDjJSYP3njFPxFTtz0HsHjxPFWKH8kwBcK6xos0R3iQ14XcT70AXbePASu1Y+1wT+Fe+N175ikMvO54KRP7lU+il2Ynahc1CoMhBuseqIXp6X3HvJ+iBOylgJbLe3TK1jfh5ZwvUDWHheQq44siCuQkJMnW1cOOoKXvkw8HYV4VVXOsz74GLBKWUXFUSg07Xp002ppPUqM0/1w7pZfJViPH/5pwFg+IvoP+6oyNEn8XjKNNHX6sGWptRhtr3wJWAIvhE78evHM3x8/0JCVnaOhX5a2k7P5K5Zy0PLsq5JIiQ+R5r4pQEFmMhwWwQuUiNqzIZojMqCRtLxZQBcnMlxQ2ZeWjdB3xJrmUmakaNhLKZIBWlMl4jrpVCalO3I+ARTgH1Z1Vt5EKMTF+qQ6w4t2u9bWl9jzvzaOXielYAMW0G7+hkXk1hOvUCViYUyjMAWA1WUfwug0GYOkzJB3/XigCsZs+a1cLAxgStBpShB6wP7G/0lpzY29B557zar7k8tV5gnLdWASV6/pmeJzNUaYcORHIXi49VxWkcZ1Y/BPyQBWwwAvlaun+TMAKgOYesw9GEC17/xiH2VwO2E+xIfsNsKCFobQZY0RyAezrUgk1VtJ67B7mHHTm8gArzv+UsUVQn2De17M97z+pa7xhLKoe/nBbJRxfaJiEOAgqYVT7sBfZdx+lj8DccFyNquGxtMDQsKACrkkRjCQ3zEjO2hHMXnhz04Vvq62Qqm8wagmS2Q/g0HBhx4WVpwpCY8JYAbxmVAWzVTneJwj4i/emdza4AUhzX75qSFvguhju4VAqY/eLFMt4suiv1QbS72FT61Oj++2sD1env1AHAHAfOkQ4PHgOnhg/Awh08hLGsfAM7Dv/pgIUJDXn17vsetzil3vJVcIGrA4a6wCVqhcX1ZIXNF2GKytcq2rwVeXnUbNdPaV8RkrXB6nO11gQkzFwMtnKkSK7Hqmj6tpqBBmqWjNqhgommKT0ZJFFJbDCGyRa5RKqICffe1JwSSv4OmCp346gteSVfrSRUA/KFICdtqRZJAiXsCYnR88/OzyXY/oFsAyUP8mzYm4ohw+wVik9xE1NiX2oaFCR7X7+ytoU9DSAGBJ4kUKqOAZUxs0l8M/y96pBK8bjUd+T67EmKNmGEb7U/Af66bUBrBjiMHKrq4W0HdQHDJ+p5JCKaiaUNgJIClCEUIbjMhclUcWI/CFi9yv8X5uiG/WQfugj6vpcgwfsIDAeN3Oxgp7ZNqdUFWxJFUyAL90wGE6J4mbRRS74PDWzgRpdIgqee4kHxYKDJBWLY0n5fgscRQJnjTD/EQAqjGW6lIMCKQUvGyozzwEJC6N7XsVtjRebIvxZ4rRCRYOzKz7vKkwbsmHCoAod0bwKgBjQlpFCI1DFA7XHgBUlnjdbH/8TQOu7Fubwk6G/dV1KhSeExOvPjEia433D8NXxsx1jmewh/y0bkIdsi5OJ/zJubVHDshDKRqHHxQENsy28u2R3AkiK8F/F05PseQyxrr62Gp1BRdxWE3gTOy1W/Z1EZ2x6LLwioQ6wkwJcU8F7lrdIuU9tVjbW/kPqy/18X9Ko8tjSXMte5RJyvaCmPcqceBbBzO5NW38jzF2pdSFGhgh2Uyb9ElqDNEX8lSiQmHsHsKdfseBgjSeLKkZzSzyfAW1zzrncUd9Jo4lj1vfLgni83z2j206HvtmA3A39Y9vL8KilQJVer8eAdUywKb0daQc1TaBF6EMCbmX7Pl7987OpgTfQd0i8/ufw/+NyNxC8RVAkA1ozDloYOwnuTL05q20mfs9KGMWQyqIDrKY9ux16ZE6pQqqgSNcs1mVBqmAnu1X0Chp/Uzy5CkR2f3g+GPNz2B4WxHixe/MFry8bQ4Y3iWuJ/RVa4YIPv1YJK5V4kXZYE9ZcMh5/mVp/cUyrMTTECjr6f7wGFC7w+DPPDlYPwY2mazbMztnyfFdU6KxxpmNWIRIR8gWiymuXreJ5/HyRcdPicwsVph9nPgSMcIXFcRRZBwgDZHs02GujY3dCXx4/Uzdg5bAmzEf10JgdLouf8Z/XcR1vx6pJGkslspM2bDjb+voGfYZg1TtOPvnkkcJhFAIFUmWaXsVGNi02AGkSSCllFzxGaTL7G7bg6EtsjgRuoh5GNaqAKvg5hR8EBtGl2EJ5eafOGbsl3mMRWwrjohCpVMP0GvG6npPY4rN4PYuqShGE7fuPOWEgjUPiLvLTmG/sNkgUABPgw3wUoEiuhV6GWodkE4j3HomIpHBoksv2S9Umit5CHkmfKkfP3/UZKlcTmjDvgIMdi6R9xkQQKbZQHXistQxP9LsVHE0fNOyO2LmY+5LDVgT+z1KNh5Ac2WHpl4Ou4FqLkjiazXsBO9YAjf02oyrskqoLABaxSxUAVvwOTA4XGqjsUtoOBnlr95gEdgGxWyX6xAv5Jkts/qSpfi+j/oU+b4pgVephaLItAO/POdVYTHJpE3AJmE2brQWvCMZXAG7CjOBIZ2wucgFnNm35NYyn1sfdePJYcOLMZpFjoOQaeWAVY32oAoOKxoOF0sNBqcV72ki3cWCbwE5U1CAeQQugZUG6oXmuSb8Z15PqyNhwZ0ejbJF7I7QEsGGxAuqqp4hXk4BSVEUcIZy+LOQAiHhdo0r4vHupfjhZA4Ef4ADnE3MrGyTrgmo9lM0CZGEZxcWPFAPLA+tiZuPFr5sxIJo0iYSwCA4rG+P39ziPP/Nm/d5AkGp8Bv4cvupgttTOZBjfDnAR8GzXe2DSGHLjfKSAobWDF5Z1HFLRWkSmY9inaAbzR8kvxq31fPAwOfmC1zPnxMw1rDAFBxnrYt4rUnu9gFfMcfSueO0yB0E4HOcBV54hRVBif3mARS3BUDH5+a4AK/kedQtNevsPefEU2Gmg85+WSnON/f+3DIx+YmRk5GTzNKwHyODUWr9+/ZnG/PDTVqrr3TamL1t7URKVYr2s3yu7IgzkwUeRlwBJHq6nOwh0AI1JyoMhHZC/xanlxP4TAB0Lecm/wzt0snBn77Jg0QiQRR4q/OGctKg7c4GqNm2AIv8XrzjAGlXBshIFwCpeb4Fu1rW5rvOp76HQQTwdi6hc8JHZpv8XwJHr0FfkSSfXkuuw+SIQrTgz2qD3yvLmS5cJF4ErPQBal68kWPe08Q9wLR1CbFoH2RZ/J0kcm5fWBV4zaiZi+wLkWBMAFXOKGiT7X3xWvIeiuE8wBy6Jtdvm3+F6y0hcebFZvLB/uddxJ/PIGGiMAZAA5Bk3MWcaN7mmJNTb2HdhYlBxDa7veauNppH5kfUQr1k2yRvTiEvYS7LtRgBkznMAiyjxXwEMThreCBDssNqCZ0Xg6Ra0kIAMXK6wvr8P2KipUARgRGiCvT9kQPYg+Yj28/esTQmkQlDonAHeVwGzSqLpI2ixECg42TB1h8rCiL6qiJLd3gFIyf7zXYjOGsYCGh8mYFX0gSKteZGM/yJNhPeM9hyNAhdNsU+UjhdS5LoCSpEGxrYThsE1ctqzACvME9xrUdWAFlVoijQ02yWpHsM25pvmFTYQxuS0ND/vsybZwgBqn5tkwxkAniPJspYiFKau2lg/QbUbDiPsigFkQ4vVkS6WOWAnJeWQbJDQ45qIcxHAfLN9/kokTHjjORh5N6nnesJhNLa80IOgOl9tfTyCtM94ssatsWtNA1gkONt9P8AzIkg1a37KzOfMGVvPYZ+IOQWnAyqvxl+QVvinoIihgrO9323l5zdXxLZwbAQuk9x+DMoXa/fbdWYFQid1aMEG9ryN82+oikO/lab+rEZXTNqOc07ZAx+72R7aNxGr2cwuXT3SbFdHuRH7BJ4k4lG6KYlEoOWkeWKoDcfiRGxX20lLfkcdoUny6IZyWTFfXD9eS+9pY3xcmw0GoHRT1YXfie/CKA1VCXYivKz/R8UL1CqoVHityBGtK2AxHSf3zGFERDll/WF2QDqx96cAcFRaHDeEycDGSS0BJGaeS3r/ncBc4IvZgWsCdGXmNz0gUfeQhL0yz3WkAgH0Hv/1rIPio5g1sE3a2P/CJMGLp1APLfwlZ6+UflH1mqR65kf3VjKU6AQCMGFZMPXslIqDPI9JQWV0dHTYJKS3ou5RTn7j8Im3w2NlPz9tYPaMgdMT9vO99v4lOOPxOsK7lUpwtIqpYrNJ2tDz2VRskJdts/AgtaH6oegk1+z2/nv5/aKl3um3PBFi/YVUJfGx4QAW1sXMGy5+3bKtk+wxak3kg3kVYEvL+h/OlpcYd1jPhJfkV75eWxLLzCDjip9/TgzWOuxWgCUpPl49en0HqW1d5eNLT6iyCyd+r+vAU1zPBRufvbXSRV7u2oy3m7nWNaO7Xa3TAs8ppFBbqfqy19I4cTqUXQOak27uU9enz8Ndi1WBaIwzjOPrQgqiVTa2HMApG5V/XE1Alb+hHkg2U/q3aDs4+jqyX9pwRdZFeZCov9hEzrh7MvYBradwTBpvFdS89G9HseDo6+jr6OvIf/0vj9NbYMKQ+00AAAAASUVORK5CYII=);\n        }\n        .companies ul li.modstore a {\n            background-image: url(data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABQAAD/4QMxaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzA2NyA3OS4xNTc3NDcsIDIwMTUvMDMvMzAtMjM6NDA6NDIgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkM1OTk4RURBQjNCNTExRTVBNzdGRjlFOTdFNjM1MzEwIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkM1OTk4RURCQjNCNTExRTVBNzdGRjlFOTdFNjM1MzEwIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjlCOUZEN0ZCM0IwMTFFNUE3N0ZGOUU5N0U2MzUzMTAiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjlCOUZEODBCM0IwMTFFNUE3N0ZGOUU5N0U2MzUzMTAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAACAgICAgICAgICAwICAgMEAwICAwQFBAQEBAQFBgUFBQUFBQYGBwcIBwcGCQkKCgkJDAwMDAwMDAwMDAwMDAwMAQMDAwUEBQkGBgkNCwkLDQ8ODg4ODw8MDAwMDA8PDAwMDAwMDwwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCABLANwDAREAAhEBAxEB/8QAuwABAAMAAwEBAAAAAAAAAAAAAAcICQQFBgoDAQEBAQEBAAMBAAAAAAAAAAAAAgEDBAUGBwgQAAEDAwQABAIEBgwJDQAAAAIBAwQABQYREgcIITETCUEUUWEiFYEjtRZ2ODJCUmJyonOzlNRWGHGRobEzg3U2F6MkNGS0JTXVJsY3SBkRAAICAQIFAgEJBQkAAAAAAAABEQIDMRIhQRMEBSIUUWGxMkKi0lQGF3GBwSMV8JHhUlPDRBZG/9oADAMBAAIRAxEAPwDfygFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAV35F7Yde+J8qcwjkDkqHYMpZbZck2n5SdKJgZAI416xxYzwNKQEhIhki7VRfJUrVVsl2SJ4tF2tl/tVsvtlnsXWzXmKzOtNzimjjEiNIBHGXmjHVCEwJCRU80WsKK+5v2964ccZbLwXMuUoFoymAYNXC2jFnShjuGKEgPPxo7rLZIhJqhGip8dK1VbJdkixkeQxLjsSorwSI0lsXY77aoQG2aIQkJJ4KiouqLWFFa8v7k9YsGub1nyLmGyhcoznoyY1uGTdfScTwUHCt7MgRUV8FRV8PjVbWS7Ik/jnmTizlyLIl8bZ3aMvCGiLNjwX0WSwhfsSejHtebRfgpAiL8Kxpo1NM4PK/OfFHB8C1XLlPMY+Jxb466zaEdZkyXZBsoKu+mzEaecVAQx3Lt0TVNV8Uok2G0tSE2O/vUWS62y3zDHE3V0EnbRemgT+EbkARH8K1uxmb0WZwzO8M5FsjWR4JlFsy2xvGrY3O1yW5LQuCiKTZqCrsMdU1EtCT4pUtQanJ39xuNvtECXdLtPj2u2W9on59xlugwww0Cak4664oiAiniqquiUNKuTO8vVCDdfuZ7me0nL3bPWjxp8iLrrp/0xmMcfTw8/U0qtrJ3osdj+XYtlePx8rxnIrdf8altE/Hv0CS3IiE2Gu9fVbJR+zoqEir4KioulSVJV5/v31GjPOsOcxRiNklAyatN5dBVT9y43BIST60VUqtjJ3o/IfcC6hmYtpzA0hEqIilZb4I+P0ktvRE/CtNjG9FqYuVY1NxmLmke+wSxKbbm7vGyM3wbhlBdaR4JKvGoiLatqhblVE0qSit1w7y9ULbcvuqRzPaXJW5Q9WLGny42qf8AWo8ZxjT69+lVtZO9FhsOzjDuQrIzkmDZPbcssT5k23dLXJbkso4Gm5sibVdpjqmoloqfFKmDU5I75X7HcK8HzLXbuUc7jYtcL0yUm2wCjTJjzjIkoK4rcNh8hHciohEiIqounktak2HZIjG298+pN1ltwovMkFp51dBOZbrrDZT+E9JhtNj+Eq3azN6LV2i8Wm/2yFerFdIl6s9yaR+3XWC8EiM+0XkbTrSkBiv0otSUQhyf2m4D4Zv7WLck8iRscyB6MEwbUkOfNdFl1SQDc+SjPoG7auiEqL8a1VbJdkiNV9wPqEOmvMDXj9Fkvi/5rfW7GN6LGcbco4Dy9jQZfxxksfKcdOQ5EW4Rwda2SGkEjacafBtwCRDFdCFF0VF8lrGoNTk6jJebuLcRu8mxZBlrMK7Q9qSoYR5UhW1IUJEImGXBRdFRdNda6VwXspSPrfkPzh4nsMzw586rdaqLWj9u1NHQ/wB5ThP+24f0C4f1aq9rk+HzHh/UHwf4j7GT7o/vKcJ/23D+gXD+rU9rk+HzD9QfB/iPsZPuj+8pwn/bcP6BcP6tT2uT4fMP1B8H+I+xk+6SJ+fuH/mj+fn39H/NH0vW++9D9Pb6vo6bdu/d6n2Nu3Xd4aa1z6dt22OJ89/W+y9n73qLoRO/jGu34TO7hETPA+cH3D/1vuV/rCwfkK31dND231LZdNe59s426zcn49mMpp+9cPRCncdQX3PxlyaurxNx4IjrvJGJzibyTXYy4mibW1qbVll1vCMi73errkl5u2Q32c7c73fZj9wu9yfXV2RKkuE686a/EjMlVa6HI3J76c63zjbrvxJxzidxctV55SsscbzcY5kD7Vngw46PsgYqigslx4AVdfEBcH9tXOilna7hGbnX7pXzH2Mx+55ZiP3RYsZgPuQ495v0h6O3MlNChG1GBhh9wkHcKEaiga6oiqQkiW7JHOtGyP8Aby71F5sBHUPGOQcDmNm42DiuRZkZxBcQVJtUR6NKaVNU1TUV0XaaeDg0ZxqzQ33PsttufccdWs4s6/8AdeXQrvd4AqSEQtTYtqeECVP2w7tpfWlRTmdMjlIqBwl0i5X5/wCM7lyVgN2x5Y9vuUm1t49cZL8eZIeitNOl6ZJHNhNyPIg73BTXzVPOqdkiFRtHX9UeYsr62c/2hm5nLtVmm3ccY5Pxh9VAfSJ9YzpPNLqiPQnVVwV8C1Eg1QTNF2ylCrhl0fdd5VyVvJcE4agz3YeLHZhye+w2lURnSXpT8aML/wASFhIxEI66bj3KiqIqMY1zLyPkVn449vXmzlDiKDyvjtwx8RvcY5uN4nIlGE2bHAlFF9VG1YaJxRXYJuJ8N6hVO6TJVG1J6b28c0ziw82XTg90bgxjHJttu9tyuyOtHrbZsSE8YTiZNEVpxtW1ZPXbqhIhaqIaLrhIo+MHgeyfR/OetOHW/N8jzGw5FarpfGrHDjW0ZQSfUeYkSBdMXmhBBQY6oqIarqqedK2ky1IPP9aOn2a9nrdlVzxTKLHjzOJSosWc3dvmd7iywcMSbRhpxNERtddVSttaBWsk398eQL5hlv4t6kWrIXJePcQ4lZGc3eYFWAul4SK36KuBqS+k0ygONipabnF3aqAEmVXM275Hg+PPbv7CckccQuR7UzYbVFvUNu4Y3j10muMXCfFdTe06AiwbLaOgqEHqujqioq6IutHdIKjaPKdQeZcp678/2OHcHZdtsF7uzeMck41IImwEHX/lldeaJFQXYTq70XTdoht6ohlrtlKMq4ZZL3ZP/mfjj9Ch/KMupx6FZNSvWNdHeVsx6/tdgsautiuVkOBcLoeLes+3c0iWx+QxJIUJn0SNPlyNA9TVR8E1LQV3cpgnY4ksx7V3LmSQeRMj4alznZeIX20Sb3aYDhKQw7lDcaRwmUVdAF9oy9RE8yAF+nXLrmVjfIhz3Mv1prz+j1n/AJkq2mhmTU7/AI79s/lXkjA8Pz+1Z/icK25laIl4gw5Sz/XaamNC6IObIxDuFC0XRVTXyWjukFjbNSOv3E196c9csttd7ucTMb3EuE/Il+7WnUjC5IZjRmmtXNpkAqyhmW0dEVfDw1XKrqXSPj/NeQfjOxy9yq7nSraXy8p+SdfgpKT2R08jzi0PX0iuTl9vkc7wTirrIWTJFXtyjov29y66V8vb01cckfyx2dn3nf0eb1O+Rbp+tust398lvsrxzj4slgY/drRhMa4fn5arZi9oxU1Wc5bFm+nMbvTQEoiqsqKfAt+qJ4V4qWtEqdHM/wAD9T8n2Hjn3VcGWnbq3ucdMdcL9bx74us6ThemPg90o/XJeO8Uvl2xe2XCy4pCS550totcvDkebbW2RBcclxLm4i+mElU2CiJoeuu3wRaVyWSbTenP+BXkPA9p3ObDjyY8Fd3c7KvBKXTqm70yv6KyfRS+tMxwkiK8nj+d8e8m3kcKsuH3Hje4WsLG7Z2CjG9GnynIpR5epKjxggIW9U3a6+SeFdqzS1VLcyfV+7fb+T8d3eb2+PDbtrY9mxbW63s6Ot+Pqaidz4z8hMf/ANJv9X/7hrj/AMj+3wPtf/hv3f75j37iH633K38nYPyFb681ND9evqU/vthvOMXSTZMgtr9ou0NGykwJIqDgC82LzRKi/A2zEhXyVFRU8Kok49xtlwtMgYlzhuwJRsMSRjvCoH6MpoH2D2r4ohtmJj9KKi0Bod7kMp88y4GhEZfKx+KLO8y2q/ZQ3pEoTVE+lUbFF/wVFC78jXToxBi2/qhw0zEAQbetUmS5t+LsifJedVfrUzWotqdaaGWnuvwIrHOmCz2gQJU/CGBlqn7b0bjNQCX69C01+qrx6HPJqR32TkOyunvR915VUxhZWyir+4Zlxmw/iilatWZbRGj/ALWf6tVz/Ta6f9kg1F9S8ehkf3jt0Sz9sOZo9uBGGju8aaSB4fj5kGNKeLw+JOuktdK6HO+prL3Y6jZD2PxPCuRcDdZc5LxiyNxZFlluIyF2guD8wjLbx6C2826ZqG9UEt5IRDolc62g6XrJlpxR2U7GdPshfwqXGmR7TbnzW7cW5Sw6McFcPU3IyFtcYU1RVE2i2Eq7lE6t1TOas6m4/WbtVxP2SjXCRi8ZMaz+DHF7JcQnI388LKEgeuy+CIklhCVB3Jooqo7wDcOvO1WjtWyZXX3XE16+4av0Z9B/JlyrcepOTQjn2jv91Oa/9rWb+YlVuQzEZ0d3pL0rtZzQ6+qqY3lpkVX9wzDjtB/FFKuuhF9T6f8AHYUa24/YrdCAWocC3xY0RsPARaaaEARPqRESuB6D5gO6kViz9r+ZUtojHQb+3NRW0RNH5EZiS6fh8VdMlX66710PPfUs77qjpyOV+KpLvg5IwNlxxP3xTpRL/lWppoVk1Kv2XuNzVjnCI8B2C4Wy0YWkKZbinR4elzKLcH3X5TXzJOEKeorxgqiCEgr4Ki+NVtUyTucQaU+2r1cvOFg92Ay6VDVzK7KsHBLTDktS9sKU426/LkOMqYC4XpC2LaFuFPURxBLREi9uReOvMpl7maadpbx9eO2df+SKqpoTk1IvxfnXuRZ8bsNoxLKs8Yxe1wI8XHmIUJ5yMEJltAYBk0jkigIIiD4r4VsIxOxv31Wume5v1wwKfzNHly8wvkG4M5E1d4qRpEiMs2SzHWQxsD/SRUbXxFNyLuXzrk+D4F3x1y43S6mtk009Gnwaf7UVOyPr1yjiWbyHsPx1+92q13AJuOXQDZMSbA0dZRwXDFdweAkijoqoungqV8nXuKWr6mfzr3/5F8r2Hft9pid6VsrUtwfBOaym9Vo5XFr4HCLi/n0sy/PtcJk/nCl2S9etpGRr5tHvXRfT9TTTenlW9XFt2zwOL/Ln5hfe+99u+rv6k+mN07tJ0nkds1hnZBhm+stYjKD7+vbWRuuIMXfFujLqvDKhr6n4g1VdqqPmP2fKp34uHHRR+49VfE/matciWB/zMiy/V9ORPdvpx9D5OPq8NDk5ZivZDMrcVqueD/JwZEr5+5s22LBhfPTNFT5iUrJCrp+K+K+GvjprWUviq5TOnk/G/mbyGPpZO3ire6ypWlN9/wDNfa/Uywf/AA3zL+6x/wAP/uj/ANXfL+p90eq3u/8AF/ndm/ds3el46a+fh515+rXrbuX+B96/oHe/9T9js/nx9GV/q9SJmJ2/LrwMQ/cQ/W+5W/k7B+QrfXKmh+i31NPb10P445/i8H8o3m+z7BJDC8ZYzS0QmgMb01EgsI2pPKQmy4rSI0RohagIaIKjqsboOmxPiZQd6vDtfzA2iILbE63sMNiiCINM2uG22AomiIgiKIifQldK6HO+pa/3KsGlDivW3ktiORwX8Waxm5ykRdrTrTDUyGCr5auC5IVP4C1NGVdaEjdHe8vEmAcOW/i3l2+O4ncMIdmJYLssOVMYnQJDxyxBVitvEDrRumG0hQVBA0JS3ImWq5NpdJcSgvc3n22diuapuYY7HkMYpZbdHsGLLKH03n4sZx14pBt6rs9V59whTz2bd2haol1UIizllmO9WCzONOu3THCLkCs3SxWa7hd2CTRW5rzNtflN6fvHXCH8FTVy2VdQkSb0U7XcF8Fde7zY+RMwK3ZKGT3G5R8bjQZcqVIYdjRAaVtW2lZ1MmyRN7gomn2lRKy1W2bSySM5bzcL52c7GypsOA63c+XMwEIVuFVcKLGmSEbaAjRPFI8fTcWiJoKl4JV6I56s1Y7hd3+ZuvHMzPHOHYrjrOK2602+4QJN3jSZDtyZfFUMhNuQygNg42bKbU11Al3fBIrVNHS12md1m/bXo92C4ebc5oAm8gC3avYuFulOXu3XA2tDS1Tm2fTXRxV2GrggSInrCiajWKrT4Gu1WuJmp0Keu7XbPiRLITom9LuDc4Q10KGtulLIRxE8FFARV8fiiL5oldLaHOmpqP7rf6vmHfp9B/Jlyrnj1OmTQjj2jv8AdTmv/a1m/mJVbkMxFLPccwWfiHaHK7u8woWvP4Nvv1nf8xJPlwhyB18tyPxjVU80RRX4pVUfAm64mk/EnuPcArxHj8nkC/zrFneP2iNDv2Mhb5Ul2bLjNI0TsN1ptWFF5R3ojjg7NdC8tyw6OS1dQY1PS772e7KDLbtxDc+W8zbUbc1q4kWLKkIm0iRPEI0dPtnp+xBSWumiOWrLpe7GIjzHxqIogiOFiginkiJcJXhU49C8mpHeQdU7JfOjnHnYnC4DsfMrIFxd5EjNm66FxtwXaVEGULRKaNuRRAFLYgirW8i8RTXd3GDNvpkk/wBrjnSRjmfXrhC+3LTHs5ZcuWJMPH9li9RB3OtNa6IPzUYSUtfMmgQU1JdcuuZuN8iJvc0/Wlu36O2f+aKtpoZk1NNOvfbzrhifBXEOM5Ly9aLff7DiNpgXe3ujKJyPIjxW2zZLRlU1bVNvgunh4eFQ6uTpWyguZx3ylx7yzZpGQccZZAy6zxJJQ5cyCaqjUgQFxW3BNBIS2mK+KeS1LUFJye+rDRQCgFAKAyL7V+3vyhzjzllPKOI5li1vs+UNW1HIF4cmsyY5woLEIkRI8WQBoXob0XcPnpp4ar0rdJHK1G2am4Rj7mJYXiOKvSRmu4zZYFqdmAKgLpQozbCuIKqqohKGumtc2dUZP9k/bp5T5i5wzTkrF81xWBYMukxZKRbo5ObmR1bisx3B2MRHmz8W1UV3pqnnpXRXhHK1G2aVZpwvh/JPEo8Q55GK8WE7ZDguymV9GQ0/CABalxjVC9NwCDcPmnmJIQqQrEwzo1KgyByn2mOS2Lm+mE8n4zdbMrirFcvbcyBKFtV8BMIzMwCVE8NUJNfPRPKunUOTxssN1u9tCz8Z5bas95ayiHnN1sDwS7Fi9uYcC2NS2lQmpEh1/a4/6ZIhCHpgO5EUtyfZqXeSq441Jk7ydU807PWzjtnCsisljm4VIuZymb2Ultp8LgEZEUHIzL5IoLH8lDx3eaaeOVtBt6yZ4te0/wA9qYI9neANtqv4wwl3QyRPqFbaOv8AjSr6iI6bNA+p3Q7E+ul2XOsgviZ1ySrDke33IY/y8G1tvCoPfJtkRmTjgKoE6SouxVERFCLdNrSXWkEtdnOqWBdnMfgRMgkPY7llgRz82czhti49HF3RXGH2SUUfZJUQtikKoviBjqW7K2g21ZMupXtMcthOVuFydiEi2b9ElvhPZf2a+foCw6Ov1ep+Gr6iOfTZoh1Q6VYZ1mSdkD11LNeRbtH+VlZO6wkdmJGJUI48Jjc4oIaom8yJSLRNNiaisWtJdaQd73Q68ZN2U4rtOE4lfLZYrzaMjjXwH7v6yRnW2YsqMTSmw26YL/zhCRdhfsdPjqirhm3rKPKdH+reYdY8czuBmeQ2e+XLL7hDkMt2VZDjDDUNpwE3OyWmCIjV1fBA0TTzXXwWtJlKwSp2W6x4N2ZxGLYMnddst+sjjj+KZfEbFyTBcdREcAgJRR1l3aPqN7h12iqEJIi1lbQbasmUM32muZm55N23kfC5dsQ1QJkkrjHfUPgqsBEeFF+r1fw106iOfTZfnqd0TxPrjc3M3vd8TOeSXY7kWHdUY+XhWxl5NrqQ2iIzVxwfsk6S67VUREUI90WtJdaQeM7u9LOQey2a4hl2EZRj1oCxWRbROgXw5bKqqSXXxdbcjR5O7VHVRUUU008118NraDL0ktN194Vd4r6+4twtmUmBlJW633KDkRRwP5KU3c5cmQ6yIuoJEGyR6aqqJu010TXSpblyVVQoMwD9rrmPFOR4uScZcqY3brRYry3c8UvNwKYF2hpHfR6MRstRHGHHGtqa/jBE1TyFF0TpvRz6bJf7cdCOV+fOVW+Q8WzLFY7Uix2+33KPeCmw3PmoYEDhtjGiyx2HqhIikip5eOmq5W8Iq1G2Ve//ACg7A/2349/p11/8qreoiemzTHpJ1oyzrNgmV49mV9tN7u+S3tLkK2Un3IzTLcdtkRVyQywakqiSr9jRE08VqLWkulYLp1JYoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAf/Z);\n        }\n\n        .companies ul li.modxextras a {\n            background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMjkuNDkgNjEuNTQiPjxkZWZzPjxzdHlsZT4uY2xzLTF7ZmlsbDojMDBiNWRlO30uY2xzLTJ7ZmlsbDojMDBkZWNjO30uY2xzLTN7ZmlsbDojZmY1NTI5O30uY2xzLTR7ZmlsbDojZmY5NjQwO30uY2xzLTV7ZmlsbDojMTAyYzUzO308L3N0eWxlPjwvZGVmcz48ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj48ZyBpZD0iYnJhbmRfZ3VpZGVzIiBkYXRhLW5hbWU9ImJyYW5kIGd1aWRlcyI+PGcgaWQ9ImxvZ29fb25fbGlnaHQiIGRhdGEtbmFtZT0ibG9nbyBvbiBsaWdodCI+PHBvbHlnb24gY2xhc3M9ImNscy0xIiBwb2ludHM9IjU5LjI5IDUuOTUgMjkuNTggNS45NSAyNS41NiAxMi40IDQ2Ljk0IDI1LjcgNDYuOTQgMjUuNyA0Ni45NCAyNS43MSA1OS4yOSA1Ljk1Ii8+PHBvbHlnb24gY2xhc3M9ImNscy0yIiBwb2ludHM9IjI1LjU2IDEyLjQgNS42MiAwIDUuNjIgMjkuNzEgMTIuNDkgMzMuNzIgNDYuOTQgMjUuNyA0Ni45NCAyNS43IDI1LjU2IDEyLjQiLz48cG9seWdvbiBjbGFzcz0iY2xzLTMiIHBvaW50cz0iNDcuMDYgMjcuODIgNDcuMDYgMjcuODIgNDcuMDcgMjcuODIgNDcuMDYgMjcuODIiLz48cG9seWdvbiBjbGFzcz0iY2xzLTMiIHBvaW50cz0iNTMuNDcgMzEuODMgNDcuMDcgMjcuODIgMzMuNjUgNDkuMTUgNTMuNDcgNjEuNTQgNTMuNDcgMzEuODMiLz48cG9seWdvbiBjbGFzcz0iY2xzLTQiIHBvaW50cz0iNDcuMDcgMjcuODIgNDcuMDcgMjcuODIgNDcuMDYgMjcuODIgMTIuMzUgMzUuOTggMCA1NS40MSAyOS43MSA1NS40MSAzMy42NSA0OS4xNSA0Ny4wNyAyNy44MiA0Ny4wNyAyNy44MiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTEwNy42Niw0Ny44bDAtMTguODRMOTguMzcsNDQuNDhIOTUuMUw4NS45LDI5LjM3VjQ3LjhINzkuMDhWMTYuNGg2TDk2Ljg1LDM1LjkyLDEwOC40MiwxNi40aDZsLjA5LDMxLjRaIi8+PHBhdGggY2xhc3M9ImNscy01IiBkPSJNMTIxLjgyLDMyLjFjMC05LjMzLDcuMjctMTYuMjQsMTcuMTgtMTYuMjRzMTcuMTgsNi44NywxNy4xOCwxNi4yNFMxNDguODcsNDguMzQsMTM5LDQ4LjM0LDEyMS44Miw0MS40MywxMjEuODIsMzIuMVptMjcsMGMwLTYtNC4yMi0xMC05LjgzLTEwcy05LjgyLDQuMDktOS44MiwxMC4wNSw0LjIxLDEwLDkuODIsMTBTMTQ4LjgzLDM4LjA3LDE0OC44MywzMi4xWiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTE2My41OSwxNi40aDE0LjI2YzEwLjI3LDAsMTcuMzIsNi4xOSwxNy4zMiwxNS43cy03LDE1LjctMTcuMzIsMTUuN0gxNjMuNTlabTEzLjksMjUuNDRjNi4yNCwwLDEwLjMyLTMuNzMsMTAuMzItOS43NHMtNC4wOC05LjczLTEwLjMyLTkuNzNoLTYuNjRWNDEuODRaIi8+PHBhdGggY2xhc3M9ImNscy01IiBkPSJNMjIxLjEsNDcuOGwtNy41OC0xMC45LTcuNDUsMTAuOWgtOC4zNGwxMS42MS0xNi0xMS0xNS40M2g4LjI1bDcuMjIsMTAuMTgsNy4wOS0xMC4xOGg3Ljg1TDIxNy43OCwzMS41NiwyMjkuNDksNDcuOFoiLz48L2c+PC9nPjwvZz48L3N2Zz4=);\n        }\n\n        .disclaimer {\n            max-width: 960px;\n            display: block;\n            margin: 0 auto;\n            text-align: center;\n            color: #333;\n            font-size: .6em;\n        }\n\n        @media (min-width: 768px) and (max-width: 991px)  {\n            .container {\n                padding: 1em;\n                border: 0;\n                border-radius: 0;\n            }\n        }\n\n        @media (max-width: 767px)  {\n            body {\n                font-size: 16px;\n            }\n            .container {\n                padding: 1em;\n                margin: 0 0 1em;\n                border: 0;\n                border-radius: 0;\n            }\n            .container > section, .container > aside {\n                float: none;\n                width: 100%;\n            }\n            .container aside {\n                border: 0;\n                padding: 0;\n            }\n            .logo {\n                width: 100%;\n                height: 48px;\n            }\n            h1 {\n                font-size: 24px;\n            }\n            h2 {\n                font-size: 19px;\n            }\n            h3 {\n                font-size: 16px;\n            }\n            .companys ul li {\n                display: block;\n            }\n        }\n\n    </style>\n</head>\n<body>\n\n<a href=\"http://www.modx.com\" title=\"Modx\" class=\"logo\" target=\"_blank\">MODX</a>\n\n<div class=\"container\">\n    <section>\n        <h1>[[*longtitle:default=`[[*pagetitle]]`]]</h1>\n        [[*content]]\n    </section>\n    <aside>\n        <a href=\"[[++manager_url]]\" title=\"Your MODX manager\" class=\"cta-button\">Go to the&nbsp;manager</a>\n        <h3>Learn more about&nbsp;MODX</h3>\n        <ul>\n            <li><a href=\"https://docs.modx.com/current/en/index\">Official&nbsp;Documentation</a></li>\n            <li><a href=\"https://docs.modx.com/current/en/getting-started/friendly-urls\">Using Friendly&nbsp;URLs</a></li>\n            <li><a href=\"https://docs.modx.com/current/en/building-sites/extras\">Package&nbsp;Management</a></li>\n            <li><a href=\"http://modx.com/blog/\">Official MODX&nbsp;Blog</a></li>\n            <li><a href=\"http://www.discovermodx.com/\">Discover&nbsp;MODX</a></li>\n            <li><a href=\"https://modx.today\">MODX.today</a></li>\n        </ul>\n\n        <h3>Get help!</h3>\n        <ul>\n            <li><a href=\"http://forums.modx.com/\">Official MODX&nbsp;Forums</a></li>\n            <li><a href=\"https://modx.org/\">MODX on&nbsp;Slack</a></li>\n            <li><a href=\"https://twitter.com/modx\">MODX on&nbsp;Twitter</a></li>\n            <li><a href=\"https://www.facebook.com/modxcms\">MODX on&nbsp;Facebook</a></li>\n            <li><a href=\"http://modx.com/professionals/\">Find a MODX&nbsp;Professional</a></li>\n        </ul>\n    </aside>\n    <div class=\"companies\">\n        <h3>Extend MODX with&nbsp;Extras</h3>\n        <ul>\n            <li class=\"modxextras\"><a href=\"http://modx.com/extras/\" title=\"MODX extras\" target=\"_blank\">MODX&nbsp;extras</a></li>\n            <li class=\"modmore\"><a href=\"https://www.modmore.com/extras/\" title=\"modmore.com\" target=\"_blank\">modmore.com</a></li>\n            <li class=\"modstore\"><a href=\"https://modstore.pro/\" title=\"modstore.pro\" target=\"_blank\">modstore.pro</a></li>\n            <li class=\"extrasio\"><a href=\"https://extras.io/extras/\" title=\"Extras.io\" target=\"_blank\">Extras.io</a></li>\n        </ul>\n    </div>\n</div>\n<footer class=\"disclaimer\">\n    <p>&copy; 2005-present the <a href=\"http://www.modx.com/\" target=\"_blank\">MODX</a> Content Management Framework (CMF) project. All rights reserved. MODX is licensed under the GNU&nbsp;GPL.</p>\n</footer>\n\n<script>\n    // Load the Open Sans font\n    try {\n        document.addEventListener(\"DOMContentLoaded\", function() { // prevent a Flash Of Unstyled Text (FOUT)\n            document.querySelector(\'head\').innerHTML += \"<link href=\'https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap\' rel=\'stylesheet\' type=\'text/css\'>\";\n            document.body.classList.add(\'loaded\');\n        });\n    } catch (e) { }\n\n    // Shuffle the vendors to prevent favoritism of one vendor over the other\n    // with thanks to http://james.padolsey.com/javascript/shuffling-the-dom/\n    function shuffle(elems) {\n        var allElems = (function(){\n            var ret = [], l = elems.length;\n            while (l--) {\n                if (elems[l].className !== \'modxextras\') {\n                    ret[ret.length] = elems[l];\n                }\n            }\n            return ret;\n        })();\n\n        var shuffled = (function(){\n            var l = allElems.length, ret = [];\n            while (l--) {\n                var random = Math.floor(Math.random() * allElems.length),\n                        randEl = allElems[random].cloneNode(true);\n                allElems.splice(random, 1);\n                ret[ret.length] = randEl;\n            }\n            return ret;\n        })(), l = elems.length;\n\n        // To make sure the MODX logo stays #1, we lower the count by one here (shuffling 3 instead of 4 items)\n        // and refer to elems[l+1] in the loop below. This matches because allElems was also filtered to not include\n        // the official MODX logo.\n        l--;\n        while (l--) {\n            elems[l+1].parentNode.insertBefore(shuffled[l], elems[l+1].nextSibling);\n            elems[l+1].parentNode.removeChild(elems[l+1]);\n        }\n    }\n    shuffle(document.querySelectorAll(\'.companies li\'));\n</script>\n\n</body>\n</html>\n', 0, NULL, 0, '');
INSERT INTO `mx_site_templates` (`id`, `source`, `property_preprocess`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `properties`, `static`, `static_file`) VALUES
(2, 1, 0, 'tplClub4', '', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang=\"ru\">\n<head>\n    <meta charset=\"utf-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=0\" />\n    [[-shrink-to-fit=no, viewport-fit=cover]]\n    <title>[[*pagetitle]] | [[++site_name]]</title>\n\n<link rel=\"stylesheet\" href=\"[[++crm_url]]wss/theme.min.css?v=[[++vers]]\" />\n\n<script src=\"[[++crm_url]]wss/jquery.min.js?ver=3.3.1\"></script>\n<script src=\"/js/[[!++scrm_prugv]]/start.js\" id=\"start_js\"></script>\n\n[[!+StartupHTMLBlock]]\n<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\" integrity=\"sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=\" crossorigin=\"anonymous\" />\n</head>\n<body id=\"body[[*id]]\" class=\"spinner-parent\" data-user=\"[[!+modx.user.id]]\" data-mxq=\"[^q^]\">\n<div class=\"app\">\n    <nav class=\"app-header app-header-dark d-print-none start-data-link\">\n        <div class=\"top-bar\">\n            [[-<a href=\"index.html\" class=\"navbar-brand bg-danger\">\n                [[-<img src=\"assets/images/brand-inverse.png\" alt=\"\" style=\"height: 32px;width: auto;\">]]\n            </a>]]\n            <a class=\"top-bar-brand\" href=\"/\">\n                [[++site_name]]\n            </a>\n          <div class=\"top-bar-list\">\n            <div class=\"top-bar-item px-2 d-lg-none\">\n                <button class=\"hamburger hamburger-squeeze\" type=\"button\" data-toggle=\"modal\" data-target=\"#mmenuModal\">\n                    <span class=\"hamburger-inner\"></span>\n                </button>\n            </div>\n            <!-- .top-bar-item -->\n            <div class=\"top-bar-item top-bar-item-right px-0\">\n              <ul class=\"header-nav nav\">\n                <li class=\"nav-item dropdown header-nav-dropdown1\" id=\"scrmHelpMenu\">\n                    <a class=\"nav-link\" href=\"#\" data-toggle=\"dropdown\"><span class=\"fa fa-question-circle\"></span></a>\n                    <div class=\"dropdown-menu dropdown-menu-right\">\n                    <div class=\"dropdown-arrow\"></div>\n                        <a class=\"dropdown-item prevent-default\" href=\"#\" data-run=\"/chunk/help\" data-help=\"kb\">База знаний</a>\n                        [[-<a class=\"dropdown-item\" href=\"/help/integration.html\"\n                                data-link=\"visible{:ugroups.indexOf(\'idAdmin\')>=0}\">Интеграции</a>]]\n                        [[-<a class=\"dropdown-item prevent-default\" href=\"#\"\n                            data-link=\"visible{:ugroups.indexOf(\'idSportsmen\')>=0}\" data-run=\"/chunk/help\" data-help=\"adm\">Написать в администрацию</a>\n                        <div data-link=\"visible{:is_crew}\">\n                            <div class=\"dropdown-divider\"></div>\n                            <div class=\"dropdown-header\"><small>Служба заботы</small></div>\n                            <a class=\"dropdown-item prevent-default\" href=\"#\" data-run=\"Techat\">Онлайн-чат</a>\n                            <a class=\"dropdown-item prevent-default\" href=\"#\" data-run=\"/chunk/help\" data-help=\"tech\">Техническая поддержка</a>\n                            \n                        </div>]]\n                        <div class=\"dropdown-divider\"></div>\n                        <a class=\"dropdown-item prevent-default\" href=\"#\" target=\"_blank\" data-run=\"/chunk/help\" data-help=\"about\">О системе</a>\n                        [[-<a class=\"dropdown-item prevent-default\" href=\"#\" data-run=\"/chunk/html/License\">Лицензия</a>]]\n                    </div>\n                </li>\n              </ul>\n              <!-- .btn-account -->\n              <div class=\"dropdown d-flex d-sm-flex1\">\n    [[!Login?\n        &loginTpl=`idLoginMenu4`\n        &logoutTpl=`idLogoutMenu4`\n        &loginViaEmail=`1`\n        &logoutResourceId=`1`\n        &errTpl=`idLoginErrTpl`\n    ]]\n              </div><!-- /.btn-account -->\n            </div><!-- /.top-bar-item -->\n          </div><!-- /.top-bar-list -->\n        </div><!-- /.top-bar -->\n    </nav>\n\n    <div id=\"page\" class=\"d-flex min-vh-100\">\n        <aside class=\"border-right d-print-none d-none d-lg-block\">\n            <nav id=\"main-menu\" class=\"mb-5\">\n            [[!clubMenu]]\n            </nav>\n        </aside>\n        \n        <main class=\"app-main1 flex-grow-1 d-flex flex-column\">\n            <div class=\"wrapper1 flex-grow-1\">\n              <div class=\"page1\">\n                <header class=\"page-navs shadow-sm pr-3 d-print-none start-data-link\">\n                    <div class=\"account-summary\" data-link=\"visible{:!topNavTabs||!topNavTabs^length}\">\n                      <h2 class=\"card-title\" data-link=\"html^{:title}\">[[*longtitle:default=`[[*pagetitle]]`]]</h2>\n                      <h6 class=\"card-subtitle text-muted\" data-link=\"html^{:subtitle}\"></h6>\n                    </div>\n                    <div class=\"nav-scroller\" id=\"topNavTabs\" data-link=\"visible{:topNavTabs^length}\">\n                        <div class=\"nav nav-tabs\" data-link=\"{for topNavTabs tmpl=\'#tpl_topNavTab\'}\"></div>\n                    </div>\n                  [[-<!-- right actions -->\n                  <div class=\"ml-auto\">\n                    <!-- invite members -->\n                    <div class=\"dropdown d-inline-block\">\n                      <button type=\"button\" class=\"btn btn-light btn-icon\" title=\"Invite members\" data-toggle=\"dropdown\" data-display=\"static\" aria-haspopup=\"true\" aria-expanded=\"false\"><i class=\"fas fa-user-plus\"></i></button>\n                      <div class=\"dropdown-arrow\"></div><!-- .dropdown-menu -->\n                      <div class=\"dropdown-menu dropdown-menu-right dropdown-menu-rich stop-propagation\">\n                        <div class=\"dropdown-header\"> Add members </div>\n                        <div class=\"form-group px-3 py-2 m-0\">\n                          <input type=\"text\" class=\"form-control\" placeholder=\"e.g. @bent10\" data-toggle=\"tribute\" data-remote=\"assets/data/tribute.json\" data-menu-container=\"#people-list\" data-item-template=\"true\" data-autofocus=\"true\" data-tribute=\"true\"> <small class=\"form-text text-muted\">Search people by username or email address to invite them.</small>\n                        </div>\n                        <div id=\"people-list\" class=\"tribute-inline stop-propagation\"></div><a href=\"#\" class=\"dropdown-footer\">Invite member by link <i class=\"far fa-clone\"></i></a>\n                      </div><!-- /.dropdown-menu -->\n                    </div><!-- /invite members -->\n                    <button type=\"button\" class=\"btn btn-light btn-icon\" data-toggle=\"sidebar\"><i class=\"fa fa-angle-double-left\"></i></button>\n                  </div><!-- /right actions -->]]\n                </header>\n                <div class=\"page-inner\">\n                  \n                  [[-<header class=\"page-title-bar\">\n                    <h1 class=\"page-title\"> Page title </h1>\n                  </header>]]\n                    <div class=\"page-section\">\n[[*content]]\n                    </div>\n                  \n                  [[-<div class=\"section-block\">\n                      <p>Hello world!</p>\n                    </div>]]\n                </div><!-- /.page-inner -->\n              </div><!-- /.page -->\n            </div><!-- /.wrapper -->\n            \n            <footer class=\"d-print-none bg^light border^top app-footer start-data-link\">\n                <ul class=\"list-inline\" data-link=\"visible{:bottomNavLinks^length} {for bottomNavLinks ~itemCls=\'text-muted\' tmpl=\'#tplListInlineItem\'}\"></ul>\n                <div class=\"copyright\">\n                    &copy; Административная панель. Жалобы на Систему здравоохранения.\n                </div>\n            </footer>\n        </main>\n    </div>\n</div>\n\n[[$tplModal]]\n\n<div class=\"modal modal-drawer fade\" id=\"mmenuModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"mmenuLabel\">\n    <div class=\"modal-dialog modal-drawer-left\" role=\"document\">\n        <div class=\"modal-content\">\n            <div class=\"modal-header\">\n                <b id=\"mmenuLabel\" class=\"modal-title\">[[!++site_name]]</b>\n                <button class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>\n            </div>\n            <div class=\"modal-body p-0\"></div>\n        </div>\n    </div>\n</div>\n\n<script id=\"roInplaceHtml\" type=\"text/x-jsrender\">\n    <form action=\"\" class=\"input-group roinplace\" data-link=\"{on \'submit reset\' ~InplaceSubmit}\">\n        <input class=\"form-control\" data-link=\"inplace_value\">\n        <div class=\"input-group-append\" data-link=\"visible{:(inplace_value!=old_inplace_value)}\">\n            <button class=\"btn btn-subtle-primary\" type=\"submit\"><i class=\"fa fa-check\"></i></button>\n        </div>\n        <div class=\"input-group-append\">\n            <button class=\"btn btn-subtle-danger\" type=\"reset\"><i class=\"fa fa-times\"></i></button>\n        </div>\n    </form>\n</script>\n\n<script id=\"tplListInlineItem\" type=\"text/x-jsrender\">\n    <li class=\"list-inline-item\" data-link=\"{include tmpl=(!href)? #data : \'#tplMenuItem\'}\"></li>\n</script>\n<script id=\"tplMenuItem\" type=\"text/x-jsrender\">\n    <a data-link=\"html{:html} href{:href} class{:~itemCls||\'dropdown-item\'}\"></a>\n</script>\n<script id=\"tpl_topNavTab\" type=\"text/x-jsrender\">\n    <a class=\"nav-link\" data-toggle=\"tab\"\n        data-link=\"html{:html} href{:href} class{merge:active toggle=\'active\'} visible{:!hidden}\"></a>\n</script>\n\n<script>\n    SCRM.app.title = \'[[*longtitle:default=`[[*pagetitle]]`]]\';\n    $(\'.start-data-link\').link(true, SCRM.app);\n</script>\n\n<li class=\"nav-item ib-top\">\n    <a class=\"nav-link prevent-default\" href=\"#\" target=\"_blank\"><i class=\"fa fa-user-plus\"></i></a>\n</li>\n\n\n<script>\n$(\'.ib-top\').prependTo(\'ul.header-nav\').find(\'a\').click(function(e){\n    SCRM._run(\'/projects/widget\');\n});\n</script>\n\n[[-<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.15.0/umd/popper.min.js\" integrity=\"sha256-fTuUgtT7O2rqoImwjrhDgbXTKUwyxxujIMRIK7TbuNU=\" crossorigin=\"anonymous\"></script>\n<script src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha256-CjSoeELFOcH0/uxWu6mC/Vlrc1AARqbm/jiiImDGV3s=\" crossorigin=\"anonymous\"></script>]]\n\n<script src=\"[[++crm_url]]wss/bootstrap.js?ver=4.6.0\"></script>\n[[!+BottomHTMLBlock]]\n</body>\n</html>', 0, 'a:0:{}', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_tmplvars`
--

CREATE TABLE `mx_site_tmplvars` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `property_preprocess` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(191) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '',
  `default_text` mediumtext,
  `properties` text,
  `input_properties` text,
  `output_properties` text,
  `static` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `static_file` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_tmplvar_access`
--

CREATE TABLE `mx_site_tmplvar_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_tmplvar_contentvalues`
--

CREATE TABLE `mx_site_tmplvar_contentvalues` (
  `id` int(10) UNSIGNED NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `contentid` int(10) NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_site_tmplvar_templates`
--

CREATE TABLE `mx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_system_eventnames`
--

CREATE TABLE `mx_system_eventnames` (
  `name` varchar(50) NOT NULL,
  `service` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `groupname` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_system_eventnames`
--

INSERT INTO `mx_system_eventnames` (`name`, `service`, `groupname`) VALUES
('OnBeforeCacheUpdate', 4, 'System'),
('OnBeforeChunkFormDelete', 1, 'Chunks'),
('OnBeforeChunkFormSave', 1, 'Chunks'),
('OnBeforeDocFormDelete', 1, 'Resources'),
('OnBeforeDocFormSave', 1, 'Resources'),
('OnBeforeEmptyTrash', 1, 'Resources'),
('OnBeforeManagerLogin', 2, 'Security'),
('OnBeforeManagerLogout', 2, 'Security'),
('OnBeforeManagerPageInit', 2, 'System'),
('OnBeforePluginFormDelete', 1, 'Plugins'),
('OnBeforePluginFormSave', 1, 'Plugins'),
('OnBeforeRegisterClientScripts', 5, 'System'),
('OnBeforeSaveWebPageCache', 4, 'System'),
('OnBeforeSnipFormDelete', 1, 'Snippets'),
('OnBeforeSnipFormSave', 1, 'Snippets'),
('OnBeforeTempFormDelete', 1, 'Templates'),
('OnBeforeTempFormSave', 1, 'Templates'),
('OnBeforeTVFormDelete', 1, 'Template Variables'),
('OnBeforeTVFormSave', 1, 'Template Variables'),
('OnBeforeUserActivate', 1, 'Users'),
('OnBeforeUserDeactivate', 1, 'Users'),
('OnBeforeUserDuplicate', 1, 'Users'),
('OnBeforeUserFormDelete', 1, 'Users'),
('OnBeforeUserFormSave', 1, 'Users'),
('OnBeforeUserGroupFormRemove', 1, 'User Groups'),
('OnBeforeUserGroupFormSave', 1, 'User Groups'),
('OnBeforeWebLogin', 3, 'Security'),
('OnBeforeWebLogout', 3, 'Security'),
('OnCacheUpdate', 4, 'System'),
('OnCategoryBeforeRemove', 1, 'Categories'),
('OnCategoryBeforeSave', 1, 'Categories'),
('OnCategoryRemove', 1, 'Categories'),
('OnCategorySave', 1, 'Categories'),
('OnChunkBeforeRemove', 1, 'Chunks'),
('OnChunkBeforeSave', 1, 'Chunks'),
('OnChunkFormDelete', 1, 'Chunks'),
('OnChunkFormPrerender', 1, 'Chunks'),
('OnChunkFormRender', 1, 'Chunks'),
('OnChunkFormSave', 1, 'Chunks'),
('OnChunkRemove', 1, 'Chunks'),
('OnChunkSave', 1, 'Chunks'),
('OnContextBeforeRemove', 1, 'Contexts'),
('OnContextBeforeSave', 1, 'Contexts'),
('OnContextFormPrerender', 2, 'Contexts'),
('OnContextFormRender', 2, 'Contexts'),
('OnContextRemove', 1, 'Contexts'),
('OnContextSave', 1, 'Contexts'),
('OnDocFormDelete', 1, 'Resources'),
('OnDocFormPrerender', 1, 'Resources'),
('OnDocFormRender', 1, 'Resources'),
('OnDocFormSave', 1, 'Resources'),
('OnDocPublished', 5, 'Resources'),
('OnDocUnPublished', 5, 'Resources'),
('OnElementNotFound', 1, 'System'),
('OnEmptyTrash', 1, 'Resources'),
('OnFileCreateFormPrerender', 1, 'System'),
('OnFileEditFormPrerender', 1, 'System'),
('OnFileManagerBeforeUpload', 1, 'System'),
('OnFileManagerDirCreate', 1, 'System'),
('OnFileManagerDirRemove', 1, 'System'),
('OnFileManagerDirRename', 1, 'System'),
('OnFileManagerFileCreate', 1, 'System'),
('OnFileManagerFileRemove', 1, 'System'),
('OnFileManagerFileRename', 1, 'System'),
('OnFileManagerFileUpdate', 1, 'System'),
('OnFileManagerMoveObject', 1, 'System'),
('OnFileManagerUpload', 1, 'System'),
('OnHandleRequest', 5, 'System'),
('OnInitCulture', 1, 'Internationalization'),
('OnLoadWebDocument', 5, 'System'),
('OnLoadWebPageCache', 4, 'System'),
('OnManagerAuthentication', 2, 'Security'),
('OnManagerLogin', 2, 'Security'),
('OnManagerLoginFormPrerender', 2, 'Security'),
('OnManagerLoginFormRender', 2, 'Security'),
('OnManagerLogout', 2, 'Security'),
('OnManagerPageAfterRender', 2, 'System'),
('OnManagerPageBeforeRender', 2, 'System'),
('OnManagerPageInit', 2, 'System'),
('OnMediaSourceBeforeFormDelete', 1, 'Media Sources'),
('OnMediaSourceBeforeFormSave', 1, 'Media Sources'),
('OnMediaSourceDuplicate', 1, 'Media Sources'),
('OnMediaSourceFormDelete', 1, 'Media Sources'),
('OnMediaSourceFormSave', 1, 'Media Sources'),
('OnMediaSourceGetProperties', 1, 'Media Sources'),
('OnMODXInit', 5, 'System'),
('OnPackageInstall', 2, 'Package Manager'),
('OnPackageRemove', 2, 'Package Manager'),
('OnPackageUninstall', 2, 'Package Manager'),
('OnPageNotFound', 1, 'System'),
('OnPageUnauthorized', 1, 'Security'),
('OnParseDocument', 5, 'System'),
('OnPluginBeforeRemove', 1, 'Plugins'),
('OnPluginBeforeSave', 1, 'Plugins'),
('OnPluginEventBeforeRemove', 1, 'Plugin Events'),
('OnPluginEventBeforeSave', 1, 'Plugin Events'),
('OnPluginEventRemove', 1, 'Plugin Events'),
('OnPluginEventSave', 1, 'Plugin Events'),
('OnPluginFormDelete', 1, 'Plugins'),
('OnPluginFormPrerender', 1, 'Plugins'),
('OnPluginFormRender', 1, 'Plugins'),
('OnPluginFormSave', 1, 'Plugins'),
('OnPluginRemove', 1, 'Plugins'),
('OnPluginSave', 1, 'Plugins'),
('OnPropertySetBeforeRemove', 1, 'Property Sets'),
('OnPropertySetBeforeSave', 1, 'Property Sets'),
('OnPropertySetRemove', 1, 'Property Sets'),
('OnPropertySetSave', 1, 'Property Sets'),
('OnResourceAddToResourceGroup', 1, 'Resources'),
('OnResourceAutoPublish', 1, 'Resources'),
('OnResourceBeforeSort', 1, 'Resources'),
('OnResourceCacheUpdate', 1, 'Resources'),
('OnResourceDelete', 1, 'Resources'),
('OnResourceDuplicate', 1, 'Resources'),
('OnResourceGroupBeforeRemove', 1, 'Security'),
('OnResourceGroupBeforeSave', 1, 'Security'),
('OnResourceGroupRemove', 1, 'Security'),
('OnResourceGroupSave', 1, 'Security'),
('OnResourceRemoveFromResourceGroup', 1, 'Resources'),
('OnResourceSort', 1, 'Resources'),
('OnResourceToolbarLoad', 1, 'Resources'),
('OnResourceTVFormPrerender', 1, 'Resources'),
('OnResourceTVFormRender', 1, 'Resources'),
('OnResourceUndelete', 1, 'Resources'),
('OnRichTextBrowserInit', 1, 'RichText Editor'),
('OnRichTextEditorInit', 1, 'RichText Editor'),
('OnRichTextEditorRegister', 1, 'RichText Editor'),
('OnSiteRefresh', 1, 'System'),
('OnSiteSettingsRender', 1, 'Settings'),
('OnSnipFormDelete', 1, 'Snippets'),
('OnSnipFormPrerender', 1, 'Snippets'),
('OnSnipFormRender', 1, 'Snippets'),
('OnSnipFormSave', 1, 'Snippets'),
('OnSnippetBeforeRemove', 1, 'Snippets'),
('OnSnippetBeforeSave', 1, 'Snippets'),
('OnSnippetRemove', 1, 'Snippets'),
('OnSnippetSave', 1, 'Snippets'),
('OnTempFormDelete', 1, 'Templates'),
('OnTempFormPrerender', 1, 'Templates'),
('OnTempFormRender', 1, 'Templates'),
('OnTempFormSave', 1, 'Templates'),
('OnTemplateBeforeRemove', 1, 'Templates'),
('OnTemplateBeforeSave', 1, 'Templates'),
('OnTemplateRemove', 1, 'Templates'),
('OnTemplateSave', 1, 'Templates'),
('OnTemplateVarBeforeRemove', 1, 'Template Variables'),
('OnTemplateVarBeforeSave', 1, 'Template Variables'),
('OnTemplateVarRemove', 1, 'Template Variables'),
('OnTemplateVarSave', 1, 'Template Variables'),
('OnTVFormDelete', 1, 'Template Variables'),
('OnTVFormPrerender', 1, 'Template Variables'),
('OnTVFormRender', 1, 'Template Variables'),
('OnTVFormSave', 1, 'Template Variables'),
('OnTVInputPropertiesList', 1, 'Template Variables'),
('OnTVInputRenderList', 1, 'Template Variables'),
('OnTVOutputRenderList', 1, 'Template Variables'),
('OnTVOutputRenderPropertiesList', 1, 'Template Variables'),
('OnUserActivate', 1, 'Users'),
('OnUserAddToGroup', 1, 'User Groups'),
('OnUserBeforeAddToGroup', 1, 'User Groups'),
('OnUserBeforeRemove', 1, 'Users'),
('OnUserBeforeRemoveFromGroup', 1, 'User Groups'),
('OnUserBeforeSave', 1, 'Users'),
('OnUserChangePassword', 1, 'Users'),
('OnUserDeactivate', 1, 'Users'),
('OnUserDuplicate', 1, 'Users'),
('OnUserFormDelete', 1, 'Users'),
('OnUserFormPrerender', 1, 'Users'),
('OnUserFormRender', 1, 'Users'),
('OnUserFormSave', 1, 'Users'),
('OnUserGroupBeforeRemove', 1, 'User Groups'),
('OnUserGroupBeforeSave', 1, 'User Groups'),
('OnUserGroupFormSave', 1, 'User Groups'),
('OnUserGroupRemove', 1, 'User Groups'),
('OnUserGroupSave', 1, 'User Groups'),
('OnUserNotFound', 1, 'Users'),
('OnUserProfileBeforeRemove', 1, 'User Profiles'),
('OnUserProfileBeforeSave', 1, 'User Profiles'),
('OnUserProfileRemove', 1, 'User Profiles'),
('OnUserProfileSave', 1, 'User Profiles'),
('OnUserRemove', 1, 'Users'),
('OnUserRemoveFromGroup', 1, 'User Groups'),
('OnUserSave', 1, 'Users'),
('OnWebAuthentication', 3, 'Security'),
('OnWebLogin', 3, 'Security'),
('OnWebLogout', 3, 'Security'),
('OnWebPageComplete', 5, 'System'),
('OnWebPageInit', 5, 'System'),
('OnWebPagePrerender', 5, 'System'),
('pdoToolsOnFenomInit', 6, 'pdoTools');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_system_settings`
--

CREATE TABLE `mx_system_settings` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(191) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_system_settings`
--

INSERT INTO `mx_system_settings` (`key`, `value`, `xtype`, `namespace`, `area`, `editedon`) VALUES
('access_category_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('access_context_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('access_policies_version', '1.0', 'textfield', 'core', 'system', NULL),
('access_resource_group_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('ace.fold_widgets', '1', 'combo-boolean', 'ace', 'general', NULL),
('ace.font_size', '13px', 'textfield', 'ace', 'general', NULL),
('ace.grow', '', 'textfield', 'ace', 'general', NULL),
('ace.height', '', 'textfield', 'ace', 'general', NULL),
('ace.html_elements_mime', '', 'textfield', 'ace', 'general', NULL),
('ace.show_invisibles', '0', 'combo-boolean', 'ace', 'general', NULL),
('ace.snippets', '', 'textarea', 'ace', 'general', NULL),
('ace.soft_tabs', '1', 'combo-boolean', 'ace', 'general', NULL),
('ace.tab_size', '4', 'textfield', 'ace', 'general', NULL),
('ace.theme', 'chrome', 'textfield', 'ace', 'general', NULL),
('ace.word_wrap', '', 'combo-boolean', 'ace', 'general', NULL),
('allow_forward_across_contexts', '', 'combo-boolean', 'core', 'system', NULL),
('allow_manager_login_forgot_password', '1', 'combo-boolean', 'core', 'authentication', NULL),
('allow_multiple_emails', '0', 'combo-boolean', 'core', 'authentication', '2022-04-09 12:06:57'),
('allow_tags_in_post', '', 'combo-boolean', 'core', 'system', NULL),
('allow_tv_eval', '1', 'combo-boolean', 'core', 'system', NULL),
('anonymous_sessions', '1', 'combo-boolean', 'core', 'session', NULL),
('archive_with', '', 'combo-boolean', 'core', 'system', NULL),
('automatic_alias', '1', 'combo-boolean', 'core', 'furls', NULL),
('automatic_template_assignment', 'parent', 'textfield', 'core', 'site', NULL),
('auto_check_pkg_updates', '1', 'combo-boolean', 'core', 'system', NULL),
('auto_check_pkg_updates_cache_expire', '15', 'textfield', 'core', 'system', NULL),
('auto_isfolder', '1', 'combo-boolean', 'core', 'site', NULL),
('auto_menuindex', '1', 'combo-boolean', 'core', 'site', NULL),
('base_help_url', '//docs.modx.com/help/', 'textfield', 'core', 'manager', NULL),
('blocked_minutes', '20', 'textfield', 'core', 'authentication', '2022-04-09 12:06:57'),
('cache_action_map', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_alias_map', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_context_settings', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_db', '0', 'combo-boolean', 'core', 'caching', NULL),
('cache_db_expires', '0', 'textfield', 'core', 'caching', NULL),
('cache_db_session', '0', 'combo-boolean', 'core', 'caching', NULL),
('cache_db_session_lifetime', '', 'textfield', 'core', 'caching', NULL),
('cache_default', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_expires', '0', 'textfield', 'core', 'caching', NULL),
('cache_format', '0', 'textfield', 'core', 'caching', NULL),
('cache_handler', 'xPDOFileCache', 'textfield', 'core', 'caching', NULL),
('cache_lang_js', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_lexicon_topics', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_noncore_lexicon_topics', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource_clear_partial', '0', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource_expires', '0', 'textfield', 'core', 'caching', NULL),
('cache_scripts', '1', 'combo-boolean', 'core', 'caching', NULL),
('clear_cache_refresh_trees', '1', 'combo-boolean', 'core', 'caching', '2022-04-09 12:06:57'),
('compress_css', '0', 'combo-boolean', 'core', 'manager', '2022-04-09 08:15:22'),
('compress_js', '0', 'combo-boolean', 'core', 'manager', '2022-04-09 08:15:22'),
('compress_js_max_files', '10', 'textfield', 'core', 'manager', NULL),
('confirm_navigation', '1', 'combo-boolean', 'core', 'manager', NULL),
('container_suffix', '/', 'textfield', 'core', 'furls', NULL),
('context_tree_sort', '1', 'combo-boolean', 'core', 'manager', NULL),
('context_tree_sortby', 'rank', 'textfield', 'core', 'manager', NULL),
('context_tree_sortdir', 'ASC', 'textfield', 'core', 'manager', NULL),
('cultureKey', 'ru', 'modx-combo-language', 'core', 'language', '2022-04-09 08:15:22'),
('date_timezone', 'Europe/Moscow', 'textfield', 'core', 'system', '2022-04-09 12:06:57'),
('debug', '', 'textfield', 'core', 'system', NULL),
('default_content_type', '1', 'modx-combo-content-type', 'core', 'site', NULL),
('default_context', 'web', 'modx-combo-context', 'core', 'site', NULL),
('default_duplicate_publish_option', 'preserve', 'textfield', 'core', 'manager', NULL),
('default_media_source', '1', 'modx-combo-source', 'core', 'manager', NULL),
('default_media_source_type', 'sources.modFileMediaSource', 'modx-combo-source-type', 'core', 'manager', NULL),
('default_per_page', '20', 'textfield', 'core', 'manager', NULL),
('default_template', '1', 'modx-combo-template', 'core', 'site', NULL),
('default_username', '(anonymous)', 'textfield', 'core', 'session', NULL),
('editor_css_path', '', 'textfield', 'core', 'editor', NULL),
('editor_css_selectors', '', 'textfield', 'core', 'editor', NULL),
('emailsender', 'uroboros@sportcrm.club', 'textfield', 'core', 'authentication', '2022-04-09 08:15:22'),
('emailsubject', 'Your login details', 'textfield', 'core', 'authentication', NULL),
('enable_dragdrop', '1', 'combo-boolean', 'core', 'manager', NULL),
('enable_gravatar', '0', 'combo-boolean', 'core', 'manager', '2022-04-09 08:22:57'),
('error_log_filename', 'error.log', 'textfield', 'core', 'system', NULL),
('error_log_filepath', '', 'textfield', 'core', 'system', NULL),
('error_page', '1', 'textfield', 'core', 'site', NULL),
('failed_login_attempts', '7', 'textfield', 'core', 'authentication', '2022-04-09 12:06:57'),
('feed_modx_news', 'https://feeds.feedburner.com/modx-announce', 'textfield', 'core', 'system', NULL),
('feed_modx_news_enabled', '0', 'combo-boolean', 'core', 'system', '2022-04-09 12:06:57'),
('feed_modx_security', 'https://forums.modx.com/board.xml?board=294', 'textfield', 'core', 'system', NULL),
('feed_modx_security_enabled', '0', 'combo-boolean', 'core', 'system', '2022-04-09 12:06:57'),
('fe_editor_lang', 'en', 'modx-combo-language', 'core', 'language', NULL),
('filemanager_path', '', 'textfield', 'core', 'file', NULL),
('filemanager_path_relative', '1', 'combo-boolean', 'core', 'file', NULL),
('filemanager_url', '', 'textfield', 'core', 'file', NULL),
('filemanager_url_relative', '1', 'combo-boolean', 'core', 'file', NULL),
('forgot_login_email', '<p>Hello [[+username]],</p>\n<p>A request for a password reset has been issued for your MODX user. If you sent this, you may follow this link and use this password to login. If you did not send this request, please ignore this email.</p>\n\n<p>\n    <strong>Activation Link:</strong> [[+url_scheme]][[+http_host]][[+manager_url]]?modahsh=[[+hash]]<br />\n    <strong>Username:</strong> [[+username]]<br />\n    <strong>Password:</strong> [[+password]]<br />\n</p>\n\n<p>After you log into the MODX Manager, you can change your password again, if you wish.</p>\n\n<p>Regards,<br />Site Administrator</p>', 'textarea', 'core', 'authentication', NULL),
('form_customization_use_all_groups', '', 'combo-boolean', 'core', 'manager', NULL),
('forward_merge_excludes', 'type,published,class_key', 'textfield', 'core', 'system', NULL),
('friendly_alias_lowercase_only', '1', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_max_length', '0', 'textfield', 'core', 'furls', NULL),
('friendly_alias_realtime', '0', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_restrict_chars', 'pattern', 'textfield', 'core', 'furls', NULL),
('friendly_alias_restrict_chars_pattern', '/[\\0\\x0B\\t\\n\\r\\f\\a&=+%#<>\"~:`@\\?\\[\\]\\{\\}\\|\\^\'\\\\]/', 'textfield', 'core', 'furls', NULL),
('friendly_alias_strip_element_tags', '1', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_translit', 'russian', 'textfield', 'core', 'furls', '2022-04-09 12:06:57'),
('friendly_alias_translit_class', 'translit.modTransliterate', 'textfield', 'core', 'furls', NULL),
('friendly_alias_translit_class_path', '{core_path}components/', 'textfield', 'core', 'furls', NULL),
('friendly_alias_trim_chars', '/.-_', 'textfield', 'core', 'furls', NULL),
('friendly_alias_word_delimiter', '-', 'textfield', 'core', 'furls', NULL),
('friendly_alias_word_delimiters', '-_', 'textfield', 'core', 'furls', NULL),
('friendly_urls', '1', 'combo-boolean', 'core', 'furls', '2022-04-09 12:01:34'),
('friendly_urls_strict', '0', 'combo-boolean', 'core', 'furls', NULL),
('global_duplicate_uri_check', '0', 'combo-boolean', 'core', 'furls', NULL),
('hidemenu_default', '0', 'combo-boolean', 'core', 'site', NULL),
('inline_help', '1', 'combo-boolean', 'core', 'manager', NULL),
('link_tag_scheme', 'abs', 'textfield', 'core', 'site', '2022-04-09 12:06:57'),
('locale', 'ru_RU.UTF-8', 'textfield', 'core', 'language', '2022-04-09 12:06:57'),
('lock_ttl', '360', 'textfield', 'core', 'system', NULL),
('login.forgot_password_email_subject', 'Password Retrieval Email', 'textfield', 'login', 'authentication', NULL),
('log_deprecated', '0', 'combo-boolean', 'core', 'system', '2022-04-09 12:06:57'),
('log_level', '1', 'textfield', 'core', 'system', NULL),
('log_snippet_not_found', '1', 'combo-boolean', 'core', 'site', NULL),
('log_target', 'FILE', 'textfield', 'core', 'system', NULL),
('mail_charset', 'UTF-8', 'modx-combo-charset', 'core', 'mail', NULL),
('mail_encoding', '8bit', 'textfield', 'core', 'mail', NULL),
('mail_smtp_auth', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_autotls', '1', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_helo', '', 'textfield', 'core', 'mail', NULL),
('mail_smtp_hosts', 'localhost', 'textfield', 'core', 'mail', NULL),
('mail_smtp_keepalive', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_pass', '', 'text-password', 'core', 'mail', NULL),
('mail_smtp_port', '587', 'textfield', 'core', 'mail', NULL),
('mail_smtp_prefix', '', 'textfield', 'core', 'mail', NULL),
('mail_smtp_single_to', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_timeout', '10', 'textfield', 'core', 'mail', NULL),
('mail_smtp_user', '', 'textfield', 'core', 'mail', NULL),
('mail_use_smtp', '', 'combo-boolean', 'core', 'mail', NULL),
('main_nav_parent', 'topnav', 'textfield', 'core', 'manager', NULL),
('manager_date_format', 'Y-m-d', 'textfield', 'core', 'manager', NULL),
('manager_direction', 'ltr', 'textfield', 'core', 'language', NULL),
('manager_favicon_url', '', 'textfield', 'core', 'manager', NULL),
('manager_js_cache_file_locking', '1', 'combo-boolean', 'core', 'manager', NULL),
('manager_js_cache_max_age', '3600', 'textfield', 'core', 'manager', NULL),
('manager_js_document_root', '', 'textfield', 'core', 'manager', NULL),
('manager_js_zlib_output_compression', '0', 'combo-boolean', 'core', 'manager', NULL),
('manager_language', 'ru', 'modx-combo-language', 'core', 'language', '2022-04-09 08:15:22'),
('manager_lang_attribute', 'ru', 'textfield', 'core', 'language', '2022-04-09 08:15:22'),
('manager_login_url_alternate', '', 'textfield', 'core', 'authentication', NULL),
('manager_theme', 'default', 'modx-combo-manager-theme', 'core', 'manager', NULL),
('manager_time_format', 'g:i a', 'textfield', 'core', 'manager', NULL),
('manager_use_fullname', '', 'combo-boolean', 'core', 'manager', NULL),
('manager_week_start', '1', 'textfield', 'core', 'manager', '2022-04-09 12:06:57'),
('mgr_source_icon', 'icon-folder-open-o', 'textfield', 'core', 'manager', NULL),
('mgr_tree_icon_context', 'tree-context', 'textfield', 'core', 'manager', NULL),
('modx_browser_default_sort', 'name', 'textfield', 'core', 'manager', NULL),
('modx_browser_default_viewmode', 'grid', 'textfield', 'core', 'manager', NULL),
('modx_browser_tree_hide_files', '1', 'combo-boolean', 'core', 'manager', NULL),
('modx_browser_tree_hide_tooltips', '1', 'combo-boolean', 'core', 'manager', NULL),
('modx_charset', 'UTF-8', 'modx-combo-charset', 'core', 'language', NULL),
('parser_class', 'pdoParser', 'textfield', 'core', 'site', NULL),
('parser_class_path', '{core_path}components/pdotools/model/pdotools/', 'textfield', 'core', 'site', NULL),
('parser_recurse_uncacheable', '1', 'combo-boolean', 'core', 'system', NULL),
('password_generated_length', '8', 'textfield', 'core', 'authentication', '2022-04-09 12:06:57'),
('password_min_length', '8', 'textfield', 'core', 'authentication', NULL),
('pdoFetch.class', 'pdotools.pdofetch', 'textfield', 'pdotools', 'pdotools_main', NULL),
('pdofetch_class_path', '{core_path}components/pdotools/model/', 'textfield', 'pdotools', 'pdotools_main', NULL),
('pdoTools.class', 'pdotools.pdotools', 'textfield', 'pdotools', 'pdotools_main', NULL),
('pdotools_class_path', '{core_path}components/pdotools/model/', 'textfield', 'pdotools', 'pdotools_main', NULL),
('pdotools_elements_path', '{core_path}elements/', 'textfield', 'pdotools', 'pdotools_main', NULL),
('pdotools_fenom_cache', '', 'combo-boolean', 'pdotools', 'pdotools_main', NULL),
('pdotools_fenom_default', '1', 'combo-boolean', 'pdotools', 'pdotools_main', NULL),
('pdotools_fenom_modx', '', 'combo-boolean', 'pdotools', 'pdotools_main', NULL),
('pdotools_fenom_options', '', 'textarea', 'pdotools', 'pdotools_main', NULL),
('pdotools_fenom_parser', '', 'combo-boolean', 'pdotools', 'pdotools_main', NULL),
('pdotools_fenom_php', '', 'combo-boolean', 'pdotools', 'pdotools_main', NULL),
('pdotools_fenom_save_on_errors', '', 'combo-boolean', 'pdotools', 'pdotools_main', NULL),
('phpthumb_allow_src_above_docroot', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxage', '30', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxfiles', '10000', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxsize', '100', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_source_enabled', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_document_root', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_error_bgcolor', 'CCCCFF', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_error_fontsize', '1', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_error_textcolor', 'FF0000', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_far', 'C', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_imagemagick_path', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_enabled', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_erase_image', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_text_message', 'Off-server thumbnailing is not allowed', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_valid_domains', '{http_host}', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_enabled', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_erase_image', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_require_refer', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_text_message', 'Off-server linking is not allowed', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_valid_domains', '{http_host}', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_watermark_src', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_zoomcrop', '0', 'textfield', 'core', 'phpthumb', NULL),
('preserve_menuindex', '1', 'combo-boolean', 'core', 'manager', NULL),
('principal_targets', 'modAccessContext,modAccessResourceGroup,modAccessCategory,sources.modAccessMediaSource,modAccessNamespace', 'textfield', 'core', 'authentication', NULL),
('proxy_auth_type', 'BASIC', 'textfield', 'core', 'proxy', NULL),
('proxy_host', '', 'textfield', 'core', 'proxy', NULL),
('proxy_password', '', 'text-password', 'core', 'proxy', NULL),
('proxy_port', '', 'textfield', 'core', 'proxy', NULL),
('proxy_username', '', 'textfield', 'core', 'proxy', NULL),
('publish_default', '', 'combo-boolean', 'core', 'site', NULL),
('rb_base_dir', '', 'textfield', 'core', 'file', NULL),
('rb_base_url', '', 'textfield', 'core', 'file', NULL),
('recaptcha.private_key', '', 'textfield', 'login', 'recaptcha', NULL),
('recaptcha.public_key', '', 'textfield', 'login', 'recaptcha', NULL),
('recaptcha.use_ssl', 'false', 'combo-boolean', 'login', 'recaptcha', NULL),
('request_controller', 'index.php', 'textfield', 'core', 'gateway', NULL),
('request_method_strict', '0', 'combo-boolean', 'core', 'gateway', NULL),
('request_param_alias', 'q', 'textfield', 'core', 'gateway', NULL),
('request_param_id', 'id', 'textfield', 'core', 'gateway', NULL),
('resolve_hostnames', '0', 'combo-boolean', 'core', 'system', NULL),
('resource_static_allow_absolute', '0', 'combo-boolean', 'core', 'static_resources', NULL),
('resource_static_path', '{assets_path}', 'textfield', 'core', 'static_resources', NULL),
('resource_tree_node_name', 'pagetitle', 'textfield', 'core', 'manager', NULL),
('resource_tree_node_name_fallback', 'pagetitle', 'textfield', 'core', 'manager', NULL),
('resource_tree_node_tooltip', 'alias', 'textfield', 'core', 'manager', '2022-04-09 12:06:57'),
('richtext_default', '0', 'combo-boolean', 'core', 'manager', '2022-04-09 12:06:57'),
('search_default', '0', 'combo-boolean', 'core', 'site', '2022-04-09 12:06:57'),
('send_poweredby_header', '0', 'combo-boolean', 'core', 'system', NULL),
('server_offset_time', '0', 'textfield', 'core', 'system', NULL),
('server_protocol', 'http', 'textfield', 'core', 'system', NULL),
('session_cookie_domain', '', 'textfield', 'core', 'session', NULL),
('session_cookie_httponly', '1', 'combo-boolean', 'core', 'session', NULL),
('session_cookie_lifetime', '3024000', 'textfield', 'core', 'session', '2022-04-09 12:06:57'),
('session_cookie_path', '', 'textfield', 'core', 'session', NULL),
('session_cookie_samesite', '', 'textfield', 'core', 'session', NULL),
('session_cookie_secure', '', 'combo-boolean', 'core', 'session', NULL),
('session_gc_maxlifetime', '3024000', 'textfield', 'core', 'session', '2022-04-09 12:06:57'),
('session_handler_class', 'modSessionHandler', 'textfield', 'core', 'session', NULL),
('session_name', '', 'textfield', 'core', 'session', NULL),
('settings_distro', 'traditional', 'textfield', 'core', 'system', NULL),
('settings_version', '2.8.3-pl', 'textfield', 'core', 'system', NULL),
('set_header', '1', 'combo-boolean', 'core', 'system', NULL),
('show_tv_categories_header', '1', 'combo-boolean', 'core', 'manager', NULL),
('signupemail_message', '<p>Hello [[+uid]],</p>\n    <p>Here are your login details for the [[+sname]] MODX Manager:</p>\n\n    <p>\n        <strong>Username:</strong> [[+uid]]<br />\n        <strong>Password:</strong> [[+pwd]]<br />\n    </p>\n\n    <p>Once you log into the MODX Manager at [[+surl]], you can change your password.</p>\n\n    <p>Regards,<br />Site Administrator</p>', 'textarea', 'core', 'authentication', NULL),
('site_name', 'РосМедНадзор', 'textfield', 'core', 'site', '2022-04-09 16:44:08'),
('site_start', '1', 'textfield', 'core', 'site', NULL),
('site_status', '1', 'combo-boolean', 'core', 'site', NULL),
('site_unavailable_message', 'The site is currently unavailable', 'textfield', 'core', 'site', NULL),
('site_unavailable_page', '0', 'textfield', 'core', 'site', NULL),
('static_elements_automate_chunks', '0', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_plugins', '0', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_snippets', '0', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_templates', '0', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_tvs', '0', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_basepath', '', 'textfield', 'core', 'static_elements', NULL),
('static_elements_default_category', '0', 'modx-combo-category', 'core', 'static_elements', NULL),
('static_elements_default_mediasource', '0', 'modx-combo-source', 'core', 'static_elements', NULL),
('strip_image_paths', '1', 'combo-boolean', 'core', 'file', NULL),
('symlink_merge_fields', '1', 'combo-boolean', 'core', 'site', NULL),
('syncsite_default', '1', 'combo-boolean', 'core', 'caching', NULL),
('topmenu_show_descriptions', '1', 'combo-boolean', 'core', 'manager', NULL),
('tree_default_sort', 'menuindex', 'textfield', 'core', 'manager', NULL),
('tree_root_id', '0', 'numberfield', 'core', 'manager', NULL),
('tvs_below_content', '0', 'combo-boolean', 'core', 'manager', NULL),
('udperms_allowroot', '', 'combo-boolean', 'core', 'authentication', NULL),
('unauthorized_page', '1', 'textfield', 'core', 'site', NULL),
('upload_check_exists', '1', 'combo-boolean', 'core', 'file', NULL),
('upload_files', 'txt,html,htm,xml,js,js.map,css,scss,less,css.map,zip,gz,rar,z,tgz,tar,mp3,mp4,aac,wav,au,wmv,avi,mpg,mpeg,pdf,doc,docx,xls,xlsx,ppt,pptx,jpg,jpeg,png,tiff,svg,svgz,gif,psd,ico,bmp,webp,odt,ods,odp,odb,odg,odf,md,ttf,woff,woff2,eot,php', 'textfield', 'core', 'file', '2022-04-09 08:23:45'),
('upload_flash', 'swf,fla', 'textfield', 'core', 'file', NULL),
('upload_images', 'jpg,jpeg,png,gif,psd,ico,bmp,tiff,svg,svgz,webp', 'textfield', 'core', 'file', NULL),
('upload_maxsize', '67108864', 'textfield', 'core', 'file', '2022-04-09 08:15:22'),
('upload_media', 'mp3,wav,au,wmv,avi,mpg,mpeg', 'textfield', 'core', 'file', NULL),
('user_nav_parent', 'usernav', 'textfield', 'core', 'manager', NULL),
('use_alias_path', '1', 'combo-boolean', 'core', 'furls', '2022-04-09 12:01:55'),
('use_browser', '1', 'combo-boolean', 'core', 'file', NULL),
('use_context_resource_table', '1', 'combo-boolean', 'core', 'caching', NULL),
('use_editor', '0', 'combo-boolean', 'core', 'editor', '2022-04-09 12:06:57'),
('use_frozen_parent_uris', '0', 'combo-boolean', 'core', 'furls', NULL),
('use_multibyte', '1', 'combo-boolean', 'core', 'language', '2022-04-09 08:15:22'),
('use_weblink_target', '1', 'combo-boolean', 'core', 'site', '2022-04-09 12:06:57'),
('webpwdreminder_message', '<p>Hello [[+uid]],</p>\n\n    <p>To activate your new password click the following link:</p>\n\n    <p>[[+surl]]</p>\n\n    <p>If successful you can use the following password to login:</p>\n\n    <p><strong>Password:</strong> [[+pwd]]</p>\n\n    <p>If you did not request this email then please ignore it.</p>\n\n    <p>Regards,<br />\n    Site Administrator</p>', 'textarea', 'core', 'authentication', NULL),
('websignupemail_message', '<p>Hello [[+uid]],</p>\n\n    <p>Here are your login details for [[+sname]]:</p>\n\n    <p><strong>Username:</strong> [[+uid]]<br />\n    <strong>Password:</strong> [[+pwd]]</p>\n\n    <p>Once you log into [[+sname]] at [[+surl]], you can change your password.</p>\n\n    <p>Regards,<br />\n    Site Administrator</p>', 'textarea', 'core', 'authentication', NULL),
('welcome_action', 'welcome', 'textfield', 'core', 'manager', NULL),
('welcome_namespace', 'core', 'textfield', 'core', 'manager', NULL),
('welcome_screen', '', 'combo-boolean', 'core', 'manager', '2022-04-09 08:19:10'),
('welcome_screen_url', '//misc.modx.com/revolution/welcome.28.html', 'textfield', 'core', 'manager', NULL),
('which_editor', 'Ace', 'modx-combo-rte', 'core', 'editor', '2022-04-09 08:43:09'),
('which_element_editor', 'Ace', 'modx-combo-rte', 'core', 'editor', '2022-04-09 08:32:17'),
('xhtml_urls', '1', 'combo-boolean', 'core', 'site', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_transport_packages`
--

CREATE TABLE `mx_transport_packages` (
  `signature` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `installed` datetime DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `workspace` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `provider` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `source` tinytext,
  `manifest` text,
  `attributes` mediumtext,
  `package_name` varchar(191) NOT NULL,
  `metadata` text,
  `version_major` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `version_minor` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `version_patch` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `release` varchar(100) NOT NULL DEFAULT '',
  `release_index` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_transport_packages`
--

INSERT INTO `mx_transport_packages` (`signature`, `created`, `updated`, `installed`, `state`, `workspace`, `provider`, `disabled`, `source`, `manifest`, `attributes`, `package_name`, `metadata`, `version_major`, `version_minor`, `version_patch`, `release`, `release_index`) VALUES
('ace-1.9.2-pl', '2022-04-09 11:27:39', '2022-04-09 08:32:17', '2022-04-09 11:32:17', 0, 1, 1, 0, 'ace-1.9.2-pl.transport.zip', NULL, 'a:8:{s:7:\"license\";s:15218:\"GNU GENERAL PUBLIC LICENSE\n   Version 2, June 1991\n--------------------------\n\nCopyright (C) 1989, 1991 Free Software Foundation, Inc.\n59 Temple Place, Suite 330, Boston, MA  02111-1307  USA\n\nEveryone is permitted to copy and distribute verbatim copies\nof this license document, but changing it is not allowed.\n\nPreamble\n--------\n\n  The licenses for most software are designed to take away your\nfreedom to share and change it.  By contrast, the GNU General Public\nLicense is intended to guarantee your freedom to share and change free\nsoftware--to make sure the software is free for all its users.  This\nGeneral Public License applies to most of the Free Software\nFoundation\'s software and to any other program whose authors commit to\nusing it.  (Some other Free Software Foundation software is covered by\nthe GNU Library General Public License instead.)  You can apply it to\nyour programs, too.\n\n  When we speak of free software, we are referring to freedom, not\nprice.  Our General Public Licenses are designed to make sure that you\nhave the freedom to distribute copies of free software (and charge for\nthis service if you wish), that you receive source code or can get it\nif you want it, that you can change the software or use pieces of it\nin new free programs; and that you know you can do these things.\n\n  To protect your rights, we need to make restrictions that forbid\nanyone to deny you these rights or to ask you to surrender the rights.\nThese restrictions translate to certain responsibilities for you if you\ndistribute copies of the software, or if you modify it.\n\n  For example, if you distribute copies of such a program, whether\ngratis or for a fee, you must give the recipients all the rights that\nyou have.  You must make sure that they, too, receive or can get the\nsource code.  And you must show them these terms so they know their\nrights.\n\n  We protect your rights with two steps: (1) copyright the software, and\n(2) offer you this license which gives you legal permission to copy,\ndistribute and/or modify the software.\n\n  Also, for each author\'s protection and ours, we want to make certain\nthat everyone understands that there is no warranty for this free\nsoftware.  If the software is modified by someone else and passed on, we\nwant its recipients to know that what they have is not the original, so\nthat any problems introduced by others will not reflect on the original\nauthors\' reputations.\n\n  Finally, any free program is threatened constantly by software\npatents.  We wish to avoid the danger that redistributors of a free\nprogram will individually obtain patent licenses, in effect making the\nprogram proprietary.  To prevent this, we have made it clear that any\npatent must be licensed for everyone\'s free use or not licensed at all.\n\n  The precise terms and conditions for copying, distribution and\nmodification follow.\n\n\nGNU GENERAL PUBLIC LICENSE\nTERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION\n---------------------------------------------------------------\n\n  0. This License applies to any program or other work which contains\na notice placed by the copyright holder saying it may be distributed\nunder the terms of this General Public License.  The \"Program\", below,\nrefers to any such program or work, and a \"work based on the Program\"\nmeans either the Program or any derivative work under copyright law:\nthat is to say, a work containing the Program or a portion of it,\neither verbatim or with modifications and/or translated into another\nlanguage.  (Hereinafter, translation is included without limitation in\nthe term \"modification\".)  Each licensee is addressed as \"you\".\n\nActivities other than copying, distribution and modification are not\ncovered by this License; they are outside its scope.  The act of\nrunning the Program is not restricted, and the output from the Program\nis covered only if its contents constitute a work based on the\nProgram (independent of having been made by running the Program).\nWhether that is true depends on what the Program does.\n\n  1. You may copy and distribute verbatim copies of the Program\'s\nsource code as you receive it, in any medium, provided that you\nconspicuously and appropriately publish on each copy an appropriate\ncopyright notice and disclaimer of warranty; keep intact all the\nnotices that refer to this License and to the absence of any warranty;\nand give any other recipients of the Program a copy of this License\nalong with the Program.\n\nYou may charge a fee for the physical act of transferring a copy, and\nyou may at your option offer warranty protection in exchange for a fee.\n\n  2. You may modify your copy or copies of the Program or any portion\nof it, thus forming a work based on the Program, and copy and\ndistribute such modifications or work under the terms of Section 1\nabove, provided that you also meet all of these conditions:\n\n    a) You must cause the modified files to carry prominent notices\n    stating that you changed the files and the date of any change.\n\n    b) You must cause any work that you distribute or publish, that in\n    whole or in part contains or is derived from the Program or any\n    part thereof, to be licensed as a whole at no charge to all third\n    parties under the terms of this License.\n\n    c) If the modified program normally reads commands interactively\n    when run, you must cause it, when started running for such\n    interactive use in the most ordinary way, to print or display an\n    announcement including an appropriate copyright notice and a\n    notice that there is no warranty (or else, saying that you provide\n    a warranty) and that users may redistribute the program under\n    these conditions, and telling the user how to view a copy of this\n    License.  (Exception: if the Program itself is interactive but\n    does not normally print such an announcement, your work based on\n    the Program is not required to print an announcement.)\n\nThese requirements apply to the modified work as a whole.  If\nidentifiable sections of that work are not derived from the Program,\nand can be reasonably considered independent and separate works in\nthemselves, then this License, and its terms, do not apply to those\nsections when you distribute them as separate works.  But when you\ndistribute the same sections as part of a whole which is a work based\non the Program, the distribution of the whole must be on the terms of\nthis License, whose permissions for other licensees extend to the\nentire whole, and thus to each and every part regardless of who wrote it.\n\nThus, it is not the intent of this section to claim rights or contest\nyour rights to work written entirely by you; rather, the intent is to\nexercise the right to control the distribution of derivative or\ncollective works based on the Program.\n\nIn addition, mere aggregation of another work not based on the Program\nwith the Program (or with a work based on the Program) on a volume of\na storage or distribution medium does not bring the other work under\nthe scope of this License.\n\n  3. You may copy and distribute the Program (or a work based on it,\nunder Section 2) in object code or executable form under the terms of\nSections 1 and 2 above provided that you also do one of the following:\n\n    a) Accompany it with the complete corresponding machine-readable\n    source code, which must be distributed under the terms of Sections\n    1 and 2 above on a medium customarily used for software interchange; or,\n\n    b) Accompany it with a written offer, valid for at least three\n    years, to give any third party, for a charge no more than your\n    cost of physically performing source distribution, a complete\n    machine-readable copy of the corresponding source code, to be\n    distributed under the terms of Sections 1 and 2 above on a medium\n    customarily used for software interchange; or,\n\n    c) Accompany it with the information you received as to the offer\n    to distribute corresponding source code.  (This alternative is\n    allowed only for noncommercial distribution and only if you\n    received the program in object code or executable form with such\n    an offer, in accord with Subsection b above.)\n\nThe source code for a work means the preferred form of the work for\nmaking modifications to it.  For an executable work, complete source\ncode means all the source code for all modules it contains, plus any\nassociated interface definition files, plus the scripts used to\ncontrol compilation and installation of the executable.  However, as a\nspecial exception, the source code distributed need not include\nanything that is normally distributed (in either source or binary\nform) with the major components (compiler, kernel, and so on) of the\noperating system on which the executable runs, unless that component\nitself accompanies the executable.\n\nIf distribution of executable or object code is made by offering\naccess to copy from a designated place, then offering equivalent\naccess to copy the source code from the same place counts as\ndistribution of the source code, even though third parties are not\ncompelled to copy the source along with the object code.\n\n  4. You may not copy, modify, sublicense, or distribute the Program\nexcept as expressly provided under this License.  Any attempt\notherwise to copy, modify, sublicense or distribute the Program is\nvoid, and will automatically terminate your rights under this License.\nHowever, parties who have received copies, or rights, from you under\nthis License will not have their licenses terminated so long as such\nparties remain in full compliance.\n\n  5. You are not required to accept this License, since you have not\nsigned it.  However, nothing else grants you permission to modify or\ndistribute the Program or its derivative works.  These actions are\nprohibited by law if you do not accept this License.  Therefore, by\nmodifying or distributing the Program (or any work based on the\nProgram), you indicate your acceptance of this License to do so, and\nall its terms and conditions for copying, distributing or modifying\nthe Program or works based on it.\n\n  6. Each time you redistribute the Program (or any work based on the\nProgram), the recipient automatically receives a license from the\noriginal licensor to copy, distribute or modify the Program subject to\nthese terms and conditions.  You may not impose any further\nrestrictions on the recipients\' exercise of the rights granted herein.\nYou are not responsible for enforcing compliance by third parties to\nthis License.\n\n  7. If, as a consequence of a court judgment or allegation of patent\ninfringement or for any other reason (not limited to patent issues),\nconditions are imposed on you (whether by court order, agreement or\notherwise) that contradict the conditions of this License, they do not\nexcuse you from the conditions of this License.  If you cannot\ndistribute so as to satisfy simultaneously your obligations under this\nLicense and any other pertinent obligations, then as a consequence you\nmay not distribute the Program at all.  For example, if a patent\nlicense would not permit royalty-free redistribution of the Program by\nall those who receive copies directly or indirectly through you, then\nthe only way you could satisfy both it and this License would be to\nrefrain entirely from distribution of the Program.\n\nIf any portion of this section is held invalid or unenforceable under\nany particular circumstance, the balance of the section is intended to\napply and the section as a whole is intended to apply in other\ncircumstances.\n\nIt is not the purpose of this section to induce you to infringe any\npatents or other property right claims or to contest validity of any\nsuch claims; this section has the sole purpose of protecting the\nintegrity of the free software distribution system, which is\nimplemented by public license practices.  Many people have made\ngenerous contributions to the wide range of software distributed\nthrough that system in reliance on consistent application of that\nsystem; it is up to the author/donor to decide if he or she is willing\nto distribute software through any other system and a licensee cannot\nimpose that choice.\n\nThis section is intended to make thoroughly clear what is believed to\nbe a consequence of the rest of this License.\n\n  8. If the distribution and/or use of the Program is restricted in\ncertain countries either by patents or by copyrighted interfaces, the\noriginal copyright holder who places the Program under this License\nmay add an explicit geographical distribution limitation excluding\nthose countries, so that distribution is permitted only in or among\ncountries not thus excluded.  In such case, this License incorporates\nthe limitation as if written in the body of this License.\n\n  9. The Free Software Foundation may publish revised and/or new versions\nof the General Public License from time to time.  Such new versions will\nbe similar in spirit to the present version, but may differ in detail to\naddress new problems or concerns.\n\nEach version is given a distinguishing version number.  If the Program\nspecifies a version number of this License which applies to it and \"any\nlater version\", you have the option of following the terms and conditions\neither of that version or of any later version published by the Free\nSoftware Foundation.  If the Program does not specify a version number of\nthis License, you may choose any version ever published by the Free Software\nFoundation.\n\n  10. If you wish to incorporate parts of the Program into other free\nprograms whose distribution conditions are different, write to the author\nto ask for permission.  For software which is copyrighted by the Free\nSoftware Foundation, write to the Free Software Foundation; we sometimes\nmake exceptions for this.  Our decision will be guided by the two goals\nof preserving the free status of all derivatives of our free software and\nof promoting the sharing and reuse of software generally.\n\nNO WARRANTY\n-----------\n\n  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY\nFOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN\nOTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES\nPROVIDE THE PROGRAM \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED\nOR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF\nMERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS\nTO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE\nPROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,\nREPAIR OR CORRECTION.\n\n  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING\nWILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR\nREDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,\nINCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING\nOUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED\nTO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY\nYOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER\nPROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE\nPOSSIBILITY OF SUCH DAMAGES.\n\n---------------------------\nEND OF TERMS AND CONDITIONS\";s:6:\"readme\";s:271:\"--------------------\nExtra: Ace\n--------------------\nSince: March 29th, 2012\nAuthor: Danil Kostin <danya.postfactum@gmail.com>\nLicense: GNU GPLv2 (or later at your option)\n\nIntegrates Ace Code Editor into MODx Revolution.\n\nPress Ctrl+Alt+H to see all available shortcuts.\";s:9:\"changelog\";s:4425:\"Changelog for Ace integration into MODx Revolution.\n\nAce 1.9.2\n====================================\n- Updated: Corrected search form [#8]\n- Added: TV input Ace field [#9]\n\nAce 1.9.1\n====================================\n- Fixed: Changed fonts\n- Updated: emmet.js with the support flex css styles and many other combinations\n\nAce 1.9.0\n====================================\n- Added: autodetecting file mode by modelist.js [#7]\n- Added: new modes from ace-builds for version 1.2.0\n\nAce 1.8.0\n====================================\n- Added: autocompletion for php functions.\n\nAce 1.7.0\n====================================\n- Added: new system setting \"ace.grow\".\n- Added: new system setting \"ace.html_elements_mime\".\n\nAce 1.6.5\n====================================\n- Added: \"Twig\" syntax for support of Twig in chunks.\n- Changed: Plugin is not static anymore.\n\nAce 1.6.4\n====================================\n- Fixed: Support of emmet in smarty mode. Again.\n\nAce 1.6.3\n====================================\n- Fixed: Support of emmet in smarty mode.\n\nAce 1.6.2\n====================================\n- Fixed: Editor mode handling.\n- Added: \"Markdown\" syntax for mime type \"text/x-markdown\".\n\nAce 1.6.1\n====================================\n- Fixed : Work with enabled system setting \"compress_js\".\n\nAce 1.6.0\n====================================\n- Added: \"Smarty\" syntax for support of Fenom in chunks.\n- Updated: Ace to version 1.2.0.\n\nAce 1.5.1\n====================================\n- Fixed: Bug with narrowing of the textarea.\n\nAce 1.5.0\n====================================\n- Changed: Assets are moved back to /assets/\n- Fixed: MODx tag completions (was completely broken)\n- Added: Editor height setting\n\nAce 1.4.3\n====================================\n- Added: MODx tag completions (Ctrl+Space)\n- Fixed: Issue caused AjaxManager (MODx Manager speed booster plugin) tree drag\'n\'drop bug\n\nAce 1.4.2\n====================================\n- Added: Undo coalescing\n- Changed: Mac fullscreen command is bound to Command+F12\n- Added: Drag delay (allow to start new selection inside current one) for Mac\n- Fixed: Use file extension of static chunks to detect code syntax\n\n\nAce 1.4.1\n====================================\n- Fixed: Tab handling\n- Fixed: Emmet shortcut listing by Ctr+Alt+H\n- Added: Expandable snippets support (see ace.snippets setting)\n- Added: Emmet wrap_with_abbreviation command (Alt+W)\n\nAce 1.4.0\n====================================\n- Added: Emmet (aka Zen Coding) support\n- Added: Terminal dark theme\n- Added: Hotkey table (Ctrl+Alt+H)\n- Fixed: Resource overview fatal error\n- Changed: Assets are moved to /manager/assets/components/\n\nAce 1.3.3\n====================================\n- Added: PHP live syntax check\n- Added: Chaos dark theme\n- Added: Setting show_invisibles\n\n\nAce 1.3.2\n====================================\n- Fixed: The bug while installing the Ace\n- Fixed: Broken word_wrap setting\n- Added: Tab settings (tab size, soft tab)\n- Added: Now completele compatible with AjaxManager extra\n\n\nAce 1.3.1\n====================================\n- Changed: Plugin content now is stored in static file\n\n\nAce 1.3.0\n====================================\n- Added: German translation\n- Added: MODx tags highlighting\n- Added: Ambiance and xcode themes\n- Added: less/scss syntax highlighting\n- Added: Fullwindow mode (Ctrl + F11)\n- Changed: Editor now ignores `wich_editor` setting. Set `use_editor` to false to use ACE for Resources.\n\n\nAce 1.2.1\n====================================\n- Changed: Assets are moved to manager folder\n- Added: Font size setting\n- Added: \"GitHub\" theme\n- Added: Support of html5 drag\'n\'drop (accepting of dropped text)\n- Added: XML / HTML tag autoclosing\n- Fixed: broken en lexicon and php 5.3 incompatibility\n\n\nAce 1.2.0\n====================================\n- Removed: Some unnecessary options\n- Changed: Editor options are moved to system settings\n- Fixed: Multiple little editor bugs\n- Added: Add missing \"OnFileEditFormPrerender\" event to MODx\n- Added: Multiline editing\n- Added: Advanced find/replace window\n\n\nAce 1.1.0\n====================================\n- Fixed: Fatal error on document create event\n- Fixed: Changing of properties has no effect\n- Added: File edition support\n- Added: MODx tree elements drag\'n\'drop support\n- Added: Auto-assigning which_element_editor to Ace\n\n\nAce 1.0.0\n====================================\n- Added: Plugin properties to adjust how Ace behaves\n- Initial commit\";s:9:\"signature\";s:12:\"ace-1.9.2-pl\";s:6:\"action\";s:26:\"workspace/packages/install\";s:8:\"register\";s:3:\"mgr\";s:5:\"topic\";s:40:\"/workspace/package/install/ace-1.9.2-pl/\";s:14:\"package_action\";i:0;}', 'Ace', 'a:38:{s:2:\"id\";s:24:\"6126780ff4174a4a666f9472\";s:7:\"package\";s:24:\"4f6e2782f245544fe8000014\";s:12:\"display_name\";s:12:\"ace-1.9.2-pl\";s:4:\"name\";s:3:\"Ace\";s:7:\"version\";s:5:\"1.9.2\";s:13:\"version_major\";s:1:\"1\";s:13:\"version_minor\";s:1:\"9\";s:13:\"version_patch\";s:1:\"2\";s:7:\"release\";s:2:\"pl\";s:8:\"vrelease\";s:2:\"pl\";s:14:\"vrelease_index\";s:0:\"\";s:6:\"author\";s:10:\"ibochkarev\";s:11:\"description\";s:376:\"<p>New feature: modx tag code autocompletion! Press Ctrl+Space to get code suggestions with descriptions.</p><p>Works for snippets, chunks, system settings, tvs and resource fields, filters and properties.</p><p>Property sets, lexicon entries are not supported. Unfortunately, I have no idea how to retrieve chunk-specific placeholders, so there is no placeholder support.</p>\";s:12:\"instructions\";s:341:\"<p></p><p>Install via Package Management.</p><p>Set editor theme you wish in system settings (change namespace to \"ace\").</p><p>If you want to use this editor for resources, just set system option <i>use_editor</i> to <b>false</b> (global usage), or <i>richtext</i> setting of certain resource to <b>false</b> (specific usage).</p><p></p>\";s:9:\"changelog\";s:4372:\"Ace 1.9.2\n====================================\n- Updated: Corrected search form [#8]\n- Added: TV input Ace field [#9]\n\nAce 1.9.1\n====================================\n- Fixed: Changed fonts\n- Updated: emmet.js with the support flex css styles and many other combinations\n\nAce 1.9.0\n====================================\n- Added: autodetecting file mode by modelist.js [#7]\n- Added: new modes from ace-builds for version 1.2.0\n\nAce 1.8.0\n====================================\n- Added: autocompletion for php functions.\n\nAce 1.7.0\n====================================\n- Added: new system setting \"ace.grow\".\n- Added: new system setting \"ace.html_elements_mime\".\n\nAce 1.6.5\n====================================\n- Added: \"Twig\" syntax for support of Twig in chunks.\n- Changed: Plugin is not static anymore.\n\nAce 1.6.4\n====================================\n- Fixed: Support of emmet in smarty mode. Again.\n\nAce 1.6.3\n====================================\n- Fixed: Support of emmet in smarty mode.\n\nAce 1.6.2\n====================================\n- Fixed: Editor mode handling.\n- Added: \"Markdown\" syntax for mime type \"text/x-markdown\".\n\nAce 1.6.1\n====================================\n- Fixed : Work with enabled system setting \"compress_js\".\n\nAce 1.6.0\n====================================\n- Added: \"Smarty\" syntax for support of Fenom in chunks.\n- Updated: Ace to version 1.2.0.\n\nAce 1.5.1\n====================================\n- Fixed: Bug with narrowing of the textarea.\n\nAce 1.5.0\n====================================\n- Changed: Assets are moved back to /assets/\n- Fixed: MODx tag completions (was completely broken)\n- Added: Editor height setting\n\nAce 1.4.3\n====================================\n- Added: MODx tag completions (Ctrl+Space)\n- Fixed: Issue caused AjaxManager (MODx Manager speed booster plugin) tree drag\'n\'drop bug\n\nAce 1.4.2\n====================================\n- Added: Undo coalescing\n- Changed: Mac fullscreen command is bound to Command+F12\n- Added: Drag delay (allow to start new selection inside current one) for Mac\n- Fixed: Use file extension of static chunks to detect code syntax\n\n\nAce 1.4.1\n====================================\n- Fixed: Tab handling\n- Fixed: Emmet shortcut listing by Ctr+Alt+H\n- Added: Expandable snippets support (see ace.snippets setting)\n- Added: Emmet wrap_with_abbreviation command (Alt+W)\n\nAce 1.4.0\n====================================\n- Added: Emmet (aka Zen Coding) support\n- Added: Terminal dark theme\n- Added: Hotkey table (Ctrl+Alt+H)\n- Fixed: Resource overview fatal error\n- Changed: Assets are moved to /manager/assets/components/\n\nAce 1.3.3\n====================================\n- Added: PHP live syntax check\n- Added: Chaos dark theme\n- Added: Setting show_invisibles\n\n\nAce 1.3.2\n====================================\n- Fixed: The bug while installing the Ace\n- Fixed: Broken word_wrap setting\n- Added: Tab settings (tab size, soft tab)\n- Added: Now completele compatible with AjaxManager extra\n\n\nAce 1.3.1\n====================================\n- Changed: Plugin content now is stored in static file\n\n\nAce 1.3.0\n====================================\n- Added: German translation\n- Added: MODx tags highlighting\n- Added: Ambiance and xcode themes\n- Added: less/scss syntax highlighting\n- Added: Fullwindow mode (Ctrl + F11)\n- Changed: Editor now ignores `wich_editor` setting. Set `use_editor` to false to use ACE for Resources.\n\n\nAce 1.2.1\n====================================\n- Changed: Assets are moved to manager folder\n- Added: Font size setting\n- Added: \"GitHub\" theme\n- Added: Support of html5 drag\'n\'drop (accepting of dropped text)\n- Added: XML / HTML tag autoclosing\n- Fixed: broken en lexicon and php 5.3 incompatibility\n\n\nAce 1.2.0\n====================================\n- Removed: Some unnecessary options\n- Changed: Editor options are moved to system settings\n- Fixed: Multiple little editor bugs\n- Added: Add missing \"OnFileEditFormPrerender\" event to MODx\n- Added: Multiline editing\n- Added: Advanced find/replace window\n\n\nAce 1.1.0\n====================================\n- Fixed: Fatal error on document create event\n- Fixed: Changing of properties has no effect\n- Added: File edition support\n- Added: MODx tree elements drag\'n\'drop support\n- Added: Auto-assigning which_element_editor to Ace\n\n\nAce 1.0.0\n====================================\n- Added: Plugin properties to adjust how Ace behaves\n- Initial commit\";s:9:\"createdon\";s:24:\"2021-08-25T17:04:15+0000\";s:9:\"createdby\";s:10:\"ibochkarev\";s:8:\"editedon\";s:24:\"2022-04-09T08:15:19+0000\";s:10:\"releasedon\";s:24:\"2021-08-25T17:04:15+0000\";s:9:\"downloads\";s:6:\"330301\";s:8:\"approved\";s:4:\"true\";s:7:\"audited\";s:5:\"false\";s:8:\"featured\";s:5:\"false\";s:10:\"deprecated\";s:5:\"false\";s:7:\"license\";s:5:\"GPLv2\";s:7:\"smf_url\";s:0:\"\";s:10:\"repository\";s:24:\"4d4c3fa6b2b0830da9000001\";s:8:\"supports\";s:1:\"2\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=6126780ff4174a4a666f9473\";s:9:\"signature\";s:12:\"ace-1.9.2-pl\";s:11:\"supports_db\";s:5:\"mysql\";s:16:\"minimum_supports\";s:1:\"2\";s:9:\"breaks_at\";s:8:\"10000000\";s:10:\"screenshot\";s:68:\"http://modx.s3.amazonaws.com/extras/4f6e2782f245544fe8000014/ace.png\";s:4:\"file\";a:7:{s:2:\"id\";s:24:\"6126780ff4174a4a666f9473\";s:7:\"version\";s:24:\"6126780ff4174a4a666f9472\";s:8:\"filename\";s:26:\"ace-1.9.2-pl.transport.zip\";s:9:\"downloads\";s:5:\"17304\";s:6:\"lastip\";s:15:\"185.105.109.250\";s:9:\"transport\";s:4:\"true\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=6126780ff4174a4a666f9473\";}s:17:\"package-signature\";s:12:\"ace-1.9.2-pl\";s:10:\"categories\";s:15:\"richtexteditors\";s:4:\"tags\";s:0:\"\";}', 1, 9, 2, 'pl', 0),
('console-2.2.2-pl', '2022-04-09 15:02:58', '2022-04-09 12:06:43', '2022-04-09 15:06:43', 0, 1, 1, 0, 'console-2.2.2-pl.transport.zip', NULL, 'a:8:{s:7:\"license\";s:0:\"\";s:6:\"readme\";s:134:\"Console\r\n=====================================================\r\n\r\nConsole allow to execute php-code at back-end by simple interface.\r\n\";s:9:\"changelog\";s:1312:\"Console-2.2.2-pl\r\n=============================================================\r\n- Fix lexicon\r\n- Fix menu\r\n\r\nConsole-2.2.1-beta\r\n=============================================================\r\n- Added return result\r\n\r\nConsole-2.2.0-beta\r\n=============================================================\r\n- Added execution report\r\n\r\nConsole-2.1.0-beta\r\n=============================================================\r\n- Added a feature to save the console code to file and load from file.\r\n- Added a feature to save the console code to snippet and load from snippet.\r\n\r\nConsole-2.0.3-beta\r\n=============================================================\r\n- Added recursive queries;\r\n\r\nConsole-2.0.2-beta\r\n=============================================================\r\n- Renew appearance;\r\n- Two variants of result (formated and raw)\r\n\r\nConsole-2.0.1-beta\r\n=============================================================\r\n- Saving code in $_SESSION;\r\n\r\nConsole-2.0.0-rc\r\n=============================================================\r\n- Ace integration fix;\r\n\r\nConsole-1.2.0-rc\r\n=============================================================\r\n- Set default LogTarget(\'HTML\');\r\n- Set default LogLevel(xPDO::LOG_LEVEL_DEBUG);\r\n\r\nConsole-1.1.0-rc\r\n=============================================================\r\n\r\n- First release\";s:9:\"signature\";s:16:\"console-2.2.2-pl\";s:6:\"action\";s:26:\"workspace/packages/install\";s:8:\"register\";s:3:\"mgr\";s:5:\"topic\";s:44:\"/workspace/package/install/console-2.2.2-pl/\";s:14:\"package_action\";i:0;}', 'Console', 'a:38:{s:2:\"id\";s:24:\"588491c3bc8dd393108b4567\";s:7:\"package\";s:24:\"50f2c1d3f2455468e4000049\";s:12:\"display_name\";s:16:\"console-2.2.2-pl\";s:4:\"name\";s:7:\"Console\";s:7:\"version\";s:5:\"2.2.2\";s:13:\"version_major\";s:1:\"2\";s:13:\"version_minor\";s:1:\"2\";s:13:\"version_patch\";s:1:\"2\";s:7:\"release\";s:2:\"pl\";s:8:\"vrelease\";s:2:\"pl\";s:14:\"vrelease_index\";s:0:\"\";s:6:\"author\";s:7:\"fi1osof\";s:11:\"description\";s:300:\"Console allow to execute php-code at back-end by simple interface.<p>GitHub project: <a href=\"https://github.com/Fi1osof/modx-console\">https://github.com/Fi1osof/modx-console</a></p><p>Feel free ask any question on <a href=\"https://modxclub.ru/\" title=\"\" target=\"\">https://modxclub.ru/</a></p><p></p>\";s:12:\"instructions\";s:22:\"<p>Initial content</p>\";s:9:\"changelog\";s:1534:\"<p>Console-2.2.2-pl</p><p>=============================================================</p><p>- Fix lexicon</p><p>- Fix menu</p><p></p><p>Console-2.2.1-beta</p><p>=============================================================</p><p>- Added return result</p><p></p><p>Console-2.2.0-beta</p><p>=============================================================</p><p>- Added execution report</p><p></p><p>Console-2.1.0-beta</p><p>=============================================================</p><p>- Added a feature to save the console code to file and load from file.</p><p>- Added a feature to save the console code to snippet and load from snippet.</p><p></p><p>Console-2.0.3-beta</p><p>=============================================================</p><p>- Added recursive queries;</p><p></p><p>Console-2.0.2-beta</p><p>=============================================================</p><p>- Renew appearance;</p><p>- Two variants of result (formated and raw)</p><p></p><p>Console-2.0.1-beta</p><p>=============================================================</p><p>- Saving code in $_SESSION;</p><p></p><p>Console-2.0.0-rc</p><p>=============================================================</p><p>- Ace integration fix;</p><p></p><p>Console-1.2.0-rc</p><p>=============================================================</p><p>- Set default LogTarget(\'HTML\');</p><p>- Set default LogLevel(xPDO::LOG_LEVEL_DEBUG);</p><p></p><p>Console-1.1.0-rc</p><p>=============================================================</p><p></p><p>- First release</p>\";s:9:\"createdon\";s:24:\"2017-01-22T11:04:35+0000\";s:9:\"createdby\";s:7:\"fi1osof\";s:8:\"editedon\";s:24:\"2022-04-08T15:36:21+0000\";s:10:\"releasedon\";s:24:\"2017-02-03T08:54:24+0000\";s:9:\"downloads\";s:5:\"52908\";s:8:\"approved\";s:4:\"true\";s:7:\"audited\";s:5:\"false\";s:8:\"featured\";s:5:\"false\";s:10:\"deprecated\";s:5:\"false\";s:7:\"license\";s:5:\"GPLv2\";s:7:\"smf_url\";s:0:\"\";s:10:\"repository\";s:24:\"4d4c3fa6b2b0830da9000001\";s:8:\"supports\";s:3:\"2.2\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=5c3ce353bc8dd3d8358b4567\";s:9:\"signature\";s:16:\"console-2.2.2-pl\";s:11:\"supports_db\";s:12:\"mysql,sqlsrv\";s:16:\"minimum_supports\";s:3:\"2.2\";s:9:\"breaks_at\";s:8:\"10000000\";s:10:\"screenshot\";s:67:\"http://modx.s3.amazonaws.com/extras/50f2c1d3f2455468e4000049/14.jpg\";s:4:\"file\";a:7:{s:2:\"id\";s:24:\"5c3ce353bc8dd3d8358b4567\";s:7:\"version\";s:24:\"588491c3bc8dd393108b4567\";s:8:\"filename\";s:30:\"console-2.2.2-pl.transport.zip\";s:9:\"downloads\";s:5:\"19992\";s:6:\"lastip\";s:14:\"206.189.50.157\";s:9:\"transport\";s:4:\"true\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=5c3ce353bc8dd3d8358b4567\";}s:17:\"package-signature\";s:16:\"console-2.2.2-pl\";s:10:\"categories\";s:29:\"administration,administration\";s:4:\"tags\";s:0:\"\";}', 2, 2, 2, 'pl', 0);
INSERT INTO `mx_transport_packages` (`signature`, `created`, `updated`, `installed`, `state`, `workspace`, `provider`, `disabled`, `source`, `manifest`, `attributes`, `package_name`, `metadata`, `version_major`, `version_minor`, `version_patch`, `release`, `release_index`) VALUES
('login-1.9.10-pl', '2022-04-09 11:59:05', '2022-04-09 08:59:23', '2022-04-09 11:59:23', 0, 1, 1, 0, 'login-1.9.10-pl.transport.zip', NULL, 'a:8:{s:7:\"license\";s:15218:\"GNU GENERAL PUBLIC LICENSE\n   Version 2, June 1991\n--------------------------\n\nCopyright (C) 1989, 1991 Free Software Foundation, Inc.\n59 Temple Place, Suite 330, Boston, MA  02111-1307  USA\n\nEveryone is permitted to copy and distribute verbatim copies\nof this license document, but changing it is not allowed.\n\nPreamble\n--------\n\n  The licenses for most software are designed to take away your\nfreedom to share and change it.  By contrast, the GNU General Public\nLicense is intended to guarantee your freedom to share and change free\nsoftware--to make sure the software is free for all its users.  This\nGeneral Public License applies to most of the Free Software\nFoundation\'s software and to any other program whose authors commit to\nusing it.  (Some other Free Software Foundation software is covered by\nthe GNU Library General Public License instead.)  You can apply it to\nyour programs, too.\n\n  When we speak of free software, we are referring to freedom, not\nprice.  Our General Public Licenses are designed to make sure that you\nhave the freedom to distribute copies of free software (and charge for\nthis service if you wish), that you receive source code or can get it\nif you want it, that you can change the software or use pieces of it\nin new free programs; and that you know you can do these things.\n\n  To protect your rights, we need to make restrictions that forbid\nanyone to deny you these rights or to ask you to surrender the rights.\nThese restrictions translate to certain responsibilities for you if you\ndistribute copies of the software, or if you modify it.\n\n  For example, if you distribute copies of such a program, whether\ngratis or for a fee, you must give the recipients all the rights that\nyou have.  You must make sure that they, too, receive or can get the\nsource code.  And you must show them these terms so they know their\nrights.\n\n  We protect your rights with two steps: (1) copyright the software, and\n(2) offer you this license which gives you legal permission to copy,\ndistribute and/or modify the software.\n\n  Also, for each author\'s protection and ours, we want to make certain\nthat everyone understands that there is no warranty for this free\nsoftware.  If the software is modified by someone else and passed on, we\nwant its recipients to know that what they have is not the original, so\nthat any problems introduced by others will not reflect on the original\nauthors\' reputations.\n\n  Finally, any free program is threatened constantly by software\npatents.  We wish to avoid the danger that redistributors of a free\nprogram will individually obtain patent licenses, in effect making the\nprogram proprietary.  To prevent this, we have made it clear that any\npatent must be licensed for everyone\'s free use or not licensed at all.\n\n  The precise terms and conditions for copying, distribution and\nmodification follow.\n\n\nGNU GENERAL PUBLIC LICENSE\nTERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION\n---------------------------------------------------------------\n\n  0. This License applies to any program or other work which contains\na notice placed by the copyright holder saying it may be distributed\nunder the terms of this General Public License.  The \"Program\", below,\nrefers to any such program or work, and a \"work based on the Program\"\nmeans either the Program or any derivative work under copyright law:\nthat is to say, a work containing the Program or a portion of it,\neither verbatim or with modifications and/or translated into another\nlanguage.  (Hereinafter, translation is included without limitation in\nthe term \"modification\".)  Each licensee is addressed as \"you\".\n\nActivities other than copying, distribution and modification are not\ncovered by this License; they are outside its scope.  The act of\nrunning the Program is not restricted, and the output from the Program\nis covered only if its contents constitute a work based on the\nProgram (independent of having been made by running the Program).\nWhether that is true depends on what the Program does.\n\n  1. You may copy and distribute verbatim copies of the Program\'s\nsource code as you receive it, in any medium, provided that you\nconspicuously and appropriately publish on each copy an appropriate\ncopyright notice and disclaimer of warranty; keep intact all the\nnotices that refer to this License and to the absence of any warranty;\nand give any other recipients of the Program a copy of this License\nalong with the Program.\n\nYou may charge a fee for the physical act of transferring a copy, and\nyou may at your option offer warranty protection in exchange for a fee.\n\n  2. You may modify your copy or copies of the Program or any portion\nof it, thus forming a work based on the Program, and copy and\ndistribute such modifications or work under the terms of Section 1\nabove, provided that you also meet all of these conditions:\n\n    a) You must cause the modified files to carry prominent notices\n    stating that you changed the files and the date of any change.\n\n    b) You must cause any work that you distribute or publish, that in\n    whole or in part contains or is derived from the Program or any\n    part thereof, to be licensed as a whole at no charge to all third\n    parties under the terms of this License.\n\n    c) If the modified program normally reads commands interactively\n    when run, you must cause it, when started running for such\n    interactive use in the most ordinary way, to print or display an\n    announcement including an appropriate copyright notice and a\n    notice that there is no warranty (or else, saying that you provide\n    a warranty) and that users may redistribute the program under\n    these conditions, and telling the user how to view a copy of this\n    License.  (Exception: if the Program itself is interactive but\n    does not normally print such an announcement, your work based on\n    the Program is not required to print an announcement.)\n\nThese requirements apply to the modified work as a whole.  If\nidentifiable sections of that work are not derived from the Program,\nand can be reasonably considered independent and separate works in\nthemselves, then this License, and its terms, do not apply to those\nsections when you distribute them as separate works.  But when you\ndistribute the same sections as part of a whole which is a work based\non the Program, the distribution of the whole must be on the terms of\nthis License, whose permissions for other licensees extend to the\nentire whole, and thus to each and every part regardless of who wrote it.\n\nThus, it is not the intent of this section to claim rights or contest\nyour rights to work written entirely by you; rather, the intent is to\nexercise the right to control the distribution of derivative or\ncollective works based on the Program.\n\nIn addition, mere aggregation of another work not based on the Program\nwith the Program (or with a work based on the Program) on a volume of\na storage or distribution medium does not bring the other work under\nthe scope of this License.\n\n  3. You may copy and distribute the Program (or a work based on it,\nunder Section 2) in object code or executable form under the terms of\nSections 1 and 2 above provided that you also do one of the following:\n\n    a) Accompany it with the complete corresponding machine-readable\n    source code, which must be distributed under the terms of Sections\n    1 and 2 above on a medium customarily used for software interchange; or,\n\n    b) Accompany it with a written offer, valid for at least three\n    years, to give any third party, for a charge no more than your\n    cost of physically performing source distribution, a complete\n    machine-readable copy of the corresponding source code, to be\n    distributed under the terms of Sections 1 and 2 above on a medium\n    customarily used for software interchange; or,\n\n    c) Accompany it with the information you received as to the offer\n    to distribute corresponding source code.  (This alternative is\n    allowed only for noncommercial distribution and only if you\n    received the program in object code or executable form with such\n    an offer, in accord with Subsection b above.)\n\nThe source code for a work means the preferred form of the work for\nmaking modifications to it.  For an executable work, complete source\ncode means all the source code for all modules it contains, plus any\nassociated interface definition files, plus the scripts used to\ncontrol compilation and installation of the executable.  However, as a\nspecial exception, the source code distributed need not include\nanything that is normally distributed (in either source or binary\nform) with the major components (compiler, kernel, and so on) of the\noperating system on which the executable runs, unless that component\nitself accompanies the executable.\n\nIf distribution of executable or object code is made by offering\naccess to copy from a designated place, then offering equivalent\naccess to copy the source code from the same place counts as\ndistribution of the source code, even though third parties are not\ncompelled to copy the source along with the object code.\n\n  4. You may not copy, modify, sublicense, or distribute the Program\nexcept as expressly provided under this License.  Any attempt\notherwise to copy, modify, sublicense or distribute the Program is\nvoid, and will automatically terminate your rights under this License.\nHowever, parties who have received copies, or rights, from you under\nthis License will not have their licenses terminated so long as such\nparties remain in full compliance.\n\n  5. You are not required to accept this License, since you have not\nsigned it.  However, nothing else grants you permission to modify or\ndistribute the Program or its derivative works.  These actions are\nprohibited by law if you do not accept this License.  Therefore, by\nmodifying or distributing the Program (or any work based on the\nProgram), you indicate your acceptance of this License to do so, and\nall its terms and conditions for copying, distributing or modifying\nthe Program or works based on it.\n\n  6. Each time you redistribute the Program (or any work based on the\nProgram), the recipient automatically receives a license from the\noriginal licensor to copy, distribute or modify the Program subject to\nthese terms and conditions.  You may not impose any further\nrestrictions on the recipients\' exercise of the rights granted herein.\nYou are not responsible for enforcing compliance by third parties to\nthis License.\n\n  7. If, as a consequence of a court judgment or allegation of patent\ninfringement or for any other reason (not limited to patent issues),\nconditions are imposed on you (whether by court order, agreement or\notherwise) that contradict the conditions of this License, they do not\nexcuse you from the conditions of this License.  If you cannot\ndistribute so as to satisfy simultaneously your obligations under this\nLicense and any other pertinent obligations, then as a consequence you\nmay not distribute the Program at all.  For example, if a patent\nlicense would not permit royalty-free redistribution of the Program by\nall those who receive copies directly or indirectly through you, then\nthe only way you could satisfy both it and this License would be to\nrefrain entirely from distribution of the Program.\n\nIf any portion of this section is held invalid or unenforceable under\nany particular circumstance, the balance of the section is intended to\napply and the section as a whole is intended to apply in other\ncircumstances.\n\nIt is not the purpose of this section to induce you to infringe any\npatents or other property right claims or to contest validity of any\nsuch claims; this section has the sole purpose of protecting the\nintegrity of the free software distribution system, which is\nimplemented by public license practices.  Many people have made\ngenerous contributions to the wide range of software distributed\nthrough that system in reliance on consistent application of that\nsystem; it is up to the author/donor to decide if he or she is willing\nto distribute software through any other system and a licensee cannot\nimpose that choice.\n\nThis section is intended to make thoroughly clear what is believed to\nbe a consequence of the rest of this License.\n\n  8. If the distribution and/or use of the Program is restricted in\ncertain countries either by patents or by copyrighted interfaces, the\noriginal copyright holder who places the Program under this License\nmay add an explicit geographical distribution limitation excluding\nthose countries, so that distribution is permitted only in or among\ncountries not thus excluded.  In such case, this License incorporates\nthe limitation as if written in the body of this License.\n\n  9. The Free Software Foundation may publish revised and/or new versions\nof the General Public License from time to time.  Such new versions will\nbe similar in spirit to the present version, but may differ in detail to\naddress new problems or concerns.\n\nEach version is given a distinguishing version number.  If the Program\nspecifies a version number of this License which applies to it and \"any\nlater version\", you have the option of following the terms and conditions\neither of that version or of any later version published by the Free\nSoftware Foundation.  If the Program does not specify a version number of\nthis License, you may choose any version ever published by the Free Software\nFoundation.\n\n  10. If you wish to incorporate parts of the Program into other free\nprograms whose distribution conditions are different, write to the author\nto ask for permission.  For software which is copyrighted by the Free\nSoftware Foundation, write to the Free Software Foundation; we sometimes\nmake exceptions for this.  Our decision will be guided by the two goals\nof preserving the free status of all derivatives of our free software and\nof promoting the sharing and reuse of software generally.\n\nNO WARRANTY\n-----------\n\n  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY\nFOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN\nOTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES\nPROVIDE THE PROGRAM \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED\nOR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF\nMERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS\nTO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE\nPROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,\nREPAIR OR CORRECTION.\n\n  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING\nWILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR\nREDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,\nINCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING\nOUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED\nTO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY\nYOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER\nPROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE\nPOSSIBILITY OF SUCH DAMAGES.\n\n---------------------------\nEND OF TERMS AND CONDITIONS\";s:6:\"readme\";s:2998:\"--------------------\nSnippet: Login\n--------------------\n- Version: 1.9.8\n- Since: June 21, 2010\n- Author: Jason Coward <jason@modx.com>,\n        Shaun McCormick <shaun+login@modx.com>\n\nThis component loads a simple login and logout form. It also comes packaged\nwith ForgotPassword and ResetPassword snippets, which allow the user to put\nin their username or email to receive a confirmation email which will reset\ntheir password.\n\nExample for Login:\n```\n[[!Login]]\n```\n\nYou can also specify the template:\n\n```\n[[!Login? &tpl=`myLoginChunk`]]\n```\n\nSee the snippet properties for more options.\n\n--------------\nForgotPassword\n--------------\n\nTo use the password retrieval functionality, first create the Resource the\nuser will log in to should they click on the confirmation email, and put\nthe Reset Password snippet in. Tell it what Resource the Login snippet is\nin - or where you\'d like it to provide a link back to:\n\n```\n[[ResetPassword? &loginResourceId=`72`]]\n```\n\nThen create another resource with the Forgot Password snippet, and tell it\nwhat Resource the Reset snippet is in:\n\n```\n[[!ForgotPassword? &resetResourceId=`123`]]\n```\n\n--------\nRegister\n--------\n\nTo use the Register snippet, simply place the Snippet in the Resource where\nyour HTML register form is. (A default one called lgnRegisterFormTpl has\nbeen provided.). This snippet also requires Activation by the User, so they\nwill get an email in their inbox regarding their signup.\n\nIn your form field names, you can use validation filters to validate your\nfields. They are separated with the colon : symbol. Example:\n\n```\n<input type=\"password\" name=\"password:required:minLength=6\" id=\"password\" value=\"[[+password]]\" />\n```\n\nwill require that the password field not be empty, and have a minimum\nlength of 6 chars. You can encapsulate validator params (6 here) with ` if\nthe param has spaces in the name. The default validators provided are:\n\n```\nrequired\nblank\nemail\npassword_confirm=`nameOfPasswordField`\nminLength=`123`\nmaxLength=`123`\nminValue=`123`\nmaxValue=`123`\n```\n\nYou can also do custom validators by creating a Snippet and using that as\nthe validator name. Example: We create a Snippet called \'equalTo\' and\non our field, we set:\n\n```\n<input type=\"text\" name=\"field:equalTo=`123`\" id=\"field\" />\n```\n\nNow, in our snippet, our code would look like so:\n\n```\n<?php\nif ($scriptProperties[\'value\'] !== $scriptProperties[\'param\']) {\n    return \'Value not equal to: \'.$scriptProperties[\'param\'];\n}\nreturn true;\n?>\n```\n\nReturning true will make the field valid. Any other return value will\nbe the error message. Snippets get passed the following parameters:\n\n- key: The name of the field.\n- value: The value of the field.\n- param: The parameter, if applicable, passed to the validator.\n- type: The name of the validator.\n- validator: A reference to the lgnValidator instance.\n\nSee the Snippet Properties and the [MODX Docs](https://docs.modx.com/extras/revo/login) for more options.\n\nThanks,\nJason Coward & Shaun McCormick\nMODX, LLC\n\";s:9:\"changelog\";s:13267:\"Changelog for Login\n===================\n\nLogin 1.9.10\n------------------------------------\n- Log error if mail was not sent [#174]\n- Switched translation to Weblate and removed not translated/less translated lexicon\n\nLogin 1.9.9\n------------------------------------\n- Fix validate email addresses in Register [#143]\n\nLogin 1.9.8\n------------------------------------\n- Allow persistParams when redirectUnsetDefaultParams is true [#157]\n- Parse file based chunks [#167]\n- Prevent directory traversal in the username when register a new user\n- Fix logging \'Could not load package metadata for package login.\' during install\n- Update Translations\n\nLogin 1.9.7\n------------------------------------\n- Generate the password directly with modx->user->generatePassword()\n- Make it possible to set the usergroup rank when register a new user [#135]\n- Set an action in the default password reset form [#134]\n- Update Translations\n\nLogin 1.9.6\n------------------------------------\n- Register snippet PII improvements [#130]\n- JSON responses for the Login controller/snippet [#121]\n- Use Crowdin for translations: https://crowdin.com/project/modx-login\n- Update Translations [#132]\n- Use $modx->user->generatePassword for generating passwords [#131]\n- Escape MODX tags after htmlspecialchars because of the ampersand sign\n\nLogin 1.9.5\n------------------------------------\n- Fix ResetPassword passing null instead of an array to getChunk\n- Remove hash_class, salt and sessionid from placeholders\n- Prevent potential XSS in placeholders\n- Added two missing default template chunks\n- Fixing a charset issue in some language files\n- Fixing email validation [#110]\n- Disable User/E-mail Enumeration in ForgotPassword snippet by an empty sentTpl property (default)\n- New jsonResponse property for returning a JSON by the Register snippet (for an AJAX call response)\n- Possibility to reset the registration fields after successful registration\n\nLogin 1.9.4\n------------------------------------\n- Disable User/E-mail Enumeration\n- Enable login via email\n- Convert deprecated ereg functions to preg_* [#86]\n- Fixing error placeholders with empty placeholderPrefix\n- Fixing recoverable error, Argument 2 to getChunk() must be of the type array, null given [#87]\n\nLogin 1.9.3\n------------------------------------\n- Added activePage property to ConfirmRegister controller\n- Added danish language files\n- Normalize placeholder prefix usage\n- Improved PHP7 compatibility\n- Added loggedinResourceId and loggedoutResourceId to the Login controller\n- Fix errors with square brackets in changed password\n- Add confirm password and password length validation messages to the field error placeholders too\n- Fill lu/lp placeholders in the change password form\n- Added hidden lu/lp fields to the lgnResetPassChangePassTpl chunk\n- Fix for array fields in Register/Profile/UpdateProfile snippet\n\nLogin 1.9.2\n------------------------------------\n- Fix sending register activation email\n- Fix ConfirmRegister processor\n\nLogin 1.9.1\n------------------------------------\n- [[!+error.message]] returns detailed error\n- [#42] Fixed URL encoding/decoding\n- Sanitise Login placeholders\n- Fixed namespace paths\n\nLogin 1.9.0\n------------------------------------\n- Expired/used password reset link notification\n- Added autoLogin and forceChangePassword to ResetPassword snippet\n- Added autoLogin param to Register snippet\n- Improved password reset functionality\n- Update form fields with new values when reloadOnSuccess=0\n- Replace parseChunk with getChunk\n- Added Arabic lexicons\n- Fixed invalid properties in logindictionary and updateprofile\n- Added czech lexicons\n\nLogin 1.8.1\n------------------------------------\n- Add password strength algorithm and checking properties to Register, via &ensurePasswordStrength property\n\nLogin 1.8.0\n------------------------------------\n- [#5946] Add ability to set User Group for a new user via the &usergroupsField property\n- [#7520] Fix bug with ConfirmRegister logging the user in as anonymous\n\nLogin 1.7.3\n------------------------------------\n- [#7035] Fix regression error with email field in Register snippet\n\nLogin 1.7.2\n------------------------------------\n- [#6194] Fix issue with UpdateProfile when specifying the non-active user to update\n- [#6538] Add removeExpiredRegistrations property to Register snippet for handling expired, unactivated registrations\n- [#6256] Ensure Register respects passwordField and emailField properties\n- [#6288] Fix error message display in ChangePassword\n\nLogin 1.7.1\n------------------------------------\n- [#5947] Fix issue with Profile with unauthenticated users\n- [#5979] Fix issue with ConfirmRegister and non-FURL sites\n- [#5734] Add &allowedFields to Register to allow restricting of submitted fields to a specific set\n- [#6010] Fix typo in UpdateProfile mismatching ID of profile to internalKey\n- [#5961] Add &trimPassword to automatically trim whitespace from submitted passwords\n- Add &generatePassword to automatically generate a password instead of having to provide one manually\n- [#6146] Add &validatePassword to Register to allow for manual password generation\n- [#5969] Add &user property to UpdateProfile to allow specifying user to update\n\nLogin 1.7.0\n------------------------------------\n- [#49] Update reCaptcha URLs\n- [#5793] Add errTpl and errTplType properties to ForgotPassword\n- [#5823] Fix issue where postHooks did not have fields available\n- [#5797] Fix issue where &authenticate was not respected in ConfirmRegister snippet\n- [#5796] Fix issue where errors could appear twice if user used validators on username/email/password fields\n- Add ActiveUsers snippet that shows a list of active, logged-in users\n- Add file-based hooks to Login hook calls\n- Complete OOP refactoring to provide more stable development and better code isolation\n- Add unit test framework and over 30 tests\n- Add alternative plaintext email option for ability to send both html and plaintext in emails\n- [#5166] Add additional sanity decoding to ConfirmRegister processing\n\nLogin 1.6.5\n------------------------------------\n- [#5176] Fix issue with Registration in Revo 2.0 installations\n- Fix issue with some error messages not being wrapped with errTpl\n- Email validator now only checks for email validation, not required status\n- [#5166] Add additional sanity decoding to ConfirmRegister processing\n\nLogin 1.6.4\n------------------------------------\n- [#3588] Add &allowedFields and &allowedExtendedFields to UpdateProfile to restrict fields that are updated\n- [#4744] Add &redirectToOnFailedAuth parameter for redirecting to a separate page on failed logins\n- [#3263] Remove duplicate error spans in validator output\n\nLogin 1.6.3\n------------------------------------\n- Better support for checkboxes/radios/bracketed fields in login validator\n- [#5088] Fix issue with ChangePassword &validateOldPassword and Revo 2.1.1\n\nLogin 1.6.2\n------------------------------------\n- [#4844] Automatically trim trailing whitespace/newlines in validator calls\n- [#4843] Fix issue with sentTplType not being respected in ForgotPassword\n- [#4936] Fix issue in ForgotPassword that occurred if no user was found with that username\n- [#5019] Add backwards compatibility for Revo 2.0.x users in ResetPassword\n- Fix reference to $this->modx->lexicon in Login Snippet\n\nLogin 1.6.0/1\n------------------------------------\n- [#4886] Fix issue with variable variable in main login class when loading hooks\n- [#4487] Prevent usage of mb_ereg if not installed\n- [#3500] Fix issues with inline tplType params in Login snippets\n- [#4545] Fix issue with OnBeforeUserActivate event\n- Revolution 2.1 support, specifically with the password changes\n\nLogin 1.5.3\n------------------------------------\n- Add preHooks to ForgotPassword snippet\n- Fix issue that occurs when Login and Register forms are on same page with math register hook\n\nLogin 1.5.2\n------------------------------------\n- [#3330] Add sanity checks to prevent possible submitVar data adding in UpdateProfile\n- Add support for moderation of users when done in a prehook\n- Add support for redirectBackParams that can send encoded data through a login/registration process\n- Add a generic validation error in Register to allow for general messages\n- Ensure preHooks run before password validation in ChangePassword snippet\n- Fix issue with placeholderPrefix in UpdateProfile snippet\n\nLogin 1.5.1\n------------------------------------\n- [#44] Fix bug with login validator, &validate parameter\n- [#40] Fix issue with syncUsername in UpdateProfile\n- [#42] Respect allow_multiple_emails setting that prevents users with same email addresses\n- [#43] Add workaround for xPDO bug with NULL fields in modUserProfile\n- Trim each hook specification in hooks calls\n- [#28] Fixed validator issue in UpdateProfile\n- Added redirectTo and redirectParams on ForgotPassword snippet\n- Updated events in ResetPassword snippet to pass user object\n- Fixed UpdateProfile to properly update user obj so derivative User classes can manage profile updates\n\nLogin 1.5.0\n------------------------------------\n- Fixed security vulnerability\n- Added authenticate and authenticateContexts to ConfirmRegister to allow for authentication after confirming registration\n- Fixed persisting request alias params issue in ConfirmRegister\n- [#15] Added ability to assign roles when using &usergroups in Register, ie: &usergroups=`my-group-name:Member`\n- Added math hook to Register, allowing anti-spam math field measure\n- Added fix to allow overriding of class_key for new users in Register\n\nLogin 1.4.0\n------------------------------------\n- Added redirectBack to Register, Login and ConfirmRegister that allows dynamic redirection handling for other forms needing login/registration\n- Added redirectTo, redirectParams to ConfirmRegister that will redirect after successful confirmation\n- Added persistParams to Register snippet, useful for shopping cart implementations to persist parameters across the registration process\n- [#27] Fixed issue with activationEmail always overriding normal email\n- [#29] Added loginResourceParams, logoutResourceParams, which allows attaching REQUEST parameters to login/logout redirection URLs\n- Added changelog to build\n- [#26],[#14] Added activationEmail property for better handling of middle men in activation steps\n\nLogin 1.3.2-pl\n------------------------------------\n- [#25] Added isLoggedIn snippet for checking auth status\n- [#24] Fixed issue where inactive user could re-register\n- Fixed issue with embedded chunk type display\n- Fixed issue with redirects and non-FURLs on Register snippet\n\nLogin 1.3.1-pl (October 15, 2010)\n------------------------------------\n- Fixed issue with Login snippet on invalid logins\n\nLogin 1.3.0-pl (October 14, 2010)\n------------------------------------\n- Modified experimental multi-context support to use new login processor add_contexts parameter\n- Added ChangePassword snippet for changing passwords in the front-end\n- Fixed bugs with usernameField property, now works as expected\n- Added Dutch translation\n\nLogin 1.2.0\n------------------------------------\n- Fixed issues with placement of prehooks and such\n- Added excludeExtended property to Register, UpdateProfile snippets to allow for excluding fields from extended fields\n- Added new hook API methods for easier setting/retrieving of fields\n- Added experimental multiple-context login support\n- Fixed bug in login snippet with hard-coded action keys\n- Added support to set subject in ForgotPassword email\n- Added reCaptcha support to login form via a preHook\n- Added preHooks and postHooks ability to Login snippet\n- i18n of snippet properties\n\nLogin 1.1.0\n------------------------------------\n- Added Profile snippet, which outputs Profile data of a User in placeholders\n- Added &useExtended to UpdateProfile/Register, which allows users to set additional fields passed to be set in extended column\n- Fixed bug in UpdateProfile where validators were broken\n\nLogin 1.0.3\n------------------------------------\n- Fixed bug where logout link generation was ignorant of xhtml_urls setting\n- Fixed bug where ForgotPassword was sending invalid confirmUrl\n- Added preHooks and postHooks properties for doing pre and post register scripting to UpdateProfile snippet\n- Added preHooks and postHooks properties for doing pre and post register scripting to Register snippet\n- Added syncUsername property to UpdateProfile snippet\n- Fixed bug with embedded output in Login snippet\n- Added Russian translation\n\nLogin 1.0.2\n------------------------------------\n- Updated copyright information\n- Ensure username,password and email are always passed to register snippet to prevent blank logins\n\nLogin 1.0.1\n------------------------------------\n- Consolidated elements into own dir\n- Added extra checks and fixes to lgnValidator class\n- Added UpdateProfile snippet to enable updating of profile from front-end\n\nLogin 1.0.0\n------------------------------------\n- [#ADDON-129] Added name to default Register form\n- [#ADDON-106] Fixed incorrect plugin event invoking\n- [#ADDON-107] Added missing lexicon entry register.password_confirm\n- [#ADDON-103] Fixed context-specific issue with register email\n- [#ADDON-118] Force lexicon topic to load on lgnRegisterForm\n- Fixed alias issue in ForgotPassword snippet\n- Added changelog.txt\n\";s:9:\"signature\";s:15:\"login-1.9.10-pl\";s:6:\"action\";s:26:\"workspace/packages/install\";s:8:\"register\";s:3:\"mgr\";s:5:\"topic\";s:43:\"/workspace/package/install/login-1.9.10-pl/\";s:14:\"package_action\";i:0;}', 'Login', 'a:38:{s:2:\"id\";s:24:\"616415eb71b3912df302ffa2\";s:7:\"package\";s:24:\"4d556c31b2b083396d000a75\";s:12:\"display_name\";s:15:\"login-1.9.10-pl\";s:4:\"name\";s:5:\"Login\";s:7:\"version\";s:6:\"1.9.10\";s:13:\"version_major\";s:1:\"1\";s:13:\"version_minor\";s:1:\"9\";s:13:\"version_patch\";s:2:\"10\";s:7:\"release\";s:2:\"pl\";s:8:\"vrelease\";s:2:\"pl\";s:14:\"vrelease_index\";s:0:\"\";s:6:\"author\";s:4:\"jako\";s:11:\"description\";s:107:\"<p>Loads a simple login/logout form, with password retrieval functionality and a register form snippet.</p>\";s:12:\"instructions\";s:38:\"<p>Install via Package Management.</p>\";s:9:\"changelog\";s:150:\"<ul>\n<li>Log error if mail was not sent [#174]</li>\n<li>Switched translation to Weblate and removed not translated/less translated lexicon</li>\n</ul>\n\";s:9:\"createdon\";s:24:\"2021-10-11T10:46:03+0000\";s:9:\"createdby\";s:4:\"jako\";s:8:\"editedon\";s:24:\"2022-04-09T08:58:51+0000\";s:10:\"releasedon\";s:24:\"2021-10-11T10:46:03+0000\";s:9:\"downloads\";s:6:\"139793\";s:8:\"approved\";s:4:\"true\";s:7:\"audited\";s:4:\"true\";s:8:\"featured\";s:4:\"true\";s:10:\"deprecated\";s:5:\"false\";s:7:\"license\";s:5:\"GPLv2\";s:7:\"smf_url\";s:0:\"\";s:10:\"repository\";s:24:\"4d4c3fa6b2b0830da9000001\";s:8:\"supports\";s:1:\"2\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=61641703410f9c4dc2168482\";s:9:\"signature\";s:15:\"login-1.9.10-pl\";s:11:\"supports_db\";s:5:\"mysql\";s:16:\"minimum_supports\";s:1:\"2\";s:9:\"breaks_at\";s:8:\"10000000\";s:10:\"screenshot\";s:0:\"\";s:4:\"file\";a:7:{s:2:\"id\";s:24:\"61641703410f9c4dc2168482\";s:7:\"version\";s:24:\"616415eb71b3912df302ffa2\";s:8:\"filename\";s:29:\"login-1.9.10-pl.transport.zip\";s:9:\"downloads\";s:4:\"2113\";s:6:\"lastip\";s:12:\"77.222.62.31\";s:9:\"transport\";s:4:\"true\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=61641703410f9c4dc2168482\";}s:17:\"package-signature\";s:15:\"login-1.9.10-pl\";s:10:\"categories\";s:8:\"security\";s:4:\"tags\";s:84:\"security,login,profile,user,access,restrict,community,password,forgot password,reset\";}', 1, 9, 10, 'pl', 0);
INSERT INTO `mx_transport_packages` (`signature`, `created`, `updated`, `installed`, `state`, `workspace`, `provider`, `disabled`, `source`, `manifest`, `attributes`, `package_name`, `metadata`, `version_major`, `version_minor`, `version_patch`, `release`, `release_index`) VALUES
('pdotools-2.13.2-pl', '2022-04-09 11:28:44', '2022-04-09 08:32:23', '2022-04-09 11:32:23', 0, 1, 1, 0, 'pdotools-2.13.2-pl.transport.zip', NULL, 'a:8:{s:9:\"changelog\";s:29764:\"Changelog for pdoTools.\r\n\r\n2.13.2-pl (02.09.2021)\r\n==============\r\n- Fixed some snippets.\r\n\r\n2.13.1-pl (01.09.2021)\r\n==============\r\n- Installed composer packages.\r\n\r\n2.13.0-pl (01.09.2021)\r\n==============\r\n- Some security fixes.\r\n- The \"setOption\" modifier is marked as deprecated.\r\n- The snippet parameters \"tplPath\" and \"elementsPath\" are marked as deprecated.\r\n- Added the ability for snippets to return an array of raw data (it is necessary when using the Fenom template engine).\r\n- The settings \"parser_class\" and \"parser_class_path\" will be registered in the core namespace.\r\n- Update the ajax connector.\r\n\r\n2.12.10 pl\r\n==============\r\n- [#308] [pdoPage] Fixed the type of snippet property \"field\"\r\n\r\n2.12.9 pl\r\n==============\r\n- [Fenom] Update to version 2.12.0\r\n\r\n2.12.8 pl\r\n==============\r\n- [pdoPage] Fix reflected XSS in generated meta links\r\n\r\n2.12.7 pl\r\n==============\r\n- Make pdoTools canonical url work with Babel #304\r\n\r\n2.12.6 pl\r\n==============\r\n- [pdoPage] Reverted back #287\r\n\r\n2.12.5 pl\r\n==============\r\n- [Fenom] Added caching dinamic properties to prevent speed degradation.\r\n\r\n2.12.4 pl\r\n==============\r\n- [#290] Improved running snippet via @FILE binding.\r\n- [#296] Fix adding quotes to numeric values.\r\n- [#297] Make cross context weblink url possible.\r\n- [#274] [Fenom] User, resource and context properties are now dinamic.\r\n- [#287] [pdoPage] Remove prev & next meta tags\r\n- [#294] [#298] Improved pdopage.js and updated minified js files\r\n\r\n2.12.3 pl\r\n==============\r\n- Fixed E_NOTICE introduced in #285.\r\n\r\n2.12.2 pl\r\n==============\r\n- Updated chunks for Bootstrap 4.\r\n\r\n2.12.1 pl\r\n==============\r\n- [pdoMenu] Reverted back #283 and fixed docs for &tplCategoryFolder.\r\n- [#284] [Fenom] Fixed properties of $_modx->context variable.\r\n- [#275] [Fenom] Added \"reset\" and \"end\" modifiers.\r\n\r\n2.12.0 pl\r\n==============\r\n- [Fenom] More security fixes from Sergey Shlokov.\r\n- [#278] [pdoPage] Fixed caching.\r\n- [pdoPage] Show internal log on &showLog=`1`.\r\n- [#283] [pdoMenu] Fixed use of &tplCategoryFolder according to docs.\r\n- [#281] [pdoTools] Fixed load of models from case sensitive paths.\r\n- [#277] [pdoCrumbs] Ability to specify &customParents.\r\n- [#265] [pdoFetch] Fixed return of \"Array\" on SQL errors.\r\n\r\n2.11.3 pl\r\n==============\r\n- Added French lexicon entries.\r\n\r\n2.11.2 pl\r\n==============\r\n- Fix detection of element names starting with a number.\r\n\r\n2.11.1 pl\r\n==============\r\n- Faster processing of static files.\r\n\r\n2.11.0 pl\r\n==============\r\n- [pdoFetch] Added \"setTotal\" option to enable calculating all rows (\"SQL_CALC_FOUND_ROWS\"), which will also result in the \"totalVar\" placeholder is being set.\r\n- [pdoFetch] Option \"setTotal\" disabled by default.\r\n- [pdoPage] Forces \"setTotal\" to provide pagination.\r\n\r\n2.10.6 pl\r\n==============\r\n- Improved German lexicons.\r\n\r\n2.10.5 pl\r\n==============\r\n- [pdoTools] Ability to return array from \"prepareSnippet\" for more performance.\r\n- [FenomX] Fixed method \"getStore\".\r\n\r\n2.10.4 pl\r\n==============\r\n- [Fenom] Do not output raw tags if there was a compile errors.\r\n- [#266] [pdoMenu] Fixed the setting of \"here\" and \"self\" classes.\r\n- [#261] [Fenom] Fixed unexpected behavior of the fenom tag \"ignore\".\r\n\r\n2.10.3 pl\r\n==============\r\n- Improved compatibility with PHP 7.2\r\n- [pdoFetch] Ability to use arrays in \"&sortby\".\r\n\r\n2.10.2 pl\r\n==============\r\n- [Fenom] Improved processing of caching snippets inside uncached.\r\n\r\n2.10.1 pl\r\n==============\r\n- [#256] [Fenom] Fixed bug with caching of scripts and styles.\r\n- [pdoPage] \"&setMeta\" now works when \"&cache=`1`\".\r\n- [Fenom] Improved regular expression to detect Fenom syntax.\r\n\r\n2.10.0 pl\r\n==============\r\n- [#259] [pdoFetch] Fixed error when passed pure SQL into \"having\" parameter.\r\n- [#258] [pdoPage] Canonical urls always must be \"full\".\r\n- [#245] [pdoMenu] Ability to use conditional tpls instead of regular \"tpl\".\r\n- [#121] [pdoMenu] Improved work of specified chunks with weblinks.\r\n\r\n2.9.3 pl\r\n==============\r\n- [#255] [Fenom] New system setting \"pdotools_fenom_save_on_errors\" to save code on compilation errors in the cache directory for later debugging.\r\n\r\n2.9.2 pl\r\n==============\r\n- [pdoParser] Proper traversal trough arrays fields of resources in fast tags.\r\n\r\n2.9.1 pl\r\n==============\r\n- [Fenom] Updated to version 2.11.8.\r\n\r\n2.9.0 pl\r\n==============\r\n- [pdoPage] Improved \"&pageLinkScheme\" logic.\r\n- [#249] A little improvement for resource modifier.\r\n- [#251] [pdoFetch] More compatibility with PHP 7.1.\r\n- [#253] [pdoPage] Fixing a missing pagination in Ajax mode.\r\n- [#254] [Fenom] Options of json modifiers must check version of PHP to proper work.\r\n\r\n2.8.6 pl\r\n==============\r\n- [pdoArchive] Ability to specify fields with regular dates in the \"&dateField\" parameter.\r\n- [Fenom] Added all options to json modifiers.\r\n\r\n2.8.5 pl\r\n==============\r\n- [#248] [pdoPage] Fixed E_WARNING with array values in GET parameters.\r\n\r\n2.8.4 pl\r\n==============\r\n- Ability to use file elements in core path outside base path.\r\n- Fixed bug with the caching of elements.\r\n\r\n2.8.3 pl\r\n==============\r\n- [Fenom] Fixed rare bug with the caching of scripts and styles that was registered via Fenom.\r\n- [pdoPage] Fixed the \"?page=1\" in the url when ajaxMode is enabled.\r\n- [pdoPage] Snippet will register \"canonical\" link if \"&setMeta\" is enabled.\r\n- [pdoPage] Fix processing of request with rawurldecode on some servers.\r\n- [pdoTools] Added passing of \"scriptProperties\" values into a \"&prepareSnippet\".\r\n\r\n2.8.2 pl\r\n==============\r\n- [pdoMenu] Fixed the checking of permissions for containers.\r\n- [pdoPage] Added the ability to run files as &element.\r\n- [pdoTools] The method runSnippet will return boolean false if snippet was not found.\r\n- [Fenom] Fixed the possible bugs of caching of scripts and styles.\r\n\r\n2.8.1 pl\r\n==============\r\n- [#244] Fixed possible duplicate of a container in the jquery.pdopage.js.\r\n- Added fallback class for the enable modParser.\r\n\r\n2.8.0 pl\r\n==============\r\n- Ability to use an arrays in the parameters of the snippets.\r\n- Replaced modX::toJSON and modX::fromJSON to native php functions.\r\n\r\n2.7.5 pl\r\n==============\r\n- Fenom is now managed via composer.\r\n- [Fenom] Modifier \"resource\" no longer checks fields of resources in their schema.\r\n- [Fenom] Modifier \"strrev\" now can work with arrays.\r\n- [Fenom] Improved modifier \"ismember\".\r\n\r\n2.7.4 pl\r\n==============\r\n- [#242] Added jquery.pdopage.js plugin and minified versions.\r\n- [#241] [Fenom] Improved the retrieving of TVs for a current resource.\r\n- [pdoFetch] Restored the checking of possible SQL injections in the &sortby with xPDO 2.5.1.\r\n\r\n2.7.3 pl\r\n==============\r\n- Improved compatibility with MODX 2.5.2.\r\n\r\n2.7.2 pl\r\n==============\r\n- [pdoFetch] Some security improvements.\r\n\r\n2.7.1 pl\r\n==============\r\n- Some security improvements in the connector.php.\r\n- Fixed bug with registering scripts in styles via Fenom introduced in version 2.7.0.\r\n\r\n2.7.0 pl\r\n==============\r\n- [Fenom] Updated to the version 2.11.4.\r\n- [Fenom] Fixed resource cache for scripts and styles registered by Fenom.\r\n- [Fenom] Added rand() and number_format() to an allowed PHP functions.\r\n- [Fenom] New output filter \"number\" (or \"number_format\").\r\n\r\n2.6.5 pl\r\n==============\r\n- Fixed undeclared variable (PHP 7.1)\r\n\r\n2.6.4 pl\r\n==============\r\n- Added escaping of a MODX tags that being processed in the &prepareSnippet.\r\n- [#239] Improved work of the &decodeJSON option.\r\n\r\n2.6.3 pl\r\n==============\r\n- Fixed possible E_NOTICE on line 305 pdofetch.class.php.\r\n- Fixed possible E_NOTICE when \"snippet\" and \"chunk\" Fenom modifiers was called.\r\n\r\n2.6.2 pl\r\n==============\r\n- Fixed possible E_NOTICE on line 1317 pdotools.class.php.\r\n\r\n2.6.1 pl\r\n==============\r\n- Improved compatibility with PHP 5.3.\r\n\r\n2.6.0 pl\r\n==============\r\n- [Fenom] The ability to extend Fenom via system event \"pdoToolsOnFenomInit\".\r\n\r\n2.5.6 pl\r\n==============\r\n- [pdoFetch] Ability to join TVs not only to the query main class.\r\n\r\n2.5.5 pl\r\n==============\r\n- Fixed parse of INLINE chunks with \"@\" symbols.\r\n\r\n2.5.4 pl\r\n==============\r\n- [#224] Added microMODX::cleanAlias().\r\n- [#226] [Fenom] Added \"declension\" modifier.\r\n\r\n2.5.3 pl\r\n==============\r\n- [#221] Fixed typo in month name.\r\n- [Fenom] Fixed path to compile dir.\r\n\r\n2.5.2 pl\r\n==============\r\n- [#220] Cache code of snippet with respect to property set.\r\n\r\n2.5.1 pl\r\n==============\r\n- Fixed cache of snippets in pdoTools::runSnippet().\r\n\r\n2.5.0 pl\r\n==============\r\n- Improved support of debugParser.\r\n- [#209] Improved loading of the models.\r\n- [Fenom] New modifiers: \"snippet\" and \"chunk\".\r\n- [Fenom] New elements provider: \"file\".\r\n- New method pdoTools::runSnippet().\r\n\r\n2.4.0 pl\r\n==============\r\n- Added snippet pdoArchive.\r\n- [pdoResources] Faster processing of additional snippet parameters to placeholders.\r\n- [#123] [pdoMenu] Fixed bug with &displayStart and unpublished root nodes.\r\n- [#207] [pdoMenu] Fixed &webLinkClass option.\r\n- [#193] [pdoNeighbors] Added parameter &wrapIfEmpty.\r\n- [#203] [Fenom] Added more PCRE modifiers.\r\n\r\n2.3.5 pl\r\n==============\r\n- [pdoFetch] Added escaping of columns names in query.\r\n\r\n2.3.4 pl\r\n==============\r\n- [#200] [pdoFetch] Fixed &sortbyTV with dot in name.\r\n\r\n2.3.3 pl\r\n==============\r\n- Added system plugin for \"autoload\" of main classes with respect to their paths in system settings.\r\n\r\n2.3.2 pl\r\n==============\r\n- [#196] [pdoPage] Added workaround to support ClientConfig tags in ajax mode.\r\n- [Fenom] Added general MODX output filters as Fenom modifiers.\r\n- [Fenom] Implemented autoload of modifiers from snippets.\r\n- [Fenom] Removed system setting \"pdotools_fenom_modifiers\".\r\n\r\n2.3.1 pl\r\n==============\r\n- [pdoSitemap] Lightning fast work chunks processing with &scheme=`uri`.\r\n- [Fenom] Improved check of syntax before processing.\r\n\r\n2.3.0 pl\r\n==============\r\n- Removed shortcuts from system core.\r\n- PSR-2.\r\n- [Fenom] Added default modifiers: \"url\" and \"lexicon\".\r\n- [pdoCrumbs] Changed default chunks to ul -> li.\r\n- [#190] [pdoSitemap] Changed date format to ISO 8601.\r\n\r\n2.2.8 pl\r\n==============\r\n- [Fenom] Use modResource::getContent() method to get content of current resource in {$_modx->resource}.\r\n\r\n2.2.7 pl\r\n==============\r\n- [pdoPage] Ability to get access to a javascript configs from 3rd party scripts.\r\n\r\n2.2.6 pl\r\n==============\r\n- [#184] [Fenom] Updated to version 2.8.2.\r\n\r\n2.2.5 pl\r\n==============\r\n- [#182] [pdoTitle] Added passing a parameters into nested pdoCrumbs.\r\n- [pdoSitemap] Added processing of MODX tags if needed.\r\n- Added method pdoTools::makeUrl().\r\n- [#181] New url schema type - \"uri\".\r\n\r\n2.2.4 pl\r\n==============\r\n- [Fenom] Fixed speed issues when MODX snippets are run as Fenom modifiers.\r\n- [pdoUsers] Fixed overwrite modUser.id by modUserProfile.id.\r\n\r\n2.2.3 pl\r\n==============\r\n- [pdoPage] Fixed processing of uncached conditions in chunks when ajax mode is enabled.\r\n\r\n2.2.2 pl\r\n==============\r\n- [pdoPage] Added new parameter &pageLinkScheme.\r\n\r\n2.2.1 pl\r\n==============\r\n- [#155] [pdoPage] Added new parameter &ajaxHistory.\r\n- [pdoPage] Added connector for requests in ajax mode.\r\n\r\n2.2.0 pl\r\n==============\r\n- [#175] [pdoFetch] Ability to specify sequence of table joins.\r\n- [#174] [Fenom] Ability to add Fenom modifiers into pdoParser.\r\n\r\n2.1.21 pl\r\n==============\r\n- [#175] [pdoFetch] Ability to specify sequence of table joins.\r\n- [#176] [pdoUsers] Fixed &toPlaceholders with &returnIds.\r\n\r\n2.1.20 pl\r\n==============\r\n- [pdoSitemap] Fixed default &cacheKey.\r\n\r\n2.1.19 pl\r\n==============\r\n- [Fenom] Disabled $options in cacheManager::set() due to security reasons.\r\n\r\n2.1.18 pl\r\n==============\r\n- [Fenom] Fixed ability to access to the modX object from {$_modx} variable.\r\n- [Fenom] Improved method {$_modx->runProcessor()}.\r\n\r\n2.1.17 pl\r\n==============\r\n- [Fenom] Added {$_modx->getResource($id, $options)}.\r\n- [Fenom] Added {$_modx->getResources($where, $options)}.\r\n- [Fenom] Improved support of debugParser.\r\n\r\n2.1.16 pl\r\n==============\r\n- [Fenom] Added {$_modx->isMember($groups, $matchAll)}.\r\n- [Fenom] Added {$_modx->getPlaceholders()}.\r\n\r\n2.1.15 pl\r\n==============\r\n- [pdoPage] Added parameter &strictMode.\r\n\r\n2.1.14 pl\r\n==============\r\n- [pdoSitemap] Added options for cache snippets results.\r\n- [pdoSitemap] Cache enabled by default.\r\n\r\n2.1.13 pl\r\n==============\r\n- [#163] Fixed ignoring of &idx in pdoResources and pdoUsers.\r\n\r\n2.1.12 pl\r\n==============\r\n- [pdoPage] [#161] Fixed support of arrays in hash when &ajaxMode is enabled.\r\n\r\n2.1.11 pl\r\n==============\r\n- [#150] [Fenom] Fixed processing of TVs values in a {$_modx->resource}.\r\n- [#147] [pdoSitemap] Fixed possible duplicates in sitemap.\r\n- [pdoPage] Support of arrays in hash when &ajaxMode is enabled.\r\n\r\n2.1.10 pl\r\n==============\r\n- [#157] [Fenom] Fixed pre-processing of Fenom tags in extending templates and chunks.\r\n- [#145] [pdoPage] Rolled back #81 due to issues with complicate forms.\r\n\r\n2.1.9 pl\r\n==============\r\n- [#144] [pdoParser] Leave unprocessed FastField tags so other components could parse them.\r\n- [pdoFetch] Updated syntax for \"SET SQL_BIG_SELECTS = 1\".\r\n\r\n2.1.8 pl\r\n==============\r\n- [Fenom] Ability to use id of chunks and templates in {include} and {extends}.\r\n- [Fenom] Added support of debugParser.\r\n- [Fenom] Added {$_modx->getChildIds()} and {$_modx->getParentIds()}.\r\n\r\n2.1.7 pl\r\n==============\r\n- Fixed work with integer values from system setting \"link_tag_scheme\".\r\n\r\n2.1.6 pl\r\n==============\r\n- [Fenom] Updated to version 2.8.0.\r\n- [Fenom] Improved check of syntax to process content of chunks.\r\n- [pdoParser] Fixed E_WARNING on line 50 introduced in previous version.\r\n\r\n2.1.5 pl\r\n==============\r\n- [Fenom] Fixed register of scripts and styles by cached snippets.\r\n\r\n2.1.4 pl\r\n==============\r\n- [Fenom] Fixed TVs in {$_modx->resource}\r\n- [Fenom] Added new method {$_modx->getInfo()}\r\n\r\n2.1.3 pl\r\n==============\r\n- Improved work of system setting \"pdotools_fenom_php\".\r\n\r\n2.1.2 pl\r\n==============\r\n- [Fenom] Replaced {$_modx->placeholders} to functions.\r\n\r\n2.1.1 pl\r\n==============\r\n- pdoParser enabled by default.\r\n- [Fenom] Fixed return content in {$_modx->getChunk}.\r\n- [Fenom] Added cache for snippets called through {$_modx->runSnippet}.\r\n- [pdoTools] Added processing of property sets for chunks.\r\n- [pdoResources] Set additionalPlaceholders in &tplWrapper\r\n\r\n2.1.0 pl\r\n==============\r\n- [Fenom] Updated Fenom to version 2.7.1.\r\n- [Fenom] Added safe system variable {$_modx}.\r\n- [Fenom] Added MODX template provider for chunks and templates.\r\n\r\n2.0.5 pl\r\n==============\r\n- [#132] Fixed possible E_WARNING on empty chunks.\r\n- [#122] Ability to use 3rd party pdoPage and pdoMenu classes.\r\n- [#118] [pdoPage] Fixed parameter &offset.\r\n- [pdoPage] Fixed default CSS classes in \"empty\" chunks.\r\n\r\n2.0.4 pl\r\n==============\r\n- Fixed processing of \"pdotools_fenom_cache\" system setting.\r\n\r\n2.0.3 pl\r\n==============\r\n- [#125] [pdoTitle] Fixed parameter &id.\r\n\r\n2.0.2 pl\r\n==============\r\n- Improved processing of @FILE binding.\r\n\r\n2.0.1 pl\r\n==============\r\n- Fixed possible E_WARNING on line 319 and 349 of pdoTools class.\r\n- Disabled system option \"pdotools_fenom_modx\" by default due to security issues.\r\n\r\n2.0.0 pl\r\n==============\r\n- New system settings to control the Fenom.\r\n- Ability to enable caching of Fenom compiled chunks.\r\n- Improved handling of parameter \"cache_key\".\r\n- [pdoMenu] Improved work when &cache is enabled.\r\n\r\n2.0.0 rc2\r\n==============\r\n- Compiled Fenom templates cached to RAM instead of HDD.\r\n- Removed plugin pdoTools.\r\n\r\n2.0.0 rc1\r\n==============\r\n- Added Fenom template engine.\r\n- Fenom enabled by default.\r\n- pdoParser uses Fenom to process pages.\r\n\r\n1.11.2 pl\r\n==============\r\n- [#116] [pdoTitle] Disabled &register_js by default.\r\n\r\n1.11.1 pl\r\n==============\r\n- [pdoSitemap] Fixed default url scheme after last update.\r\n\r\n1.11.0 pl1\r\n==============\r\n- [pdoTitle] Added new snippet.\r\n- [pdoPage] Added support of snippet pdoTitle when &ajaxMode is enabled.\r\n- [pdoPage] Prevent overwriting of scripts and styles of nested &element by default parameters.\r\n- [pdoPage] Added triggering javascript event \"pdopage_load\".\r\n\r\n1.10.2 pl1\r\n==============\r\n- [#112] Parameter &scheme was set to system default in all snippets.\r\n- [#111] [pdoPage] Added ability to set \"prev\" & \"next\" meta tags.\r\n- [#107] [pdoNeighbors] Added ability to specify &parents for work.\r\n- [#106] [pdoMenu] Fixed \"hereClass\" and \"selfClass\" enabled &useWeblinkUrl parameter.\r\n- [#104] [pdoMenu] Snippet now using \"pagetitle\" for link titles if \"titleOfLinks\" is empty.\r\n\r\n1.10.1 pl\r\n==============\r\n- [#108] [pdoFetch] Fixed E_ERROR when using &sortbyTV.\r\n- [pdoFetch] Added new parameter &sortbyTVType.\r\n- [pdoFetch] If &sortdirTV is not set it will be equal to &sortdir.\r\n\r\n1.10.0 pl\r\n==============\r\n- [pdoMenu] Returned and fixed parameter &showDeleted.\r\n- [pdoPage] Improved default javascript.\r\n- [pdoPage] Fixed overwriting &frontend_js and &frontend_css parameters when &ajax is disabled.\r\n- [pdoFetch] Ability to specify functions in select fields.\r\n- [pdoTools] Ability to use compound quick placeholders.\r\n\r\n1.10.0 beta4\r\n==============\r\n- [pdoPage] Ajax pagination out from the box.\r\n- [pdoFetch] Improved log of getCollection.\r\n- [pdoTools] Added tplOperator \"contains\".\r\n\r\n1.9.7 pl\r\n==============\r\n- [#99] [pdoFetch] Fixed returning of primary key in \"ids\" mode.\r\n- [#97] [pdoTools] Fixed default tplPath for @FILE chunks.\r\n- [#85] [pdoFetch] Added function getChildIds().\r\n- [pdoFetch] Disabled \"total\" placeholder for &return=`ids`.\r\n\r\n1.9.6 pl2\r\n==============\r\n- [pdoFetch] Fixed exclusion of field \"id\" in custom classes.\r\n- [pdoMenu] Improved parameter &countChildren.\r\n- [#100] [pdoMenu] Removed parameter &showDeleted because it not working.\r\n\r\n1.9.6 rc\r\n==============\r\n- Added execution of SQL_BIG_SELECTS = 1 before query.\r\n- [pdoPage] Added parameter &ajax for supporting of ajax requests.\r\n\r\n1.9.5 pl1\r\n==============\r\n- Rolled back #72 due to issues in pdoMenu.\r\n\r\n1.9.5 pl\r\n==============\r\n- Added ability to return JSON or serialized string from pdoFetch::run().\r\n- [#83] [pdoMenu] Added level placeholder to outer templates.\r\n- [#82] [pdoFetch] Added support for complex &where parameter.\r\n- [#81] [pdoPage] Improved handling of arrays in url.\r\n- [#77] Fixed making of url for modWebLink to another context.\r\n- [#72] [pdoTools] Fixed order for children of excluded parents in buildTree.\r\n- [#60] [pdoMenu] Fixed parameter &tplCategoryFolder.\r\n- [#57] [pdoMenu] Improved placeholder [[+children]].\r\n- [#57] [pdoMenu] Added parameter &countChildren.\r\n\r\n1.9.4 pl1\r\n==============\r\n- [#78] [pdoNeighbors] Added parameter &loop=`1` for looping links.\r\n- [pdoSitemap] Fixed possible E_FATAL php-apc.\r\n\r\n1.9.3 pl1\r\n==============\r\n- [pdoTools] Ability to specify value for empty quick placeholders.\r\n- [pdoTools] Ability to use INLINE snippets and filters.\r\n- [pdoFetch] Improved loading of 3rd party models.\r\n- [pdoPage] Fixed E_WARNING when &limit=`0`.\r\n\r\n1.9.2 pl2\r\n==============\r\n- [#56] [pdoParser] Fixed wrong links processing.\r\n- [#53] Improved loading of classes.\r\n- [pdoField] Rolled back to original logic of \"top\" and \"topLevel\" parameters due to issues.\r\n- [pdoField] Added parameter \"ultimate\" to emulate logic of UltimateParent.\r\n\r\n1.9.1 pl6\r\n==============\r\n- [pdoFetch] Adding alias of main class of query to \"sortby\" if no alias exists.\r\n- [pdoFetch] Improved selecting of all fields of class with specified alias.\r\n- [pdoField] Parameter \"topLevel\" works exactly as in UltimateParent.\r\n- [pdoField] Parameter \"top\" without \"topLevel\" returns parent on \"top\" level.\r\n\r\n1.9.1 pl\r\n==============\r\n- [#47] [pdoMenu] Fixed processing &tplOuter when output is empty.\r\n- [#46] [pdoParser] Fixed processing of TVs with dots in name.\r\n- [#44] [pdoMenu] Improved handling of Wayfinder parameters \"includeDocs\" and \"excludeDocs\".\r\n- [#37] [pdoField] get the default, only if the field was empty.\r\n- [#34] Fixed processing of \"modSymLink\" documents.\r\n- [#32] Improved cache methods.\r\n- [#26] Replaced FIND_IN_SET() to FIELD().\r\n- [pdoFetch] Ability to work with objects, that has multiple primary keys.\r\n- [pdoPage] New parameter &cacheAnonymous.\r\n- [pdoMenu] New parameter &cacheAnonymous.\r\n- Added aliases for sort query in order of specified &resources: \"ids\" or \"resources\".\r\n- Removed unnecessary query in pdoFetch::getCollection().\r\n- Improved pdoFetch::getCollection().\r\n- Renamed pdoFetch::getObject() to getArray(). Now it uses getCollection for retrieve results.\r\n- pdoTools::setCache() now returns cacheKey.\r\n- pdoFetch::getObject() is now alias of pdoFetch::getArray().\r\n\r\n1.9.0 pl2\r\n==============\r\n- [pdoMenu] Chunks of parents and categories are now depends on the descendants and ignores parameter isfolder.\r\n- [pdoNeighbors] Speed improvements.\r\n- [#27] Ability to specify custom pdoFetch and pdoTools classes through FQN system settings.\r\n- [pdoParser] Handles TVs in resource tags.\r\n- [pdoParser] Handles output filters.\r\n- [pdoFetch] Improved method \"addTVFilters\", that used by \"tvFilters\" parameter in pdoResources.\r\n- [pdoSitemap] Pass the whole row so we can use more columns.\r\n\r\n1.9.0 rc\r\n==============\r\n- Improved method pdoTools::getChunk().\r\n- Improved method pdoTools::parseChunk().\r\n- Improved method pdoTools::fastProcess().\r\n- Improved method pdoTools::makePlaceholders().\r\n- Accelerated snippet pdoNeighbors.\r\n- Fixed bug in pdoUsers when usersgroups was specified by names.\r\n- getObject and getCollection() runs in separate instance.\r\n- Added pdoParser with FastField tags.\r\n- [pdoPage] Changed default value of parameter \"totalVar\" due to issues.\r\n- [#24] Fixed prepareTVs and empty tvPrefix.\r\n- [#23] [pdoResources] Ability to return ids to placeholder.\r\n- Fixed warning when getObject returns false.\r\n- Fixed placeholders prefix in recursive makePlaceholders.\r\n\r\n1.8.9 pl4\r\n==============\r\n- Added german lexicon.\r\n- [#20] Ability to specify not JSON string in &where=``.\r\n- [pdoPage] Added parameter \"pageCountVar\" for specifying name of variable with number of pages.\r\n- [pdoPage] Support Bootstrap3.\r\n- [pdoField] Ability to specify class for fetching field.\r\n- Improved joining of tables in pdoFetch.\r\n- Added preparing and processing TVs in getObject and getCollection methods.\r\n- Improved load of 3rd party models.\r\n\r\n1.8.8 pl2\r\n==============\r\n- Rewrited cache of snippets \"pdoMenu\" and \"pdoPage\".\r\n- New methods pdoTools::getCache() and pdoTools::setCache().\r\n- [pdoMenu] Fixed parameter \"tplParentRowActive\".\r\n- [#18] Fixed \"idx\" in pdoTools::defineChunk().\r\n\r\n1.8.7 pl\r\n==============\r\n- Added boolean parameter \"decodeJSON\" to specify whether or not decode JSON in results rows.\r\n- Removed default \"sortby\" and \"sortdir\" from class pdoFetch for better work of getCollection() method.\r\n\r\n1.8.6 pl2\r\n==============\r\n- Fixed possibly E_NOTICE when site has no extension packages installed.\r\n- [#17] [pdoMenu] Added placeholder [[+wf.menutitle]].\r\n- [#16] [pdoMenu] Disabled status verification of specified parents.\r\n- [#13] [pdoMenu] Improved work with root of multiple contexts.\r\n- [pdoMenu] Fixed bug when specified parent has only the one child.\r\n- [pdoResources] Added parameter \"&useWeblink\" and placeholder \"[[+link]]\". It is disabled by default.\r\n\r\n1.8.5 pl\r\n==============\r\n- [#15] [pdoPage] Improved generation of links to pages.\r\n- [pdoMenu] Improved processing of classes \"modSymlink\" and \"modWeblink\".\r\n- [pdoBreadcrumbs] Improved processing of classes \"modSymlink\" and \"modWeblink\". Added parameter \"&useWeblink\".\r\n- [pdoNeighbors] Added parameter \"&useWeblink\" and placeholder \"[[+link]]\".\r\n- [pdoSitemap] Added parameter \"&useWeblink\" and proper processing of classes \"modSymlink\" and \"modWeblink\".\r\n\r\n1.8.4 pl\r\n==============\r\n- [pdoCrumbs] Added ability to specify the crumbs root (defaulting to site_start)\r\n- [pdoCrumbs] Added ability to specify class_key (ie. to generate crumbs only for derivative classes)\r\n- More accuracy when try to decode json in fetch results.\r\n\r\n1.8.3 pl3\r\n==============\r\n- Improved preparation of template variables.\r\n- Improved transfer of additional parameters from snippet to results.\r\n- [pdoMenu] Added lexicon entries for parameters.\r\n- [pdoMenu] Allow to specify \"limit\" and \"offset\".\r\n- [#12] Added parameter \"toPlaceholder\".\r\n- Increased accuracy of timings log.\r\n\r\n1.8.1 pl2\r\n==============\r\n- Accelerated method pdoTools::getChunk().\r\n- Added snippet pdoMenu.\r\n- Added support for tags [^qt^] and [^q^].\r\n\r\n1.8.0 pl\r\n==============\r\n- [#10] [pdoPage] Added placeholder \"page\".\r\n- [#9] [pdoPage] Added placeholder \"pageCount\".\r\n- [#8] Improved support of big numbers when sorting by TVs.\r\n- Fixed work of pdoPage when it called multiple times on page.\r\n- Fixed mistype in pdoFetch::getCollection().\r\n\r\n1.8.0 rc5\r\n==============\r\n- Added processing of JSON fields. For example, you can use [[+extended.keyname]] in chunks of pdoUsers.\r\n- pdoTools was removed from system extension packages, but you can still use \"$modx->getService(\'pdoFetch\');\".\r\n- Fixed getting chunk without any parameters.\r\n- Added snippet pdoPage.\r\n\r\n1.8.0 beta1\r\n==============\r\n- Improved handling of \"default_text\" parameter in TVs.\r\n- Fixed and improved method pdoTools::buildTree().\r\n- The logic of build the conditions of the query moved into new method pdoFetch::additionalConditions().\r\n- Improved method pdoFetch::addSelects().\r\n- Improved method pdoFetch::addSort().\r\n- Improved some snippets in accordance to new abilities of pdoFetch: pdoResources, pdoNeighbors and pdoSitemap.\r\n\r\n1.7.4 pl\r\n==============\r\n- [#7] [pdoSitemap] Fixed hidden parameters \"&sortBy\" and \"&sortDir\" that used for compatibility with GoogleSiteMap.\r\n\r\n1.7.3 pl1\r\n==============\r\n- [pdoCrumbs] Fixed possible E_NOTICE on line 157.\r\n- [pdoCrumbs] Fixed generation of link to site start in relative mode.\r\n- [#6] pdoCrumbs and pdoNeighbors are now uses \"menutitle\" by default. If it is empty, will be used \"pagetitle\".\r\n\r\n1.7.2 pl1\r\n==============\r\n- [pdoField] Added new parameters: \"default=``\" and \"&field=``\".\r\n- [pdoField] Improved logic of \"&top=``\" and \"&topLevel=``\".\r\n- Added 2 new methods: pdoFetch::getObject() and pdoFetch::getCollection().\r\n- Ability to send arrays into common config parameters. JSON is still supported.\r\n- Improved select of default values in TVs.\r\n\r\n1.7.1 pl\r\n==============\r\n- [pdoCrumbs] Fixed work with \"modSymLink\" and \"modWebLink\" resources.\r\n\r\n1.7.0 pl1\r\n==============\r\n- New snippet pdoCrumbs.\r\n- New snippet pdoField.\r\n- New snippet pdoSitemap.\r\n- New snippet pdoNeighbors.\r\n- Ability to specify snippet for preparation of fetched rows by parameter \"&prepareSnippet=``\".\r\n- Added method pdoTools::checkPermissions() for checking user privileges to view the results.\r\n- Added @TEMPLATE binding. You can use name or id of any template. If empty - will use template of each row.\r\n- [pdoResources] Improved parameter \"&context\".\r\n- [pdoResources] Script properties are now passed to chunks. You can send any placeholders to it.\r\n\r\n1.6.0 pl1\r\n==============\r\n- Fixed compatibility issues in PHP < 5.3.\r\n\r\n1.6.0 pl\r\n==============\r\n- Added parameter \"&loadModels\" for comma-separated list of 3rd party components that needed for query.\r\n- Added parameters \"&prepareTVs\" and \"&processTVs\".\r\n- Added parameters \"&tvFilters\", \"&tvFiltersAndDelimiter\" and \"&tvFiltersAndDelimiter\".\r\n- Added support of parameters \"&sortbyTV\" and \"&sortdirTV\" for compatibility with getResources.\r\n- Added ability to use @INLINE and @FILE bindings in all template parameters.\r\n- Removed method pdoTools::getPlaceholders.\r\n\r\n1.5.0 pl2\r\n==============\r\n- Fixed sort of decimals in TVs.\r\n\r\n1.5.0 pl1\r\n==============\r\n- Added processing of simple [[~id]] placeholders in fastMode.\r\n- Added support of default value for TVs.\r\n- Improved sort by TVs of types \"number\" and \"date\".\r\n\r\n1.5.0 rc\r\n==============\r\n- [pdoUsers] Added new snippet \"pdoUsers\".\r\n- [pdoResources] Fixed \"toSeparatePlaceholders\".\r\n- [pdoResources] Parameter \"parents\" now supports dash prefix for excluding resources from query by parent.\r\n- [pdoResources] Fixed issue when snippet runs multiple times at one page.\r\n\r\n1.4.1 pl1\r\n==============\r\n- Improved \"context\" processing.\r\n- Fixed \"idx\" when multiple snippets called at one page.\r\n- Fixed default sortby when joined tables exists.\r\n\r\n1.4.1 beta3\r\n==============\r\n- Added parameters \"tplCondition\", \"tplOperator\" and \"conditionalTpls\".\r\n- Added parameter \"select\" for specifying needed columns of selected tables. Can be a JSON string with array.\r\n- Added parameter \"toSeparatePlaceholders\".\r\n- Improved \"pdoResources\" snippet.\r\n\r\n1.4.0 beta1\r\n==============\r\n- Ability to specify JSON string in \"sortby\", for example \"&sortby=`{\"pagetitle\":\"asc\",\"createdon\":\"desc\"}`\"\r\n- Added automatic replacement of tvs in \"where\" and \"having\" parameters.\r\n- Added automatic replacement of tvs in \"sortby\" parameter.\r\n- Removed example snippet\r\n- Added snippet \"pdoResources\", that could replace \"getResources\".\r\n- Added method pdoTools::defineChunk() for chunk of given idx.\r\n- Added \"memory usage\" in log.\r\n\r\n1.3.0\r\n==============\r\n- Improved placeholders processing when fastMode is enabled.\r\n- Added support of \"having\" conditions.\r\n\r\n1.2.1\r\n==============\r\n- Fixed not working \"includeTVs\" when \"leftJoin\" is empty.\r\n\r\n1.2.0\r\n==============\r\n- Native render of quick placeholders, such as \"<!--pdotools_introtext <blockquote>[[+introtext]]</blockquote>-->\".\r\n- Added joining of TVs in pdoFetch. Use parameter \"includeTVs\" with comma-separated list of template variables.\r\n- Added method pdoFetch::setConfig() for proper setting options when you run multiple pdoTools snippets at the one page.\r\n- Method pdoTools::makeArray is now recursive, for processing a multidimensional arrays of values.\r\n\r\n1.1.0\r\n==============\r\n- Improved getChunk function.\r\n\r\n1.0.1\r\n==============\r\n- Fixed setting total in \"chunks\" mode.\r\n- Improved displaying \"where\" condition in log.\r\n\r\n1.0.0\r\n==============\r\n- Initial release.\";s:7:\"license\";s:15504:\"GNU GENERAL PUBLIC LICENSE\r\n   Version 2, June 1991\r\n--------------------------\r\n\r\nCopyright (C) 1989, 1991 Free Software Foundation, Inc.\r\n59 Temple Place, Suite 330, Boston, MA  02111-1307  USA\r\n\r\nEveryone is permitted to copy and distribute verbatim copies\r\nof this license document, but changing it is not allowed.\r\n\r\nPreamble\r\n--------\r\n\r\n  The licenses for most software are designed to take away your\r\nfreedom to share and change it.  By contrast, the GNU General Public\r\nLicense is intended to guarantee your freedom to share and change free\r\nsoftware--to make sure the software is free for all its users.  This\r\nGeneral Public License applies to most of the Free Software\r\nFoundation\'s software and to any other program whose authors commit to\r\nusing it.  (Some other Free Software Foundation software is covered by\r\nthe GNU Library General Public License instead.)  You can apply it to\r\nyour programs, too.\r\n\r\n  When we speak of free software, we are referring to freedom, not\r\nprice.  Our General Public Licenses are designed to make sure that you\r\nhave the freedom to distribute copies of free software (and charge for\r\nthis service if you wish), that you receive source code or can get it\r\nif you want it, that you can change the software or use pieces of it\r\nin new free programs; and that you know you can do these things.\r\n\r\n  To protect your rights, we need to make restrictions that forbid\r\nanyone to deny you these rights or to ask you to surrender the rights.\r\nThese restrictions translate to certain responsibilities for you if you\r\ndistribute copies of the software, or if you modify it.\r\n\r\n  For example, if you distribute copies of such a program, whether\r\ngratis or for a fee, you must give the recipients all the rights that\r\nyou have.  You must make sure that they, too, receive or can get the\r\nsource code.  And you must show them these terms so they know their\r\nrights.\r\n\r\n  We protect your rights with two steps: (1) copyright the software, and\r\n(2) offer you this license which gives you legal permission to copy,\r\ndistribute and/or modify the software.\r\n\r\n  Also, for each author\'s protection and ours, we want to make certain\r\nthat everyone understands that there is no warranty for this free\r\nsoftware.  If the software is modified by someone else and passed on, we\r\nwant its recipients to know that what they have is not the original, so\r\nthat any problems introduced by others will not reflect on the original\r\nauthors\' reputations.\r\n\r\n  Finally, any free program is threatened constantly by software\r\npatents.  We wish to avoid the danger that redistributors of a free\r\nprogram will individually obtain patent licenses, in effect making the\r\nprogram proprietary.  To prevent this, we have made it clear that any\r\npatent must be licensed for everyone\'s free use or not licensed at all.\r\n\r\n  The precise terms and conditions for copying, distribution and\r\nmodification follow.\r\n\r\n\r\nGNU GENERAL PUBLIC LICENSE\r\nTERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION\r\n---------------------------------------------------------------\r\n\r\n  0. This License applies to any program or other work which contains\r\na notice placed by the copyright holder saying it may be distributed\r\nunder the terms of this General Public License.  The \"Program\", below,\r\nrefers to any such program or work, and a \"work based on the Program\"\r\nmeans either the Program or any derivative work under copyright law:\r\nthat is to say, a work containing the Program or a portion of it,\r\neither verbatim or with modifications and/or translated into another\r\nlanguage.  (Hereinafter, translation is included without limitation in\r\nthe term \"modification\".)  Each licensee is addressed as \"you\".\r\n\r\nActivities other than copying, distribution and modification are not\r\ncovered by this License; they are outside its scope.  The act of\r\nrunning the Program is not restricted, and the output from the Program\r\nis covered only if its contents constitute a work based on the\r\nProgram (independent of having been made by running the Program).\r\nWhether that is true depends on what the Program does.\r\n\r\n  1. You may copy and distribute verbatim copies of the Program\'s\r\nsource code as you receive it, in any medium, provided that you\r\nconspicuously and appropriately publish on each copy an appropriate\r\ncopyright notice and disclaimer of warranty; keep intact all the\r\nnotices that refer to this License and to the absence of any warranty;\r\nand give any other recipients of the Program a copy of this License\r\nalong with the Program.\r\n\r\nYou may charge a fee for the physical act of transferring a copy, and\r\nyou may at your option offer warranty protection in exchange for a fee.\r\n\r\n  2. You may modify your copy or copies of the Program or any portion\r\nof it, thus forming a work based on the Program, and copy and\r\ndistribute such modifications or work under the terms of Section 1\r\nabove, provided that you also meet all of these conditions:\r\n\r\n    a) You must cause the modified files to carry prominent notices\r\n    stating that you changed the files and the date of any change.\r\n\r\n    b) You must cause any work that you distribute or publish, that in\r\n    whole or in part contains or is derived from the Program or any\r\n    part thereof, to be licensed as a whole at no charge to all third\r\n    parties under the terms of this License.\r\n\r\n    c) If the modified program normally reads commands interactively\r\n    when run, you must cause it, when started running for such\r\n    interactive use in the most ordinary way, to print or display an\r\n    announcement including an appropriate copyright notice and a\r\n    notice that there is no warranty (or else, saying that you provide\r\n    a warranty) and that users may redistribute the program under\r\n    these conditions, and telling the user how to view a copy of this\r\n    License.  (Exception: if the Program itself is interactive but\r\n    does not normally print such an announcement, your work based on\r\n    the Program is not required to print an announcement.)\r\n\r\nThese requirements apply to the modified work as a whole.  If\r\nidentifiable sections of that work are not derived from the Program,\r\nand can be reasonably considered independent and separate works in\r\nthemselves, then this License, and its terms, do not apply to those\r\nsections when you distribute them as separate works.  But when you\r\ndistribute the same sections as part of a whole which is a work based\r\non the Program, the distribution of the whole must be on the terms of\r\nthis License, whose permissions for other licensees extend to the\r\nentire whole, and thus to each and every part regardless of who wrote it.\r\n\r\nThus, it is not the intent of this section to claim rights or contest\r\nyour rights to work written entirely by you; rather, the intent is to\r\nexercise the right to control the distribution of derivative or\r\ncollective works based on the Program.\r\n\r\nIn addition, mere aggregation of another work not based on the Program\r\nwith the Program (or with a work based on the Program) on a volume of\r\na storage or distribution medium does not bring the other work under\r\nthe scope of this License.\r\n\r\n  3. You may copy and distribute the Program (or a work based on it,\r\nunder Section 2) in object code or executable form under the terms of\r\nSections 1 and 2 above provided that you also do one of the following:\r\n\r\n    a) Accompany it with the complete corresponding machine-readable\r\n    source code, which must be distributed under the terms of Sections\r\n    1 and 2 above on a medium customarily used for software interchange; or,\r\n\r\n    b) Accompany it with a written offer, valid for at least three\r\n    years, to give any third party, for a charge no more than your\r\n    cost of physically performing source distribution, a complete\r\n    machine-readable copy of the corresponding source code, to be\r\n    distributed under the terms of Sections 1 and 2 above on a medium\r\n    customarily used for software interchange; or,\r\n\r\n    c) Accompany it with the information you received as to the offer\r\n    to distribute corresponding source code.  (This alternative is\r\n    allowed only for noncommercial distribution and only if you\r\n    received the program in object code or executable form with such\r\n    an offer, in accord with Subsection b above.)\r\n\r\nThe source code for a work means the preferred form of the work for\r\nmaking modifications to it.  For an executable work, complete source\r\ncode means all the source code for all modules it contains, plus any\r\nassociated interface definition files, plus the scripts used to\r\ncontrol compilation and installation of the executable.  However, as a\r\nspecial exception, the source code distributed need not include\r\nanything that is normally distributed (in either source or binary\r\nform) with the major components (compiler, kernel, and so on) of the\r\noperating system on which the executable runs, unless that component\r\nitself accompanies the executable.\r\n\r\nIf distribution of executable or object code is made by offering\r\naccess to copy from a designated place, then offering equivalent\r\naccess to copy the source code from the same place counts as\r\ndistribution of the source code, even though third parties are not\r\ncompelled to copy the source along with the object code.\r\n\r\n  4. You may not copy, modify, sublicense, or distribute the Program\r\nexcept as expressly provided under this License.  Any attempt\r\notherwise to copy, modify, sublicense or distribute the Program is\r\nvoid, and will automatically terminate your rights under this License.\r\nHowever, parties who have received copies, or rights, from you under\r\nthis License will not have their licenses terminated so long as such\r\nparties remain in full compliance.\r\n\r\n  5. You are not required to accept this License, since you have not\r\nsigned it.  However, nothing else grants you permission to modify or\r\ndistribute the Program or its derivative works.  These actions are\r\nprohibited by law if you do not accept this License.  Therefore, by\r\nmodifying or distributing the Program (or any work based on the\r\nProgram), you indicate your acceptance of this License to do so, and\r\nall its terms and conditions for copying, distributing or modifying\r\nthe Program or works based on it.\r\n\r\n  6. Each time you redistribute the Program (or any work based on the\r\nProgram), the recipient automatically receives a license from the\r\noriginal licensor to copy, distribute or modify the Program subject to\r\nthese terms and conditions.  You may not impose any further\r\nrestrictions on the recipients\' exercise of the rights granted herein.\r\nYou are not responsible for enforcing compliance by third parties to\r\nthis License.\r\n\r\n  7. If, as a consequence of a court judgment or allegation of patent\r\ninfringement or for any other reason (not limited to patent issues),\r\nconditions are imposed on you (whether by court order, agreement or\r\notherwise) that contradict the conditions of this License, they do not\r\nexcuse you from the conditions of this License.  If you cannot\r\ndistribute so as to satisfy simultaneously your obligations under this\r\nLicense and any other pertinent obligations, then as a consequence you\r\nmay not distribute the Program at all.  For example, if a patent\r\nlicense would not permit royalty-free redistribution of the Program by\r\nall those who receive copies directly or indirectly through you, then\r\nthe only way you could satisfy both it and this License would be to\r\nrefrain entirely from distribution of the Program.\r\n\r\nIf any portion of this section is held invalid or unenforceable under\r\nany particular circumstance, the balance of the section is intended to\r\napply and the section as a whole is intended to apply in other\r\ncircumstances.\r\n\r\nIt is not the purpose of this section to induce you to infringe any\r\npatents or other property right claims or to contest validity of any\r\nsuch claims; this section has the sole purpose of protecting the\r\nintegrity of the free software distribution system, which is\r\nimplemented by public license practices.  Many people have made\r\ngenerous contributions to the wide range of software distributed\r\nthrough that system in reliance on consistent application of that\r\nsystem; it is up to the author/donor to decide if he or she is willing\r\nto distribute software through any other system and a licensee cannot\r\nimpose that choice.\r\n\r\nThis section is intended to make thoroughly clear what is believed to\r\nbe a consequence of the rest of this License.\r\n\r\n  8. If the distribution and/or use of the Program is restricted in\r\ncertain countries either by patents or by copyrighted interfaces, the\r\noriginal copyright holder who places the Program under this License\r\nmay add an explicit geographical distribution limitation excluding\r\nthose countries, so that distribution is permitted only in or among\r\ncountries not thus excluded.  In such case, this License incorporates\r\nthe limitation as if written in the body of this License.\r\n\r\n  9. The Free Software Foundation may publish revised and/or new versions\r\nof the General Public License from time to time.  Such new versions will\r\nbe similar in spirit to the present version, but may differ in detail to\r\naddress new problems or concerns.\r\n\r\nEach version is given a distinguishing version number.  If the Program\r\nspecifies a version number of this License which applies to it and \"any\r\nlater version\", you have the option of following the terms and conditions\r\neither of that version or of any later version published by the Free\r\nSoftware Foundation.  If the Program does not specify a version number of\r\nthis License, you may choose any version ever published by the Free Software\r\nFoundation.\r\n\r\n  10. If you wish to incorporate parts of the Program into other free\r\nprograms whose distribution conditions are different, write to the author\r\nto ask for permission.  For software which is copyrighted by the Free\r\nSoftware Foundation, write to the Free Software Foundation; we sometimes\r\nmake exceptions for this.  Our decision will be guided by the two goals\r\nof preserving the free status of all derivatives of our free software and\r\nof promoting the sharing and reuse of software generally.\r\n\r\nNO WARRANTY\r\n-----------\r\n\r\n  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY\r\nFOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN\r\nOTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES\r\nPROVIDE THE PROGRAM \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED\r\nOR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF\r\nMERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS\r\nTO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE\r\nPROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,\r\nREPAIR OR CORRECTION.\r\n\r\n  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING\r\nWILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR\r\nREDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,\r\nINCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING\r\nOUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED\r\nTO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY\r\nYOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER\r\nPROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE\r\nPOSSIBILITY OF SUCH DAMAGES.\r\n\r\n---------------------------\r\nEND OF TERMS AND CONDITIONS\";s:6:\"readme\";s:666:\"--------------------\r\npdoTools\r\n--------------------\r\nAuthor: Vasiliy Naumkin <bezumkin@yandex.ru>\r\n--------------------\r\n\r\nSmall library for creating fast snippets for MODX Revolution that works through PDO.\r\n\r\nRequired by Tickets and miniShop2.\r\n\r\nMain features\r\n- Builds queries with xPDO.\r\n- Retrieve results with PDO.\r\n- Improved pdoTools::getChunk() function, that processing placeholders faster, than original modX::getChunk().\r\n\r\npdoTools snippets will work so faster, than more fields you will retrieve from database at one query.\r\n\r\n--------------------\r\nFeel free to suggest ideas/improvements/bugs on GitHub:\r\nhttp://github.com/bezumkin/pdoTools/issues\r\n\";s:9:\"signature\";s:18:\"pdotools-2.13.2-pl\";s:6:\"action\";s:26:\"workspace/packages/install\";s:8:\"register\";s:3:\"mgr\";s:5:\"topic\";s:46:\"/workspace/package/install/pdotools-2.13.2-pl/\";s:14:\"package_action\";i:0;}', 'pdoTools', 'a:38:{s:2:\"id\";s:24:\"6137262c6da2204b3e15f512\";s:7:\"package\";s:24:\"50f8468bf2455436ec00000d\";s:12:\"display_name\";s:18:\"pdotools-2.13.2-pl\";s:4:\"name\";s:8:\"pdoTools\";s:7:\"version\";s:6:\"2.13.2\";s:13:\"version_major\";s:1:\"2\";s:13:\"version_minor\";s:2:\"13\";s:13:\"version_patch\";s:1:\"2\";s:7:\"release\";s:2:\"pl\";s:8:\"vrelease\";s:2:\"pl\";s:14:\"vrelease_index\";s:0:\"\";s:6:\"author\";s:10:\"sergant210\";s:11:\"description\";s:166:\"<p>Fixed some security vulnerabilities. The \"data\" output mode of the \"return\" parameter of all snippets has been improved for use with the Fenom template engine.</p>\";s:12:\"instructions\";s:77:\"<p></p><p>For example just run:</p><p></p><p></p><p></p><p></p><p></p><p></p>\";s:9:\"changelog\";s:162:\"<a href=\"https://raw.githubusercontent.com/bezumkin/pdoTools/master/core/components/pdotools/docs/changelog.txt\" title=\"\" target=\"_blank\">See on GitHub</a><p></p>\";s:9:\"createdon\";s:24:\"2021-09-07T08:43:24+0000\";s:9:\"createdby\";s:10:\"sergant210\";s:8:\"editedon\";s:24:\"2022-04-09T08:27:17+0000\";s:10:\"releasedon\";s:24:\"2021-09-07T08:43:24+0000\";s:9:\"downloads\";s:6:\"378142\";s:8:\"approved\";s:4:\"true\";s:7:\"audited\";s:5:\"false\";s:8:\"featured\";s:5:\"false\";s:10:\"deprecated\";s:5:\"false\";s:7:\"license\";s:5:\"GPLv2\";s:7:\"smf_url\";s:0:\"\";s:10:\"repository\";s:24:\"4d4c3fa6b2b0830da9000001\";s:8:\"supports\";s:1:\"2\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=6137262c6da2204b3e15f513\";s:9:\"signature\";s:18:\"pdotools-2.13.2-pl\";s:11:\"supports_db\";s:5:\"mysql\";s:16:\"minimum_supports\";s:1:\"2\";s:9:\"breaks_at\";s:8:\"10000000\";s:10:\"screenshot\";s:97:\"http://modx.s3.amazonaws.com/extras/50f8468bf2455436ec00000d/ffe1e89f12c51f01ad55ce39b88731b1.jpg\";s:4:\"file\";a:7:{s:2:\"id\";s:24:\"6137262c6da2204b3e15f513\";s:7:\"version\";s:24:\"6137262c6da2204b3e15f512\";s:8:\"filename\";s:32:\"pdotools-2.13.2-pl.transport.zip\";s:9:\"downloads\";s:5:\"13471\";s:6:\"lastip\";s:12:\"77.222.62.31\";s:9:\"transport\";s:4:\"true\";s:8:\"location\";s:61:\"https://modx.com/extras/download/?id=6137262c6da2204b3e15f513\";}s:17:\"package-signature\";s:18:\"pdotools-2.13.2-pl\";s:10:\"categories\";s:14:\"administration\";s:4:\"tags\";s:0:\"\";}', 2, 13, 2, 'pl', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_transport_providers`
--

CREATE TABLE `mx_transport_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext,
  `service_url` tinytext,
  `username` varchar(191) NOT NULL DEFAULT '',
  `api_key` varchar(191) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `priority` tinyint(4) NOT NULL DEFAULT '10',
  `properties` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_transport_providers`
--

INSERT INTO `mx_transport_providers` (`id`, `name`, `description`, `service_url`, `username`, `api_key`, `created`, `updated`, `active`, `priority`, `properties`) VALUES
(1, 'modx.com', 'The official MODX transport provider for 3rd party components.', 'https://rest.modx.com/extras/', '', '', '2021-05-28 09:04:51', NULL, 1, 10, '');

-- --------------------------------------------------------

--
-- Структура таблицы `mx_users`
--

CREATE TABLE `mx_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `cachepwd` varchar(255) NOT NULL DEFAULT '',
  `class_key` varchar(100) NOT NULL DEFAULT 'modUser',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `remote_key` varchar(191) DEFAULT NULL,
  `remote_data` text,
  `hash_class` varchar(100) NOT NULL DEFAULT 'hashing.modNative',
  `salt` varchar(100) NOT NULL DEFAULT '',
  `primary_group` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `session_stale` text,
  `sudo` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_users`
--

INSERT INTO `mx_users` (`id`, `username`, `password`, `cachepwd`, `class_key`, `active`, `remote_key`, `remote_data`, `hash_class`, `salt`, `primary_group`, `session_stale`, `sudo`, `createdon`) VALUES
(1, 'admin', '$2y$10$ozetVatFbjgzMt9i4w5EROsYbVY/9dTd3x4OnsurouCUnp3xdMXQu', '', 'modUser', 1, NULL, NULL, 'hashing.modNative', 'c306cb4f686667ea9dd660ac3c43995c', 1, 'a:2:{i:0;s:3:\"mgr\";i:1;s:3:\"web\";}', 1, 1649492122);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_user_attributes`
--

CREATE TABLE `mx_user_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `internalKey` int(10) NOT NULL,
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0',
  `address` text NOT NULL,
  `country` varchar(191) NOT NULL DEFAULT '',
  `city` varchar(191) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(191) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `website` varchar(191) NOT NULL DEFAULT '',
  `extended` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_user_attributes`
--

INSERT INTO `mx_user_attributes` (`id`, `internalKey`, `fullname`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `address`, `country`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `website`, `extended`) VALUES
(1, 1, 'Администратор', 'uroboros@sportcrm.club', '', '', 0, 0, 0, 18, 1649583744, 1649583887, 0, 'fc4c4001413c7fa665051bf57feb40bb', 0, 0, '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_user_group_roles`
--

CREATE TABLE `mx_user_group_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT '9999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_user_group_roles`
--

INSERT INTO `mx_user_group_roles` (`id`, `name`, `description`, `authority`) VALUES
(1, 'Member', NULL, 9999),
(2, 'Super User', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mx_user_group_settings`
--

CREATE TABLE `mx_user_group_settings` (
  `group` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(50) NOT NULL,
  `value` text,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(191) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_user_messages`
--

CREATE TABLE `mx_user_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(191) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `date_sent` datetime DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_user_settings`
--

CREATE TABLE `mx_user_settings` (
  `user` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(191) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mx_workspaces`
--

CREATE TABLE `mx_workspaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `path` varchar(191) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `attributes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mx_workspaces`
--

INSERT INTO `mx_workspaces` (`id`, `name`, `path`, `created`, `active`, `attributes`) VALUES
(1, 'Default MODX workspace', '{core_path}', '2022-04-09 11:15:21', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ur_city`
--

CREATE TABLE `ur_city` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ur_city`
--

INSERT INTO `ur_city` (`id`, `name`) VALUES
(1, 'Краснодар'),
(2, 'Сочи'),
(3, 'Анапа'),
(4, 'Геленджик'),
(5, 'Армавир'),
(6, 'Апшеронск'),
(7, 'Тимашевск');

-- --------------------------------------------------------

--
-- Структура таблицы `ur_config`
--

CREATE TABLE `ur_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `val` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ur_config`
--

INSERT INTO `ur_config` (`id`, `name`, `val`) VALUES
(1, 'idIncome_main', '10'),
(2, 'idOutcome_main', '15');

-- --------------------------------------------------------

--
-- Структура таблицы `ur_files`
--

CREATE TABLE `ur_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` char(36) NOT NULL DEFAULT '',
  `uid` char(36) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `filetype` varchar(50) NOT NULL DEFAULT '',
  `fileext` varchar(12) NOT NULL DEFAULT '',
  `author` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `incloud` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ur_income`
--

CREATE TABLE `ur_income` (
  `id` int(10) UNSIGNED NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `source` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `medobj` int(11) NOT NULL DEFAULT '0',
  `info` text,
  `totype` int(11) NOT NULL DEFAULT '0',
  `tel` varchar(25) DEFAULT '',
  `email` varchar(150) DEFAULT '',
  `zip` varchar(6) DEFAULT '',
  `address` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dateoutcome` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ur_income`
--

INSERT INTO `ur_income` (`id`, `num`, `status`, `source`, `name`, `medobj`, `info`, `totype`, `tel`, `email`, `zip`, `address`, `created`, `author`, `dateoutcome`) VALUES
(1, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что г. на горячую линию обратилась клиент ФИО, телефон) с жалобой на ПЗ Сочи.  Клиент (дата) обратилась в указанный ПЗ с вопросом сдачи биоматериала на ряд исследований , в том числе комплексных пакетов.  Клиент недовольна тем, что в ПЗ пациенты находились без масок и перчаток, сотрудник на регистратуре также работала без перчаток. Клиент также недовольна тем, что сотрудник разговаривала с клиентом нехотя, отказывалась консультировать клиента, объясняя отказ тем, что «зависает» компьютер, пока клиент не пригрозила оставить жалобу. В середине разговора сотрудник ушла в туалет. После посещения туалета сотрудник не обработала руки при пациенте.  Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:44', 1, NULL),
(2, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратился клиент (ФИО, тел.) с жалобой на ПЗ. Клиент обратился  в указанный ПЗ (дата) для сдачи биоматериала на ряд исследований. Клиент предъявил сотруднику ПЗ 2 подарочных сертификата арендодателям номиналом 1000р. каждый для оплаты заказа. Клиент недоволен тем, что сотрудник в общении с клиентом позволяла себе «хамство», отказалась принимать сертификаты в качестве оплаты.   Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:44', 1, NULL),
(3, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратилась клиент (ФИО, тел.) с жалобой на правила предоставления услуги «Выезд на дом». Клиент оформила услугу «Выезд на дом медицинской сестры» на (дата) Клиент недовольна тем, что ожидать медсестру необходимо с 7:00 до 12:00.  Клиент не смогла дождаться медицинской сестры по причине приема лекарственных препаратов по беременности и отменила вызов.  Клиент просит разобраться и принять меры.   Ждет звонка администрации', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(4, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратилась клиент (ФИО, тел.) с жалобой на ПЗ.  Клиент недовольна качеством обслуживания. Клиенту удобно обращаться в указанный ПЗ. Клиент недовольна тем, что сотрудник общается неприветливо, не отвечает на вопросы   клиента по   подготовке и правилах сбора и хранения биоматериала. Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(5, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратился клиент (ФИО, тел.) с жалобой на ПЗ. Жена клиента ФИО  обратилась  в указанный ПЗ  (дата) по предварительной записи на УЗИ – обследование.  Клиент недоволен тем, что врач УЗИ в этот день не вел прием.  Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(6, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратилась клиент (ФИО, тел.) с жалобой на ПЗ.  Клиент обратилась  в указанный ПЗ (дата) во второй половине для сдачи биоматериала  своему ребенку.   Клиент недовольна тем, что в указанном ПЗ ведется прием на исследование «Коронавирус». Клиент также недовольна тем, что на сайте компании и в других источниках не размещена информация о режиме приема биоматериала на стандартные исследования и на исследование «Коронавирус». Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(7, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратился клиент (ФИО, тел.) с жалобой на ПЗ. Клиент обратился в указанный ПЗ (дата) в 12:00 по предварительной записи для сдачи биоматериала на исследование «Коронавирус». Клиент недоволен тем, что сотрудник отказала клиенту в приеме биоматериала, объяснив отказ тем, что ПЗ закрыт под обслуживание корпоративных клиентов. Клиент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(8, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратилась клиент (дата) с жалобой на ПЗ.  Клиент обратилась  в указанный ПЗ (дата) до 12:00 для сдачи биоматериала.   Клиент недовольна тем, что сотрудник отказала клиенту в приеме биоматериала, объяснив отказ тем, что начала обслуживание клиентов организации. Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(9, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратилась клиент (ФИО, тел.) с жалобой на оператора контакт-центра.  Клиент (дата) обратилась на горячую линию с вопросом сдачи биоматериала на ряд исследований в г. Анапа. Оператор проинформировала клиента о том, что биоматериал на исследования она может сдать до 12:00.  Клиент (дата). в 11:50 обратился в ПЗ Анапа. Клиент недоволен тем, что в ПЗ уже велось оформление  пациента на исследование «Короновирус». Сотрудник ПЗ попросила клиента подождать на улице. Клиент повторно обратилась на горячую линию. Оператор предложила клиенту обратиться в другой ПЗ  до 14:00. Клиент недовольна тем, что в предложенном ПЗ клиенту также отказали. Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(10, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что (дата) на горячую линию обратилась клиент (ФИО, тел.) с жалобой на выездную медсестру.  Клиент оформила услугу «Выезд медицинской сестры на дом» на (дата). Клиент для получения результата указала сотруднику адрес электронной почты. Клиент недовольна тем, что сотрудник не внесла в заказ электронную почту. По этой причине клиент не смогла получить результат. Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(11, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент (ФИО, тел.) с жалобой на качество обслуживания ПЗ Сочи.  Клиент дважды обращалась  в указанный ПЗ 30.04.2020 г. для сдачи биоматериала и 04.05.2020 г. за результатом исследования. Клиент недовольна тем, что сотрудник указанного ПЗ позволяет себе общаться с клиентом грубо и неприветливо. Также сотрудник грубо отказывала клиенту в просьбе посетить санузел и клиенту пришлось ругаться с сотрудником.  Клиент считает подобное отношение недопустимым.  Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(12, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент (ФИО, тел.) с жалобой на ПЗ Ейск.  Клиент обратилась в указанный ПЗ для сдачи биоматериала на исследование «Коронавирус». Клиент недовольна тем, что сотрудник ПЗ сфотографировала паспорт клиента на личный телефон. Клиент считает это нарушением. Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(13, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратился клиент (ФИО, тел. ) с жалобой на задержку выдачи результата.  Клиент обратился  в   ПЗ  для сдачи биоматериала на исследование «Коронавирус».   Клиент недоволен тем, что 13.05.2020 г. исследование  не было выполнено. Клиент считает, что лаборатория нарушает сроки выполнения исследования – 2 рабочих дня. Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:45', 1, NULL),
(14, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент (ФИО, тел) с жалобой на ПЗ.  Клиент обратилась в указанный ПЗ для сдачи биоматериала на исследование «Коронавирус».  Клиент недовольна тем, что при оформлении заказа сотрудник сфотографировала паспорт на свой личный телефон и отправила фотографию. На просьбу клиента показать инструкцию, в которой прописано, что клиент имеет право фотографировать паспорт на личный телефон, сотрудник ничего не смогла ответить. Со слов клиента, сотрудник «в грязной зоне» по правилам отсканировала паспорт клиента. Сотрудник предупредила клиента о том, что программа зависает и фотография может не получиться. Если фотография не получится, то анализ не будет выполнен.   Клиент просит разобраться и принять меры.   Клиент просит срочную обратную связь от администрации для уточнения информации прошло ли оформление заказа.', 0, '', '', '', NULL, '2022-04-10 09:50:46', 1, NULL),
(15, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент (ФИО, тел) с жалобой на ПЗ.  Клиент обратилась в указанный ПЗ для сдачи биоматериала.  Клиент недовольна тем, что сотрудник сфотографировала паспорт клиента на свой личный телефон. Клиент считает грубым нарушением то, что в личном устройстве сотрудника хранятся персональные данные клиента. Клиент просит удалить свои данные в устройстве сотрудника. Клиент считает, что  филиалы должны быть оснащены специальной техникой для сканирования документов.  Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:46', 1, NULL),
(16, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент (ФИО, тел) с жалобой на ПЗ.  Клиент  обратилась в указанный ПЗ для сдачи биоматериала на гистологическое исследование соскоба из полости матки своей маме  ФИО. Сотрудник проинформировала клиента о том, что анализ будет готов (дата). Клиент для уточнения информации обратилась на горячую линию. Оператор проинформировала клиента, что указанное исследование выполняется в течение 10 дней. Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:46', 1, NULL),
(17, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент (ФИО тел) с жалобой на оператора контакт-центра.  Клиент обратилась  на горячую линию с вопросом режима приема биоматериала в ПЗ Сочи. Оператор проинформировала клиента о том, что прием биоматериала на исследования осуществляется до 17:00. При обращении клиента  в указанный ПЗ, сотрудник ПЗ проинформировала клиента о том, что прием биоматериала до 12:00. Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:46', 1, NULL),
(18, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратился клиент (ФИО, тел) с жалобой на.  Клиент обратился  в указанный ПЗ для сдачи биоматериала на исследование «Коронавирус».   Клиент недоволен тем, что сотрудник неверно внесла дату рождения клиента и адрес электронной почты. Клиент не смог получить результат. Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:46', 1, NULL),
(19, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент (ФИО, тел) с жалобой на качество выполнения исследования. Свекровь клиента обратилась в   ПЗ Тимашевск   для сдачи биоматериала на исследование  «Коронавирус».  Тест показал положительный результат. Клиента госпитализировали в инфекционную больницу, родственники сидят на карантине. В инфекционной больнице   на указанное исследование анализ показал отрицательный результат, но врачи приняли решение продлить нахождение клиента в инфекционной больнице до 14 дней.  Клиент считает результат нашей лаборатории неверным. Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:47', 1, NULL),
(20, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратился клиент с жалобой на неверно предоставленную информацию оператором контакт-центра.  Клиент  обратился на горячую линию с вопросом о сроках выполнения исследования «ПЦР Коронавирус». Оператор проинформировала клиента о том, что указанное исследование выполняется 2 рабочих дня, не считая дня сдачи. Клиент обратился в ПЗ  для сдачи биоматериала. Клиент недоволен тем, что получил результат раньше озвученного срока –  Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:47', 1, NULL),
(21, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на сайт компании обратилась клиент с жалобой на ПЗ. Отзыв следующего содержания: «Сегодня, сдавали тест на covid 19,  нас обслуживала работник вашей клиники Крайне неприятная женщина , хамила , грубила , не обращала внимания на вопросы какие ей задают ,хотела бы что б приняли соотвествующие меры к данному сотруднику.  Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:47', 1, NULL),
(22, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент с жалобой на ПЗ.  Клиент обратилась   в указанный ПЗ  для сдачи биоматериала на исследование «Коронавирус» своему ребенку. Сотрудник Роспотребнадзора по телефону проинформировал клиента о положительном результате. Клиент при оформлении заказа указала регистратору адрес электронной почты. Клиент недовольна тем, что  не получила результат на E-mail. Клиент просит разобраться и принять меры. Ждет    звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:47', 1, NULL),
(23, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратился клиент  с жалобой на оператора контакт-центра.  Клиент  обратился на горячую линию с вопросом сдачи биоматериала на ряд исследований.  После чего Клиент обратился в ПЗ для сдачи. Клиент недоволен тем, что оператор назвала итоговую сумму значительно ниже той, которую озвучил к оплате сотрудник ПЗ.  Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:48', 1, NULL),
(24, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что  на горячую линию обратилась клиент с жалобой на ПЗ Сочи,  Клиент обратилась  в указанный ПЗ в 9:20 для сдачи биоматериала.  Клиент недовольна тем, что указанный ПЗ был закрыт.  Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:48', 1, NULL),
(25, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на сайт компании обратилась клиент с отзывом следующего содержания на ПЗ:  «Добрый день. Пришла на сдачу анализов в 8.00. 20 минут прошло чтобы оформили. 30 минут сижу жду чтобы просто сдать кровь. Скорость обслуживания не отличается от бесплатной медицины».', 0, '', '', '', NULL, '2022-04-10 09:50:48', 1, NULL),
(26, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратился клиент с жалобой на сроки выполнения исследования. Клиент обратился в ПЗ для сдачи биоматериала на исследование «Короновирус». Клиент был проинформирован, что исследование выполняется в течении 2-х рабочих дней. Клиент недоволен тем, что исследование было выполнено. Клиента не устраивает дата формирования документа по причине того, что по месту требования годность анализа 3 дня. Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:48', 1, NULL),
(27, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент с жалобой на ПЗ.  Клиент  обратилась в указанный ПЗ для сдачи биоматериала на исследование «Копрограмма» своему ребенку. Клиенту пришлось ожидать в общей очереди около часа по причине того, что в ПЗ велся прием биоматериала на COVID-19 по предварительной записи. Клиент недовольна тем, что в ПЗ не размещена информация об ограничениях по времени в приеме биоматериала на стандартные исследования. Клиент считает, что филиалы лаборатории должны принимать биоматериал в рабочие часы без ограничений «через одного».  Клиент просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(28, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию    обратился   клиент  с жалобой  на качество выполнения исследований. Сын клиента обратился в ПЗ для сдачи биоматериала на исследование «Коронавирус». Клиент был проинформирован по телефону сотрудником Роспотребнадзора «с однозначным утверждением, что сын болен COVID-19. Также сотрудник проинформировал клиента о необходимости соблюдать карантин всем членам семьи.   Заключение аккредитованного испытательного лабораторного центра: РНК коронавируса 2019-nCoV  НЕ ОБНАРУЖЕНА. Клиент недоволен тем, что по причине положительного результата нашей тест-системы Семену Сергеевичу пришлось отменить командировку. Клиент просит разобраться. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(29, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент с жалобой на ПЗ.  Клиент  обратилась  в указанный ПЗ с мужем  для сдачи биоматериала на ряд исследований. Клиент недовольна тем, что сотрудник не внесла адрес электронной почты в заказ. По этой причине клиент не получила результаты сразу по готовности.   Клиент просит разобраться и принять меры.   Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(30, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась клиент с жалобой на ПЗ.  Клиент обратилась  в указанный ПЗ  для сдачи биоматериала.   Клиент недовольна тем, что сотрудник отказала в приеме биоматериала, объяснив отказ тем, что  филиал не работает.  Клиент просит разобраться и принять меры. Ждет   звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(31, 0, 10, 0, '', 0, 'Суть претензии - Мед. работник находится в филиале без индивидуальных средств защиты (без маски, без перчаток).  Пациент отмечает, что данная претензия направлена на улучшение качества обслуживания в филиале. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(32, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась. Обратилась в ПЗ в 8.30, но так и не приняли анализ на антитела к коронавирусу, т.к. был 1 регистратор, большая очередь. Также клиент указал на несоблюдение социальной дистанции, у регистратора был кашель.', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(33, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась в ПЗ  (записывалась онлайн). Со слов клиента в ПЗ медсестра просто отказывает в приеме, объяснив тем, что «Вам этот анализ не нужен; зачем будете тратить деньги; мы такой анализ не выполняем». У пациента была запись онлайн, в итоге сдать не смогли. Признаков простудных заболеваний, контакта с заболевшими с Ковид у пациента нет. Анализ необходим был для госпитализации. Также со слов пациентов, повторяется неоднократно, ранее клиент сдавала и сдать анализ получилось только после выяснений отношений с мед. работником данного филиала.', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(34, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась в ПЗ  очень холодно, медсестры постоянно одеваются, раздеваются, что замедляет их работу. Пациент просит «устранить проблему».', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(35, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась Пациентка недовольна тем, что при обращении в  ПЗ для сдачи анализа по предварительной записи  пациентка не смогла пройти по своему времени из-за очереди. Пациентка является кормящей мамой и для нее было важно пройти по времени. Сотрудник на встречу пациентке не пошла. Пациентке пришлось ожидать своей очереди на улице. Также пациентка. недовольна тем, что большинство пациентов были без масок. Пациентка просит разобраться и принять меры. Ждет срочного звонка администрации', 0, '', '', '', NULL, '2022-04-10 09:50:49', 1, NULL),
(36, 0, 10, 0, '', 0, 'Суть претензии  –   пациент обратился в ПЗ в 8:30, ожидал очередь до 10:30, сдать биохимические исследования. Мед.сестра в итоге отказала в приеме. (сказав, с 10:30 запись на ковид, принять не успеет) Пациент оставил жалобу, почему почему, после длительного ожидания своей очереди он не смог сдать анализ.', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(38, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратился  .  Пациент дважды  обращался в ПЗ Тихорецк  в утренние часы до 10:30 для сдачи биоматериала на антитела к Коронавирусу.  Пациент недоволен тем, что сотрудник дважды отказала пациенту в приеме биоматериала, объяснив отказ тем, что анализ сдается по предварительной записи. Сотрудник горячей линии проинформировал пациента, что указанное исследование принимается в порядке живой очереди до 10:30. У пациента от сложившейся ситуации поднялось давление.  Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(40, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратился пациент. Пациенты обратились в ПЗ (Краснодар) примерно в 13-14 часов с грудным ребенком для сдачи анализов. В грубой форме было сказано медсестрой, что сдавать анализы необходимо утром, т.к. на момент обращения там сдавали анализы на ковид. Пациенты возмущены формой отказа.', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(41, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась ФИО.  пациент сдавала биоматериал на исследование антимюллеров гормон. Пациент обратилась в стороннюю лабораторию, где показатели в результате отличались. Пациент считает, что анализ был в нашей лаборатории был выполнен неверно', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(42, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент: Регистратор в ПЗ не корректно внес адрес электронной почты. В том числе, пациент обращает внимание, что в момент обращения регистратор попросил ожидать на улице, хотя в помещении находился 1 человек. Уточняет, на каком основании?', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(43, 0, 10, 0, '', 0, 'пациент сдавал анализы в ПЗ. Пациент недовольна задержкой выдачи результата на исследование «Макропролактин» (срок выполнения – 3 дня). По этой причине пациент не смогла попасть на прием к своему врачу.', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(44, 0, 10, 0, '', 0, 'Пациентка обратилась в ПЗ для записи на ковид и консультации по цене. Она возмущена тем, что пациентов принимают без масок, огромное столпотворение людей. У медсестры нет бейджика, работает без перчаток. Со слов пациентки медсестра очень долго отказывалась записывать пациентку на ПЦР Ковид, мотивируя это тем, что у нее очень много пациентов, а пациентка в свою очередь отказывалась записываться самостоятельно, т.к. она такой же пациент и отстояла свою очередь. На просьбу пациентки рассказать о подготовке к анализу была вызвана медсестра, которая берет анализы и, не снимая перчатки, она начала искать документы. Так же пациентка недовольна тем, что подготовку к анализу ей распечатали на листе и сообщили, что цена на анализ указана на двери ПЗ, т.к. считает, что все это ей должны были озвучить в слух. Требует донести до медсестер, что они должны оказывать ей полную консультацию, т.к. онлайн ей это делать неудобно.', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(45, 0, 10, 0, '', 0, 'Пациент не первый раз обращается в ПЗ для того, чтобы написать заявление на получение документов для налогового вычета. По словам пациента медсестры каждый раз ей отказывают. «То нет копий документов, то не работает принтер, то время не подходящее».', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(46, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Регистратор не корректно внес адрес электронной почты. По этой причине пациент не смог получить результат сразу по готовности.', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(47, 0, 10, 0, '', 0, 'Пациент недовольна тем, что сотрудник отказала в приеме биоматериала на ОАК (капиллярная кровь ребенок 1 месяц). Пациент заранее ознакомилась с информацией на сайте и на горячей линии.   Пациент проживает за городом, много времени провела в дороге и крайне недовольна отказом.   Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:50', 1, NULL),
(48, 0, 10, 0, '', 0, 'Долгое ожидание в ПЗ. Один сотрудник регистрирует, проводит забор анализов', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(49, 0, 10, 0, '', 0, 'Для сдачи анализов обращалась ФИО в ПЗ. Пациент просит наладить работу ПЗ и провести работу с сотрудниками. Сотрудники отказали во взятии анализов т.к пришли без записи на сдачу крови в 14.00 (со слов пациента в ПЗ никого не было, но кровь не взяли), пациентам сообщили что, без записи принимают с 7 до 11. На след день приехали в 6.30, когда пришел сотрудник, то сообщил, что сегодня принимают Сбербанк, других – нет. Пациент недоволен работой ПЗ, сотрудники относятся к людям нехорошо и не говорят точную информацию, считает, что это ненормально, что приходится повышать голос и требовать, чтобы взяли анализ по живой очереди.', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(50, 0, 10, 0, '', 0, 'Пациент был записан в ПЗ на сдачу анализа ПЦР на коронавирус, пришел раньше на 15 минут. Медсестра с криками пациента выгнала, в ПЗ никого не было, не разрешила даже посидеть в тепле.', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(51, 0, 10, 0, '', 0, 'При обращении в ПЗ медсестра вела себя очень грубо. Пациентке настолько не понравилось обращение медсестры, что она решила обратиться за анализом в другую лабораторию.Просит донести до медсестры, что нельзя себя так вести с пациентами.', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(52, 0, 10, 0, '', 0, 'При обращении в ПЗ клиент указал какие необходимо пройти анализы. В итоге не был проведен ОАК, его не внесли в заказ. В ПЗ объяснили, что необходимо повторно обратиться и провести забор крови. Но клиент не согласен, т.к. ребенку (пациенту) 2 года.', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(53, 0, 10, 0, '', 0, 'Пациента не устраивает, что анализ пцр коронавирус выполнен ранее указанных сроков, сдавал анализ.', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(54, 0, 10, 0, '', 0, 'Постоянный пациент недовольна тем, что в ПЗ работает только 1 сотрудник. По этой причине оформление идет очень медленно, пациенты длительно ожидают свою очередь на улице на холоде. Пациент считает, что администрация не уважает своих пациентов. Пациент просит разобраться и принять меры. Ждет звонка администрации в течении 2-х рабочих дней.', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(55, 0, 10, 0, '', 0, 'Пациент обратился в ПЗ, медсестра пропускала вперед других, хотя по очереди был данный пациент, грубила', 0, '', '', '', NULL, '2022-04-10 09:50:51', 1, NULL),
(56, 0, 10, 0, '', 0, 'Суть претензии  – пациент был записан на 14.00 на сдачу анализа ПЦР Коронавирус,подошел к назначенному времени, медсестра сказала ожидать на улице, пациент простоял час, медсестра вышла и отказала в приеме так как время пациента уже прошло. Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:52', 1, NULL),
(57, 0, 10, 0, '', 0, 'Пациент требует навести порядок в кадрах, считает, что один сотрудник, который работает в ПЗ не имеет права брать кровь, мазки и заниматься оформлением.', 0, '', '', '', NULL, '2022-04-10 09:50:52', 1, NULL),
(58, 0, 10, 0, '', 0, 'В ПЗ отказали в безналичной оплате, отправили за наличными деньгами. После оплаты наличными позвонил еще раз, чтобы оставить вторую жалобу - не выдали кассовый чек. Сообщил, что составил жалобу в министерство здравоохранения.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(59, 0, 10, 0, '', 0, 'Пациент недоволен качеством обслуживания в ПЗ, очередь движется очень медленно, людей очень медленно принимают, пациент намерен жаловаться в Роспотребнадзор, требовать лишения лицензии, очень ждет обратной связи от руководства', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(60, 0, 10, 0, '', 0, 'В ПЗ один человек выполняет все функции и регистратор  и медсестра и уборщица, людей в здание не пускает, люди в очереди  стоят на морозе по 40 минут, т.к сотрудник выходит в другой кабинет.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(61, 0, 10, 0, '', 0, 'Пациент обратился в ПЗ. Очень большая очередь, нет дистанции, 2 часа ждала в очереди, сдать анализы не смогла. Пациенты по 3 дня ездят в этот ПЗ, но сдать анализы не могут. Примите меры, добавьте сотрудников, чтобы изменить ситуацию. Обратной связи не надо.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(62, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент:  Анализ «Посев на условно-патогенную микрофлору» от (дата)  не выполнен в заявленный  срок.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(63, 0, 10, 0, '', 0, 'Пациенты недовольны тем, что в данном ПЗ хамское отношение медсестры, медсестра не представляется и не носит бейдж.  обратилась бабушка, медсестра не объяснила, что скидку можно получить только при предъявлении ПУ, на след день обратился отец, вновь хамское отношение, медсестра сказала, что договор имеет право заполнять только отец и дочь не может вносить никакие данные.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(64, 0, 10, 0, '', 0, 'Пациентка пришла в ПЗ, прождала на улице своей очереди, в 10.15 м/с отказалась взять анализ на антитела коронавирус. Медсестра сказала «мне некогда, приходите завтра». В ПЗ было всего 2 человека.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(65, 0, 10, 0, '', 0, 'Пациент недоволен тем, что исследования код: 796 и 797 от (дата) не были выполнены в срок, установленный лабораторией. По этой причине пациент не сможет начать обучение в учреждении. Пациент считает, что лаборатория не выполнила свои обязательства. Пациент просит разобраться и принять меры. Ждет срочного звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(66, 0, 10, 0, '', 0, 'Пациент недовольна тем, что ПЗ Сочи, в 7:15 был закрыт. Пациент крайне недовольна ситуацией. Просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:53', 1, NULL),
(67, 0, 10, 0, '', 0, 'Пациент недоволен тем, что в результате исследования на антитела к  коронавирусу Ig M стоит высокий показатель. Со слов пациента с таким показателем у него должно быть плохое самочувствие. Пациент считает, что это не его результат.', 0, '', '', '', NULL, '2022-04-10 09:50:54', 1, NULL),
(68, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – пациент в ПЗ сдавал анализ мочи общий, анализ мочи по Нечипоренко, результат анализа пришел идеальный. Пациент пересдал в другой лаборатории анализ, результат оказался очень «плохой», считает, что лаборатория ставит ее жизнь под угрозу, будет жаловаться в все инстанции', 0, '', '', '', NULL, '2022-04-10 09:50:54', 1, NULL),
(69, 0, 10, 0, '', 0, 'Пациент был записан через сайт. При обращении в ПЗ, медсестра уточнила: «Вы планируете сдать мазок или кровь?». Пациент сообщил, что интересует анализ на антитела. Со слов пациента, медсестра порекомендовала сдать ПЦР Коронавирус. По итогу, был произведен забор в качестве мазка. Получив результат, пациент думал, что в результате ПЦР Коронавирус будет указана информация по антителам.', 0, '', '', '', NULL, '2022-04-10 09:50:54', 1, NULL),
(70, 0, 10, 0, '', 0, 'Пациентка недовольна тем, что в ПЗ очень медленно принимают пациентов. В ПЗ пришла к 8.00 до 10.30 так и не смогла сдать анализы. Звонила с данной жалобой дважды.', 0, '', '', '', NULL, '2022-04-10 09:50:54', 1, NULL),
(71, 0, 10, 0, '', 0, 'пациенты сдавали анализы на антитела к коронавирусу в ПЗ. Пациентка недовольна тем, что результаты исследований ее и мужа одинаковые. Соединяли с врачом-консультантом, но пациентка требует еще пояснений', 0, '', '', '', NULL, '2022-04-10 09:50:54', 1, NULL),
(72, 0, 10, 0, '', 0, 'Довожу до Вашего сведения, что на горячую линию обратилась ФИО. На (дата) оформляли вызов медсестры на дом для пациента. Ожидали медсестру, для сдачи анализов на дому с 7.00 – 13.00. Медсестра предупредила в 13:10, что задерживается из-за пробок в городе. Клиент позвонила на ГЛ в этот же день в 13:20, не поверила, что в городе пробки. Была недовольна, что столько времени пациент без еды, ожидать не может. Агрессивная.', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(73, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – сдавали анализы 3 человека, лаборатория выдала 2 результата. Из-за этого не впустили на самолет, просит без оплаты произвести повторное тестирование 3х человек.', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(74, 0, 10, 0, '', 0, 'Пациентка обратилась в ПЗ  в 15 часов, но приняли анализ около 16 часов, жалоба на долгое обслуживание, также медсестра не смогла взять анализы на антитела к коронавирусу. Со слов пациента, медсестра исколола все вены и посоветовала обратиться завтра к другому специалисту.  Пациент просит разобраться и предоставить скидку. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(75, 0, 10, 0, '', 0, 'Пациент обратился в ПЗ. Медсестра грубо общается, торопит пациентов. Просит помощи у пациентов (подать пробирки) со слов обратившего.', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(76, 0, 10, 0, '', 0, 'Обратился пациент с жалобой на отсутствие на горячей линии врача-консультанта (врач одна, рабочий день сокращен, находится в отпуске). По этой причине пациент не может воспользоваться услугой интерпретации результата. Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(77, 0, 10, 0, '', 0, 'Пациент недовольна тем, что при платном обращении за консультацией к врачу, на приеме выяснилось, что сотрудник ПЗ распечатала не те результаты (от прошлогодней даты). Также пациент недовольна тем, что сотрудник допустила ошибку при внесении адреса электронной почты. По этой причине пациент не получила результаты сразу по готовности. Со слов пациента код для получения результата смс сообщением она не получала, документы об оплате не с собой. Пациент недовольна, что зря заплатила врачу за прием.', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(78, 0, 10, 0, '', 0, 'Пациент недоволен тем, что в ПЗ находится только одна медсестра и она очень медленно обслуживает пациентов (около 5 человек в час). Образовалась большая очередь, около 10 человек ждали на улице. Пациент считает, что на ПЗ необходим администратор для оформления документов.', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(79, 0, 10, 0, '', 0, 'Пациентка была записана от организации Сбербанк в ПЗ на сдачу пцр коронавирус. Клиент находилась в данном ПЗ с 14.00 до 14.40. Медсестра отказывалась принимать анализ, ссылаясь на то , что \"плохо печатает принтер, в три часа придут другие клиенты, для которых нужно оставить краску\".', 0, '', '', '', NULL, '2022-04-10 09:50:55', 1, NULL),
(80, 0, 10, 0, '', 0, 'Пациент обращался в ПЗ. При оформлении электронную почту внесли с ошибкой, пациент не получил результат. Также пациент недоволен сроком выполнения анализа (анализ был выполнен раньше).', 0, '', '', '', NULL, '2022-04-10 09:50:56', 1, NULL),
(81, 0, 10, 0, '', 0, 'Пациент возмущен, что лаборатория приняла у нее анализ на ковид для госпитализации, зная, что вышел новый закон, в котором говорится, что для госпитализации ПЦР мазок не требуется, хотя в других лабораториях об этом предупреждают. Также пациент недоволен, что на всю лабораторию, только один консультирующий врач, расшифровку анализа она не может дождаться уже 2 дня. Пациент просит разобраться и вернуть денежные средства. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:56', 1, NULL),
(82, 0, 10, 0, '', 0, 'Со слов пациентки длительное время она пытается дозвониться до ПЗ и записаться на прием к педиатру, но на ПЗ никто не берет трубку. Также оператор брал ее контактные данные, передавал в ПЗ, но звонка по-прежнему не поступило. При обращении лично в ПЗ ее отказались записывать к врачу.', 0, '', '', '', NULL, '2022-04-10 09:50:56', 1, NULL),
(83, 0, 10, 0, '', 0, 'Пациент обратился в ПЗ, жалуется на хамское поведение сотрудника, медсестра и регистратор в одном лице, безразлично взят анализ на Ковид («чуть помазала и все»).', 0, '', '', '', NULL, '2022-04-10 09:50:56', 1, NULL),
(84, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  при оформлении заказа указали неверные данные (ФИО), зарегистрировали заказ на сына, вместо отца. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:56', 1, NULL),
(85, 0, 10, 0, '', 0, 'Пациент обратился в указанный ПЗ для сдачи анализа своему ребенку. Пациент недоволен тем, что свою очередь приходится ждать на улице под снегопадом на морозе.  Пациент считает, что в данном случае необходима предварительная запись. Просит разобраться и принять меры', 0, '', '', '', NULL, '2022-04-10 09:50:57', 1, NULL),
(87, 0, 10, 0, '', 0, 'Пациент просит разобраться и принять меры. Ждет звонка администрации', 0, '', '', '', NULL, '2022-04-10 09:50:57', 1, NULL),
(89, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент– Пациент хотел записаться на узи, по телефону сотрудник ПЗ нахамил, на узи не записали, не предложили никакого времени.', 0, '', '', '', NULL, '2022-04-10 09:50:57', 1, NULL),
(90, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Чтобы сотрудники ПЗ были более внимательные, давала сотруднику лист с назначенными анализами, ей внесли и взяли не все анализы, считает, что она сама не обязана ничего проверять.', 0, '', '', '', NULL, '2022-04-10 09:50:58', 1, NULL),
(91, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Что бы в ПЗ работали квалифицированные сотрудники, которые могут назначить анализы (информацию о том, что медсестра не является врачом и не может назначить анализы не слышит), в разговоре позволяет себе оскорблять сотрудника ПЗ.', 0, '', '', '', NULL, '2022-04-10 09:50:58', 1, NULL),
(93, 0, 10, 0, '', 0, '', 0, '', '', '', NULL, '2022-04-10 09:50:58', 1, NULL),
(95, 0, 10, 0, '', 0, 'Пациент недоволен тем, что в результате исследования на английском языке у клиента допущена ошибка. Также пациент недоволен тем, что в результатах не внесены паспортные данные. Пациент утверждает, что сотрудники при оформлении пообещали ему, что в результат паспортные данные будут внесены. Просит разобраться. Ждет срочной обратной связи, у пациента завтра вылет.', 0, '', '', '', NULL, '2022-04-10 09:50:58', 1, NULL),
(96, 0, 10, 0, '', 0, 'Пациент обратилась в ПЗ за получением результата, но ей отказали, так как проводится забор исследования на Ковид-19 у сотрудников Сбербанка. Также, один человек регистрирует и проводит забор анализов, в связи с этим долгое ожидание.', 0, '', '', '', NULL, '2022-04-10 09:50:58', 1, NULL),
(97, 0, 10, 0, '', 0, 'Пациент крайне недоволен тем, что вместо исследования «МНО» ему выполнили «АЧТВ». Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:50:58', 1, NULL),
(98, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – недовольна тем, что изначально ей выдали лицензию не такую, как указана в договоре, в ПЗ медсестра отказывалась ей помочь с данным вопросом. Также клиент недовольна тем, что в ПЗ работает только один сотрудник. Ждет обратную связь по итогам рассмотрения.', 0, '', '', '', NULL, '2022-04-10 09:50:59', 1, NULL),
(99, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратилась с направлением от врача в ПЗ для сдачи анализов. Пациент попросила подсказать, какие анализы сдаются на 3-5 день менструального цикла. После этого регистратор начала по-хамски вести себя по отношению пациенту и отказалась «подсказывать» какие анализы необходимо сдавать.', 0, '', '', '', NULL, '2022-04-10 09:50:59', 1, NULL),
(100, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  Обратились самостоятельно в ПЗ, г. Краснодар, проинформировали регистраторы, что исследования «Тромбодинамика», сдается не в зависимости от приема л/с гепарина, пациента направили в другой ПЗ– при оформлении в данном ПЗ тоже не проинформировали по времени, не спросили во сколько делают укол. При обращении к лечащему врачу с готовым результатом, врач сказал, что анализ сдан не верно.', 0, '', '', '', NULL, '2022-04-10 09:50:59', 1, NULL),
(101, 0, 10, 0, '', 0, 'Пациент недоволен грубым обращением  сотрудников в ПЗ (). Пациент записан на 12.00 на пцр Ковид. В 12 часов закрыли двери перед пациентом на технический перерыв. Пациент не доволен, приходится ждать на улице.', 0, '', '', '', NULL, '2022-04-10 09:50:59', 1, NULL),
(102, 0, 10, 0, '', 0, 'Пациент жалуется на сотрудника ПЗ, после взятия крови, у пациента появилась гематома на пол руки (со слов пациента), при вопросе почему такой синяк, медсестра ответила «не мои проблемы».  Хотят уточнить, какие причины могут повлиять на появления гематомы. Жалуется, что обращаются в частную лабораторию, платят деньги и после мучаются от боли в месте', 0, '', '', '', NULL, '2022-04-10 09:50:59', 1, NULL),
(103, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – недовольна тем, что 30 мин брали анализ, несколько раз прокалывали иглой, по итогу у ребенка синяк, также анализ был выбракован. Клиенту не прозвонили сообщить о браке. Ждет обратного звонка по итогам рассмотрения жалобы.', 0, '', '', '', NULL, '2022-04-10 09:50:59', 1, NULL),
(104, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обращается в ПЗ уже не первый раз, каждый раз хамское отношения, грубят, постоянно кричат.', 0, '', '', '', NULL, '2022-04-10 09:50:59', 1, NULL),
(105, 0, 10, 0, '', 0, 'Пациентка крайне недовольна, что по готовности результаты анализов не пришли на электронную почту. Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:00', 1, NULL),
(106, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратился в ПЗ для восстановления чека (его ранее проинформировали на горячей линии, что на месте необходимо составить заявление по восстановлению данного документа). Медсестра не подобающе начала вести диалог по отношению к пациенту. Сказала, что ничего ей не известно, она более полной информацией владеет, чем горячая линия и данный документ не восстанавливается. И сказала, чтобы обратились по данному вопросу после праздников.', 0, '', '', '', NULL, '2022-04-10 09:51:00', 1, NULL),
(107, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – В ПЗ анализы лежат беспорядочно, «навалены в кучу», можно перепутать где чьи. Сомневается, что его анализ не потеряется. Пациент сделал фотографии.Требует, чтобы в течение 2 часов со ним связалось руководство и дало объяснение, угрожает оставить жалобу в государственные службы. В течение всего разговора использовал нецензурную брань.', 0, '', '', '', NULL, '2022-04-10 09:51:00', 1, NULL),
(108, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обратился в данный ПЗ за распечаткой реузльтатов анализов в 18.30, но он был закрыт (по графику ПЗ работает до 19.00). Пациент ждет обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:00', 1, NULL),
(109, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Не довольны работой медсестры, по словам пациента медсестра не протерла место забора анализа спиртовой салфеткой, плохо прикрепила пластырь. Ждет обратную связь по итогам рассмотрения.', 0, '', '', '', NULL, '2022-04-10 09:51:00', 1, NULL),
(110, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – недовольна тем, что одна медсестра вПЗ берет анализы и оформляет заказы. Также недовольна, что медсестра, со слов пациента, в течении часа не могла верно заполнить данные пациентов и адрес эл.почты, постоянно допуская ошибки.', 0, '', '', '', NULL, '2022-04-10 09:51:00', 1, NULL),
(111, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент– медсестра не нашла карту дисконтную в базе, не начислили накопления на карту, пациентка требует начисления накоплений в размере 3000р.', 0, '', '', '', NULL, '2022-04-10 09:51:00', 1, NULL),
(112, 0, 10, 0, '', 0, 'Пациент недовольна результатом Анализа ПЦР Фемофлор,16. В результате указано: Недостаточное кол-во материала. Пациент была заинтересована в результате, соблюдала подготовку правильно и специально обратилась в лабораторию. Пациент считает, что анализ, из-за недостаточного количества материала не адекватный.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(113, 0, 10, 0, '', 0, 'Пациент недоволен тем, что сотрудник при оформлении была невнимательна, допустила ошибку в персональных данных. Пациент недоволен тем, что сотрудник неверно проинформировала пациента о сроках получения результатов комплекса «Определение стадии инфекционного процесса Ковид-19», пообещав выдачу результатов (дата). Также сотрудник проинформировала пациента, что если анализ выполнится раньше, сотрудник ПЗ сможет исправить дату формирования документа на нужную. Результаты были готовы раньше обещанного срока. Тем самым сотрудник ПЗ «наказала пациента» на денежную сумму. Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(114, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недоволен тем, что в ПЗ медсестра оформляет заказ и берет анализы, работает один сотрудник.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(115, 0, 10, 0, '', 0, 'Медицинский сотрудник, который работает в данном ПЗ () непозволительно общается с пациентами.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(116, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – пациент недовольна тем, что в ПЗ большая очередь, долгое заполнение документов. Не выдают документы для заполнения на улице, что могло бы ускорить процесс.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(117, 0, 10, 0, '', 0, 'Со слов пациента, ему забыли выдать результат на английском языке. В ПЗ медперсонал очень рассеянный, супруге искололи руку, после сдачи анализа накладывали повязки. Обратную связь просит дать по эл.почте.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(118, 0, 10, 0, '', 0, 'Пациент недоволен тем, что в ПЗ нет лавочек.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(119, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недоволен задержкой результатов. Сдавали анализ (дата) на момент звонка  анализ был не готов. (по звонку в БАК отдел, сказали, что материал поступил на след день после забора к ним в работу). У пациента платная запись к врачу в другом городе на (дата), где должны были предоставить результаты данного исследования.', 0, '', '', '', NULL, '2022-04-10 09:51:01', 1, NULL),
(120, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент создал заявку с 10% скидкой на сайте СЛ. Пациент недоволен тем, что медсестра не смогла применить цену, которая была привязана к заявке №186501 (пациент утверждает, что медсестра нашла заявку, но не смогла применить скидку).', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(121, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – не согласна с выполненным анализом мочи, просит комментариев по выполнению анализа, анализы сдавали с разницей 3 дня, на одном анализе лейкоциты были 3200, на втором анализе через 3 дня результат совершенно другой, комментарии врача-консультанта пациента не устроили.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(122, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – по справке инвалидности не сделали скидку, утверждая, что документ, который он предоставил- не подходит, а также не предложили воспользоваться купоном.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(123, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Работает 1 сотрудник, которая оформляет документы, выполняет забор анализов. Всё происходит очень долго, очередь полная, оформление одного пациента занимает 15-20 минут. Сегодня пациент обратилась для сдачи анализов, просидев в очереди длительное время, так и не сдала анализы. Медсестра стала разбираться с другим пациентом по возврату денежных средств. Пациент прождала 30-40 минут и уехала, так и не сдав анализы.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(124, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – По словам пациента медицинская сестра, отказывается производить у него забор крови. Медицинская сестра хотела взять кровь из вен кисти, а у пациента, по его словам в данном месте вены плохие, он подсказал , где у него вены лучше, на что медицинская сестра сказала не учить её и отказалась вообще производить забор крови. Потом кровь у него все-таки взяли, но при этом медсестра (со слов пациента) угрожала, что сделает ему 50 дырок. Крайне возмущен таким отношением.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(125, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Отказ о внесении в результат ПЦР на ковид  марки  и срока годности тест системы. Хамское отношение сотрудника.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(126, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обращались  в ПЗ для сдачи анализов крови ребёнку. По словам обратившейся клиента, медицинская сестра вела себя грубо и даже не поздоровалась. Когда у ребёнка уже началась истерика, муж обратившейся держа ребёнка на руках чуть подвинул стол, тогда медсестра накричала, чтоб ничего в её кабинете не трогали. Недовольны грубым обращением медицинской сестры данного ПЗ Анализы так и не сдали и обращаться снова в лабораторию желания больше нет.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(127, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – оставить жалобу на оператора, т.к. ее неверно проинформировали о графике работы ПЗ', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL);
INSERT INTO `ur_income` (`id`, `num`, `status`, `source`, `name`, `medobj`, `info`, `totype`, `tel`, `email`, `zip`, `address`, `created`, `author`, `dateoutcome`) VALUES
(128, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент жалуется на оператора колл-центра. Пациент обратилась на горячую линию  для записи на ПЦР теста и крови на антитела. Оператор записала пациента  в 16:40 и проинформировала о том, что пациент может сдать и кровь и мазок в 16:40 соблюдая подготовку. При обращении пациента в ПЗ в назначенное время, сотрудник отказала в приеме крови, объяснив отказ тем, что кровь принимается только в первой половине дня, так как машина уезжает в лабораторию в 14:00. Пациент недовольна тем, что впустую потратила свое время, искала с кем оставить  дома малыша.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(129, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – хочет, чтобы ему провели анализ, который он просил изначально. Регистратор оформила ему не тот анализ. Бегать писать заявления о возврате не хочет.', 0, '', '', '', NULL, '2022-04-10 09:51:02', 1, NULL),
(130, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Со слов пациента: «Равнодушное обращение к пациенту, не дали возможности задать интересующий вопрос.»', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(131, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – м/с у 3-х людей не смогла взять кровь из вены. У ребенка всю руку истыкала и чуть до обморока не дошло. «Рука вся синяя, у ребенка истерика и страх на всю жизнь теперь.» Перчатки м/с не меняла. Пациента крайне возмущена.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(132, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – У ребёнка взяли кровь из пальца на ОАК, до этого были попытки взять венозную кровь, при этом выполнен неполноценный результат по причине «мало крови».', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(133, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – утверждает , что в данном филиале работают некомпетентные и невнимательные специалисты , так как во время обращения медсестра не досмотрела в списке у пациента общий анализ крови и соответственно его не взяла , пациенту 3 года и 3 месяца. Они обратились повторно , была другая медсестра , которая вообще не смогла взять кровь у ребенка.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(134, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – пациент жалуется на не удобные ступеньки. Он инвалид и ему тяжело подниматься по таким узким и пологим ступеням. Нет поручня. Нет пандуса. Дверь открывается не удобно, надо подаваться в сторону для этого.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(135, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент: Обратились сегодня для сдачи анализов на аллергены. Мед.сестра сделала замечание, что ребенок кашляет и это короновирус и попросила надеть маску. Клиент отдала свою маску ребенку и  сама осталась без маски. На регистратуре не было масок. Мед.сестра швырнула маску в лицо со словами: “Свое надо иметь”. После клиент отказалась заполнять документы для сдачи анализов. Ушли в другую клинику, где с ней общались вежливо и даже не попросили маску.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(136, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – пациент обратился для сдачи анализов, когда оформлялся, никто не спросил про дисконтную карту. Пациент сказал сам, что у него есть карта, регистратор ответила, что уже поздно говорить карту, так как она уже распечатала. Пациент попросил сделать отмену и всё таки добавить карту в товарный чек, регистратор ответила отказом, сказала, что такими картами уже ни кто не пользуется. В итоге пациент сдал анализы без учёта дисконтной карты. Недоволен.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(138, 0, 10, 0, '', 0, 'При переводе звонка в ПЗ, регистратор сказала, что была не их смена, поэтому за слова других они не несут ответственности.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(140, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недоволен тем, что регистратор  грубила, вела себя неподобающе. Также, когда указали на ошибку в фамилии, то регистратор сказала «надо было внимательнее читать». По словам пациентов кидала бумаги. Требуется обратная связь по итогам рассмотрения жалобы.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(141, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – сотрудник лаборатории не принял штрих код на скидку 300 рублей, который пришел на почту, сказав, что нет оборудования для чтения и вообще они не знают, что это за штрих код.', 0, '', '', '', NULL, '2022-04-10 09:51:03', 1, NULL),
(142, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратилась в данный ПЗ , чтобы забрать результаты анализов, но сделать этого не смогла, так как филиал был закрыт на перерыв. По словам пациента  в пункте забора указан перерыв с 11:45 до 12:00, а она обратилась в 12:20 но двери всё ещё были закрыты. Хочет чтобы расписание перерывов было отредактировано.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(143, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент сдал анализ 287, предварительно обратилась на горячую линию и врач- консультант сказала, что сдавать этот анализ уже можно (пациентка переболела Ковид 19 1.5 недели назад). Утверждает, что анализ был сдан несвоевременно, т.к. терапевт у которого она наблюдается сказал, что сдавать можно этот анализ не ранее чем через два месяца после заболевания. Требует ей вернуть денежные средства.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(144, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратилась для сдачи ПЦР теста, без записи, пришла в 14:18. Сотрудники сказали, что для сдачи необходима предварительная запись. Пациент попросила предоставить документ, где указано время работы ПЗ и время для взятия биоматериала и где указано, что ПЦР тест только по записи. Сотрудники отказались, стали хамить, выгонять. Пациент так же оставила жалобу на сайте. Просит разобраться с сотрудниками и ждёт обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(145, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –обратилась в лабораторию для сдачи анализов на антитела М иG для госпитализации. Медсестра сказала, что у нас выполняется новый  совместный анализ на М иG  стоимостью 700рублей . В  итоге выполнен один анализ , из за сотрудника лаборатории  может  лишиться  возможности  госпитализации. Требует возврат денежных средств или компенсацию, или будет подавать досудебную претензию на медсестру. Ждет ответ.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(146, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент: обратилась дочь на линию в связи с тем, что сегодня ее отец не смог сдать анализы в ПЗ из-за того, что завис компьютер в ПЗ. Но больше всего возмутило то, что мед.персонал обращался по  хамски и в грубой форме отвечал на вопросы пациента. Ранее в этой лаборатории они сдавали ПЦР вместе с обычными анализами, но в этот раз им отказали ,ответив  : «Что такого никогда не было» ,но она утверждает что есть подтверждение т.к они постоянные клиенты . Просит разобраться в ситуации ,так отец пожилой и онкобольной и на все реагирует остро. После случившегося позвонил дочери с дрожащим голосом.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(147, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что при сдаче анализа просчитали скидку 10%, при этом предъявила  карту (карта 20%).Недовольна непрофессионализмом администратора. Просит сделать перерасчет. Требуется обратная связь.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(148, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что пришла в ПЗ сдавать анализ на Ковид, м/с сказала одевать бахилы на улице, в  ПЗ не допустили сдавать анализ. пациент ждет звонка администрации.(Пациентка была перезаписана на 16.00 в этот же день,т.к. уже поела.)', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(149, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратилась в ПЗ, что бы уточнить информацию по анализам. 15 минут ждала очередь, за это время пациент сама нашла информацию о комплексе анализов который её интересовал. Попросила регистратора сделать распечатку данного комплекса, регистратор отказала ссылаясь на то, что уже пришли пациенты по записи на ПЦР-тест и ей нужно обслуживать их. Пациент недовольна, что ей не помогли в ПЗ. Ждёт обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(150, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обратились с ребенком для сдачи анализов для бассейна. Общая очередь для всех кто сдаёт анализы, детей без очереди не пропускают, хотя это Baby Lab. Со слов клиента, сдают и здоровые и больные пациенты, ПЦР на Ковид и антитела. Пациент оплатила нужные анализы, ребенку нужно было взять соскоб на энтеробиоз, вместо этого анализа взяли ОАК. Ребёнок вышел со слезами, мать пациента спросила, как так получилось? Медсестра ответила, что она перепутала с другой пациенткой. В итоге соскоб взяли, но пациенты в недоумении от работы данного филиала. Очень хотят поговорить с руководством о работе филиала, ждёт обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:04', 1, NULL),
(151, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Сегодня обращались для сдачи анализов ребенку 7 лет в П/З обращаются часто, ранее брали анализы аккуратно. Не довольна тем, что сегодня анализ брала другая медсестра . Напугала ребенка, исколола все руки. После того, как мама остановила и обратилась на ресепшн, пришла другая медсестра и взяла спокойно и быстро анализ. Со слов пациентки, такие медсестры работать с детьми не должны. Оставила отзыв в книге жалоб и предложений.  Ждет ответа,после обращения на горячую линию.', 0, '', '', '', NULL, '2022-04-10 09:51:05', 1, NULL),
(152, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент приехала из другого населенного пункта для сдачи анализа. Сдать хотела код 520, оформила договор, ожидала очередь. К пациенту подошёл кто то из мед.персонла и сказали, что анализ брать не будут, так как работает стажёр и стажёр боится брать данный анализ, попросили приехать через 2 дня для сдачи анализа. Пациент в недоумении, потратила время и деньги на дорогу. Просит руководство разобраться, почему работают не квалифицированные сотрудники, которые бояться брать анализы. Ждёт обратного звонка.', 0, '', '', '', NULL, '2022-04-10 09:51:05', 1, NULL),
(153, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент беременна, находится на 35ой неделе беременности. Обратилась в ПЗ для сдачи гинекологического мазка. Жалоба на мед.сестру. Мед. сестра грубо себя вела, насмехалась над пациентом, даже при взятии анализа продолжала насмехаться, издеваться. Очень больно и неприятно взяла мазок. После того, как пациент пригрозила, что будет обращаться в Контактный центр, сказали фамилию мед.сестры. Пациент просит провести беседу с данным работником.', 0, '', '', '', NULL, '2022-04-10 09:51:05', 1, NULL),
(154, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Сдавала ПЦР Ковид и по словам пациентки: «М/с повредила слизистую оболочку обеих ноздрей носа. В течение 3х часов идут кровянистые выделения. На замечание м/с никак не отреагировала». Клиент хочет узнать ФИО м/с и чтобы ей дали обратную связь.', 0, '', '', '', NULL, '2022-04-10 09:51:05', 1, NULL),
(155, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратился в ПЗ для сдачи анализов. Обслуживает всех один сотрудник, она же ведет запись, принимает оплату, заполняет документы и берёт анализы. Пациент попросил мед.сестру сменить перчатки, что бы взять анализы. Мед. сестра отказала, стала повышать тон, хамить. В итоге пациент анализы не сдал, так как, мед.сестра не соблюдает гигиенические нормы.', 0, '', '', '', NULL, '2022-04-10 09:51:05', 1, NULL),
(156, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  позвонила  на горячую линию, чтобы ей выслали результат анализа на электронную почту. В заказе адрес эл. почты не указан. Она утверждает, что предоставляла почту регистратору в ПЗ. Так как чек не сохранился и на номер телефона код не приходил внести эл. почту в заказ нет возможности. В ПЗ забирать результат она не хочет, чтобы не контактировать с другими людьми. Не довольна работой сотрудников, которые не внесли эл. почту, не выслали код на номер телефона, как получить анализ?', 0, '', '', '', NULL, '2022-04-10 09:51:05', 1, NULL),
(157, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что м/с на ПЗ сказала,что анализ с qr-кодом появится на гос.услугах, а там он не отобразился. Также требует возврат ден.средств. Пациент ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(158, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – жалоба на сотрудницу ПЗ, накричала на пациентку при просьбе помочь в заполнении документов. В итоге помогала медработник, которая берет анализ. Сегодня, при получении анализа ситуация повторилась', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(159, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пац. является доктором. Пришёл сдавать Антитела (Ag), без записи в утреннее время, на что Регистратор сказала, что требуется запись на сдачу анализов, не узнав изначально, для чего подошел пациент. Сидела в маске на подбородке, отвечала ухмыляясь. Клиент попросил надеть маску по правилам. На что сотрудница, ответила - она не является заразной, для окружающих и маску может надевать как будет удобно. Мед. сестра – сильно хамит обращающим, и решает сама, как и с кем, в каком тоне она будет разговаривать. Она отказалась предоставлять документы, что она имеет права делать забор анализов, отсутствие сертификата. (Со слов пациента) Нет бейджиков у сотрудников ПЗ.', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(160, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент уточнял в момент обращения в ПЗ – загружаются ли данные на портал гос.услуг на «Анти-Коронавирус». Регистратор сориентировала, что с нашей лаборатории автоматически загружается результат.  Просит разобраться в ситуации и предоставить обратный звонок, так как пациента ввели в заблуждение и предоставили не корректную информацию.', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(161, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациенты сдали ПЦР тест на Коронавирус по супер  cito на ПЗ. Результат анализа просили выдать в распечатанном виде с живой печатью и подписью ответственного лица на другом ПЗ, о чем предупредили м/с. Обратившись за результатом, м/с просто распечатала результаты и сказала, что больше нчем не может. По месту требования данный формат результата анализа будет не пригоден. В ином случае, если результат анализа не будет выдан в надлежащем виде до 9:00 13.11, то обратиться в суд с взысканием о сгоревшей путевки.', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(162, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обратилась в ПЗ на забор исследования на «Анти-Коронавирус», по времени в 11:30. Ей отказали, ссылаясь на то, что забор окончен и ей (мед. сестре) необходимо успеть принять пищу. Данный пациент обращает внимание, что мед. сестра принимает 1 пациента по 20 минут и она была последней в очереди, но ей отказали. Пациенту было сложно выдержать по времени 4 часа голода, но мед. сестра отнеслась к ней бездушно. Требуется обратный звонок.', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(163, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент был записан на ПЦР Ковид (код 554) на  16:20, со слов пациента: «Задержался на 5 минут, м/с сказала, что принимаем до 16:20 не позже». Просит обратную связь настойчиво.', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(164, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – нужно срочно попасть на прием к терапевту, он оплачен (не приняли, ничего толком не объяснили). Просит либо принять, либо вернуть деньги. Сотрудники филиала ничего не хотят решать, отправили со словами – мы вам позвоним. Пациент просит решения вопроса и обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:06', 1, NULL),
(165, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Беременная девушка обратилась в ПЗ для сдачи анализов, но её попросили ожидать на улице, в связи с тем, что маленькое помещение. Кроме данной девушки, на улице ожидают другие пациенты. Просит решить возникшую ситуацию и выделить другое помещение для лаборатории, которое бы вмещало пациентов. Просит обратного звонка', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(166, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Клиент вчера обратилась в ПЗ для уточнения информации по анализу на Анти-Коронавирус, по месту её полностью проконсультировали, озвучили стоимость анализа «700 руб». При обращении сегодня в ПЗ, при оформлении заказа ей выставили итоговую стоимость к оплате – 790 руб. У клиента возник дополнительный вопрос, почему изначально ей оговаривали стоимость  в размере 700 руб, а сегодня – 790 руб. Регистратор обьяснила, что разница только в производстве тест-системы: отечественный и американский. Клиент спросила: «Почему мне не предоставили право выбора анализа?». На что, регистратор и медицинская сестра сказали: «Мы – не терапевты».  Люди, которые ожидали в очереди, начали агрессивно вести себя по отношению к данной клиентке, налетать из-за того, что она задерживает очередь. Сотрудники ПЗ не остались в стороне и также начали повышать тон, ухмыляться.  Клиентка попросила предоставить книгу жалоб, но её долгое время сотрудники не могли найти. Заказ клиентка аннулировала. В конце, при выходе из отделения, одна из сотрудниц сказала: «Ну, извините». Клиент просит обратить внимание на то, с каким отношением относятся сотрудники к пациентам и то, как они не смогли пресечь ситуацию, когда другие пациенты начали проявлять агрессию к данной клиентке.', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(167, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Со слов пациентки: Заранее связывалась с ГЛ узнать подготовку к урогенитальным мазкам, оператором было сказано, что за двое суток необходимо исключить применение вагинальных свечей. М/с нахамили клиенту, сказав, что она ничего не понимает, что на ГЛ никто ничего не понимает, что брать б/м они не будут, довели до состояния «трясучки» в руках. Так же при м/с пациентка связывалась с оператором, который повторил информацию о подготовке, м/с допустили повышение голоса и со скандалом взяли б/м. М/с не извинились и довели до нервного состояния беременную женщину.', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(168, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обратившиеся в ПЗ, предоставили направление со списком требуемых анализов. Со слов пациента, видели, что оплачивают. Но когда результаты поступили, пац. утверждает, что мед. сестра взяла не тот показатель. Нужно было (123) АТ-ТПО, а она взяла на (287) антитела –короновирус .  Спрашивает, почему такое произошло и как можно решить проблему. По решению, ожидают обратную связь.', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(169, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент: Жалуется на то, что в ПЗ не смогли распечатать результаты анализов в связи с тем, что кончилась краска. Предложила (оператор) направить ей в эл. формате чтоб распечатать самостоятельно, но пациентка отказалась, сказав: «Что за такие деньги , которые я отдала за анализы , сама печатать ничего не буду!»', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(170, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна тем, что в 11.40 м/с отказалась принять анализ.', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(171, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  медсестра  агрессивная , грубая, кричит, вступает в дискуссии. Прошу обратить внимание на такое поведение, провести беседу, чтобы в дальнейшем обращалась  с пациентами более корректно и спокойно. Прошу не применять к ней серьезных дисциплинарных взысканий. Обратной связи не надо.', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(172, 0, 10, 0, '', 0, 'Пациент недоволен качеством обслуживания. Звонок пациента был переведен оператором горячей линии в указанный ПЗ для записи на обследования УЗИ брюшной полости. Пациент недоволен тем, что сотрудник позволила себе дерзкий и хамский тон в общении с пациентом, высказывала свое недовольство тем, что звонок пациента перевели на нее. Пациент считает такое поведение сотрудника недопустим. Просит разобраться и принять меры. Обязательно ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:07', 1, NULL),
(174, 0, 10, 0, '', 0, '', 0, '', '', '', NULL, '2022-04-10 09:51:08', 1, NULL),
(176, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  Медрегистратор  оформляет  очень медленно 20 мин одного человека , всегда консультируется с кем то по всем вопросам, на просьбу работать быстрее никак не отреагировала , предоставили сразу  скидочную карту, она ее не увидела, сказала что поздно дали , заплатили  без скидки . Из-за такого обслуживания в ПЗ опоздал на свою работу. Хочется, чтобы работали быстрее и качественнее. Обратной связи не требуется.', 0, '', '', '', NULL, '2022-04-10 09:51:08', 1, NULL),
(177, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратился в ПЗ для сдачи анализов несовершеннолетнего ребенка. Пока пациенты оформлялись на регистратуре, медсестра, которая должна была брать анализ у ребенка вышла на полог ПЗ покурить. На замечание пациента ему сама медсестра, и работник регистратуры начали грубить, не понимая причину его возмущения.  Пациент считает, что недопустимо чтобы у ребенка брала анализ медсестра от которой пахнет сигаретами. Пациент желает чтобы с ним связались по итогам рассмотрения обращения.', 0, '', '', '', NULL, '2022-04-10 09:51:08', 1, NULL),
(178, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  с сестрой обратилась в ПЗ для сдачи анализов на антитела к коронавирусу, хотела  воспользоваться скидкой 30% по акции «Мама, Папа, я – без вирусов семья», при себе были документы подтверждающие родство сестёр: свидетельства о рождении, паспорта и свидетельство о заключении брака, подтверждающее смену фамилии. В ПЗ отказали в данной скидке, утверждая, что подобное родство не подпадает под действие данной акции. Предъявленные документы даже не посмотрели.', 0, '', '', '', NULL, '2022-04-10 09:51:08', 1, NULL),
(179, 0, 10, 0, '', 0, 'Пациент недоволен тем, что лаборатория не принимает биоматериал (венозную кровь), собранный пациентом самостоятельно у маломобильного  пациента. Пациент отказывается от услуги «Выезд медицинской сестры» или обратиться в ПЗ самостоятельно. Пациент просит разобраться и настаивает на звонке ответственного лица, который может решить указанный вопрос. Ждет обратную связь.', 0, '', '', '', NULL, '2022-04-10 09:51:08', 1, NULL),
(180, 0, 10, 0, '', 0, 'Пациент заранее создала заказ на сайте компании, выбрав комплексные пакеты  «Женское здоровье» и «Состояние щитовидной железы».  На адрес электронной почты пациента  поступило подтверждение заявки с итоговой суммой с учетом суммы всех скидок 3,866 рублей  Пациент недовольна тем, что по факту сдачи анализов, сотрудник ПЗ,  озвучила сумму:  4,484 рубля. Клиент в почти ультимативной форме объявила, что ей легче обратиться в суд, чем составить жалобу у нас, так как на почту ей пришел договор «публичной оферты» и тем самым она была введена в заблуждение по поводу стоимости. Возможно пациентка суммировала все возможные скидки, не зная, что они не суммируются. В программе, вычисляющей конечную стоимость услуг,  тоже нет ограничений. Заказ был отменен.', 0, '', '', '', NULL, '2022-04-10 09:51:08', 1, NULL),
(181, 0, 10, 0, '', 0, 'Пациент недоволен тем, что сотрудник неверно проинформировала по срокам выполнения исследований. Пациент обратился в указанный ПЗ для сдачи биоматериала на исследования, в том числе «Антитела к рецептору ТТГ» и «Йод в сыворотке». Сотрудник пообещала пациенту выдачу результата на следующий день.  Пациент заранее оплатил прием врача. Пациент просит разобраться и принять меры. Ждет звонка администрации', 0, '', '', '', NULL, '2022-04-10 09:51:08', 1, NULL),
(183, 0, 10, 0, '', 0, '', 0, '', '', '', NULL, '2022-04-10 09:51:09', 1, NULL),
(185, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Хамское отношение к клиентам в регистратуре.', 0, '', '', '', NULL, '2022-04-10 09:51:09', 1, NULL),
(187, 0, 10, 0, '', 0, 'Пациент ожидает звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:09', 1, NULL),
(189, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обращалась две недели назад для забора крови из вены ребенку в данный ПЗ, забор произвели. Сегодня медсестра отказалась, сказав, что у детей до года забор не производят. Пациентка возмущена еще и тем, что ей с ребенком пришлось прождать в очереди час для того, чтобы получить такой ответ.', 0, '', '', '', NULL, '2022-04-10 09:51:09', 1, NULL),
(190, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка возмущена тем, что на ПЗ ей не сказали о том, что при сдаче анализов членам семьи и предъявлении документов, подтверждающих родство положена скидка 30%. Пациентка требует возместить ей разницу, с учётом скидки 30%.', 0, '', '', '', NULL, '2022-04-10 09:51:10', 1, NULL),
(191, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка хотела сдать анализ код 512 ПЦР Вирус простого герпеса тип 1,2 ( кровь). Медсестра сказала, что такого анализа нет. Медсестра взяла анализ на антитела Вирус простого герпеса тип 1,2 G. Но этот анализ не подходит пациенту.  Пациентка ждет обратный звонок.', 0, '', '', '', NULL, '2022-04-10 09:51:10', 1, NULL),
(192, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что в ПЗ одна медсестра, просит добавить м/с на ПЗ. По итогам рассмотрения необходима обратная связь.', 0, '', '', '', NULL, '2022-04-10 09:51:10', 1, NULL),
(193, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка возмущена тем, что в ПЗ работает только один регистратор, которая «разрывается» между оформлением и сдачей крови. Утверждает, что в очереди прождала ровно 2 часа. Очень надеется, что возьмут на работу еще одного регистратора. Пациентку также не устраивает, что при таком большом потоке людей, для использованных бахил стоит маленькая мусорка, в которую сложно попасть.', 0, '', '', '', NULL, '2022-04-10 09:51:10', 1, NULL),
(194, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  Некорректное поведение сотрудников данного ПЗ. Супруг данной пациентки, обратился на сдачу исследования по моче (привез контейнер с материалом), но супруга его не предупредила какое исследование необходимо выполнить, и не было возможности уточнить, так как он забыл телефон. Поэтому, пациентку соединили через горячую линию с данным ПЗ, она проинформила сотрудников о своей ситуации. В итоге супруга высмеяли сотрудники данного ПЗ за то, что он не был в курсе какое исследование необходимо было выполнить.', 0, '', '', '', NULL, '2022-04-10 09:51:10', 1, NULL),
(196, 0, 10, 0, '', 0, 'Желает, чтобы по результату жалобы связались.', 0, '', '', '', NULL, '2022-04-10 09:51:10', 1, NULL),
(199, 0, 10, 0, '', 0, '', 0, '', '', '', NULL, '2022-04-10 09:51:10', 1, NULL),
(202, 0, 10, 0, '', 0, 'Пациент просит разобраться в сложившейся ситуации и ждёт обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:11', 1, NULL),
(204, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  Очень медленно двигается очередь, за 30 мин 7 человек, может это обслуживают так долго, пациенты оплачивают медленно. Прошу просмотреть камеры и разобраться, почему так медленно. Я простоял и не успел сдать анализы. Так долго стоять в очереди я могу и в бесплатной поликлинике. Прошу обратить внимание на это, чтобы в дальнейшем все это происходило быстрее.', 0, '', '', '', NULL, '2022-04-10 09:51:11', 1, NULL),
(205, 0, 10, 0, '', 0, 'Пациент недовольна тем, что сотрудник отказалась выдать результат.   Сотрудник не запросила свидетельство о рождении ребенка, которое было у пациента с собой, а запросила именно код для получения, который пациент не смогла предоставить. Также сотрудник отказалась исправить адрес электронной почты в заказе без кода для получения результата, предложив пациенту обратиться на горячую линию. На горячей линии оператор не смог помочь пациенту в связи с отсутствием кода. Также пациент недовольна тем, что сотрудник не объяснила пациенту почему перед сдачей мазка на исследование ПЦР Коронавирус необходимо 2 часа строгого голода. Пациент просит разобраться и провести работу с сотрудниками ПЗ о правилах выдачи результатов и информировании пациентов.', 0, '', '', '', NULL, '2022-04-10 09:51:11', 1, NULL),
(206, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Клиент обратился для забора определенных анализов. Клиент расплатился наличным способом и предоставил купюру в размере 5000 рублей. Но медицинский персонал не смог предоставить сдачу, так как не было размена, при этом медсестра обратилась к пациенту со словами «либо ищите деньги под расчет, либо ищете способ разменять». Пациент недоволен таким отношением.', 0, '', '', '', NULL, '2022-04-10 09:51:11', 1, NULL),
(207, 0, 10, 0, '', 0, 'Пациент недоволен тем, что мед. сестра пришла на работу с признаками простуды, больная принимает пациентов. Пациент не смогла сдать биоматериал, по состоянию сотрудника. Пациент просит разобраться и принять меры. Обратный звонок не ждет', 0, '', '', '', NULL, '2022-04-10 09:51:11', 1, NULL),
(209, 0, 10, 0, '', 0, '', 0, '', '', '', NULL, '2022-04-10 09:51:11', 1, NULL),
(211, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обращаются не первый раз и каждый раз медсестра  не может сделать забор анализа (венозная кровь), исколет все вены и все безрезультатно, каждый раз приходиться вызывать другого сотрудника для забора. Платная медицинская лаборатория, а сотрудник не может взять кровь.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(212, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  Ужасное качество обслуживания. В ПЗ медицинская сестра не корректно относится к пациентам – грубит.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(213, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка требует вернуть деньги за анализ \"Anti-Коронавирус (IgG к RBD S1 SARS-CoV-2)- нейтрализующие антитела\". Предоставила результат своему врачу, врач не смогла разобраться. Утверждает, что анализ выполнен не верно. Требовала, чтобы расшифровали по телефону на горячей линии СЛ. Выполнить требования не было возможности, т.к. консультирующий врач находилась на выходном. Ждать рабочего дня пациентка отказалась.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(214, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка возмущена тем, что на ПЗ ей не сказали о том, что при сдаче анализов членам семьи и предъявлении документов, подтверждающих родство положена скидка 30%. Пациентка требует возместить ей разницу, с учётом скидки 30%.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(215, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недовольна качеством обслуживания. Сотрудник вела себя вяло, с клиентом общалась нехотя и равнодушно.  Также сотрудник пообещала пациенту позвонить и сообщить результат по телефону. Пациент обратной связи от сотрудника не дождалась и обратилась на горячую линию. Пациент просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(216, 0, 10, 0, '', 0, 'Пациент сдавал анализ на ВИЧ с выдачей справки  При получении анализов первоначально справку в ПЗ не выдали,  указали на то, что этой справки нет.  Пациенты обратились в ПЗ, им сказали, что сделают дубликат и его можно будет получить в пятницу, потом сказали, что в субботу,  Сегодня  сотрудник ПЗ проинформировал, что сроки перенесли на понедельник, Справка пациенту  нужна срочно. Пациентка недовольна тем, что справку не выдали сразу, а она сразу в этом не разобралась, т.к. сдавала еще и другие анализы.  Просит разобраться, ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(217, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Приехала из Красной Поляны в Адлер к 9:00 для сдачи ряда исследований, привязанных к определенному дню цикла. Предварительно пациентка уточнила режим приема биоматериала у сотрудника контакт-центра и ознакомилась с информацией на дверях ПЗ : «Прием биоматериала ежедневно до 12:30» Пациент заняла очередь (очередь огромная), но в 10:30 сотрудник не церемонясь выставила всех пациентов за дверь, отказав в приеме по причине приема группы пациентов от организации. Пациентка «в бешенстве», прием к врачу откладывается еще на месяц.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(218, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна тем, что сотрудник ПЗ работает очень медленно, не умеющий работать с программой и создающий большие очереди.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(219, 0, 10, 0, '', 0, 'Суть претензии: Пациент обратился в ПЗ для забора исследования на Анти-Коронавирус. В связи с загруженностью лаборатории и долгим ожиданием очереди пациент вынужден был уйти, так и не дождавшись своей очереди. Просит применить систему записи на данное исследование, так как крайне неудобно ожидать в течении долгого времени.', 0, '', '', '', NULL, '2022-04-10 09:51:12', 1, NULL),
(220, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недоволен тем, что сотрудник неверно проинформировала пациента о сроках выполнения исследования 7071 Anti-HDV (антитела cуммарные) -2 дня. Пациент не получил результат вовремя, сроки выполнения указанного исследования – 9 суток.  Результат анализа требует работодатель пациента. Срок не устраивает. Пациент просит разобраться и принять меры. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:13', 1, NULL),
(221, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна грубостью и хамством со стороны м/с. Также пациентка недовольна тем, что м/с не справляется со своими обязанностями , так как работает одна .', 0, '', '', '', NULL, '2022-04-10 09:51:13', 1, NULL),
(223, 0, 10, 0, '', 0, '', 0, '', '', '', NULL, '2022-04-10 09:51:13', 1, NULL),
(225, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратился в ПЗ за получением результата, м/ с проинформировала, что проводится сан.обработка и необходимо обратиться повторно через 10 минут. Пациент обратился повторно, м/ с сориентировала, что сан.обработка находится  в процессе и необходимо еще ожидать. Пациент крайне не устроило данное отношение. В том числе, вчера произошла аналогичная ситуация при заборе исследования,', 0, '', '', '', NULL, '2022-04-10 09:51:13', 1, NULL),
(226, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –Пациент утверждает, что ее личным врачом было сказано: «результат неадекватный по причине недобора материала. Пациент сдавала анализ код 806. Пациент недовольна работой м/с.  Пациент просит разобраться. Принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(227, 0, 10, 0, '', 0, 'Суть претензии: Пациента не устраивает, что в данном ПЗ работает 1 сотрудник, в связи с этим долгое ожидание в очереди. При этом, забор стандартных исследований проводится только до 11:30.', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(228, 0, 10, 0, '', 0, 'Суть претензии: пациент жалуется на м/с . Со слов пациента м/с не квалифицирована, не понимает какой материал и на какие анализы необходимо сдавать, несмотря на то что пациент предоставил коды анализов и сам материал для сдачи. Медлительна.', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(229, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Не корректное поведение медицинского персонала.  Медицинская сестра, которая проводила забор анализов «закатила» глаза. На стойке регистратуры сотрудник устроила скандал. Клиент считает неподобающим поведение медицинского персонала.', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(231, 0, 10, 0, '', 0, '', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(233, 0, 10, 0, '', 0, 'Суть претензии:  При оформлении заказа в ПЗ медицинская сестра проинформировала, что исследование «Кальпротектин в кале» выполняется 3 рабочих дня. По итогу, сегодня при обращении на горячую линию анализ не выполнен и оператор проинформировал об ином сроке – 5 рабочих дней. Поэтому просит предоставить обратную связь по решению данной ситуации, так как анализ необходим к определенной дате', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(234, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка сдала анализ по cito на ХГЧ. Позвонили на горячую линию для получения консультации по сданному анализу. Пациент недоволен тем, что консультацию получить не предоставляется возможным, в связи с отсутствием  врача-консультанта. На бланке результата указано, что: «Вы можете получить консультацию по горячей линии.', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(235, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна тем, что в ПЗ большая очередь. М/с оформляет медленно и со слов пациента «поверхностно берет анализ на коронавирус».', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(236, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что на обратилась в данный ПЗ в 18.30, а ПЗ был полностью закрыт.', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(237, 0, 10, 0, '', 0, 'Суть претензии: Пациент обратилась для сдачи ПЦР теста на Ковид со своей семьей, в ПЗ не соблюдены антиковидные меры. Помимо них в ПЗ находились еще 6 человек.', 0, '', '', '', NULL, '2022-04-10 09:51:14', 1, NULL),
(238, 0, 10, 0, '', 0, 'Суть претензии: Пациент обратился с ребенком для забора исследований. У ребенка повышенная температура тела.  Пациент возмущается о работе данного отделения: 1 сотрудник оформляет и проводит забор анализов, долгое ожидание в очереди.', 0, '', '', '', NULL, '2022-04-10 09:51:15', 1, NULL),
(239, 0, 10, 0, '', 0, 'Суть претензии- Пациент обратился в ПЗ для сдачи анализа Полиморфизмы генов систем свертывания и протеин-С, прождала в очереди полчаса, перед этим у медсестры уточнила сможет сдать эти анализы или нет, в итоге для анализа протеин-С нет пробирки в ПЗ', 0, '', '', '', NULL, '2022-04-10 09:51:15', 1, NULL),
(240, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна тем, что  полученный результат был без живой печати. Пациентка обращает внимание, что необходимо сотрудникам ПЗ заранее предупреждать о формате предоставления  результата исследования.', 0, '', '', '', NULL, '2022-04-10 09:51:15', 1, NULL),
(241, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент– Пациент обратился в ПЗ для сдачи анализа на антитела к коронавирусной инфекции, регистратор отказала в оформлении документов, так как пациент не захотел надевать маску. Пациент утверждает, что у него легочная недостаточность и он задыхается, хотел сесть для забора анализа и тогда надеть маску. Регистратор отказала пациенту в приеме анализа.', 0, '', '', '', NULL, '2022-04-10 09:51:15', 1, NULL),
(242, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Было отказано в использовании карты лояльности и предоставлении скидки при сдачи анализа ребенком. Со слов пациента сдача анализов ранее проходила без проблем. Пациент просит начислить стоимость анализа, сданного (дата), на скидочную карту.', 0, '', '', '', NULL, '2022-04-10 09:51:15', 1, NULL),
(243, 0, 10, 0, '', 0, 'Суть претензии: Пациентка недовольна тем, что очередь стоит на улице, пускают по 1 человеку, долгое оформление документов. Пациент не понимает, почему нельзя раздать очереди бумаги для оформления сразу, чтобы сократить время ожидания, почему не пускают в ПЗ сразу несколько человек для ускорения обслуживания.  Пациент просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:15', 1, NULL),
(244, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недоволен тем, что врач-консультант на горячей линии работает только по будням, так как пациенту необходимо получить консультацию (расшифровку)анализа для предоставления работодателю.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(245, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент–  сдавала анализы в ПЗ. По ее словам, м/с ПЗ при заборе крови брала использованные материалы. Теперь пациентка опасается заражения.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(246, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – В ПЗ большая очередь, длительное ожидание, принимает 1 м/с и 1 регистратор.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(247, 0, 10, 0, '', 0, 'Суть претензии – Пациентка недовольна тем, что в ПЗ сотрудник не предупредила, что анализ можно сдать позже на день и он тоже будет готов на следующий день. Пациентка возмущена тем, что на момент пересечения границы, вечером ПЦР анализ коронавирус будет просрочен. Пациентка требует возврат денежных средств.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(248, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна тем, что м/с оформила и взяла не тот анализ (код 300 общий анализ крови). Пациентка неоднократно проговорила 8 раз, какой нужен анализ (код 333 общий анализ крови с микроскопией). Пациент просит разобраться и принять меры срочно', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(249, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка жалуется на очень большую очередь в данном ПЗ , так как там ведет прием один человек и выполняет функцию и регистратора и медсестры , в итоге она не справляется со своей работой', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(250, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –Не был выполнен результат на англ. языке. Пациент предупреждала, документы подавались.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(251, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна тем, что сотрудник ПЗ ведет себя грубо, хамски по отношению к пациентам.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(252, 0, 10, 0, '', 0, 'Суть претензии: Пациент жалуется на то, что в ПЗ медсестра работает одна и на приеме анализов и администратором. Работа с пациентами происходит очень медленно.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(253, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – сдавала на дому анализы, акцентируя свое внимание на том, что результаты ей нужны на э/почте, которую она предоставила выездной мед. сестре (дважды). Работник, получив почту, проигнорировала требования пациента, оставив графу пустой. При оформлении, работник пообещала, что результаты поступят на адрес почты  днем.  На ГЛ позвонила пациентка для уточнения сроков подготовки результатов и оператор сообщил, что результаты уже готовы, но в заказе нет адреса э/почты. После чего, разгневанная мама пациентки, перепутав должность мед. сестры и оператора, стала обвинять ГЛ в том, что почта умышленно не была внесена в заказ и мы пренебрегаем нашим основным функционалом. У пациентки нет ни товарного чека, ни кода доступа в см-сообщении, так же она отказалась слушать информацию о том, что при их отсутствии ГЛ не в силах помочь ей в разрешении ее проблемы, т.к. в соответствии с правилами оператор без кода получения отправить результаты на э/почту не может. Услышав отказ, мать пациентки пообещала приехать по юр. адресу и адресу лаборатории, чтобы лично переговорить с мед. сестрой, которая не внесла почту, не слушая информацию о том, какие могут быть методы решения проблемы. Крайне недовольна работой мед. сестры, за доставленные неудобства и требует извинений.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(254, 0, 10, 0, '', 0, 'Суть претензии:  Пациентка недовольна тем, что в указанном ПЗ ей и ее отцу сотрудник отказала в предоставлении скидки на анализ (код 266) в размере 30% по акции «Мама, папа, я-без вирусов семья». Пациент заранее ознакомилась с акцией на сайте компании. Пациент просит разобраться и предоставить скидку. Ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:16', 1, NULL),
(255, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент–Пациентка обратилась в ПЗ для сдачи комплекса \"Витаминка\", на сайте указана стоимость 2100, с пометкой \"с учетом территориального прайса\", пациентка не поняла смысла этой фразы. Пациентка требует обратной связи от руководства по вопросу информации на сайте.', 0, '', '', '', NULL, '2022-04-10 09:51:17', 1, NULL),
(256, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Клиент обратилась в данный ПЗ, но филиал закрыт. Хотя, накануне уточняла информацию по режиму работы. Обращает внимание также на не корректное обращение сотрудников к пациентам: хамят, не информируют по стоимости исследования, не предоставляют информацию по сдаче анализов.  3 раза обращалась в данный ПЗ и сталкивалась с таким обращением.', 0, '', '', '', NULL, '2022-04-10 09:51:17', 1, NULL),
(258, 0, 10, 0, '', 0, 'Возмущен таким отношением.', 0, '', '', '', NULL, '2022-04-10 09:51:17', 1, NULL),
(260, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент жалуется, что уже не в первый раз (не только по этому адресу) не указывают электронную почту.', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(261, 0, 10, 0, '', 0, 'Суть претензии- Пациент обратился в ПЗ для сдачи анализа на антитела после вакцинации от ковид, в ПЗ мед.регистратор предложила сдать комплекс «Поствакцина», пациента не устроила стоимость и ей предложили сдать на нейтрализующие антитела. Пациент возмущен, что мед.персонал ведет себя как на рынке, сначала одна цена, потом другая.', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(262, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка недовольна тем, что сотрудники ПЗ ведут себя грубо и хамски по отношению к пациенту. Просит принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(263, 0, 10, 0, '', 0, 'Суть претензии: Пациент подошел в пз до 11.30 на сдачу крови на антитела к коронавирусу, в приеме было отказано. Направили на предварительную запись.', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(264, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – обратилась с просьбой установки дополнительных урн рядом с нашим филиалом . Так как пациенты нашего филиала выходят с приема и выбрасывают использованные маски, вату с кровью, бахилы просто на улицу, тем самым засоряют окружающую территорию, что очень не нравится населению.', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(265, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – При заборе исследований на Анти-Коронавирус  у группы людей наблюдается кожное высыпание на руке, напоминающее ожог. При этом, воспаление не проходит в течении длительного периода.  Просят обратить на это внимание. Просят предоставить обратную связь.', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(266, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – нужны чек и договор, т.к. они не были выданы во время забора (со слов пациента)', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(267, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что на обратилась в данный ПЗ в 18.30, чтоб забрать анализы, а там висела табличка с надписью про технический перерыв на уборку на полчаса, в итоге анализы не удалось забрать.', 0, '', '', '', NULL, '2022-04-10 09:51:18', 1, NULL),
(269, 0, 10, 0, '', 0, 'Обратная связь не требуется. Просит принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:19', 1, NULL),
(271, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что на ПЗ пообещали внести адрес э/почты в заказ, но анализы так и не поступили. При звонке на гор.линию обнаружилось, что адрес э/почты отсутствует. Пациенту было предложено внести адрес э/почты в заказ и анализы отправлены, но это ее не устроило, и она настаивала на жалобе.', 0, '', '', '', NULL, '2022-04-10 09:51:19', 1, NULL),
(272, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент утверждает, что сотрудники данного филиала неверно его проинформировали о сроках выполнения теста ПЦР.', 0, '', '', '', NULL, '2022-04-10 09:51:19', 1, NULL),
(273, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недовольна тем, что сотрудник неверно проинформировала пациента по срокам выполнения исследования ПЦР Коронавирус. Пациент заранее обратилась в ПЗ для уточнения информации.  Сотрудник проинформировала пациента о том, что для того, чтобы анализ был готов в пятницу  вечером или субботу  утром, пациенту нужно сдать анализ в четверг в обед. Пациент недовольна тем, что результат был выполнен 16.07.21 в 7:00. Тест уже не подходит для заселения. Пациент просит разобраться и принять меры', 0, '', '', '', NULL, '2022-04-10 09:51:19', 1, NULL),
(274, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент сдал анализ по cito на ПЦР Коронавирус, его проинформировали в ПЗ, что анализ будет готов на следующий день, с утра. По итогу, обратившись в ПЗ, пациента сориентировали, что анализ не готов и срок исполнения до 16 часов, но об этом она не была оповещена. Поэтому, пациент просит разобраться в данной ситуации, так как услуга не оказана и обращает внимание, что не имеет смысловой нагрузки данный срочный режим, так как в других лабораториях выполняют за 2-3 часа за такую стоимость. Пациент просит обратную связь', 0, '', '', '', NULL, '2022-04-10 09:51:19', 1, NULL),
(275, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недовольна тем, что при обращении в ПЗ  для получения результата, филиал был полностью закрыт. Пациент считает эту ситуацию грубым нарушением, пациент не смогла забрать свой результат. Просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:19', 1, NULL);
INSERT INTO `ur_income` (`id`, `num`, `status`, `source`, `name`, `medobj`, `info`, `totype`, `tel`, `email`, `zip`, `address`, `created`, `author`, `dateoutcome`) VALUES
(276, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  Пациент недоволен тем, что м/с в грубой форме отказала в предоставлении скидки 30% по акции «Мама, Папа, я» Семья из 5 человек имела при себе паспорта свидетельство о рождении, о браке, а также договор о туризме на всю семью.  Со слов пациента: « из-за хамского отношения семье пришлось  обратиться в другую лабораторию»', 0, '', '', '', NULL, '2022-04-10 09:51:20', 1, NULL),
(277, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – неуважительное обращение, неправильное заполнение документов, пациент хочет, чтобы документы были заполнены правильно.', 0, '', '', '', NULL, '2022-04-10 09:51:20', 1, NULL),
(278, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент сдавал анализ по cito на ПЦР Коронавирус, его проинформировали, что анализ будет выполнен в полночь. При обращении на горячую линию, анализ находился в стадии выполнения.  Пациент не устроил ответ, что анализ будет выполнен до 16 часов. Поэтому, просит вернуть денежные средства за не оказанную слугу.', 0, '', '', '', NULL, '2022-04-10 09:51:20', 1, NULL),
(279, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –Пациент обратился в ПЗ для  внесений дополнения информации по марке и сроку годности анализатора в комментарии результатов ПЦР и ИФА Коронавирус. Пациент недоволен тем, что ему пришлось добиваться исполнения просьбы в течение часа, сотрудники отказывали в помощи. После выполнении просьбы пациента сотрудник предупредила пациента, чтобы он больше не обращался в лабораторию. Пациент планирует сдачу снова и не хочет конфликта. Просит разъяснить сотруднику информацию по его обязанностям.', 0, '', '', '', NULL, '2022-04-10 09:51:20', 1, NULL),
(280, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – обратились в ПЗ для сдачи крови на Anti-Коронавирус (антитела IgG к RBD S-белка SARS-CoV-2) [производство USA] по семейной скидке 30%, медицинская сестра оформила заказ на Anti-Коронавирус (IgG к SARS-CoV-2) [BБ], со слов пациента: «медицинская сестра проинформировала, что на код 287 не распространяется скидка и оформила заказ по коду 797».', 0, '', '', '', NULL, '2022-04-10 09:51:20', 1, NULL),
(282, 0, 10, 0, '', 0, 'Предлагали ей обратиться в банк, чтобы проверить баланс счета, т.к. денежные средства могли быть еще не зачислены на карту, но пациент отказался и собрался опять идти в ПЗ.', 0, '', '', '', NULL, '2022-04-10 09:51:21', 1, NULL),
(284, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Сотрудник ПЗ, который оформлял пациента, пообещал, что результаты ПЦР теста будут загружены на Госуслуги автоматически по готовности. На сайт Госуслуг лабораторией результат загружен не был. Пациент просит выполнить свои обязательства, а также (в качестве компенсации) предоставить скидку или частичный возврат денежных средств.', 0, '', '', '', NULL, '2022-04-10 09:51:21', 1, NULL),
(285, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратился в  11:50 по очереди из 3 человек (занял заранее), сотрудник отказала в приеме. Пришлось настаивать со скандалом.  Сотрудник также отказывала всем, кто приходил на сдачу биоматериала при пациенте. В итоге сотрудник приняла всех пациентов до 12:15 и у сотрудников еще оставалось 15 минут до окончания приема. Пациент считает, что сотрудники ПЗ своевольно отказывают пациентам, т.к. не хотят обслуживать пациентов. Пациент просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:21', 1, NULL),
(286, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недовольна тем, что не получила результат анализа (ОАК) по причине выбраковки. У пациента в понедельник  прием у врача, результат нужен срочно.  Пациент считает выбраковку биоматериала по вине медицинской сестры, выполняющей забор, пациент требует выполнить анализ сегодня, по CITO в ПЗ Московская, 96 за счет лаборатории. Ждет срочного звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:22', 1, NULL),
(287, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратился в ПЗ в 7:00 до 7:29, мед. сестры нет на рабочем месте. Операторы не смогли уточнить причину отсутствие сотрудника. Необходимо сдать анализы, сколько еще по времени ее не будет на месте, и кто ей даст гарантию, что завтра ситуация не повториться. Пациент Возмущен и требует СРОЧНОЙ ОБРАТНОЙ СВЯЗИ для решения данной проблемы.', 0, '', '', '', NULL, '2022-04-10 09:51:22', 1, NULL),
(289, 0, 10, 0, '', 0, 'Также пациент недоволен тем, что сотрудник ПЗ неверно проинформировала о сроках выполнения анализа, пообещав готовность  результата  анализа (код 797) на следующий день.', 0, '', '', '', NULL, '2022-04-10 09:51:22', 1, NULL),
(291, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Администратор данного филиала очень медленно обслуживает пациентов, очередь не движется. Просит принять меры по данной жалобе.', 0, '', '', '', NULL, '2022-04-10 09:51:22', 1, NULL),
(292, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что м/с указали верный адрес э/почты в заказ, но анализы так и не поступили. При звонке на гор.линию обнаружилось, что адрес э/почты указан неверно. Пациенту было предложено внести адрес э/почты в заказ, анализы отправлены на э/п, но пациент все равно оставила жалобу.', 0, '', '', '', NULL, '2022-04-10 09:51:23', 1, NULL),
(293, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  В ПЗ работает медицинская сестра, которая находится в не адекватном состоянии при общении с пациентами. На просьбу об изменении в заказе электронной почты, медицинская сестра начала не стесняться в выражениях, употреблять не цензурные слова в адрес пациента.  В момент разговора, присутствовали другие пациенты, которые планировали провести забор исследования, после данного обращения, очередь разбежалась из-за хамского отношения. При получении результата анализа, значения были повышены, поэтому пациент попросил переделать анализ. На что, медицинская сестра ответила: «Я переделывать ничего не собираюсь. Вы можете повторно пересдать анализ, но за свой счет».', 0, '', '', '', NULL, '2022-04-10 09:51:23', 1, NULL),
(294, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент желает оставить жалобу на сотрудника. Пациенты обратились для сдачи ПЦР теста, опоздали на 5 мин (со слов клиента) потому, что ходили за масками в аптеку (в пз маски не предоставили). Данный сотрудник стала по-хамски разговаривать, по времени не пропускала на сдачу ПЦР теста. Клиент просить принять меры в отношении данного сотрудника.', 0, '', '', '', NULL, '2022-04-10 09:51:23', 1, NULL),
(296, 0, 10, 0, '', 0, 'Требует  административное взыскание, либо какую угодно управу на  м', 0, '', '', '', NULL, '2022-04-10 09:51:23', 1, NULL),
(298, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Администрация и место забора крови находится в одном помещении, что не соответствует требованиям СанПина.', 0, '', '', '', NULL, '2022-04-10 09:51:24', 1, NULL),
(299, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что при обращении в ПЗ давали м/с направление с работы, где были указаны антитела m,g, но в результате м/с  оформила заказ только на g, теперь им надо пересдавать заново анализы. Пациент ждет звонка администрации.', 0, '', '', '', NULL, '2022-04-10 09:51:24', 1, NULL),
(300, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – жалуются, что работает одна мед. сестра, прием введется очень медленно, пациенты ожидают в очереди по 10-15 мин. Все присутствующие ожидают в духоте, это неудобно и длительно.', 0, '', '', '', NULL, '2022-04-10 09:51:24', 1, NULL),
(301, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Со слов пациента, выполнили не качественный забор материала для анализа код: 520 ПЦР Фемофлор-16. После консультации пациента с 2 гинекологами, сделали вывод, что результаты нашей лаборатории недостоверны. Звонок перевели на врача консультанта ГЛ, после чего пациент остался, не уверен.   Просьба разобраться и дать обратную связь.', 0, '', '', '', NULL, '2022-04-10 09:51:24', 1, NULL),
(302, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент утверждает, что у него взяли не тот анализ, он хотел сдать биохимию крови, а ему сделали общий анализ крови. Клиент настаивает, чтобы ему переделали анализ.', 0, '', '', '', NULL, '2022-04-10 09:51:24', 1, NULL),
(303, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недоволен тем, что сдал анализы индекс НОМА, в который входит глюкоза и инсулин, но об этом ему регистратор не указала (сказала об этом м/с, которая берет анализы, но регистратор не обратила на это внимание). Пациент считает, что он не обязан знать что входит в какой анализ, а регистратор могла ему на это указать, но она умолчала об этом, при этом пробив индекс НОМА, глюкозу и инсулин в заказе. Пациент считает, что переплатил за анализы и просит вернуть ему стоимость переплаченных анализов бонусом в будущие заказы. Пациент ждет звонка администрации по итогам рассмотрения.', 0, '', '', '', NULL, '2022-04-10 09:51:24', 1, NULL),
(304, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что в ПЗ 1 м/с, долгое ожидание в очереди. Пациент ждет обратного звонка.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(305, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – В данном ПЗ работает один медицинский сотрудник, который оформляет, проводит забор исследований, в связи с  этим долгое ожидание в очереди. Многие пациенты вынуждены уйти, так и не дождавшись обслуживания. Просит обратного звонка', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(306, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – медицинская сестра неправильно взяла анализ, позже сказали пересдать снова, результаты ждёт и не уверен, что в этот раз будет анализ выполнен правильно, хочет вернуть деньги или получить правильный результат анализа как можно скорее.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(307, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –  Сдавали кровь на антитела, в документации написано, что кровь на данное исследование берут в желтую пробирку для дальнейшего  центрифугирования, а у него и его невестки кровь взяли в пробирки красного цвета. Как это так, что в документах написано одно, а по итогу в лаборатории анализ берут по-другому.  Переживает, что результат будет неверный. Говорит, что хочет пожаловаться в Роспотребнадзор.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(308, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недоволен тем, что при переводе звонка для записи к врачу в МК номер недоступен или не отвечает. Пациент не может записаться к врачу. Также пациент недоволен тем, что в ПЗ работают «хамовитые сотрудники». Также пациент недоволен тем, что в ПЗ с 12:00 до 13:00 закрывают филиал на перерыв и всех направляют в другой ПЗ. Обратный звонок не ждет. Просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(310, 0, 10, 0, '', 0, 'Хотела бы, чтобы ей перезвонили, уточнили причину отсутствия сотрудника на месте, а также будет ли работать филиал в субботу, воскресенье и понедельник.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(312, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка возмущена работой персонала данного филиала, так как один человек выполняет и функцию администратора, и медсестры. Поэтому клиент не смогла сдать анализы себе и своему ребенку-инвалиду.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(313, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – При сдаче анализа на пцр в ускоренном режиме медсестра, которая оформляла пациента пообещала, что результат анализа пациент получит на следующий день в 8 часов утра. Результат на данный момент обращения на ГЛ не был готов.  У пациента был самолет днем.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(314, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что при обращении в ПЗ для уточнения наличия записи на ПЦР Коронавирус, м/с игнорировала ее, а потом попросила выйти из филиала. Пациентка не имела возможности прозвонить на гор.линию для уточнения.  Обратный звонок не требуется.', 0, '', '', '', NULL, '2022-04-10 09:51:25', 1, NULL),
(315, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – По словам клиента: как только она зашла на порог (сдавала ПЦР COVID 13:00), медсестра  ответила ей с хамством; когда пришло время оплаты, не все купюры устроили медицинскую сестру, пациент тогда заменила деньги на другие; когда пришло время анализа, при взятии мазка медицинская сестра по словам пациента специально сделала больно, потому как ранее пациент сдавала анализ в другом ПЗ и чувствовала себя при этом комфортно, а в данном ПЗ со слов клиента: медсестра засунула эту палку  ей по самую глотку.  Пациент ушла после сдачи анализа, но неприятные болезненные ощущения остались и приходить снова у неё желания больше нет. Хочет, чтобы провели беседу с данной медицинской сестрой или поменяли работника, потому что с следующими пациентами данный работник общалась также по-хамски.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(316, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –Пациент недоволен тем, что при обращении в ПЗ для сдачи анализов в 7:25 ПЗ был еще закрыт. Никаких объявлений об изменениях режима работы на двери не указано. Пациент считает ситуацию недопустимой. Просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(317, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент –Пациент недоволен тем, что в срочном режиме выполняется анализ очень долго. Пациенту нужен результат к утру следующего дня.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(318, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациенту (ребенку) вчера произвели забор анализов: ОАМ и ОАК. Мама ребенка обращает внимание на то, что медицинская сестра не могла произвести забор на ОАК, в связи с тем, что кровь свернулась из-за того, что у пациента повышенная температура тела. Несколько раз были проведены проколы, в связи с этим, у пациента был болевой эффект. Мед.сестра изначально сообщила, предупредила,  что забор анализов не проводится при высокой температуре тела, но клиент настояла.  По итогу, сегодня при обращении в ПЗ за получением результатов, ОАК не выполнен, так как брак. Необходимо провести перезабор, но клиента не устроило. Клиентка просит решить данную ситуацию, так как не имеет желания приходить в этот ПЗ, в связи с тем, что мед.сестра не квалифицированно проводит забор крови. Она готова обратиться в другой ПЗ на перезабор.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(319, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Отец  пациента возмущен тем, что сотрудник данного филиала не предупредил о  том, что нет реагента на данный анализ, а ребёнку кровь взяли . Обратившийся ждет обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(320, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Сотрудники филиала не внесли почту в заказ, Клиент просит вернуть деньги обратно. Пациентка ждет обратной связи.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(321, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пац. Обратился в ПЗ, считает, что работают не профессиональные сотрудники, которые допускают болезненные ощущения, в месте прокола, у пациента появился синяк, опухла рука, не могут согнуть руку в локтевом сгибе, осталась царапина. Мед. сотрудник, выдернул иголку (со слов пациента) из вены, тем самым появилась шишка и боль. Требует обратного звонка по рассмотрению претензии.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(322, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Сегодня в  8 утра пациент сдавала анализы. Суть претензии в том, что время ожидания оплаты составило 35 минут, что недопустимо, терминал не работает. Ждёт обратного звонка.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(323, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка не довольна тем, что ей не приходят анализы на электронную почту и не довольна тем, что анализы приходят не вовремя.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(324, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – сдавали кровь на гемоглобин , анализ показал неверный результат, который оказался превышен   в десятки раз. По обращении в ПЗ им сказали, что ошибки не может быть, а также что им в ПЗ звонили искали пациента, но на номер клиента никто не звонил по этому поводу. Клиент не доволен работой данного ПЗ и лабораторией, хочет возврата денежных средств.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(325, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациентка повторно хотела сдать анализ «посев на микоплазму и уреаплазму» (код 600), но при оформлении заказа в ПЗ неверно указали код, далее со слов пациентки: «название такое же, как и предыдущее, но код 610».', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(326, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент недовольна тем, что при обращении в ПЗ в вечернее время после спада жары (в 18:40) для сдачи биоматериала на аллергены  (кровь),  своему ребенку сотрудник равнодушно отказала в приеме биоматериала. Сотрудник объяснила отказ тем, что кровь принимается только в утренние часы. Пациент живет за 25 км от филиала, зря потратила время и денежные средства. Пациент просит администрацию предоставить объяснения, почему в расписании на двери ПЗ нет никаких ограничений (с 7 до 19:00).Пациент считает, что информация на двери ПЗ не соответствует действительности и это является неуважением к своим пациентам. Пациентка просит разобраться и принять меры.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(327, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обратился пациент на ГЛ с жалобой, что в ПЗ система обслуживания не на должном уровне и требовал чтобы с ним связалось руководство, так как оператору он ничего не собирается объяснять.', 0, '', '', '', NULL, '2022-04-10 09:51:26', 1, NULL),
(328, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Со слов пациентки: «Обратилась в ПЗ по записи на ПЦР Ковид. М/с отказала в приёме купона от мобильного приложения, м/с сказала, что в лаборатории нет такой акции». Во время разговора оператором было разъяснено, что скидки и акции не суммируются. Пациент все равно пожелал оставить жалобу.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(329, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Клиент обратился в ПЗ для забора анализов. Оплату клиент собирался предоставить наличным путем. При оплате, клиент предоставил сумму не под расчет, а больше. В связи с чем, медицинская сестра сказала: «Что сдачи нет, ищите самостоятельно необходимую сумму». Клиента данная ситуация возмутила, так как в других организациях немного иначе подход.  Клиенту необходимо в срочном порядке сдать необходимый анализ, из-за данной ситуации пришлось просить других лиц о переводе денег на ее карту.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(330, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент: Жалуется на грубое отношение сотрудников ПЗ, Клиент зашел в ПЗ уточнить по налоговому вычету, ей в грубой форме сказали что этого не дают. Просит связаться по решению жалобы.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(331, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратилась в ПЗ для сдачи анализов. При оформлении анализов, регистратор по фамилии, вела себя неподобающе, хамила, грубо разговаривала, на вопросы по анализам отвечала нехотя. Пациент отмечает, что вела себя неадекватно, сначала хамила и грубила, потом стала извиняться. Пациент просит разобраться в данной ситуации, научить сотрудника общаться адекватно. Очень ждёт обратного звонка.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(332, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обратилась в ПЗ , чтобы забрать результаты анализов (антитела covid), попросила  медицинскую  сестру подсказать по расшифровке анализа, на что медсестра ответила, что всё написано на бумаге и расшифровывать она ничего не обязана, и сказала звонить на горячую линию. По словам пациента работник данного ПЗ грубая, невежливая и очень  некорректно ведёт себя с людьми, не только с ней, но и с другими пациентами.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(333, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – претензия к сотруднику в филиале, жалоба на некомпетентность. Не смогла взять кровь у ребенка (10 мес), исколола руки, отправила в другой филиал. Пациент очень зол, просит принять меры к сотруднику и ждет обратную связь.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(334, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Обратились с ребенком для забора крови, но произвести его не смогли, так как мед. сестра не обладает квалификацией по забору крови у детей. Мед. сестра позвонила в 2 наши филиала, чтобы уточнить о возможности забора крови, но сориентировали, что сегодня нет данного специалиста.  Это не жалоба, а обращение клиента на то, что сотрудники не компетентны в своей работе. Просит обратный звонок.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(335, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – отказались принимать кровь из пальца у ребенка 8 мес. в обоих филиалах. Причину указали, что одна мед сестра не может, хотя ранее пациентка к нам не раз обращалась и более взрослые мед. сестры брали анализы. Пациент ждет обратную связь.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(336, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – пациентка недовольна тем, что в ПЗ м/с не посоветовала  какой анализ  сдать на антитела перед вакцинацией  к коронавирусу, чтобы получить результат в течении суток. М/с сказала, что анализ будет готов в понедельник.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(337, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Пациент обратился в ПЗ для сдачи анализов, рассчитывая расплатиться мелочью, номиналом в 5 и 10 рублей. В ПЗ отказались принять мелочь, сославшись на то, что лаборатория  – это частная организация и сотрудники имеют право отказаться от приема мелочи. Пациент расплатился картой. Он попросил официальный отказ на бумаге, в чём ему также отказали. Планирует обратиться в полицию, так как считает, что нарушен закон РФ.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(338, 0, 10, 0, '', 0, 'Суть претензии, что хочет клиент – Недовольна тем, что м/с на ПЗ не предупредила, что в анализе 532 ПЦР Вирус гепатита C (HCV) c определением типа (типы 1, 2, 3) рассматриваются только типы  1,2,3, а не 1А,1Б и т.д. По итогам рассмотрения жалобы просит возврат денежных средств и обязательного обратного звонка.', 0, '', '', '', NULL, '2022-04-10 09:51:27', 1, NULL),
(341, 0, 1, 0, 'test', 2, NULL, 1, '89086876923', 'supersvinyak@gmail.com', '', NULL, '2022-04-10 10:30:43', 0, NULL),
(342, 0, 0, 0, 'Манешин Андрей Геннадьевичь', 4, 'НЕ получилось прдти на прием к врачу', 2, '89180491447', 'andrew.maneshin@gmail.com', '350000', 'Краснодар, ул. Северная 405', '2022-04-10 11:33:03', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ur_medobj`
--

CREATE TABLE `ur_medobj` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `city` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ur_medobj`
--

INSERT INTO `ur_medobj` (`id`, `name`, `city`, `published`) VALUES
(1, 'ГБУЗ №1', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ur_status`
--

CREATE TABLE `ur_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `tbl` varchar(100) NOT NULL DEFAULT 'idSportsmen',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `cls` varchar(100) DEFAULT '',
  `ico` varchar(100) DEFAULT '',
  `menuindex` int(11) NOT NULL DEFAULT '10',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `info` text,
  `extended` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ur_status`
--

INSERT INTO `ur_status` (`id`, `name`, `tbl`, `alias`, `cls`, `ico`, `menuindex`, `published`, `info`, `extended`) VALUES
(1, 'Виды статусов', 'idStatus', 'idStatus', '', '', 1110, 1, '', NULL),
(2, 'Конфигурация', 'idStatus', 'idConfig', '', '', 100, 1, '', NULL),
(5, 'Основные', 'idConfig', 'optsMain', 'clubStuff', '', 10, 1, '', '{\"fields\":\"site_name,site_fullname,https,emailtech,autouser\",\"tpl\":1,\"run\":\"optsMain\"}'),
(7, 'idAdmin', 'idPermission', 'idAdmin', '', '', 10, 1, NULL, '{\"loginUrl\":\"/dashboard.html\",\"crew\":1}'),
(8, 'Входящие', 'idStatus', 'idIncome', '', '', 10, 1, '', '{\"ismain\":\"id\"}'),
(9, 'Исходящие', 'idStatus', 'idOutcome', '', '', 20, 1, '', '{\"ismain\":\"id\"}'),
(10, 'На первичной проверке', 'idIncome', 'in1', '', '', 10, 1, '', NULL),
(11, 'На вторичной проверке', 'idIncome', 'n2', '', '', 20, 1, '', NULL),
(12, 'Требует ответа медицинского учреждения', 'idIncome', 'n3', '', '', 30, 1, '', NULL),
(13, 'Закрыто с ответом', 'idIncome', 'n4', '', '', 40, 1, '', NULL),
(14, 'Закрыто без ответа', 'idIncome', 'n5', '', '', 50, 1, '', NULL),
(15, 'Отправлено', 'idOutcome', 'sent', '', '', 10, 1, '', NULL),
(16, 'Доставлено', 'idOutcome', 'recived', '', '', 40, 1, '', NULL),
(17, 'Источники', 'idStatus', 'idSource', '', '', 70, 1, '', NULL),
(18, 'Web-Форма', 'idSource', 'web', '', '', 10, 1, '', NULL),
(19, 'Эл. почта', 'idSource', 'email', '', '', 20, 1, '', NULL),
(20, 'Бум. почта', 'idSource', 'pochta', '', '', 30, 1, '', NULL),
(21, 'Tg bot', 'idSource', 'tg', '', '', 40, 1, '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ur_types`
--

CREATE TABLE `ur_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ur_types`
--

INSERT INTO `ur_types` (`id`, `name`, `parent`) VALUES
(1, 'Тестовый классиф', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mx_access_actiondom`
--
ALTER TABLE `mx_access_actiondom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Индексы таблицы `mx_access_actions`
--
ALTER TABLE `mx_access_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Индексы таблицы `mx_access_category`
--
ALTER TABLE `mx_access_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Индексы таблицы `mx_access_context`
--
ALTER TABLE `mx_access_context`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Индексы таблицы `mx_access_elements`
--
ALTER TABLE `mx_access_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Индексы таблицы `mx_access_media_source`
--
ALTER TABLE `mx_access_media_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Индексы таблицы `mx_access_menus`
--
ALTER TABLE `mx_access_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Индексы таблицы `mx_access_namespace`
--
ALTER TABLE `mx_access_namespace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Индексы таблицы `mx_access_permissions`
--
ALTER TABLE `mx_access_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template` (`template`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `mx_access_policies`
--
ALTER TABLE `mx_access_policies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `class` (`class`),
  ADD KEY `template` (`template`);

--
-- Индексы таблицы `mx_access_policy_templates`
--
ALTER TABLE `mx_access_policy_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mx_access_policy_template_groups`
--
ALTER TABLE `mx_access_policy_template_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mx_access_resources`
--
ALTER TABLE `mx_access_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Индексы таблицы `mx_access_resource_groups`
--
ALTER TABLE `mx_access_resource_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`,`target`,`principal`,`authority`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Индексы таблицы `mx_access_templatevars`
--
ALTER TABLE `mx_access_templatevars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Индексы таблицы `mx_actiondom`
--
ALTER TABLE `mx_actiondom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set` (`set`),
  ADD KEY `action` (`action`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`),
  ADD KEY `for_parent` (`for_parent`),
  ADD KEY `rank` (`rank`);

--
-- Индексы таблицы `mx_actions`
--
ALTER TABLE `mx_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `controller` (`controller`);

--
-- Индексы таблицы `mx_actions_fields`
--
ALTER TABLE `mx_actions_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action` (`action`),
  ADD KEY `type` (`type`),
  ADD KEY `tab` (`tab`);

--
-- Индексы таблицы `mx_active_users`
--
ALTER TABLE `mx_active_users`
  ADD PRIMARY KEY (`internalKey`);

--
-- Индексы таблицы `mx_categories`
--
ALTER TABLE `mx_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`parent`,`category`),
  ADD KEY `parent` (`parent`),
  ADD KEY `rank` (`rank`);

--
-- Индексы таблицы `mx_categories_closure`
--
ALTER TABLE `mx_categories_closure`
  ADD PRIMARY KEY (`ancestor`,`descendant`);

--
-- Индексы таблицы `mx_class_map`
--
ALTER TABLE `mx_class_map`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class` (`class`),
  ADD KEY `parent_class` (`parent_class`),
  ADD KEY `name_field` (`name_field`);

--
-- Индексы таблицы `mx_content_type`
--
ALTER TABLE `mx_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `mx_context`
--
ALTER TABLE `mx_context`
  ADD PRIMARY KEY (`key`),
  ADD KEY `name` (`name`),
  ADD KEY `rank` (`rank`);

--
-- Индексы таблицы `mx_context_resource`
--
ALTER TABLE `mx_context_resource`
  ADD PRIMARY KEY (`context_key`,`resource`);

--
-- Индексы таблицы `mx_context_setting`
--
ALTER TABLE `mx_context_setting`
  ADD PRIMARY KEY (`context_key`,`key`);

--
-- Индексы таблицы `mx_dashboard`
--
ALTER TABLE `mx_dashboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `hide_trees` (`hide_trees`);

--
-- Индексы таблицы `mx_dashboard_widget`
--
ALTER TABLE `mx_dashboard_widget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `lexicon` (`lexicon`);

--
-- Индексы таблицы `mx_dashboard_widget_placement`
--
ALTER TABLE `mx_dashboard_widget_placement`
  ADD PRIMARY KEY (`dashboard`,`widget`),
  ADD KEY `rank` (`rank`);

--
-- Индексы таблицы `mx_documentgroup_names`
--
ALTER TABLE `mx_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `mx_document_groups`
--
ALTER TABLE `mx_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_group` (`document_group`),
  ADD KEY `document` (`document`);

--
-- Индексы таблицы `mx_element_property_sets`
--
ALTER TABLE `mx_element_property_sets`
  ADD PRIMARY KEY (`element`,`element_class`,`property_set`);

--
-- Индексы таблицы `mx_extension_packages`
--
ALTER TABLE `mx_extension_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `mx_fc_profiles`
--
ALTER TABLE `mx_fc_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `rank` (`rank`),
  ADD KEY `active` (`active`);

--
-- Индексы таблицы `mx_fc_profiles_usergroups`
--
ALTER TABLE `mx_fc_profiles_usergroups`
  ADD PRIMARY KEY (`usergroup`,`profile`);

--
-- Индексы таблицы `mx_fc_sets`
--
ALTER TABLE `mx_fc_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile` (`profile`),
  ADD KEY `action` (`action`),
  ADD KEY `active` (`active`),
  ADD KEY `template` (`template`);

--
-- Индексы таблицы `mx_lexicon_entries`
--
ALTER TABLE `mx_lexicon_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `topic` (`topic`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `language` (`language`);

--
-- Индексы таблицы `mx_manager_log`
--
ALTER TABLE `mx_manager_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_occurred` (`user`,`occurred`);

--
-- Индексы таблицы `mx_media_sources`
--
ALTER TABLE `mx_media_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `is_stream` (`is_stream`);

--
-- Индексы таблицы `mx_media_sources_contexts`
--
ALTER TABLE `mx_media_sources_contexts`
  ADD PRIMARY KEY (`source`,`context_key`);

--
-- Индексы таблицы `mx_media_sources_elements`
--
ALTER TABLE `mx_media_sources_elements`
  ADD PRIMARY KEY (`source`,`object`,`object_class`,`context_key`);

--
-- Индексы таблицы `mx_membergroup_names`
--
ALTER TABLE `mx_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `rank` (`rank`),
  ADD KEY `dashboard` (`dashboard`);

--
-- Индексы таблицы `mx_member_groups`
--
ALTER TABLE `mx_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`),
  ADD KEY `rank` (`rank`);

--
-- Индексы таблицы `mx_menus`
--
ALTER TABLE `mx_menus`
  ADD PRIMARY KEY (`text`),
  ADD KEY `parent` (`parent`),
  ADD KEY `action` (`action`),
  ADD KEY `namespace` (`namespace`);

--
-- Индексы таблицы `mx_namespaces`
--
ALTER TABLE `mx_namespaces`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `mx_property_set`
--
ALTER TABLE `mx_property_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`);

--
-- Индексы таблицы `mx_register_messages`
--
ALTER TABLE `mx_register_messages`
  ADD PRIMARY KEY (`topic`,`id`),
  ADD KEY `created` (`created`),
  ADD KEY `valid` (`valid`),
  ADD KEY `accessed` (`accessed`),
  ADD KEY `accesses` (`accesses`),
  ADD KEY `expires` (`expires`);

--
-- Индексы таблицы `mx_register_queues`
--
ALTER TABLE `mx_register_queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `mx_register_topics`
--
ALTER TABLE `mx_register_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue` (`queue`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `mx_session`
--
ALTER TABLE `mx_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access` (`access`);

--
-- Индексы таблицы `mx_site_content`
--
ALTER TABLE `mx_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`),
  ADD KEY `published` (`published`),
  ADD KEY `pub_date` (`pub_date`),
  ADD KEY `unpub_date` (`unpub_date`),
  ADD KEY `parent` (`parent`),
  ADD KEY `isfolder` (`isfolder`),
  ADD KEY `template` (`template`),
  ADD KEY `menuindex` (`menuindex`),
  ADD KEY `searchable` (`searchable`),
  ADD KEY `cacheable` (`cacheable`),
  ADD KEY `hidemenu` (`hidemenu`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `context_key` (`context_key`),
  ADD KEY `uri` (`uri`(191)),
  ADD KEY `uri_override` (`uri_override`),
  ADD KEY `hide_children_in_tree` (`hide_children_in_tree`),
  ADD KEY `show_in_tree` (`show_in_tree`),
  ADD KEY `cache_refresh_idx` (`parent`,`menuindex`,`id`);
ALTER TABLE `mx_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`longtitle`,`description`,`introtext`,`content`);

--
-- Индексы таблицы `mx_site_htmlsnippets`
--
ALTER TABLE `mx_site_htmlsnippets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `static` (`static`);

--
-- Индексы таблицы `mx_site_plugins`
--
ALTER TABLE `mx_site_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `static` (`static`);

--
-- Индексы таблицы `mx_site_plugin_events`
--
ALTER TABLE `mx_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`event`),
  ADD KEY `priority` (`priority`);

--
-- Индексы таблицы `mx_site_snippets`
--
ALTER TABLE `mx_site_snippets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `moduleguid` (`moduleguid`),
  ADD KEY `static` (`static`);

--
-- Индексы таблицы `mx_site_templates`
--
ALTER TABLE `mx_site_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templatename` (`templatename`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `static` (`static`);

--
-- Индексы таблицы `mx_site_tmplvars`
--
ALTER TABLE `mx_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `rank` (`rank`),
  ADD KEY `static` (`static`);

--
-- Индексы таблицы `mx_site_tmplvar_access`
--
ALTER TABLE `mx_site_tmplvar_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tmplvar_template` (`tmplvarid`,`documentgroup`);

--
-- Индексы таблицы `mx_site_tmplvar_contentvalues`
--
ALTER TABLE `mx_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tv_cnt` (`tmplvarid`,`contentid`),
  ADD KEY `tmplvarid` (`tmplvarid`),
  ADD KEY `contentid` (`contentid`);

--
-- Индексы таблицы `mx_site_tmplvar_templates`
--
ALTER TABLE `mx_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Индексы таблицы `mx_system_eventnames`
--
ALTER TABLE `mx_system_eventnames`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `mx_system_settings`
--
ALTER TABLE `mx_system_settings`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `mx_transport_packages`
--
ALTER TABLE `mx_transport_packages`
  ADD PRIMARY KEY (`signature`),
  ADD KEY `workspace` (`workspace`),
  ADD KEY `provider` (`provider`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `package_name` (`package_name`),
  ADD KEY `version_major` (`version_major`),
  ADD KEY `version_minor` (`version_minor`),
  ADD KEY `version_patch` (`version_patch`),
  ADD KEY `release` (`release`),
  ADD KEY `release_index` (`release_index`);

--
-- Индексы таблицы `mx_transport_providers`
--
ALTER TABLE `mx_transport_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `api_key` (`api_key`),
  ADD KEY `username` (`username`),
  ADD KEY `active` (`active`),
  ADD KEY `priority` (`priority`);

--
-- Индексы таблицы `mx_users`
--
ALTER TABLE `mx_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `remote_key` (`remote_key`),
  ADD KEY `primary_group` (`primary_group`);

--
-- Индексы таблицы `mx_user_attributes`
--
ALTER TABLE `mx_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `internalKey` (`internalKey`);

--
-- Индексы таблицы `mx_user_group_roles`
--
ALTER TABLE `mx_user_group_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `authority` (`authority`);

--
-- Индексы таблицы `mx_user_group_settings`
--
ALTER TABLE `mx_user_group_settings`
  ADD PRIMARY KEY (`group`,`key`);

--
-- Индексы таблицы `mx_user_messages`
--
ALTER TABLE `mx_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mx_user_settings`
--
ALTER TABLE `mx_user_settings`
  ADD PRIMARY KEY (`user`,`key`);

--
-- Индексы таблицы `mx_workspaces`
--
ALTER TABLE `mx_workspaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Индексы таблицы `ur_city`
--
ALTER TABLE `ur_city`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ur_config`
--
ALTER TABLE `ur_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_config` (`name`);

--
-- Индексы таблицы `ur_files`
--
ALTER TABLE `ur_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incloud` (`incloud`),
  ADD KEY `key` (`key`),
  ADD KEY `uid` (`uid`);

--
-- Индексы таблицы `ur_income`
--
ALTER TABLE `ur_income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `medobj` (`medobj`),
  ADD KEY `name` (`name`),
  ADD KEY `num` (`num`);

--
-- Индексы таблицы `ur_medobj`
--
ALTER TABLE `ur_medobj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Индексы таблицы `ur_status`
--
ALTER TABLE `ur_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_status_alias` (`tbl`,`alias`,`published`),
  ADD KEY `name` (`name`),
  ADD KEY `alias` (`alias`),
  ADD KEY `menuindex` (`menuindex`),
  ADD KEY `published` (`published`);

--
-- Индексы таблицы `ur_types`
--
ALTER TABLE `ur_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mx_access_actiondom`
--
ALTER TABLE `mx_access_actiondom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_actions`
--
ALTER TABLE `mx_access_actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_category`
--
ALTER TABLE `mx_access_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_context`
--
ALTER TABLE `mx_access_context`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `mx_access_elements`
--
ALTER TABLE `mx_access_elements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_media_source`
--
ALTER TABLE `mx_access_media_source`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_menus`
--
ALTER TABLE `mx_access_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_namespace`
--
ALTER TABLE `mx_access_namespace`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_permissions`
--
ALTER TABLE `mx_access_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT для таблицы `mx_access_policies`
--
ALTER TABLE `mx_access_policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `mx_access_policy_templates`
--
ALTER TABLE `mx_access_policy_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `mx_access_policy_template_groups`
--
ALTER TABLE `mx_access_policy_template_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `mx_access_resources`
--
ALTER TABLE `mx_access_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_access_resource_groups`
--
ALTER TABLE `mx_access_resource_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mx_access_templatevars`
--
ALTER TABLE `mx_access_templatevars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_actiondom`
--
ALTER TABLE `mx_actiondom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_actions`
--
ALTER TABLE `mx_actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_actions_fields`
--
ALTER TABLE `mx_actions_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT для таблицы `mx_categories`
--
ALTER TABLE `mx_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `mx_class_map`
--
ALTER TABLE `mx_class_map`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `mx_content_type`
--
ALTER TABLE `mx_content_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `mx_dashboard`
--
ALTER TABLE `mx_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mx_dashboard_widget`
--
ALTER TABLE `mx_dashboard_widget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `mx_documentgroup_names`
--
ALTER TABLE `mx_documentgroup_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mx_document_groups`
--
ALTER TABLE `mx_document_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `mx_extension_packages`
--
ALTER TABLE `mx_extension_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_fc_profiles`
--
ALTER TABLE `mx_fc_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_fc_sets`
--
ALTER TABLE `mx_fc_sets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_lexicon_entries`
--
ALTER TABLE `mx_lexicon_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_manager_log`
--
ALTER TABLE `mx_manager_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT для таблицы `mx_media_sources`
--
ALTER TABLE `mx_media_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mx_membergroup_names`
--
ALTER TABLE `mx_membergroup_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `mx_member_groups`
--
ALTER TABLE `mx_member_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `mx_property_set`
--
ALTER TABLE `mx_property_set`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_register_queues`
--
ALTER TABLE `mx_register_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `mx_register_topics`
--
ALTER TABLE `mx_register_topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `mx_site_content`
--
ALTER TABLE `mx_site_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `mx_site_htmlsnippets`
--
ALTER TABLE `mx_site_htmlsnippets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `mx_site_plugins`
--
ALTER TABLE `mx_site_plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `mx_site_snippets`
--
ALTER TABLE `mx_site_snippets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `mx_site_templates`
--
ALTER TABLE `mx_site_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `mx_site_tmplvars`
--
ALTER TABLE `mx_site_tmplvars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_site_tmplvar_access`
--
ALTER TABLE `mx_site_tmplvar_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_site_tmplvar_contentvalues`
--
ALTER TABLE `mx_site_tmplvar_contentvalues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_transport_providers`
--
ALTER TABLE `mx_transport_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mx_users`
--
ALTER TABLE `mx_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mx_user_attributes`
--
ALTER TABLE `mx_user_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mx_user_group_roles`
--
ALTER TABLE `mx_user_group_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `mx_user_messages`
--
ALTER TABLE `mx_user_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mx_workspaces`
--
ALTER TABLE `mx_workspaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ur_city`
--
ALTER TABLE `ur_city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `ur_config`
--
ALTER TABLE `ur_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ur_files`
--
ALTER TABLE `ur_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ur_income`
--
ALTER TABLE `ur_income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT для таблицы `ur_medobj`
--
ALTER TABLE `ur_medobj`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ur_status`
--
ALTER TABLE `ur_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `ur_types`
--
ALTER TABLE `ur_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
