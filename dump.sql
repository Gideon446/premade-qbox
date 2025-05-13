/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `bank_accounts_new` (
	`id` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`amount` INT(11) NULL DEFAULT '0',
	`transactions` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`auth` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`isFrozen` INT(11) NULL DEFAULT '0',
	`creator` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;

CREATE TABLE `bans` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`license` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`discord` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`ip` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`reason` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`expire` INT(11) NULL DEFAULT NULL,
	`bannedby` VARCHAR(255) NOT NULL DEFAULT 'LeBanhammer' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `license` (`license`) USING BTREE,
	INDEX `discord` (`discord`) USING BTREE,
	INDEX `ip` (`ip`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;

CREATE TABLE `dealers` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_unicode_ci',
	`coords` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`time` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`createdby` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `employee_messages` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`job` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`sender_name` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`boss_reply` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`replied_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `harmony_cooldown` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`serial` VARCHAR(25) NOT NULL COLLATE 'utf8mb4_general_ci',
	`metadata` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`serial`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `houselocations` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`label` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`coords` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`owned` TINYINT(2) NULL DEFAULT NULL,
	`price` INT(11) NULL DEFAULT NULL,
	`tier` TINYINT(4) NULL DEFAULT NULL,
	`garage` TEXT NOT NULL DEFAULT '{"y":0,"x":0,"w":0,"z":0}' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `name` (`name`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;
CREATE TABLE `keep_bags_retrieval` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`characterId` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`quantity` INT(11) NULL DEFAULT NULL,
	`available_at` DATETIME NOT NULL,
	`expire_at` DATETIME NOT NULL,
	`metadata` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`claimed` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `characterId` (`characterId`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `lapraces` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`checkpoints` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`records` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`creator` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`distance` INT(11) NULL DEFAULT NULL,
	`raceid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `raceid` (`raceid`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `management_outfits` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`minrank` INT(11) NOT NULL DEFAULT '0',
	`name` VARCHAR(50) NOT NULL DEFAULT 'Cool Outfit' COLLATE 'utf8mb4_unicode_ci',
	`gender` VARCHAR(50) NOT NULL DEFAULT 'male' COLLATE 'utf8mb4_unicode_ci',
	`model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`props` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`components` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_bolos` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`author` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`plate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`owner` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`individual` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`detail` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`tags` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`gallery` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`officersinvolved` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`time` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`jobtype` VARCHAR(25) NOT NULL DEFAULT 'police' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_bulletin` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`title` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`desc` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`author` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`time` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`jobtype` VARCHAR(25) NULL DEFAULT 'police' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_clocking` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`user_id` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`firstname` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`lastname` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`clock_in_time` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`clock_out_time` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`total_time` INT(10) NOT NULL DEFAULT '0',
	PRIMARY KEY (`user_id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_convictions` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`cid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`linkedincident` INT(11) NOT NULL DEFAULT '0',
	`warrant` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`guilty` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`processed` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`associated` VARCHAR(50) NULL DEFAULT '0' COLLATE 'utf8mb4_unicode_ci',
	`charges` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`fine` INT(11) NULL DEFAULT '0',
	`sentence` INT(11) NULL DEFAULT '0',
	`recfine` INT(11) NULL DEFAULT '0',
	`recsentence` INT(11) NULL DEFAULT '0',
	`time` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_data` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`cid` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`information` MEDIUMTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`tags` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`gallery` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`jobtype` VARCHAR(25) NULL DEFAULT 'police' COLLATE 'utf8mb4_unicode_ci',
	`pfp` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`fingerprint` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`cid`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_impound` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`vehicleid` INT(11) NOT NULL,
	`linkedreport` INT(11) NOT NULL,
	`fee` INT(11) NULL DEFAULT NULL,
	`time` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_incidents` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`author` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`title` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_unicode_ci',
	`details` LONGTEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`tags` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`officersinvolved` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`civsinvolved` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`evidence` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`time` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`jobtype` VARCHAR(25) NOT NULL DEFAULT 'police' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_logs` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`text` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`time` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`jobtype` VARCHAR(25) NULL DEFAULT 'police' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_reports` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`author` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`title` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`type` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`details` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`tags` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`officersinvolved` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`civsinvolved` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`gallery` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`time` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`jobtype` VARCHAR(25) NULL DEFAULT 'police' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_vehicleinfo` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`plate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`information` TEXT NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`stolen` TINYINT(1) NOT NULL DEFAULT '0',
	`code5` TINYINT(1) NOT NULL DEFAULT '0',
	`image` TEXT NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`points` INT(11) NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_weaponinfo` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`serial` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`owner` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`information` TEXT NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	`weapClass` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`weapModel` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`image` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `serial` (`serial`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `multijobs` (
	`citizenid` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`jobdata` TEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`citizenid`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_calls` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(48) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`transmitter` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`receiver` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`is_accepted` TINYINT(4) NULL DEFAULT '0',
	`isAnonymous` TINYINT(4) NOT NULL DEFAULT '0',
	`start` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`end` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_darkchat_channels` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`channel_identifier` VARCHAR(191) NOT NULL COLLATE 'utf8mb4_general_ci',
	`label` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=20
;
CREATE TABLE `npwd_darkchat_channel_members` (
	`channel_id` INT(11) NOT NULL,
	`user_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`is_owner` TINYINT(4) NOT NULL DEFAULT '0',
	INDEX `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
	CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_darkchat_messages` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`channel_id` INT(11) NOT NULL,
	`message` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`is_image` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
	CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=31
;
CREATE TABLE `npwd_marketplace_listings` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(48) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`username` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`number` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`title` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`url` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`updatedAt` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`reported` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_match_profiles` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_general_ci',
	`name` VARCHAR(90) NOT NULL COLLATE 'utf8_general_ci',
	`image` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`bio` VARCHAR(512) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`location` VARCHAR(45) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`job` VARCHAR(45) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`tags` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`voiceMessage` VARCHAR(512) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`updatedAt` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `identifier_UNIQUE` (`identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7
;
CREATE TABLE `npwd_match_views` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_general_ci',
	`profile` INT(11) NOT NULL,
	`liked` TINYINT(4) NULL DEFAULT '0',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`updatedAt` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `match_profile_idx` (`profile`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE,
	CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_messages` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`message` VARCHAR(512) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_identifier` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_general_ci',
	`conversation_id` VARCHAR(512) NOT NULL COLLATE 'utf8_general_ci',
	`isRead` TINYINT(4) NOT NULL DEFAULT '0',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`updatedAt` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`visible` TINYINT(4) NOT NULL DEFAULT '1',
	`author` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`is_embed` TINYINT(4) NOT NULL DEFAULT '0',
	`embed` VARCHAR(512) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `user_identifier` (`user_identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_messages_conversations` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`conversation_list` VARCHAR(225) NOT NULL COLLATE 'utf8mb4_general_ci',
	`label` VARCHAR(60) NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`updatedAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`last_message_id` INT(11) NULL DEFAULT NULL,
	`is_group_chat` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_messages_participants` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`conversation_id` INT(11) NOT NULL,
	`participant` VARCHAR(225) NOT NULL COLLATE 'utf8mb4_general_ci',
	`unread_count` INT(11) NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
	CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_notes` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_general_ci',
	`title` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`content` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_phone_contacts` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(48) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`avatar` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`number` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`display` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_phone_contacts` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(48) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`avatar` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`number` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`display` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_twitter_likes` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`profile_id` INT(11) NOT NULL,
	`tweet_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `unique_combination` (`profile_id`, `tweet_id`) USING BTREE,
	INDEX `profile_idx` (`profile_id`) USING BTREE,
	INDEX `tweet_idx` (`tweet_id`) USING BTREE,
	CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_twitter_likes` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`profile_id` INT(11) NOT NULL,
	`tweet_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `unique_combination` (`profile_id`, `tweet_id`) USING BTREE,
	INDEX `profile_idx` (`profile_id`) USING BTREE,
	INDEX `tweet_idx` (`tweet_id`) USING BTREE,
	CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_twitter_reports` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`profile_id` INT(11) NOT NULL,
	`tweet_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `unique_combination` (`profile_id`, `tweet_id`) USING BTREE,
	INDEX `profile_idx` (`profile_id`) USING BTREE,
	INDEX `tweet_idx` (`tweet_id`) USING BTREE,
	CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `npwd_twitter_tweets` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`message` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_general_ci',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`updatedAt` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`likes` INT(11) NOT NULL DEFAULT '0',
	`identifier` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_general_ci',
	`visible` TINYINT(4) NOT NULL DEFAULT '1',
	`images` VARCHAR(1000) NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`retweet` INT(11) NULL DEFAULT NULL,
	`profile_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
	CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `occasion_vehicles` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`seller` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`price` INT(11) NULL DEFAULT NULL,
	`description` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`plate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`mods` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`occasionid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `occasionId` (`occasionid`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `okokmarketplace_blackmarket` (
	`id` INT(255) NOT NULL AUTO_INCREMENT,
	`item_id` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`label` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`type` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`amount` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`author_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`author_name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`phone_number` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`price` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`sold` TINYINT(1) NOT NULL DEFAULT '0',
	`start_date` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `okokmarketplace_items` (
	`id` INT(255) NOT NULL AUTO_INCREMENT,
	`item_id` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`label` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`amount` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`author_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`author_name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`phone_number` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`price` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`sold` TINYINT(1) NOT NULL DEFAULT '0',
	`start_date` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `okokmarketplace_vehicles` (
	`id` INT(255) NOT NULL AUTO_INCREMENT,
	`item_id` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`plate` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`label` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`author_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`author_name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`phone_number` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`price` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`sold` TINYINT(1) NOT NULL DEFAULT '0',
	`start_date` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `ox_doorlock` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`data` LONGTEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `ox_inventory` (
	`owner` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`data` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`lastupdated` TIMESTAMP NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	UNIQUE INDEX `owner` (`owner`, `name`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `players` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`userId` INT(10) UNSIGNED NULL DEFAULT NULL,
	`citizenid` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`cid` INT(11) NULL DEFAULT NULL,
	`license` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`money` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`charinfo` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`job` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`gang` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`position` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`metadata` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`inventory` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`phone_number` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`last_updated` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`last_logged_out` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`citizenid`) USING BTREE,
	INDEX `id` (`id`) USING BTREE,
	INDEX `last_updated` (`last_updated`) USING BTREE,
	INDEX `license` (`license`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=348
;
CREATE TABLE `playerskins` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`citizenid` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`model` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`skin` TEXT NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`active` TINYINT(4) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `citizenid` (`citizenid`) USING BTREE,
	INDEX `active` (`active`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `player_groups` (
	`citizenid` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`group` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`grade` TINYINT(3) UNSIGNED NOT NULL,
	PRIMARY KEY (`citizenid`, `type`, `group`) USING BTREE,
	CONSTRAINT `fk_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `player_houses` (
	`id` INT(255) NOT NULL AUTO_INCREMENT,
	`house` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`identifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`citizenid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`keyholders` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`decorations` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`stash` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`outfit` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`logout` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `house` (`house`) USING BTREE,
	INDEX `citizenid` (`citizenid`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `player_jobs_activity` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`citizenid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`job` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`last_checkin` INT(11) NOT NULL,
	`last_checkout` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE,
	INDEX `last_checkout` (`last_checkout`) USING BTREE,
	INDEX `citizenid_job` (`citizenid`, `job`) USING BTREE,
	CONSTRAINT `player_jobs_activity_ibfk_1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;
CREATE TABLE `player_mails` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`citizenid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`sender` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`subject` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`message` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`read` TINYINT(4) NULL DEFAULT '0',
	`mailid` INT(11) NULL DEFAULT NULL,
	`date` TIMESTAMP NULL DEFAULT current_timestamp(),
	`button` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `citizenid` (`citizenid`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `player_outfits` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`citizenid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`outfitname` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_unicode_ci',
	`model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`props` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`components` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `citizenid_outfitname_model` (`citizenid`, `outfitname`, `model`) USING BTREE,
	INDEX `citizenid` (`citizenid`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=26
;
CREATE TABLE `player_outfit_codes` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`outfitid` INT(11) NOT NULL,
	`code` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK_player_outfit_codes_player_outfits` (`outfitid`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `player_transactions` (
	`id` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`isFrozen` INT(11) NULL DEFAULT '0',
	`transactions` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `player_vehicles` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`license` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`citizenid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`vehicle` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`hash` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`mods` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`plate` VARCHAR(15) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`fakeplate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`garage` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`fuel` INT(11) NULL DEFAULT '100',
	`engine` FLOAT NULL DEFAULT '1000',
	`body` FLOAT NULL DEFAULT '1000',
	`state` INT(11) NULL DEFAULT '1',
	`depotprice` INT(11) NOT NULL DEFAULT '0',
	`drivingdistance` INT(50) NULL DEFAULT NULL,
	`status` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`glovebox` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`trunk` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`parking` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`balance` INT(11) NOT NULL DEFAULT '0',
	`paymentamount` INT(11) NOT NULL DEFAULT '0',
	`paymentsleft` INT(11) NOT NULL DEFAULT '0',
	`financetime` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `plate` (`plate`) USING BTREE,
	INDEX `citizenid` (`citizenid`) USING BTREE,
	CONSTRAINT `player_vehicles_ibfk_1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;
CREATE TABLE `player_vehicles_fuel_type` (
	`plate` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`fuelType` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`plate`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `properties` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`property_name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`coords` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`price` INT(11) NOT NULL DEFAULT '0',
	`owner` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`interior` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`keyholders` LONGTEXT NOT NULL DEFAULT json_object() COLLATE 'utf8mb4_bin',
	`rent_interval` INT(11) NULL DEFAULT NULL,
	`interact_options` LONGTEXT NOT NULL DEFAULT json_object() COLLATE 'utf8mb4_bin',
	`stash_options` LONGTEXT NOT NULL DEFAULT json_object() COLLATE 'utf8mb4_bin',
	`garage` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `owner` (`owner`) USING BTREE,
	CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `players` (`citizenid`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `coords` CHECK (json_valid(`coords`)),
	CONSTRAINT `keyholders` CHECK (json_valid(`keyholders`)),
	CONSTRAINT `interact_options` CHECK (json_valid(`interact_options`)),
	CONSTRAINT `stash_options` CHECK (json_valid(`stash_options`)),
	CONSTRAINT `garage` CHECK (json_valid(`garage`))
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=6
;
CREATE TABLE `properties_decorations` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`property_id` INT(11) NOT NULL,
	`model` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`coords` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`rotation` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `property_id` (`property_id`) USING BTREE,
	CONSTRAINT `properties_decorations_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON UPDATE RESTRICT ON DELETE CASCADE,
	CONSTRAINT `coords` CHECK (json_valid(`coords`)),
	CONSTRAINT `rotation` CHECK (json_valid(`rotation`))
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `ps_banking_accounts` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`balance` BIGINT(20) NOT NULL,
	`holder` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`cardNumber` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`users` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`owner` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`id`) USING BTREE,
	CONSTRAINT `users` CHECK (json_valid(`users`)),
	CONSTRAINT `owner` CHECK (json_valid(`owner`))
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `ps_banking_bills` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`amount` DECIMAL(10,2) NOT NULL,
	`date` DATE NOT NULL,
	`isPaid` TINYINT(1) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `ps_banking_transactions` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`amount` DECIMAL(10,2) NOT NULL,
	`date` DATE NOT NULL,
	`isIncome` TINYINT(1) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `uniq_battlepass` (
	`owner` VARCHAR(72) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`battlepass` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`lastupdated` TIMESTAMP NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	UNIQUE INDEX `owner` (`owner`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `users` (
	`userId` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`license` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`license2` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`fivem` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`discord` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`userId`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `vehicle_financing` (
	`vehicleId` INT(11) NOT NULL,
	`balance` INT(11) NULL DEFAULT NULL,
	`paymentamount` INT(11) NULL DEFAULT NULL,
	`paymentsleft` INT(11) NULL DEFAULT NULL,
	`financetime` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`vehicleId`) USING BTREE,
	CONSTRAINT `vehicleId` FOREIGN KEY (`vehicleId`) REFERENCES `player_vehicles` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `weed_plants` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`property` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`stage` TINYINT(4) NOT NULL DEFAULT '1',
	`sort` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`gender` ENUM('male','female') NOT NULL COLLATE 'utf8mb4_general_ci',
	`food` TINYINT(4) NOT NULL DEFAULT '100',
	`health` TINYINT(4) NOT NULL DEFAULT '100',
	`stageProgress` TINYINT(4) NOT NULL DEFAULT '0',
	`coords` TINYTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `xt_prison` (
	`identifier` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`jailtime` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`identifier`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `xt_prison_items` (
	`owner` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	UNIQUE INDEX `owner` (`owner`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `yecoyz_duty` (
	`index` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`identifier` TINYTEXT NOT NULL COLLATE 'utf8_general_ci',
	`history` LONGTEXT NOT NULL COLLATE 'utf8_general_ci',
	`multiplier` TINYTEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`offDuty` TINYTEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`index`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;
