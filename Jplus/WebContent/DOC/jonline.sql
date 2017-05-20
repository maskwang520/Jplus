# Host: localhost  (Version: 5.5.40)
# Date: 2015-10-31 12:11:20
# Generator: MySQL-Front 5.3  (Build 4.13)

/*!40101 SET NAMES utf8 */;

#
# Source for table "j_accesssum"
#

DROP TABLE IF EXISTS `j_accesssum`;
CREATE TABLE `j_accesssum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `as_name` varchar(30) NOT NULL DEFAULT '',
  `as_sum` int(11) NOT NULL DEFAULT '0' COMMENT '动态访问量',
  `as_max` int(11) NOT NULL DEFAULT '0' COMMENT '峰值记录',
  `as_maxdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '峰值出现日期',
  `as_description` varchar(255) DEFAULT NULL COMMENT '描述，保留，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "j_accesssum"
#

INSERT INTO `j_accesssum` VALUES (1,'历史访问量',608,608,'2015-09-23 19:09:22','hehe'),(2,'今年总浏览量',407,407,'2015-09-23 19:09:22','hehe'),(3,'本月总流量',407,407,'2015-09-23 19:09:22','hehe'),(4,'本周总流量',407,407,'2015-09-23 19:09:22','hehe'),(5,'今天浏览量',407,407,'2015-09-23 19:09:22','hehe'),(6,'去年浏览量',300,300,'2015-09-23 19:09:22','hehe'),(7,'上月流量',300,300,'2015-09-23 19:09:22','hehe'),(8,'上周流量',300,300,'2015-09-23 19:09:22','hehe'),(9,'昨天浏览量',300,300,'2015-09-23 19:09:22','hehe'),(10,'前天浏览量',300,300,'2015-09-23 19:09:22','hehe');

#
# Source for table "j_bbsrecommend"
#

DROP TABLE IF EXISTS `j_bbsrecommend`;
CREATE TABLE `j_bbsrecommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `br_name` varchar(80) NOT NULL DEFAULT '合作单位' COMMENT '版块名字，显示在页面上',
  `br_title` varchar(80) DEFAULT '合作单位' COMMENT '版块名称，鼠标移上去后自动显示的内容',
  `br_url` varchar(255) NOT NULL DEFAULT 'http://www.jplus.online' COMMENT '版块url，跳转地址',
  `br_purl` varchar(255) NOT NULL DEFAULT '' COMMENT '版块图标地址',
  `br_descriptions` varchar(255) DEFAULT '暂无描述' COMMENT '描述，保留，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='合作单位';

#
# Data for table "j_bbsrecommend"
#

INSERT INTO `j_bbsrecommend` VALUES (1,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_1_gray.png@/style/assets/img/clients/client_1.png',''),(2,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_2_gray.png@/style/assets/img/clients/client_2.png',''),(3,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_3_gray.png@/style/assets/img/clients/client_3.png',NULL),(4,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_4_gray.png@/style/assets/img/clients/client_4.png',NULL),(5,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_5_gray.png@/style/assets/img/clients/client_5.png',NULL),(6,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_6_gray.png@/style/assets/img/clients/client_6.png',NULL),(7,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_7_gray.png@/style/assets/img/clients/client_7.png',NULL),(8,'合作单位','合作单位','http://www.jplus.online','/style/assets/img/clients/client_8_gray.png@/style/assets/img/clients/client_8.png',NULL);

#
# Source for table "j_closeweb"
#

DROP TABLE IF EXISTS `j_closeweb`;
CREATE TABLE `j_closeweb` (
  `id` int(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为开，1为关，',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "j_closeweb"
#

INSERT INTO `j_closeweb` VALUES (1,0);

#
# Source for table "j_course"
#

DROP TABLE IF EXISTS `j_course`;
CREATE TABLE `j_course` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `atime` date DEFAULT NULL COMMENT '0000-00-00',
  `info` varchar(255) DEFAULT NULL,
  `classre` varchar(200) DEFAULT NULL,
  `videoid` varchar(200) DEFAULT NULL,
  `courseid` varchar(200) DEFAULT NULL,
  `clicknum` int(255) DEFAULT NULL COMMENT '0',
  `keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "j_course"
#

INSERT INTO `j_course` VALUES (9,'px/No-1.话说开发环境以及培训相关说明.jpg','No-1.话说开发环境以及培训相关说明','曹辉','2015-10-07','学习JavaWeb前的准备工作',NULL,'px','No-1.话说开发环境以及培训相关说明',16,''),(12,'qd/HTML.jpg','HTML','','2015-10-07','s',NULL,'qd','HTML',19,'s'),(13,'ht/C运算符.jpg','C运算符','','2015-10-07','C运算符',NULL,'ht','C运算符',6,'C运算符'),(14,'px/No-2.漫谈网页设计之骨架_HTML4.01HTML5.jpg','No-2.漫谈网页设计之骨架_HTML4.01HTML5','曹辉','2015-10-07','No-2.漫谈网页设计之骨架_HTML4.01HTML5',NULL,'px','No-2.漫谈网页设计之骨架_HTML4.01HTML5',12,'No-2.漫谈网页设计之骨架_HTML4.01HTML5'),(15,'px/JQueryUI.jpg','JQueryUI','何焕春','2015-10-07','',NULL,'px','JQueryUI',17,''),(16,'qd/bootstrap教程.jpg','bootstrap教程','慕课网','2015-10-07','',NULL,'qd','bootstrap教程',31,'');

#
# Source for table "j_friendlink"
#

DROP TABLE IF EXISTS `j_friendlink`;
CREATE TABLE `j_friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fl_name` varchar(80) NOT NULL DEFAULT '' COMMENT '友链名称',
  `fl_url` varchar(255) NOT NULL DEFAULT '' COMMENT '友链url',
  `fl_descriptions` varchar(255) DEFAULT NULL COMMENT '描述，保留，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "j_friendlink"
#

INSERT INTO `j_friendlink` VALUES (1,'栈网科技官网','http://www.zhanwkj.com/','当青春遇上互联网，能否点燃你的梦'),(2,'JavaWeb开发者社区','http://bbs.jplus.online','JavaWeb开发者的家园'),(3,' 湖北师范大学OJ编程网站','http://www.cs.hbnu.edu.cn/hsoj','湖师人的线上编程家园'),(4,'Think实验室官网','javascript:alert(\'此链接通道暂未开通，敬请期待！\');','栈网科技旗下PHP开发实验室'),(5,'湖北师范大学计算机科学与技术学院官网','http://www.cs.hbnu.edu.cn','湖北师范大学计算机科学与技术学院 Jplus实验室发源地');

#
# Source for table "j_identify"
#

DROP TABLE IF EXISTS `j_identify`;
CREATE TABLE `j_identify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iname` varchar(25) NOT NULL DEFAULT '' COMMENT '成员姓名',
  `certnum` varchar(30) NOT NULL DEFAULT '' COMMENT '身份证件号',
  `sessions` int(10) NOT NULL DEFAULT '0' COMMENT '第几届',
  `positions` varchar(100) DEFAULT '''实验室成员''' COMMENT '职位',
  `descriptions` varchar(255) DEFAULT NULL COMMENT '描述，保留字段，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "j_identify"
#

INSERT INTO `j_identify` VALUES (1,'曹辉','420281199402084234',4,'总负责人','haha'),(2,'樊志军','422301199403200036',4,'算法负责人','heihei'),(3,'胡开才','420702199401017373',4,'管理负责人','哎呀不错呦'),(4,'汪志峰','422325199307224215',4,'实验室成员','wuwu'),(5,'hukaicai','420702199401017373',5,'haha','dasdas'),(8,'hehe ','420702199401017371',4,'无','淡定'),(10,'对对对','400702199401017373',9,'电风扇','发');

#
# Source for table "j_jplusdesc"
#

DROP TABLE IF EXISTS `j_jplusdesc`;
CREATE TABLE `j_jplusdesc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jd_title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `jd_content` text NOT NULL COMMENT '内容',
  `jd_reltime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `jd_author` varchar(30) NOT NULL DEFAULT '' COMMENT '发布作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "j_jplusdesc"
#

INSERT INTO `j_jplusdesc` VALUES (1,'测试数据dd','01010101010','2015-07-17 17:22:44','12');

#
# Source for table "j_navurl"
#

DROP TABLE IF EXISTS `j_navurl`;
CREATE TABLE `j_navurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(80) NOT NULL DEFAULT '' COMMENT '导航栏目名字，显示在页面上的文字',
  `n_title` varchar(80) NOT NULL DEFAULT '' COMMENT '导航名称，鼠标移上去后自动显示的内容',
  `n_url` varchar(255) NOT NULL DEFAULT '' COMMENT '导航url，点击之后跳转的地址',
  `n_descriptions` varchar(255) DEFAULT NULL COMMENT '描述，保留字段，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='合作案例';

#
# Data for table "j_navurl"
#

INSERT INTO `j_navurl` VALUES (1,'Jplus实验室官网','Jplus实验室官网','/style/images/images_al/jplusonline.png@http://www.jplus.online','Jplus实验室官网'),(2,'美景','梁子湖','/temp/test.jpg@http://www.baidu.com','heihei '),(4,'11','Jplus实验室官网','/style/images/images_al/jplusonline.png@http://www.jplus.online',NULL),(5,'22','Jplus实验室官网','/style/images/images_al/jplusonline.png@http://www.jplus.online',NULL);

#
# Source for table "j_netpurl"
#

DROP TABLE IF EXISTS `j_netpurl`;
CREATE TABLE `j_netpurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `np_title` varchar(80) NOT NULL DEFAULT '' COMMENT '图片名称，鼠标移上去自动显示的title',
  `np_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片url',
  `np_descriptions` varchar(255) DEFAULT NULL COMMENT '描述，保留，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "j_netpurl"
#

INSERT INTO `j_netpurl` VALUES (1,'湖师热人自己的网站','/style/image/qinghua.jpg','小图片');

#
# Source for table "j_resclass"
#

DROP TABLE IF EXISTS `j_resclass`;
CREATE TABLE `j_resclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resname` varchar(50) NOT NULL DEFAULT '' COMMENT '资源类名称',
  `isbdydown` int(1) NOT NULL DEFAULT '0' COMMENT '是否允许百度云下载    1 是 0 否',
  `is360down` int(1) NOT NULL DEFAULT '0' COMMENT '是否允许360下载       1 是 0 否',
  `islocationdown` int(1) NOT NULL DEFAULT '0' COMMENT '是否允许本地下载      1 是 0 否',
  `resdescription` varchar(80) NOT NULL DEFAULT '' COMMENT '资源类描述',
  `respurl` varchar(255) NOT NULL DEFAULT '' COMMENT '资源类图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "j_resclass"
#

INSERT INTO `j_resclass` VALUES (1,'Java视频教程',1,0,0,'',''),(2,'java文本',1,1,1,'这是极好的资料，大家多下载','/a/a'),(3,'Tomcat视频教程',1,1,0,'','aa'),(4,'Web视频教程',1,1,0,'','aaa'),(5,'web',1,1,1,'很好的资料','/a/a/a/a/a'),(6,'黑客防线工具资料',1,1,1,'','aa');

#
# Source for table "j_section"
#

DROP TABLE IF EXISTS `j_section`;
CREATE TABLE `j_section` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `courseid` varchar(50) DEFAULT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "j_section"
#

INSERT INTO `j_section` VALUES (1,'前端开发','qd','html'),(2,'后台开发','ht','java'),(3,'实用工具','gj','photoshop'),(4,'算法','sf','c'),(5,'Jplus视频','px','Jplus实验室'),(6,NULL,NULL,'Python'),(7,NULL,NULL,'C++');

#
# Source for table "j_toolofficerecommend"
#

DROP TABLE IF EXISTS `j_toolofficerecommend`;
CREATE TABLE `j_toolofficerecommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tor_name` varchar(80) NOT NULL DEFAULT '' COMMENT '工具名字，显示在页面上',
  `tor_title` varchar(80) NOT NULL DEFAULT '' COMMENT '工具名称，鼠标移上去后自动显示的内容',
  `tor_url` varchar(255) NOT NULL DEFAULT '' COMMENT '工具url，点击之后跳转的地址',
  `tor_purl` varchar(255) NOT NULL DEFAULT '' COMMENT '工具图标地址',
  `tor_descriptions` varchar(255) DEFAULT NULL COMMENT '描述，保留，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "j_toolofficerecommend"
#

INSERT INTO `j_toolofficerecommend` VALUES (1,'das','das','ddasd','dasd','adsadas');

#
# Source for table "j_userlevel"
#

DROP TABLE IF EXISTS `j_userlevel`;
CREATE TABLE `j_userlevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `levels` int(11) NOT NULL DEFAULT '0' COMMENT '用户级别',
  `minscores` int(10) NOT NULL DEFAULT '0' COMMENT '新等级最低积分',
  `maxscores` int(10) NOT NULL DEFAULT '0' COMMENT '新等级最高积分',
  `descriptions` varchar(200) NOT NULL DEFAULT '' COMMENT '等级描述',
  `levelpurl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "j_userlevel"
#

INSERT INTO `j_userlevel` VALUES (1,1,0,40,'天生我才必有用',''),(2,2,41,70,'博观而约取,厚积而薄发',''),(3,3,71,110,'世事洞明皆学问',''),(4,4,111,160,'伯仲之间见伊吕，指挥若定失萧曹',''),(5,5,161,220,'业精于勤，荒于嘻',''),(6,6,221,290,'天才在于积累  ',''),(7,7,291,370,'学问勤中得，萤窗万卷书     ',''),(8,8,371,460,'逆水行舟，不进则退 ',''),(9,9,461,560,'它山之石,可以攻玉   ',''),(10,10,561,670,'运筹帷幄之中，决胜千里之外','');

#
# Source for table "j_user"
#

DROP TABLE IF EXISTS `j_user`;
CREATE TABLE `j_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(20) NOT NULL DEFAULT '' COMMENT '登录密码',
  `realname` varchar(25) DEFAULT NULL COMMENT '真实姓名',
  `certsnum` varchar(25) DEFAULT NULL COMMENT '证件号码',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `sex` int(1) DEFAULT '2' COMMENT '性别 0男 1女 2未知',
  `regtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `birthday` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `address` varchar(80) DEFAULT NULL COMMENT '地址',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `limits` int(1) DEFAULT '0' COMMENT '权限',
  `identifys` int(11) DEFAULT '0' COMMENT '认证类型',
  `userlevel_id` int(11) DEFAULT '1',
  `scores` int(11) DEFAULT '20' COMMENT '用户积分',
  PRIMARY KEY (`id`),
  KEY `user_level_id_fk` (`userlevel_id`),
  CONSTRAINT `user_level_id_fk` FOREIGN KEY (`userlevel_id`) REFERENCES `j_userlevel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "j_user"
#

INSERT INTO `j_user` VALUES (1,'jplus','000','Jplus官方','420702199401017373',1,0,'2015-08-29 10:39:56','940388651','13117011726','2015-08-04','无','无','9403885651@qq.com',5,0,5,30),(12,'chitry','chitry','曹辉','420702199401017373',55,0,'2015-07-22 17:07:43','940','110','2015-10-08','','','65412',3,1,5,0),(13,'fly','fly','樊志军','',NULL,1,'2015-07-22 17:09:14','','','','','','110',3,4,1,25),(14,'hkc','123','胡开才','42070219940101737X',22,0,'2015-07-22 17:09:17','940388651','13117011726','1994-02-05','16535爱爱爱','六栋3181','910388651@qq.com',3,4,2,50),(15,'wzf','wzf','汪志峰','420281199402084230',21,0,'2015-08-30 17:40:02','940388651','13117011726','2015-09-08','java','6栋','940388651@qq.com1',2,4,2,50),(21,'zxw','000','张行文','420702199401017373',45,1,'2015-08-11 10:41:04','ds','13117011726','2015-09-09','111','111','940388651@qq.com',4,-1,2,20),(22,'123456','123456',NULL,NULL,NULL,NULL,'2015-10-18 14:47:29',NULL,NULL,NULL,NULL,NULL,'1747128171@qq.com',0,0,1,20),(23,'111','123456',NULL,NULL,NULL,NULL,'2015-10-25 15:27:06',NULL,NULL,NULL,NULL,NULL,'1747128171@qq.com',0,0,1,20);

#
# Source for table "j_crowdfunding"
#

DROP TABLE IF EXISTS `j_crowdfunding`;
CREATE TABLE `j_crowdfunding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_type` int(1) NOT NULL DEFAULT '0',
  `cd_name` varchar(50) NOT NULL DEFAULT '',
  `cd_description` text NOT NULL,
  `cd_content` text NOT NULL,
  `cd_championprize` varchar(80) NOT NULL DEFAULT '',
  `cd_secondprize` varchar(80) NOT NULL DEFAULT '',
  `cd_thirdprize` varchar(80) NOT NULL DEFAULT '',
  `cd_sponsor_id` int(11) NOT NULL,
  `cd_dotime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cd_starttime` datetime DEFAULT NULL,
  `cd_endtime` datetime DEFAULT NULL,
  `cd_champion_id` int(11) NOT NULL,
  `cd_second_id` int(11) NOT NULL,
  `cd_third_id` int(11) NOT NULL,
  `cd_enddescr` text,
  `cd_state` int(1) NOT NULL DEFAULT '0',
  `cd_redonum` int(10) NOT NULL DEFAULT '0',
  `cd_discuss` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cd_user_sponsor_id_fk` (`cd_sponsor_id`),
  KEY `cd_user_champion_id_fk` (`cd_champion_id`),
  KEY `cd_user_second_id_fk` (`cd_second_id`),
  KEY `cd_user_third_id_fk` (`cd_third_id`),
  CONSTRAINT `cd_user_champion_id_fk` FOREIGN KEY (`cd_champion_id`) REFERENCES `j_user` (`id`),
  CONSTRAINT `cd_user_second_id_fk` FOREIGN KEY (`cd_second_id`) REFERENCES `j_user` (`id`),
  CONSTRAINT `cd_user_sponsor_id_fk` FOREIGN KEY (`cd_sponsor_id`) REFERENCES `j_user` (`id`),
  CONSTRAINT `cd_user_third_id_fk` FOREIGN KEY (`cd_third_id`) REFERENCES `j_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "j_crowdfunding"
#


#
# Source for table "j_jnotice"
#

DROP TABLE IF EXISTS `j_jnotice`;
CREATE TABLE `j_jnotice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(50) NOT NULL DEFAULT '' COMMENT '公告标题',
  `notice_content` text NOT NULL COMMENT '公告内容',
  `notice_reltime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `notice_author_id` int(11) NOT NULL COMMENT '公告发布作者',
  PRIMARY KEY (`id`),
  KEY `notice_user_author_id_fk` (`notice_author_id`),
  CONSTRAINT `notice_user_author_id_fk` FOREIGN KEY (`notice_author_id`) REFERENCES `j_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "j_jnotice"
#

INSERT INTO `j_jnotice` VALUES (5,'dasd','ddd','2015-09-10 17:21:50',14),(6,'ggg','ggg','2015-09-15 17:21:47',12),(7,'cf','vvvv','2015-09-15 17:21:43',12),(8,'大家早上好','发射点发射得分','2015-09-10 09:03:11',14),(9,'大苏打','点撒打算','2015-09-19 09:29:32',14),(10,'大苏打','阿斯达实打实 的aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2015-09-19 09:29:48',14),(11,'点撒撒打算打','大苏打','2015-10-02 09:29:58',14);

#
# Source for table "j_jtask"
#

DROP TABLE IF EXISTS `j_jtask`;
CREATE TABLE `j_jtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_title` varchar(50) NOT NULL DEFAULT '' COMMENT '任务标题',
  `task_description` varchar(50) NOT NULL DEFAULT '' COMMENT '任务描述',
  `task_content` text NOT NULL COMMENT '任务内容',
  `task_reltime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `task_author_id` int(11) NOT NULL COMMENT '任务发布作者',
  PRIMARY KEY (`id`),
  KEY `task_user_author_id_fk` (`task_author_id`),
  CONSTRAINT `task_user_author_id_fk` FOREIGN KEY (`task_author_id`) REFERENCES `j_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "j_jtask"
#

INSERT INTO `j_jtask` VALUES (1,'大家好','真的好','你好','2015-09-17 10:07:55',12),(2,'呵呵','呵呵','哈哈','2015-09-17 10:09:08',14);

#
# Source for table "j_member"
#

DROP TABLE IF EXISTS `j_member`;
CREATE TABLE `j_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purl` varchar(200) NOT NULL DEFAULT '' COMMENT '照片地址',
  `descriptions` varchar(50) NOT NULL DEFAULT '' COMMENT '成员简述',
  `cotents` varchar(255) NOT NULL DEFAULT '' COMMENT '简介内容',
  `nowaddress` varchar(50) DEFAULT NULL COMMENT '现今所在地',
  `nowwork` varchar(50) DEFAULT NULL COMMENT '现今工作',
  `myplan` varchar(100) DEFAULT NULL COMMENT '未来规划',
  `knowsphere` varchar(100) DEFAULT NULL COMMENT '熟悉的领域',
  `skills` varchar(50) DEFAULT NULL COMMENT '专业技能',
  `educations` varchar(50) DEFAULT NULL COMMENT '教育背景',
  `workbk` varchar(50) DEFAULT NULL COMMENT '职业经历',
  `suggestions` varchar(100) DEFAULT NULL COMMENT '对师弟师妹的建议',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '常用邮箱号',
  `weixinnum` varchar(50) DEFAULT NULL COMMENT '微信号',
  `blogs` varchar(255) DEFAULT NULL COMMENT '博客地址',
  `viewtype` int(1) NOT NULL DEFAULT '0' COMMENT '敏感信息可见权限设置',
  `pwurl` varchar(80) DEFAULT NULL COMMENT '个人网站地址',
  `indentifytime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '认证时间',
  `user_id` int(11) NOT NULL,
  `identify_id` int(11) NOT NULL,
  `mp3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_user_id_fk` (`user_id`),
  KEY `member_identify_id_fk` (`identify_id`),
  CONSTRAINT `member_identify_id_fk` FOREIGN KEY (`identify_id`) REFERENCES `j_identify` (`id`),
  CONSTRAINT `member_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `j_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "j_member"
#

INSERT INTO `j_member` VALUES (1,'/style/images/images_purl/1.jpg','努力就会成功','我是一名java开发者','黄石d','学dd生','当一名java工程师','javaweb','javaweb','本科','不告诉你','少年奋斗吧','940388651','13117011726','940388651@qq.com','爱我家曲','http://www.baidu.com',1,'不告诉你','2015-08-05 14:36:52',15,4,NULL),(2,'/style/images/images_purl/2.jpg','bhahaha','dasd','花岗','学生','哈哈','大苏打','大苏打','大','暗淡','打扫','231','13123312312','312312@qq.com','阿斯达','www.myblog.com',1,'www.person.com','2015-09-09 17:19:39',14,3,NULL);

#
# Source for table "j_recruit"
#

DROP TABLE IF EXISTS `j_recruit`;
CREATE TABLE `j_recruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `re_title` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
  `re_content` text NOT NULL COMMENT '详细内容',
  `re_description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `re_provide` varchar(255) NOT NULL DEFAULT '' COMMENT '职位提供方',
  `re_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `re_enddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截取时间',
  `re_author_id` int(11) NOT NULL COMMENT '发布者',
  `re_told` varchar(255) NOT NULL DEFAULT '' COMMENT '发布者的话',
  `re_prize` int(11) DEFAULT NULL COMMENT '薪资',
  PRIMARY KEY (`id`),
  KEY `recruit_user_author_fk` (`re_author_id`),
  CONSTRAINT `recruit_user_author_fk` FOREIGN KEY (`re_author_id`) REFERENCES `j_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "j_recruit"
#


#
# Source for table "j_res"
#

DROP TABLE IF EXISTS `j_res`;
CREATE TABLE `j_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resname` varchar(50) NOT NULL DEFAULT '' COMMENT '资源名称',
  `resdescription` varchar(250) NOT NULL DEFAULT '' COMMENT '资源描述',
  `res_bdypath` varchar(255) DEFAULT NULL COMMENT '百度云网盘地址',
  `res_bdypassword` varchar(20) DEFAULT NULL COMMENT '百度云提取码',
  `res_360path` varchar(255) DEFAULT NULL COMMENT '360云盘地址',
  `res_360password` varchar(20) DEFAULT NULL COMMENT '360云盘提取码',
  `res_locationpath` varchar(255) DEFAULT NULL COMMENT '本地下载地址',
  `downloadnum` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `downloadscore` int(11) NOT NULL DEFAULT '0' COMMENT '下载所需积分',
  `resdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '资源上传时间',
  `resstate` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `resdiscuss` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `resclass_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '资源作者',
  `userzz` varchar(100) DEFAULT NULL,
  `resclassds` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_class_id_fk` (`resclass_id`),
  KEY `res_user_id_fk` (`user_id`),
  CONSTRAINT `res_class_id_fk` FOREIGN KEY (`resclass_id`) REFERENCES `j_resclass` (`id`),
  CONSTRAINT `res_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `j_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

#
# Data for table "j_res"
#

INSERT INTO `j_res` VALUES (1,'马世兵的视频','hao','/a/a','iugui','/a/a/','dasdas','/a/a/',100,2,'2015-09-09 18:19:38',2,200,1,14,'13','Java视频教程'),(7,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(8,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(9,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(10,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(11,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(12,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(20,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(21,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(22,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(23,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(24,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(25,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(26,'12313\tsddf\t010\tdasd\tdas\tdas\tdas\tdsad\t1\t1\t2015-09-0','1231',NULL,NULL,'123','123',NULL,0,32,'2015-10-07 20:23:26',0,0,1,13,NULL,'Java视频教程'),(27,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(28,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(32,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(33,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(34,'sddf','010','dasd','das','das','das','dsad',1,1,'2015-09-08 18:49:29',2,111,1,14,'13','Java视频教程'),(35,'sddf','010','dasd','das','das','das','dsad',2,1,'2015-09-08 18:49:29',2,112,1,14,'13','Java视频教程');

#
# Source for table "j_usermsg"
#

DROP TABLE IF EXISTS `j_usermsg`;
CREATE TABLE `j_usermsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgcontent` varchar(255) NOT NULL DEFAULT '' COMMENT '信息内容',
  `readsign` int(1) NOT NULL DEFAULT '0' COMMENT '已读标记',
  `gettime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '接收日期',
  `sendauthor` varchar(50) NOT NULL DEFAULT '' COMMENT '发送方',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msg_user_id_fk` (`user_id`),
  CONSTRAINT `msg_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `j_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "j_usermsg"
#

INSERT INTO `j_usermsg` VALUES (1,'dasdas',1,'2015-08-13 16:13:31','胡开才',14);

#
# Source for table "j_vediorecommend"
#

DROP TABLE IF EXISTS `j_vediorecommend`;
CREATE TABLE `j_vediorecommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_name` varchar(80) NOT NULL DEFAULT '' COMMENT '专辑名字，显示在页面上',
  `vr_title` varchar(80) NOT NULL DEFAULT '' COMMENT '专辑名称，鼠标移上去后自动显示的内容',
  `vr_url` varchar(255) NOT NULL DEFAULT '' COMMENT '专辑url，跳转地址',
  `vr_purl` varchar(255) NOT NULL DEFAULT '' COMMENT '专辑图标地址',
  `vr_descriptions` varchar(255) DEFAULT NULL COMMENT '描述，保留，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "j_vediorecommend"
#

INSERT INTO `j_vediorecommend` VALUES (1,'jplus官方视频','jQuery','http://www.jplus.com','/iamge/1.jpg','不告诉你');

#
# Source for table "j_videos"
#

DROP TABLE IF EXISTS `j_videos`;
CREATE TABLE `j_videos` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `courseid` varchar(500) DEFAULT NULL,
  `videosid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

#
# Data for table "j_videos"
#

INSERT INTO `j_videos` VALUES (5,'No-1.话说开发环境以及培训相关说明','01.课程简介说明(如何查看JDK版本号).mp4','01.课程简介说明(如何查看JDK版本号)',NULL),(6,'No-1.话说开发环境以及培训相关说明','02.从胖瘦客户端到Web三时代.mp4','02.从胖瘦客户端到Web三时代',NULL),(7,'No-1.话说开发环境以及培训相关说明','03.建站三种技术以及前台技术介绍.mp4','03.建站三种技术以及前台技术介绍',NULL),(8,'No-1.话说开发环境以及培训相关说明','04.三种建站方式开发环境对比.mp4','04.三种建站方式开发环境对比',NULL),(9,'No-1.话说开发环境以及培训相关说明','05.JSP建站开发环境搭建详细要求.mp4','05.JSP建站开发环境搭建详细要求',NULL),(36,'HTML','1.mp4','1',NULL),(37,'C运算符','初学者答疑.mp4','初学者答疑',NULL),(38,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','01.Html概述以及编辑器介绍.mp4','01.Html概述以及编辑器介绍',NULL),(39,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','02.如何将网上看到的页面Down下来.mp4','02.如何将网上看到的页面Down下来',NULL),(40,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','03.编写第一个Html程序Hello_World.mp4','03.编写第一个Html程序Hello_World',NULL),(41,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','04.Html_API文档使用介绍.mp4','04.Html_API文档使用介绍',NULL),(42,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','05.一个例子理解Html标签和它的属性用法.mp4','05.一个例子理解Html标签和它的属性用法',NULL),(43,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','06.Html基本标记的使用.mp4','06.Html基本标记的使用',NULL),(44,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','07.Html表格标签的使用.mp4','07.Html表格标签的使用',NULL),(45,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','08.Html表单标记的使用.mp4','08.Html表单标记的使用',NULL),(46,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','09.Html内联框架frameset的使用.mp4','09.Html内联框架frameset的使用',NULL),(47,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','10.Html的版本声明格式问题.mp4','10.Html的版本声明格式问题',NULL),(48,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','11.hr标签实现竖直线条.mp4','11.hr标签实现竖直线条',NULL),(49,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','12.Html5简介.mp4','12.Html5简介',NULL),(50,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','13.Html5跨浏览器兼容性问题.mp4','13.Html5跨浏览器兼容性问题',NULL),(51,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','14.Html5新增标签以及废除的标签属性介绍.mp4','14.Html5新增标签以及废除的标签属性介绍',NULL),(52,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','15.静态页面和动态页面的区别.mp4','15.静态页面和动态页面的区别',NULL),(53,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','16.Web页面标准以及img标签深入.mp4','16.Web页面标准以及img标签深入',NULL),(54,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','17.Html5的浮动iframe框架.mp4','17.Html5的浮动iframe框架',NULL),(55,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','18.Html热点区域的使用.mp4','18.Html热点区域的使用',NULL),(56,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','19.Html5绘图标签的使用简介.mp4','19.Html5绘图标签的使用简介',NULL),(57,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','20.Html5音视频播放标签的使用.mp4','20.Html5音视频播放标签的使用',NULL),(58,'No-2.漫谈网页设计之骨架_HTML4.01HTML5','21.Html5的其他技术简要介绍.mp4','21.Html5的其他技术简要介绍',NULL),(59,'JQueryUI','JqueryUI专题讲解01.mp4','JqueryUI专题讲解01',NULL),(60,'JQueryUI','JqueryUI专题讲解02.mp4','JqueryUI专题讲解02',NULL),(61,'JQueryUI','JqueryUI专题讲解03.mp4','JqueryUI专题讲解03',NULL),(62,'JQueryUI','JqueryUI专题讲解04.mp4','JqueryUI专题讲解04',NULL),(63,'JQueryUI','JqueryUI专题讲解05.mp4','JqueryUI专题讲解05',NULL),(64,'JQueryUI','JqueryUI专题讲解06.mp4','JqueryUI专题讲解06',NULL),(65,'JQueryUI','JqueryUI专题讲解07.mp4','JqueryUI专题讲解07',NULL),(66,'JQueryUI','JqueryUI专题讲解08.mp4','JqueryUI专题讲解08',NULL),(67,'JQueryUI','JqueryUI专题讲解09.mp4','JqueryUI专题讲解09',NULL),(68,'bootstrap教程','bootstrap-01-01-下载 Bootstrap.mp4','bootstrap-01-01-下载 Bootstrap',NULL),(69,'bootstrap教程','bootstrap-01-03-在网页中使用 Bootstrap.mp4','bootstrap-01-03-在网页中使用 Bootstrap',NULL),(70,'bootstrap教程','bootstrap-02-01-布局.mp4','bootstrap-02-01-布局',NULL),(71,'bootstrap教程','bootstrap-02-02-嵌套布局与流动布局.mp4','bootstrap-02-02-嵌套布局与流动布局',NULL),(72,'bootstrap教程','bootstrap-02-03-响应式布局.mp4','bootstrap-02-03-响应式布局',NULL),(73,'bootstrap教程','bootstrap-02-04-把已有的固定宽度布局转换成响应式布局.mp4','bootstrap-02-04-把已有的固定宽度布局转换成响应式布局',NULL),(74,'bootstrap教程','bootstrap-02-05-响应式布局的实用类.mp4','bootstrap-02-05-响应式布局的实用类',NULL),(75,'bootstrap教程','bootstrap-03-01-常用标签与样式.mp4','bootstrap-03-01-常用标签与样式',NULL),(76,'bootstrap教程','bootstrap-03-02-列表.mp4','bootstrap-03-02-列表',NULL),(77,'bootstrap教程','bootstrap-03-03-代码.mp4','bootstrap-03-03-代码',NULL),(78,'bootstrap教程','bootstrap-04-01-表格.mp4','bootstrap-04-01-表格',NULL),(79,'bootstrap教程','bootstrap-05-01-表单.mp4','bootstrap-05-01-表单',NULL),(80,'bootstrap教程','bootstrap-05-02-文本框的前缀与后缀.mp4','bootstrap-05-02-文本框的前缀与后缀',NULL),(81,'bootstrap教程','bootstrap-05-06-表单的排版.mp4','bootstrap-05-06-表单的排版',NULL),(82,'bootstrap教程','bootstrap-06-01-按钮.mp4','bootstrap-06-01-按钮',NULL),(83,'bootstrap教程','bootstrap-06-03-带下拉菜单的按钮.mp4','bootstrap-06-03-带下拉菜单的按钮',NULL),(84,'bootstrap教程','bootstrap-07-01-导航菜单.mp4','bootstrap-07-01-导航菜单',NULL),(85,'bootstrap教程','bootstrap-08-02-选项卡 #2.mp4','bootstrap-08-02-选项卡 #2',NULL),(86,'bootstrap教程','bootstrap-09-01-导航路径与分页器.mp4','bootstrap-09-01-导航路径与分页器',NULL),(87,'bootstrap教程','bootstrap-11-01-缩略图.mp4','bootstrap-11-01-缩略图',NULL),(88,'bootstrap教程','bootstrap-12-01-对话框.mp4','bootstrap-12-01-对话框',NULL),(89,'bootstrap教程','bootstrap-13-01-工具提示.mp4','bootstrap-13-01-工具提示',NULL),(90,'bootstrap教程','bootstrap-14-01-折叠内容.mp4','bootstrap-14-01-折叠内容',NULL),(91,'bootstrap教程','bootstrap-15-01-旋转木马.mp4','bootstrap-15-01-旋转木马',NULL);

#
# Source for table "j_zan"
#

DROP TABLE IF EXISTS `j_zan`;
CREATE TABLE `j_zan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

#
# Data for table "j_zan"
#

INSERT INTO `j_zan` VALUES (35,13);
