--
-- Copyright 2024 HeavenZhi. All rights reserved.
-- Use of this source code is governed by a MIT style
-- license that can be found in the LICENSE file.
--

-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: what_eat
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户表主键',
  `name` varchar(16) NOT NULL COMMENT '账户名',
  `password` varchar(16) DEFAULT NULL COMMENT '密码',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '账户等级,level6为最高管理员权限,level0为普通账户权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

INSERT INTO `account` VALUES (1,'北小贝','666666',6);

--
-- Table structure for table `ingredient_kind`
--

DROP TABLE IF EXISTS `ingredient_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食材类别表主键',
  `name` varchar(255) NOT NULL COMMENT '类别名',
  `description` text NOT NULL COMMENT '类别描述',
  `fid` int(11) DEFAULT NULL COMMENT '上级分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='食材类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_kind`
--

INSERT INTO `ingredient_kind` VALUES (1,'动物性食物','动物性食品是动物来源的食物,包括畜禽肉、蛋类、水产品、奶及其制品等,主要为人体提供蛋白质、脂肪、矿物质、维生素A和B族维生素.不同类型的动物类食物之间的营养价值相差较大,只是在给人体提供蛋白质方面十分接近.',NULL);
INSERT INTO `ingredient_kind` VALUES (2,'植物性食物','植物性食品是指以植物的种子、果实或组织部分为原料,直接或加工以后为人类提供能量或物质来源的食品.主要有谷物、薯类、豆类及其制品、水果蔬菜制品、茶叶等.',NULL);
INSERT INTO `ingredient_kind` VALUES (3,'粮油调味','粮油和调味品.',NULL);
INSERT INTO `ingredient_kind` VALUES (4,'家畜','被驯化用于食用的哺乳类动物.',1);
INSERT INTO `ingredient_kind` VALUES (5,'乳类及其乳制品','动物乳类制品.',1);
INSERT INTO `ingredient_kind` VALUES (6,'家禽','被驯化用于食用鸟类动物.',1);
INSERT INTO `ingredient_kind` VALUES (7,'蛋类及其蛋制品','家禽的蛋以及蛋制品.',1);
INSERT INTO `ingredient_kind` VALUES (8,'水产','包含新鲜的淡水水产和新鲜的海水水产以及冷冻水产.',1);
INSERT INTO `ingredient_kind` VALUES (9,'肉制品','包含各种肉制品.',1);
INSERT INTO `ingredient_kind` VALUES (10,'鱼制品','包含各种鱼制品.',1);
INSERT INTO `ingredient_kind` VALUES (11,'蔬菜','蔬菜是指可以做菜、烹饪成为食品的一类植物或菌类,蔬菜是人们日常饮食中必不可少的食物之一.蔬菜可提供人体所必需的多种维生素和矿物质等营养物质.\r\n据国际物质粮农组织1990年统计,人体必需的维生素C的90%、维生素A的60%来自蔬菜.此外,蔬菜中还有多种多样的植物化学物质,是人们公认的对健康有效的成分,目前果蔬中的营养素可以有效预防慢性、退行性疾病的多种物质，正在被人们研究发现.',2);
INSERT INTO `ingredient_kind` VALUES (12,'豆制品','各种豆制品.',2);
INSERT INTO `ingredient_kind` VALUES (13,'谷物麦类','\"谷物\"涵盖的范围较广,包括大米、小麦、小米、大豆等及其它杂粮.谷类包括大米、小麦、小米、大豆等,主要是植物种子和果实.是许多亚洲人民的传统主食.',2);
INSERT INTO `ingredient_kind` VALUES (14,'粮油','粮油是对谷类、豆类等粮食和油料及其加工成品和半成品的统称,是人类主要食物的统称.\r\n所谓民以食为天,粮食是我们人类赖以生存的必需品,是关系国计民生的特殊商品.\r\n对于粮食作物和粮油认识已是众所周知的事情.粮食作物的种子、果实以及块根、块茎及其加工产品统称为粮食.粮食按是否经过加工分为原粮、成品粮.',3);
INSERT INTO `ingredient_kind` VALUES (15,'调味品','调味品(flavouring,condiment,seasoning),是指能增加菜肴的色、香、味,促进食欲,有益于人体健康的辅助食品.它的主要功能是增进菜品质量,满足消费者的感官需要,从而刺激食欲,增进人体健康.从广义上讲,调味品包括咸味剂、酸味剂、甜味剂、鲜味剂和辛香剂等,像食盐、酱油、醋、味精、糖（另述）、八角、茴香、花椒、芥末等都属此类.',3);
INSERT INTO `ingredient_kind` VALUES (16,'猪','家畜类第一大分支,性寒,中国普遍主食的肉类,多食易肥胖,属于红肉.',4);
INSERT INTO `ingredient_kind` VALUES (17,'牛','家畜类第二大分支,性温,多食不易肥胖,属于红肉.',4);
INSERT INTO `ingredient_kind` VALUES (18,'羊','家畜类第三大分支,性温,它能御风寒,多食易上火,属于红肉.',4);
INSERT INTO `ingredient_kind` VALUES (19,'兔','家畜类第四大分支,性寒,蛋白质含量高达70%,且脂肪和胆固醇含量却低于所有肉类,故对它有\"荤中之素\"的说法,属于红肉.',4);
INSERT INTO `ingredient_kind` VALUES (20,'其他家畜','其他家禽聚集地.',4);
INSERT INTO `ingredient_kind` VALUES (21,'乳类','各种动物的奶.',5);
INSERT INTO `ingredient_kind` VALUES (22,'乳制品','各种动物乳类制品.',5);
INSERT INTO `ingredient_kind` VALUES (23,'鸡','鸡是一种家禽,家鸡源出于野生的原鸡,其驯化历史至少约4000年,但直到1800年前后鸡肉和鸡蛋才成为大量生产的商品.鸡的种类有火鸡、乌鸡、野鸡等.而且鸡也是12生肖中的一属.\r\n',6);
INSERT INTO `ingredient_kind` VALUES (24,'鸭','鸭是雁形目鸭科(Anatidae)鸭亚科(Anatinae)水禽的统称,或称真鸭.鸭的体型相对较小,颈短,一些属的嘴要大些.腿位于身体后方(如同天鹅一样),因而步态蹒跚.大多数真鸭(包括由于个体大小和体形原因而被不正确地称为雁的几种鸟)与天鹅、雁不同,具有下列特征:雄鸟每年换羽两次,雌鸟每窝产卵数亦较多,卵壳光滑.腿上覆盖著相搭的鳞片.叫声则显示出某种程度的性别差异.',6);
INSERT INTO `ingredient_kind` VALUES (25,'鹅','鹅是食草禽,全身都是宝,羽毛是富贵华丽的服装,鹅肝是高等餐桌的美味,鹅肉营养丰富、氨基酸完全、脂肪是单一不饱和脂肪酸,价值敢与羊肉相媲美,是高档餐馆的必备.\r\n鹅作为一种常见的家禽,其生活习性比较特殊,例如,具有喜水性、警觉性、耐寒性、生活规律性等.鹅抗病能力强,饲养污染小,作为绿色食物,越来越受到人们的喜爱.',6);
INSERT INTO `ingredient_kind` VALUES (26,'鸽子','鸽,一种十分常见的鸟,世界各地广泛饲养,鸽是鸽形目鸠鸽科数百种鸟类的统称.我们平常所说的鸽子只是鸽属中的一种,而且是家鸽,家鸽中最常见的是信鸽,主要用于通讯和竞翔.鸽子和人类伴居已经有上千年的历史了,考古学家发现的第一幅鸽子图像,来自于公元前3000年的美索不达米亚,也就是伊拉克.',6);
INSERT INTO `ingredient_kind` VALUES (27,'鹌鹑','鹌鹑属(学名：Coturnix):体型较小而滚圆,羽色多较暗淡,通常雌雄相差不大.体小褐色带明显的草黄色矛状条纹及不规则斑纹,雄雌两性上体均具红褐色及黑色横纹.雄鸟颏深褐,喉中线向两侧上弯至耳羽,紧贴皮黄色项圈.皮黄色眉纹与褐色头顶及贯眼纹成明显对照.雌鸟亦有相似图纹但对照不甚明显.\r\n常成对而非成群活动.经常活动在生长着茂密的野草或矮树丛的平原、荒地、溪边及山坡丘陵一带,有时也到耕地附近活动.主要吃杂草种子、豆类、谷物及浆果、嫩叶、嫩芽等,夏天吃大量的昆虫及幼虫,以及小型无脊椎动物等.分布于欧洲、非洲、亚洲和澳洲等.',6);
INSERT INTO `ingredient_kind` VALUES (28,'其他家禽','其他家禽聚集地.',6);
INSERT INTO `ingredient_kind` VALUES (29,'蛋类','各种家禽的蛋.',7);
INSERT INTO `ingredient_kind` VALUES (30,'蛋制品','各种蛋的制品.',7);
INSERT INTO `ingredient_kind` VALUES (31,'腌制蛋品(再制蛋)','腌制蛋是在保持蛋原形的情况下,主要经过盐、碱、糟、卤等辅料加工处理后制成的蛋制品,包括皮蛋、咸蛋、糟蛋以及其他多味蛋等.腌制蛋是中国的民族特产,产品加工成本低,风味独特,食用方便,营养丰富,深受消费者欢迎.',7);
INSERT INTO `ingredient_kind` VALUES (32,'冰蛋品','冰蛋品是鲜蛋去壳后将全蛋液或分蛋液冻结而成,可作为食品配料.',7);
INSERT INTO `ingredient_kind` VALUES (33,'干蛋品','干蛋品是将鲜蛋去壳后经加工处理干燥而成,它分为干蛋白（又称干蛋白片）、干全蛋片、干蛋黄片和全蛋粉、蛋白粉、蛋黄粉.',7);
INSERT INTO `ingredient_kind` VALUES (34,'湿蛋品','湿蛋品是以蛋液为原料,加入不同的防腐剂制成的蛋制品,它分为湿全蛋、湿蛋黄和湿蛋白.',7);
INSERT INTO `ingredient_kind` VALUES (35,'其他蛋制品','其他蛋制品聚集地.',7);
INSERT INTO `ingredient_kind` VALUES (36,'鲜活水产','水产类第一大分支,包含淡水鱼和海水鱼以及虾蟹贝蛙.',8);
INSERT INTO `ingredient_kind` VALUES (37,'淡水鱼','广义的说,系指能生活在盐度为千分之三的淡水中的鱼类就可称为淡水鱼.狭义的说,系指在其生活史中部分阶段如只有「幼鱼期」或「成鱼期」,或是终其一生都必须在淡水域中渡过的鱼类.世界上已知鱼类约有26000多种,淡水鱼约有8600余种.我国现有鱼类近3千种,其中淡水鱼有1000余种.\r\n世界上已知鱼类约有26000多种,是脊椎动物中种类最多的一大类,约占脊椎动物总数的48.1%.它们绝大多数生活在海洋里,淡水鱼约有8600余种.我国现有鱼类近3千种,其中淡水鱼有1000余种.',44);
INSERT INTO `ingredient_kind` VALUES (38,'海水鱼','海水鱼主要是指产自热带地区的海鱼,它们色彩特别艳丽,形状奇特,是观赏鱼产业未来的发展方向.人工饲养需要一定方法和技巧.',44);
INSERT INTO `ingredient_kind` VALUES (39,'鱿鱼','鱿鱼,也称柔鱼、枪乌贼,是软体动物门头足纲鞘亚纲十腕总目管鱿目开眼亚目的动物.体圆锥形,体色苍白,有淡褐色斑,头大,前方生有触足10条,尾端的肉鳍呈三角形,常成群游弋于深约20米的海洋中.',44);
INSERT INTO `ingredient_kind` VALUES (40,'墨鱼','墨鱼是温带和亚热带、热带海域的软体动物,当遇到敌人时会喷射墨汁逃生,趁浑浊污水而伺机离开.它的皮肤中有色素小囊,会随其情绪变化而改变颜色和大小.春末交配,并把受精卵产在木片或海上待孵化成小墨鱼.分布于中国、韩国、日本、新加坡、中国台湾及中国香港地区.',44);
INSERT INTO `ingredient_kind` VALUES (41,'章鱼','章鱼(Octopus):为章鱼科26属252种海洋软体动物的通称.为头足纲最大科,可分为深海多足蛸亚科(Bathypolypodinae)、爱尔斗蛸亚科(Eledoninae)、谷蛸亚科(Graneledoninae)和蛸亚科(Octopodinae).体卵形或卵圆形,肌肉强健,外套腔开口窄,体表一般不具水孔.腕吸盘1列或2列.雄性左侧或右侧第3腕茎化,腕腹缘具精沟,末端具勺状舌叶.茎化腕不能自断.漏斗外套锁退化.具1对退化针状内壳或无内壳.若具齿舌,齿舌侧齿一般单尖.胃和盲肠位于消化腺后部.\r\n该科是重要的商业性头足类,中国南部沿海的真蛸(普通章鱼)和北部沿海的短蛸均有一定产量.蛸的干制品称\"八蛸干\"或\"章鱼干\",除食用外,在医药上尚有补血益气、收敛生肌的作用.\r\n为温带性软体动物,生活在水下,适应水温不能低于7℃,海水比重1.021最为适宜,低盐度的环境会死亡.能摄食大型动物性浮游生物而成长.广泛分布于世界各大洋的热带及温带海域.',44);
INSERT INTO `ingredient_kind` VALUES (42,'虾','虾(Shrimp),是一种生活在水中的节肢动物,属节肢动物甲壳类,种类很多,包括南极红虾、青虾、河虾、草虾、对虾、明虾、龙虾等.虾具有很高的食疗营养价值,可以有蒸、炸等做法,并可以用做于中药材.',44);
INSERT INTO `ingredient_kind` VALUES (43,'虾仁','虾仁,一种食品,选用活虾为原料,用清水洗净虾体,去掉虾头、虾尾和虾壳.剥壳后的纯虾肉即为虾仁.\r\n虾仁菜肴因为清淡爽口,易于消化,老幼皆宜,而深受食客欢迎.',44);
INSERT INTO `ingredient_kind` VALUES (44,'蟹','蟹(学名：crab),是十足目短尾次目的甲壳动物,尤指短尾族的种类(真蟹).亦包括其他一些类型,如歪尾族的种类约有4700种.其分布见于所有海洋、河流及陆地.蟹的尾部与其他十足目（如虾、龙虾、螯虾）不同,卷曲于胸部下方,背甲通常宽阔.第一对胸足特化为螯足.通常以步行或爬行的方式移动.普通滨蟹的横行步态为人们所熟悉,亦为多数蟹类的特征.梭子蟹科的种类及其他一些类型,用扁平桨状的附肢游泳,动作灵巧,大钳子很有力.我国蟹的资源十分丰富,其中以长江下游的太湖大闸蟹、高邮湖大闸蟹、阳澄湖大闸蟹出产的大闸蟹为上品.\r\n蟹有很多种类,大部分蟹类可以食用.大部分吃得最多的都来源于大海或者淡水湖泊区域.',44);
INSERT INTO `ingredient_kind` VALUES (45,'蛙','任何无尾目(Anura)两生类.在严格的意义上仅指蛙科(Ranidae,即赤蛙科)动物,但蛙一词常泛指皮肤光滑、善跳的无尾目动物,以区别体肥、皮肤多疣、齐足跳的种类(称为蟾蜍).',44);
INSERT INTO `ingredient_kind` VALUES (46,'贝','贝类,即软体动物中的一类.是三胚层、两侧对称,具有真体腔的动物.软体动物的真体腔是由裂腔法形成,也就是中胚层所形成的体腔.但软体动物的真体腔不发达,仅存在于围心腔及生殖腺腔中.软体动物在形态上变化很大,但在结构上都可以分为头、足、内脏囊及外套膜4部分.头位于身体的前端,足位于头后、身体腹面,是由体壁伸出的一个多肌肉质的运动器官,内脏囊位于身体背面,是由柔软的体壁包围着的内脏器官,外套膜是由身体背部的体壁延伸下垂形成的一个或一对膜,外套膜与内脏囊之间的空腔即为外套腔.由外套膜向体表分泌碳酸钙,形成一个或两个外壳包围整个身体,少数种类壳被体壁包围或壳完全消失.这些基本结构在不同的纲中有很大的变化与区别.软体动物具有完整的消化道,出现了呼吸与循环系统,也出现了比原肾更进化的后肾(metanephridium).软体动物种类繁多,分布广泛.现存的有11万种以上,还有35000化石种,是动物界中仅次于节肢动物的第二大门类.特别是一些软体动物利用\"肺\"进行呼吸,身体具有调节水分的能力,使软体动物与节肢动物构成了仅有的适合于地面上生活的陆生无脊椎动物.',44);
INSERT INTO `ingredient_kind` VALUES (47,'生蚝','牡蛎(ostrea gigas tnunb)俗称海蛎子、蚝等,隶属软体动物门,双壳纲,珍珠贝目,是世界上第一大养殖贝类,是人类可利用的重要海洋生物资源之一,为全球性分布种类.牡蛎不仅肉鲜味美、营养丰富,而且具有独特的保健功能和药用价值,是一种营养价值很高的海产珍品.牡蛎的含锌量居人类食物之首.古今中外均认为牡蛎有治虚弱、解丹毒、降血压、滋阴壮阳的功能.\r\n牡蛎作为一种优质的海产养殖贝类,不仅具有肉味鲜美的食用价值,而且其肉与壳均可入药,具有较高的药用价值.',54);
INSERT INTO `ingredient_kind` VALUES (48,'鲍鱼','鲍鱼是名贵的\"海珍品\"之一,味道鲜美,营养丰富,被誉为海洋\"软黄金\".鲍鱼是名贵的海洋食用贝类,被誉为\"餐桌黄金\",海珍之冠”,其肉质细嫩、营养丰富.\r\n鲜品可食部分蛋白质24%、脂肪0.44%.干品含蛋白质40%、糖元33.7%、脂肪0.9%以及多种维生素和微量元素,是一种对人体非常有利的高蛋白、低脂肪食物.鲍鱼因富含谷氨酸,味道非常鲜美.\r\n鲍鱼(Abalone),其名为鱼,实则非鱼,种属原始海洋贝类,单壳软体动物.由于其形状恰似人的耳朵,所以也叫它\"海耳\"(Sea-ear).鲍鱼通常生长在水温较低的海底,足迹遍及太平洋、大西洋和印度洋,公认最佳产地为日本北部和墨西哥,我国东北部也是传统产区.全世界已命名的216种鲍鱼中,分布在我国沿海的鲍鱼有7种,其中又以北部渤海湾出产的皱纹盘鲍和东南沿海的杂色鲍最为多见.',54);
INSERT INTO `ingredient_kind` VALUES (49,'螺类','螺类是软体动物腹足类的通称.主要形态特征是身体分头、足、内脏囊三部分.螺包括一些贝类,内脏囊在发育过程中经过旋转成为左右不对称,并缩在一个螺旋形的贝壳内,又称单壳类或螺类.',54);
INSERT INTO `ingredient_kind` VALUES (50,'蛏/蛤','蛏(chēng)子 razor clam为海产贝类.软体动物.介壳两扇,形状狭而长,外面蛋黄色,里面白色,生活在近岸的海水里,也可人工养殖,肉味鲜美.有缢蛏、竹蛏等种类.chēng,在闽南语里读音类似\"摊\",在瓯语里读音类似\"青\".蛏子常见於潮间带的泥沙中(尤其在温带).壳窄长,剃刀状,长可达20公分(50吋).斧足大而活跃,能在洞穴中迅速上下移动,受惊时很快缩入洞内.以短水管摄食海水中食物颗粒.有的种可藉水管喷水而作短距离游泳.北美太平洋沿岸的荚蛏(Siliqua patula)不栖息在固定的洞穴中,而生活在不断受海浪冲刷的海滩的流沙中.\r\n蛤,一种对于可食用双壳贝类的泛称,也被叫做蛤蛎、蛤、文蛤、西施舌、蚌、花甲.已知12 000种,其中约500种栖于淡水,其余的为海栖.通常栖于砂质或泥质的水底.',54);
INSERT INTO `ingredient_kind` VALUES (51,'扇贝/贻贝','扇贝属于软体动物门,扇贝科,是我国重要的贝类养殖品种.扇贝可食部分的主要营养成分为蛋白质,与鱼类、虾类相似,是一种集食、药、滋补为一体的重要水产食物.扇贝广泛分布于世界各海域.扇贝柱的干制品称为\"干贝\",为名贵海珍品.\r\n贻贝(学名：Mytilus edulis)亦称海虹,煮熟后加工成干品——淡菜,是一种双壳类软体动物,壳黑褐色,生活在海滨岩石上.分布于中国黄海、渤海及东海沿岸.贻贝壳呈楔形,前端尖细,后端宽广而圆.一般壳长6～8厘米,壳长小于壳高的2倍.壳薄.壳顶近壳的最前端.两壳相等,左右对称,壳面紫黑色,具有光泽,生长纹细密而明显,自顶部起呈环形生长.',54);
INSERT INTO `ingredient_kind` VALUES (52,'其他贝类','其他贝聚集地.',54);
INSERT INTO `ingredient_kind` VALUES (53,'其他鲜活水产','其他鲜活水产聚集地',44);
INSERT INTO `ingredient_kind` VALUES (54,'冷冻水产','水产类第二大分支,冻淡水鱼和冻海水鱼以及冻虾冻蟹冻贝冻蛙.',8);
INSERT INTO `ingredient_kind` VALUES (55,'冻淡水鱼','冷冻的淡水鱼.',62);
INSERT INTO `ingredient_kind` VALUES (56,'冻海水鱼','冷冻的海水鱼.',62);
INSERT INTO `ingredient_kind` VALUES (57,'冻鱿鱼','冷冻的鱿鱼.',62);
INSERT INTO `ingredient_kind` VALUES (58,'冻墨鱼','冷冻的墨鱼.',62);
INSERT INTO `ingredient_kind` VALUES (59,'冻章鱼','冷冻的章鱼.',62);
INSERT INTO `ingredient_kind` VALUES (60,'冻虾','冷冻的虾.',62);
INSERT INTO `ingredient_kind` VALUES (61,'冻虾仁','冷冻的虾仁.',62);
INSERT INTO `ingredient_kind` VALUES (62,'冻蟹','冷冻的蟹.',62);
INSERT INTO `ingredient_kind` VALUES (63,'冻贝','冷冻的贝.',62);
INSERT INTO `ingredient_kind` VALUES (64,'其他冷冻水产','其他冷冻水产聚集地.',62);
INSERT INTO `ingredient_kind` VALUES (65,'叶菜','各种叶菜.',11);
INSERT INTO `ingredient_kind` VALUES (66,'花菜','各种花菜.',11);
INSERT INTO `ingredient_kind` VALUES (67,'瓜','各种瓜.',11);
INSERT INTO `ingredient_kind` VALUES (68,'茄果','各种茄果.',11);
INSERT INTO `ingredient_kind` VALUES (69,'根茎','各种根茎.',11);
INSERT INTO `ingredient_kind` VALUES (70,'豆荚','各种豆荚.',11);
INSERT INTO `ingredient_kind` VALUES (71,'菌类','各种菌类.',11);
INSERT INTO `ingredient_kind` VALUES (72,'调味菜类','各种调味菜(葱、姜、蒜、辣椒等).',11);
INSERT INTO `ingredient_kind` VALUES (73,'其他蔬菜','其他蔬菜聚集地.',11);
INSERT INTO `ingredient_kind` VALUES (74,'谷类','各种谷类.',13);
INSERT INTO `ingredient_kind` VALUES (75,'麦类','各种麦类.',13);
INSERT INTO `ingredient_kind` VALUES (76,'其他谷物','其他谷物聚集地.',13);
INSERT INTO `ingredient_kind` VALUES (77,'米','各种米.',14);
INSERT INTO `ingredient_kind` VALUES (78,'面条','各种面条.',14);
INSERT INTO `ingredient_kind` VALUES (79,'米线','各种米线.',14);
INSERT INTO `ingredient_kind` VALUES (80,'面粉','各种面粉.',14);
INSERT INTO `ingredient_kind` VALUES (81,'食用油','各种食用油.',14);
INSERT INTO `ingredient_kind` VALUES (82,'其他粮油','其他粮油聚集地.',14);
INSERT INTO `ingredient_kind` VALUES (83,'调味料','各种调味料.',15);
INSERT INTO `ingredient_kind` VALUES (84,'调味酱','各种调味酱.',15);
INSERT INTO `ingredient_kind` VALUES (85,'香料','各种香料.',15);
INSERT INTO `ingredient_kind` VALUES (86,'发酵粉','各种发酵粉.',15);
INSERT INTO `ingredient_kind` VALUES (87,'汤料/底料','各种汤料/底料.',15);
INSERT INTO `ingredient_kind` VALUES (88,'其他调味','其他调味聚集地.',15);

--
-- Table structure for table `ingredient_template`
--

DROP TABLE IF EXISTS `ingredient_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食材模板表主键',
  `name` varchar(255) NOT NULL COMMENT '',
  `fid` int(11) DEFAULT NULL COMMENT '上级分类id',
  `tid` int(11) DEFAULT NULL COMMENT '顶级分类id',
  `process_difficulty` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单',
  `health` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材的清淡程度分值,加分越多越重口味,加分越少越清淡',
  `ik_id` int(11) DEFAULT NULL COMMENT 'ingredient_kind表外键',
  PRIMARY KEY (`id`),
  KEY `ingredient_template_ingredient_kind_id_fk` (`ik_id`),
  CONSTRAINT `ingredient_template_ingredient_kind_id_fk` FOREIGN KEY (`ik_id`) REFERENCES `ingredient_kind` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='食材模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_template`
--

INSERT INTO `ingredient_template` VALUES (1,'猪',NULL,NULL,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (2,'猪头',1,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (3,'猪头肉',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (4,'核桃肉',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (5,'猪脑花',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (6,'猪脸肉(猪脸颊肉)',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (7,'猪鼻',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (8,'猪耳',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (9,'猪嘴',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (10,'猪舌',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (11,'梅花肉(猪梅肉,眉毛肉,风头皮肉,凤头皮肉)',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (12,'槽头肉(朝头肉,猪颈肉,血脖肉)',2,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (13,'猪腿',1,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (14,'猪前腿肉',13,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (15,'猪前肘肉(猪前大腿肉,猪前大腱子肉,猪前蹄膀)',14,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (16,'猪前小腿肉(猪前小腱子肉)',14,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (17,'前猪蹄(前脚爪,前猪脚,前猪手)',14,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (18,'猪后腿肉(弹子肉,拳头肉,元宝肉)',13,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (19,'猪后肘肉(猪后大腿肉,猪后大腱子肉,猪后蹄膀)',18,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (20,'猪后小腿肉(猪前小腱子肉)',18,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (21,'后猪蹄(后脚爪,后猪脚,后猪手)',18,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (22,'猪身',1,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (23,'猪里脊肉(猪内里脊肉)',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (24,'猪大里脊肉',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (25,'猪小里脊肉',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (26,'宝肋肉(猪外里脊肉,正保肋)',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (27,'五花肉(肋条肉,三层肉,二刀保肋)',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (28,'奶脯肉(下五花,拖泥肉,软窝)',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (29,'猪鞭(公猪生殖器)',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (30,'猪后臀尖(坐墩肉)',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (31,'猪尾巴',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (32,'猪二刀后臀尖(二刀肉,坐臀肉,坐板肉)',22,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (33,'猪杂(猪下水,猪杂碎)',1,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (34,'猪血',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (35,'猪黄喉(猪主动脉弓,猪心管)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (36,'猪心',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (37,'猪肺',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (38,'猪肝',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (39,'猪肚(猪胃)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (40,'猪腰子(猪肾)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (41,'猪横脷(猪脾脏)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (42,'猪小肚(猪膀胱,猪尿脬,猪脬子)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (43,'猪小肠',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (44,'猪粉肠(猪小肠前段)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (45,'猪苦肠(猪小肠后段)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (46,'猪肥肠(猪大肠)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (47,'猪生肠(母猪子宫,猪花肠)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (48,'猪蛋蛋(公猪睾丸)',33,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (49,'猪骨',1,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (50,'猪扇骨(猪肩胛骨)',49,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (51,'猪大排(猪通脊)',49,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (52,'猪肋排(猪排骨,猪小排,猪仔排)',49,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (53,'猪脊骨(猪脊椎,猪龙骨)',49,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (54,'猪大骨(猪筒骨,猪腿骨)',49,1,0.0,0.0,16);
INSERT INTO `ingredient_template` VALUES (55,'牛',NULL,NULL,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (56,'牛头',55,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (57,'牛头肉',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (58,'牛脑花',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (59,'牛面颊肉',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (60,'牛脖肉',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (61,'牛颈部肉',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (62,'牛鼻',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (63,'牛耳',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (64,'牛嘴',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (65,'牛舌',56,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (66,'牛腿',55,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (67,'牛前腱(牛金钱腱)',66,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (68,'牛前蹄(牛前爪)',66,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (69,'牛后腱',66,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (70,'牛后蹄(牛后爪)',66,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (71,'牛身',55,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (72,'牛前胸肉(肥牛)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (73,'牛上脑(牛梅花肉)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (74,'牛肩肉',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (75,'牛辣椒条肉(牛前柳)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (76,'牛后胸肉',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (77,'牛眼肉',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (78,'牛外脊(西冷,沙朗,肋眼)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (79,'牛里脊(牛柳,菲力)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (80,'牛肋条肉',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (81,'牛腹肉(牛腩肉)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (82,'牛鞭(公牛生殖器,牛冲)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (83,'牛臀肉(尾龙扒)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (84,'牛尾',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (85,'牛大米龙(牛三岔肉,针扒)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (86,'牛小米龙(烩扒)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (87,'牛大黄瓜条(底板)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (88,'牛小黄瓜条(白板,鲤鱼管)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (89,'牛霖肉(圆霖,和尚头,膝圆,牛林)',71,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (90,'牛杂',55,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (91,'牛血',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (92,'牛黄喉(牛主动脉弓,牛心管)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (93,'牛心',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (94,'牛肺',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (95,'牛肝',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (96,'牛毛肚(牛瘤胃,牛肚板,阳扇,草肚)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (97,'牛金钱肚(牛网胃,蜂巢胃,麻肚)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (98,'牛百叶肚(牛瓣胃,牛千层肚,肚尖)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (99,'牛肚(牛皱胃,阴扇)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (100,'牛腰子(牛肾)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (101,'牛横脷(牛脾脏)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (102,'牛小肚(牛膀胱,牛尿脬,牛脬子)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (103,'牛小肠',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (104,'牛粉肠(牛小肠前段)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (105,'牛苦肠(牛小肠后段)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (106,'牛肥肠(牛大肠)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (107,'牛生肠(母牛子宫,牛花肠)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (108,'牛蛋蛋(公牛睾丸,牛宝)',90,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (109,'牛骨',55,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (110,'牛扇骨(牛肩胛骨)',109,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (111,'牛大排',109,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (112,'牛肋排(牛排骨,牛小排,牛仔排)',109,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (113,'牛脊骨(牛脊椎,牛龙骨,牛腔骨)',109,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (114,'牛T骨排(牛丁骨排)',109,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (115,'牛大骨(牛筒骨,牛腿骨)',109,55,0.0,0.0,17);
INSERT INTO `ingredient_template` VALUES (116,'羊',NULL,NULL,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (117,'羊头',116,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (118,'羊头肉',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (119,'羊脑花',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (120,'羊面颊肉',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (121,'羊脖肉',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (122,'羊颈部肉',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (123,'羊鼻',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (124,'羊耳',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (125,'羊嘴',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (126,'羊舌',117,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (127,'羊腿',116,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (128,'羊前腱(羊金钱腱)',127,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (129,'羊前蹄(羊前爪)',127,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (130,'羊后腱',127,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (131,'羊后蹄(羊后爪)',127,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (132,'羊身',116,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (133,'羊前胸肉',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (134,'羊上脑(羊梅花肉)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (135,'羊肩肉',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (136,'羊辣椒条肉(羊前柳)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (137,'羊后胸肉',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (138,'羊眼肉',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (139,'羊外脊(羊纽约克,羊沙朗,羊肋眼)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (140,'羊里脊(羊柳,羊菲力)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (141,'羊腹肋肉',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (142,'羊腹肉(羊腩肉)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (143,'羊鞭(公羊生殖器,羊冲)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (144,'羊臀肉(尾羊扒)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (145,'羊尾',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (146,'羊大米龙(羊三岔肉,针扒)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (147,'羊小米龙(烩扒)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (148,'羊大黄瓜条(底板)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (149,'羊小黄瓜条(白板,鲤鱼管)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (150,'羊霖肉(圆霖,和尚头,膝圆,羊林)',132,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (151,'羊杂',116,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (152,'羊血',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (153,'羊黄喉(羊主动脉弓,羊心管)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (154,'羊心',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (155,'羊肺',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (156,'羊肝',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (157,'羊毛肚(羊瘤胃,羊肚板,阳扇,草肚)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (158,'羊金钱肚(羊网胃,蜂巢胃,麻肚)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (159,'羊百叶肚(羊瓣胃,羊千层肚,肚尖)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (160,'羊肚(羊皱胃,阴扇)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (161,'羊腰子(羊肾)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (162,'羊横脷(羊脾脏)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (163,'羊小肚(羊膀胱,羊尿脬,羊脬子)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (164,'羊小肠',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (165,'羊粉肠(羊小肠前段)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (166,'羊苦肠(羊小肠后段)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (167,'羊肥肠(羊大肠)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (168,'羊生肠(母羊子宫,羊花肠)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (169,'羊蛋蛋(公羊睾丸,羊宝)',151,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (170,'羊骨',116,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (171,'羊扇骨(羊肩胛骨)',170,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (172,'羊大排',170,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (173,'羊肋排(羊排骨,羊小排,羊仔排)',170,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (174,'羊脊骨(羊脊椎,羊龙骨,羊蝎子,羊腔骨)',170,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (175,'羊T骨排(羊丁骨排)',170,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (176,'羊大骨(羊筒骨,羊腿骨)',170,116,0.0,0.0,18);
INSERT INTO `ingredient_template` VALUES (177,'兔',NULL,NULL,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (178,'兔头',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (179,'兔前腿',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (180,'兔身',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (181,'兔里脊',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (182,'兔腩',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (183,'兔后腿',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (184,'兔架',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (185,'兔排',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (186,'兔皮',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (187,'兔杂',177,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (188,'兔血',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (189,'兔心',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (190,'兔肺',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (191,'兔肝',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (192,'兔肚(兔胃)',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (193,'兔腰子(兔肾)',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (194,'兔小肠',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (195,'兔粉肠(兔小肠前段)',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (196,'兔肥肠(兔大肠)',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (197,'兔睾丸',187,177,0.0,0.0,19);
INSERT INTO `ingredient_template` VALUES (198,'鸡',NULL,NULL,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (199,'鸡血(鸡红)',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (200,'鸡头',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (201,'鸡脖',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (202,'鸡胸',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (203,'鸡架',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (204,'鸡屁股(鸡尖(中国北方),鸡尖翅)',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (205,'鸡爪(鸡掌,凤爪,凤足)',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (206,'鸡杂',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (207,'鸡心',206,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (208,'鸡胗(鸡肫,鸡郡肝,鸡胃)',206,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (209,'鸡肝',206,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (210,'鸡肠',206,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (211,'鸡睾丸(鸡肾)',206,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (212,'鸡翅',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (213,'鸡翅根',212,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (214,'鸡翅中',212,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (215,'鸡翅尖(鸡尖(中国南方)',212,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (216,'鸡腿',198,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (217,'鸡大腿',216,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (218,'鸡小腿(琵琶腿)',216,198,0.0,0.0,23);
INSERT INTO `ingredient_template` VALUES (219,'鸭',NULL,NULL,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (220,'鸭血',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (221,'鸭头',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (222,'鸭舌',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (223,'鸭脖',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (224,'鸭胸',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (225,'鸭架',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (226,'鸭掌(鸭爪)',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (227,'鸭屁股(鸭尖翅)',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (228,'鸭杂',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (229,'鸭心',228,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (230,'鸭胗(鸭肫,鸭郡肝,鸭胃)',228,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (231,'鸭肝',228,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (232,'鸭肠',228,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (233,'鸭睾丸(鸭肾)',228,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (234,'鸭翅',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (235,'鸭翅根',234,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (236,'鸭翅中',234,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (237,'鸭翅尖',234,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (238,'鸭腿',219,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (239,'鸭大腿',238,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (240,'鸭小腿',238,219,0.0,0.0,24);
INSERT INTO `ingredient_template` VALUES (241,'鹅',NULL,NULL,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (242,'鹅血',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (243,'鹅头',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (244,'鹅脖',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (245,'鹅胸',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (246,'鹅架',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (247,'鹅掌(鹅爪)',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (248,'鹅屁股(鹅尖翅)',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (249,'鹅杂',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (250,'鹅心',249,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (251,'鹅胗(鹅肫,鹅郡肝,鹅胃)',249,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (252,'鹅肝(鹅肥肝)',249,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (253,'鹅肠',249,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (254,'鹅睾丸(鹅肾)',249,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (255,'鹅翅',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (256,'鹅翅根',255,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (257,'鹅翅中',255,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (258,'鹅翅尖',255,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (259,'鹅腿',241,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (260,'鹅大腿',259,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (261,'鹅小腿',259,241,0.0,0.0,25);
INSERT INTO `ingredient_template` VALUES (262,'鸽',NULL,NULL,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (263,'鸽血',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (264,'鸽头',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (265,'鸽脖',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (266,'鸽胸',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (267,'鸽架',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (268,'鸽掌(鸽爪)',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (269,'鸽屁股(鸽尖翅)',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (270,'鸽杂',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (271,'鸽心',270,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (272,'鸽胗(鸽肫,鸽郡肝,鸽胃)',270,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (273,'鸽肝(鸽肥肝)',270,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (274,'鸽肠',270,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (275,'鸽睾丸(鸽肾)',270,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (276,'鸽翅',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (277,'鸽翅根',276,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (278,'鸽翅中',276,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (279,'鸽翅尖',276,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (280,'鸽腿',262,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (281,'鸽大腿',280,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (282,'鸽小腿',280,262,0.0,0.0,26);
INSERT INTO `ingredient_template` VALUES (283,'鹌鹑',NULL,NULL,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (284,'鹌鹑血',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (285,'鹌鹑头',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (286,'鹌鹑脖',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (287,'鹌鹑胸',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (288,'鹌鹑架',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (289,'鹌鹑掌(鹌鹑爪)',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (290,'鹌鹑屁股(鹌鹑尖翅)',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (291,'鹌鹑杂',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (292,'鹌鹑心',291,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (293,'鹌鹑胗(鹌鹑肫,鹌鹑郡肝,鹌鹑胃)',291,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (294,'鹌鹑肝(鹌鹑肥肝)',291,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (295,'鹌鹑肠',291,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (296,'鹌鹑睾丸(鹌鹑肾)',291,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (297,'鹌鹑翅',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (298,'鹌鹑翅根',297,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (299,'鹌鹑翅中',297,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (300,'鹌鹑翅尖',297,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (301,'鹌鹑腿',283,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (302,'鹌鹑大腿',301,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (303,'鹌鹑小腿',301,283,0.0,0.0,27);
INSERT INTO `ingredient_template` VALUES (304,'鱼',NULL,NULL,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (305,'鱼头',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (306,'鱼身',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (307,'鱼肉',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (308,'鱼硬边',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (309,'鱼柳',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (310,'鱼骨',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (311,'鱼软边',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (312,'鱼腹',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (313,'鱼腩',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (314,'鱼籽(鱼蛋)',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (315,'鱼鳔(鱼泡)',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (316,'鱼鳍',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (317,'鱼皮',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (318,'鱼尾',304,304,0.0,0.0,37);
INSERT INTO `ingredient_template` VALUES (319,'鱼',NULL,NULL,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (320,'鱼头',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (321,'鱼身',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (322,'鱼肉',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (323,'鱼硬边',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (324,'鱼柳',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (325,'鱼骨',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (326,'鱼软边',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (327,'鱼腹',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (328,'鱼腩',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (329,'鱼籽(鱼蛋)',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (330,'鱼鳔(鱼泡)',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (331,'鱼鳍',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (332,'鱼皮',319,319,0.0,0.0,38);
INSERT INTO `ingredient_template` VALUES (333,'鱼尾',319,319,0.0,0.0,38);

--
-- Table structure for table `ingredient_type`
--

DROP TABLE IF EXISTS `ingredient_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食材类型表主键',
  `name` varchar(255) NOT NULL COMMENT '食材类型名称',
  `ik_id` int(11) DEFAULT NULL COMMENT 'ingredient_kind表外键'
  PRIMARY KEY (`id`),
  KEY `ingredient_type_ingredient_kind_id_fk` (`ik_id`),
  CONSTRAINT `ingredient_type_ingredient_kind_id_fk` FOREIGN KEY (`ik_id`) REFERENCES `ingredient_kind` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='食材类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_type`
--

INSERT INTO `ingredient_type` VALUES (1,'大白猪(大约克夏猪,英国大白猪)',16);
INSERT INTO `ingredient_type` VALUES (2,'民猪(东北民猪)',16);
INSERT INTO `ingredient_type` VALUES (3,'八眉猪(泾川猪)',16);
INSERT INTO `ingredient_type` VALUES (4,'成华猪',16);
INSERT INTO `ingredient_type` VALUES (5,'黄牛',17);
INSERT INTO `ingredient_type` VALUES (6,'牦牛',17);
INSERT INTO `ingredient_type` VALUES (7,'和牛',17);
INSERT INTO `ingredient_type` VALUES (8,'安格斯牛',17);
INSERT INTO `ingredient_type` VALUES (9,'夏洛来牛',17);
INSERT INTO `ingredient_type` VALUES (10,'利木赞牛',17);
INSERT INTO `ingredient_type` VALUES (11,'山羊',18);
INSERT INTO `ingredient_type` VALUES (12,'绵羊',18);
INSERT INTO `ingredient_type` VALUES (13,'野羊',18);
INSERT INTO `ingredient_type` VALUES (14,'肉兔(皮肉兔,皮兔,实验兔,菜兔)',19);
INSERT INTO `ingredient_type` VALUES (15,'蒙古兔(草原兔,中亚兔,跳猫)',19);
INSERT INTO `ingredient_type` VALUES (16,'东北兔(草兔,山兔,黑兔子,山跳子,海角野兔,阿拉伯野兔,布朗野兔,沙漠野兔)',19);
INSERT INTO `ingredient_type` VALUES (17,'高原兔(灰尾兔,长毛兔,绒毛兔)',19);
INSERT INTO `ingredient_type` VALUES (18,'华南兔(短耳兔,粗毛兔)',19);
INSERT INTO `ingredient_type` VALUES (19,'野兔',19);
INSERT INTO `ingredient_type` VALUES (20,'乌骨鸡(竹丝鸡,矮脚鸡,乌鸡)',23);
INSERT INTO `ingredient_type` VALUES (21,'三黄鸡',23);
INSERT INTO `ingredient_type` VALUES (22,'芦花鸡',23);
INSERT INTO `ingredient_type` VALUES (23,'雪鸡',23);
INSERT INTO `ingredient_type` VALUES (24,'七彩锦鸡(山鸡,雏鸡,野鸡)',23);
INSERT INTO `ingredient_type` VALUES (25,'大麻鸭(大绿头,大红腿鸭,官鸭,对鸭,青边,野鸭)',24);
INSERT INTO `ingredient_type` VALUES (26,'斑嘴鸭(中华斑嘴鸭,中国斑嘴鸭,东方斑嘴鸭)',24);
INSERT INTO `ingredient_type` VALUES (27,'北京鸭',24);
INSERT INTO `ingredient_type` VALUES (28,'狮头鹅',25);
INSERT INTO `ingredient_type` VALUES (29,'溆浦鹅',25);
INSERT INTO `ingredient_type` VALUES (30,'浙东白鹅',25);
INSERT INTO `ingredient_type` VALUES (31,'皖西白鹅',25);
INSERT INTO `ingredient_type` VALUES (32,'朗德鹅',25);
INSERT INTO `ingredient_type` VALUES (33,'莱茵鹅',25);
INSERT INTO `ingredient_type` VALUES (34,'鳙鱼(花鲢,黑鲢,鱃鱼,皂包头,皂鲢,黑包头鱼,鳙头鲢,包头鱼,大头鱼,胖头鱼)',37);
INSERT INTO `ingredient_type` VALUES (35,'鲢鱼(鲢子,白鲢,边鱼)',37);
INSERT INTO `ingredient_type` VALUES (36,'鲩鱼(草鱼,油鲩,草鲩,白鲩,乌青,草苞,草根,混子)',37);
INSERT INTO `ingredient_type` VALUES (37,'青鱼(鲭,乌鲭,青鲩,乌青,溪鱼,溜子)',37);
INSERT INTO `ingredient_type` VALUES (38,'鲫鱼',37);
INSERT INTO `ingredient_type` VALUES (39,'鲶鱼(塘虱,胡子鲢,黏鱼,塘鲺鱼,生仔鱼,活的子,鲶柺鱼,鲇鱼)',37);
INSERT INTO `ingredient_type` VALUES (40,'黄颡鱼(黄颡鱼,黄姑子,黄沙古,黄角丁,黄辣丁,黄刺骨,黄骨鱼,刺黄股,昂刺,昂公)',37);
INSERT INTO `ingredient_type` VALUES (41,'鲈鱼(花鲈,鲈板,花寨,鲈子鱼,七星鲈)',37);
INSERT INTO `ingredient_type` VALUES (42,'武昌鱼(团头鲂,鳊鱼,草鳊,缩项鳊)',37);
INSERT INTO `ingredient_type` VALUES (43,'钳鱼(钳猫,斑点叉尾鮰)',37);

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食材表主键',
  `name` varchar(255) NOT NULL COMMENT '食材名称',
  `fid` int(11) DEFAULT NULL COMMENT '上级id',
  `ik_id` int(11) DEFAULT NULL COMMENT 'ingredient_kind表外键',
  `it_id` int(11) DEFAULT NULL COMMENT 'ingredient_type表外键',
  `process_difficulty` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单',
  `health` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材的清淡程度分值,加分越多越重口味,加分越少越清淡',
  PRIMARY KEY (`id`),
  KEY `ingredient_ingredient_kind_id_fk` (`ik_id`),
  KEY `ingredient_ingredient_type_id_fk` (`it_id`),
  CONSTRAINT `ingredient_ingredient_kind_id_fk` FOREIGN KEY (`ik_id`) REFERENCES `ingredient_kind` (`id`),
  CONSTRAINT `ingredient_ingredient_type_id_fk` FOREIGN KEY (`it_id`) REFERENCES `ingredient_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='食材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` VALUES (1,'食用油',NULL,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (2,'橄榄油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (3,'山茶油(茶油,山茶籽油,油茶籽油)',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (4,'亚麻籽油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (5,'紫苏子油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (6,'山核桃油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (7,'菜籽油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (8,'花生油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (9,'花椒油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (10,'香油(芝麻油)',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (11,'椰子油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (12,'棕榈油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (13,'米糠油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (14,'葵花籽油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (15,'茶籽油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (16,'小麦胚芽油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (17,'玉米油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (18,'大豆油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (19,'黄油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (20,'猪油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (21,'牛油',1,81,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (22,'盐',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (23,'井盐',22,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (24,'池盐(湖盐)',22,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (25,'海盐',22,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (26,'岩盐(矿盐)',22,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (27,'椒盐',22,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (28,'欧芹大蒜盐',22,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (29,'酱油(豉油)',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (30,'酱油膏',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (31,'海鲜酱油',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (32,'红烧酱油',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (33,'日本酱油',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (34,'浓口酱油',33,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (35,'淡口酱油',33,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (36,'溜酱油',33,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (37,'再发酵酱油(甘露酱油)',33,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (38,'白酱油(无色酱油)',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (39,'日式白酱油',38,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (40,'西式白酱油',38,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (41,'头抽',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (42,'生抽',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (43,'老抽',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (44,'红酱油',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (45,'辣酱油(辣醋酱油)',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (46,'味极鲜',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (47,'油醋汁',29,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (48,'鱼露',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (49,'鸡汁',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (50,'蚝油',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (51,'醋',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (52,'陈醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (53,'香醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (54,'白醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (55,'米醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (56,'白米醋',55,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (57,'红米醋',55,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (58,'麸醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (59,'熏醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (60,'谷薯醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (61,'果醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (62,'糖醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (63,'酒醋',51,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (64,'糖',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (65,'白糖(白砂糖)',64,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (66,'红糖',64,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (67,'冰糖',64,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (68,'味精',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (69,'鸡粉',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (70,'鸡精',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (71,'料酒',NULL,83,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (72,'豆瓣酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (73,'甜面酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (74,'番茄酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (75,'芝麻酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (76,'花生酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (77,'沙拉酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (78,'黄豆酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (79,'辣椒酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (80,'鲜椒酱',79,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (81,'烧椒酱',79,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (82,'双椒酱',79,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (83,'烧烤酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (84,'果酱',NULL,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (85,'苹果酱',84,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (86,'草莓酱',84,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (87,'蓝莓酱',84,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (88,'凤梨酱',84,84,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (89,'干辣椒',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (90,'花椒',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (91,'麻椒',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (92,'八角(大茴香,大料)',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (93,'胡椒',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (94,'黑胡椒(黑胡椒粉,黑胡椒面)',93,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (95,'白胡椒(白胡椒粉,白胡椒面)',93,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (96,'香叶',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (97,'沉香',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (98,'丁香',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (99,'千里香',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (100,'桂皮',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (101,'桂丁',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (102,'陈皮',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (103,'丹皮',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (104,'当归',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (105,'党参',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (106,'白芷',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (107,'黄芪',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (108,'荜拨',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (109,'甘草',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (110,'木香',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (111,'黄栀子',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (112,'枳壳',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (113,'罗汉果',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (114,'五加皮',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (115,'柠檬干',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (116,'排草',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (117,'山奈',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (118,'山黄皮',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (119,'白芍',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (120,'香菜籽',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (121,'香砂',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (122,'甘松',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (123,'辛夷',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (124,'阳春砂',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (125,'罗勒',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (126,'莳萝',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (127,'荆芥',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (128,'干薄荷叶',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (129,'藿香',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (130,'桂枝',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (131,'白果',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (132,'一口钟(红喇叭花)',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (133,'桂花',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (134,'玉竹',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (135,'砂仁',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (136,'川芎',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (137,'香茅草',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (138,'紫苏叶',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (139,'姜黄',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (140,'良姜',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (141,'草蔻',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (142,'白蔻',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (143,'红豆蔻',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (144,'肉蔻',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (145,'草果',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (146,'香果',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (147,'小茴香',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (148,'孜然(孜然面)',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (149,'咖喱粉',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (150,'辣椒粉',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (151,'五香粉',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (152,'十三香',NULL,85,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (153,'牛奶',NULL,21,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (154,'羊奶',NULL,21,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (155,'奶油',NULL,22,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (156,'奶酪',NULL,22,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (157,'黄油',NULL,22,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (158,'鸡蛋',NULL,29,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (159,'鸭蛋',NULL,29,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (160,'鹅蛋',NULL,29,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (161,'鸽子蛋',NULL,29,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (162,'鹌鹑蛋',NULL,29,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (163,'皮蛋(松花蛋,灰包蛋,包蛋,变蛋)',NULL,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (164,'变蛋(鸡蛋)',165,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (165,'皮蛋(鸭蛋)',165,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (166,'皮蛋(鹅蛋)',165,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (167,'咸蛋(盐蛋)',NULL,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (168,'咸鸡蛋(盐鸡蛋)',169,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (169,'咸鸭蛋(盐鸭蛋)',169,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (170,'咸鹅蛋(盐鹅蛋)',169,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (171,'盐皮蛋',169,31,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (172,'大白菜(黄芽菜,白菜,结球白菜,包心白菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (173,'小白菜(青菜,不结球白菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (174,'圆白菜(甘蓝,包菜,莲花白,卷心菜,牛心菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (175,'紫甘蓝(红甘蓝,赤甘蓝,紫苞菜,红卷心菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (176,'油菜(欧洲油菜,油麻菜籽,麻油菜籽,甘蓝型油菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (177,'红油菜(红菜薹,紫菜薹,红油菜薹)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (178,'白油菜(白菜薹,水白菜花,菜心)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (179,'油麦菜(凤尾,油荬,香水生菜,莜麦菜,苦菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (180,'莴笋(青笋,茎用莴苣,莴苣笋,莴菜,香莴笋,千金菜,莴苣菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (181,'苕尖(红薯叶,地瓜叶)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (182,'菠菜(波斯菜,菠薐,菠柃,鹦鹉菜,红根菜,飞龙菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (183,'瓢儿白(上海青,上海白菜,苏州青,青江菜,青姜菜,小棠菜,青梗白菜,青江白菜,青菜,瓢菜,瓶菜,小油菜,汤勺菜,汤匙菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (184,'娃娃菜',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (185,'豆腐菜(落葵,软浆叶,木耳菜,藤菜,潺菜,紫葵,胭脂菜,蓠芭菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (186,'空心菜(藤藤菜,蕹菜,通菜蓊,蓊菜,通菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (187,'黄花菜(金针菜,柠檬萱草,忘忧草,萱草,萱草花,健脑菜,安神菜,绿葱花)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (188,'汉菜(苋菜,青香苋,红苋菜,红菜,米苋,玉米菜,千菜谷,荇菜,寒菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (189,'生菜(叶用莴苣,鹅仔菜,莴仔菜,唛仔菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (190,'芹菜(胡芹)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (191,'香菜(芫荽,胡荽,香荽)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (192,'花椰菜(花菜,菜花,椰菜花,甘蓝花,洋花菜,球花甘蓝)',NULL,66,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (193,'西兰花(青花菜,绿花菜,绿菜花,绿花椰菜)',NULL,66,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (194,'豆瓣菜(西洋菜,水田芥,凉菜,耐生菜,水芥,水蔊菜,穷人菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (195,'马齿苋(马苋,五行草,长命菜,五方草,瓜子菜,麻绳菜,马齿菜,蚂蚱菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (196,'马兰头(马兰,马莱,马郎头,红梗菜,鸡儿菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (197,'刺老芽(龙牙楤木,刺龙牙,刺老鸦)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (198,'芥菜(盖菜,芥,挂菜,橄榄菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (199,'芥兰(抬抬菜,白花芥蓝,绿叶甘蓝,芥兰,芥蓝菜,盖菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (200,'霸王花(剑花,霸王鞭,量天尺花,风雨花，昙花，七星剑花)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (201,'荠菜(扁锅铲菜,荠荠菜,地丁菜,地菜,荠,靡草,花花菜,菱角菜,地米菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (202,'梅菜(梅菜,天堂梅菜,富贵菜,惠州贡菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (203,'梅干菜(梅菜干)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (204,'萝卜苗',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (205,'萝卜叶',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (206,'苜蓿(金花菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (207,'芝麻菜(臭菜,东北臭菜,火箭生菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (208,'刺儿菜(小蓟,青青草,蓟蓟草,刺狗牙,刺蓟,枪刀菜,小恶鸡婆)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (209,'芦荟(库拉索芦荟,中华芦荟,油葱,洋芦荟,翠叶芦荟,美国芦荟)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (210,'枸杞芽(枸杞头,枸芽子,甜菜头)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (211,'蒲菜(深蒲,蒲荔久,蒲笋,蒲芽,蒲白,蒲儿根,蒲儿菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (212,'茼蒿(同蒿,蓬蒿,蒿菜,桐花菜,菊花菜,塘蒿,蒿子杆,蒿子,鹅菜,义菜,蓬花菜,皇帝菜)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (213,'藜蒿(蒌蒿,水蒿,柳叶蒿,驴蒿,藜蒿,香艾,小艾,水艾,蒿苔)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (214,'龙蒿(狭叶青蒿狭叶,蛇蒿,椒蒿,青蒿)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (215,'槐米(白槐,槐花米,槐籽)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (216,'苦菊(狗牙生菜,九芽生菜,苦荬菜,栽培菊苣)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (217,'罗勒(九层塔,金不换,圣约瑟夫草,甜罗勒,兰香)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (218,'香椿(香椿芽,香桩头,大红椿树,椿天,香椿铃,香铃子,香椿子)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (219,'茴香菜(香丝菜,小茴香,茴香子,谷香,浑香,怀香,怀香籽)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (220,'龙虎叶(紫背天葵,天葵秋海棠,散血子)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (221,'菊花脑',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (222,'雪里蕻(叶用芥菜,雪里红,辣菜,雪菜,春不老,霜不老)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (223,'嫩南瓜(西葫芦,西葫,熊瓜,白瓜,番瓜美洲南瓜,小瓜,菜瓜,荨瓜,熏瓜,雄瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (224,'南瓜(倭瓜,番瓜,饭瓜,番南瓜,北瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (225,'黄瓜(胡瓜,刺瓜,王瓜,勤瓜,青瓜,唐瓜,吊瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (226,'苦瓜(癞葡萄,凉瓜,锦荔枝,癞瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (227,'丝瓜(胜瓜,菜瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (228,'冬瓜(白瓜,白东瓜皮,白冬瓜,白瓜皮,白瓜子,地芝,东瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (229,'小青瓜(荷兰瓜,荷兰小黄瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (230,'佛手瓜(千金瓜,隼人瓜,安南瓜,寿瓜,丰收瓜,洋瓜,合手瓜,捧瓜,土耳瓜,棚瓜,虎儿瓜,窝瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (231,'蒲瓜(葫芦,扁蒲,蒲仔,瓠子,瓠瓜,匏仔,陈蒲瓜,付瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (232,'方瓜(番瓜,番蒲,倭瓜,北瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (233,'笋瓜(北瓜,玉瓜,大洋瓜,东南瓜,搅丝瓜,印度南瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (234,'蛇瓜',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (235,'瓠瓜',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (236,'笋瓜(北瓜,玉瓜,大洋瓜,南瓜,搅丝瓜,印度南瓜)',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (237,'节瓜',NULL,67,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (238,'大番茄(蕃柿,西红柿,洋柿子)',NULL,68,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (239,'小番茄(圣女果,小柿子,小西红柿,小番茄果,樱桃番茄)',NULL,68,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (240,'茄子(矮瓜,白茄,吊菜子,落苏,紫茄)',NULL,68,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (241,'黄葵(黄秋葵,秋葵,越南芝麻,羊角豆,糊麻,补肾菜)',NULL,68,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (242,'朝天椒(小辣椒,望天椒,望天猴,指天椒)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (243,'小米辣(小辣椒,小海椒)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (244,'青辣椒(二荆条,二金条)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (245,'灯笼椒(太空椒,柿子椒,彩椒,大椒,甜椒,菜椒)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (246,'螺丝椒',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (247,'羊角椒',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (248,'土豆(洋芋,荷兰薯,地蛋,薯仔,番仔薯,山药蛋,洋山芋,洋芋头,香山芋,洋番芋,山洋芋,阳芋)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (249,'红薯(番薯,甘储,甘薯,朱薯,金薯,番茹,红山药,玉枕薯,山芋,地瓜,甜薯,红苕,白薯,阿鹅,萌番薯)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (250,'紫薯(黑薯,紫心甘薯,苕薯,紫肉甘薯)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (251,'山药(薯蓣,怀山药,淮山药,土薯,山薯,玉延,山芋,野薯,白山药)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (252,'芋头(水芋,芋岌,毛艿,毛芋,青皮叶,接骨草,独皮叶)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (253,'白萝卜(土人参,菜菔,菜头)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (254,'胡萝卜(金笋,胡芦菔,红芦菔,丁香萝卜,红萝卜,甘荀)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (255,'红萝卜(大红萝卜,东北红萝卜)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (256,'青萝卜',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (257,'红心萝卜(心里美萝卜,冰糖萝卜,胭脂红)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (258,'芜菁(大头菜,大头芥)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (259,'春笋(竹笋,笋,竹萌,竹芽,生笋)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (260,'竹笋(夏笋)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (261,'冬笋',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (262,'芦笋(露笋)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (263,'魔芋(蒟蒻,磨芋,蒻头,鬼芋,花梗莲,虎掌)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (264,'藕(莲藕)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (265,'藕带(藕鞭,藕丝菜,银苗菜,藕心菜,藕梢,藕带,藕苗,藕簪,藕梢子,藕笋)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (266,'牛蒡(大力子,恶实,牛蒡子)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (267,'菱角(芰,水菱,风菱,乌菱,菱角,水栗,菱实,芰实)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (268,'苤蓝(球茎甘蓝,擘蓝,玉蔓菁,撇列,不留客,人头疙瘩,土苤,茄莲)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (269,'荸荠(马蹄,水栗,芍,凫茈,乌芋,菩荠,地栗,钱葱,土栗,刺龟儿)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (270,'慈菇(刀草,燕尾草,蔬卵)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (271,'红菜头(火焰菜,红根甜菜,紫菜头)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (272,'藠头(荞头,荞子)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (273,'豆角',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (274,'豆荚',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (275,'豌豆(青豆,麦豌豆,寒豆,雪豆,毕豆,麻累,荷兰豆,回鹘豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (276,'黄豆(青仁乌豆,大豆,泥豆,马料豆,秣食豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (277,'绿豆(青小豆,菉豆,植豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (278,'红豆(鸡母珠,美人豆,相思豆,红珠木,八重山珊瑚,黑头小鸡)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (279,'赤小豆(红小豆,赤豆,朱豆,红赤小豆,红赤豆,小豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (280,'黑豆(乌豆,枝仔豆,黑大豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (281,'大白芸豆(京豆,白豆,大白豆,大四季豆米)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (282,'扁豆(火镰扁豆,膨皮豆,藤豆,沿篱豆,鹊豆,皮扁豆,白扁豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (283,'蚕豆(南豆,胡豆,佛豆,罗汉豆,兰花豆,坚豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (284,'毛豆(菜用大豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (285,'猫眼豆(熊猫豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (286,'花豆(老虎豆,肾豆,圣豆,皇帝豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (287,'豇豆(角豆,姜豆,带豆,江豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (288,'刀豆(挟剑豆,野刀板藤,葛豆,刀豆角,刀板豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (289,'芸豆(菜豆,四季豆,芸豆,白芸豆,花云豆,隐元豆,龙爪豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (290,'竹豆(爬山豆,巴山豆,饭豆)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (291,'山药豆(零余子,山药籽,山药蛋,山药铃)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (292,'绿豆芽(豆芽菜)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (293,'黄豆芽(黄豆种子芽,黄豆芽菜)',NULL,70,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (294,'豌豆尖(豌豆颠,豌豆苗,龙须苗,龙须菜,荷兰豆苗)',NULL,65,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (295,'白蘑菇(双孢蘑菇,二孢蘑菇,蘑菇,洋蘑菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (296,'木耳(黑菜,黑木耳,云耳)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (297,'平菇(侧耳,北风菌,秀珍菇,糙皮侧耳,蚝菇,黑牡丹菇,秀珍菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (298,'香菇(花蕈,香信,椎茸,冬菰,厚菇,花菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (299,'鲍鱼菇(台湾平菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (300,'黑菇(烟色红菇,火炭菌,牛屎菇,木炭菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (301,'金针菇(冬菇,朴菇,构菌,青杠菌,毛柄金线菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (302,'杏鲍菇(刺芹侧耳,刺芹菇,雪茸)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (303,'茶树菇(柱状田头菇,杨树菇,茶薪菇,柱状环锈伞,柳松菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (304,'鸡腿菇(刺蘑菇,毛头鬼伞,毛鬼伞)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (305,'猴头菇(猴头菌,猴头蘑,刺猬菌,猬菌,猴菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (306,'蟹味菇(玉蕈,斑玉蕈,荷叶离褶伞,真姬菇,海鲜菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (307,'松乳菇(美味松乳菇,松树蘑,松菌,枞树菇,茅草菇,嘎吱蘑)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (308,'草菇(美味草菇,美味苞脚菇,兰花菇,秆菇,麻菇,中国菇,小包脚菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (309,'竹笋菌(竹笙,竹菌,竹松,竹萼,竹荪)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (310,'红菌菇(红菇,红蘑菇,大朱菇,真红菇,大红菇,红椎菌,大红菌,月子红,血红铆钉菇,肉蘑,松蘑)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (311,'银耳(白木耳,雪耳,银耳子)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (312,'金耳菌(橙黄银耳,黄金银耳,脑形银耳,黄木耳,金木耳,胶耳)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (313,'猪肚菌(大杯伞,大漏斗菌,猪肚菇,笋菇,红银盘,猪肚菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (314,'乳牛肝菌',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (315,'白牛肝菌(美味牛肝菌,牛肝菌,大腿蘑,大脚蘑,网纹牛肝菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (316,'黑牛肝菌(枣铜色牛肝菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (317,'红牛肝菌(手见青)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (318,'黄牛肝菌(老虎头)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (319,'羊肚菌(羊肚蘑,编笠菌,羊肚菜)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (320,'鸡油菌(鸡油蘑,鸡蛋黄菌,杏菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (321,'雪莲菌(藏灵菇,西藏雪莲,天山雪莲菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (322,'松茸菌(松茸,大花菌,松菌,松口蘑,松蕈,合菌,台菌,剥皮菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (323,'鸡枞菌(伞把菇,鸡肉丝菇,鸡肉菌,鸡脚蘑菇,蚁棕,斗鸡公,三塔菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (324,'青头菌(变绿红菇,青冈菌,绿豆菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (325,'口蘑(白蘑)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (326,'元蘑(冬蘑,元蘑,黄蘑,晚生北风菌,亚侧耳)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (327,'榛蘑(蜜蘑,栎蘑,根腐菌,蜜环菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (328,'滑子蘑(光帽鳞伞,珍珠菇,滑菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (329,'重阳菌(雁鹅菌,雁来蕈,松乳菇,松树蘑,松菌,雁来菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (330,'榆黄蘑(金顶侧耳,金顶蘑,玉皇蘑,黄金菇)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (331,'榛蘑(蜜蘑,栎蘑,根腐菌,蜜环菌)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (332,'地衣(当道,浮以,马昔,牛遗,牛舌,车轮草,癞肚皮)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (333,'虫草花(蛹虫草,北冬虫夏草,北蛹虫草,北虫草,蛹草,冬虫夏草,冬虫草)',NULL,71,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (334,'洋葱(球葱,圆葱,玉葱,葱头,荷兰葱,皮牙子)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (335,'大葱(青葱,事菜)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (336,'小葱(香葱,绵葱,火葱,四季葱,细米葱)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (337,'韭菜(韭,山韭,长生韭,丰本,扁菜,懒人菜,草钟乳,起阳草,韭芽,壮阳草,扁菜)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (338,'韭黄',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (339,'大蒜(蒜,蒜头,胡蒜)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (340,'独蒜(独头蒜,独瓣蒜)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (341,'青蒜(蒜苗)',NULL,72,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (342,'蒜薹(蒜苔,蒜毫)',NULL,69,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (343,'糯米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (344,'黑米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (345,'小米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (346,'紫米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (347,'薏米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (348,'西米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (349,'黄米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (350,'红曲米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (351,'红米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (352,'糙米',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (353,'芝麻',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (354,'麦芽',NULL,75,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (355,'谷芽',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (356,'青稞',NULL,75,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (357,'糯(鸭血糯)',NULL,74,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (358,'荞麦(净肠草,乌麦,三角麦)',NULL,75,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (359,'燕麦',NULL,75,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (360,'大麦',NULL,75,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (361,'苦荞麦粉',NULL,75,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (362,'高筋面粉',NULL,80,NULL,0.0,0.0);
INSERT INTO `ingredient` VALUES (363,'低筋面粉',NULL,80,NULL,0.0,0.0);

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜系主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜系名称',
  `description` text NOT NULL COMMENT '菜系描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜系分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

INSERT INTO `cuisine` VALUES (1,'鲁菜','口味咸鲜为主，讲究原料质地优良，以盐提鲜，以汤壮鲜，调味讲求咸鲜纯正，突出本味。咸鲜为主火候精湛，精于制汤，善烹海味。');
INSERT INTO `cuisine` VALUES (2,'川菜','口味麻辣为主，菜式多样，口味清鲜醇浓并重，以善用麻辣调味（鱼香、麻辣、辣子、陈皮、椒麻、怪味、酸辣诸味）。');
INSERT INTO `cuisine` VALUES (3,'苏菜','口味清淡为主，用料严谨，注重配色，讲究造型，四季有别。烹调技艺以炖、焖、煨著称；重视调汤，保持原汁，口味平和。善用蔬菜。其中淮扬菜，讲究选料和刀工，擅长制汤；苏南菜口味偏甜，注重制酱油，善用香糟、黄酒调味。');
INSERT INTO `cuisine` VALUES (4,'粤菜','口味鲜香为主，选料精细，清而不淡，鲜而不俗，嫩而不生，油而不腻。擅长小炒，要求掌握火候和油温恰到好处。还兼容许多西菜做法，讲究菜的气势、档次。');
INSERT INTO `cuisine` VALUES (5,'浙菜','口味清淡为主，菜式小巧玲珑，清俊逸秀，菜品鲜美滑嫩，脆软清爽。运用香糟、黄酒调味。烹调技法丰富，尤为在烹制海鲜河鲜有其独到之处。口味注重清鲜脆嫩，保持原料的本色和真味。菜品形态讲究，精巧细腻，清秀雅丽。其中北部口味偏甜，西部口味偏辣，东南部口味偏咸。');
INSERT INTO `cuisine` VALUES (6,'闽菜','口味鲜香为主，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格。三大特色，一长于红糟调味，二长于制汤，三长于使用糖醋。');
INSERT INTO `cuisine` VALUES (7,'湘菜','口味香辣为主，品种繁多。色泽上油重色浓，讲求实惠；香辣、香鲜、软嫩。重视原料互相搭配，滋味互相渗透。湘菜调味尤重香辣。相对而言，湘菜的煨功夫更胜一筹，几乎达到炉火纯青的地步。煨，在色泽变化上可分为红煨、白煨，在调味方面有清汤煨、浓汤煨和奶汤煨。小火慢炖，原汁原味。');
INSERT INTO `cuisine` VALUES (8,'徽菜','口味鲜辣为主，擅长烧、炖、蒸，而爆、炒菜少，重油、重色，重火功。重火工是历来的，其独到之处集中体现于擅长烧、炖、熏、蒸类的功夫菜上，不同菜肴使用不同的控火技术，形成酥、嫩、香、鲜独特风味，其中最能体现徽式特色的是滑烧、清炖和生熏法。');

--
-- Table structure for table `dishes_type`
--

DROP TABLE IF EXISTS `dishes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品分类主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品分类名',
  `description` text NOT NULL COMMENT '菜品分类描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes_type`
--

INSERT INTO `dishes_type` VALUES (1,'腌菜','腌制是肉、鱼、蔬菜等食物加盐和其他作料进行保藏的一种加工方法，该方法可以防止有害微生物的生长，延长食物贮存期。\r\n蔬菜腌制是一种历史悠久的蔬菜加工方法,由于加工方法简单、成本低廉、容易保存、产品具有独特的色、香、味,为其他加工品所不能代替,所以蔬菜腌制品深受消费者欢迎。\r\n腌制蔬菜可以使用多种原料,常用的有白萝卜、胡萝卜、黄瓜、莴笋、蒜苔、莲花白、辣椒等。我国各地传统的蔬菜腌制品有上海雪里蕻、重庆涪陵的榨菜、广东酸笋、云南大头菜、常州香甜萝卜干等。在国外，日本的酱菜、韩国的泡菜等也久负盛誉。\r\n目前，我国大规模、工业化生产腌制蔬菜一般都采用高盐胚、长时间的腌渍工艺，然后采取低盐化处理的方法制成各种成品。蔬菜腌制的机理主要是利用食盐的高渗透压作用、微生物的发酵作用和蛋白质的水解作用，以及其它一系列的生物化学变化，最终使腌制品得以保存，并具有独特的色、香、味。腌菜制品发酵一般以乳酸发酵为主并伴有少量的酒精发酵和微量的醋酸发酵。在蔬菜腌制品中，味感物质主要是氨基酸和有机酸两大类；香味物质则很复杂，通常都是多种挥发性和半挥发性的物质。');
INSERT INTO `dishes_type` VALUES (2,'卤菜','卤菜是烹饪学上凉食菜肴的通称，是各地区耳熟能详的家常菜。卤菜共分为红卤系列、盐焗系列、麻辣系列、泡椒系列、烤鸭系列、酱香系列、五香系列、海鲜系列、凉拌系列等9大系列。\r\n它经过腌制、风晒、煮焖或卤制后，经刀工处理，简单包装，即可食用，特点是干香、脆嫩、酥烂、爽滑、无汤、不腻、色泽光亮、食用方便、便于携带，备受人们的喜爱。\r\n中国卤菜源远流长，种类繁多，风味各异，一直以它独有的形式在不断的超越与发展，在粤菜、湘菜、徽菜、川菜当中都有非常大的影响力，而且不论城市乡间，放眼酒楼饭店、街边小巷随处可见其踪迹。');
INSERT INTO `dishes_type` VALUES (3,'凉拌菜','凉拌菜，是将初步加工和焯水处理后的原料，经过添加红油、酱油、蒜粒等配料制作而成的菜肴。根据红油的分类一般可分为香辣、麻辣、五香三大类。\r\n凉拌菜其历史文化却深远得多，可追溯到周朝和先秦时期。每一道凉菜，吃的不仅仅是食物的本身，调味料才是灵魂所在。糖、香油、醋、盐、辣椒油等调味的多或少，赋予了每一道凉菜不同的味道。吃前将各种食材连同酱汁拌均匀，酸、辣、甜、麻香味儿在口腔中散发开来，醒胃又养生。');
INSERT INTO `dishes_type` VALUES (4,'煎菜','煎是先把锅烧热，用少量的油刷一下锅底，然后把加工成型（一般为扁型）的原料放入锅中，用少量的油煎制成熟的一种烹饪方法.一般是先煎一面，再煎另一面，煎时要不停地晃动锅子，使原料受热均匀，色泽一致。');
INSERT INTO `dishes_type` VALUES (5,'炒菜','中国菜的常用制作方法，是中国家庭日常最广泛使用的一种烹饪方法，将一种或几种菜在锅中炒熟的过程，它主要是以锅中的油温为载体，将切好的菜品用中旺火在较短时间内加热成熟的一种烹饪方法。 通常放油若干，加入佐料，再将菜品放入锅中，用中旺火在较短时间内加热成熟，中间使用特制工具“锅铲”不断翻动，直到菜被炒熟！锅铲的翻动过程也正是炒的过程，翻动的目的是使菜品受热、佐料以及各种菜品在炒制过程中析出的汁水在整锅菜中均匀分布。\r\n其中，火候的掌握、翻动节奏以及调味料的加入种类和次序，为最终炒制是否成功的关键！由此，炒菜如不加具体菜名时可独立为动词！如：我炒菜去！');
INSERT INTO `dishes_type` VALUES (6,'油炸菜','炸，是将原料挂糊(上浆)或不挂糊(不上浆)，放在不同温度的多量油锅中来加热成熟的烹饪技法。在炸原料时，油量要多于主料，是主料的2～3倍，有时甚至更多。油量大，炸得快，而且成菜效果好。常见的方法有清炸、干炸、软炸、松炸、酥炸、脆炸、泼炸、浸炸、卷炸等。虽说方法多多，但常用的还是前几种。');
INSERT INTO `dishes_type` VALUES (7,'烧菜','烧是先将主料进行一次或两次以上的热处理之后，加入汤（或水）和调料，先用大火烧开，再改用小火慢烧至或酥烂（肉类，海味），或软嫩（鱼类，豆腐），或鲜嫩（蔬菜）的一种烹调方法.由于烧菜的口味，色泽和汤汁多寡的不同，它又分为红烧，白烧，干烧，酱烧，葱烧，辣烧等许多种。');
INSERT INTO `dishes_type` VALUES (8,'炖菜','炖和烧相似，所不同的是，炖制菜的汤汁比烧菜的多.炖先用葱，姜炝锅，再冲入汤或水，烧开后下主料，先大火烧开，再小火慢炖.炖菜的主料要求软烂，一般是咸鲜味。');
INSERT INTO `dishes_type` VALUES (9,'水煮菜','水煮是指将原料放入水中加热，直至煮熟。');

--
-- Table structure for table `cookbook`
--

DROP TABLE IF EXISTS `cookbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜谱唯一主键',
  `name` varchar(50) NOT NULL COMMENT '菜名',
  `raptatorial` int(1) NOT NULL COMMENT '荤素,荤为1,素为0',
  `process_difficulty` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单',
  `health` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材的清淡程度分值,加分越多越重口味,加分越少越清淡',
  `cuisine_id` int(11) NOT NULL COMMENT '菜系的外键',
  `dt_id` int(11) NOT NULL COMMENT '菜品分类外键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cookbook_name_uindex` (`name`),
  KEY `cookbook_cuisine_id_fk` (`cuisine_id`),
  KEY `cookbook_dishes_type_id_fk` (`dt_id`),
  CONSTRAINT `cookbook_cuisine_id_fk` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine` (`id`),
  CONSTRAINT `cookbook_dishes_type_id_fk` FOREIGN KEY (`dt_id`) REFERENCES `dishes_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜谱大全';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookbook`
--

--
-- Table structure for table `cookbook_details`
--

DROP TABLE IF EXISTS `cookbook_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookbook_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜谱详情表主键',
  `c_id` int(11) NOT NULL COMMENT 'cookbook表id外键',
  `feature` varchar(255) NOT NULL COMMENT '该菜品特色',
  `cooking_methods` text NOT NULL COMMENT '具体烹饪方法总览',
  PRIMARY KEY (`id`),
  KEY `cookbook_details_cookbook_id_fk` (`c_id`),
  CONSTRAINT `cookbook_details_cookbook_id_fk` FOREIGN KEY (`c_id`) REFERENCES `cookbook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜谱详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookbook_details`
--

--
-- Table structure for table `cookbook_details_ingredient`
--

DROP TABLE IF EXISTS `cookbook_details_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookbook_details_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜谱和食材对照表主键',
  `quantity` varchar(50) NOT NULL COMMENT '食材用量',
  `cd_id` int(11) NOT NULL COMMENT 'cookbook_details表外键',
  `i_id` int(11) NOT NULL COMMENT 'ingredient表外键',
  PRIMARY KEY (`id`),
  KEY `cookbook_details_ingredient_cookbook_details_id_fk` (`cd_id`),
  KEY `cookbook_details_ingredient_ingredient_id_fk` (`i_id`),
  CONSTRAINT `cookbook_details_ingredient_cookbook_details_id_fk` FOREIGN KEY (`cd_id`) REFERENCES `cookbook_details` (`id`),
  CONSTRAINT `cookbook_details_ingredient_ingredient_id_fk` FOREIGN KEY (`i_id`) REFERENCES `ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜谱详情和食材对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookbook_details_ingredient`
--

--
-- Table structure for table `cooking_health`
--

DROP TABLE IF EXISTS `cooking_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooking_health` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '烹饪健康表主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '烹饪方法',
  `process_difficulty` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '加分的分值,加分越多代表操作越复杂,加分越少代表操作越简单',
  `health` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '加分的分值,加分越多代表过程越不清淡,加分越少代表过程越清淡',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='烹饪难度和健康程度打分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_health`
--

INSERT INTO `cooking_health` VALUES (1,'浸泡',0.1,0.0);
INSERT INTO `cooking_health` VALUES (2,'洗净',0.2,0.0);
INSERT INTO `cooking_health` VALUES (3,'去皮',2.5,0.0);
INSERT INTO `cooking_health` VALUES (4,'切块',1.0,0.0);
INSERT INTO `cooking_health` VALUES (5,'切条',4.0,0.0);
INSERT INTO `cooking_health` VALUES (6,'切片',5.5,0.0);
INSERT INTO `cooking_health` VALUES (7,'切丁',6.5,0.0);
INSERT INTO `cooking_health` VALUES (8,'切丝',7.5,0.0);
INSERT INTO `cooking_health` VALUES (9,'切末',10.0,0.0);
INSERT INTO `cooking_health` VALUES (10,'腌制(码味,码料)',3.5,0.5);
INSERT INTO `cooking_health` VALUES (11,'煮',1.5,1.0);
INSERT INTO `cooking_health` VALUES (12,'蒸',2.0,0.5);
INSERT INTO `cooking_health` VALUES (13,'炖',3.0,2.5);
INSERT INTO `cooking_health` VALUES (14,'烧',3.0,3.0);
INSERT INTO `cooking_health` VALUES (15,'煎',5.0,3.0);
INSERT INTO `cooking_health` VALUES (16,'炒',6.0,3.5);
INSERT INTO `cooking_health` VALUES (17,'炸',15.0,3.0);
INSERT INTO `cooking_health` VALUES (18,'烤',18.0,3.0);

--
-- Table structure for table `cookbook_details_cooking`
--

DROP TABLE IF EXISTS `cookbook_details_cooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookbook_details_cooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品详情和操作流程对应表主键',
  `description` text NOT NULL COMMENT '食材处理描述',
  `process_difficulty` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单',
  `health` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材的清淡程度分值,加分越多越重口味,加分越少越清淡',
  `cd_id` int(11) NOT NULL COMMENT 'cookbook_details表外键',
  `ch_id` int(11) NOT NULL COMMENT 'cooking_health表外键',
  PRIMARY KEY (`id`),
  KEY `cookbook_details_cookbook_details_id_fk` (`cd_id`),
  KEY `cookbook_details_cooking_health_id_fk` (`ch_id`),
  CONSTRAINT `cookbook_details_cookbook_details_id_fk` FOREIGN KEY (`cd_id`) REFERENCES `cookbook_details` (`id`),
  CONSTRAINT `cookbook_details_cooking_health_id_fk` FOREIGN KEY (`ch_id`) REFERENCES `cooking_health` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜谱详情和操作流程对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookbook_details_cooking`
--


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-23 15:29:12
