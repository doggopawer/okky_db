CREATE DATABASE okky;
USE `okky`;

CREATE TABLE `member` (
	`id` VARCHAR(100) NOT NULL,
	`password` VARCHAR(100) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `nick` VARCHAR(100) NOT NULL,
    `marketing_yn` BOOLEAN NOT NULL,
    `activity_score` INT NOT NULL,
    `admin_yn` BOOLEAN NOT NULL,
    `profile_url` VARCHAR(1000) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY (`id`,`email`,`nick`)
);

CREATE TABLE `big_menu` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `member_id` VARCHAR(100),
    FOREIGN KEY(`member_id`) REFERENCES `member` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`, `name`)
);

CREATE TABLE `small_menu` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `member_id` VARCHAR(100),
    `big_menu_id` INT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`big_menu_id`) REFERENCES `big_menu` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`, `name`)
);

CREATE TABLE `writing` (
    `id` BIGINT AUTO_INCREMENT,
    `title` VARCHAR(1000) NOT NULL,
    `description` VARCHAR(10000) NOT NULL,
    `views` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_yn` BOOLEAN NOT NULL,
    `member_id` VARCHAR(100),
    `small_menu_id` INT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`small_menu_id`) REFERENCES `small_menu` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);
CREATE TABLE `big_comment` (
    `id` INT AUTO_INCREMENT,
    `description` VARCHAR(10000) NOT NULL,
    `adopt_yn` BOOLEAN NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_yn` BOOLEAN NOT NULL,
    `member_id` VARCHAR(100),
    `writing_id` BIGINT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`writing_id`) REFERENCES `writing` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);
CREATE TABLE `small_comment` (
    `id` INT AUTO_INCREMENT,
    `description` VARCHAR(10000) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_yn` BOOLEAN NOT NULL,
    `member_id` VARCHAR(100),
    `big_comment_id` INT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`big_comment_id`) REFERENCES `big_comment` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);

CREATE TABLE `writing_like` (
    `id` INT AUTO_INCREMENT,
    `like_type` VARCHAR(10) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `member_id` VARCHAR(100),
    `writing_id` BIGINT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`writing_id`) REFERENCES `writing` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);
CREATE TABLE `big_comment_like` (
    `id` INT AUTO_INCREMENT,
    `like_type` VARCHAR(10) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `member_id` VARCHAR(100),
    `big_comment_id` INT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`big_comment_id`) REFERENCES `big_comment` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);
CREATE TABLE `small_comment_like` (
    `id` INT AUTO_INCREMENT,
    `like_type` VARCHAR(10) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `member_id` VARCHAR(100),
    `small_comment_id` INT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`small_comment_id`) REFERENCES `small_comment` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);
CREATE TABLE `member_tag` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `member_id` VARCHAR(100),
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);
CREATE TABLE `writing_tag` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `writing_id` BIGINT,
    FOREIGN KEY (`writing_id`) REFERENCES `writing` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`,`name`)
);
CREATE TABLE `scrap` (
    `id` INT AUTO_INCREMENT,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `member_id` VARCHAR(100),
    `writing_id` BIGINT,
    FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    FOREIGN KEY (`writing_id`) REFERENCES `writing` (`id`),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`id`)
);
