-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29 Mai 2020 la 14:24
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
  `spot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

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
(7, 'db_model_users-permissions_user', '{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false},"cui":{"type":"string"},"address":{"type":"string"},"phone":{"type":"string"},"user_type":{"type":"enumeration","enum":["TALENT","STUDIO","BROADCAST","ARBITER"]},"contact_name":{"type":"string"},"referrer":{"type":"string"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(8, 'db_model_upload_file_morph', '{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"},"order":{"type":"integer"}}', 'object', NULL, NULL),
(9, 'plugin_email_provider', '{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}}}', 'object', 'development', ''),
(10, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true}', 'object', 'development', ''),
(11, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","redirect_uri":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"/auth/instagram/callback"},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"/auth/vk/callback","scope":["email"]}}', 'object', '', ''),
(12, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{"uid":"plugins::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"controller":{"edit":{"label":"Controller","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Controller","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"enabled":{"edit":{"label":"Enabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Enabled","searchable":true,"sortable":true}},"policy":{"edit":{"label":"Policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Policy","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":false,"sortable":false}}},"layouts":{"list":["id","type","controller","action"],"editRelations":["role"],"edit":[[{"name":"type","size":6},{"name":"controller","size":6}],[{"name":"action","size":6},{"name":"enabled","size":4}],[{"name":"policy","size":6}]]}}', 'object', '', ''),
(13, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{"uid":"plugins::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}', 'object', '', ''),
(14, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{"uid":"plugins::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"related":{"edit":{"label":"Related","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"Related","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["related"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}', 'object', '', ''),
(15, 'plugin_content_manager_configuration_content_types::strapi::administrator', '{"uid":"strapi::administrator","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","blocked"],"editRelations":[],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"blocked","size":4}]]}}', 'object', '', ''),
(16, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{"uid":"plugins::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":false,"sortable":false}},"cui":{"edit":{"label":"Cui","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Cui","searchable":true,"sortable":true}},"address":{"edit":{"label":"Address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Address","searchable":true,"sortable":true}},"phone":{"edit":{"label":"Phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Phone","searchable":true,"sortable":true}},"user_type":{"edit":{"label":"User_type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"User_type","searchable":true,"sortable":true}},"contact_name":{"edit":{"label":"Contact_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Contact_name","searchable":true,"sortable":true}},"referrer":{"edit":{"label":"Referrer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Referrer","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"cui","size":6}],[{"name":"address","size":6},{"name":"phone","size":6}],[{"name":"user_type","size":6}],[{"name":"contact_name","size":6},{"name":"referrer","size":6}]],"editRelations":["role"]}}', 'object', '', ''),
(17, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}', 'object', '', ''),
(18, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_confirmation_redirection":"http://0.0.0.0:1337/admin","email_reset_password":"http://0.0.0.0:1337/admin","default_role":"authenticated"}', 'object', '', ''),
(19, 'db_model_spots', '{"uid":{"type":"string","unique":true,"required":true},"title":{"type":"string"},"client":{"type":"string"},"spot_type":{"type":"enumeration","enum":["AUDIO","AUDIO_VIDEO","VIDEO"]},"duration":{"type":"integer"},"status":{"type":"enumeration","enum":["PENDING","PUBLISHED","INACTIVATED","DELETED"]},"referrer":{"type":"string"},"user":{"plugin":"users-permissions","model":"user"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(20, 'plugin_content_manager_configuration_content_types::application::spot.spot', '{"uid":"application::spot.spot","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"uid","defaultSortBy":"uid","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"uid":{"edit":{"label":"Uid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Uid","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"client":{"edit":{"label":"Client","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Client","searchable":true,"sortable":true}},"spot_type":{"edit":{"label":"Spot_type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Spot_type","searchable":true,"sortable":true}},"duration":{"edit":{"label":"Duration","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Duration","searchable":true,"sortable":true}},"status":{"edit":{"label":"Status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Status","searchable":true,"sortable":true}},"referrer":{"edit":{"label":"Referrer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Referrer","searchable":true,"sortable":true}},"user":{"edit":{"label":"User","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"User","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","uid","title","client"],"edit":[[{"name":"uid","size":6},{"name":"title","size":6}],[{"name":"client","size":6},{"name":"spot_type","size":6}],[{"name":"duration","size":4},{"name":"status","size":6}],[{"name":"referrer","size":6}]],"editRelations":["user"]}}', 'object', '', ''),
(21, 'db_model_spot_talents', '{"talent_role":{"type":"enumeration","enum":["ACTOR","VOICE"]},"obs":{"type":"text"},"user":{"plugin":"users-permissions","model":"user"},"spot":{"model":"spot"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(22, 'plugin_content_manager_configuration_content_types::application::spot-talent.spot-talent', '{"uid":"application::spot-talent.spot-talent","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"talent_role":{"edit":{"label":"Talent_role","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Talent_role","searchable":true,"sortable":true}},"obs":{"edit":{"label":"Obs","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Obs","searchable":true,"sortable":true}},"user":{"edit":{"label":"User","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"User","searchable":false,"sortable":false}},"spot":{"edit":{"label":"Spot","description":"","placeholder":"","visible":true,"editable":true,"mainField":"uid"},"list":{"label":"Spot","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","talent_role","obs"],"edit":[[{"name":"talent_role","size":6}],[{"name":"obs","size":6}]],"editRelations":["spot","user"]}}', 'object', '', ''),
(23, 'db_model_spot_broadcasts', '{"broadcast_duration":{"type":"integer"},"start_date":{"type":"date"},"media_type":{"type":"enumeration","enum":["AUDIO","AUDIO_VIDEO","VIDEO"]},"spot":{"model":"spot"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(24, 'plugin_content_manager_configuration_content_types::application::spot-broadcast.spot-broadcast', '{"uid":"application::spot-broadcast.spot-broadcast","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"broadcast_duration":{"edit":{"label":"Broadcast_duration","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Broadcast_duration","searchable":true,"sortable":true}},"start_date":{"edit":{"label":"Start_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Start_date","searchable":true,"sortable":true}},"media_type":{"edit":{"label":"Media_type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Media_type","searchable":true,"sortable":true}},"spot":{"edit":{"label":"Spot","description":"","placeholder":"","visible":true,"editable":true,"mainField":"uid"},"list":{"label":"Spot","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","broadcast_duration","start_date"],"edit":[[{"name":"broadcast_duration","size":4}],[{"name":"start_date","size":4},{"name":"media_type","size":6}]],"editRelations":["spot"]}}', 'object', '', ''),
(25, 'db_model_broadcast_tables', '{"date":{"type":"date"},"time":{"type":"time"},"spot":{"model":"spot"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
(26, 'plugin_content_manager_configuration_content_types::application::broadcast-table.broadcast-table', '{"uid":"application::broadcast-table.broadcast-table","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"date":{"edit":{"label":"Date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Date","searchable":true,"sortable":true}},"time":{"edit":{"label":"Time","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Time","searchable":true,"sortable":true}},"spot":{"edit":{"label":"Spot","description":"","placeholder":"","visible":true,"editable":true,"mainField":"uid"},"list":{"label":"Spot","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","date","time"],"edit":[[{"name":"date","size":4}],[{"name":"time","size":4}]],"editRelations":["spot"]}}', 'object', '', ''),
(27, 'db_model_spot_talents__uid', '{"spot_talent_id":{"type":"integer"},"spot_id":{"type":"integer"}}', 'object', NULL, NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `spots`
--

CREATE TABLE IF NOT EXISTS `spots` (
  `id` int(10) unsigned NOT NULL,
  `uid` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `spot_type` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spots`
--

INSERT INTO `spots` (`id`, `uid`, `title`, `client`, `spot_type`, `duration`, `status`, `referrer`, `created_at`, `updated_at`, `user`) VALUES
(1, 'ABD6575B', 'Spot 1', 'Emag', 'AUDIO', 20, 'PENDING', 'ref 2', '2020-05-26 08:54:32', '2020-05-29 09:00:45', NULL),
(2, '0K76VLPW', 'Spot 2', 'Flanco', 'AUDIO_VIDEO', 20, 'PENDING', 'ref', '2020-05-29 09:00:23', '2020-05-29 09:00:30', 1);

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
  `spot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `spot_talents`
--

INSERT INTO `spot_talents` (`id`, `uid`, `talent_role`, `obs`, `created_at`, `updated_at`, `spot`, `user`) VALUES
(1, 1, 'VOICE', 'jwjsbajb', '2020-05-26 09:00:55', '2020-05-29 09:03:36', 1, 2),
(2, 1, 'VOICE', 'jdnzjk', '2020-05-26 09:06:46', '2020-05-29 09:03:27', 1, 6);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=595 DEFAULT CHARSET=latin1;

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
(147, 'application', 'spot', 'count', 0, '', 1),
(148, 'application', 'spot', 'count', 1, '', 2),
(149, 'application', 'spot', 'create', 0, '', 1),
(150, 'application', 'spot', 'create', 1, '', 2),
(151, 'application', 'spot', 'delete', 0, '', 1),
(152, 'application', 'spot', 'delete', 1, '', 2),
(153, 'application', 'spot', 'find', 0, '', 1),
(154, 'application', 'spot', 'find', 1, '', 2),
(155, 'application', 'spot', 'findone', 0, '', 1),
(156, 'application', 'spot', 'findone', 1, '', 2),
(157, 'application', 'spot', 'update', 0, '', 1),
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
(213, 'application', 'spot', 'find', 0, '', 3),
(214, 'application', 'spot', 'findone', 0, '', 3),
(215, 'application', 'spot', 'count', 0, '', 3),
(216, 'application', 'spot', 'create', 0, '', 3),
(217, 'application', 'spot', 'update', 0, '', 3),
(218, 'application', 'spot', 'delete', 0, '', 3),
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
(254, 'users-permissions', 'user', 'find', 0, '', 3),
(255, 'users-permissions', 'user', 'me', 0, '', 3),
(256, 'users-permissions', 'user', 'findone', 0, '', 3),
(257, 'users-permissions', 'user', 'create', 0, '', 3),
(258, 'users-permissions', 'user', 'update', 0, '', 3),
(259, 'users-permissions', 'user', 'destroy', 0, '', 3),
(260, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 3),
(261, 'users-permissions', 'user', 'destroyall', 0, '', 3),
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
(284, 'upload', 'upload', 'upload', 0, '', 3),
(285, 'upload', 'upload', 'getsettings', 0, '', 3),
(286, 'upload', 'upload', 'updatesettings', 0, '', 3),
(287, 'upload', 'upload', 'findone', 0, '', 3),
(288, 'upload', 'upload', 'find', 0, '', 3),
(289, 'upload', 'upload', 'count', 0, '', 3),
(290, 'upload', 'upload', 'destroy', 0, '', 3),
(291, 'upload', 'upload', 'search', 0, '', 3),
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
(594, 'application', 'newcode', 'index', 0, '', 6);

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
  `referrer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `users-permissions_user`
--

INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmed`, `blocked`, `role`, `created_at`, `updated_at`, `user_id`, `cui`, `address`, `phone`, `talent_type`, `media_type`, `arbiter_type`, `cnp`, `user_type`, `contact_name`, `referrer`) VALUES
(1, 'Studio 1', 'studio@gmail.com', 'local', '$2a$10$EJt.E7RFxUQp6ms0prJhSOj4eJgZuQpceuGeMuaXI3tVheHDzvZ6S', NULL, 1, 0, 3, '2020-05-26 09:27:23', '2020-05-26 09:27:23', NULL, 'RO190273637492827', 'Unirii 7', '0741393014', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Voice 1', 'voice@gmail.com', 'local', '$2a$10$ADUfimbwILS5yB5R2cUvR.6QkSHW7jJBf3z5.rx/GQPgUUwDKg.WW', NULL, 1, 0, 4, '2020-05-26 09:30:16', '2020-05-29 09:02:47', NULL, 'RO190273637492827', 'Unirii 7', '0741393014', 'VOICE', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Broadcaster', 'broadcaster@gmail.com', 'local', '$2a$10$9Q2Wq1T.a6kJpIcTGGM9M.bB7CfqF6OvxPmXltZrz/fG0p3nfGilK', NULL, 0, 0, 5, '2020-05-26 09:31:11', '2020-05-26 09:31:11', NULL, 'RO190273637492827', 'Unirii 7', '0741393014', NULL, 'RADIO', NULL, NULL, NULL, NULL, NULL),
(4, 'Studio 2', 'studio2@gmail.com', 'local', '$2a$10$rnNn0C8K7TmAGJZJX6VLvOy6600kshzY/9JtM325Ay3WJWGAtcPki', NULL, NULL, NULL, 1, '2020-05-28 08:32:20', '2020-05-28 08:32:20', NULL, 'RO190273637492807', 'Unirii 2', '0741300014', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Studio 3', 'studio3@gmail.com', 'local', '$2a$10$f9VxuhD4W7I2CgWfSt0f4eIqSrxlwTx3GU0jlgSSw2eq9X78q6bJC', NULL, NULL, NULL, 1, '2020-05-28 08:34:49', '2020-05-28 08:34:49', NULL, 'RO190273637492807', 'Unirii 2', '0741300014', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Voice 2', 'edi.hermann@lemonbyte.ro', 'local', '$2a$10$D4Gw62Bj7yAg6120361LduUkoZ5zhaODZew1daeydpaYAHSTdd6KG', NULL, 0, 0, 1, '2020-05-29 09:02:39', '2020-05-29 09:02:39', NULL, '4354524522524', 'saFfSFSF', '0744666847', NULL, NULL, NULL, NULL, 'TALENT', NULL, 'ref 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `broadcast_tables`
--
ALTER TABLE `broadcast_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_store`
--
ALTER TABLE `core_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `spots_uid_unique` (`uid`);

--
-- Indexes for table `spot_broadcasts`
--
ALTER TABLE `spot_broadcasts`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `broadcast_tables`
--
ALTER TABLE `broadcast_tables`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `core_store`
--
ALTER TABLE `core_store`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `spots`
--
ALTER TABLE `spots`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `spot_broadcasts`
--
ALTER TABLE `spot_broadcasts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `upload_file`
--
ALTER TABLE `upload_file`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `upload_file_morph`
--
ALTER TABLE `upload_file_morph`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users-permissions_permission`
--
ALTER TABLE `users-permissions_permission`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=595;
--
-- AUTO_INCREMENT for table `users-permissions_role`
--
ALTER TABLE `users-permissions_role`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users-permissions_user`
--
ALTER TABLE `users-permissions_user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
