-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14 Aug 2020 la 12:13
-- Versiune server: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adcode`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `broadcast_tables`
--

CREATE TABLE IF NOT EXISTS `broadcast_tables` (
  `id` int(10) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `spot` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `spot_broadcast` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `broadcast_tables`
--

INSERT INTO `broadcast_tables` (`id`, `uid`, `date`, `time`, `created_at`, `updated_at`, `spot`, `deleted`, `spot_broadcast`) VALUES
(1, NULL, '2020-06-01', '01:30:00.000', '2020-06-16 08:00:31', '2020-06-16 08:05:02', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `broadcast_types`
--

CREATE TABLE IF NOT EXISTS `broadcast_types` (
  `id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `broadcast_types`
--

INSERT INTO `broadcast_types` (`id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'Radio', '2020-06-19 07:26:25', '2020-06-19 07:26:25'),
(2, 'TV', '2020-06-19 07:26:33', '2020-06-19 07:26:33'),
(3, 'Web', '2020-06-19 07:26:41', '2020-06-19 07:26:41');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `core_store`
--

CREATE TABLE IF NOT EXISTS `core_store` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `core_store`
--

INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(1, 'db_model_strapi_webhooks', '{"name":{"type":"string"},"url":{"type":"text"},"headers":{"type":"json"},"events":{"type":"json"},"enabled":{"type":"boolean"}}', 'object', NULL, NULL),
(2, 'db_model_core_store', '{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}', 'object', NULL, NULL),
(3, 'db_model_users-permissions_permission', '{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}', 'object', NULL, NULL),
(4, 'db_model_upload_file', '{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(5, 'db_model_users-permissions_role', '{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}', 'object', NULL, NULL),
(6, 'db_model_strapi_administrator', '{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"required":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"blocked":{"type":"boolean","default":false,"configurable":false}}', 'object', NULL, NULL),
(7, 'db_model_users-permissions_user', '{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false},"cui":{"type":"string"},"address":{"type":"string"},"phone":{"type":"string"},"contact_name":{"type":"string"},"referrer":{"type":"string"},"talent_types":{"collection":"talent-type","attribute":"talent-type","column":"id","isVirtual":true},"broadcast_types":{"collection":"broadcast-type","attribute":"broadcast-type","column":"id","isVirtual":true},"avatar":{"type":"text"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(8, 'db_model_upload_file_morph', '{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"},"order":{"type":"integer"}}', 'object', NULL, NULL),
(9, 'plugin_email_provider', '{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}},"sendmail_default_from":"office@adcode.ro","sendmail_default_replyto":"office@adcode.ro"}', 'object', 'development', ''),
(10, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true}', 'object', 'development', ''),
(11, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","redirect_uri":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"/auth/instagram/callback"},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"/auth/vk/callback","scope":["email"]}}', 'object', '', ''),
(12, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{"uid":"plugins::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"controller":{"edit":{"label":"Controller","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Controller","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"enabled":{"edit":{"label":"Enabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Enabled","searchable":true,"sortable":true}},"policy":{"edit":{"label":"Policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Policy","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":false,"sortable":false}}},"layouts":{"list":["id","type","controller","action"],"editRelations":["role"],"edit":[[{"name":"type","size":6},{"name":"controller","size":6}],[{"name":"action","size":6},{"name":"enabled","size":4}],[{"name":"policy","size":6}]]}}', 'object', '', ''),
(13, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{"uid":"plugins::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}', 'object', '', ''),
(14, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{"uid":"plugins::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"related":{"edit":{"label":"Related","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"Related","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["related"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}', 'object', '', ''),
(15, 'plugin_content_manager_configuration_content_types::strapi::administrator', '{"uid":"strapi::administrator","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","blocked"],"editRelations":[],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"blocked","size":4}]]}}', 'object', '', ''),
(16, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{"uid":"plugins::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":false,"sortable":false}},"cui":{"edit":{"label":"Cui","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Cui","searchable":true,"sortable":true}},"address":{"edit":{"label":"Address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Address","searchable":true,"sortable":true}},"phone":{"edit":{"label":"Phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Phone","searchable":true,"sortable":true}},"contact_name":{"edit":{"label":"Contact_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Contact_name","searchable":true,"sortable":true}},"referrer":{"edit":{"label":"Referrer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Referrer","searchable":true,"sortable":true}},"avatar":{"edit":{"label":"Avatar","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Avatar","searchable":false,"sortable":false}},"talent_types":{"edit":{"label":"Talent_types","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type_name"},"list":{"label":"Talent_types","searchable":false,"sortable":false}},"broadcast_types":{"edit":{"label":"Broadcast_types","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type_name"},"list":{"label":"Broadcast_types","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"cui","size":6}],[{"name":"address","size":6},{"name":"phone","size":6}],[{"name":"contact_name","size":6},{"name":"referrer","size":6}],[{"name":"avatar","size":6}]],"editRelations":["role","talent_types","broadcast_types"]}}', 'object', '', ''),
(17, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}', 'object', '', ''),
(18, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_confirmation_redirection":"http://0.0.0.0:1337/admin","email_reset_password":"http://0.0.0.0:1337/admin","default_role":"authenticated"}', 'object', '', ''),
(19, 'db_model_spots', '{"uid":{"type":"string","unique":true,"required":true},"title":{"type":"string"},"client":{"type":"string"},"duration":{"type":"integer"},"status":{"type":"enumeration","enum":["PENDING","PUBLISHED","INACTIVATED","DELETED"]},"user":{"plugin":"users-permissions","model":"user"},"deleted":{"type":"boolean","default":false},"media_type":{"model":"madia-type"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(20, 'plugin_content_manager_configuration_content_types::application::spot.spot', '{"uid":"application::spot.spot","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"uid","defaultSortBy":"uid","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"uid":{"edit":{"label":"Uid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Uid","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"client":{"edit":{"label":"Client","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Client","searchable":true,"sortable":true}},"duration":{"edit":{"label":"Duration","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Duration","searchable":true,"sortable":true}},"status":{"edit":{"label":"Status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Status","searchable":true,"sortable":true}},"user":{"edit":{"label":"User","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"User","searchable":false,"sortable":false}},"deleted":{"edit":{"label":"Deleted","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Deleted","searchable":true,"sortable":true}},"media_type":{"edit":{"label":"Media_type","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type_name"},"list":{"label":"Media_type","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","uid","title","client"],"edit":[[{"name":"uid","size":6},{"name":"title","size":6}],[{"name":"client","size":6}],[{"name":"duration","size":4},{"name":"status","size":6}],[{"name":"deleted","size":4}]],"editRelations":["user","media_type"]}}', 'object', '', ''),
(21, 'db_model_spot_talents', '{"talent_role":{"type":"enumeration","enum":["voce","fata"]},"obs":{"type":"text"},"talent":{"plugin":"users-permissions","model":"user"},"spot":{"model":"spot"},"deleted":{"type":"boolean","default":false},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(22, 'plugin_content_manager_configuration_content_types::application::spot-talent.spot-talent', '{"uid":"application::spot-talent.spot-talent","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"talent_role":{"edit":{"label":"Talent_role","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Talent_role","searchable":true,"sortable":true}},"obs":{"edit":{"label":"Obs","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Obs","searchable":true,"sortable":true}},"talent":{"edit":{"label":"Talent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Talent","searchable":false,"sortable":false}},"spot":{"edit":{"label":"Spot","description":"","placeholder":"","visible":true,"editable":true,"mainField":"uid"},"list":{"label":"Spot","searchable":false,"sortable":false}},"deleted":{"edit":{"label":"Deleted","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Deleted","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","talent_role","obs","deleted"],"edit":[[{"name":"talent_role","size":6}],[{"name":"obs","size":6},{"name":"deleted","size":4}]],"editRelations":["spot","talent"]}}', 'object', '', ''),
(23, 'db_model_spot_broadcasts', '{"broadcast_duration":{"type":"integer"},"start_date":{"type":"date"},"spot":{"model":"spot"},"deleted":{"type":"boolean","default":false},"broadcaster":{"columnName":"broadcaster","plugin":"users-permissions","model":"user"},"broadcast_types":{"collection":"broadcast-type","attribute":"broadcast-type","column":"id","isVirtual":true},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(24, 'plugin_content_manager_configuration_content_types::application::spot-broadcast.spot-broadcast', '{"uid":"application::spot-broadcast.spot-broadcast","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"broadcast_duration":{"edit":{"label":"Broadcast_duration","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Broadcast_duration","searchable":true,"sortable":true}},"start_date":{"edit":{"label":"Start_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Start_date","searchable":true,"sortable":true}},"spot":{"edit":{"label":"Spot","description":"","placeholder":"","visible":true,"editable":true,"mainField":"uid"},"list":{"label":"Spot","searchable":false,"sortable":false}},"deleted":{"edit":{"label":"Deleted","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Deleted","searchable":true,"sortable":true}},"broadcaster":{"edit":{"label":"Broadcaster","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Broadcaster","searchable":false,"sortable":false}},"broadcast_types":{"edit":{"label":"Broadcast_types","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type_name"},"list":{"label":"Broadcast_types","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","broadcast_duration","start_date","deleted"],"edit":[[{"name":"broadcast_duration","size":4}],[{"name":"start_date","size":4}],[{"name":"deleted","size":4}]],"editRelations":["spot","broadcaster","broadcast_types"]}}', 'object', '', ''),
(25, 'db_model_broadcast_tables', '{"date":{"type":"date"},"time":{"type":"time"},"deleted":{"type":"boolean","default":false},"spot_broadcast":{"model":"spot-broadcast"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(26, 'plugin_content_manager_configuration_content_types::application::broadcast-table.broadcast-table', '{"uid":"application::broadcast-table.broadcast-table","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"date":{"edit":{"label":"Date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Date","searchable":true,"sortable":true}},"time":{"edit":{"label":"Time","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Time","searchable":true,"sortable":true}},"deleted":{"edit":{"label":"Deleted","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Deleted","searchable":true,"sortable":true}},"spot_broadcast":{"edit":{"label":"Spot_broadcast","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"Spot_broadcast","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","date","time","deleted"],"edit":[[{"name":"date","size":4}],[{"name":"time","size":4},{"name":"deleted","size":4}]],"editRelations":["spot_broadcast"]}}', 'object', '', ''),
(27, 'db_model_spot_talents__uid', '{"spot_talent_id":{"type":"integer"},"spot_id":{"type":"integer"}}', 'object', NULL, NULL),
(28, 'plugin_email_provider', '{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}}}', 'object', 'production', ''),
(29, 'plugin_email_provider', '{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}}}', 'object', 'staging', ''),
(30, 'db_model_students', '{"student_name":{"type":"string"},"grade":{"type":"string"},"class":{"model":"class"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(32, 'db_model_classes', '{"class_name":{"type":"string"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(33, 'db_model_talent_types', '{"type_name":{"type":"string"},"deleted":{"type":"boolean","default":false},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(34, 'plugin_content_manager_configuration_content_types::application::talent-type.talent-type', '{"uid":"application::talent-type.talent-type","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type_name","defaultSortBy":"type_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type_name":{"edit":{"label":"Type_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type_name","searchable":true,"sortable":true}},"deleted":{"edit":{"label":"Deleted","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Deleted","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","type_name","deleted","created_at"],"editRelations":[],"edit":[[{"name":"type_name","size":6},{"name":"deleted","size":4}]]}}', 'object', '', ''),
(35, 'db_model_users-permissions_user__talent_type', '{"users-permissions_user_id":{"type":"integer"},"talent-type_id":{"type":"integer"}}', 'object', NULL, NULL),
(36, 'db_model_madia_types', '{"type_name":{"type":"string"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(37, 'plugin_content_manager_configuration_content_types::application::madia-type.madia-type', '{"uid":"application::madia-type.madia-type","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type_name","defaultSortBy":"type_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type_name":{"edit":{"label":"Type_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type_name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","type_name","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"type_name","size":6}]]}}', 'object', '', ''),
(38, 'db_model_broadcast_types', '{"type_name":{"type":"string"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(39, 'plugin_content_manager_configuration_content_types::application::broadcast-type.broadcast-type', '{"uid":"application::broadcast-type.broadcast-type","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type_name","defaultSortBy":"type_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type_name":{"edit":{"label":"Type_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type_name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","type_name","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"type_name","size":6}]]}}', 'object', '', ''),
(40, 'db_model_spot_broadcasts__broadcast_types', '{"spot_broadcast_id":{"type":"integer"},"broadcast-type_id":{"type":"integer"}}', 'object', NULL, NULL),
(41, 'db_model_spots__media_types', '{"spot_id":{"type":"integer"},"madia-type_id":{"type":"integer"}}', 'object', NULL, NULL),
(42, 'db_model_users-permissions_user__broadcast_type', '{"users-permissions_user_id":{"type":"integer"},"broadcast-type_id":{"type":"integer"}}', 'object', NULL, NULL),
(43, 'db_model_users-permissions_user__talent_types', '{"users-permissions_user_id":{"type":"integer"},"talent-type_id":{"type":"integer"}}', 'object', NULL, NULL),
(44, 'db_model_users-permissions_user__broadcast_types', '{"users-permissions_user_id":{"type":"integer"},"broadcast-type_id":{"type":"integer"}}', 'object', NULL, NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `madia_types`
--

CREATE TABLE IF NOT EXISTS `madia_types` (
  `id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `madia_types`
--

INSERT INTO `madia_types` (`id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'AUDIO', '2020-06-19 07:24:50', '2020-08-10 08:23:05'),
(2, 'VIDEO', '2020-06-19 07:24:58', '2020-08-10 08:23:12');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `spots`
--

CREATE TABLE IF NOT EXISTS `spots` (
  `id` int(10) unsigned NOT NULL,
  `uid` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `media_type` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spots`
--

INSERT INTO `spots` (`id`, `uid`, `title`, `client`, `duration`, `status`, `referrer`, `created_at`, `updated_at`, `user`, `deleted`, `media_type`) VALUES
(1, 'K2N9SCA4', 'Spot 7', 'Emag1', 20, 'PENDING', 'ref 2', '2020-05-26 08:54:32', '2020-08-14 07:12:11', 1, 0, 2),
(2, '0K76VLPW', 'Spot 2', 'Media Galaxy', 20, 'PENDING', 'ref', '2020-05-29 09:00:23', '2020-06-19 07:42:31', 1, 0, NULL),
(8, 'QQQQQQQQ', 'Spot 3', 'Client 1', 30, 'PENDING', NULL, '2020-06-11 10:31:41', '2020-07-02 06:00:25', 1, 0, NULL),
(9, 'ZZZZZZZZ', 'SPOT 5', 'Emag', 20, NULL, NULL, '2020-07-10 09:25:39', '2020-07-10 09:25:39', 1, 0, NULL),
(10, 'AAAAAAA', 'SPOT 7', 'Emag', 50, 'PENDING', NULL, '2020-07-10 09:26:03', '2020-07-10 09:26:03', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `spots__media_types`
--

CREATE TABLE IF NOT EXISTS `spots__media_types` (
  `id` int(10) unsigned NOT NULL,
  `spot_id` int(11) DEFAULT NULL,
  `madia-type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spots__media_types`
--

INSERT INTO `spots__media_types` (`id`, `spot_id`, `madia-type_id`) VALUES
(1, 2, 1),
(2, 1, 2),
(5, 8, 2),
(6, 8, 1),
(7, 9, 1);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `spot_broadcasts`
--

CREATE TABLE IF NOT EXISTS `spot_broadcasts` (
  `id` int(10) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `broadcast_duration` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `spot` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `broadcaster` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spot_broadcasts`
--

INSERT INTO `spot_broadcasts` (`id`, `uid`, `broadcast_duration`, `start_date`, `media_type`, `created_at`, `updated_at`, `spot`, `deleted`, `user`, `broadcaster`) VALUES
(1, NULL, 50, '2020-08-03', 'AUDIO', '2020-06-11 10:54:18', '2020-08-03 06:29:31', 2, 0, 3, 3);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `spot_broadcasts__broadcast_types`
--

CREATE TABLE IF NOT EXISTS `spot_broadcasts__broadcast_types` (
  `id` int(10) unsigned NOT NULL,
  `spot_broadcast_id` int(11) DEFAULT NULL,
  `broadcast-type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spot_broadcasts__broadcast_types`
--

INSERT INTO `spot_broadcasts__broadcast_types` (`id`, `spot_broadcast_id`, `broadcast-type_id`) VALUES
(1, 1, 3),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `spot_talents`
--

CREATE TABLE IF NOT EXISTS `spot_talents` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `talent_role` varchar(255) DEFAULT NULL,
  `obs` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `spot` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `talent` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spot_talents`
--

INSERT INTO `spot_talents` (`id`, `uid`, `talent_role`, `obs`, `created_at`, `updated_at`, `spot`, `user`, `deleted`, `talent`) VALUES
(41, NULL, 'voce', 'Observatii artist 1', '2020-08-13 16:25:33', '2020-08-14 07:12:11', 1, NULL, 0, 123);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `spot_talents__uid`
--

CREATE TABLE IF NOT EXISTS `spot_talents__uid` (
  `id` int(10) unsigned NOT NULL,
  `spot_talent_id` int(11) DEFAULT NULL,
  `spot_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spot_talents__uid`
--

INSERT INTO `spot_talents__uid` (`id`, `spot_talent_id`, `spot_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `strapi_administrator`
--

CREATE TABLE IF NOT EXISTS `strapi_administrator` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `strapi_administrator`
--

INSERT INTO `strapi_administrator` (`id`, `username`, `email`, `password`, `resetPasswordToken`, `blocked`) VALUES
(1, 'admin', 'web.bitbrother@gmail.com', '$2a$10$26f1VPdsZEIHdoNG44tCTu52HzoRBuNeGULVMuvQPty0LiPpGXBle', NULL, NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `strapi_webhooks`
--

CREATE TABLE IF NOT EXISTS `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` longtext,
  `events` longtext,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `talent_types`
--

CREATE TABLE IF NOT EXISTS `talent_types` (
  `id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `talent_types`
--

INSERT INTO `talent_types` (`id`, `type_name`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Voice', 0, '2020-06-19 05:52:33', '2020-06-19 05:52:33'),
(2, 'Face', 0, '2020-06-19 05:52:42', '2020-06-19 05:52:42');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `upload_file`
--

CREATE TABLE IF NOT EXISTS `upload_file` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `upload_file`
--

INSERT INTO `upload_file` (`id`, `name`, `alternativeText`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `previewUrl`, `provider`, `provider_metadata`, `created_at`, `updated_at`) VALUES
(1, 'planeta', '', '', 450, 357, '{"thumbnail":{"hash":"thumbnail_planeta_816f356644","ext":".png","mime":"image/png","width":197,"height":156,"size":13.49,"path":null,"url":"/uploads/thumbnail_planeta_816f356644.png"}}', 'planeta_816f356644', '.png', 'image/png', '17.14', '/uploads/planeta_816f356644.png', NULL, 'local', NULL, '2020-06-10 10:25:36', '2020-06-10 10:25:36'),
(2, 'images', '', '', 275, 183, '{"thumbnail":{"hash":"thumbnail_images_c7b2dd5a86","ext":".jpeg","mime":"image/jpeg","width":234,"height":156,"size":8.1,"path":null,"url":"/uploads/thumbnail_images_c7b2dd5a86.jpeg"}}', 'images_c7b2dd5a86', '.jpeg', 'image/jpeg', '10.71', '/uploads/images_c7b2dd5a86.jpeg', NULL, 'local', NULL, '2020-07-06 06:39:59', '2020-07-06 06:39:59'),
(3, 'na_5b86b74972042', '', '', 275, 183, '{"thumbnail":{"hash":"thumbnail_na_5b86b74972042_673c21fe3a","ext":".jpeg","mime":"image/jpeg","width":234,"height":156,"size":8.1,"path":null,"url":"/uploads/thumbnail_na_5b86b74972042_673c21fe3a.jpeg"}}', 'na_5b86b74972042_673c21fe3a', '.jpeg', 'image/jpeg', '10.71', '/uploads/na_5b86b74972042_673c21fe3a.jpeg', NULL, 'local', NULL, '2020-07-06 06:40:00', '2020-07-06 06:40:34'),
(4, 'Studio 1', '', '', 128, 128, NULL, 'Light_Bulb_ff8b9abbe9', '.png', 'image/png', '9.09', '/uploads/Light_Bulb_ff8b9abbe9.png', NULL, 'local', NULL, '2020-07-30 03:52:48', '2020-07-30 03:53:07'),
(5, 'Light Bulb', '', '', 128, 128, NULL, 'Light_Bulb_2c3d273ae2', '.png', 'image/png', '9.09', '/uploads/Light_Bulb_2c3d273ae2.png', NULL, 'local', NULL, '2020-08-06 09:29:49', '2020-08-06 09:29:49');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `upload_file_morph`
--

CREATE TABLE IF NOT EXISTS `upload_file_morph` (
  `id` int(10) unsigned NOT NULL,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `upload_file_morph`
--

INSERT INTO `upload_file_morph` (`id`, `upload_file_id`, `related_id`, `related_type`, `field`, `order`) VALUES
(3, 4, 1, 'users-permissions_user', 'avatar', 1);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users-permissions_permission`
--

CREATE TABLE IF NOT EXISTS `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=871 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_permission`
--

INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`) VALUES
(1, 'content-manager', 'components', 'findcomponent', 0, '', 1),
(2, 'content-manager', 'components', 'findcomponent', 0, '', 2),
(3, 'content-manager', 'components', 'listcomponents', 0, '', 1),
(4, 'content-manager', 'components', 'listcomponents', 0, '', 2),
(5, 'content-manager', 'components', 'updatecomponent', 0, '', 1),
(6, 'content-manager', 'components', 'updatecomponent', 0, '', 2),
(7, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 1),
(8, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 2),
(9, 'content-manager', 'contentmanager', 'count', 0, '', 1),
(10, 'content-manager', 'contentmanager', 'count', 0, '', 2),
(11, 'content-manager', 'contentmanager', 'create', 0, '', 1),
(12, 'content-manager', 'contentmanager', 'create', 0, '', 2),
(13, 'content-manager', 'contentmanager', 'delete', 0, '', 1),
(14, 'content-manager', 'contentmanager', 'delete', 0, '', 2),
(15, 'content-manager', 'contentmanager', 'deletemany', 0, '', 1),
(16, 'content-manager', 'contentmanager', 'deletemany', 0, '', 2),
(17, 'content-manager', 'contentmanager', 'find', 0, '', 1),
(18, 'content-manager', 'contentmanager', 'find', 0, '', 2),
(19, 'content-manager', 'contentmanager', 'findone', 0, '', 1),
(20, 'content-manager', 'contentmanager', 'findone', 0, '', 2),
(21, 'content-manager', 'contentmanager', 'generateuid', 0, '', 1),
(22, 'content-manager', 'contentmanager', 'generateuid', 0, '', 2),
(23, 'content-manager', 'contentmanager', 'update', 0, '', 1),
(24, 'content-manager', 'contentmanager', 'update', 0, '', 2),
(25, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 1),
(26, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 2),
(27, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 1),
(28, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 2),
(29, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 1),
(30, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 2),
(31, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 1),
(32, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 2),
(33, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 1),
(34, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 2),
(35, 'content-type-builder', 'components', 'createcomponent', 0, '', 1),
(36, 'content-type-builder', 'components', 'createcomponent', 0, '', 2),
(37, 'content-type-builder', 'components', 'deletecomponent', 0, '', 1),
(38, 'content-type-builder', 'components', 'deletecomponent', 0, '', 2),
(39, 'content-type-builder', 'components', 'getcomponent', 0, '', 1),
(40, 'content-type-builder', 'components', 'getcomponent', 0, '', 2),
(41, 'content-type-builder', 'components', 'getcomponents', 0, '', 1),
(42, 'content-type-builder', 'components', 'getcomponents', 0, '', 2),
(43, 'content-type-builder', 'components', 'updatecomponent', 0, '', 1),
(44, 'content-type-builder', 'components', 'updatecomponent', 0, '', 2),
(45, 'content-type-builder', 'connections', 'getconnections', 0, '', 1),
(46, 'content-type-builder', 'connections', 'getconnections', 0, '', 2),
(47, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 2),
(48, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 1),
(49, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 1),
(50, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 2),
(51, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 1),
(52, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 2),
(53, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 1),
(54, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 2),
(55, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 1),
(56, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 2),
(57, 'email', 'email', 'getenvironments', 0, '', 1),
(58, 'email', 'email', 'getenvironments', 0, '', 2),
(59, 'email', 'email', 'getsettings', 0, '', 1),
(60, 'email', 'email', 'getsettings', 0, '', 2),
(61, 'email', 'email', 'send', 0, '', 1),
(62, 'email', 'email', 'send', 0, '', 2),
(63, 'email', 'email', 'updatesettings', 0, '', 1),
(64, 'email', 'email', 'updatesettings', 0, '', 2),
(65, 'upload', 'proxy', 'uploadproxy', 0, '', 1),
(66, 'upload', 'proxy', 'uploadproxy', 0, '', 2),
(67, 'upload', 'upload', 'count', 0, '', 1),
(68, 'upload', 'upload', 'count', 0, '', 2),
(69, 'upload', 'upload', 'destroy', 0, '', 1),
(70, 'upload', 'upload', 'destroy', 0, '', 2),
(71, 'upload', 'upload', 'find', 0, '', 2),
(72, 'upload', 'upload', 'findone', 0, '', 1),
(73, 'upload', 'upload', 'findone', 0, '', 2),
(74, 'upload', 'upload', 'getsettings', 0, '', 1),
(75, 'upload', 'upload', 'search', 0, '', 1),
(76, 'upload', 'upload', 'find', 0, '', 1),
(77, 'upload', 'upload', 'getsettings', 0, '', 2),
(78, 'upload', 'upload', 'search', 0, '', 2),
(79, 'upload', 'upload', 'updatesettings', 0, '', 1),
(80, 'upload', 'upload', 'updatesettings', 0, '', 2),
(81, 'upload', 'upload', 'upload', 0, '', 1),
(82, 'upload', 'upload', 'upload', 0, '', 2),
(83, 'users-permissions', 'auth', 'callback', 0, '', 1),
(84, 'users-permissions', 'auth', 'callback', 1, '', 2),
(85, 'users-permissions', 'auth', 'changepassword', 0, '', 1),
(86, 'users-permissions', 'auth', 'changepassword', 1, '', 2),
(87, 'users-permissions', 'auth', 'connect', 1, '', 1),
(88, 'users-permissions', 'auth', 'connect', 1, '', 2),
(89, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 1),
(90, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 2),
(91, 'users-permissions', 'auth', 'forgotpassword', 0, '', 1),
(92, 'users-permissions', 'auth', 'forgotpassword', 1, '', 2),
(93, 'users-permissions', 'auth', 'register', 0, '', 1),
(94, 'users-permissions', 'auth', 'register', 1, '', 2),
(95, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 1),
(96, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 2),
(97, 'users-permissions', 'user', 'create', 0, '', 1),
(98, 'users-permissions', 'user', 'create', 1, '', 2),
(99, 'users-permissions', 'user', 'destroy', 0, '', 1),
(100, 'users-permissions', 'user', 'destroy', 1, '', 2),
(101, 'users-permissions', 'user', 'destroyall', 0, '', 1),
(102, 'users-permissions', 'user', 'destroyall', 1, '', 2),
(103, 'users-permissions', 'user', 'find', 0, '', 1),
(104, 'users-permissions', 'user', 'find', 1, '', 2),
(105, 'users-permissions', 'user', 'findone', 0, '', 1),
(106, 'users-permissions', 'user', 'findone', 1, '', 2),
(107, 'users-permissions', 'user', 'me', 1, '', 1),
(108, 'users-permissions', 'user', 'me', 1, '', 2),
(109, 'users-permissions', 'user', 'update', 0, '', 1),
(110, 'users-permissions', 'user', 'update', 1, '', 2),
(111, 'users-permissions', 'userspermissions', 'createrole', 0, '', 1),
(112, 'users-permissions', 'userspermissions', 'createrole', 0, '', 2),
(113, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 1),
(114, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 2),
(115, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 1),
(116, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 2),
(117, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 1),
(118, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 2),
(119, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 1),
(120, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 2),
(121, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 1),
(122, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 2),
(123, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 1),
(124, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 2),
(125, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 1),
(126, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 2),
(127, 'users-permissions', 'userspermissions', 'getrole', 0, '', 1),
(128, 'users-permissions', 'userspermissions', 'getrole', 0, '', 2),
(129, 'users-permissions', 'userspermissions', 'getroles', 0, '', 1),
(130, 'users-permissions', 'userspermissions', 'getroles', 0, '', 2),
(131, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 1),
(132, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 2),
(133, 'users-permissions', 'userspermissions', 'index', 0, '', 1),
(134, 'users-permissions', 'userspermissions', 'index', 0, '', 2),
(135, 'users-permissions', 'userspermissions', 'init', 1, '', 1),
(136, 'users-permissions', 'userspermissions', 'init', 1, '', 2),
(137, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 1),
(138, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 2),
(139, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 1),
(140, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 2),
(141, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 1),
(142, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 2),
(143, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 1),
(144, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 2),
(145, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 1),
(146, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2),
(147, 'application', 'spot', 'count', 1, '', 1),
(148, 'application', 'spot', 'count', 1, '', 2),
(149, 'application', 'spot', 'create', 1, '', 1),
(150, 'application', 'spot', 'create', 1, '', 2),
(151, 'application', 'spot', 'delete', 1, '', 1),
(152, 'application', 'spot', 'delete', 1, '', 2),
(153, 'application', 'spot', 'find', 1, '', 1),
(154, 'application', 'spot', 'find', 1, '', 2),
(155, 'application', 'spot', 'findone', 1, '', 1),
(156, 'application', 'spot', 'findone', 1, '', 2),
(157, 'application', 'spot', 'update', 1, '', 1),
(158, 'application', 'spot', 'update', 1, '', 2),
(159, 'application', 'spot-talent', 'count', 0, '', 1),
(160, 'application', 'spot-talent', 'count', 1, '', 2),
(161, 'application', 'spot-talent', 'create', 0, '', 1),
(162, 'application', 'spot-talent', 'create', 1, '', 2),
(163, 'application', 'spot-talent', 'delete', 0, '', 1),
(164, 'application', 'spot-talent', 'delete', 1, '', 2),
(165, 'application', 'spot-talent', 'find', 0, '', 1),
(166, 'application', 'spot-talent', 'find', 1, '', 2),
(167, 'application', 'spot-talent', 'findone', 0, '', 1),
(168, 'application', 'spot-talent', 'findone', 1, '', 2),
(169, 'application', 'spot-talent', 'update', 0, '', 1),
(170, 'application', 'spot-talent', 'update', 1, '', 2),
(171, 'application', 'spot-broadcast', 'count', 0, '', 1),
(172, 'application', 'spot-broadcast', 'count', 1, '', 2),
(173, 'application', 'spot-broadcast', 'delete', 0, '', 1),
(174, 'application', 'spot-broadcast', 'find', 0, '', 1),
(175, 'application', 'spot-broadcast', 'create', 1, '', 2),
(176, 'application', 'spot-broadcast', 'find', 1, '', 2),
(177, 'application', 'spot-broadcast', 'findone', 0, '', 1),
(178, 'application', 'spot-broadcast', 'create', 0, '', 1),
(179, 'application', 'spot-broadcast', 'delete', 1, '', 2),
(180, 'application', 'spot-broadcast', 'findone', 1, '', 2),
(181, 'application', 'spot-broadcast', 'update', 0, '', 1),
(182, 'application', 'spot-broadcast', 'update', 1, '', 2),
(183, 'application', 'broadcast-table', 'count', 0, '', 1),
(184, 'application', 'broadcast-table', 'count', 1, '', 2),
(185, 'application', 'broadcast-table', 'create', 0, '', 1),
(186, 'application', 'broadcast-table', 'create', 1, '', 2),
(187, 'application', 'broadcast-table', 'delete', 0, '', 1),
(188, 'application', 'broadcast-table', 'delete', 1, '', 2),
(189, 'application', 'broadcast-table', 'find', 0, '', 1),
(190, 'application', 'broadcast-table', 'find', 1, '', 2),
(191, 'application', 'broadcast-table', 'findone', 0, '', 1),
(192, 'application', 'broadcast-table', 'findone', 1, '', 2),
(193, 'application', 'broadcast-table', 'update', 0, '', 1),
(194, 'application', 'broadcast-table', 'update', 1, '', 2),
(195, 'application', 'broadcast-table', 'find', 0, '', 3),
(196, 'application', 'broadcast-table', 'findone', 0, '', 3),
(197, 'application', 'broadcast-table', 'count', 0, '', 3),
(198, 'application', 'broadcast-table', 'create', 0, '', 3),
(199, 'application', 'broadcast-table', 'update', 0, '', 3),
(200, 'application', 'broadcast-table', 'delete', 0, '', 3),
(201, 'application', 'spot-broadcast', 'find', 0, '', 3),
(202, 'application', 'spot-broadcast', 'findone', 0, '', 3),
(203, 'application', 'spot-broadcast', 'count', 0, '', 3),
(204, 'application', 'spot-broadcast', 'create', 0, '', 3),
(205, 'application', 'spot-broadcast', 'update', 0, '', 3),
(206, 'application', 'spot-broadcast', 'delete', 0, '', 3),
(207, 'application', 'spot-talent', 'find', 0, '', 3),
(208, 'application', 'spot-talent', 'findone', 0, '', 3),
(209, 'application', 'spot-talent', 'count', 0, '', 3),
(210, 'application', 'spot-talent', 'create', 0, '', 3),
(211, 'application', 'spot-talent', 'update', 0, '', 3),
(212, 'application', 'spot-talent', 'delete', 0, '', 3),
(213, 'application', 'spot', 'find', 1, '', 3),
(214, 'application', 'spot', 'findone', 1, '', 3),
(215, 'application', 'spot', 'count', 1, '', 3),
(216, 'application', 'spot', 'create', 1, '', 3),
(217, 'application', 'spot', 'update', 1, '', 3),
(218, 'application', 'spot', 'delete', 1, '', 3),
(219, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 3),
(220, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 3),
(221, 'content-type-builder', 'components', 'getcomponents', 0, '', 3),
(222, 'content-type-builder', 'components', 'getcomponent', 0, '', 3),
(223, 'content-type-builder', 'components', 'createcomponent', 0, '', 3),
(224, 'content-type-builder', 'components', 'updatecomponent', 0, '', 3),
(225, 'content-type-builder', 'components', 'deletecomponent', 0, '', 3),
(226, 'content-type-builder', 'connections', 'getconnections', 0, '', 3),
(227, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 3),
(228, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 3),
(229, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 3),
(230, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 3),
(231, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 3),
(232, 'content-manager', 'components', 'listcomponents', 0, '', 3),
(233, 'content-manager', 'components', 'findcomponent', 0, '', 3),
(234, 'content-manager', 'components', 'updatecomponent', 0, '', 3),
(235, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 3),
(236, 'content-manager', 'contentmanager', 'update', 0, '', 3),
(237, 'content-manager', 'contentmanager', 'deletemany', 0, '', 3),
(238, 'content-manager', 'contentmanager', 'delete', 0, '', 3),
(239, 'content-manager', 'contentmanager', 'findone', 0, '', 3),
(240, 'content-manager', 'contentmanager', 'count', 0, '', 3),
(241, 'content-manager', 'contentmanager', 'find', 0, '', 3),
(242, 'content-manager', 'contentmanager', 'generateuid', 0, '', 3),
(243, 'content-manager', 'contentmanager', 'create', 0, '', 3),
(244, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 3),
(245, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 3),
(246, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 3),
(247, 'users-permissions', 'auth', 'callback', 0, '', 3),
(248, 'users-permissions', 'auth', 'changepassword', 0, '', 3),
(249, 'users-permissions', 'auth', 'connect', 0, '', 3),
(250, 'users-permissions', 'auth', 'register', 0, '', 3),
(251, 'users-permissions', 'auth', 'forgotpassword', 0, '', 3),
(252, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 3),
(253, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 3),
(254, 'users-permissions', 'user', 'find', 1, '', 3),
(255, 'users-permissions', 'user', 'me', 1, '', 3),
(256, 'users-permissions', 'user', 'findone', 1, '', 3),
(257, 'users-permissions', 'user', 'create', 1, '', 3),
(258, 'users-permissions', 'user', 'update', 1, '', 3),
(259, 'users-permissions', 'user', 'destroy', 1, '', 3),
(260, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 3),
(261, 'users-permissions', 'user', 'destroyall', 1, '', 3),
(262, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 3),
(263, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 3),
(264, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 3),
(265, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 3),
(266, 'users-permissions', 'userspermissions', 'getroles', 0, '', 3),
(267, 'users-permissions', 'userspermissions', 'getrole', 0, '', 3),
(268, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 3),
(269, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 3),
(270, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 3),
(271, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 3),
(272, 'users-permissions', 'userspermissions', 'init', 0, '', 3),
(273, 'users-permissions', 'userspermissions', 'index', 0, '', 3),
(274, 'users-permissions', 'userspermissions', 'createrole', 0, '', 3),
(275, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 3),
(276, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 3),
(277, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 3),
(278, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 3),
(279, 'email', 'email', 'send', 0, '', 3),
(280, 'email', 'email', 'getenvironments', 0, '', 3),
(281, 'email', 'email', 'getsettings', 0, '', 3),
(282, 'email', 'email', 'updatesettings', 0, '', 3),
(283, 'upload', 'proxy', 'uploadproxy', 0, '', 3),
(284, 'upload', 'upload', 'upload', 1, '', 3),
(285, 'upload', 'upload', 'getsettings', 1, '', 3),
(286, 'upload', 'upload', 'updatesettings', 1, '', 3),
(287, 'upload', 'upload', 'findone', 1, '', 3),
(288, 'upload', 'upload', 'find', 1, '', 3),
(289, 'upload', 'upload', 'count', 1, '', 3),
(290, 'upload', 'upload', 'destroy', 1, '', 3),
(291, 'upload', 'upload', 'search', 1, '', 3),
(292, 'application', 'broadcast-table', 'find', 0, '', 4),
(293, 'application', 'broadcast-table', 'findone', 0, '', 4),
(294, 'application', 'broadcast-table', 'count', 0, '', 4),
(295, 'application', 'broadcast-table', 'create', 0, '', 4),
(296, 'application', 'broadcast-table', 'update', 0, '', 4),
(297, 'application', 'broadcast-table', 'delete', 0, '', 4),
(298, 'application', 'spot-broadcast', 'find', 0, '', 4),
(299, 'application', 'spot-broadcast', 'findone', 0, '', 4),
(300, 'application', 'spot-broadcast', 'count', 0, '', 4),
(301, 'application', 'spot-broadcast', 'create', 0, '', 4),
(302, 'application', 'spot-broadcast', 'update', 0, '', 4),
(303, 'application', 'spot-broadcast', 'delete', 0, '', 4),
(304, 'application', 'spot-talent', 'find', 0, '', 4),
(305, 'application', 'spot-talent', 'findone', 0, '', 4),
(306, 'application', 'spot-talent', 'count', 0, '', 4),
(307, 'application', 'spot-talent', 'create', 0, '', 4),
(308, 'application', 'spot-talent', 'update', 0, '', 4),
(309, 'application', 'spot-talent', 'delete', 0, '', 4),
(310, 'application', 'spot', 'find', 0, '', 4),
(311, 'application', 'spot', 'findone', 0, '', 4),
(312, 'application', 'spot', 'count', 0, '', 4),
(313, 'application', 'spot', 'create', 0, '', 4),
(314, 'application', 'spot', 'update', 0, '', 4),
(315, 'application', 'spot', 'delete', 0, '', 4),
(316, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 4),
(317, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 4),
(318, 'content-type-builder', 'components', 'getcomponents', 0, '', 4),
(319, 'content-type-builder', 'components', 'getcomponent', 0, '', 4),
(320, 'content-type-builder', 'components', 'createcomponent', 0, '', 4),
(321, 'content-type-builder', 'components', 'updatecomponent', 0, '', 4),
(322, 'content-type-builder', 'components', 'deletecomponent', 0, '', 4),
(323, 'content-type-builder', 'connections', 'getconnections', 0, '', 4),
(324, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 4),
(325, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 4),
(326, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 4),
(327, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 4),
(328, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 4),
(329, 'content-manager', 'components', 'listcomponents', 0, '', 4),
(330, 'content-manager', 'components', 'findcomponent', 0, '', 4),
(331, 'content-manager', 'components', 'updatecomponent', 0, '', 4),
(332, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 4),
(333, 'content-manager', 'contentmanager', 'update', 0, '', 4),
(334, 'content-manager', 'contentmanager', 'deletemany', 0, '', 4),
(335, 'content-manager', 'contentmanager', 'delete', 0, '', 4),
(336, 'content-manager', 'contentmanager', 'findone', 0, '', 4),
(337, 'content-manager', 'contentmanager', 'count', 0, '', 4),
(338, 'content-manager', 'contentmanager', 'find', 0, '', 4),
(339, 'content-manager', 'contentmanager', 'generateuid', 0, '', 4),
(340, 'content-manager', 'contentmanager', 'create', 0, '', 4),
(341, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 4),
(342, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 4),
(343, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 4),
(344, 'users-permissions', 'auth', 'callback', 0, '', 4),
(345, 'users-permissions', 'auth', 'changepassword', 0, '', 4),
(346, 'users-permissions', 'auth', 'connect', 0, '', 4),
(347, 'users-permissions', 'auth', 'forgotpassword', 0, '', 4),
(348, 'users-permissions', 'auth', 'register', 0, '', 4),
(349, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 4),
(350, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 4),
(351, 'users-permissions', 'user', 'find', 0, '', 4),
(352, 'users-permissions', 'user', 'me', 0, '', 4),
(353, 'users-permissions', 'user', 'findone', 0, '', 4),
(354, 'users-permissions', 'user', 'create', 0, '', 4),
(355, 'users-permissions', 'user', 'update', 0, '', 4),
(356, 'users-permissions', 'user', 'destroy', 0, '', 4),
(357, 'users-permissions', 'user', 'destroyall', 0, '', 4),
(358, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 4),
(359, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 4),
(360, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 4),
(361, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 4),
(362, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 4),
(363, 'users-permissions', 'userspermissions', 'getroles', 0, '', 4),
(364, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 4),
(365, 'users-permissions', 'userspermissions', 'getrole', 0, '', 4),
(366, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 4),
(367, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 4),
(368, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 4),
(369, 'users-permissions', 'userspermissions', 'init', 0, '', 4),
(370, 'users-permissions', 'userspermissions', 'index', 0, '', 4),
(371, 'users-permissions', 'userspermissions', 'createrole', 0, '', 4),
(372, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 4),
(373, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 4),
(374, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 4),
(375, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 4),
(376, 'email', 'email', 'send', 0, '', 4),
(377, 'email', 'email', 'getenvironments', 0, '', 4),
(378, 'email', 'email', 'getsettings', 0, '', 4),
(379, 'email', 'email', 'updatesettings', 0, '', 4),
(380, 'upload', 'proxy', 'uploadproxy', 0, '', 4),
(381, 'upload', 'upload', 'upload', 0, '', 4),
(382, 'upload', 'upload', 'getsettings', 0, '', 4),
(383, 'upload', 'upload', 'updatesettings', 0, '', 4),
(384, 'upload', 'upload', 'find', 0, '', 4),
(385, 'upload', 'upload', 'findone', 0, '', 4),
(386, 'upload', 'upload', 'count', 0, '', 4),
(387, 'upload', 'upload', 'destroy', 0, '', 4),
(388, 'upload', 'upload', 'search', 0, '', 4),
(389, 'application', 'broadcast-table', 'find', 0, '', 5),
(390, 'application', 'broadcast-table', 'findone', 0, '', 5),
(391, 'application', 'broadcast-table', 'count', 0, '', 5),
(392, 'application', 'broadcast-table', 'create', 0, '', 5),
(393, 'application', 'broadcast-table', 'update', 0, '', 5),
(394, 'application', 'broadcast-table', 'delete', 0, '', 5),
(395, 'application', 'spot-broadcast', 'find', 0, '', 5),
(396, 'application', 'spot-broadcast', 'findone', 0, '', 5),
(397, 'application', 'spot-broadcast', 'count', 0, '', 5),
(398, 'application', 'spot-broadcast', 'create', 0, '', 5),
(399, 'application', 'spot-broadcast', 'update', 0, '', 5),
(400, 'application', 'spot-broadcast', 'delete', 0, '', 5),
(401, 'application', 'spot-talent', 'findone', 0, '', 5),
(402, 'application', 'spot-talent', 'find', 0, '', 5),
(403, 'application', 'spot-talent', 'count', 0, '', 5),
(404, 'application', 'spot-talent', 'create', 0, '', 5),
(405, 'application', 'spot-talent', 'update', 0, '', 5),
(406, 'application', 'spot-talent', 'delete', 0, '', 5),
(407, 'application', 'spot', 'find', 0, '', 5),
(408, 'application', 'spot', 'findone', 0, '', 5),
(409, 'application', 'spot', 'count', 0, '', 5),
(410, 'application', 'spot', 'create', 0, '', 5),
(411, 'application', 'spot', 'update', 0, '', 5),
(412, 'application', 'spot', 'delete', 0, '', 5),
(413, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 5),
(414, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 5),
(415, 'content-type-builder', 'components', 'getcomponents', 0, '', 5),
(416, 'content-type-builder', 'components', 'getcomponent', 0, '', 5),
(417, 'content-type-builder', 'components', 'createcomponent', 0, '', 5),
(418, 'content-type-builder', 'components', 'updatecomponent', 0, '', 5),
(419, 'content-type-builder', 'components', 'deletecomponent', 0, '', 5),
(420, 'content-type-builder', 'connections', 'getconnections', 0, '', 5),
(421, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 5),
(422, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 5),
(423, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 5),
(424, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 5),
(425, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 5),
(426, 'content-manager', 'components', 'listcomponents', 0, '', 5),
(427, 'content-manager', 'components', 'findcomponent', 0, '', 5),
(428, 'content-manager', 'components', 'updatecomponent', 0, '', 5),
(429, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 5),
(430, 'content-manager', 'contentmanager', 'update', 0, '', 5),
(431, 'content-manager', 'contentmanager', 'deletemany', 0, '', 5),
(432, 'content-manager', 'contentmanager', 'delete', 0, '', 5),
(433, 'content-manager', 'contentmanager', 'findone', 0, '', 5),
(434, 'content-manager', 'contentmanager', 'count', 0, '', 5),
(435, 'content-manager', 'contentmanager', 'find', 0, '', 5),
(436, 'content-manager', 'contentmanager', 'generateuid', 0, '', 5),
(437, 'content-manager', 'contentmanager', 'create', 0, '', 5),
(438, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 5),
(439, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 5),
(440, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 5),
(441, 'users-permissions', 'auth', 'callback', 0, '', 5),
(442, 'users-permissions', 'auth', 'changepassword', 0, '', 5),
(443, 'users-permissions', 'auth', 'connect', 0, '', 5),
(444, 'users-permissions', 'auth', 'forgotpassword', 0, '', 5),
(445, 'users-permissions', 'auth', 'register', 0, '', 5),
(446, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 5),
(447, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 5),
(448, 'users-permissions', 'user', 'find', 0, '', 5),
(449, 'users-permissions', 'user', 'me', 0, '', 5),
(450, 'users-permissions', 'user', 'findone', 0, '', 5),
(451, 'users-permissions', 'user', 'create', 0, '', 5),
(452, 'users-permissions', 'user', 'update', 0, '', 5),
(453, 'users-permissions', 'user', 'destroy', 0, '', 5),
(454, 'users-permissions', 'user', 'destroyall', 0, '', 5),
(455, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 5),
(456, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 5),
(457, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 5),
(458, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 5),
(459, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 5),
(460, 'users-permissions', 'userspermissions', 'getroles', 0, '', 5),
(461, 'users-permissions', 'userspermissions', 'getrole', 0, '', 5),
(462, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 5),
(463, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 5),
(464, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 5),
(465, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 5),
(466, 'users-permissions', 'userspermissions', 'init', 0, '', 5),
(467, 'users-permissions', 'userspermissions', 'index', 0, '', 5),
(468, 'users-permissions', 'userspermissions', 'createrole', 0, '', 5),
(469, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 5),
(470, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 5),
(471, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 5),
(472, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 5),
(473, 'email', 'email', 'send', 0, '', 5),
(474, 'email', 'email', 'getenvironments', 0, '', 5),
(475, 'email', 'email', 'getsettings', 0, '', 5),
(476, 'email', 'email', 'updatesettings', 0, '', 5),
(477, 'upload', 'proxy', 'uploadproxy', 0, '', 5),
(478, 'upload', 'upload', 'upload', 0, '', 5),
(479, 'upload', 'upload', 'getsettings', 0, '', 5),
(480, 'upload', 'upload', 'updatesettings', 0, '', 5),
(481, 'upload', 'upload', 'find', 0, '', 5),
(482, 'upload', 'upload', 'findone', 0, '', 5),
(483, 'upload', 'upload', 'count', 0, '', 5),
(484, 'upload', 'upload', 'destroy', 0, '', 5),
(485, 'upload', 'upload', 'search', 0, '', 5),
(486, 'application', 'broadcast-table', 'findone', 0, '', 6),
(487, 'application', 'broadcast-table', 'find', 0, '', 6),
(488, 'application', 'broadcast-table', 'count', 0, '', 6),
(489, 'application', 'broadcast-table', 'update', 0, '', 6),
(490, 'application', 'broadcast-table', 'create', 0, '', 6),
(491, 'application', 'broadcast-table', 'delete', 0, '', 6),
(492, 'application', 'spot-broadcast', 'find', 0, '', 6),
(493, 'application', 'spot-broadcast', 'findone', 0, '', 6),
(494, 'application', 'spot-broadcast', 'count', 0, '', 6),
(495, 'application', 'spot-broadcast', 'create', 0, '', 6),
(496, 'application', 'spot-broadcast', 'update', 0, '', 6),
(497, 'application', 'spot-broadcast', 'delete', 0, '', 6),
(498, 'application', 'spot-talent', 'find', 0, '', 6),
(499, 'application', 'spot-talent', 'findone', 0, '', 6),
(500, 'application', 'spot-talent', 'count', 0, '', 6),
(501, 'application', 'spot-talent', 'create', 0, '', 6),
(502, 'application', 'spot-talent', 'update', 0, '', 6),
(503, 'application', 'spot-talent', 'delete', 0, '', 6),
(504, 'application', 'spot', 'find', 0, '', 6),
(505, 'application', 'spot', 'findone', 0, '', 6),
(506, 'application', 'spot', 'count', 0, '', 6),
(507, 'application', 'spot', 'create', 0, '', 6),
(508, 'application', 'spot', 'update', 0, '', 6),
(509, 'application', 'spot', 'delete', 0, '', 6),
(510, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 6),
(511, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 6),
(512, 'content-type-builder', 'components', 'getcomponents', 0, '', 6),
(513, 'content-type-builder', 'components', 'getcomponent', 0, '', 6),
(514, 'content-type-builder', 'components', 'createcomponent', 0, '', 6),
(515, 'content-type-builder', 'components', 'updatecomponent', 0, '', 6),
(516, 'content-type-builder', 'components', 'deletecomponent', 0, '', 6),
(517, 'content-type-builder', 'connections', 'getconnections', 0, '', 6),
(518, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 6),
(519, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 6),
(520, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 6),
(521, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 6),
(522, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 6),
(523, 'content-manager', 'components', 'listcomponents', 0, '', 6),
(524, 'content-manager', 'components', 'findcomponent', 0, '', 6),
(525, 'content-manager', 'components', 'updatecomponent', 0, '', 6),
(526, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 6),
(527, 'content-manager', 'contentmanager', 'update', 0, '', 6),
(528, 'content-manager', 'contentmanager', 'deletemany', 0, '', 6),
(529, 'content-manager', 'contentmanager', 'delete', 0, '', 6),
(530, 'content-manager', 'contentmanager', 'findone', 0, '', 6),
(531, 'content-manager', 'contentmanager', 'count', 0, '', 6),
(532, 'content-manager', 'contentmanager', 'find', 0, '', 6),
(533, 'content-manager', 'contentmanager', 'generateuid', 0, '', 6),
(534, 'content-manager', 'contentmanager', 'create', 0, '', 6),
(535, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 6),
(536, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 6),
(537, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 6),
(538, 'users-permissions', 'auth', 'callback', 0, '', 6),
(539, 'users-permissions', 'auth', 'changepassword', 0, '', 6),
(540, 'users-permissions', 'auth', 'connect', 0, '', 6),
(541, 'users-permissions', 'auth', 'forgotpassword', 0, '', 6),
(542, 'users-permissions', 'auth', 'register', 0, '', 6),
(543, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 6),
(544, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 6),
(545, 'users-permissions', 'user', 'find', 0, '', 6),
(546, 'users-permissions', 'user', 'me', 0, '', 6),
(547, 'users-permissions', 'user', 'create', 0, '', 6),
(548, 'users-permissions', 'user', 'findone', 0, '', 6),
(549, 'users-permissions', 'user', 'update', 0, '', 6),
(550, 'users-permissions', 'user', 'destroy', 0, '', 6),
(551, 'users-permissions', 'user', 'destroyall', 0, '', 6),
(552, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 6),
(553, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 6),
(554, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 6),
(555, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 6),
(556, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 6),
(557, 'users-permissions', 'userspermissions', 'getroles', 0, '', 6),
(558, 'users-permissions', 'userspermissions', 'getrole', 0, '', 6),
(559, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 6),
(560, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 6),
(561, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 6),
(562, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 6),
(563, 'users-permissions', 'userspermissions', 'init', 0, '', 6),
(564, 'users-permissions', 'userspermissions', 'index', 0, '', 6),
(565, 'users-permissions', 'userspermissions', 'createrole', 0, '', 6),
(566, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 6),
(567, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 6),
(568, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 6),
(569, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 6),
(570, 'email', 'email', 'send', 0, '', 6),
(571, 'email', 'email', 'getenvironments', 0, '', 6),
(572, 'email', 'email', 'getsettings', 0, '', 6),
(573, 'email', 'email', 'updatesettings', 0, '', 6),
(574, 'upload', 'proxy', 'uploadproxy', 0, '', 6),
(575, 'upload', 'upload', 'upload', 0, '', 6),
(576, 'upload', 'upload', 'getsettings', 0, '', 6),
(577, 'upload', 'upload', 'updatesettings', 0, '', 6),
(578, 'upload', 'upload', 'find', 0, '', 6),
(579, 'upload', 'upload', 'findone', 0, '', 6),
(580, 'upload', 'upload', 'count', 0, '', 6),
(581, 'upload', 'upload', 'destroy', 0, '', 6),
(582, 'upload', 'upload', 'search', 0, '', 6),
(589, 'application', 'newcode', 'index', 0, '', 1),
(590, 'application', 'newcode', 'index', 1, '', 2),
(591, 'application', 'newcode', 'index', 0, '', 3),
(592, 'application', 'newcode', 'index', 0, '', 4),
(593, 'application', 'newcode', 'index', 0, '', 5),
(594, 'application', 'newcode', 'index', 0, '', 6),
(595, 'application', 'registration', 'create', 0, '', 1),
(596, 'application', 'registration', 'create', 1, '', 2),
(597, 'application', 'registration', 'create', 0, '', 3),
(598, 'application', 'registration', 'create', 0, '', 4),
(599, 'application', 'registration', 'create', 0, '', 5),
(600, 'application', 'registration', 'create', 0, '', 6),
(601, 'application', 'userprofile', 'findone', 1, '', 1),
(602, 'application', 'userprofile', 'findone', 0, '', 2),
(603, 'application', 'userprofile', 'findone', 1, '', 3),
(604, 'application', 'userprofile', 'findone', 0, '', 4),
(605, 'application', 'userprofile', 'findone', 0, '', 5),
(606, 'application', 'userprofile', 'findone', 0, '', 6),
(607, 'application', 'userprofile', 'update', 0, '', 1),
(608, 'application', 'userprofile', 'update', 0, '', 2),
(609, 'application', 'userprofile', 'update', 1, '', 3),
(610, 'application', 'userprofile', 'update', 0, '', 4),
(611, 'application', 'userprofile', 'update', 0, '', 5),
(612, 'application', 'userprofile', 'update', 0, '', 6),
(613, 'application', 'userspot', 'create', 0, '', 1),
(614, 'application', 'userspot', 'create', 0, '', 2),
(615, 'application', 'userspot', 'create', 1, '', 3),
(616, 'application', 'userspot', 'create', 0, '', 4),
(617, 'application', 'userspot', 'create', 0, '', 5),
(618, 'application', 'userspot', 'create', 0, '', 6),
(619, 'application', 'userspot', 'delete', 0, '', 1),
(620, 'application', 'userspot', 'delete', 0, '', 2),
(621, 'application', 'userspot', 'delete', 1, '', 3),
(622, 'application', 'userspot', 'delete', 0, '', 4),
(623, 'application', 'userspot', 'delete', 0, '', 5),
(624, 'application', 'userspot', 'delete', 0, '', 6),
(625, 'application', 'userspot', 'find', 0, '', 1),
(626, 'application', 'userspot', 'find', 0, '', 2),
(627, 'application', 'userspot', 'find', 1, '', 3),
(628, 'application', 'userspot', 'find', 0, '', 4),
(629, 'application', 'userspot', 'find', 0, '', 5),
(630, 'application', 'userspot', 'find', 0, '', 6),
(631, 'application', 'userspot', 'update', 0, '', 1),
(632, 'application', 'userspot', 'update', 0, '', 2),
(633, 'application', 'userspot', 'update', 1, '', 3),
(634, 'application', 'userspot', 'update', 0, '', 4),
(635, 'application', 'userspot', 'update', 0, '', 5),
(636, 'application', 'userspot', 'update', 0, '', 6),
(637, 'application', 'userspotbroadcast', 'create', 0, '', 1),
(638, 'application', 'userspotbroadcast', 'create', 0, '', 2),
(639, 'application', 'userspotbroadcast', 'create', 0, '', 3),
(640, 'application', 'userspotbroadcast', 'create', 0, '', 4),
(641, 'application', 'userspotbroadcast', 'create', 0, '', 5),
(642, 'application', 'userspotbroadcast', 'create', 0, '', 6),
(643, 'application', 'userspotbroadcast', 'delete', 0, '', 1),
(644, 'application', 'userspotbroadcast', 'delete', 0, '', 2),
(645, 'application', 'userspotbroadcast', 'delete', 0, '', 3),
(646, 'application', 'userspotbroadcast', 'delete', 0, '', 4),
(647, 'application', 'userspotbroadcast', 'delete', 0, '', 5),
(648, 'application', 'userspotbroadcast', 'delete', 0, '', 6),
(649, 'application', 'userspotbroadcast', 'find', 0, '', 1),
(650, 'application', 'userspotbroadcast', 'find', 0, '', 2),
(651, 'application', 'userspotbroadcast', 'find', 0, '', 3),
(652, 'application', 'userspotbroadcast', 'find', 0, '', 4),
(653, 'application', 'userspotbroadcast', 'find', 0, '', 5),
(654, 'application', 'userspotbroadcast', 'find', 0, '', 6),
(655, 'application', 'userspotbroadcast', 'update', 0, '', 1),
(656, 'application', 'userspotbroadcast', 'update', 0, '', 2),
(657, 'application', 'userspotbroadcast', 'update', 0, '', 3),
(658, 'application', 'userspotbroadcast', 'update', 0, '', 4),
(659, 'application', 'userspotbroadcast', 'update', 0, '', 5),
(660, 'application', 'userspotbroadcast', 'update', 0, '', 6),
(733, 'application', 'userspottalent', 'create', 0, '', 1),
(734, 'application', 'userspottalent', 'create', 0, '', 2),
(735, 'application', 'userspottalent', 'create', 0, '', 3),
(736, 'application', 'userspottalent', 'create', 0, '', 4),
(737, 'application', 'userspottalent', 'create', 0, '', 5),
(738, 'application', 'userspottalent', 'create', 0, '', 6),
(739, 'application', 'userspottalent', 'delete', 0, '', 1),
(740, 'application', 'userspottalent', 'delete', 0, '', 2),
(741, 'application', 'userspottalent', 'delete', 0, '', 3),
(742, 'application', 'userspottalent', 'delete', 0, '', 4),
(743, 'application', 'userspottalent', 'delete', 0, '', 5),
(744, 'application', 'userspottalent', 'delete', 0, '', 6),
(745, 'application', 'userspottalent', 'find', 0, '', 1),
(746, 'application', 'userspottalent', 'find', 0, '', 2),
(747, 'application', 'userspottalent', 'find', 0, '', 3),
(748, 'application', 'userspottalent', 'find', 0, '', 4),
(749, 'application', 'userspottalent', 'find', 0, '', 5),
(750, 'application', 'userspottalent', 'find', 0, '', 6),
(751, 'application', 'userspottalent', 'update', 0, '', 1),
(752, 'application', 'userspottalent', 'update', 0, '', 2),
(753, 'application', 'userspottalent', 'update', 0, '', 3),
(754, 'application', 'userspottalent', 'update', 0, '', 4),
(755, 'application', 'userspottalent', 'update', 0, '', 5),
(756, 'application', 'userspottalent', 'update', 0, '', 6),
(757, 'application', 'talent-type', 'count', 0, '', 1),
(758, 'application', 'talent-type', 'count', 0, '', 2),
(759, 'application', 'talent-type', 'count', 0, '', 3),
(760, 'application', 'talent-type', 'count', 0, '', 4),
(761, 'application', 'talent-type', 'count', 0, '', 5),
(762, 'application', 'talent-type', 'count', 0, '', 6),
(763, 'application', 'talent-type', 'create', 0, '', 1),
(764, 'application', 'talent-type', 'create', 0, '', 2),
(765, 'application', 'talent-type', 'create', 0, '', 3),
(766, 'application', 'talent-type', 'create', 0, '', 4),
(767, 'application', 'talent-type', 'create', 0, '', 5),
(768, 'application', 'talent-type', 'create', 0, '', 6),
(769, 'application', 'talent-type', 'delete', 0, '', 1),
(770, 'application', 'talent-type', 'delete', 0, '', 2),
(771, 'application', 'talent-type', 'delete', 0, '', 3),
(772, 'application', 'talent-type', 'delete', 0, '', 4),
(773, 'application', 'talent-type', 'delete', 0, '', 5),
(774, 'application', 'talent-type', 'delete', 0, '', 6),
(775, 'application', 'talent-type', 'find', 0, '', 1),
(776, 'application', 'talent-type', 'find', 0, '', 2),
(777, 'application', 'talent-type', 'find', 0, '', 3),
(778, 'application', 'talent-type', 'find', 0, '', 4),
(779, 'application', 'talent-type', 'find', 0, '', 5),
(780, 'application', 'talent-type', 'find', 0, '', 6),
(781, 'application', 'talent-type', 'findone', 0, '', 1),
(782, 'application', 'talent-type', 'findone', 0, '', 2),
(783, 'application', 'talent-type', 'findone', 0, '', 3),
(784, 'application', 'talent-type', 'findone', 0, '', 4),
(785, 'application', 'talent-type', 'findone', 0, '', 5),
(786, 'application', 'talent-type', 'findone', 0, '', 6),
(787, 'application', 'talent-type', 'update', 0, '', 1),
(788, 'application', 'talent-type', 'update', 0, '', 2),
(789, 'application', 'talent-type', 'update', 0, '', 3),
(790, 'application', 'talent-type', 'update', 0, '', 4),
(791, 'application', 'talent-type', 'update', 0, '', 5),
(792, 'application', 'talent-type', 'update', 0, '', 6),
(793, 'application', 'madia-type', 'count', 0, '', 1),
(794, 'application', 'madia-type', 'count', 0, '', 2),
(795, 'application', 'madia-type', 'count', 0, '', 3),
(796, 'application', 'madia-type', 'count', 0, '', 4),
(797, 'application', 'madia-type', 'count', 0, '', 5),
(798, 'application', 'madia-type', 'count', 0, '', 6),
(799, 'application', 'madia-type', 'create', 0, '', 1),
(800, 'application', 'madia-type', 'create', 0, '', 2),
(801, 'application', 'madia-type', 'create', 0, '', 3),
(802, 'application', 'madia-type', 'create', 0, '', 4),
(803, 'application', 'madia-type', 'create', 0, '', 5),
(804, 'application', 'madia-type', 'create', 0, '', 6),
(805, 'application', 'madia-type', 'delete', 0, '', 1),
(806, 'application', 'madia-type', 'delete', 0, '', 2),
(807, 'application', 'madia-type', 'delete', 0, '', 3),
(808, 'application', 'madia-type', 'delete', 0, '', 4),
(809, 'application', 'madia-type', 'delete', 0, '', 5),
(810, 'application', 'madia-type', 'delete', 0, '', 6),
(811, 'application', 'madia-type', 'find', 0, '', 1),
(812, 'application', 'madia-type', 'find', 0, '', 2),
(813, 'application', 'madia-type', 'find', 0, '', 3),
(814, 'application', 'madia-type', 'find', 0, '', 4),
(815, 'application', 'madia-type', 'find', 0, '', 5),
(816, 'application', 'madia-type', 'find', 0, '', 6),
(817, 'application', 'madia-type', 'findone', 0, '', 1),
(818, 'application', 'madia-type', 'findone', 0, '', 2),
(819, 'application', 'madia-type', 'findone', 0, '', 3),
(820, 'application', 'madia-type', 'findone', 0, '', 4),
(821, 'application', 'madia-type', 'findone', 0, '', 5),
(822, 'application', 'madia-type', 'findone', 0, '', 6),
(823, 'application', 'madia-type', 'update', 0, '', 1),
(824, 'application', 'madia-type', 'update', 0, '', 2),
(825, 'application', 'madia-type', 'update', 0, '', 3),
(826, 'application', 'madia-type', 'update', 0, '', 4),
(827, 'application', 'madia-type', 'update', 0, '', 5),
(828, 'application', 'madia-type', 'update', 0, '', 6),
(829, 'application', 'broadcast-type', 'count', 0, '', 1),
(830, 'application', 'broadcast-type', 'count', 0, '', 2),
(831, 'application', 'broadcast-type', 'count', 0, '', 3),
(832, 'application', 'broadcast-type', 'count', 0, '', 4),
(833, 'application', 'broadcast-type', 'count', 0, '', 5),
(834, 'application', 'broadcast-type', 'count', 0, '', 6),
(835, 'application', 'broadcast-type', 'create', 0, '', 1),
(836, 'application', 'broadcast-type', 'create', 0, '', 2),
(837, 'application', 'broadcast-type', 'create', 0, '', 3),
(838, 'application', 'broadcast-type', 'create', 0, '', 4),
(839, 'application', 'broadcast-type', 'create', 0, '', 5),
(840, 'application', 'broadcast-type', 'create', 0, '', 6),
(841, 'application', 'broadcast-type', 'delete', 0, '', 1),
(842, 'application', 'broadcast-type', 'delete', 0, '', 2),
(843, 'application', 'broadcast-type', 'delete', 0, '', 3),
(844, 'application', 'broadcast-type', 'delete', 0, '', 4),
(845, 'application', 'broadcast-type', 'delete', 0, '', 5),
(846, 'application', 'broadcast-type', 'delete', 0, '', 6),
(847, 'application', 'broadcast-type', 'find', 0, '', 1),
(848, 'application', 'broadcast-type', 'find', 0, '', 2),
(849, 'application', 'broadcast-type', 'find', 0, '', 3),
(850, 'application', 'broadcast-type', 'find', 0, '', 4),
(851, 'application', 'broadcast-type', 'find', 0, '', 5),
(852, 'application', 'broadcast-type', 'find', 0, '', 6),
(853, 'application', 'broadcast-type', 'findone', 0, '', 1),
(854, 'application', 'broadcast-type', 'findone', 0, '', 2),
(855, 'application', 'broadcast-type', 'findone', 0, '', 3),
(856, 'application', 'broadcast-type', 'findone', 0, '', 4),
(857, 'application', 'broadcast-type', 'findone', 0, '', 5),
(858, 'application', 'broadcast-type', 'findone', 0, '', 6),
(859, 'application', 'broadcast-type', 'update', 0, '', 1),
(860, 'application', 'broadcast-type', 'update', 0, '', 2),
(861, 'application', 'broadcast-type', 'update', 0, '', 3),
(862, 'application', 'broadcast-type', 'update', 0, '', 4),
(863, 'application', 'broadcast-type', 'update', 0, '', 5),
(864, 'application', 'broadcast-type', 'update', 0, '', 6),
(865, 'application', 'userprofile', 'avatar', 0, '', 1),
(866, 'application', 'userprofile', 'avatar', 0, '', 2),
(867, 'application', 'userprofile', 'avatar', 1, '', 3),
(868, 'application', 'userprofile', 'avatar', 0, '', 4),
(869, 'application', 'userprofile', 'avatar', 0, '', 5),
(870, 'application', 'userprofile', 'avatar', 0, '', 6);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users-permissions_role`
--

CREATE TABLE IF NOT EXISTS `users-permissions_role` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_role`
--

INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`) VALUES
(1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated'),
(2, 'Public', 'Default role given to unauthenticated user.', 'public'),
(3, 'Studio', '', 'studio'),
(4, 'Talent', '', 'talent'),
(5, 'Broadcaster', '', 'broadcaster'),
(6, 'Arbiter', '', 'arbiter');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users-permissions_user`
--

CREATE TABLE IF NOT EXISTS `users-permissions_user` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `cui` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `talent_type` varchar(255) DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `arbiter_type` varchar(255) DEFAULT NULL,
  `cnp` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `avatar` longtext
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_user`
--

INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmed`, `blocked`, `role`, `created_at`, `updated_at`, `user_id`, `cui`, `address`, `phone`, `talent_type`, `media_type`, `arbiter_type`, `cnp`, `user_type`, `contact_name`, `referrer`, `avatar`) VALUES
(1, 'Studio 1', 'studio1@gmail.ro', 'local', '$2a$10$MFRcpcnKXljRzNmrMx0NL.p6mBmS9IxWiTSjxrFOrxioLLGAlGC6S', NULL, 1, 0, 3, '2020-05-26 09:27:23', '2020-08-07 09:44:34', NULL, 'RO190273637492827', 'Unirii 7, Bl 20,  Scara 1, Etaj 2, Ap 33,  Bucuresti', '0744555555', NULL, NULL, NULL, NULL, NULL, 'Bubu', 'refff1', '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'),
(3, 'Virgin Radio', 'broadcaster@gmail.com', 'local', '$2a$10$9Q2Wq1T.a6kJpIcTGGM9M.bB7CfqF6OvxPmXltZrz/fG0p3nfGilK', NULL, 1, 0, 5, '2020-05-26 09:31:11', '2020-06-19 07:54:28', NULL, 'RO190273637492827', 'Unirii 7', '0741393014', NULL, 'RADIO', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Studio 2', 'studio2@gmail.com', 'local', '$2a$10$lD5hGdU/DjT8FZCZLqcb2u4P9vvVgM02sOcQEY8xl9hM5eduURCmq', NULL, NULL, NULL, 1, '2020-05-28 08:32:20', '2020-07-27 05:55:04', NULL, 'RO190273637492807', 'Unirii 2', '0741300014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'voce 2', 'edi.hermann@lemonbyte.ro', 'local', '$2a$10$D4Gw62Bj7yAg6120361LduUkoZ5zhaODZew1daeydpaYAHSTdd6KG', NULL, 1, 0, 4, '2020-05-29 09:02:39', '2020-08-13 07:03:13', NULL, '4354524522524', 'saFfSFSF', '0744666847', NULL, NULL, NULL, NULL, 'TALENT', NULL, 'ref 2', NULL),
(7, 'Studio 5', 'studio5@gmail.com', 'local', '$2a$10$RktFmcTqN8wiYWJpUeZg.uvfvYyDPnJzK4HdFSPz7rp1PmlVYBkhK', NULL, NULL, NULL, 3, '2020-06-04 06:22:24', '2020-06-04 06:22:24', NULL, 'RO190273637492827', 'Unirii 77', '0741393014', NULL, NULL, NULL, NULL, NULL, 'Bubu', 'refff', NULL),
(86, 'Studio 0005', 'studio0005@gmail.com', NULL, '$2a$10$gqjd2idQlom0GETzXD.TO.vWPkdRg7yV4co4VLjNn915oE2MRH.8C', NULL, NULL, 1, 3, '2020-06-09 11:24:42', '2020-06-09 11:24:42', NULL, 'RO190273637492827', 'Unirii 77', '0741393014', NULL, NULL, NULL, NULL, NULL, 'Bubu', 'refff', NULL),
(99, 'Artist 1', 'edi_il@yahoo.com', 'local', '$2a$10$ApDczQ6Vfl4bXWaYQFp5y.F43iwSmdT1O0dHuiNydyXVjsvtkNrLy', NULL, 1, 0, 4, '2020-06-19 06:01:02', '2020-06-19 07:54:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TALENT', NULL, NULL, NULL),
(102, 'Studio 3', '', NULL, '$2a$10$Qa5F/EUNRUGG.NMivi.JYOlCJH81jO.Y.zN541RyxS1Z5TA8m.5OS', NULL, NULL, 1, NULL, '2020-07-09 10:10:00', '2020-07-09 10:10:00', NULL, NULL, 'Address 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Studio 55', 'edi_il@yahoo.com', NULL, '$2a$10$BYMU4ktpQ4AT3.zUdpJheeWRuYZ07SECVrE6q6IbUHKLGCw51rWyG', NULL, NULL, 1, NULL, '2020-07-09 10:59:21', '2020-07-09 10:59:21', NULL, '', 'Str. Viilor, nr 33, Bl 2, Ap 7', '0312311323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'Studio 5551', 'edi_iiii@yahoo.com', NULL, '$2a$10$zDEbjxUREieUiauj5A9ko.cH1nmXEy4Y6FAw.6aRgnhmBffpOdsz2', NULL, NULL, 1, NULL, '2020-07-09 11:03:47', '2020-07-09 11:03:47', NULL, '', 'Str. Viilor, nr 33, Bl 2, Ap 7', '0312311323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, '', '', NULL, '', NULL, NULL, 1, NULL, '2020-07-28 10:22:05', '2020-07-28 10:22:05', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'Talent 1', 'talent1@gmail.ro', 'local', '$2a$10$7tMRMul3gNzDL7EO13.BWOAoqo7zmv0GVfkbdqcc2HW3UH7DVXvzW', NULL, 0, 0, 4, '2020-08-11 11:19:07', '2020-08-11 11:19:07', NULL, NULL, 'Str. Viilor, nr 33, Bl 2, Ap 7', '0312311323', NULL, NULL, NULL, NULL, NULL, 'Bubu1', NULL, NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users-permissions_user__broadcast_type`
--

CREATE TABLE IF NOT EXISTS `users-permissions_user__broadcast_type` (
  `id` int(10) unsigned NOT NULL,
  `users-permissions_user_id` int(11) DEFAULT NULL,
  `broadcast-type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users-permissions_user__broadcast_types`
--

CREATE TABLE IF NOT EXISTS `users-permissions_user__broadcast_types` (
  `id` int(10) unsigned NOT NULL,
  `users-permissions_user_id` int(11) DEFAULT NULL,
  `broadcast-type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_user__broadcast_types`
--

INSERT INTO `users-permissions_user__broadcast_types` (`id`, `users-permissions_user_id`, `broadcast-type_id`) VALUES
(1, 3, 1),
(2, 122, 1),
(3, 122, 2);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users-permissions_user__talent_type`
--

CREATE TABLE IF NOT EXISTS `users-permissions_user__talent_type` (
  `id` int(10) unsigned NOT NULL,
  `users-permissions_user_id` int(11) DEFAULT NULL,
  `talent-type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_user__talent_type`
--

INSERT INTO `users-permissions_user__talent_type` (`id`, `users-permissions_user_id`, `talent-type_id`) VALUES
(3, 99, 1),
(4, 99, 2);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users-permissions_user__talent_types`
--

CREATE TABLE IF NOT EXISTS `users-permissions_user__talent_types` (
  `id` int(10) unsigned NOT NULL,
  `users-permissions_user_id` int(11) DEFAULT NULL,
  `talent-type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_user__talent_types`
--

INSERT INTO `users-permissions_user__talent_types` (`id`, `users-permissions_user_id`, `talent-type_id`) VALUES
(1, 99, 1),
(2, 6, 1),
(3, 99, 2),
(4, 122, 1),
(5, 123, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `broadcast_tables`
--
ALTER TABLE `broadcast_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast_types`
--
ALTER TABLE `broadcast_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_store`
--
ALTER TABLE `core_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `madia_types`
--
ALTER TABLE `madia_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `spots_uid_unique` (`uid`);

--
-- Indexes for table `spots__media_types`
--
ALTER TABLE `spots__media_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spot_broadcasts`
--
ALTER TABLE `spot_broadcasts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spot_broadcasts__broadcast_types`
--
ALTER TABLE `spot_broadcasts__broadcast_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spot_talents`
--
ALTER TABLE `spot_talents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spot_talents__uid`
--
ALTER TABLE `spot_talents__uid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_administrator`
--
ALTER TABLE `strapi_administrator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_administrator_username_unique` (`username`);

--
-- Indexes for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `talent_types`
--
ALTER TABLE `talent_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_file`
--
ALTER TABLE `upload_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_file_morph`
--
ALTER TABLE `upload_file_morph`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users-permissions_permission`
--
ALTER TABLE `users-permissions_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users-permissions_role`
--
ALTER TABLE `users-permissions_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users-permissions_role_type_unique` (`type`);

--
-- Indexes for table `users-permissions_user`
--
ALTER TABLE `users-permissions_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users-permissions_user_username_unique` (`username`);

--
-- Indexes for table `users-permissions_user__broadcast_type`
--
ALTER TABLE `users-permissions_user__broadcast_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users-permissions_user__broadcast_types`
--
ALTER TABLE `users-permissions_user__broadcast_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users-permissions_user__talent_type`
--
ALTER TABLE `users-permissions_user__talent_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users-permissions_user__talent_types`
--
ALTER TABLE `users-permissions_user__talent_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `broadcast_tables`
--
ALTER TABLE `broadcast_tables`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `broadcast_types`
--
ALTER TABLE `broadcast_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `core_store`
--
ALTER TABLE `core_store`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `madia_types`
--
ALTER TABLE `madia_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `spots`
--
ALTER TABLE `spots`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `spots__media_types`
--
ALTER TABLE `spots__media_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `spot_broadcasts`
--
ALTER TABLE `spot_broadcasts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `spot_broadcasts__broadcast_types`
--
ALTER TABLE `spot_broadcasts__broadcast_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `spot_talents`
--
ALTER TABLE `spot_talents`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `spot_talents__uid`
--
ALTER TABLE `spot_talents__uid`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `strapi_administrator`
--
ALTER TABLE `strapi_administrator`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `talent_types`
--
ALTER TABLE `talent_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `upload_file`
--
ALTER TABLE `upload_file`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `upload_file_morph`
--
ALTER TABLE `upload_file_morph`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users-permissions_permission`
--
ALTER TABLE `users-permissions_permission`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=871;
--
-- AUTO_INCREMENT for table `users-permissions_role`
--
ALTER TABLE `users-permissions_role`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users-permissions_user`
--
ALTER TABLE `users-permissions_user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `users-permissions_user__broadcast_type`
--
ALTER TABLE `users-permissions_user__broadcast_type`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users-permissions_user__broadcast_types`
--
ALTER TABLE `users-permissions_user__broadcast_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users-permissions_user__talent_type`
--
ALTER TABLE `users-permissions_user__talent_type`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users-permissions_user__talent_types`
--
ALTER TABLE `users-permissions_user__talent_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
