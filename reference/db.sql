#
####################################
#  !!! SQL_MODE=NO_AUTO_VALUE_ON_ZERO MUST be set before import
####################################
DROP DATABASE `ucm`;

CREATE DATABASE `ucm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ucm;

CREATE TABLE IF NOT EXISTS `summary` (
  `Street City` VARCHAR(100) NULL DEFAULT NULL,
  `Assigned Acct` VARCHAR(100) NULL DEFAULT NULL,
  `Assigned User ID` VARCHAR(100) NULL DEFAULT NULL,
  `Call Back` VARCHAR(100) NULL DEFAULT NULL,
  `City` VARCHAR(100) NULL DEFAULT NULL,
  `Client Ref` VARCHAR(100) NULL DEFAULT NULL,
  `Cmp Styl Info` VARCHAR(100) NULL DEFAULT NULL,
  `Company` VARCHAR(100) NULL DEFAULT NULL,
  `Completed` VARCHAR(100) NULL DEFAULT NULL,
  `Contact` VARCHAR(100) NULL DEFAULT NULL,
  `Contact Phone` VARCHAR(100) NULL DEFAULT NULL,
  `Contacted` VARCHAR(100) NULL DEFAULT NULL,
  `Country` VARCHAR(100) NULL DEFAULT NULL,
  `CUIC` VARCHAR(100) NULL DEFAULT NULL,
  `Cust IA` VARCHAR(100) NULL DEFAULT NULL,
  `Opened` VARCHAR(100) NULL DEFAULT NULL,
  `Updated` VARCHAR(100) NULL DEFAULT NULL,
  `Dept` VARCHAR(100) NULL DEFAULT NULL,
  `Device` VARCHAR(100) NULL DEFAULT NULL,
  `ET` VARCHAR(100) NULL DEFAULT NULL,
  `Headline` VARCHAR(100) NULL DEFAULT NULL,
  `Host Proc` VARCHAR(100) NULL DEFAULT NULL,
  `Incident` VARCHAR(100) NOT NULL,
  `Mfg` VARCHAR(100) NULL DEFAULT NULL,
  `Model` VARCHAR(100) NULL DEFAULT NULL,
  `Natl Global Acct` VARCHAR(100) NULL DEFAULT NULL,
  `Obligation` VARCHAR(100) NULL DEFAULT NULL,
  `Parts` VARCHAR(100) NULL DEFAULT NULL,
  `Phone Resp` VARCHAR(100) NULL DEFAULT NULL,
  `Postal Code` VARCHAR(100) NULL DEFAULT NULL,
  `Primary` VARCHAR(100) NULL DEFAULT NULL,
  `Pri` VARCHAR(100) NULL DEFAULT NULL,
  `Product` VARCHAR(100) NULL DEFAULT NULL,
  `Level` VARCHAR(100) NULL DEFAULT NULL,
  `Prov 1` VARCHAR(100) NULL DEFAULT NULL,
  `Prov 2` VARCHAR(100) NULL DEFAULT NULL,
  `Prov 3` VARCHAR(100) NULL DEFAULT NULL,
  `Prov 4` VARCHAR(100) NULL DEFAULT NULL,
  `Prov 5` VARCHAR(100) NULL DEFAULT NULL,
  `Prov Name` VARCHAR(100) NULL DEFAULT NULL,
  `Onsite D T` VARCHAR(100) NULL DEFAULT NULL,
  `Prov Pri` VARCHAR(100) NULL DEFAULT NULL,
  `Request Type` VARCHAR(100) NULL DEFAULT NULL,
  `Resolution Detail` VARCHAR(100) NULL DEFAULT NULL,
  `Resolution` VARCHAR(100) NULL DEFAULT NULL,
  `Res Type` VARCHAR(100) NULL DEFAULT NULL,
  `Response` VARCHAR(100) NULL DEFAULT NULL,
  `Restore` VARCHAR(100) NULL DEFAULT NULL,
  `SLA` VARCHAR(100) NULL DEFAULT NULL,
  `Scheduled` VARCHAR(100) NULL DEFAULT NULL,
  `Self ID` VARCHAR(100) NULL DEFAULT NULL,
  `SN` VARCHAR(100) NULL DEFAULT NULL,
  `Serv Tag` VARCHAR(100) NULL DEFAULT NULL,
  `Service Type` VARCHAR(100) NULL DEFAULT NULL,
  `St Pr` VARCHAR(100) NULL DEFAULT NULL,
  `Status` VARCHAR(100) NULL DEFAULT NULL,
  `UStyle` VARCHAR(100) NULL DEFAULT NULL,
  `SS` VARCHAR(100) NULL DEFAULT NULL,
  `Subacct 1` VARCHAR(100) NULL DEFAULT NULL,
  `Subacct 2` VARCHAR(100) NULL DEFAULT NULL,
  `Subacct 3` VARCHAR(100) NULL DEFAULT NULL,
  `Subacct 4` VARCHAR(100) NULL DEFAULT NULL,
  `Subacct 5` VARCHAR(100) NULL DEFAULT NULL,
  `Subacct 6` VARCHAR(100) NULL DEFAULT NULL,
  `SysDn` VARCHAR(100) NULL DEFAULT NULL,
  `TZ` VARCHAR(100) NULL DEFAULT NULL,
  `UnitDn` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`Incident`),
  UNIQUE KEY `unique_index_incident`(`Incident`)
)
CHARACTER SET = utf8mb4,
COLLATE = utf8mb4_unicode_ci,
COMMENT = 'summary',
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `pn`(
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pn` VARCHAR(100) NOT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `provider` VARCHAR(100) NULL DEFAULT NULL,
  `category` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_pn`(`pn`)
)
AUTO_INCREMENT=0,
CHARACTER SET = utf8mb4,
COLLATE = utf8mb4_unicode_ci,
COMMENT = 'pn',
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `sn` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sn`  VARCHAR(100) NOT NULL,
  `pnid` INT(11) UNSIGNED NOT NULL,
  `company` VARCHAR(100) NOT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `primarycontact` VARCHAR(100) NULL DEFAULT NULL,
  `primarymail` VARCHAR(100) NULL DEFAULT NULL,
  `slavecontact` VARCHAR(100) NULL DEFAULT NULL,
  `slavemail` VARCHAR(100) NULL DEFAULT NULL,
  `ia` VARCHAR(100) NULL DEFAULT NULL,
  `party` VARCHAR(100) NULL DEFAULT NULL,
  `comment` TEXT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_sn`(`sn`),
  FOREIGN KEY `foreign_key_pnid` (`pnid`) REFERENCES `pn` (`id`)
)
AUTO_INCREMENT=0,
CHARACTER SET = utf8mb4,
COLLATE = utf8mb4_unicode_ci,
COMMENT = 'sn',
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `sr` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `srms`  VARCHAR(100) NOT NULL,
  `task` VARCHAR(100) NULL DEFAULT NULL,
  `sr` VARCHAR(100) NULL DEFAULT NULL,
  `snid` INT(11) UNSIGNED NOT NULL,
  `opendate` VARCHAR(100) NOT NULL,
  `headline` VARCHAR(255) NOT NULL,
  `notes` TEXT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_srms`(`srms`),
  FOREIGN KEY `foreign_key_snid` (`snid`) REFERENCES `sn` (`id`)
#  FOREIGN KEY `foreign_key_srms` (`srms`) REFERENCES `summary` (`Incident`)
)
AUTO_INCREMENT=0,
CHARACTER SET = utf8mb4,
COLLATE = utf8mb4_unicode_ci,
COMMENT = 'sr',
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `ac` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `srid` INT(11) UNSIGNED NOT NULL,
  `actiondate` VARCHAR(100) NOT NULL,
  `actiontime` VARCHAR(100) NOT NULL,
  `duration` VARCHAR(100) NOT NULL,
  `otfrom` VARCHAR(100) NULL DEFAULT NULL,
  `otto` VARCHAR(100) NULL DEFAULT NULL,
  `action` VARCHAR(100) NOT NULL,
  `actiontype` VARCHAR(100) NOT NULL,
  `remark` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY `foreign_key_srid` (`srid`) REFERENCES `sr` (`id`)
)
AUTO_INCREMENT=0,
CHARACTER SET = utf8mb4,
COLLATE = utf8mb4_unicode_ci,
COMMENT = 'ac',
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `hw` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acid` INT(11) UNSIGNED NOT NULL,
  `newpnid` INT(11) UNSIGNED NULL DEFAULT NULL,
  `newsn` VARCHAR(100) NULL DEFAULT NULL,
  `oldpnid` INT(11) UNSIGNED NULL DEFAULT NULL,
  `oldsn` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `newhw` (`newpnid`, `newsn`),
  INDEX `oldhw` (`oldpnid`, `oldsn`),
  FOREIGN KEY `foreign_key_acid` (`acid`) REFERENCES `ac` (`id`),
  FOREIGN KEY `foreign_key_newpnid` (`newpnid`) REFERENCES `pn` (`id`),
  FOREIGN KEY `foreign_key_oldpnid` (`oldpnid`) REFERENCES `pn` (`id`)
)
AUTO_INCREMENT=0,
CHARACTER SET = utf8mb4,
COLLATE = utf8mb4_unicode_ci,
COMMENT = 'hw',
ENGINE = InnoDB
;

INSERT INTO `ucm`.`pn` (`id`, `pn`, `description`, `provider`, `category`) VALUES ('0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN'), ('1', 'DF700', 'AMS 200, 500, 1000', 'HDS', 'DEVICE'), ('2', 'DF800', 'AMS 2000', 'HDS', 'DEVICE'), ('3', 'DF850', 'HUS', 'HDS', 'DEVICE'), ('4', 'DW700', 'HUS VM =HM700', 'HDS', 'DEVICE'), ('5', 'DW800', 'VSP Gx00 and Fx00 =HM800', 'HDS', 'DEVICE'), ('6', 'RAID600', 'USP V/VM', 'HDS', 'DEVICE'), ('7', 'RAID700', 'VSP DKC710I', 'HDS', 'DEVICE'), ('8', 'RAID800', 'VSP G1x00 and F1x00 DKC810I', 'HDS', 'DEVICE'), ('9', '3285276-P', 'HDD ASSY 3HGSSH 300GB 15K SAS SFF HUS w/o BNST', 'HDS', 'DRIVE'), ('10', '3285276-A', 'DF-F850-3HGSSH 300GB/15k/6Gbps/SAS-HDD', 'HDS', 'DRIVE'), ('11', '3282390-A', 'SFF Disk Drive (for DBS) (600GB/10k/6Gbps/SAS-HDD)', 'HDS', 'DRIVE'), ('12', '3282390-Q', 'HDD ASSY 6HGSS 600GB SAS SFF W/O BNST', 'HDS', 'DRIVE'), ('13', '5541892-A', 'HDU700-600JCMSS', 'HDS', 'DRIVE'), ('14', '3285197-A', 'TDPS-600FB A POWER SUPPLY DBS/DBL', 'HDS', 'POWER SUPPLY'), ('15', '3285197-P', 'TDPS-600FB A POWER SUPPLY DBS/DBL', 'HDS', 'POWER SUPPLY'), ('16', '5552789-P', 'HDD 2.5 inch Disk drive 1.2TB/10kmin-1 w/o BNST', 'HDS', 'DRIVE'), ('17', '3276138-D', 'HDD ASSY AKH600 SAS 600GB 15K RPM', 'HDS', 'DRIVE'), ('18', '5559119-P', '', 'HDS', 'DRIVE'), ('19', 'XBR-000163', 'SFP+, SWL, BR, 8G, 1-PK', 'HDS', 'SFP'), ('20', 'XBR-000192', 'SFP+, SWL,16G, 1-PK, BR', 'HDS', 'SFP'), ('21', 'HD-6510-48-16G-0R.P', 'Brocade 6510, 48P, 16Gb SWL SFPs, port side exhaust,rack kit', 'HDS', 'DEVICE'), ('22', '5541890-A', '2.5 INCH DISK DRIVE 300GB/10KMIN -1', 'HDS', 'DRIVE'), ('23', '900-566-030', 'VNX5200', 'EMC', 'DEVICE'), ('24', '100-652-541', 'DS-300B', 'EMC', 'DEVICE'), ('25', '100-652-065', 'DS-300B', 'EMC', 'DEVICE'), ('26', '3286696-A', 'HAE-Q1R6SS HDU800-1R6FNSS (for FBX) (1.75TB (1.6TiB)/6Gbps/FMD)', 'HDS', 'DRIVE'), ('27', '005050927', 'DRIVE 600G 15K 3.5 SAS 6G 520 15 B TAA', 'EMC', 'DRIVE'), ('28', '005050928', '', 'EMC', 'DRIVE'), ('29', '078-000-085', '1200W SPS DC SPS, 2ND ED COMP', 'EMC', 'SPS'), ('30', '5559498-A', '2.5 DISK DRIVE 600GB/15KMIN', 'HDS', 'DRIVE'), ('31', '900-566-029', 'VNX5400', 'EMC', 'DEVICE'), ('32', '900-567-007', 'VNX5100', 'EMC', 'DEVICE'), ('33', '900-567-006', 'VNX5700', 'EMC', 'DEVICE'), ('34', '900-567-002', 'VNX5300', 'EMC', 'DEVICE'), ('35', '900-567-001', 'VNX5500', 'EMC', 'DEVICE'), ('36', '900-566-028', 'VNX5600', 'EMC', 'DEVICE'), ('37', '900-566-027', 'VNX5800', 'EMC', 'DEVICE'), ('38', '900-566-026', 'VNX7600', 'EMC', 'DEVICE'), ('39', '900-566-001', 'CX4-240C', 'EMC', 'DEVICE'), ('40', '303-224-000C-03', 'JETFIRE 6G SAS PCB ASSEMBLY (VNX2 BASE MODULE)', 'EMC', 'STORAGE PROCESSOR'), ('41', '303-195-100C-01', 'Two-port 10-Gb/s I/O module', 'EMC', 'I/O MODULE'), ('42', '071-000-543', 'P/S AC-DC 400WATT 2U, SGL 12V OUTPUT (DPE PS FOR VNX1)', 'EMC', 'POWER SUPPLY'), ('43', '038-004-039', '2M MINISAS HD TO MINISAS REG FLEXIBLE', 'EMC', 'CABLE'), ('44', '005050554', '', 'EMC', 'DRIVE'), ('45', '005050854', 'DRV 600G 15K 3.5 SAS 6G 520 15 B TAA', 'EMC', 'DRIVE'), ('46', '005049675', 'BRK ASY DRV 600G 15K 3.5 SAS 520 DV VIP', 'EMC', 'DRIVE'), ('47', '005049274', 'ASY DRV 600G 15K 3.5 SAS 520 DV VIPERVE B', 'EMC', 'DRIVE'), ('48', '005050349', 'DDA 900GB 10K 2.5 SAS 520 DERR B TAA', 'EMC', 'DRIVE'), ('49', '900-566-016', 'VNX7500', 'EMC', 'DEVICE'), ('50', '005051467', 'DV 900GB 10K 2.5 6Gb SAS 520 B 25 T', 'EMC', 'DRIVE'), ('51', '005049206', 'ASSY DISK 2.5 900GB SAS 10K 520BS B CLS', 'EMC', 'DRIVE'), ('52', '019-078-042', 'SFP+ MULTI MODE 8G FC OPTICAL XCVR', 'EMC', 'SFP'), ('53', '071-000-036-04', 'GEN1 PLUS CFF Wide Range 1050W ACDC PSU', 'EMC', 'POWER SUPPLY'), ('54', '3272219-C', 'HDD AGF146 W/USB 146GB 10K', 'HDS', 'DRIVE'), ('55', '3276138-R', '', 'HDS', 'DRIVE'), ('56', '3276139-C', 'HDD ASSY SATA AVE1K 1TB 7.2K RPM', 'HDS', 'DRIVE'), ('57', '005051957', '', 'EMC', 'DRIVE'), ('58', '005049809', '', 'EMC', 'DRIVE'), ('59', '005052060', '', 'EMC', 'DRIVE');

INSERT INTO `ucm`.`sn` (`id`, `sn`, `pnid`, `company`, `address`, `primarycontact`, `primarymail`, `slavecontact`, `slavemail`, `ia`, `party`, `comment`) VALUES ('0', 'UNKNOWN', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN'), ('1', '210396', '4', 'HDS/GITI TIRE(CHINA) INVESTMENT COMPANY', 'NO.280-2, LINHONG ROAD', '邓新权 021-22073182 14782197776', '', '', '', '00199828', '', ''), ('2', '212599', '4', 'HDS/CTRIP TRAVEL INFORMATION TECHNOLOGY', 'NO.196 OUYANG ROAD', '倪文亚 15121035019', '', '', '', '00198732', '', '"2楼 2-1机房 C15机柜\nRDP Port: 57619\nRDP Pass: Waterlotus `1@#$%^"'), ('3', '412971', '5', 'HDS/SMIC NOW', 'NO.18 ZHANGJIANG ROAD', 'LIU TAO 13701685560', 'tao_liu2@smics.com', '', '', '00209196', '', '"进门带备件需填单\n此设备在厂区内进门需安检，无法携带电子设备"'), ('4', '91213544', '3', 'HDS/BYSTRONIC CO., LTD. (SHANGHAI)', '上海长宁区福泉北路388号', '倪志峰 13916265457', '', '', '', '00207674', '', ''), ('5', '90603', '7', 'HDS/CHINA UNICOM LTD.', '西安路78号', '李飞贵 18601721871', '', '', '', '00198732', '', ''), ('6', '212670', '4', 'HDS/CTRIP TRAVEL INFORMATION TECHNOLOGY', 'NO.196 OUYANG ROAD', '倪文亚 15121035019', '', '', '', '', '', '"2楼 2-1机房 C15机柜\nRDP Port: 57619\nRDP Pass: Waterlotus `1@#$%^"'), ('7', '210962', '4', 'HDS/CTRIP TRAVEL NETWORK TECHNOLOGY (SHA', 'NO.801 NING QIAO ROAD', '杨雨阳 13701609161', '', '', '', '00198732', '', '2期2楼 L3-20'), ('8', '211558', '4', 'HDS/ZHEJIANG NAN HUA CAPITAL MANAGEMENT', 'NO.996 LAI AN ROAD', '刘杰亮 13916193303', '', '', '', '00200238', '353600', ''), ('9', '412512', '5', 'HDS/HUADONG HOSPITAL AFFILIATED TO FUDAN', 'NO.221 WEST YAN AN ROAD', '钱伟 13917724862', '', '', '', '00199856', '511021', ''), ('10', '83018351', '2', 'HDS/YIHAI KERRY INVESTMENTS CO., LTD', '华能大厦26F', 'ZHOU YU 13817359237', '', '', '', '00200220', '224141', ''), ('11', '450967', '5', 'HDS/EXPEDITORS INTERNATIONAL', 'NO.1, LANE 128, LINHONG ROAD', '段志刚 13918660802', '', '', '', '00199813', '276832', ''), ('12', 'BRW2510M029', '21', 'HDS/YUM! BRANDS INC., CHINA DIVISION', 'NO. 6 ZHENDA ROAD', 'Tang Yucheng 18930870667', '', '', '', '00208194', '452055', 'IP:172.31.162.122'), ('13', '240425', '4', 'HDS/HUATAI INSURANCE COMPANY OF CHINA, L', 'NO.68, XIUPU ROAD KANGQIAO TOW', 'LIU TAO 18911861508', '', '', '', '00198732', '', '机房值班电话 Huang Huiliang 18916953569'), ('14', '212246', '4', 'HDS/CTRIP TRAVEL INFORMATION TECHNOLOGY', 'NO.801, NINGQIAO ROADPUDONG NE', '杨雨阳 13701609161', '', '', '', '00198732', '', ''), ('15', '90320', '7', 'HDS/CHINA MOBILE COMMUNICATIONS CORPORAT', '2ND BUILDING, NO.636 YUNQIAO R', 'MA HUANHUAN 13817730192', '', '', '', '00198732', '', ''), ('16', '90808', '7', 'HDS/CHINA TELECOM CORPORATION LTD', 'NO.5678, YANGGAONAN ROAD', 'CHEN HAOBO 18918580667', '', '', '', '00198732', '', ''), ('17', '412239', '5', 'HDS/SHANGHAI CHILDRENS MEDICAL CENTER', 'NO.1678 DONGFANG ROAD', '何主任 18930830687', '', '', '', '00209280', '510690', ''), ('18', '51915', '8', 'HDS/CHINA MOBILE COMMUNICATIONS CORPORAT', '2ND BUILDING, NO.636 YUNQIAO R', 'MA HUANHUAN 13817730192', '', '', '', '00198732', '', ''), ('19', 'CKM00124100201', '0', 'EMC_SHANGHAI_CARDINFOLINK_DATA_SERVICE', '', '', '', '', '', '', '', ''), ('20', 'CKM00140100845', '23', 'EMC_ALIXPARTNERS_C_O_EQUINIX', 'NO. 619 LONGCHANG ROAD', '', '', '', '', '00048623', '1003880121', 'ETS-Inf-Support@alixpartners.com;stonking@alixpartners.com'), ('21', 'BRCALJ1947K0KS', '0', 'EMC-ALLIANZ CHINA LIFE INSURANCE CO., L', 'NO.360 SOUTH PUDONG RD, NEW SH', '', '', '', '', '', '9276834', ''), ('22', '412128', '5', 'HDS/SHANGHAI ANE SUPPLY CHAIN MANAGEMENT', 'NO.523 HULAN ROAD', '刘洁 15721146014', '', '', '', '00200035', '506125', '安能'), ('23', 'FCN00120600506', '0', 'EMC-SHANGHAI LOREAL CHINA', '芳春路400号', 'Chen 13761931797', 'glen.chen@loreal.com', '', '', '', '4094098', ''), ('24', 'FCN00123300080', '49', 'EMC-CMB SHANGHAI', '11 FL, HANGKE BUILDING', 'HUANG WEIHAI 13917196988', '', '', '', '01002383', '3882304', ''), ('25', 'CKM00123903667', '33', 'EMC-CDL-SHANGHAI GENERAL MOTORS', '1500 SHENJIANG RD PUDONG JINQI', 'YAN XIAOCI 13601747715', '', '', '', '10025197', '2926746', ''), ('26', 'CETV2144400006', '31', 'EMC-ZHEJIANG SEMIR GARMENT CO., LTD.', 'NO 2689 LIANHUA S RD', 'WANG SHEN 18019701597 67285621', '', '', '', '01032770', '4236449', ''), ('27', '92217663', '3', 'Branch of Shanghai First People’s Hospital', 'No.1878, North Sichuan Road', 'Chen Tiande 18727908080', 'ctd1011@163.com', '', '', '00111376', '414933I', ''), ('28', '92213422', '3', 'Shanghai Jiangnan Changxing Shipbuilding Co., Ltd.', 'No.2468, Changxing-Jiangnan Avenue', 'WANG KAI 13681822368', 'wangk@chinascs.com.cn', '', '', '00111376', '415432I', ''), ('29', 'CKM00132000185', '35', 'EMC-AIG GENERAL INSURANCE COMPANY CHINA', 'NO 16,LIANGJING ROAD, ZHANGJIA 博霞路50号', 'MARK 18918208821', '', '', '', '00123922', '11251777', ''), ('30', 'CETV2160400036', '37', 'EMC-PACIFIC SECURITIES CO.,(SHANGHAI)', 'NO.1, HUAJING RD', 'MR. GUO 13916919207', '284057128@qq.com', '', '', '01025606', '24486457', ''), ('31', 'CETV2152200110', '31', 'EMC-GENERAL MOTORS (SHANGHAI)', 'NO 56 JINWAN ROAD', 'FRANKIE ZHAO', '', '', '', '01019846', '13573968', ''), ('32', '75010250', '1', 'Lucent Technologies Optical Networks (China) Co Ltd.', 'NO.388 NING QIAO ROAD', 'LI HUA 13917080591', 'hua.a.li@alcatel-sbell.com.cn', '', '', '00111376', '397286I', ''), ('33', '83002613', '2', 'Morgan Stanley Information Technology (Shanghai) Limited', '芳甸路1155号15F', 'Michael黄俞 13816564760 20352100', '', '', '', '00111376', '394915I', ''), ('34', '83019425', '2', 'Oriental Cable Network', '金科路2860号', 'ZHANG LIANG 13917583559', '', '', '', '00111376', '394733I', '从金科路门进电梯上2楼右转第一间'), ('35', '424715', '5', 'Yum! Brands Inc., China Division', 'No. 6 Zhenda Road (Cross West Taopu Road)', 'Tang Yucheng 18930870667', '', '', '', '00111376', '640498I', ''), ('36', '410615', '5', 'Shanghai Baosight Software Co., Ltd.', 'No.515, Guo Shoujing Road', 'Gu Jianhua 13601637337', '', '', '', '00111376', '412405I', ''), ('37', 'CETV2135000034', '31', 'EMC-FUND SETTLEMENT CENTER OF CITY COMM', 'NO.699 ZHANGYANG ROAD PUDONG N', 'SUN XIN 18521565106', '', '', '', '01029993', '28957453', '城商行 光新路上海银行'), ('38', 'CETV2143600021', '31', 'EMC-PHOENIX PUBLISHING & MEDIA', 'NO.165 ZHONGYANG ROAD,GULOU', 'MR LI 13585862744', '', '', '', '01023732', '15529038', '上海恒瑞制药 文井路279号'), ('39', '83019519', '2', 'Oriental Cable Network', '上海浦东张江金科路2860号306室', '张亮 13917583559', '', '', '', '00111376', '394733I', ''), ('40', 'FCN00130900120', '34', 'EMC-DORSEY WHITNEY LLP', 'KERRY PARKSIDE NO1155 FANGDIAN RD', '', '', '', '', '01030168', '26295862', '');

INSERT INTO `ucm`.`sr` (`id`, `srms`, `task`, `sr`, `snid`, `headline`, `opendate`) VALUES ('0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '0', 'UNKNOWN', 'UNKNOWN'), ('1', '47310296', '00205119', '', '1', 'HDD08-06', '2018-02-24'), ('2', '47348976', '00213470', '', '2', 'HDD05-05', '2018-03-01'), ('3', '47327329', '00211302', '', '3', 'DBPS', '2018-02-27'), ('4', '47313491', '00203053', '', '4', 'HDD00-19', '2018-02-26'), ('5', '47310161', '00205005', '', '5', 'HDU007-07', '2018-02-24'), ('6', '47371082', '00219107', '', '6', 'DBPS11-1', '2018-03-03'), ('7', '47377379', '00208561', '', '7', 'DBPS09-1', '2018-03-05'), ('8', '47375783', '00222371', '', '0', 'HEALTH CHECK Q1-2018', '2018-03-05'), ('9', '47401350', '00222383', '', '0', 'HEALTH CHECK Q1-2018', '2018-03-07'), ('10', '47401339', '00222380', '', '0', 'HEALTH CHECK Q1-2018', '2018-03-07'), ('11', '47401330', '00222376', '', '0', 'HEALTH CHECK Q1-2018', '2018-03-07'), ('12', '47426448', '00228546', '', '9', 'HDD01-21', '2018-03-09'), ('13', '47426879', '00230809', '', '8', 'HDD01-16', '2018-03-09'), ('14', '47451681', '00237189', '', '10', 'HDD00-02', '2018-03-14'), ('15', '47453026', '00238519', '', '5', 'HDU005-0F', '2018-03-14'), ('16', '46399128', '00098232', '', '11', 'HDD02-22', '2018-01-03'), ('17', '47488546', '00244389', '', '12', 'SFP 29', '2018-03-16'), ('18', '47499310', '00247328', '', '13', 'DBPS01-2', '2018-03-17'), ('19', '47500679', '00247591', '', '14', 'HDD12-05', '2018-03-18'), ('20', '47513265', '00253014', '', '5', 'HDU004-05', '2018-03-20'), ('21', '47527192', '00238876', '', '15', 'HDD015-0A', '2018-03-21'), ('22', '47548725', '00259214', '', '16', 'ALTER FOR INSTALLATION', '2018-03-23'), ('23', '47551004', '00260495', '', '17', 'HDD01-11', '2018-03-23'), ('24', '47552723', '00260815', '', '18', 'FMDHDD000-01', '2018-03-23'), ('25', '37141218', '33853082', '79909752', '19', 'WEBEX', '2016-12-14'), ('26', '46422469', '40346779', '90471164', '20', 'DISK 0.1.10', '2018-01-05'), ('27', '37075580', '33755739', '79772704', '21', 'REPLACE SWITCH', '2016-06-06'), ('28', '47587702', '00269643', '', '7', 'DBPS09-1', '2018-03-28'), ('29', '47599378', '00271856', '', '7', 'DBPS10-1', '2018-03-29'), ('30', '47599400', '00272495', '', '22', 'HDD Col-Row: 02-04', '2018-03-29'), ('31', '38737191', '36040661', '83541668', '23', 'REPLACE DISK 2.4.6 AND SPS-B', '2016-12-16');

INSERT INTO `ucm`.`ac` (`id`, `srid`, `actiondate`, `actiontime`, `duration`, `action`, `actiontype`) VALUES ('0', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN'), ('1', '1', '2018-02-26', '', '', 'REPLACE HDD08-06', ''), ('2', '2', '2018-03-01', '', '', 'REPLACE HDD05-05', ''), ('3', '3', '2018-02-28', '', '', 'DBPS POWER CABLE RELEASED, RE-PLUG CABLE.', ''), ('4', '4', '2018-02-27', '', '', 'REPLACE HDD00-19', ''), ('5', '5', '2018-02-24', '', '', 'REPLACE HDD HDU007-07', ''), ('6', '6', '2018-03-03', '', '', 'REPLACE DBPS11-1', ''), ('7', '7', '2018-03-06', '', '', 'REPLACE DBPS00-1', ''), ('8', '8', '2018-03-07', '', '', 'HEALTH CHECK', ''), ('9', '9', '2018-03-09', '', '', 'HEALTH CHECK', ''), ('10', '10', '2018-03-21', '', '', 'HEALTH CHECK', ''), ('11', '11', '2018-03-15', '', '', 'HEALTH CHECK', ''), ('12', '12', '2018-03-09', '', '', 'REPLACE HDD01-21', ''), ('13', '13', '2018-03-09', '', '', 'REPLACE HDD01-16', ''), ('14', '14', '2018-03-15', '', '', 'REPLACE HDD00-02', ''), ('15', '15', '2018-03-14', '', '', 'REPLACE HDU005-0F', ''), ('16', '16', '2018-01-04', '', '', 'REPLACE HDD02-22', ''), ('17', '17', '2018-03-16', '', '', 'EXCHANGE SFP 47 TO 29', ''), ('18', '18', '2018-03-19', '', '', 'REPLACE DBPS01-2', ''), ('19', '19', '2018-03-19', '', '', 'REPLACE HDD12-05', ''), ('20', '20', '2018-03-21', '', '', 'REPLACE HDU004-05', ''), ('21', '21', '2018-03-22', '', '', 'REPLACE HDD015-0A', ''), ('22', '22', '2018-03-23', '', '', 'INSTALLATION', ''), ('23', '22', '2018-03-27', '', '', 'INSTALLATION', ''), ('24', '23', '2018-03-26', '', '', 'REPLACE HDD01-11', ''), ('25', '24', '2018-03-26', '', '', 'REPLACE FMDHDD000-01', ''), ('26', '27', '2016-06-06', '', '', 'REPLACE SWITCH', ''), ('27', '28', '2018-03-28', '', '', 'REPLACE DBPS09-1', ''), ('28', '31', '2016-12-16', '', '', 'REPLACE DISK 2.4.6 AND SPS-B', ''), ('29', '31', '2016-12-16', '', '', 'REPLACE DISK 2.4.6 AND SPS-B', ''), ('30', '30', '2018-03-30', '', '', 'REPLACE HDD02-04', ''), ('31', '29', '2018-03-30', '', '', 'REPLACE DBPS10-1', '');

INSERT INTO `ucm`.`hw` (`acid`, `newpnid`, `newsn`, `oldpnid`, `oldsn`) VALUES ('1', '9', '3HGSSHC3285276-PS7K03GJS355C1554', '10', '3HGSSH3285276-A6XN1CAH7355PB29'), ('2', '12', '6HGSSC3282390-QW7GSJAVX355C0356', '11', '6HGSS3282390-AS0M1LBKL355Z542'), ('4', '12', '355C0FS0M59B7W', '11', '6HGSS3282390-AKNJ7R8YF355PD36'), ('5', '13', '3556DS0M6MVXQ', '13', 'R5D-J600SS5541892-AKNJAXG9F355JL36'), ('6', '14', '3553285197-A00035308', '14', '3553285197-A00060001'), ('7', '15', '3553285197-P00016032', '14', '3553285197-A00033995'), ('12', '16', '07BA7AW4016ROD', '16', 'S5H-J1R2SS5552789-PS402YMCX355A7A71'), ('13', '9', '355C15S7K03GP9', '10', '3HGSSH3285276-A6XN3RG16355PB37'), ('14', '17', 'AKH6003276138-D355TN2AWUN9SN', '17', 'AKH6003276138-D355TNCZXW8MMN'), ('15', '13', '355JLW7JTASAG', '13', 'R5C-J600SS5541892-APZHH5SXD355GL32'), ('16', '18', '717A28L0JP6L0K', '18', '717A2865'), ('18', '14', '7173285197-A40009625', '15', '3553285197-P00005311'), ('19', '12', '355C03W7GS3ZGX', '11', '6HGSS3282390-AKSJE4MZF717PD41'), ('20', '13', '355JLW7JTB8JG', '13', 'R5C-J600SS5541892-APZHJWGKD355GL32'), ('21', '22', '717GJPMKLWUHB', '22', 'R5C-J300SS5541890-APMX0G6JD355GJ2B'), ('24', '16', 'R5G-J1R2SS5552789-P06HS08JA717A3S75', '16', 'R5G-J1R2SS5552789-P06HL24RA355A3S71'), ('25', '26', '355B09NGH0037G', '26', 'HAE-Q1R6SS3286696-ANGF007AG355B0667'), ('26', '24', 'BRCALJ2524F0J8', '25', 'BRCALJ1947K0KS'), ('27', '14', '7173285197-A40041321', '14', '3553285197-A00035553'), ('28', '27', 'CE803163424071', '28', 'FCNHD151224079'), ('29', '29', 'ACP55163400191', '29', 'ACP55134601034'), ('30', '30', 'DKR5C-K600SS5559498-A0XKJWS9R07BMK7C', '30', 'S5D-K600SS5559498-AS7M1BM44355A526B'), ('31', '14', '3553285197-A00015259', '14', '3553285197-A00034011');
