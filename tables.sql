SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


-- --------------------------------------------------------

--
-- Структура таблицы `actmail`
--

CREATE TABLE IF NOT EXISTS `actmail` (
  `login` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `code` varchar(20) character set utf8 collate utf8_unicode_ci NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `anket`
--

CREATE TABLE IF NOT EXISTS `anket` (
  `id` int(10) NOT NULL auto_increment,
  `login` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `pass` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `lastdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `online` smallint(1) NOT NULL default '0',
  `room` int(5) default NULL,
  `photo` int(11) NOT NULL default '0',
  `defphoto` int(11) NOT NULL default '1',
  `loadcode` varchar(8) NOT NULL,
  `regdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `loginmask` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `emailactive` smallint(1) NOT NULL default '0',
  `mesmail` smallint(1) NOT NULL default '0',
  `caponpage` int(10) default NULL,
  `mesonpage` int(10) default NULL,
  `autoupdate` varchar(10) character set utf8 collate utf8_bin default NULL,
  `best` tinyint(1) NOT NULL default '0',
  `bestdate` datetime default NULL,
  `ip` varchar(20) character set utf8 collate utf8_bin default NULL,
  `ua` varchar(100) character set utf8 collate utf8_bin default NULL,
  `banned` tinyint(1) NOT NULL default '0',
  `bandate` datetime default NULL,
  `email` varchar(100) character set utf8 collate utf8_bin default NULL,
  `icq` varchar(100) character set utf8 collate utf8_bin default NULL,
  `sex` varchar(10) character set utf8 collate utf8_bin default NULL,
  `so` char(1) character set utf8 collate utf8_bin default NULL,
  `name` varchar(70) character set utf8 collate utf8_bin default NULL,
  `vozrast` varchar(2) character set utf8 collate utf8_bin default NULL,
  `rost` varchar(10) character set utf8 collate utf8_bin default NULL,
  `zodiak` varchar(50) character set utf8 collate utf8_bin default NULL,
  `glaza` varchar(50) character set utf8 collate utf8_bin default NULL,
  `tel` varchar(30) character set utf8 collate utf8_bin default NULL,
  `site` varchar(100) character set utf8 collate utf8_bin default NULL,
  `task` varchar(255) character set utf8 collate utf8_bin default NULL,
  `info` text character set utf8 collate utf8_bin,
  `region` int(5) NOT NULL default '0',
  `rating` int(11) NOT NULL default '0',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `antirep`
--

CREATE TABLE IF NOT EXISTS `antirep` (
  `repcode` varchar(5) character set utf8 collate utf8_bin NOT NULL default '',
  `lastdate` datetime NOT NULL default '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ban`
--

CREATE TABLE IF NOT EXISTS `ban` (
  `ip` varchar(20) character set utf8 collate utf8_bin NOT NULL default '',
  `ua` varchar(100) character set utf8 collate utf8_bin NOT NULL default '',
  `bandate` datetime NOT NULL default '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(10) NOT NULL auto_increment,
  `fromn` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `body` text character set utf8 collate utf8_bin NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `r` int(5) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fototop`
--

CREATE TABLE IF NOT EXISTS `fototop` (
  `aid` int(10) NOT NULL,
  `fid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `alogin` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `flogin` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ignor`
--

CREATE TABLE IF NOT EXISTS `ignor` (
  `alogin` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `ignlogin` varchar(50) character set utf8 collate utf8_bin NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) NOT NULL auto_increment,
  `komu` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `ot` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `body` text character set utf8 collate utf8_bin,
  `new` smallint(1) NOT NULL default '1',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(5) NOT NULL auto_increment,
  `title` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
