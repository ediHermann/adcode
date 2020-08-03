-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03 Aug 2020 la 11:33
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
(19, 'db_model_spots', '{"uid":{"type":"string","unique":true,"required":true},"title":{"type":"string"},"client":{"type":"string"},"duration":{"type":"integer"},"status":{"type":"enumeration","enum":["PENDING","PUBLISHED","INACTIVATED","DELETED"]},"user":{"plugin":"users-permissions","model":"user"},"deleted":{"type":"boolean","default":false},"media_types":{"collection":"madia-type","attribute":"madia-type","column":"id","isVirtual":true},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(20, 'plugin_content_manager_configuration_content_types::application::spot.spot', '{"uid":"application::spot.spot","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"uid","defaultSortBy":"uid","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"uid":{"edit":{"label":"Uid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Uid","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"client":{"edit":{"label":"Client","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Client","searchable":true,"sortable":true}},"duration":{"edit":{"label":"Duration","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Duration","searchable":true,"sortable":true}},"status":{"edit":{"label":"Status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Status","searchable":true,"sortable":true}},"user":{"edit":{"label":"User","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"User","searchable":false,"sortable":false}},"deleted":{"edit":{"label":"Deleted","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Deleted","searchable":true,"sortable":true}},"media_types":{"edit":{"label":"Media_types","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type_name"},"list":{"label":"Media_types","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","uid","title","client"],"edit":[[{"name":"uid","size":6},{"name":"title","size":6}],[{"name":"client","size":6}],[{"name":"duration","size":4},{"name":"status","size":6}],[{"name":"deleted","size":4}]],"editRelations":["user","media_types"]}}', 'object', '', ''),
(21, 'db_model_spot_talents', '{"talent_role":{"type":"enumeration","enum":["ACTOR","VOICE"]},"obs":{"type":"text"},"talent":{"plugin":"users-permissions","model":"user"},"spot":{"model":"spot"},"deleted":{"type":"boolean","default":false},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
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
(1, 'Audio', '2020-06-19 07:24:50', '2020-06-19 07:24:50'),
(2, 'Video', '2020-06-19 07:24:58', '2020-06-19 07:24:58');

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
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spots`
--

INSERT INTO `spots` (`id`, `uid`, `title`, `client`, `duration`, `status`, `referrer`, `created_at`, `updated_at`, `user`, `deleted`) VALUES
(1, 'ABD6575B', 'Spot 1', 'Emag', 20, 'PENDING', 'ref 2', '2020-05-26 08:54:32', '2020-06-19 07:42:39', 1, 0),
(2, '0K76VLPW', 'Spot 2', 'Media Galaxy', 20, 'PENDING', 'ref', '2020-05-29 09:00:23', '2020-06-19 07:42:31', 1, 0),
(8, 'QQQQQQQQ', 'Spot 3', 'Client 1', 30, 'PENDING', NULL, '2020-06-11 10:31:41', '2020-07-02 06:00:25', 1, 0),
(9, 'ZZZZZZZZ', 'SPOT 5', 'Emag', 20, NULL, NULL, '2020-07-10 09:25:39', '2020-07-10 09:25:39', 1, 0),
(10, 'AAAAAAA', 'SPOT 7', 'Emag', 50, 'PENDING', NULL, '2020-07-10 09:26:03', '2020-07-10 09:26:03', 1, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spot_talents`
--

INSERT INTO `spot_talents` (`id`, `uid`, `talent_role`, `obs`, `created_at`, `updated_at`, `spot`, `user`, `deleted`, `talent`) VALUES
(1, 1, 'VOICE', 'jwjsbajb', '2020-05-26 09:00:55', '2020-06-16 07:59:27', 1, 2, NULL, 2),
(2, 1, 'VOICE', 'jdnzjk', '2020-05-26 09:06:46', '2020-06-16 07:59:18', 1, 6, NULL, 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `upload_file`
--

INSERT INTO `upload_file` (`id`, `name`, `alternativeText`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `previewUrl`, `provider`, `provider_metadata`, `created_at`, `updated_at`) VALUES
(1, 'planeta', '', '', 450, 357, '{"thumbnail":{"hash":"thumbnail_planeta_816f356644","ext":".png","mime":"image/png","width":197,"height":156,"size":13.49,"path":null,"url":"/uploads/thumbnail_planeta_816f356644.png"}}', 'planeta_816f356644', '.png', 'image/png', '17.14', '/uploads/planeta_816f356644.png', NULL, 'local', NULL, '2020-06-10 10:25:36', '2020-06-10 10:25:36'),
(2, 'images', '', '', 275, 183, '{"thumbnail":{"hash":"thumbnail_images_c7b2dd5a86","ext":".jpeg","mime":"image/jpeg","width":234,"height":156,"size":8.1,"path":null,"url":"/uploads/thumbnail_images_c7b2dd5a86.jpeg"}}', 'images_c7b2dd5a86', '.jpeg', 'image/jpeg', '10.71', '/uploads/images_c7b2dd5a86.jpeg', NULL, 'local', NULL, '2020-07-06 06:39:59', '2020-07-06 06:39:59'),
(3, 'na_5b86b74972042', '', '', 275, 183, '{"thumbnail":{"hash":"thumbnail_na_5b86b74972042_673c21fe3a","ext":".jpeg","mime":"image/jpeg","width":234,"height":156,"size":8.1,"path":null,"url":"/uploads/thumbnail_na_5b86b74972042_673c21fe3a.jpeg"}}', 'na_5b86b74972042_673c21fe3a', '.jpeg', 'image/jpeg', '10.71', '/uploads/na_5b86b74972042_673c21fe3a.jpeg', NULL, 'local', NULL, '2020-07-06 06:40:00', '2020-07-06 06:40:34'),
(4, 'Studio 1', '', '', 128, 128, NULL, 'Light_Bulb_ff8b9abbe9', '.png', 'image/png', '9.09', '/uploads/Light_Bulb_ff8b9abbe9.png', NULL, 'local', NULL, '2020-07-30 03:52:48', '2020-07-30 03:53:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_user`
--

INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmed`, `blocked`, `role`, `created_at`, `updated_at`, `user_id`, `cui`, `address`, `phone`, `talent_type`, `media_type`, `arbiter_type`, `cnp`, `user_type`, `contact_name`, `referrer`, `avatar`) VALUES
(1, 'Studio 1', 'new@gmail.ro', 'local', '$2a$10$FXMQg3kgAHL2hGuURXZPGeUSpxXvi9ywcGN0sXuJaqQy964gy53qW', NULL, 1, 0, 3, '2020-05-26 09:27:23', '2020-07-31 10:46:42', NULL, 'RO190273637492827', 'Unirii 7, Bl 20, Scara 1 etaj 2 Ap 33, Bucuresti', '0744555555', NULL, NULL, NULL, NULL, NULL, 'Daniel Ursu', 'refff1', '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'),
(3, 'Virgin Radio', 'broadcaster@gmail.com', 'local', '$2a$10$9Q2Wq1T.a6kJpIcTGGM9M.bB7CfqF6OvxPmXltZrz/fG0p3nfGilK', NULL, 1, 0, 5, '2020-05-26 09:31:11', '2020-06-19 07:54:28', NULL, 'RO190273637492827', 'Unirii 7', '0741393014', NULL, 'RADIO', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Studio 2', 'studio2@gmail.com', 'local', '$2a$10$lD5hGdU/DjT8FZCZLqcb2u4P9vvVgM02sOcQEY8xl9hM5eduURCmq', NULL, NULL, NULL, 1, '2020-05-28 08:32:20', '2020-07-27 05:55:04', NULL, 'RO190273637492807', 'Unirii 2', '0741300014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Voice 2', 'edi.hermann@lemonbyte.ro', 'local', '$2a$10$D4Gw62Bj7yAg6120361LduUkoZ5zhaODZew1daeydpaYAHSTdd6KG', NULL, 1, 0, 1, '2020-05-29 09:02:39', '2020-06-19 07:54:20', NULL, '4354524522524', 'saFfSFSF', '0744666847', NULL, NULL, NULL, NULL, 'TALENT', NULL, 'ref 2', NULL),
(7, 'Studio 5', 'studio5@gmail.com', 'local', '$2a$10$RktFmcTqN8wiYWJpUeZg.uvfvYyDPnJzK4HdFSPz7rp1PmlVYBkhK', NULL, NULL, NULL, 3, '2020-06-04 06:22:24', '2020-06-04 06:22:24', NULL, 'RO190273637492827', 'Unirii 77', '0741393014', NULL, NULL, NULL, NULL, NULL, 'Bubu', 'refff', NULL),
(86, 'Studio 0005', 'studio0005@gmail.com', NULL, '$2a$10$gqjd2idQlom0GETzXD.TO.vWPkdRg7yV4co4VLjNn915oE2MRH.8C', NULL, NULL, 1, 3, '2020-06-09 11:24:42', '2020-06-09 11:24:42', NULL, 'RO190273637492827', 'Unirii 77', '0741393014', NULL, NULL, NULL, NULL, NULL, 'Bubu', 'refff', NULL),
(99, 'Artist 1', 'edi_il@yahoo.com', 'local', '$2a$10$ApDczQ6Vfl4bXWaYQFp5y.F43iwSmdT1O0dHuiNydyXVjsvtkNrLy', NULL, 1, 0, 4, '2020-06-19 06:01:02', '2020-06-19 07:54:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TALENT', NULL, NULL, NULL),
(102, 'Studio 3', '', NULL, '$2a$10$Qa5F/EUNRUGG.NMivi.JYOlCJH81jO.Y.zN541RyxS1Z5TA8m.5OS', NULL, NULL, 1, NULL, '2020-07-09 10:10:00', '2020-07-09 10:10:00', NULL, NULL, 'Address 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Studio 55', 'edi_il@yahoo.com', NULL, '$2a$10$BYMU4ktpQ4AT3.zUdpJheeWRuYZ07SECVrE6q6IbUHKLGCw51rWyG', NULL, NULL, 1, NULL, '2020-07-09 10:59:21', '2020-07-09 10:59:21', NULL, '', 'Str. Viilor, nr 33, Bl 2, Ap 7', '0312311323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmed`, `blocked`, `role`, `created_at`, `updated_at`, `user_id`, `cui`, `address`, `phone`, `talent_type`, `media_type`, `arbiter_type`, `cnp`, `user_type`, `contact_name`, `referrer`, `avatar`) VALUES
(121, 'Studio 5551', 'edi_iiii@yahoo.com', NULL, '$2a$10$zDEbjxUREieUiauj5A9ko.cH1nmXEy4Y6FAw.6aRgnhmBffpOdsz2', NULL, NULL, 1, NULL, '2020-07-09 11:03:47', '2020-07-09 11:03:47', NULL, '', 'Str. Viilor, nr 33, Bl 2, Ap 7', '0312311323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, '', '', NULL, '', NULL, NULL, 1, NULL, '2020-07-28 10:22:05', '2020-07-28 10:22:05', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_user__talent_types`
--

INSERT INTO `users-permissions_user__talent_types` (`id`, `users-permissions_user_id`, `talent-type_id`) VALUES
(1, 99, 1),
(2, 6, 1),
(3, 99, 2),
(4, 122, 1);

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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=123;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
