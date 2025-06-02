/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: apartments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 4146 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bank_accounts_new
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  `auth` longtext DEFAULT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bans
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dealers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(100) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `boss_reply` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `replied_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: harmony_cooldown
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `harmony_cooldown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(25) NOT NULL,
  `metadata` text NOT NULL,
  PRIMARY KEY (`serial`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: houselocations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text NOT NULL DEFAULT '{"y":0,"x":0,"w":0,"z":0}',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: keep_bags_retrieval
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `keep_bags_retrieval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `available_at` datetime NOT NULL,
  `expire_at` datetime NOT NULL,
  `metadata` text DEFAULT NULL,
  `claimed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `characterId` (`characterId`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lapraces
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: management_outfits
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_bolos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_bulletin
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_clocking
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_convictions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_data
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_impound
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_incidents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` longtext NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_logs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_reports
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_vehicleinfo
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_weaponinfo
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: multijobs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `multijobs` (
  `citizenid` varchar(100) NOT NULL,
  `jobdata` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_calls
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `isAnonymous` tinyint(4) NOT NULL DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_darkchat_channel_members
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_darkchat_channels
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(191) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_darkchat_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_marketplace_listings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_match_profiles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_match_views
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_messages_conversations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_messages_participants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_notes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_phone_contacts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_phone_gallery
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_twitter_likes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`, `tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_twitter_profiles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_twitter_reports
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`, `tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: npwd_twitter_tweets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: occasion_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: okokmarketplace_blackmarket
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `okokmarketplace_blackmarket` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: okokmarketplace_items
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `okokmarketplace_items` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: okokmarketplace_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `okokmarketplace_vehicles` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ox_doorlock
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ox_inventory
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`, `name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_groups
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_groups` (
  `citizenid` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`citizenid`, `type`, `group`),
  CONSTRAINT `fk_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_houses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_jobs_activity
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_jobs_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) NOT NULL,
  `last_checkin` int(11) NOT NULL,
  `last_checkout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `last_checkout` (`last_checkout`) USING BTREE,
  KEY `citizenid_job` (`citizenid`, `job`) USING BTREE,
  CONSTRAINT `player_jobs_activity_ibfk_1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_mails
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_outfit_codes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_outfits
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`, `outfitname`, `model`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_transactions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(15) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `parking` varchar(60) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  CONSTRAINT `player_vehicles_ibfk_1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_vehicles_fuel_type
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_vehicles_fuel_type` (
  `plate` varchar(20) NOT NULL,
  `fuelType` varchar(20) NOT NULL,
  PRIMARY KEY (`plate`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: players
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned DEFAULT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_logged_out` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE = InnoDB AUTO_INCREMENT = 516 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: playerskins
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: properties
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` varchar(255) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `price` int(11) NOT NULL DEFAULT 0,
  `owner` varchar(50) DEFAULT NULL,
  `interior` varchar(255) NOT NULL,
  `keyholders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`keyholders`)),
  `rent_interval` int(11) DEFAULT NULL,
  `interact_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`interact_options`)),
  `stash_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`stash_options`)),
  `garage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage`)),
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `players` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: properties_decorations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `properties_decorations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `rotation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`rotation`)),
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `properties_decorations_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ps_banking_accounts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ps_banking_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` bigint(20) NOT NULL,
  `holder` varchar(255) NOT NULL,
  `cardNumber` varchar(255) NOT NULL,
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`users`)),
  `owner` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`owner`)),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ps_banking_bills
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ps_banking_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `date` date NOT NULL,
  `isPaid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ps_banking_transactions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ps_banking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `date` date NOT NULL,
  `isIncome` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: uniq_battlepass
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `uniq_battlepass` (
  `owner` varchar(72) DEFAULT NULL,
  `battlepass` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `license2` varchar(50) DEFAULT NULL,
  `fivem` varchar(20) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicle_financing
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicle_financing` (
  `vehicleId` int(11) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `paymentamount` int(11) DEFAULT NULL,
  `paymentsleft` int(11) DEFAULT NULL,
  `financetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`),
  CONSTRAINT `vehicleId` FOREIGN KEY (`vehicleId`) REFERENCES `player_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicle_mileage
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicle_mileage` (
  `plate` varchar(50) NOT NULL,
  `mileage` double NOT NULL DEFAULT 0,
  `last_oil_change` double NOT NULL DEFAULT 0,
  `last_oil_filter_change` double NOT NULL DEFAULT 0,
  `last_air_filter_change` double NOT NULL DEFAULT 0,
  `last_tire_change` double NOT NULL DEFAULT 0,
  `last_brakes_change` double NOT NULL DEFAULT 0,
  `brake_wear` double NOT NULL DEFAULT 0,
  `last_clutch_change` double NOT NULL DEFAULT 0,
  `clutch_wear` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: weed_plants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(30) DEFAULT NULL,
  `stage` tinyint(4) NOT NULL DEFAULT 1,
  `sort` varchar(30) NOT NULL,
  `gender` enum('male', 'female') NOT NULL,
  `food` tinyint(4) NOT NULL DEFAULT 100,
  `health` tinyint(4) NOT NULL DEFAULT 100,
  `stageProgress` tinyint(4) NOT NULL DEFAULT 0,
  `coords` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: xt_prison
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `xt_prison` (
  `identifier` varchar(100) NOT NULL,
  `jailtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: xt_prison_items
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `xt_prison_items` (
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  UNIQUE KEY `owner` (`owner`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: yecoyz_duty
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `yecoyz_duty` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` tinytext NOT NULL,
  `history` longtext NOT NULL,
  `multiplier` tinytext DEFAULT NULL,
  `offDuty` tinytext DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: apartments
# ------------------------------------------------------------

INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4145,
    'apartment27395',
    'apartment1',
    'Intigrity Apartment',
    'N1W934Z7'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bank_accounts_new
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bans
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dealers
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: harmony_cooldown
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: houselocations
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: keep_bags_retrieval
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lapraces
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: management_outfits
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_bolos
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_bulletin
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_clocking
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_convictions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_data
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_impound
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_incidents
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_logs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_reports
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_vehicleinfo
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_weaponinfo
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: multijobs
# ------------------------------------------------------------

INSERT INTO
  `multijobs` (`citizenid`, `jobdata`)
VALUES
  (
    'AB8CT198',
    '{\"police\":3,\"cardealer\":2,\"ambulance\":1}'
  );
INSERT INTO
  `multijobs` (`citizenid`, `jobdata`)
VALUES
  ('N1W934Z7', '{\"police\":2}');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_calls
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_darkchat_channel_members
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_darkchat_channels
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_darkchat_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_marketplace_listings
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_match_profiles
# ------------------------------------------------------------

INSERT INTO
  `npwd_match_profiles` (
    `id`,
    `identifier`,
    `name`,
    `image`,
    `bio`,
    `location`,
    `job`,
    `tags`,
    `voiceMessage`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'AB8CT198',
    'Dsadsa Dsads',
    'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
    '',
    '',
    '',
    '',
    NULL,
    '2025-05-15 18:47:54',
    '2025-05-15 18:47:54'
  );
INSERT INTO
  `npwd_match_profiles` (
    `id`,
    `identifier`,
    `name`,
    `image`,
    `bio`,
    `location`,
    `job`,
    `tags`,
    `voiceMessage`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'N1W934Z7',
    'Damon Walker',
    'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
    '',
    '',
    '',
    '',
    NULL,
    '2025-05-20 17:17:02',
    '2025-05-20 17:17:02'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_match_views
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_messages_conversations
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_messages_participants
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_notes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_phone_contacts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_phone_gallery
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_twitter_likes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_twitter_profiles
# ------------------------------------------------------------

INSERT INTO
  `npwd_twitter_profiles` (
    `id`,
    `profile_name`,
    `identifier`,
    `avatar_url`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'Dsadsa_Dsads',
    'AB8CT198',
    'https://i.fivemanage.com/images/3ClWwmpwkFhL.png',
    '2025-05-15 18:47:54',
    '2025-05-15 18:47:54'
  );
INSERT INTO
  `npwd_twitter_profiles` (
    `id`,
    `profile_name`,
    `identifier`,
    `avatar_url`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'Damon_Walker',
    'N1W934Z7',
    'https://i.fivemanage.com/images/3ClWwmpwkFhL.png',
    '2025-05-20 17:17:02',
    '2025-05-20 17:17:02'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_twitter_reports
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: npwd_twitter_tweets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: occasion_vehicles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: okokmarketplace_blackmarket
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: okokmarketplace_items
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: okokmarketplace_vehicles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ox_doorlock
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ox_inventory
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_groups
# ------------------------------------------------------------

INSERT INTO
  `player_groups` (`citizenid`, `group`, `type`, `grade`)
VALUES
  ('AB8CT198', 'ambulance', 'job', 1);
INSERT INTO
  `player_groups` (`citizenid`, `group`, `type`, `grade`)
VALUES
  ('N1W934Z7', 'police', 'job', 2);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_houses
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_jobs_activity
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_mails
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_outfit_codes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_outfits
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_transactions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_vehicles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_vehicles_fuel_type
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: players
# ------------------------------------------------------------

INSERT INTO
  `players` (
    `id`,
    `userId`,
    `citizenid`,
    `cid`,
    `license`,
    `name`,
    `money`,
    `charinfo`,
    `job`,
    `gang`,
    `position`,
    `metadata`,
    `inventory`,
    `phone_number`,
    `last_updated`,
    `last_logged_out`
  )
VALUES
  (
    348,
    1,
    'AB8CT198',
    1,
    'license2:45d9f75fc8acd37fb0f5f274564fccfef6c7eda1',
    'Damon </>',
    '{\"cash\":500,\"crypto\":0,\"bank\":8625}',
    '{\"nationality\":\"American\",\"birthdate\":\"2006-12-31\",\"phone\":\"4536397561\",\"backstory\":\"placeholder backstory\",\"account\":\"US04QBX1259116628\",\"firstname\":\"Dsadsa\",\"cid\":1,\"lastname\":\"Dsads\",\"gender\":0}',
    '{\"grade\":{\"name\":\"Paramedic\",\"level\":1},\"bankAuth\":false,\"onduty\":true,\"payment\":75,\"isboss\":false,\"type\":\"ems\",\"name\":\"ambulance\",\"label\":\"EMS\"}',
    '{\"bankAuth\":false,\"isboss\":false,\"grade\":{\"name\":\"Unaffiliated\",\"level\":0},\"name\":\"none\",\"label\":\"No Gang\"}',
    '{\"x\":-975.6395263671875,\"y\":-375.6131896972656,\"z\":37.82275390625,\"w\":172.91339111328126}',
    '{\"isdead\":false,\"licences\":{\"weapon\":false,\"id\":true,\"driver\":true},\"bloodtype\":\"B+\",\"thirst\":50.60000000000004,\"inside\":{\"apartment\":[]},\"attachmentcraftingrep\":0,\"phone\":[],\"jobrep\":{\"trucker\":0,\"taxi\":0,\"hotdog\":0,\"tow\":0},\"craftingrep\":0,\"hunger\":45.39999999999996,\"tracker\":false,\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":59458618},\"health\":200,\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"status\":[],\"jailitems\":[],\"inlaststand\":false,\"injail\":0,\"fingerprint\":\"8526L7XGI2SE88E\",\"walletid\":\"QB-32825114\",\"dealerrep\":0,\"stress\":0,\"criminalrecord\":{\"hasRecord\":false},\"ishandcuffed\":false}',
    '[{\"metadata\":{\"serial\":\"769187AQY954155\",\"registered\":\"Dsadsa Dsads\",\"ammo\":11,\"components\":[],\"durability\":96.00000000000004},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":1},{\"name\":\"money\",\"count\":500,\"slot\":2},{\"name\":\"phone\",\"count\":1,\"slot\":3},{\"metadata\":{\"firstname\":\"Dsadsa\",\"lastname\":\"Dsads\",\"sex\":\"M\",\"citizenid\":\"AB8CT198\",\"birthdate\":\"2006-12-31\",\"cardtype\":\"id_card\",\"nationality\":\"American\",\"badge\":\"none\"},\"name\":\"id_card\",\"count\":1,\"slot\":4},{\"metadata\":{\"firstname\":\"Dsadsa\",\"lastname\":\"Dsads\",\"sex\":\"M\",\"citizenid\":\"AB8CT198\",\"birthdate\":\"2006-12-31\",\"cardtype\":\"driver_license\",\"nationality\":\"American\",\"badge\":\"none\"},\"name\":\"driver_license\",\"count\":1,\"slot\":5},{\"name\":\"ammo-45\",\"count\":10,\"slot\":6},{\"name\":\"ammo-9\",\"count\":49,\"slot\":7}]',
    '4536397561',
    '2025-06-02 22:57:04',
    '2025-06-02 22:57:04'
  );
INSERT INTO
  `players` (
    `id`,
    `userId`,
    `citizenid`,
    `cid`,
    `license`,
    `name`,
    `money`,
    `charinfo`,
    `job`,
    `gang`,
    `position`,
    `metadata`,
    `inventory`,
    `phone_number`,
    `last_updated`,
    `last_logged_out`
  )
VALUES
  (
    419,
    1,
    'N1W934Z7',
    2,
    'license2:45d9f75fc8acd37fb0f5f274564fccfef6c7eda1',
    'Damon </>',
    '{\"cash\":123029926,\"crypto\":0,\"bank\":5820}',
    '{\"nationality\":\"Algerian\",\"gender\":0,\"firstname\":\"Damon\",\"backstory\":\"placeholder backstory\",\"phone\":\"3677875738\",\"cid\":2,\"account\":\"US05QBX1145517890\",\"birthdate\":\"2006-12-31\",\"lastname\":\"Walker\"}',
    '{\"grade\":{\"level\":2,\"name\":\"Sergeant\"},\"name\":\"police\",\"type\":\"leo\",\"label\":\"LSPD\",\"payment\":100,\"bankAuth\":false,\"isboss\":false,\"onduty\":true}',
    '{\"grade\":{\"level\":0,\"name\":\"Unaffiliated\"},\"name\":\"none\",\"isboss\":false,\"label\":\"No Gang\",\"bankAuth\":false}',
    '{\"x\":26.98022270202636,\"y\":-1347.151611328125,\"z\":29.4820556640625,\"w\":246.61416625976563}',
    '{\"isdead\":false,\"criminalrecord\":{\"hasRecord\":false},\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":53764792},\"callsign\":\"NO CALLSIGN\",\"ishandcuffed\":false,\"hunger\":62.19999999999997,\"jailitems\":[],\"injail\":0,\"inlaststand\":false,\"stress\":0,\"thirst\":65.80000000000003,\"inside\":{\"apartment\":[]},\"jobrep\":{\"tow\":0,\"taxi\":0,\"hotdog\":0,\"trucker\":0},\"bloodtype\":\"A+\",\"phone\":[],\"craftingrep\":0,\"health\":200,\"attachmentcraftingrep\":0,\"armor\":0,\"licences\":{\"id\":true,\"weapon\":false,\"driver\":true},\"fingerprint\":\"JS01SNSY56B26C1\",\"walletid\":\"QB-23856967\",\"dealerrep\":0,\"tracker\":false,\"status\":[]}',
    '[{\"name\":\"d_bluechip\",\"slot\":1,\"count\":16},{\"name\":\"d_redchip\",\"slot\":2,\"count\":16},{\"name\":\"d_greenchip\",\"slot\":3,\"count\":16},{\"name\":\"d_hak_kit2\",\"slot\":4,\"count\":15},{\"name\":\"WEAPON_HEAVYPISTOL\",\"slot\":5,\"metadata\":{\"durability\":100,\"components\":[],\"registered\":\"Damon Walker\",\"serial\":\"281816QMR744220\",\"ammo\":0},\"count\":1},{\"name\":\"money\",\"slot\":6,\"count\":123029926},{\"name\":\"phone\",\"slot\":7,\"count\":1},{\"name\":\"WEAPON_SNSPISTOL\",\"slot\":8,\"metadata\":{\"durability\":100,\"components\":[],\"registered\":\"Damon Walker\",\"serial\":\"565745LDY203883\",\"ammo\":0},\"count\":1},{\"name\":\"id_card\",\"slot\":11,\"metadata\":{\"nationality\":\"Algerian\",\"birthdate\":\"2006-12-31\",\"firstname\":\"Damon\",\"lastname\":\"Walker\",\"citizenid\":\"N1W934Z7\",\"cardtype\":\"id_card\",\"sex\":\"M\",\"badge\":\"none\"},\"count\":1},{\"name\":\"driver_license\",\"slot\":12,\"metadata\":{\"nationality\":\"Algerian\",\"birthdate\":\"2006-12-31\",\"firstname\":\"Damon\",\"lastname\":\"Walker\",\"citizenid\":\"N1W934Z7\",\"cardtype\":\"driver_license\",\"sex\":\"M\",\"badge\":\"none\"},\"count\":1},{\"name\":\"WEAPON_SNSPISTOL\",\"slot\":13,\"metadata\":{\"durability\":100,\"components\":[],\"registered\":\"Damon Walker\",\"serial\":\"242013CIN930025\",\"ammo\":0},\"count\":1},{\"name\":\"WEAPON_HEAVYPISTOL\",\"slot\":16,\"metadata\":{\"durability\":100,\"components\":[],\"registered\":\"Damon Walker\",\"serial\":\"963347CDB906194\",\"ammo\":0},\"count\":1},{\"name\":\"WEAPON_SNSPISTOL\",\"slot\":21,\"metadata\":{\"durability\":100,\"components\":[],\"registered\":\"Damon Walker\",\"serial\":\"312109UIR301279\",\"ammo\":0},\"count\":1},{\"name\":\"WEAPON_HEAVYPISTOL\",\"slot\":17,\"metadata\":{\"durability\":100,\"components\":[],\"registered\":\"Damon Walker\",\"serial\":\"957931FZX500743\",\"ammo\":0},\"count\":1}]',
    '3677875738',
    '2025-05-30 04:23:25',
    '2025-05-30 04:23:25'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: playerskins
# ------------------------------------------------------------

INSERT INTO
  `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`)
VALUES
  (
    1,
    'AB8CT198',
    'mp_m_freemode_01',
    '{\"tattoos\":[],\"hair\":{\"texture\":0,\"color\":0,\"style\":0,\"highlight\":0},\"eyeColor\":-1,\"headOverlays\":{\"beard\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"makeUp\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"ageing\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"chestHair\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"bodyBlemishes\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"blush\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"eyebrows\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"blemishes\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"lipstick\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"complexion\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"moleAndFreckles\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"sunDamage\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0}},\"headBlend\":{\"skinFirst\":0,\"shapeThird\":0,\"shapeMix\":0,\"shapeSecond\":0,\"skinSecond\":0,\"skinThird\":0,\"shapeFirst\":0,\"thirdMix\":0,\"skinMix\":0},\"faceFeatures\":{\"chinBoneLenght\":0,\"noseBoneHigh\":0,\"noseWidth\":0,\"cheeksBoneWidth\":0,\"nosePeakHigh\":0,\"eyeBrownHigh\":0,\"eyeBrownForward\":0,\"chinBoneSize\":0,\"cheeksWidth\":0,\"jawBoneBackSize\":0,\"eyesOpening\":0,\"neckThickness\":0,\"nosePeakLowering\":0,\"noseBoneTwist\":0,\"nosePeakSize\":0,\"chinBoneLowering\":0,\"chinHole\":0,\"jawBoneWidth\":0,\"cheeksBoneHigh\":0,\"lipsThickness\":0},\"props\":[{\"texture\":-1,\"drawable\":-1,\"prop_id\":0},{\"texture\":-1,\"drawable\":-1,\"prop_id\":1},{\"texture\":-1,\"drawable\":-1,\"prop_id\":2},{\"texture\":-1,\"drawable\":-1,\"prop_id\":6},{\"texture\":-1,\"drawable\":-1,\"prop_id\":7}],\"model\":\"mp_m_freemode_01\",\"components\":[{\"texture\":0,\"drawable\":0,\"component_id\":0},{\"texture\":0,\"drawable\":0,\"component_id\":1},{\"texture\":0,\"drawable\":0,\"component_id\":2},{\"texture\":0,\"drawable\":0,\"component_id\":3},{\"texture\":0,\"drawable\":0,\"component_id\":4},{\"texture\":0,\"drawable\":0,\"component_id\":5},{\"texture\":0,\"drawable\":0,\"component_id\":6},{\"texture\":0,\"drawable\":-1,\"component_id\":7},{\"texture\":0,\"drawable\":0,\"component_id\":8},{\"texture\":0,\"drawable\":0,\"component_id\":9},{\"texture\":0,\"drawable\":0,\"component_id\":10},{\"texture\":0,\"drawable\":0,\"component_id\":11}]}',
    1
  );
INSERT INTO
  `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`)
VALUES
  (
    2,
    'N1W934Z7',
    'mp_m_freemode_01',
    '{\"headOverlays\":{\"blemishes\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"complexion\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"makeUp\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"sunDamage\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"moleAndFreckles\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"bodyBlemishes\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"beard\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"lipstick\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"ageing\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"eyebrows\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"chestHair\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0},\"blush\":{\"style\":0,\"opacity\":0,\"color\":0,\"secondColor\":0}},\"model\":\"mp_m_freemode_01\",\"tattoos\":[],\"headBlend\":{\"shapeSecond\":0,\"skinFirst\":0,\"thirdMix\":0,\"shapeFirst\":0,\"shapeMix\":0,\"shapeThird\":0,\"skinThird\":0,\"skinSecond\":0,\"skinMix\":0},\"eyeColor\":0,\"components\":[{\"component_id\":0,\"drawable\":0,\"texture\":0},{\"component_id\":1,\"drawable\":0,\"texture\":0},{\"component_id\":2,\"drawable\":0,\"texture\":0},{\"component_id\":3,\"drawable\":0,\"texture\":0},{\"component_id\":4,\"drawable\":0,\"texture\":0},{\"component_id\":5,\"drawable\":0,\"texture\":0},{\"component_id\":6,\"drawable\":0,\"texture\":0},{\"component_id\":7,\"drawable\":-1,\"texture\":0},{\"component_id\":8,\"drawable\":0,\"texture\":0},{\"component_id\":9,\"drawable\":0,\"texture\":0},{\"component_id\":10,\"drawable\":0,\"texture\":0},{\"component_id\":11,\"drawable\":0,\"texture\":0}],\"hair\":{\"highlight\":0,\"texture\":0,\"color\":0,\"style\":0},\"faceFeatures\":{\"jawBoneWidth\":0,\"noseBoneTwist\":0,\"nosePeakHigh\":0,\"nosePeakSize\":0,\"eyeBrownHigh\":0,\"chinBoneSize\":0,\"jawBoneBackSize\":0,\"chinBoneLowering\":0,\"neckThickness\":0,\"noseBoneHigh\":0,\"eyesOpening\":0,\"cheeksBoneWidth\":0,\"chinHole\":0,\"cheeksBoneHigh\":0,\"cheeksWidth\":0,\"nosePeakLowering\":0,\"eyeBrownForward\":0,\"chinBoneLenght\":0,\"noseWidth\":0,\"lipsThickness\":0},\"props\":[{\"texture\":-1,\"drawable\":-1,\"prop_id\":0},{\"texture\":-1,\"drawable\":-1,\"prop_id\":1},{\"texture\":-1,\"drawable\":-1,\"prop_id\":2},{\"texture\":-1,\"drawable\":-1,\"prop_id\":6},{\"texture\":-1,\"drawable\":-1,\"prop_id\":7}]}',
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: properties
# ------------------------------------------------------------

INSERT INTO
  `properties` (
    `id`,
    `property_name`,
    `coords`,
    `price`,
    `owner`,
    `interior`,
    `keyholders`,
    `rent_interval`,
    `interact_options`,
    `stash_options`,
    `garage`
  )
VALUES
  (
    6,
    'Del Perro Heights Apt 1',
    '{\"x\":-1447.3499755859376,\"y\":-537.8400268554688,\"z\":34.7400016784668}',
    0,
    'AB8CT198',
    'DellPerroHeightsApt4',
    '{}',
    NULL,
    '[{\"coords\":{\"x\":-1454.0799560546876,\"y\":-553.25,\"z\":72.83999633789063},\"type\":\"logout\"},{\"coords\":{\"x\":-1449.8800048828126,\"y\":-549.25,\"z\":72.83999633789063},\"type\":\"clothing\"},{\"coords\":{\"x\":-1453.02001953125,\"y\":-539.5,\"z\":74.04000091552735,\"w\":35.33000183105469},\"type\":\"exit\"}]',
    '[{\"slots\":50,\"coords\":{\"x\":-1466.8299560546876,\"y\":-527.030029296875,\"z\":73.44000244140625},\"maxWeight\":150000}]',
    NULL
  );
INSERT INTO
  `properties` (
    `id`,
    `property_name`,
    `coords`,
    `price`,
    `owner`,
    `interior`,
    `keyholders`,
    `rent_interval`,
    `interact_options`,
    `stash_options`,
    `garage`
  )
VALUES
  (
    7,
    '4 Integrity Way Apt 7',
    '{\"x\":-47.52000045776367,\"y\":-585.8599853515625,\"z\":37.95000076293945}',
    0,
    'N1W934Z7',
    '4IntegrityWayApt30',
    '{}',
    NULL,
    '[{\"coords\":{\"x\":-37.27999877929687,\"y\":-577.8900146484375,\"z\":83.91000366210938},\"type\":\"logout\"},{\"coords\":{\"x\":-38.11000061035156,\"y\":-583.47998046875,\"z\":83.91999816894531},\"type\":\"clothing\"},{\"coords\":{\"x\":-17.40999984741211,\"y\":-588.1699829101563,\"z\":90.11000061035156,\"w\":338.2300109863281},\"type\":\"exit\"}]',
    '[{\"slots\":50,\"maxWeight\":150000,\"coords\":{\"x\":-26.95000076293945,\"y\":-588.6099853515625,\"z\":90.12000274658203}}]',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: properties_decorations
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ps_banking_accounts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ps_banking_bills
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ps_banking_transactions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: uniq_battlepass
# ------------------------------------------------------------

INSERT INTO
  `uniq_battlepass` (`owner`, `battlepass`, `lastupdated`)
VALUES
  (
    'AB8CT198',
    '{\"daily\":[\"SignIn\"],\"freeClaims\":[],\"playtime\":[],\"premium\":false,\"premiumClaims\":[],\"purchasedate\":0,\"tier\":17,\"weekly\":[],\"xp\":100}',
    '2025-06-02 22:55:00'
  );
INSERT INTO
  `uniq_battlepass` (`owner`, `battlepass`, `lastupdated`)
VALUES
  (
    'N1W934Z7',
    '{\"daily\":[\"SignIn\"],\"freeClaims\":[],\"playtime\":[],\"premium\":false,\"premiumClaims\":[],\"purchasedate\":0,\"tier\":10,\"weekly\":[],\"xp\":300}',
    '2025-05-30 04:20:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `userId`,
    `username`,
    `license`,
    `license2`,
    `fivem`,
    `discord`
  )
VALUES
  (
    1,
    'Damon </>',
    'license:45d9f75fc8acd37fb0f5f274564fccfef6c7eda1',
    'license2:45d9f75fc8acd37fb0f5f274564fccfef6c7eda1',
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicle_financing
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicle_mileage
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: weed_plants
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: xt_prison
# ------------------------------------------------------------

INSERT INTO
  `xt_prison` (`identifier`, `jailtime`)
VALUES
  ('AB8CT198', 0);
INSERT INTO
  `xt_prison` (`identifier`, `jailtime`)
VALUES
  ('N1W934Z7', 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: xt_prison_items
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: yecoyz_duty
# ------------------------------------------------------------


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
