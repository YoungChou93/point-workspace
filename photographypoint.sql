/*
Navicat MySQL Data Transfer

Source Server         : point
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : photographypoint

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-09-08 18:05:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for block
-- ----------------------------
DROP TABLE IF EXISTS `block`;
CREATE TABLE `block` (
  `BlockId` int(11) NOT NULL AUTO_INCREMENT,
  `BlockName` varchar(20) NOT NULL COMMENT '模块名称',
  `Descripting` varchar(50) DEFAULT NULL COMMENT '描述',
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`BlockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of block
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` int(11) DEFAULT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d6wmr68dljice4y25ykax6rfs` (`provinceid`),
  CONSTRAINT `FK_d6wmr68dljice4y25ykax6rfs` FOREIGN KEY (`provinceid`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '北京市');
INSERT INTO `city` VALUES ('2', '2', '天津市');
INSERT INTO `city` VALUES ('3', '3', '上海市');
INSERT INTO `city` VALUES ('4', '4', '重庆市');
INSERT INTO `city` VALUES ('5', '5', '石家庄市');
INSERT INTO `city` VALUES ('6', '5', '唐山市');
INSERT INTO `city` VALUES ('7', '5', '秦皇岛市');
INSERT INTO `city` VALUES ('8', '5', '邯郸市');
INSERT INTO `city` VALUES ('9', '5', '邢台市');
INSERT INTO `city` VALUES ('10', '5', '保定市');
INSERT INTO `city` VALUES ('11', '5', '张家口市');
INSERT INTO `city` VALUES ('12', '5', '承德市');
INSERT INTO `city` VALUES ('13', '5', '沧州市');
INSERT INTO `city` VALUES ('14', '5', '廊坊市');
INSERT INTO `city` VALUES ('15', '5', '衡水市');
INSERT INTO `city` VALUES ('16', '6', '太原市');
INSERT INTO `city` VALUES ('17', '6', '大同市');
INSERT INTO `city` VALUES ('18', '6', '阳泉市');
INSERT INTO `city` VALUES ('19', '6', '长治市');
INSERT INTO `city` VALUES ('20', '6', '晋城市');
INSERT INTO `city` VALUES ('21', '6', '朔州市');
INSERT INTO `city` VALUES ('22', '6', '晋中市');
INSERT INTO `city` VALUES ('23', '6', '运城市');
INSERT INTO `city` VALUES ('24', '6', '忻州市');
INSERT INTO `city` VALUES ('25', '6', '临汾市');
INSERT INTO `city` VALUES ('26', '6', '吕梁市');
INSERT INTO `city` VALUES ('27', '7', '台北市');
INSERT INTO `city` VALUES ('28', '7', '高雄市');
INSERT INTO `city` VALUES ('29', '7', '基隆市');
INSERT INTO `city` VALUES ('30', '7', '台中市');
INSERT INTO `city` VALUES ('31', '7', '台南市');
INSERT INTO `city` VALUES ('32', '7', '新竹市');
INSERT INTO `city` VALUES ('33', '7', '嘉义市');
INSERT INTO `city` VALUES ('34', '7', '台北县');
INSERT INTO `city` VALUES ('35', '7', '宜兰县');
INSERT INTO `city` VALUES ('36', '7', '桃园县');
INSERT INTO `city` VALUES ('37', '7', '新竹县');
INSERT INTO `city` VALUES ('38', '7', '苗栗县');
INSERT INTO `city` VALUES ('39', '7', '台中县');
INSERT INTO `city` VALUES ('40', '7', '彰化县');
INSERT INTO `city` VALUES ('41', '7', '南投县');
INSERT INTO `city` VALUES ('42', '7', '云林县');
INSERT INTO `city` VALUES ('43', '7', '嘉义县');
INSERT INTO `city` VALUES ('44', '7', '台南县');
INSERT INTO `city` VALUES ('45', '7', '高雄县');
INSERT INTO `city` VALUES ('46', '7', '屏东县');
INSERT INTO `city` VALUES ('47', '7', '澎湖县');
INSERT INTO `city` VALUES ('48', '7', '台东县');
INSERT INTO `city` VALUES ('49', '7', '花莲县');
INSERT INTO `city` VALUES ('50', '8', '沈阳市');
INSERT INTO `city` VALUES ('51', '8', '大连市');
INSERT INTO `city` VALUES ('52', '8', '鞍山市');
INSERT INTO `city` VALUES ('53', '8', '抚顺市');
INSERT INTO `city` VALUES ('54', '8', '本溪市');
INSERT INTO `city` VALUES ('55', '8', '丹东市');
INSERT INTO `city` VALUES ('56', '8', '锦州市');
INSERT INTO `city` VALUES ('57', '8', '营口市');
INSERT INTO `city` VALUES ('58', '8', '阜新市');
INSERT INTO `city` VALUES ('59', '8', '辽阳市');
INSERT INTO `city` VALUES ('60', '8', '盘锦市');
INSERT INTO `city` VALUES ('61', '8', '铁岭市');
INSERT INTO `city` VALUES ('62', '8', '朝阳市');
INSERT INTO `city` VALUES ('63', '8', '葫芦岛市');
INSERT INTO `city` VALUES ('64', '9', '长春市');
INSERT INTO `city` VALUES ('65', '9', '吉林市');
INSERT INTO `city` VALUES ('66', '9', '四平市');
INSERT INTO `city` VALUES ('67', '9', '辽源市');
INSERT INTO `city` VALUES ('68', '9', '通化市');
INSERT INTO `city` VALUES ('69', '9', '白山市');
INSERT INTO `city` VALUES ('70', '9', '松原市');
INSERT INTO `city` VALUES ('71', '9', '白城市');
INSERT INTO `city` VALUES ('72', '9', '延边朝鲜族自治州');
INSERT INTO `city` VALUES ('73', '10', '哈尔滨市');
INSERT INTO `city` VALUES ('74', '10', '齐齐哈尔市');
INSERT INTO `city` VALUES ('75', '10', '鹤岗市');
INSERT INTO `city` VALUES ('76', '10', '双鸭山市');
INSERT INTO `city` VALUES ('77', '10', '鸡西市');
INSERT INTO `city` VALUES ('78', '10', '大庆市');
INSERT INTO `city` VALUES ('79', '10', '伊春市');
INSERT INTO `city` VALUES ('80', '10', '牡丹江市');
INSERT INTO `city` VALUES ('81', '10', '佳木斯市');
INSERT INTO `city` VALUES ('82', '10', '七台河市');
INSERT INTO `city` VALUES ('83', '10', '黑河市');
INSERT INTO `city` VALUES ('84', '10', '绥化市');
INSERT INTO `city` VALUES ('85', '10', '大兴安岭地区');
INSERT INTO `city` VALUES ('86', '11', '南京市');
INSERT INTO `city` VALUES ('87', '11', '无锡市');
INSERT INTO `city` VALUES ('88', '11', '徐州市');
INSERT INTO `city` VALUES ('89', '11', '常州市');
INSERT INTO `city` VALUES ('90', '11', '苏州市');
INSERT INTO `city` VALUES ('91', '11', '南通市');
INSERT INTO `city` VALUES ('92', '11', '连云港市');
INSERT INTO `city` VALUES ('93', '11', '淮安市');
INSERT INTO `city` VALUES ('94', '11', '盐城市');
INSERT INTO `city` VALUES ('95', '11', '扬州市');
INSERT INTO `city` VALUES ('96', '11', '镇江市');
INSERT INTO `city` VALUES ('97', '11', '泰州市');
INSERT INTO `city` VALUES ('98', '11', '宿迁市');
INSERT INTO `city` VALUES ('99', '12', '杭州市');
INSERT INTO `city` VALUES ('100', '12', '宁波市');
INSERT INTO `city` VALUES ('101', '12', '温州市');
INSERT INTO `city` VALUES ('102', '12', '嘉兴市');
INSERT INTO `city` VALUES ('103', '12', '湖州市');
INSERT INTO `city` VALUES ('104', '12', '绍兴市');
INSERT INTO `city` VALUES ('105', '12', '金华市');
INSERT INTO `city` VALUES ('106', '12', '衢州市');
INSERT INTO `city` VALUES ('107', '12', '舟山市');
INSERT INTO `city` VALUES ('108', '12', '台州市');
INSERT INTO `city` VALUES ('109', '12', '丽水市');
INSERT INTO `city` VALUES ('110', '13', '合肥市');
INSERT INTO `city` VALUES ('111', '13', '芜湖市');
INSERT INTO `city` VALUES ('112', '13', '蚌埠市');
INSERT INTO `city` VALUES ('113', '13', '淮南市');
INSERT INTO `city` VALUES ('114', '13', '马鞍山市');
INSERT INTO `city` VALUES ('115', '13', '淮北市');
INSERT INTO `city` VALUES ('116', '13', '铜陵市');
INSERT INTO `city` VALUES ('117', '13', '安庆市');
INSERT INTO `city` VALUES ('118', '13', '黄山市');
INSERT INTO `city` VALUES ('119', '13', '滁州市');
INSERT INTO `city` VALUES ('120', '13', '阜阳市');
INSERT INTO `city` VALUES ('121', '13', '宿州市');
INSERT INTO `city` VALUES ('122', '13', '巢湖市');
INSERT INTO `city` VALUES ('123', '13', '六安市');
INSERT INTO `city` VALUES ('124', '13', '亳州市');
INSERT INTO `city` VALUES ('125', '13', '池州市');
INSERT INTO `city` VALUES ('126', '13', '宣城市');
INSERT INTO `city` VALUES ('127', '14', '福州市');
INSERT INTO `city` VALUES ('128', '14', '厦门市');
INSERT INTO `city` VALUES ('129', '14', '莆田市');
INSERT INTO `city` VALUES ('130', '14', '三明市');
INSERT INTO `city` VALUES ('131', '14', '泉州市');
INSERT INTO `city` VALUES ('132', '14', '漳州市');
INSERT INTO `city` VALUES ('133', '14', '南平市');
INSERT INTO `city` VALUES ('134', '14', '龙岩市');
INSERT INTO `city` VALUES ('135', '14', '宁德市');
INSERT INTO `city` VALUES ('136', '15', '南昌市');
INSERT INTO `city` VALUES ('137', '15', '景德镇市');
INSERT INTO `city` VALUES ('138', '15', '萍乡市');
INSERT INTO `city` VALUES ('139', '15', '九江市');
INSERT INTO `city` VALUES ('140', '15', '新余市');
INSERT INTO `city` VALUES ('141', '15', '鹰潭市');
INSERT INTO `city` VALUES ('142', '15', '赣州市');
INSERT INTO `city` VALUES ('143', '15', '吉安市');
INSERT INTO `city` VALUES ('144', '15', '宜春市');
INSERT INTO `city` VALUES ('145', '15', '抚州市');
INSERT INTO `city` VALUES ('146', '15', '上饶市');
INSERT INTO `city` VALUES ('147', '16', '济南市');
INSERT INTO `city` VALUES ('148', '16', '青岛市');
INSERT INTO `city` VALUES ('149', '16', '淄博市');
INSERT INTO `city` VALUES ('150', '16', '枣庄市');
INSERT INTO `city` VALUES ('151', '16', '东营市');
INSERT INTO `city` VALUES ('152', '16', '烟台市');
INSERT INTO `city` VALUES ('153', '16', '潍坊市');
INSERT INTO `city` VALUES ('154', '16', '济宁市');
INSERT INTO `city` VALUES ('155', '16', '泰安市');
INSERT INTO `city` VALUES ('156', '16', '威海市');
INSERT INTO `city` VALUES ('157', '16', '日照市');
INSERT INTO `city` VALUES ('158', '16', '莱芜市');
INSERT INTO `city` VALUES ('159', '16', '临沂市');
INSERT INTO `city` VALUES ('160', '16', '德州市');
INSERT INTO `city` VALUES ('161', '16', '聊城市');
INSERT INTO `city` VALUES ('162', '16', '滨州市');
INSERT INTO `city` VALUES ('163', '16', '菏泽市');
INSERT INTO `city` VALUES ('164', '17', '郑州市');
INSERT INTO `city` VALUES ('165', '17', '开封市');
INSERT INTO `city` VALUES ('166', '17', '洛阳市');
INSERT INTO `city` VALUES ('167', '17', '平顶山市');
INSERT INTO `city` VALUES ('168', '17', '安阳市');
INSERT INTO `city` VALUES ('169', '17', '鹤壁市');
INSERT INTO `city` VALUES ('170', '17', '新乡市');
INSERT INTO `city` VALUES ('171', '17', '焦作市');
INSERT INTO `city` VALUES ('172', '17', '濮阳市');
INSERT INTO `city` VALUES ('173', '17', '许昌市');
INSERT INTO `city` VALUES ('174', '17', '漯河市');
INSERT INTO `city` VALUES ('175', '17', '三门峡市');
INSERT INTO `city` VALUES ('176', '17', '南阳市');
INSERT INTO `city` VALUES ('177', '17', '商丘市');
INSERT INTO `city` VALUES ('178', '17', '信阳市');
INSERT INTO `city` VALUES ('179', '17', '周口市');
INSERT INTO `city` VALUES ('180', '17', '驻马店市');
INSERT INTO `city` VALUES ('181', '17', '济源市');
INSERT INTO `city` VALUES ('182', '18', '武汉市');
INSERT INTO `city` VALUES ('183', '18', '黄石市');
INSERT INTO `city` VALUES ('184', '18', '十堰市');
INSERT INTO `city` VALUES ('185', '18', '荆州市');
INSERT INTO `city` VALUES ('186', '18', '宜昌市');
INSERT INTO `city` VALUES ('187', '18', '襄樊市');
INSERT INTO `city` VALUES ('188', '18', '鄂州市');
INSERT INTO `city` VALUES ('189', '18', '荆门市');
INSERT INTO `city` VALUES ('190', '18', '孝感市');
INSERT INTO `city` VALUES ('191', '18', '黄冈市');
INSERT INTO `city` VALUES ('192', '18', '咸宁市');
INSERT INTO `city` VALUES ('193', '18', '随州市');
INSERT INTO `city` VALUES ('194', '18', '仙桃市');
INSERT INTO `city` VALUES ('195', '18', '天门市');
INSERT INTO `city` VALUES ('196', '18', '潜江市');
INSERT INTO `city` VALUES ('197', '18', '神农架林区');
INSERT INTO `city` VALUES ('198', '18', '恩施土家族苗族自治州');
INSERT INTO `city` VALUES ('199', '19', '长沙市');
INSERT INTO `city` VALUES ('200', '19', '株洲市');
INSERT INTO `city` VALUES ('201', '19', '湘潭市');
INSERT INTO `city` VALUES ('202', '19', '衡阳市');
INSERT INTO `city` VALUES ('203', '19', '邵阳市');
INSERT INTO `city` VALUES ('204', '19', '岳阳市');
INSERT INTO `city` VALUES ('205', '19', '常德市');
INSERT INTO `city` VALUES ('206', '19', '张家界市');
INSERT INTO `city` VALUES ('207', '19', '益阳市');
INSERT INTO `city` VALUES ('208', '19', '郴州市');
INSERT INTO `city` VALUES ('209', '19', '永州市');
INSERT INTO `city` VALUES ('210', '19', '怀化市');
INSERT INTO `city` VALUES ('211', '19', '娄底市');
INSERT INTO `city` VALUES ('212', '19', '湘西土家族苗族自治州');
INSERT INTO `city` VALUES ('213', '20', '广州市');
INSERT INTO `city` VALUES ('214', '20', '深圳市');
INSERT INTO `city` VALUES ('215', '20', '珠海市');
INSERT INTO `city` VALUES ('216', '20', '汕头市');
INSERT INTO `city` VALUES ('217', '20', '韶关市');
INSERT INTO `city` VALUES ('218', '20', '佛山市');
INSERT INTO `city` VALUES ('219', '20', '江门市');
INSERT INTO `city` VALUES ('220', '20', '湛江市');
INSERT INTO `city` VALUES ('221', '20', '茂名市');
INSERT INTO `city` VALUES ('222', '20', '肇庆市');
INSERT INTO `city` VALUES ('223', '20', '惠州市');
INSERT INTO `city` VALUES ('224', '20', '梅州市');
INSERT INTO `city` VALUES ('225', '20', '汕尾市');
INSERT INTO `city` VALUES ('226', '20', '河源市');
INSERT INTO `city` VALUES ('227', '20', '阳江市');
INSERT INTO `city` VALUES ('228', '20', '清远市');
INSERT INTO `city` VALUES ('229', '20', '东莞市');
INSERT INTO `city` VALUES ('230', '20', '中山市');
INSERT INTO `city` VALUES ('231', '20', '潮州市');
INSERT INTO `city` VALUES ('232', '20', '揭阳市');
INSERT INTO `city` VALUES ('233', '20', '云浮市');
INSERT INTO `city` VALUES ('234', '21', '兰州市');
INSERT INTO `city` VALUES ('235', '21', '金昌市');
INSERT INTO `city` VALUES ('236', '21', '白银市');
INSERT INTO `city` VALUES ('237', '21', '天水市');
INSERT INTO `city` VALUES ('238', '21', '嘉峪关市');
INSERT INTO `city` VALUES ('239', '21', '武威市');
INSERT INTO `city` VALUES ('240', '21', '张掖市');
INSERT INTO `city` VALUES ('241', '21', '平凉市');
INSERT INTO `city` VALUES ('242', '21', '酒泉市');
INSERT INTO `city` VALUES ('243', '21', '庆阳市');
INSERT INTO `city` VALUES ('244', '21', '定西市');
INSERT INTO `city` VALUES ('245', '21', '陇南市');
INSERT INTO `city` VALUES ('246', '21', '临夏回族自治州');
INSERT INTO `city` VALUES ('247', '21', '甘南藏族自治州');
INSERT INTO `city` VALUES ('248', '22', '成都市');
INSERT INTO `city` VALUES ('249', '22', '自贡市');
INSERT INTO `city` VALUES ('250', '22', '攀枝花市');
INSERT INTO `city` VALUES ('251', '22', '泸州市');
INSERT INTO `city` VALUES ('252', '22', '德阳市');
INSERT INTO `city` VALUES ('253', '22', '绵阳市');
INSERT INTO `city` VALUES ('254', '22', '广元市');
INSERT INTO `city` VALUES ('255', '22', '遂宁市');
INSERT INTO `city` VALUES ('256', '22', '内江市');
INSERT INTO `city` VALUES ('257', '22', '乐山市');
INSERT INTO `city` VALUES ('258', '22', '南充市');
INSERT INTO `city` VALUES ('259', '22', '眉山市');
INSERT INTO `city` VALUES ('260', '22', '宜宾市');
INSERT INTO `city` VALUES ('261', '22', '广安市');
INSERT INTO `city` VALUES ('262', '22', '达州市');
INSERT INTO `city` VALUES ('263', '22', '雅安市');
INSERT INTO `city` VALUES ('264', '22', '巴中市');
INSERT INTO `city` VALUES ('265', '22', '资阳市');
INSERT INTO `city` VALUES ('266', '22', '阿坝藏族羌族自治州');
INSERT INTO `city` VALUES ('267', '22', '甘孜藏族自治州');
INSERT INTO `city` VALUES ('268', '22', '凉山彝族自治州');
INSERT INTO `city` VALUES ('269', '23', '贵阳市');
INSERT INTO `city` VALUES ('270', '23', '六盘水市');
INSERT INTO `city` VALUES ('271', '23', '遵义市');
INSERT INTO `city` VALUES ('272', '23', '安顺市');
INSERT INTO `city` VALUES ('273', '23', '铜仁地区');
INSERT INTO `city` VALUES ('274', '23', '毕节地区');
INSERT INTO `city` VALUES ('275', '23', '黔西南布依族苗族自治州');
INSERT INTO `city` VALUES ('276', '23', '黔东南苗族侗族自治州');
INSERT INTO `city` VALUES ('277', '23', '黔南布依族苗族自治州');
INSERT INTO `city` VALUES ('278', '24', '海口市');
INSERT INTO `city` VALUES ('279', '24', '三亚市');
INSERT INTO `city` VALUES ('280', '24', '五指山市');
INSERT INTO `city` VALUES ('281', '24', '琼海市');
INSERT INTO `city` VALUES ('282', '24', '儋州市');
INSERT INTO `city` VALUES ('283', '24', '文昌市');
INSERT INTO `city` VALUES ('284', '24', '万宁市');
INSERT INTO `city` VALUES ('285', '24', '东方市');
INSERT INTO `city` VALUES ('286', '24', '澄迈县');
INSERT INTO `city` VALUES ('287', '24', '定安县');
INSERT INTO `city` VALUES ('288', '24', '屯昌县');
INSERT INTO `city` VALUES ('289', '24', '临高县');
INSERT INTO `city` VALUES ('290', '24', '白沙黎族自治县');
INSERT INTO `city` VALUES ('291', '24', '昌江黎族自治县');
INSERT INTO `city` VALUES ('292', '24', '乐东黎族自治县');
INSERT INTO `city` VALUES ('293', '24', '陵水黎族自治县');
INSERT INTO `city` VALUES ('294', '24', '保亭黎族苗族自治县');
INSERT INTO `city` VALUES ('295', '24', '琼中黎族苗族自治县');
INSERT INTO `city` VALUES ('296', '25', '昆明市');
INSERT INTO `city` VALUES ('297', '25', '曲靖市');
INSERT INTO `city` VALUES ('298', '25', '玉溪市');
INSERT INTO `city` VALUES ('299', '25', '保山市');
INSERT INTO `city` VALUES ('300', '25', '昭通市');
INSERT INTO `city` VALUES ('301', '25', '丽江市');
INSERT INTO `city` VALUES ('302', '25', '思茅市');
INSERT INTO `city` VALUES ('303', '25', '临沧市');
INSERT INTO `city` VALUES ('304', '25', '文山壮族苗族自治州');
INSERT INTO `city` VALUES ('305', '25', '红河哈尼族彝族自治州');
INSERT INTO `city` VALUES ('306', '25', '西双版纳傣族自治州');
INSERT INTO `city` VALUES ('307', '25', '楚雄彝族自治州');
INSERT INTO `city` VALUES ('308', '25', '大理白族自治州');
INSERT INTO `city` VALUES ('309', '25', '德宏傣族景颇族自治州');
INSERT INTO `city` VALUES ('310', '25', '怒江傈傈族自治州');
INSERT INTO `city` VALUES ('311', '25', '迪庆藏族自治州');
INSERT INTO `city` VALUES ('312', '26', '西宁市');
INSERT INTO `city` VALUES ('313', '26', '海东地区');
INSERT INTO `city` VALUES ('314', '26', '海北藏族自治州');
INSERT INTO `city` VALUES ('315', '26', '黄南藏族自治州');
INSERT INTO `city` VALUES ('316', '26', '海南藏族自治州');
INSERT INTO `city` VALUES ('317', '26', '果洛藏族自治州');
INSERT INTO `city` VALUES ('318', '26', '玉树藏族自治州');
INSERT INTO `city` VALUES ('319', '26', '海西蒙古族藏族自治州');
INSERT INTO `city` VALUES ('320', '27', '西安市');
INSERT INTO `city` VALUES ('321', '27', '铜川市');
INSERT INTO `city` VALUES ('322', '27', '宝鸡市');
INSERT INTO `city` VALUES ('323', '27', '咸阳市');
INSERT INTO `city` VALUES ('324', '27', '渭南市');
INSERT INTO `city` VALUES ('325', '27', '延安市');
INSERT INTO `city` VALUES ('326', '27', '汉中市');
INSERT INTO `city` VALUES ('327', '27', '榆林市');
INSERT INTO `city` VALUES ('328', '27', '安康市');
INSERT INTO `city` VALUES ('329', '27', '商洛市');
INSERT INTO `city` VALUES ('330', '28', '南宁市');
INSERT INTO `city` VALUES ('331', '28', '柳州市');
INSERT INTO `city` VALUES ('332', '28', '桂林市');
INSERT INTO `city` VALUES ('333', '28', '梧州市');
INSERT INTO `city` VALUES ('334', '28', '北海市');
INSERT INTO `city` VALUES ('335', '28', '防城港市');
INSERT INTO `city` VALUES ('336', '28', '钦州市');
INSERT INTO `city` VALUES ('337', '28', '贵港市');
INSERT INTO `city` VALUES ('338', '28', '玉林市');
INSERT INTO `city` VALUES ('339', '28', '百色市');
INSERT INTO `city` VALUES ('340', '28', '贺州市');
INSERT INTO `city` VALUES ('341', '28', '河池市');
INSERT INTO `city` VALUES ('342', '28', '来宾市');
INSERT INTO `city` VALUES ('343', '28', '崇左市');
INSERT INTO `city` VALUES ('344', '29', '拉萨市');
INSERT INTO `city` VALUES ('345', '29', '那曲地区');
INSERT INTO `city` VALUES ('346', '29', '昌都地区');
INSERT INTO `city` VALUES ('347', '29', '山南地区');
INSERT INTO `city` VALUES ('348', '29', '日喀则地区');
INSERT INTO `city` VALUES ('349', '29', '阿里地区');
INSERT INTO `city` VALUES ('350', '29', '林芝地区');
INSERT INTO `city` VALUES ('351', '30', '银川市');
INSERT INTO `city` VALUES ('352', '30', '石嘴山市');
INSERT INTO `city` VALUES ('353', '30', '吴忠市');
INSERT INTO `city` VALUES ('354', '30', '固原市');
INSERT INTO `city` VALUES ('355', '30', '中卫市');
INSERT INTO `city` VALUES ('356', '31', '乌鲁木齐市');
INSERT INTO `city` VALUES ('357', '31', '克拉玛依市');
INSERT INTO `city` VALUES ('358', '31', '石河子市　');
INSERT INTO `city` VALUES ('359', '31', '阿拉尔市');
INSERT INTO `city` VALUES ('360', '31', '图木舒克市');
INSERT INTO `city` VALUES ('361', '31', '五家渠市');
INSERT INTO `city` VALUES ('362', '31', '吐鲁番市');
INSERT INTO `city` VALUES ('363', '31', '阿克苏市');
INSERT INTO `city` VALUES ('364', '31', '喀什市');
INSERT INTO `city` VALUES ('365', '31', '哈密市');
INSERT INTO `city` VALUES ('366', '31', '和田市');
INSERT INTO `city` VALUES ('367', '31', '阿图什市');
INSERT INTO `city` VALUES ('368', '31', '库尔勒市');
INSERT INTO `city` VALUES ('369', '31', '昌吉市　');
INSERT INTO `city` VALUES ('370', '31', '阜康市');
INSERT INTO `city` VALUES ('371', '31', '米泉市');
INSERT INTO `city` VALUES ('372', '31', '博乐市');
INSERT INTO `city` VALUES ('373', '31', '伊宁市');
INSERT INTO `city` VALUES ('374', '31', '奎屯市');
INSERT INTO `city` VALUES ('375', '31', '塔城市');
INSERT INTO `city` VALUES ('376', '31', '乌苏市');
INSERT INTO `city` VALUES ('377', '31', '阿勒泰市');
INSERT INTO `city` VALUES ('378', '32', '呼和浩特市');
INSERT INTO `city` VALUES ('379', '32', '包头市');
INSERT INTO `city` VALUES ('380', '32', '乌海市');
INSERT INTO `city` VALUES ('381', '32', '赤峰市');
INSERT INTO `city` VALUES ('382', '32', '通辽市');
INSERT INTO `city` VALUES ('383', '32', '鄂尔多斯市');
INSERT INTO `city` VALUES ('384', '32', '呼伦贝尔市');
INSERT INTO `city` VALUES ('385', '32', '巴彦淖尔市');
INSERT INTO `city` VALUES ('386', '32', '乌兰察布市');
INSERT INTO `city` VALUES ('387', '32', '锡林郭勒盟');
INSERT INTO `city` VALUES ('388', '32', '兴安盟');
INSERT INTO `city` VALUES ('389', '32', '阿拉善盟');
INSERT INTO `city` VALUES ('390', '33', '澳门特别行政区');
INSERT INTO `city` VALUES ('391', '34', '香港特别行政区');

-- ----------------------------
-- Table structure for loginrecord
-- ----------------------------
DROP TABLE IF EXISTS `loginrecord`;
CREATE TABLE `loginrecord` (
  `Id` char(16) NOT NULL,
  `Uid` char(16) NOT NULL,
  `LoginTime` datetime NOT NULL,
  `LoginIp` varchar(16) NOT NULL,
  `LogoutTime` datetime DEFAULT NULL,
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_LoginRecord_Uid` (`Uid`),
  CONSTRAINT `fk_LoginRecord_Uid` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginrecord
-- ----------------------------
INSERT INTO `loginrecord` VALUES ('2016030800000001', '2016030100000001', '2016-03-08 13:02:49', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000002', '2016030100000001', '2016-03-08 13:11:41', '0:0:0:0:0:0:0:1', '2016-03-08 13:11:50', null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000003', '2016030100000001', '2016-03-08 13:13:16', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000004', '2016030100000001', '2016-03-08 13:29:45', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000005', '2016030100000001', '2016-03-08 14:24:28', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000006', '2016030100000001', '2016-03-08 15:21:50', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000007', '2016030100000001', '2016-03-08 18:50:29', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000008', '2016030100000001', '2016-03-08 20:19:32', '0:0:0:0:0:0:0:1', '2016-03-08 21:36:38', null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000009', '2016030100000001', '2016-03-08 21:41:18', '0:0:0:0:0:0:0:1', '2016-03-08 21:41:30', null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000010', '2016030100000001', '2016-03-08 21:41:47', '0:0:0:0:0:0:0:1', '2016-03-08 22:15:08', null, null);
INSERT INTO `loginrecord` VALUES ('2016030800000011', '2016030100000001', '2016-03-08 22:16:08', '192.168.1.109', '2016-03-08 22:19:08', null, null);
INSERT INTO `loginrecord` VALUES ('2016030900000001', '2016030100000001', '2016-03-09 16:16:56', '0:0:0:0:0:0:0:1', '2016-03-09 17:58:55', null, null);
INSERT INTO `loginrecord` VALUES ('2016030900000002', '2016030100000001', '2016-03-09 17:59:37', '0:0:0:0:0:0:0:1', '2016-03-09 18:03:57', null, null);
INSERT INTO `loginrecord` VALUES ('2016030900000003', '2016030100000001', '2016-03-09 19:52:09', '0:0:0:0:0:0:0:1', '2016-03-09 21:04:53', null, null);
INSERT INTO `loginrecord` VALUES ('2016030900000004', '2016030100000001', '2016-03-09 21:06:56', '0:0:0:0:0:0:0:1', '2016-03-09 21:09:42', null, null);
INSERT INTO `loginrecord` VALUES ('2016030900000005', '2016030100000001', '2016-03-09 21:10:04', '0:0:0:0:0:0:0:1', '2016-03-09 22:37:37', null, null);
INSERT INTO `loginrecord` VALUES ('2016030900000006', '2016030100000001', '2016-03-09 22:40:30', '0:0:0:0:0:0:0:1', '2016-03-09 23:14:10', null, null);
INSERT INTO `loginrecord` VALUES ('2016031200000001', '2016030100000001', '2016-03-12 15:12:55', '0:0:0:0:0:0:0:1', '2016-03-12 15:35:50', null, null);
INSERT INTO `loginrecord` VALUES ('2016031200000002', '2016030100000001', '2016-03-12 15:36:04', '0:0:0:0:0:0:0:1', '2016-03-12 17:22:51', null, null);
INSERT INTO `loginrecord` VALUES ('2016031200000003', '2016030100000001', '2016-03-12 17:41:26', '0:0:0:0:0:0:0:1', '2016-03-12 20:34:55', null, null);
INSERT INTO `loginrecord` VALUES ('2016031200000004', '2016030100000001', '2016-03-12 20:41:44', '0:0:0:0:0:0:0:1', '2016-03-12 20:43:40', null, null);
INSERT INTO `loginrecord` VALUES ('2016031200000005', '2016030100000001', '2016-03-12 20:47:27', '0:0:0:0:0:0:0:1', '2016-03-12 20:50:06', null, null);
INSERT INTO `loginrecord` VALUES ('2016031200000006', '2016030100000001', '2016-03-12 20:51:53', '0:0:0:0:0:0:0:1', '2016-03-12 20:55:29', null, null);
INSERT INTO `loginrecord` VALUES ('2016080600000001', '2016030100000001', '2016-08-06 14:25:23', '0:0:0:0:0:0:0:1', '2016-08-06 14:33:33', null, null);
INSERT INTO `loginrecord` VALUES ('2016080600000002', '2016030100000001', '2016-08-06 14:34:02', '0:0:0:0:0:0:0:1', '2016-08-06 18:34:18', null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000001', '2016030100000001', '2016-08-15 13:47:39', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000002', '2016030100000001', '2016-08-15 14:24:50', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000003', '2016030100000001', '2016-08-15 14:31:23', '0:0:0:0:0:0:0:1', '2016-08-15 14:32:59', null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000004', '2016081500000001', '2016-08-15 14:37:24', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000005', '2016030100000001', '2016-08-15 16:21:48', '0:0:0:0:0:0:0:1', '2016-08-15 20:33:14', null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000006', '2016030100000001', '2016-08-15 20:59:25', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000007', '2016030100000001', '2016-08-15 21:28:25', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081500000008', '2016030100000001', '2016-08-15 21:57:32', '0:0:0:0:0:0:0:1', '2016-08-15 22:05:11', null, null);
INSERT INTO `loginrecord` VALUES ('2016081600000001', '2016030100000001', '2016-08-16 22:34:50', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081600000002', '2016030100000001', '2016-08-16 22:40:29', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081600000003', '2016030100000001', '2016-08-16 22:59:14', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081700000001', '2016030100000001', '2016-08-17 22:25:33', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081700000002', '2016030100000001', '2016-08-17 22:33:01', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081700000003', '2016030100000001', '2016-08-17 23:13:36', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081700000004', '2016030100000001', '2016-08-17 23:24:44', '0:0:0:0:0:0:0:1', '2016-08-17 23:37:55', null, null);
INSERT INTO `loginrecord` VALUES ('2016081800000001', '2016030100000001', '2016-08-18 20:27:02', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081800000002', '2016030100000001', '2016-08-18 21:04:49', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081800000003', '2016030100000001', '2016-08-18 21:11:59', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016081800000004', '2016030100000001', '2016-08-18 21:19:59', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016082200000001', '2016030100000001', '2016-08-22 13:12:28', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016082200000002', '2016030100000001', '2016-08-22 14:18:16', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016082200000003', '2016030100000001', '2016-08-22 14:33:15', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016082200000004', '2016030100000001', '2016-08-22 16:02:02', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `loginrecord` VALUES ('2016082200000005', '2016030100000001', '2016-08-22 16:11:23', '0:0:0:0:0:0:0:1', '2016-08-22 16:23:54', null, null);
INSERT INTO `loginrecord` VALUES ('2016082200000006', '2016030100000001', '2016-08-22 16:31:41', '0:0:0:0:0:0:0:1', '2016-08-22 16:45:21', null, null);
INSERT INTO `loginrecord` VALUES ('2016082200000007', '2016030100000001', '2016-08-22 16:47:09', '0:0:0:0:0:0:0:1', '2016-08-23 00:24:30', null, null);
INSERT INTO `loginrecord` VALUES ('2016082300000001', '2016030100000001', '2016-08-23 00:27:05', '0:0:0:0:0:0:0:1', '2016-08-23 00:29:35', null, null);
INSERT INTO `loginrecord` VALUES ('2016082300000002', '2016030100000001', '2016-08-23 00:30:41', '0:0:0:0:0:0:0:1', '2016-08-23 00:42:48', null, null);
INSERT INTO `loginrecord` VALUES ('2016082300000003', '2016030100000001', '2016-08-23 00:43:18', '0:0:0:0:0:0:0:1', '2016-08-23 01:02:40', null, null);
INSERT INTO `loginrecord` VALUES ('2016082300000004', '2016030100000001', '2016-08-23 01:01:19', '0:0:0:0:0:0:0:1', '2016-08-23 01:04:28', null, null);
INSERT INTO `loginrecord` VALUES ('2016082300000005', '2016030100000001', '2016-08-23 01:03:18', '0:0:0:0:0:0:0:1', '2016-08-23 01:18:38', null, null);
INSERT INTO `loginrecord` VALUES ('2016082300000006', '2016030100000001', '2016-08-23 01:19:36', '0:0:0:0:0:0:0:1', '2016-08-23 01:28:21', null, null);
INSERT INTO `loginrecord` VALUES ('2016082300000007', '2016030100000001', '2016-08-23 01:29:15', '0:0:0:0:0:0:0:1', '2016-08-23 01:44:44', null, null);

-- ----------------------------
-- Table structure for onlineuser
-- ----------------------------
DROP TABLE IF EXISTS `onlineuser`;
CREATE TABLE `onlineuser` (
  `Id` char(16) NOT NULL,
  `Uid` char(16) NOT NULL,
  `SessionID` varchar(32) NOT NULL,
  `IpCode` varchar(16) NOT NULL,
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_OnlineUser_uid` (`Uid`),
  CONSTRAINT `fk_OnlineUser_uid` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onlineuser
-- ----------------------------

-- ----------------------------
-- Table structure for photoes
-- ----------------------------
DROP TABLE IF EXISTS `photoes`;
CREATE TABLE `photoes` (
  `PhotoesId` char(16) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Content` text NOT NULL,
  `Praise` int(11) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `PointId` char(16) DEFAULT NULL,
  `UnUsed1` varchar(16) DEFAULT NULL,
  `Unused2` varchar(16) DEFAULT NULL,
  KEY `fk_PhotoesId_PointId` (`PointId`) USING BTREE,
  KEY `PhotoesId` (`PhotoesId`),
  CONSTRAINT `fk_PhotoesId_PointId` FOREIGN KEY (`PointId`) REFERENCES `point` (`PointID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photoes
-- ----------------------------

-- ----------------------------
-- Table structure for photoitem
-- ----------------------------
DROP TABLE IF EXISTS `photoitem`;
CREATE TABLE `photoitem` (
  `PhotoId` char(16) NOT NULL,
  `PhotoesId` char(16) NOT NULL,
  `Content` text,
  `Url` varchar(120) NOT NULL,
  `Unused1` varchar(16) DEFAULT NULL,
  `Unused2` varchar(16) DEFAULT NULL,
  KEY `fk_PhotoItem_photoid` (`PhotoId`),
  CONSTRAINT `fk_PhotoItem_photoid` FOREIGN KEY (`PhotoId`) REFERENCES `photoes` (`PhotoesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photoitem
-- ----------------------------

-- ----------------------------
-- Table structure for point
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point` (
  `PointID` char(16) NOT NULL,
  `Title` varchar(20) NOT NULL COMMENT '标题',
  `Content` text NOT NULL COMMENT '内容',
  `Longitude` char(10) NOT NULL COMMENT '经度',
  `Latitude` char(10) NOT NULL COMMENT '维度',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `City` varchar(10) NOT NULL COMMENT '城市',
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0：待审核 1:启用 2：删除',
  `BigPhoto` varchar(150) NOT NULL COMMENT '大图路径',
  `SmallPhoto` varchar(150) DEFAULT NULL COMMENT '小图路径',
  `Uid` char(16) NOT NULL COMMENT '创建用户',
  `Praise` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `Down` int(11) NOT NULL DEFAULT '0' COMMENT '踩',
  `Label` varchar(50) DEFAULT NULL COMMENT '标签',
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  `UnUsed3` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`PointID`),
  KEY `fk_Point_Uid` (`Uid`),
  CONSTRAINT `fk_Point_Uid` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES ('2016081500000001', '汪家嘴立交', '无', '114.189715', '30.52862', '2016-08-15 00:00:00', '武汉', '1', '/file/user/pointphoto/2016081576D456991CCA41EF859077AEE3DF5E02.jpg', null, '2016030100000001', '0', '0', null, null, null, null);
INSERT INTO `point` VALUES ('2016081500000002', '马鹦路立交', '无', '114.262388', '30.54261', '2016-08-15 21:30:58', '武汉', '-1', '/file/user/pointphoto/20160815F672998FBF534B7093BCD4D7FDDB32FF.jpg', null, '2016030100000001', '0', '0', null, null, null, null);

-- ----------------------------
-- Table structure for pointcomment
-- ----------------------------
DROP TABLE IF EXISTS `pointcomment`;
CREATE TABLE `pointcomment` (
  `Id` char(24) NOT NULL,
  `PointId` char(16) NOT NULL COMMENT '摄影点',
  `Uid` char(16) NOT NULL COMMENT '用户',
  `Comment` text NOT NULL,
  `Praise` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '状态  0：正常  1：删除',
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_PointComment_PointID` (`PointId`),
  KEY `fk_PointComment_Uid` (`Uid`),
  CONSTRAINT `fk_PointComment_PointID` FOREIGN KEY (`PointId`) REFERENCES `point` (`PointID`),
  CONSTRAINT `fk_PointComment_Uid` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pointcomment
-- ----------------------------
INSERT INTO `pointcomment` VALUES ('201608150000000100000001', '2016081500000001', '2016030100000001', 'qqqqqqqqqqqqqqqqqqqq', '0', '2016-08-22 14:26:00', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000002', '2016081500000001', '2016030100000001', 'qqqqqqqqqqqqqqqqqqqq', '0', '2016-08-22 14:28:15', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000003', '2016081500000001', '2016030100000001', 'ffffffffffffffffffffffffffffff', '0', '2016-08-22 14:29:43', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000004', '2016081500000001', '2016030100000001', '22222222222', '0', '2016-08-22 14:33:27', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000005', '2016081500000001', '2016030100000001', '33333333333333333333333333333', '0', '2016-08-22 14:33:47', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000006', '2016081500000001', '2016030100000001', '上的飞机快圣诞节 ', '0', '2016-08-23 01:08:20', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000007', '2016081500000001', '2016030100000001', '文章，1984年6月26日出生于陕西省西安市，中国内地男演员、导演。2006年毕业于中央戏剧学院表演系', '0', '2016-08-23 01:09:14', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000008', '2016081500000001', '2016030100000001', '第31届大众电影百花奖最佳男主角奖；[8]  同年成立自己经营的北京君竹影视', '0', '2016-08-23 01:09:24', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000009', '2016081500000001', '2016030100000001', '2014年3月28日，主演的中韩合资文艺爱情片《我在路上最爱你》在全国上映。2014年12月18日，在姜文执导的动', '0', '2016-08-23 01:09:36', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000010', '2016081500000001', '2016030100000001', '房价还是咖啡还是咖啡还是副教授积分卡洛斯', '0', '2016-08-23 01:09:42', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000011', '2016081500000001', '2016030100000001', '防护技术开发和快速返回来开发建设路口', '0', '2016-08-23 01:09:47', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000012', '2016081500000001', '2016030100000001', '回复是尽快发货时间快点发货速度快解放和当时看见', '0', '2016-08-23 01:09:52', '0', null, null);
INSERT INTO `pointcomment` VALUES ('201608150000000100000013', '2016081500000001', '2016030100000001', 'dgdgdgdgdf', '0', '2016-08-23 01:34:55', '0', null, null);

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京市');
INSERT INTO `province` VALUES ('2', '天津市');
INSERT INTO `province` VALUES ('3', '上海市');
INSERT INTO `province` VALUES ('4', '重庆市');
INSERT INTO `province` VALUES ('5', '河北省');
INSERT INTO `province` VALUES ('6', '山西省');
INSERT INTO `province` VALUES ('7', '台湾省');
INSERT INTO `province` VALUES ('8', '辽宁省');
INSERT INTO `province` VALUES ('9', '吉林省');
INSERT INTO `province` VALUES ('10', '黑龙江省');
INSERT INTO `province` VALUES ('11', '江苏省');
INSERT INTO `province` VALUES ('12', '浙江省');
INSERT INTO `province` VALUES ('13', '安徽省');
INSERT INTO `province` VALUES ('14', '福建省');
INSERT INTO `province` VALUES ('15', '江西省');
INSERT INTO `province` VALUES ('16', '山东省');
INSERT INTO `province` VALUES ('17', '河南省');
INSERT INTO `province` VALUES ('18', '湖北省');
INSERT INTO `province` VALUES ('19', '湖南省');
INSERT INTO `province` VALUES ('20', '广东省');
INSERT INTO `province` VALUES ('21', '甘肃省');
INSERT INTO `province` VALUES ('22', '四川省');
INSERT INTO `province` VALUES ('23', '贵州省');
INSERT INTO `province` VALUES ('24', '海南省');
INSERT INTO `province` VALUES ('25', '云南省');
INSERT INTO `province` VALUES ('26', '青海省');
INSERT INTO `province` VALUES ('27', '陕西省');
INSERT INTO `province` VALUES ('28', '广西壮族自治区');
INSERT INTO `province` VALUES ('29', '西藏自治区');
INSERT INTO `province` VALUES ('30', '宁夏回族自治区');
INSERT INTO `province` VALUES ('31', '新疆维吾尔自治区');
INSERT INTO `province` VALUES ('32', '内蒙古自治区');
INSERT INTO `province` VALUES ('33', '澳门特别行政区');
INSERT INTO `province` VALUES ('34', '香港特别行政区');

-- ----------------------------
-- Table structure for right
-- ----------------------------
DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `RightId` int(11) NOT NULL AUTO_INCREMENT,
  `RightName` varchar(20) NOT NULL COMMENT '权限名称',
  `BlockId` int(11) NOT NULL COMMENT '模块id',
  `RightUrl` varchar(100) NOT NULL COMMENT '模块url',
  `IsActive` bit(1) NOT NULL DEFAULT b'1' COMMENT '0 ：禁用 1：启用',
  `Descripting` varchar(50) DEFAULT NULL COMMENT '描述',
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`RightId`),
  KEY `fk_Right_BlockId` (`BlockId`),
  CONSTRAINT `fk_Right_BlockId` FOREIGN KEY (`BlockId`) REFERENCES `block` (`BlockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(20) NOT NULL COMMENT '角色名称',
  `IsActive` bit(1) NOT NULL DEFAULT b'1' COMMENT '0：禁用 1：启用',
  `Descripting` varchar(50) DEFAULT NULL COMMENT '描述',
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for roleblockmap
-- ----------------------------
DROP TABLE IF EXISTS `roleblockmap`;
CREATE TABLE `roleblockmap` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` int(11) NOT NULL COMMENT '角色',
  `BlockId` int(11) NOT NULL COMMENT '模块',
  PRIMARY KEY (`Id`),
  KEY `fk_RoleBlockMap_RoleId` (`RoleId`),
  KEY `fk_RoleBlockMap_BlockId` (`BlockId`),
  CONSTRAINT `fk_RoleBlockMap_BlockId` FOREIGN KEY (`BlockId`) REFERENCES `block` (`BlockId`),
  CONSTRAINT `fk_RoleBlockMap_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleblockmap
-- ----------------------------

-- ----------------------------
-- Table structure for roleusermap
-- ----------------------------
DROP TABLE IF EXISTS `roleusermap`;
CREATE TABLE `roleusermap` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` int(11) NOT NULL COMMENT '角色',
  `Uid` char(16) NOT NULL COMMENT '账户',
  PRIMARY KEY (`Id`),
  KEY `fk_RoleUserMap_RoleId` (`RoleId`),
  KEY `fk_RoleUserMap` (`Uid`),
  CONSTRAINT `fk_RoleUserMap` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`),
  CONSTRAINT `fk_RoleUserMap_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleusermap
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Uid` char(16) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Nickname` varchar(20) NOT NULL,
  `Gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别 0：未知 1：男 2：女',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0：未激活 1：激活',
  `ActivationCode` char(64) NOT NULL,
  `HeadPicture` varchar(100) NOT NULL,
  `RegisterTime` date NOT NULL,
  `LoginCounts` int(11) NOT NULL DEFAULT '0',
  `Score` int(11) NOT NULL DEFAULT '0',
  `Role` tinyint(4) NOT NULL DEFAULT '1' COMMENT '角色 0 管理员 1普通用户',
  `Weibo` varchar(15) DEFAULT NULL,
  `QQ` varchar(15) DEFAULT NULL,
  `Brief` varchar(100) DEFAULT NULL,
  `Location` varchar(10) DEFAULT NULL,
  `LastTime` datetime DEFAULT NULL,
  `LastIp` varchar(16) DEFAULT NULL,
  `UnUsed1` varchar(16) DEFAULT NULL,
  `UnUsed2` varchar(16) DEFAULT NULL,
  `UnUsed3` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2016030100000001', '329088816@qq.com', '123456', '与中秋有约', '1', '1', '2A0E2015D59040AA9AAF3D550DC61397ABF9EF03E51C4FB69D9538FB5491920F', '/file/user/headpicture/20160312FA1FF08F09024152B08ED1538420CADD.jpg', '2016-03-01', '90', '14', '0', '', '', '哈哈哈', '杭州', '2016-08-23 01:29:15', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `user` VALUES ('2016081500000001', '1257328047@qq.com', '123456', '23333', '0', '1', '4692A8FC9B3142AB95F516F011BDCAF12AF0E8F2292F4F9C9707703EA09CE1EE', '/file/user/headpicture/headpicture.png', '2016-08-15', '1', '1', '1', null, null, null, null, '2016-08-15 14:37:24', '0:0:0:0:0:0:0:1', null, null, null);
