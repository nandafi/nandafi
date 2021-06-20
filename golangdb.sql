/*
Navicat MySQL Data Transfer

Source Server         : lokal
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : golangdb

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-06-20 16:17:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `brgs`
-- ----------------------------
DROP TABLE IF EXISTS `brgs`;
CREATE TABLE `brgs` (
`no_id`  int(10) NOT NULL AUTO_INCREMENT ,
`title`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' ,
`category`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' ,
`description`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' ,
`thumbnail`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' ,
`tag`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' ,
`price`  decimal(13,0) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`no_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of brgs
-- ----------------------------
BEGIN;
INSERT INTO brgs VALUES ('1', 'SULAK/ KEMOCENG BULU', 'NF', 'GERABAH', 'localhost/images/200000017.jpg', 'PCS', '4100'), ('2', 'SULAK/KEMOCENG', 'NF', 'GERABAH', 'localhost/images/200000004.jpg', 'PCS', '8100'), ('3', 'TOKAI KOREK LIGHTER', 'NF', 'GERABAH', 'localhost/images/20000120.jpg', 'PCS', '2400'), ('4', '092LW(MIC) FEIRA GOATS\'S MILK SHWR CREAM PCH 450ML', 'NF', 'KOSMETIK', 'localhost/images/9555419000925.jpg', 'PCS', '26200'), ('5', '093LW(MIC) FEIRA ROSE+ALMND SHWR CREAM PCH 450ML', 'NF', 'KOSMETIK', 'localhost/images/9555419000932.jpg', 'PCS', '26200'), ('6', '095LW(MIC) FEIRA SAKURA SHWR CREAM PCH 450ML', 'NF', 'KOSMETIK', 'localhost/images/9555419000956.jpg', 'PCS', '26200'), ('7', 'ACC PUFF BEDAK DODO', 'NF', 'BAYI/BALITA-NF', 'localhost/images/8994064112163.jpg', 'PCS', '7200'), ('8', 'ACC TEMPAT BEDAK 1PCS DODO', 'NF', 'BAYI/BALITA-NF', 'localhost/images/8994064110770.jpg', 'PCS', '17000'), ('9', 'B PWD CAKE CHAMOMILE 45GR REFILL', 'FO', 'BAYI/BALITA-FO', 'localhost/images/8992771002494.jpg', 'PCS', '29300'), ('10', 'B PWD CAKE CHAMOMILE 45GR WHITE', 'FO', 'BAYI/BALITA-FO', 'localhost/images/8992771002487.jpg', 'PCS', '37300'), ('11', 'ZWITSAL BB HAIR LOT NAT AVKS 4X6X100ML', 'NF', 'BAYI/BALITA-NF', 'localhost/images/8992694246166.jpg', 'PCS', '23900'), ('12', 'ZWITSAL BB NAT ALOE VERA PWD 12X300GR', 'NF', 'BAYI/BALITA-NF', 'localhost/images/8999999034481.jpg', 'PCS', '19900'), ('13', '*EKONOMI PENCUCI PIRING LIQUID 800ML&PIRING 8D', 'NF', 'KEBERSIHAN', 'localhost/images/8998866611718.jpg', 'PCS', '12300'), ('14', '*EKONOMI PENCUCI PIRING SL PCH 780ML (HYGIENE)', 'NF', 'KEBERSIHAN', 'localhost/images/8998866615310.jpg', 'PCS', '12500'), ('15', '*POWDER DAIA BUNGA BAG 850GR', 'NF', 'KEBERSIHAN', 'localhost/images/8998866601436.jpg', 'PCS', '16900'), ('16', '*POWDER DAIA LEMON BAG 850GR', 'NF', 'KEBERSIHAN', 'localhost/images/8998866604932.jpg', 'PCS', '16900'), ('17', 'MAKANAN KUCING ME-O', 'FO', 'PET', 'localhost/images/8850477013698.jpg', 'PCS', '21200'), ('18', 'ABC ALKALINE AA-LR6/4', 'NF', 'ATK', 'localhost/images/8886022971328.jpg', 'PCS', '39800'), ('19', 'ABC LR03AAA/4S MPWR', 'NF', 'ATK', 'localhost/images/8886022941529.jpg', 'PCS', '40200'), ('20', 'AMPLOP CKLT 100LB CABINET', 'NF', 'ATK', 'localhost/images/410532200005.jpg', 'PCS', '45200'), ('21', 'AMPLOP CKLT 312 AIRM 10P', 'NF', 'ATK', 'localhost/images/410633490008.jpg', 'PCS', '3900'), ('22', '10050 SENSITIF STRIP', 'FO', 'KESEHATAN-FO', 'localhost/images/8992864223038.jpg', 'PCS', '22000'), ('23', 'ANAKONIDIN HERBAL 60ML', 'FO', 'KESEHATAN-FO', 'localhost/images/8998667300712.jpg', 'PCS', '11200'), ('24', 'ANTANGIN SYRUP JRG 12 SCH', 'FO', 'KESEHATAN-FO', 'localhost/images/8992003782354.jpg', 'PCS', '2800'), ('25', '*Sasa Tepung Bumbu Original 225g (24)', 'FO', 'BUMBU', 'localhost/images/8992736925134.jpg', 'PCS', '6100'), ('26', '*TEPUNG BUMBU S PEDAS 210G', 'FO', 'BUMBU', 'localhost/images/8992736925158.jpg', 'PCS', '4700'), ('27', '*TEPUNG BUMBU 235G FORTIFIED', 'FO', 'BUMBU', 'localhost/images/8992736225401.jpg', 'PCS', '4700'), ('28', '*TPG VANILLA 210G', 'FO', 'BUMBU', 'localhost/images/8992736025162.jpg', 'PCS', '4700'), ('29', 'A/SAJIKU NASI G.AYM 20', 'FO', 'BUMBU', 'localhost/images/8992770054012.jpg', 'PCS', '1800'), ('30', 'A/SAJIKU NASI G.KCP 20', 'FO', 'BUMBU', 'localhost/images/8992770054067.jpg', 'PCS', '2000'), ('31', 'A/SAJIKU NASI G.PD 20', 'FO', 'BUMBU', 'localhost/images/8992770054036.jpg', 'PCS', '1800'), ('32', 'GERY S. MALKIST GREENTEA S.P', 'FO', 'SNACK', 'localhost/images/8992775305188.jpg', 'PCS', '1000'), ('33', 'GERY S.MALKIST COKLAT T.KL', 'FO', 'SNACK', 'localhost/images/8992775001806.jpg', 'PCS', '1000'), ('34', 'MALKIST SALUT COKELAT 18G', 'FO', 'SNACK', 'localhost/images/8992775305003.jpg', 'PCS', '1000'), ('35', 'F.TEA POUCH APEL', 'FO', 'MINUMAN', 'localhost/images/8996006855886.jpg', 'PCS', '2000'), ('36', 'F.TEA POUCH B.CURENT', 'FO', 'MINUMAN', 'localhost/images/8996006855879.jpg', 'PCS', '2000'), ('37', 'F.TEA PET 500ML GUAVA', 'FO', 'MINUMAN', 'localhost/images/8996006855541.jpg', 'PCS', '5600'), ('38', 'F.TEA PET 500ML STWRB', 'FO', 'MINUMAN', 'localhost/images/8996006853394.jpg', 'PCS', '5600'), ('39', 'MASKER KN95 PUTIH ISI 2', 'NF', 'KESEHATAN-NF', 'localhost/images/200000225.jpg', 'PCS', '9600'), ('41', 'SAPU LIDI', 'NF', 'GERABAH', 'localhost/images/200000317.jpg', 'PCS', '3500');
COMMIT;

-- ----------------------------
-- Table structure for `mahasiswas`
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswas`;
CREATE TABLE `mahasiswas` (
`nim`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`nama`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of mahasiswas
-- ----------------------------
BEGIN;
INSERT INTO mahasiswas VALUES ('0001', 'Nanda'), ('0002', 'Aulia'), ('0003', 'Naraya'), ('0004', 'Fishqi'), ('0007', 'Tiara Andini'), ('0008', 'Meldayani');
COMMIT;

-- ----------------------------
-- Indexes structure for table `brgs`
-- ----------------------------
CREATE INDEX `NO_ID` ON `brgs`(`no_id`) USING BTREE ;
CREATE INDEX `KD_BRG` ON `brgs`(`title`) USING BTREE ;

-- ----------------------------
-- Auto increment value for `brgs`
-- ----------------------------
ALTER TABLE `brgs` AUTO_INCREMENT=0;
