CREATE DATABASE  IF NOT EXISTS `db_109403021` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_109403021`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.102    Database: db_109403021
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'科技'),(2,'遊戲'),(3,'教育'),(4,'地方創生'),(5,'空間'),(6,'飲食'),(7,'時尚'),(8,'音樂'),(9,'新春賀喜'),(10,'攝影');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  `user_comment` varchar(500) NOT NULL,
  `proposer_response` varchar(500) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`member_id`,`proposal_id`),
  KEY `comment_proposal_id_fk_idx` (`proposal_id`),
  KEY `comment_member_id_fk_idx` (`member_id`),
  CONSTRAINT `comment_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`),
  CONSTRAINT `comment_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (1,5,9,'不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)',NULL),(2,1,10,'GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～',NULL),(3,1,3,'請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?','',NULL),(4,5,4,'讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～',NULL),(5,4,8,'加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！',NULL),(6,10,1,'上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )',NULL),(7,1,2,'我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com',NULL),(8,2,6,'請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)',NULL),(9,1,7,'有機會可以早點出貨嗎？6/1要等很久','',NULL),(10,3,1,'請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收',NULL);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAQ`
--

DROP TABLE IF EXISTS `FAQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FAQ` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `last_editor_id` int NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`,`last_editor_id`,`proposal_id`),
  KEY `faq_proposal_id_fk_idx` (`proposal_id`),
  KEY `faq_last_editor_id_fk_idx` (`last_editor_id`),
  CONSTRAINT `faq_last_editor_id_fk` FOREIGN KEY (`last_editor_id`) REFERENCES `Member` (`member_id`),
  CONSTRAINT `faq_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAQ`
--

LOCK TABLES `FAQ` WRITE;
/*!40000 ALTER TABLE `FAQ` DISABLE KEYS */;
INSERT INTO `FAQ` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-05-24 17:13:00'),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-05-24 15:03:31'),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-05-24 15:03:43'),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-05-23 15:28:00'),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-05-23 15:28:00'),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-05-23 15:18:00'),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-05-24 21:30:00'),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-05-15 14:36:00'),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-05-19 15:06:00'),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-05-19 15:06:00');
/*!40000 ALTER TABLE `FAQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FollowingRecord`
--

DROP TABLE IF EXISTS `FollowingRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FollowingRecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`id`,`proposal_id`,`member_id`),
  KEY `following_record_proposal_id_fk_idx` (`proposal_id`),
  KEY `following_record_member_id_fk_idx` (`member_id`),
  CONSTRAINT `following_record_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`),
  CONSTRAINT `following_record_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FollowingRecord`
--

LOCK TABLES `FollowingRecord` WRITE;
/*!40000 ALTER TABLE `FollowingRecord` DISABLE KEYS */;
INSERT INTO `FollowingRecord` VALUES (2,1,10),(3,1,3),(7,1,2),(9,1,7),(8,2,6),(10,3,1),(5,4,8),(4,5,4),(1,6,9),(6,10,1);
/*!40000 ALTER TABLE `FollowingRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'毛若穎','0921003614','in.consequat@yahoo.com','0oplfZ16tyLX','366 苗栗縣銅鑼鄉民權路31號'),(2,'林芳岑','0988008346','adipiscing.enim.mi@outlook.com','7gB%z9Svg8EW','600 嘉義市東區世賢路24號'),(3,'胡素芝','0922830125','nullam.velit@yahoo.com','JJQF0j%tkx3i','325 桃園市龍潭區淮子埔一路29號'),(4,'童雅婷','0958351743','sed.auctor@hotmail.com','Rv$uGmL&C!%g','540 南投縣南投市三和一路14號'),(5,'賴麗萍','0912587773','sagittis.nullam@google.com','XcZg6Be^cU2y','508 彰化縣和美鎮潭北路15號'),(6,'黃志斌','0960105109','nec.leo.morbi@protonmail.com','aZjy*GvZt@s*','711 臺南市歸仁區崙頂二街11號'),(7,'廖松白','0961749001','sociosqu.ad@yahoo.com','j8tI5!wG88PM','411 臺中市太平區北田路14號'),(8,'徐嘉柏','0928735721','proin.non@protonmail.com','n7UDOe0uspZk','801 高雄市前金區自立二路18號'),(9,'李麗珠','0968169143','arcu.vel.quam@hotmail.com','wlmM33nAD@SR','201 基隆市信義區義四路22號'),(10,'施泓音','0970691667','dui.quis.accumsan@google.com','&@^ODhk0MH&l','622 嘉義縣大林鎮早知31號'),(14,'sp2email','sp2phone','sp2email','sp3salt','sp2address');
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberCredential`
--

DROP TABLE IF EXISTS `MemberCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MemberCredential` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hashed_user_id` int NOT NULL,
  `hashed_pwd_string` varchar(200) NOT NULL,
  PRIMARY KEY (`id`,`hashed_user_id`),
  KEY `member_credential_hashed_user_id_fk_idx` (`hashed_user_id`),
  CONSTRAINT `member_credential_hashed_user_id_fk` FOREIGN KEY (`hashed_user_id`) REFERENCES `Member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberCredential`
--

LOCK TABLES `MemberCredential` WRITE;
/*!40000 ALTER TABLE `MemberCredential` DISABLE KEYS */;
INSERT INTO `MemberCredential` VALUES (1,1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(2,2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(3,3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(4,4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538'),(5,5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(6,6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(7,7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(8,8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(9,9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(10,10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802'),(14,14,'sp3pwd');
/*!40000 ALTER TABLE `MemberCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberHompageRecommand`
--

DROP TABLE IF EXISTS `MemberHompageRecommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MemberHompageRecommand` (
  `id` int NOT NULL,
  `member_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`proposal_id`,`id`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `MemberHompageRecommand_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`),
  CONSTRAINT `MemberHompageRecommand_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberHompageRecommand`
--

LOCK TABLES `MemberHompageRecommand` WRITE;
/*!40000 ALTER TABLE `MemberHompageRecommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `MemberHompageRecommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberSearchRecord`
--

DROP TABLE IF EXISTS `MemberSearchRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MemberSearchRecord` (
  `id` int NOT NULL,
  `member_id` int NOT NULL,
  `search_date_time` datetime NOT NULL,
  `searched_keyword` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`member_id`),
  KEY `member_id_fk_idx` (`member_id`),
  CONSTRAINT `MemberSearchRecord_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberSearchRecord`
--

LOCK TABLES `MemberSearchRecord` WRITE;
/*!40000 ALTER TABLE `MemberSearchRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `MemberSearchRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberSearchRecord_m2m_Proposal`
--

DROP TABLE IF EXISTS `MemberSearchRecord_m2m_Proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MemberSearchRecord_m2m_Proposal` (
  `member_search_record_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  PRIMARY KEY (`member_search_record_id`,`proposal_id`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `member_search_record_id_fk` FOREIGN KEY (`member_search_record_id`) REFERENCES `MemberSearchRecord` (`id`),
  CONSTRAINT `MemberSearchRecord_m2m_Proposal_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberSearchRecord_m2m_Proposal`
--

LOCK TABLES `MemberSearchRecord_m2m_Proposal` WRITE;
/*!40000 ALTER TABLE `MemberSearchRecord_m2m_Proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `MemberSearchRecord_m2m_Proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proposal`
--

DROP TABLE IF EXISTS `Proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Proposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(120) NOT NULL,
  `content` text,
  `amount` int NOT NULL,
  `goal` int NOT NULL,
  `status` int NOT NULL,
  `viewed_num` int NOT NULL,
  `create_date` datetime NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `is_deactivated` int NOT NULL,
  PRIMARY KEY (`id`,`category_id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `proposal_category_id_fk_idx` (`category_id`),
  CONSTRAINT `proposal_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proposal`
--

LOCK TABLES `Proposal` WRITE;
/*!40000 ALTER TABLE `Proposal` DISABLE KEYS */;
INSERT INTO `Proposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',2393696,100000,2,1150,'2022-04-06 00:00:00','2022-07-05 00:00:00',0),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ✧ Kimóo 情緒平衡軟糖 ✧ 日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\"\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！\"',377200,200000,2,251,'2022-03-23 00:00:00','2022-06-21 00:00:00',0),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',3737138,500000,2,641,'2022-05-04 00:00:00','2022-08-02 00:00:00',0),(4,7,'『Organs without body 2014 S/S 服裝秀』','「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',5050,100000,3,4,'2013-08-21 00:00:00','2013-11-19 00:00:00',1),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',852482,50000,3,194,'2021-12-12 00:00:00','2022-03-12 00:00:00',1),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待','',282244,943038,2,63,'2022-05-25 00:00:00','2022-08-23 00:00:00',0),(7,3,'謎路⼈Way of Puzzle 2022【It\'s All I Have】專輯發⾏企劃','',45651,400000,2,31,'2022-05-23 00:00:00','2022-08-21 00:00:00',0),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,100000,1,0,'2022-03-22 00:00:00',NULL,0),(9,10,'SIRUI 75mm ​變形鏡頭','還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',532600,100000,3,200,'2021-07-20 00:00:00','2021-10-18 00:00:00',1),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',1556942,100000,3,3148,'2022-05-24 00:00:00','2022-08-22 00:00:00',1),(11,1,'sp10_title','sp10_content',0,100,3,0,'2022-06-14 15:51:38','2022-09-12 15:51:38',0),(12,2,'new','new',0,999,3,0,'2022-06-14 16:32:08','2022-09-12 16:32:08',0),(13,5,'test','test',0,777,3,0,'2022-06-14 16:33:05','2022-09-12 16:33:05',0);
/*!40000 ALTER TABLE `Proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProposalMember`
--

DROP TABLE IF EXISTS `ProposalMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ProposalMember` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`id`,`proposal_id`,`member_id`),
  KEY `proposal_member_proposal_id_idx` (`proposal_id`),
  KEY `proposal_memeber_member_id_fk_idx` (`member_id`),
  CONSTRAINT `proposal_member_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`),
  CONSTRAINT `proposal_memeber_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProposalMember`
--

LOCK TABLES `ProposalMember` WRITE;
/*!40000 ALTER TABLE `ProposalMember` DISABLE KEYS */;
INSERT INTO `ProposalMember` VALUES (2,1,7),(3,2,6),(5,3,4),(1,4,8),(9,5,9),(7,6,4),(8,6,3),(4,7,3),(10,8,2),(11,9,10),(6,10,1),(12,10,8),(14,12,14),(15,13,14);
/*!40000 ALTER TABLE `ProposalMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProposalOption`
--

DROP TABLE IF EXISTS `ProposalOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ProposalOption` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `title` varchar(450) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`,`proposal_id`),
  KEY `proposal_option_proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `proposal_option_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProposalOption`
--

LOCK TABLES `ProposalOption` WRITE;
/*!40000 ALTER TABLE `ProposalOption` DISABLE KEYS */;
INSERT INTO `ProposalOption` VALUES (1,1,'247 早鳥超值組',2290,'內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。'),(2,3,'單組 體驗初學',1790,'Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ '),(3,9,'【好評追加！超早鳥衣褲組合】',3899,'Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 '),(4,5,'小資支持 12個月每月茶包禮',800,'【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物'),(5,10,'75mm 超級早鳥價格',18800,'75mm F1.8 Anamorphic 1.33X Lens X1 '),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元',1490,'金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款'),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』',1888,'想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕'),(8,7,'【只想聽歌組】',720,'【謎路人 2022 It\'s All I Have】 概念專輯 1張 '),(9,4,'原畫畫作一件10號',15000,'原畫畫作'),(10,2,'【嘖嘖價】1 入 83 折',690,'Kimóo情緒平衡軟糖 1 盒');
/*!40000 ALTER TABLE `ProposalOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewRecord`
--

DROP TABLE IF EXISTS `ReviewRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ReviewRecord` (
  `review_record_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `reviewed_result` int NOT NULL,
  PRIMARY KEY (`review_record_id`,`proposal_id`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `ReviewRecord_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewRecord`
--

LOCK TABLES `ReviewRecord` WRITE;
/*!40000 ALTER TABLE `ReviewRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SponsorRecord`
--

DROP TABLE IF EXISTS `SponsorRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SponsorRecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `proposal_option_id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`,`member_id`,`proposal_option_id`,`proposal_id`),
  KEY `sponsor_record_member_id_fk_idx` (`member_id`),
  KEY `sponsor_record_proposal_option_id_fk_idx` (`proposal_option_id`),
  KEY `sponsor_record_proposal_idfk_idx` (`proposal_id`),
  CONSTRAINT `sponsor_record_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`),
  CONSTRAINT `sponsor_record_proposal_idfk` FOREIGN KEY (`proposal_id`) REFERENCES `ProposalOption` (`proposal_id`),
  CONSTRAINT `sponsor_record_proposal_option_id_fk` FOREIGN KEY (`proposal_option_id`) REFERENCES `ProposalOption` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SponsorRecord`
--

LOCK TABLES `SponsorRecord` WRITE;
/*!40000 ALTER TABLE `SponsorRecord` DISABLE KEYS */;
INSERT INTO `SponsorRecord` VALUES (1,9,5,4,800),(2,10,1,1,2290),(3,3,1,1,2290),(4,4,5,4,800),(5,8,4,9,15000),(6,1,10,5,18800),(7,2,1,1,2290),(8,6,2,10,690),(9,7,1,1,2290),(10,1,3,2,1790),(11,3,3,2,500),(12,2,5,4,200);
/*!40000 ALTER TABLE `SponsorRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitor`
--

DROP TABLE IF EXISTS `Visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Visitor` (
  `visitor_id` int NOT NULL AUTO_INCREMENT,
  `visited_date` datetime NOT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitor`
--

LOCK TABLES `Visitor` WRITE;
/*!40000 ALTER TABLE `Visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VisitorHompageRecommand`
--

DROP TABLE IF EXISTS `VisitorHompageRecommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VisitorHompageRecommand` (
  `id` int NOT NULL,
  `vistor_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  PRIMARY KEY (`id`,`vistor_id`,`proposal_id`),
  KEY `visitor_hompage_recommened_proposal_id_fk_idx` (`proposal_id`),
  KEY `visitor_hompage_id_fk` (`vistor_id`),
  CONSTRAINT `visitor_hompage_id_fk` FOREIGN KEY (`vistor_id`) REFERENCES `Visitor` (`visitor_id`),
  CONSTRAINT `VisitorHompageRecommand_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VisitorHompageRecommand`
--

LOCK TABLES `VisitorHompageRecommand` WRITE;
/*!40000 ALTER TABLE `VisitorHompageRecommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `VisitorHompageRecommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VisitorSearchRecord_m2m_Proposal`
--

DROP TABLE IF EXISTS `VisitorSearchRecord_m2m_Proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VisitorSearchRecord_m2m_Proposal` (
  `vistor_search_record_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  PRIMARY KEY (`vistor_search_record_id`,`proposal_id`),
  KEY `vistor_search_record_id_fk_idx` (`vistor_search_record_id`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `VisitorSearchRecord_m2m_Proposal_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `Proposal` (`id`),
  CONSTRAINT `vistor_search_record_id_fk` FOREIGN KEY (`vistor_search_record_id`) REFERENCES `VistorSearchRecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VisitorSearchRecord_m2m_Proposal`
--

LOCK TABLES `VisitorSearchRecord_m2m_Proposal` WRITE;
/*!40000 ALTER TABLE `VisitorSearchRecord_m2m_Proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `VisitorSearchRecord_m2m_Proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VistorSearchRecord`
--

DROP TABLE IF EXISTS `VistorSearchRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VistorSearchRecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visitor_id` int NOT NULL,
  `search_date_time` datetime NOT NULL,
  `searched_keyword` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`visitor_id`),
  KEY `visitor_search_record_visitor_id_fk_idx` (`visitor_id`),
  CONSTRAINT `visitor_search_record_visitor_id_fk` FOREIGN KEY (`visitor_id`) REFERENCES `Visitor` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VistorSearchRecord`
--

LOCK TABLES `VistorSearchRecord` WRITE;
/*!40000 ALTER TABLE `VistorSearchRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `VistorSearchRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_109403021'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_CreateProposal`(
	IN 	in_member_id int, 
		in_title varchar(120), 
		in_content TEXT, 
		in_goal int, 
		in_category_id int,
	OUT affected_row_num int
)
BEGIN
	INSERT INTO Proposal(title,content,amount,goal,`status`,viewed_num,create_date,due_date,category_id,is_deactivated) 
    VALUES(in_title,in_content,0,in_goal,2,0,NOW(),DATE_ADD(NOW(),INTERVAL 90 DAY),in_category_id,0);
    INSERT INTO ProposalMember(proposal_id,member_id)
    SELECT Proposal.id,in_member_id
    FROM Proposal
    WHERE Proposal.title = in_title;
    
    SELECT ROW_COUNT() INTO affected_row_num;
    SELECT  Proposal.id AS proposal_id,
			title AS proposal_title,
            content AS proposal_content,
            amount,
            goal,
            `status`,
            viewed_num,
            create_date,
            due_date,
            category_name AS category
    FROM Proposal JOIN Category
    ON category_id = Category.id
    WHERE title = in_title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_DeleteMember`(
	IN in_member_id int,
    OUT affected_row_num int
)
BEGIN
    DELETE FROM MemberCredential
    WHERE hashed_user_id = in_member_id;
    DELETE FROM SponsorRecord
    WHERE member_id = in_member_id;
    DELETE FROM ProposalMember
    WHERE member_id = in_member_id;
    DELETE FROM FollowingRecord
    WHERE member_id = in_member_id;
    DELETE FROM `Comment`
    WHERE member_id = in_member_id;
    DELETE FROM FAQ
    WHERE last_editor_id = in_member_id;
    
    DELETE FROM MemberHompageRecommand
    WHERE member_id = in_member_id;
    DELETE FROM MemberSearchRecord_m2m_Proposal
    WHERE member_search_record_id  = (SELECT id FROM MemberSearchRecord WHERE member_id = in_member_id);
    DELETE FROM MemberSearchRecord
    WHERE member_id = in_member_id;

    DELETE FROM Member
    WHERE member_id = in_member_id;
    
    SELECT ROW_COUNT() INTO affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN in_member_id int,
    OUT number_of_rows_in_the_result_set int
)
BEGIN
	SELECT member_id,Proposal.id AS proposal_id,title AS proposal_title,amount AS proposal_amount,goal AS proposal_goal
    FROM FollowingRecord JOIN Proposal
    ON FollowingRecord.proposal_id = Proposal.id
    WHERE member_id = in_member_id;
    
    SELECT found_rows() INTO number_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN in_member_id int,
    OUT number_of_rows_in_the_result_set int
)
BEGIN
	SELECT  member_id,
			Proposal.id AS proposal_id,
			Proposal.title AS proposal_title,
            proposal_option_id,
            ProposalOption.title AS proposal_option_title,
            SponsorRecord.amount AS amount,
            `status`
    FROM SponsorRecord JOIN Proposal JOIN ProposalOption
    ON Proposal.id = ProposalOption.proposal_id AND ProposalOption.id = proposal_option_id
    WHERE member_id = in_member_id;
    
    SELECT found_rows() INTO number_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN in_ratio float,
    OUT number_of_rows_in_the_result_set int
)
BEGIN
	SELECT id AS proposal_id,title AS proposal_title,amount,goal,(amount/goal) AS ratio
    FROM Proposal
    WHERE (amount/goal) >= in_ratio
    ORDER BY (amount/goal) DESC; 
    
    SELECT found_rows() INTO number_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_GetProposalsByKeyword`(
	IN in_keyword varchar(64),
    OUT number_of_rows_in_the_result_set int
)
BEGIN
	SELECT id AS proposal_id,title AS proposal_id,due_date,amount
    FROM Proposal
    WHERE title LIKE  CONCAT('%', in_keyword , '%');
    
    SELECT found_rows() INTO number_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_GetRecommendedProposals`(
	IN in_member_id int,
    OUT number_of_rows_in_the_result_set int
)
BEGIN
	IF EXISTS(SELECT id AS proposal_id,title AS proposal_title,`status`,viewed_num
				FROM Proposal
				WHERE id IN(SELECT proposal_id
							FROM SponsorRecord
							WHERE member_id IN(SELECT member_id
												FROM SponsorRecord
												WHERE proposal_id IN(SELECT proposal_id
																		FROM SponsorRecord
																		WHERE member_id = in_member_id)AND member_id != in_member_id))
					AND id NOT IN (SELECT proposal_id FROM SponsorRecord WHERE  member_id = in_member_id)
					AND `status` = 2
					AND id NOT IN (SELECT proposal_id FROM ProposalMember WHERE  member_id = in_member_id))THEN
		SELECT id AS proposal_id,title AS proposal_title,`status`,viewed_num
		FROM Proposal
		WHERE id IN(SELECT proposal_id
					FROM SponsorRecord
					WHERE member_id IN(SELECT member_id
										FROM SponsorRecord
										WHERE proposal_id IN(SELECT proposal_id
															 FROM SponsorRecord
															 WHERE member_id = in_member_id)AND member_id != in_member_id))
		AND id NOT IN (SELECT proposal_id FROM SponsorRecord WHERE  member_id = in_member_id)
		AND `status` = 2
		AND id NOT IN (SELECT proposal_id FROM ProposalMember WHERE  member_id = in_member_id);
	ELSE
		SELECT id AS proposal_id,title AS proposal_title,`status`,viewed_num
		FROM Proposal
        ORDER BY viewed_num DESC
        LIMIT 5;
	END IF;
    
    SELECT found_rows() INTO number_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_GetUnrepliedComments`(
	IN in_member_id int,
    OUT number_of_rows_in_the_result_set int
)
BEGIN
	SELECT ProposalMember.member_id,
    Proposal.id AS proposal_id,
    title AS proposal_title,
    `Comment`.`id` AS comment_id,
    user_comment AS member_comment,
    comment_time,
    proposer_response
    FROM `Comment` JOIN Proposal JOIN ProposalMember
    ON ProposalMember.proposal_id = Proposal.id 
    AND `Comment`.`proposal_id` = Proposal.id
    WHERE ProposalMember.member_id = in_member_id
    AND (proposer_response = '' OR proposer_response is null);
    
    SELECT found_rows() INTO number_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_Login`(
	IN in_email varchar(64), 
    in_hashedpwd varchar(200),
	OUT status_code int
)
BEGIN
	IF EXISTS(SELECT * FROM Member JOIN MemberCredential 
				ON member_id = hashed_user_id
				WHERE email = in_email)THEN
		SET status_code = 2;
	ELSE
		SET status_code = 3;
	END IF;
	IF EXISTS(SELECT * FROM Member JOIN MemberCredential 
				ON member_id = hashed_user_id
				WHERE email = in_email AND hashed_pwd_string = in_hashedpwd)THEN
		SET status_code = 1;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_RegisterMember`(
	IN in_email varchar(64), 
    in_hashedPwd varchar(200), 
    in_salt char(64),
    in_name varchar(64), 
    in_address varchar(255), 
    in_phone varchar(64),
    OUT affected_row_num int
)
BEGIN
	INSERT INTO Member(name,phone,email,salt,address) 
    VALUES(in_email,in_phone,in_email,in_salt,in_address);
    INSERT INTO MemberCredential(hashed_user_id,hashed_pwd_string) 
    SELECT member_id,in_hashedPwd
    FROM Member
    WHERE Member.email = in_email;
	
    SELECT ROW_COUNT() INTO affected_row_num;
    SELECT member_id,name,email,MemberCredential.hashed_pwd_string AS password,salt,phone,address
    FROM Member JOIN MemberCredential
    ON member_id = hashed_user_id
    WHERE email = in_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_UpdateProposalStatus`(
	IN in_proposal_id int,
    in_status int,
    OUT affected_row_num int
)
BEGIN
	SET @status_illustrate = null;
	SET @error_message = null;
	IF in_status = 1 OR in_status = 2 OR in_status = 3 THEN
		IF (SELECT `status` FROM Proposal WHERE id = in_proposal_id) = 1 AND in_status = 2 THEN
			UPDATE Proposal
            SET status = in_status
            WHERE id = in_proposal_id;
		ELSEIF (SELECT `status` FROM Proposal WHERE id = in_proposal_id) = 2 AND in_status = 3 THEN
            UPDATE Proposal
            SET status = in_status
            WHERE id = in_proposal_id;
		ELSE
			SET @error_message = '狀態請依照1 → 2 → 3';
		END IF;
    ELSE
		SET @error_message = 'status請輸入1~3';
	END IF;
    
    IF (SELECT `status` FROM Proposal WHERE id = in_proposal_id) = 1 THEN
		SET @status_illustrate = 'UNDER-REVIEWING';
	ELSEIF (SELECT `status` FROM Proposal WHERE id = in_proposal_id) = 2 THEN
		SET @status_illustrate = 'ONGOING';
	ELSE
		SET @status_illustrate = 'EXPIRED';
	END IF;
    
    SELECT id AS proposal_id,`status`,@status_illustrate,@error_message
    FROM Proposal
    WHERE id = in_proposal_id;
    SELECT found_rows() INTO affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403021`@`192.168.56.1` PROCEDURE `sp_UpdatePwd`(
    IN  in_member_id int,
    in_hashedPwd varchar(200), 
    in_salt char(64),
    OUT affected_row_num int
)
BEGIN
    UPDATE Member
    SET salt = in_salt
    WHERE member_id = in_member_id;
    UPDATE MemberCredential
    SET hashed_pwd_string = in_hashedPwd
    WHERE hashed_user_id = in_member_id;
    
    SELECT ROW_COUNT() INTO affected_row_num;
    SELECT member_id,name,email,MemberCredential.hashed_pwd_string AS password,salt,phone,address
    FROM Member JOIN MemberCredential
    ON member_id = hashed_user_id
    WHERE member_id = in_member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 16:46:32
