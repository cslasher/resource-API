CREATE TABLE IF NOT EXISTS `keanux_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `image_expand` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`(255),`user_id`,`create_time`),
  KEY `unique_id` (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `keanux_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `image_expand` tinyint(1) NOT NULL,
  `recommends` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`(255),`user_id`,`create_time`),
  KEY `unique_id` (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `keanux_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `read_only` tinyint(1) NOT NULL,
  `signin_time` int(11) NOT NULL,
  `facebook_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `keanux_user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bio` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `cover` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `create_time` (`nickname`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

INSERT INTO `keanux_user` (`id`, `password`, `create_time`, `username`, `facebook_account`, `active`, `read_only`, `signin_time`, `facebook_id`) VALUES
(1, '', 1376926421, 'keanyc', '', 1, 0, 1488508387, 0);

INSERT INTO `keanux_user_profile` (`id`, `email`, `nickname`, `image`, `bio`, `user_id`, `update_time`, `cover`) VALUES
(1, 'keanyc@gmail.com', 'KeaNy', '', '', 1, 0, '');

INSERT INTO `keanux_draft` (`id`, `unique_id`, `title`, `subtitle`, `content`, `user_id`, `create_time`, `update_time`, `image`, `image_expand`) VALUES
(1, '5380d22d03166', 'Hello World', '', '<div>There is no spoon</div>', 1, 1400951341, 0, '', 1);

INSERT INTO `keanux_post` (`id`, `unique_id`, `title`, `subtitle`, `content`, `user_id`, `create_time`, `update_time`, `image`, `image_expand`, `recommends`) VALUES
(1, '5395d13a8bd08', 'Post Title', 'Subtitle', '<div>Content</div>', 1, 1402327357, 1402327357, '', 0, 0);
