CREATE DATABASE `guilddb`;

USE `guilddb`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `scholar` (
  `scholar_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `address` varchar(128) NOT NULL,
  `city` varchar(32) NOT NULL,
  `country` varchar(64) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `zipcode` varchar(24) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profilepic` MEDIUMBLOB,
  `register_date` datetime NOT NULL,
  PRIMARY KEY (`scholar_id`),
  UNIQUE KEY `scholar_id_UNIQUE` (`scholar_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;