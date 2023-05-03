-- -------------------------------------------------------------
-- TablePlus 4.6.2(410)
--
-- https://tableplus.com/
--
-- Database: local_cr_boilerplate
-- Generation Time: 2022-04-06 09:50:13.5150
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `craft_announcements`;
CREATE TABLE `craft_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_emrlbfdobdzwqlhuqxbklikdedqbwvgrlrrs` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `craft_idx_ftqhuiepbrrnvcljqsnvgjglsngzhmuxjtlg` (`dateRead`),
  KEY `craft_fk_slkaenecenduakeafljvicarobuukhswwzoe` (`pluginId`),
  CONSTRAINT `craft_fk_slkaenecenduakeafljvicarobuukhswwzoe` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_vatflbyjruzdheeoazfvswkvmsxqusygiuqz` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_assetindexdata`;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_wvwuxvngsmdckdbvtnleiapldonzykzbnyke` (`sessionId`,`volumeId`),
  KEY `craft_idx_ybpizinknqhivgouavnmcsenndposigixrrb` (`volumeId`),
  CONSTRAINT `craft_fk_ufdwlxkitamncwctieffhrrgkxuxwjvpgzxz` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_assets`;
CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_kgbrgcnlnxrykolrarktnlnemjcqlvmvqujv` (`filename`,`folderId`),
  KEY `craft_idx_exsegzauyxxanmhtpsruzuqlkumojjslsktw` (`folderId`),
  KEY `craft_idx_nwgcuyoksnctdfatucrtvbciiqbtygovmocz` (`volumeId`),
  KEY `craft_fk_bsbtadqvzqgfvxbgskubsnjirtgmwqbojqvr` (`uploaderId`),
  CONSTRAINT `craft_fk_bsbtadqvzqgfvxbgskubsnjirtgmwqbojqvr` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_ehkzvilbjlokxawwgxadjixpwfgyjnnnuxth` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_kwfdbcxlhapcedvujhptlluphrxbxegpqaee` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_phvnwrpnruswurpoybdcujlrqqubmmguwkwt` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_assettransformindex`;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_xybecjqkunmouoocjysbjailzgvudfdjbcdr` (`volumeId`,`assetId`,`location`),
  KEY `craft_idx_fmbqygydtfslbujbkwksxmmjivihnhswfmtr` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_assettransforms`;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_kqihyjdnqismkteuizpbdmpblukcbamqwyqk` (`name`),
  KEY `craft_idx_uzsnjmstrcaxhczstrfxmupeicdaqvbisqea` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_categories`;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_emfhvwpihyydijgdmpysbjpqxkcbjgcvcsbt` (`groupId`),
  KEY `craft_fk_qxcznrvhtrejfseoydosasyplzzrxfxzckxn` (`parentId`),
  CONSTRAINT `craft_fk_areybgtdjwssrmzjvczyesmfudakplcfeqhf` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qxcznrvhtrejfseoydosasyplzzrxfxzckxn` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_vpzbumypidliinsxihlahckbkwxgyqhyjgtl` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_categorygroups`;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_cetsdiqtiurlvlkflvrjvqkdivdtmzgoqjlg` (`name`),
  KEY `craft_idx_odrngfwuilundsnmyqlqnihodeylfrosbaaz` (`handle`),
  KEY `craft_idx_nrevmxmfgutmeqqtfawkutddsoeoiahefmrl` (`structureId`),
  KEY `craft_idx_prcovlotwobeetsdttzaeeakpqhvypbdfgyt` (`fieldLayoutId`),
  KEY `craft_idx_bmspawfiwkomtlkssgnkdsengzvzyupaosqm` (`dateDeleted`),
  CONSTRAINT `craft_fk_elvxmnyihbaznnswaklkqqarkstfzrkzghjf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_tnvnxqyupkpmyhpkornrrulyelpgghgqjxci` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_categorygroups_sites`;
CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_owyscxqubgsnllkiondgsianephhlipgpact` (`groupId`,`siteId`),
  KEY `craft_idx_oqwvgwyanvkzlnrprttzvmfmetpelwhynpxj` (`siteId`),
  CONSTRAINT `craft_fk_foahnttjbxfpmvqcvpnscsvhfralucjkclsp` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_scabcdnteyvbwapuaiyhppnmjttwylzgmkmg` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_changedattributes`;
CREATE TABLE `craft_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `craft_idx_xcfhkcssutmykwuaokzmodbpatiudyknwpih` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_cbttwvkrmxqitixsrocopzsbridrnonpxntx` (`siteId`),
  KEY `craft_fk_ertrqdttlsisjmzccnqrhofonnosevdchgfl` (`userId`),
  CONSTRAINT `craft_fk_bpncyadkxoyvzsvfkhckdztdqtsnrjvmdpws` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_cbttwvkrmxqitixsrocopzsbridrnonpxntx` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_ertrqdttlsisjmzccnqrhofonnosevdchgfl` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_changedfields`;
CREATE TABLE `craft_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `craft_idx_cvflxmmfobafunmplivpdrlgbtgmutyxtsdw` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_rlgeefwsbpcxnahybzsctinlauqdeikkpiok` (`siteId`),
  KEY `craft_fk_fgqmeukgogzlendgsrgnwuhmhqbexwawnvpc` (`fieldId`),
  KEY `craft_fk_lfzkvcdneqlgknmxrguszrsbwhtdpdzmlfox` (`userId`),
  CONSTRAINT `craft_fk_cecrhqhzmvjxwxdhdecffdaqfnfjdnbqumpb` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_fgqmeukgogzlendgsrgnwuhmhqbexwawnvpc` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_lfzkvcdneqlgknmxrguszrsbwhtdpdzmlfox` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_rlgeefwsbpcxnahybzsctinlauqdeikkpiok` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_content`;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_seo_yoqcokck` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_rkgwijhbrrhkdxybcmagskzkwsiolmjojnoe` (`elementId`,`siteId`),
  KEY `craft_idx_zypeejvakikqfdwxruxixluzvhyerfzmhqnw` (`siteId`),
  KEY `craft_idx_jwdgwbheaerlahtjurrgjwxrjrdlktjapcmk` (`title`),
  CONSTRAINT `craft_fk_vkfhhjcjfzbdachwpsxthjvakpnetltfpqhb` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_wwqwmoqhvcozpehbqxqzkicamnoekkfsvpgv` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_craftidtokens`;
CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fk_tiikzgptxbfcfyntzocktgcejiksiypfyxda` (`userId`),
  CONSTRAINT `craft_fk_tiikzgptxbfcfyntzocktgcejiksiypfyxda` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_deprecationerrors`;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_rszszoerewgeaygyecjgprcphtbalpcwdphr` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_drafts`;
CREATE TABLE `craft_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `craft_idx_fvlpukkzvdthxzccaoxxbbnbiqzefctdjbfe` (`creatorId`,`provisional`),
  KEY `craft_idx_urdhlclwhsbgjyacoljksradtfeuszfjfhfp` (`saved`),
  KEY `craft_fk_xunmlllxdkhzzokabvctrfagvltqhymkujbb` (`sourceId`),
  CONSTRAINT `craft_fk_rkzmaudhfyckymmabtyuqzqfngeomyjrkxve` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_xunmlllxdkhzzokabvctrfagvltqhymkujbb` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_elementindexsettings`;
CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_vccepytiphhlsjlhsaggubaouvhddotciahj` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_elements`;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_okphkiqytkusytpqtcnmgupkjmwxymonxied` (`dateDeleted`),
  KEY `craft_idx_yayhjajrepudnragkzdmyhudkgwwogcaanlc` (`fieldLayoutId`),
  KEY `craft_idx_vypdyhlectrypnzlgrljpyykrkjgrrxjcpbn` (`type`),
  KEY `craft_idx_xtwpfwnzvyvjixwevqckburdifaaowtgnlgu` (`enabled`),
  KEY `craft_idx_qdcbomenvtxgkpejnlfhmukhjewpdzlhfhuc` (`archived`,`dateCreated`),
  KEY `craft_idx_wkyvgwzprswnuqsyqjzucodrispsftdexfvd` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `craft_fk_qdpligopiizansyjufqzngstiphxcfszhrkr` (`canonicalId`),
  KEY `craft_fk_aejnitusznyabfbmwamtblninzcqktmfibdl` (`draftId`),
  KEY `craft_fk_dvbzwjmdjayhjzjcayzerdglrauojkzuvxat` (`revisionId`),
  KEY `craft_idx_iwfbntiovcpvxzglmwfgdbeeyarnwkeugorn` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  CONSTRAINT `craft_fk_aejnitusznyabfbmwamtblninzcqktmfibdl` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_dvbzwjmdjayhjzjcayzerdglrauojkzuvxat` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ozddfpymtvcxfbkkkjmqcbttdezioumurrul` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_qdpligopiizansyjufqzngstiphxcfszhrkr` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_elements_sites`;
CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_nmtbsmugwcocbymjjgwwvgpcazgocutasuyo` (`elementId`,`siteId`),
  KEY `craft_idx_zrzkyqhgamkwcazukjwcodhunvmefhulcugr` (`siteId`),
  KEY `craft_idx_yckxezbqktapfvfgivhqqcroulemrfxssias` (`slug`,`siteId`),
  KEY `craft_idx_iimwxeriayfyvlkwywdwdphezchdpewqvvqi` (`enabled`),
  KEY `craft_idx_bazfhqdknfwhozmdzkvfmvqjnoydiqavyzqo` (`uri`,`siteId`),
  CONSTRAINT `craft_fk_buzrekqehmrjlvrjzjabylytayaouwolqrda` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_picspytiwwxmtziyayhxstksirlpkieuiieu` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_entries`;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_exiyajlofpsfjwnxobefyubsohkxyacmcmxi` (`postDate`),
  KEY `craft_idx_chlueteoteylnkujechszcgkwxvfsmxtdrtz` (`expiryDate`),
  KEY `craft_idx_sfbfzbfqoxflgxxnekxziimutogciyjpmzhx` (`authorId`),
  KEY `craft_idx_embkenzzhphqsbegrrvxpvgfdzjxkpuyisbp` (`sectionId`),
  KEY `craft_idx_wkdbvogjvjivzmnhiecynancwbtnbyecoofc` (`typeId`),
  KEY `craft_fk_wsnvfdhceberhfzdzlzflwvpedacyursppgm` (`parentId`),
  CONSTRAINT `craft_fk_aipwpzjtgrkoyftdhwflquubnbjgglrnfxmt` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_bwphdbjwzhihddbuzkytgmlwgekqzxqvgnwz` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_czvlptntnqvkizyaqjqgzameqwlfzotdxonj` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_fdsjesvccxrnkmnqjddzsvvmfftzthiqqwdo` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wsnvfdhceberhfzdzlzflwvpedacyursppgm` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_entrytypes`;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ofxygdecovsclmnbtkeblmpykiszsipjccdc` (`name`,`sectionId`),
  KEY `craft_idx_hrbxibvoirqtuuifsyliqxgkefaisqnhvuum` (`handle`,`sectionId`),
  KEY `craft_idx_crzzbrxekyrcyftmijfglsqoebabrioqulgg` (`sectionId`),
  KEY `craft_idx_iyslkfntyxngtryigrqvhyxpgpyteyfstgrs` (`fieldLayoutId`),
  KEY `craft_idx_gzkdrfniyagydqizfkfyufekcviuirhhmcor` (`dateDeleted`),
  CONSTRAINT `craft_fk_hrrqngroutnsettaetsimaovdmlyrerneflq` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qqaqbhsresvmjbvgzgcxclfwwtvxzquyaple` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_fieldgroups`;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dwdfasypsthkpmxrnsovhhvzpkeqqenzsqbb` (`name`),
  KEY `craft_idx_wxykluqnburhtyhwpgmqnvjpajmfazchtzea` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_lvkkjyeioapscibnlosqsvuentrgpmgxqfvj` (`layoutId`,`fieldId`),
  KEY `craft_idx_gzrvpsiakxsdvruoktcnldwnrsajvbiiodnf` (`sortOrder`),
  KEY `craft_idx_mtrcterygeekjhmerzsmxawupynrunewfwbq` (`tabId`),
  KEY `craft_idx_lrnnujzzkikmmnygttxrnzbmllxundcllvtp` (`fieldId`),
  CONSTRAINT `craft_fk_cpghgieekcyzjmsbapurcpmgnvqcnfhrefjr` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_cupcxcpvcwvqzxrsqhkzsccwerguipwpsgty` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_txrhaacdzfgkjvykyjtwxxxzzffbuewhjmid` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_fieldlayouts`;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_pngitaebitzsuqfyvkbagufrvbixowcuwcrk` (`dateDeleted`),
  KEY `craft_idx_ccpvxigebmdqrlvhftdhyzwjtdryhqmrlkwq` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_kamelilkqglrpudbsnectfzyxrudvopxuaog` (`sortOrder`),
  KEY `craft_idx_arojjblyjyjrajxtvnixpuzwupsieolofxiw` (`layoutId`),
  CONSTRAINT `craft_fk_tbiznuxiktfuolnyukxqkbxsuqrurstujvbv` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_fields`;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_asvtujquxmvkwlssivwmoteflymijhkxvzpj` (`handle`,`context`),
  KEY `craft_idx_anoiuvnmcppkcwcecxjxllzizwtgfwxvjfgx` (`groupId`),
  KEY `craft_idx_skayiikmvgisgavtpbnrisikdakmyzuoplhe` (`context`),
  CONSTRAINT `craft_fk_ittnbqzvizhpssfqhfcoapzzbsfswhciwwvh` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_globalsets`;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_tcriqbqczxbdvevquntvdfdsogpskvzzkmkk` (`name`),
  KEY `craft_idx_ycrubxlkorrbiwcunzmskraefueulsqjeymx` (`handle`),
  KEY `craft_idx_oqbjcwcrylnyaffdnfmjlbdmestjlwmkwmvp` (`fieldLayoutId`),
  KEY `craft_idx_hjzcrngdbwddgzgragdacauegbgxjjankfjo` (`sortOrder`),
  CONSTRAINT `craft_fk_finqvxgpquydnbxqwifrvbnsubquvtfzlxnb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_uhhurksgifjpjqjktqpqvtibgwkimzykofat` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_gqlschemas`;
CREATE TABLE `craft_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_gqltokens`;
CREATE TABLE `craft_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_nairrxmqkwhbaxdsnrurmdirnclijkjltyxt` (`accessToken`),
  UNIQUE KEY `craft_idx_lfvljhaevbpigfglfzdahdtcgpmlaqchaxxn` (`name`),
  KEY `craft_fk_prsnkztbawxgvubiemybjijzpstxycnwdbhl` (`schemaId`),
  CONSTRAINT `craft_fk_prsnkztbawxgvubiemybjijzpstxycnwdbhl` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_info`;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_matrixblocks`;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_frqlxjvqhfdbhbjcjbfbkshfthqpkxqyrvfs` (`ownerId`),
  KEY `craft_idx_isjasrdrwtlgxvwrcibbjzijbubivyixuuat` (`fieldId`),
  KEY `craft_idx_ouyqwqtuszhwcfvexyrhuejiyszozbwctgjy` (`typeId`),
  KEY `craft_idx_qmmmirbyjicjgenntkiprgigqzmmismvvmng` (`sortOrder`),
  CONSTRAINT `craft_fk_bpsrafpisrtzkrhqhftmopzwekxrbiswdacp` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_cqyftqwzldqshjalxckaqczcfdfrdusofeol` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_czbckpahpleotpejiknghudnoguskupqetxt` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_sjwpoaeplkzyzjugcqfzywbirpyfvcohrrho` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_zvflfxqeoetmkajldripavykoivwmdoymdgc` (`name`,`fieldId`),
  KEY `craft_idx_xkiityzqzsdqpmclquibarjvzoksltguecsw` (`handle`,`fieldId`),
  KEY `craft_idx_fxvdamkfabyhokdbzebrjmnximornygettgl` (`fieldId`),
  KEY `craft_idx_xqqbebaclhqmbilssscplvyjxjuwkspbglyl` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_atrhgibkaogenbrkexbpuwtxnzgjtdlmlhgr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_vgtfftkvfdynzafezallovegcpgaqthgizcj` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_matrixcontent_contentblocks`;
CREATE TABLE `craft_matrixcontent_contentblocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_text_headline` text COLLATE utf8_unicode_ci,
  `field_text_copy` text COLLATE utf8_unicode_ci,
  `field_anchor_anchor` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_cductwlzamyfbkosfpyykhupacfhcvpmltug` (`elementId`,`siteId`),
  KEY `craft_fk_qeamtqejqscvtzokpmohpmeedvktolnbvreg` (`siteId`),
  CONSTRAINT `craft_fk_ksxtgalajmljsoozprridhkoqayxelkjkvle` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qeamtqejqscvtzokpmohpmeedvktolnbvreg` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_migrations`;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_raqoedndpynohynjbhgwdrwevxjdnmqtgpne` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_navigation_navs`;
CREATE TABLE `craft_navigation_navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `propagateNodes` tinyint(1) DEFAULT '0',
  `maxNodes` int(11) DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `siteSettings` text COLLATE utf8_unicode_ci,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_gzirmeexojsypfspldxqgndegqmvythkwizm` (`handle`),
  KEY `craft_idx_swebpxfbhudioyyljsdaeggwwdljvmmhplfc` (`structureId`),
  KEY `craft_idx_slvuwjcblrtrhiznsezlnitfhcbzkzrtutsf` (`fieldLayoutId`),
  KEY `craft_idx_pymtkqpvgaefoermtsqkzvylryslpzvnzmeh` (`dateDeleted`),
  CONSTRAINT `craft_fk_qhbcmnrdqkebxzwvozvyuqpbjztdhvhgsnub` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tptwzpyyuyhzrcnefvlqqrtayvkwvnynheww` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_navigation_nodes`;
CREATE TABLE `craft_navigation_nodes` (
  `id` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `navId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlSuffix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customAttributes` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  `newWindow` tinyint(1) DEFAULT '0',
  `deletedWithNav` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_psnzgevvflebuobqgrffkpxbvtvqczacnxce` (`navId`),
  KEY `craft_fk_jpvrrgtjvqeomesbxkyedqavbwcqicamdaem` (`elementId`),
  CONSTRAINT `craft_fk_bsnujdrzmudgpvqeedmibtsuxksfelbpefeo` FOREIGN KEY (`navId`) REFERENCES `craft_navigation_navs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_clkjkpgcxghbtrppzlvmgpavcozyhpykxzml` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jpvrrgtjvqeomesbxkyedqavbwcqicamdaem` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_plugins`;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_seoffifvecuxvxaefwdfzpovtftctklgnobn` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_projectconfig`;
CREATE TABLE `craft_projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_queue`;
CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `craft_idx_flkpughjszrrujfpexqknjvnrkaozgpvtzzw` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_idx_cfnrwqdgjxndtdmqbmcfiqngadwypadrnmoe` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_relations`;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_wtfcsfnfrkxzpjorsmxajruypsqhdpudyuhj` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_idx_mxjlluvrjhktxioqpaajpdmecgyjpnpgodrx` (`sourceId`),
  KEY `craft_idx_qgvccvuwyjevepevklrbsflqqumdagtikjll` (`targetId`),
  KEY `craft_idx_zrsdgxcrywpgoxgvbfnchzvimqibjigqajyd` (`sourceSiteId`),
  CONSTRAINT `craft_fk_iskflulhnzmwihaqxnjoezaojdbpdtbwerbp` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_kezspinjgwrlrghlnpyzegmftndzxeyerahz` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_rhtwxxmfujgujkcfkgdlwilyaznkogaqtzku` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_uqrnfnweenwtirswlybtmnmyvrxwanpiyfmt` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_resourcepaths`;
CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_revisions`;
CREATE TABLE `craft_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_mwjhyposcpfwyjahjiktaqnopshezszypdin` (`sourceId`,`num`),
  KEY `craft_fk_hwlmbsdigpriqvfagrgxoerybsfhukqfxift` (`creatorId`),
  CONSTRAINT `craft_fk_hwlmbsdigpriqvfagrgxoerybsfhukqfxift` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_whcpdfehmxtprzqbzkkycqwprjgdjtmmpxvt` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_searchindex`;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craft_idx_nncspvfvqbxymgghywfdrmdsegdxufcauxqz` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_sections`;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_cpjmzrxjnakwfoqldlrdwpvkeqdtkytskzlc` (`handle`),
  KEY `craft_idx_ymfcowszsztbjzvxolpytemtkwqgjbaihdmr` (`name`),
  KEY `craft_idx_wqdxbosjplrmrcplxoieajyuoctxnwkplsla` (`structureId`),
  KEY `craft_idx_svltctdebnruczpjgdcmemgzhutmsswdgteb` (`dateDeleted`),
  CONSTRAINT `craft_fk_wkuikwpfgsklgtcrcieofbkakkrzacseghnn` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_sections_sites`;
CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_qdhwwbdhlwrtcsyvpzhdbytizbazvrjpocpr` (`sectionId`,`siteId`),
  KEY `craft_idx_trdnzuxmaexwmdcoozifntnyeeajqrgmdmit` (`siteId`),
  CONSTRAINT `craft_fk_njdhkxustwuklkvixxntruogmtbylihgbztv` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xvfqvjwpipambzokbppuyvqqtrhguknmukwy` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_seo_redirects`;
CREATE TABLE `craft_seo_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('301','302') COLLATE utf8_unicode_ci NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_seo_sitemap`;
CREATE TABLE `craft_seo_sitemap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` enum('sections','categories','productTypes','customUrls') COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` enum('always','hourly','daily','weekly','monthly','yearly','never') COLLATE utf8_unicode_ci NOT NULL,
  `priority` float NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_sequences`;
CREATE TABLE `craft_sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_sessions`;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_uqjjvichoxisghihkbtcxmyjguxozjmaregi` (`uid`),
  KEY `craft_idx_shxtqxnopmuksnikdrqbsimkiedgwxcxjkkq` (`token`),
  KEY `craft_idx_daiktpdivncoxhcybkmjbrlimyhaegtdqwrx` (`dateUpdated`),
  KEY `craft_idx_zngxjvyrscetmygrqbarwlpzjumkwfbcchsp` (`userId`),
  CONSTRAINT `craft_fk_fvrmqisqdmxdvhqopjuysfjgbqdbhhcsxkxe` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_shunnedmessages`;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_gwieudxpkhkynsnnfkpzyrjwckyommqmzpyy` (`userId`,`message`),
  CONSTRAINT `craft_fk_hnikrscrygozfimetnirwvpxgomeffdrtbcv` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_sitegroups`;
CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_qgedipzgkrwuphuzziutxewtwmtccxldtbca` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_sites`;
CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_uzibtqgsmhfodewsmirssyehrzidbpcojato` (`dateDeleted`),
  KEY `craft_idx_qriszbckmjbeavvjayxizmelkosrytmgokxs` (`handle`),
  KEY `craft_idx_gmjkusybajrmamyjsjothnizdtmquszndcnx` (`sortOrder`),
  KEY `craft_fk_memiyinrnrhtdaivtyeznxocvmxzixfrlmvf` (`groupId`),
  CONSTRAINT `craft_fk_memiyinrnrhtdaivtyeznxocvmxzixfrlmvf` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_stc_buttons`;
CREATE TABLE `craft_stc_buttons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_button` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_tyoiedubucoljugxensmwnagdymgrxckkhzz` (`elementId`,`siteId`),
  KEY `craft_fk_qmbwvwhogdtougmyxvjizvkzjixrorfcyway` (`siteId`),
  CONSTRAINT `craft_fk_qmbwvwhogdtougmyxvjizvkzjixrorfcyway` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_usaiklskjirlommmgcyiklnlrmvmejbqdqnk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_stc_linkinbiolinks`;
CREATE TABLE `craft_stc_linkinbiolinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_bioLink_ejwczycw` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_tmweokrbnellnuqpauzqibiwxlgdetezusht` (`elementId`,`siteId`),
  KEY `craft_fk_dhfqwfpiwlhzowtiihroprxgeuiltocuacev` (`siteId`),
  CONSTRAINT `craft_fk_dhfqwfpiwlhzowtiihroprxgeuiltocuacev` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_dltcgecocqfvpkqkhvudadhakaneamknefuh` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_structureelements`;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_kngzrlizrfpbhbekjeinwddqgpisjccjfvdo` (`structureId`,`elementId`),
  KEY `craft_idx_ovmpdejfqrbbtakzwqnxbbaxsfvdkenxosgh` (`root`),
  KEY `craft_idx_svzrdijtvczxmijnadowrcmearuldzvvrsbh` (`lft`),
  KEY `craft_idx_uiizupfsvjgodgjxbvvakpvqliodyixzpqwo` (`rgt`),
  KEY `craft_idx_vdivlsxzpffaqqlqwcsnqingccbnbdrlrbfu` (`level`),
  KEY `craft_idx_hgkgfzavnqxayuwphaehpvyqsdfcshefcaot` (`elementId`),
  CONSTRAINT `craft_fk_cdwyiqetkvwtqdprhkzoujdiyasgbwjpcwau` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_chjkbyswimqgkysnmhppsaoopavscmxlndhj` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_structures`;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dwccnyyvrjhzktitkghnafitphjnoflliywj` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_supertableblocks`;
CREATE TABLE `craft_supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ulikgprvsgajsswtvsvjmcymvhuipsahzfjp` (`ownerId`),
  KEY `craft_idx_zntueyifregaxcrpxfapsnorwxfiaquqbxpz` (`fieldId`),
  KEY `craft_idx_leuqrcysnpphpbptldsvqjzwazuwttbyxsfa` (`typeId`),
  KEY `craft_idx_mjbnpzekawqynieznwehdnursmrunzalhdgt` (`sortOrder`),
  CONSTRAINT `craft_fk_ceotrlfiyuvpyzsjugvbihmgapkvkdmndrxy` FOREIGN KEY (`typeId`) REFERENCES `craft_supertableblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qjlfreyzsslpgekfmmpfxmxyhrryydvvavhz` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qnzjepxgbexzyulywogouqaiaxziubetmqvx` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wsabzvbllnkmmfqpjjfycjrdedycuwmmmutu` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_supertableblocktypes`;
CREATE TABLE `craft_supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_droemeztdnhlpazafxxeuvdbdwnkjyrtpbgi` (`fieldId`),
  KEY `craft_idx_urtwmqbvpmdqhpbjzlpyxqzlpyllwgtooaiy` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_oaufcgufhookgromtoulmgvuluuivhaeaxrg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_thceecritfqxfafspnvsiaktrsdljlqzdcjx` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_systemmessages`;
CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_byzocmldivxshbhdoaqqlokkefcwouelaqsy` (`key`,`language`),
  KEY `craft_idx_eibiijdeploikzdgmpquzripqkkuxhxgvjzg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_taggroups`;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_nogjvxumanmjrtpkpfeopqpaiaiczqthfscu` (`name`),
  KEY `craft_idx_yxieyqchdybtbmpemkgvjbfxdvlvzriidxuq` (`handle`),
  KEY `craft_idx_lztavulttmyrjoahczepqgrjugsdencvrzup` (`dateDeleted`),
  KEY `craft_fk_mdxjektefawakdeouyzzpjiyvwyarpjmjztm` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_mdxjektefawakdeouyzzpjiyvwyarpjmjztm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_tags`;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_sijdydybdpxygcloulkzgirfqekvebtxugti` (`groupId`),
  CONSTRAINT `craft_fk_eqjycgoueprpsonhpnpbcymemizftcrqmzjw` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jldjoxkfejtajkfnqtujsmdtktdytvnhajio` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_templatecacheelements`;
CREATE TABLE `craft_templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_mivligtvzfknnlofhtpapgepwizxgjkzfnzi` (`cacheId`),
  KEY `craft_idx_axzanctyljkhtwnchfnzldbmpuoqtqrncuhd` (`elementId`),
  CONSTRAINT `craft_fk_gjkpzuhpcxhfftzpyjxsszclppekpehilvjo` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jubwloiqcprpnqeelbxfmsuhmyeobtmzlnyj` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_templatecachequeries`;
CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_wjzlncmsggilulqgzakfysraervrscmoihta` (`cacheId`),
  KEY `craft_idx_zahwiduepznoyisgychtzgbktdyzurbjwkmv` (`type`),
  CONSTRAINT `craft_fk_mtrmwtnzbjuuogewyvzkfetfvzmcdcwwujai` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_templatecaches`;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_mrupzmecchmebrtgsgbpuagcqjyfisqophgc` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `craft_idx_ypmjuvueetovbbieiclhtrnjwfzexrwohyyw` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `craft_idx_wtlrahgyiwhfzdslzaaafvkpubujgpbgdkqs` (`siteId`),
  CONSTRAINT `craft_fk_ljuqaqgfxgcfikbzmemnbrrhwezfsegszmby` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_tokens`;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_ekhjgvcmfnxgdstdxcashgcutqkyekmqtcsg` (`token`),
  KEY `craft_idx_dbeccugpcgxvxhstqtjqmepumcotccabevgb` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_usergroups`;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_whxouamqkdwqyuyanowfxqxjfmztgfyutedq` (`handle`),
  KEY `craft_idx_tyujdnmpkptvxztcfzcgogteylazlkydolze` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_usergroups_users`;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_zostmynxuwmqwrsrurnoydkffefzqoucfbev` (`groupId`,`userId`),
  KEY `craft_idx_jhmdnatigxczsfhiduunoiyxybcanbkmyfyj` (`userId`),
  CONSTRAINT `craft_fk_scoehxkdliitnhmncldpnpsaxdbauiiscemo` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_slmhnixfkrueahzjxsvjtmagvdenccnqlcnq` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_userpermissions`;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_znphnrgvfwvxmnxkrpxrvkxyzzkwpmcqdadd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_prplcxaunorijjorcofxclfnyzhsriaobgfr` (`permissionId`,`groupId`),
  KEY `craft_idx_trxcdibvyzdhclhpyzyjybiwujbrtxetnxfz` (`groupId`),
  CONSTRAINT `craft_fk_lyzsttpflehqtdeoadcirtehtibsxxytmjde` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_zwsolzqkzybljfpczxkcrklvwhevxyakglgn` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_userpermissions_users`;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_oftpktcxbjvvvlwbqkrceumkfnmmwskgknac` (`permissionId`,`userId`),
  KEY `craft_idx_cbcwvfwmqrwtwoldkwtvpdkdduvbwuxrscmt` (`userId`),
  CONSTRAINT `craft_fk_malyfavbsypvmxxuqmjedsjlkegltssoesep` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_zeymswnnresawgxjpntpcjlsqvgxhrmrfapj` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_userpreferences`;
CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_fk_bhcerkqbbbpcgpjbcqltuwxeqoayewsunadg` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_users`;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_wpbydlnzlejxnxdbqpcibxklefcvexhumsqr` (`uid`),
  KEY `craft_idx_kzhxaagcbaenalzmmhiupxthpxamfhutqfpi` (`verificationCode`),
  KEY `craft_idx_eodtvljviblacujalxullctptptwiyqcxbak` (`email`),
  KEY `craft_idx_hqkgnaxeuobxrloausdrknamkdquyjsqyjtd` (`username`),
  KEY `craft_fk_yxveclbgjcplknrgslfxntnxzwqirljuxwca` (`photoId`),
  CONSTRAINT `craft_fk_fmyixwfibpdykmndxewluqttcgalwlbbdfjt` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_yxveclbgjcplknrgslfxntnxzwqirljuxwca` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_volumefolders`;
CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_nrxpmiypaiwyogigbbfaimvnvmjgwdntsyqw` (`name`,`parentId`,`volumeId`),
  KEY `craft_idx_cbptpuxokcgfxbcgvxlofswiqfsuijybvihl` (`parentId`),
  KEY `craft_idx_xcgkljnxwivhipbqnegvuzukjdathbcwkigy` (`volumeId`),
  CONSTRAINT `craft_fk_audxydcilrrnggyedgdofyostfqxmpdjbett` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_kdlohuiiuzbzbuxswlrquewubyzflcfxsjqa` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_volumes`;
CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_nfnhdeqmgjgvvthwgkevvfihzhsrznlrcwsq` (`name`),
  KEY `craft_idx_uulaajbsezukgshmzcwdqmbovctllmubpooc` (`handle`),
  KEY `craft_idx_zdtfcappocncfstbgqilksmfzblllqqbgiis` (`fieldLayoutId`),
  KEY `craft_idx_rqucdmfrnozvnztutilxzlybzdgtmdjbeenb` (`dateDeleted`),
  CONSTRAINT `craft_fk_jbpkxkihwzfdatmwiegmxkjdvzxmpvbtgiep` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craft_widgets`;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_izfdulfrskoftolybwwpeftnzwsxlhefocka` (`userId`),
  CONSTRAINT `craft_fk_ezzsliczsdkbrknsvarxtitowlufrtprnscq` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftannouncements`;
CREATE TABLE `craftannouncements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craftidx_omyoeyuxjxqgajouufhlkaripgulwcahccud` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `craftidx_oktmznqdxmgorxgvehmsbwfqdwbfsgbjsqvv` (`dateRead`),
  KEY `craftfk_akmvwhnungfmszotvodleehuvhmtowjmbkjj` (`pluginId`),
  CONSTRAINT `craftfk_akmvwhnungfmszotvodleehuvhmtowjmbkjj` FOREIGN KEY (`pluginId`) REFERENCES `craftplugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_uvhrvkvcuagifkiqtbhgiibqtzhjgauegduc` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftassetindexdata`;
CREATE TABLE `craftassetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_enysmgxrslwzrunyxbtzzwjqdhivsmbzeafs` (`sessionId`,`volumeId`),
  KEY `craftidx_itjnmccickgpicgjjisikcsulaavzxutmzjf` (`volumeId`),
  CONSTRAINT `craftfk_hjkhdfpgevvncswsreepqrujdaidskzzgrjd` FOREIGN KEY (`volumeId`) REFERENCES `craftvolumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftassets`;
CREATE TABLE `craftassets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_qorxvzgdluxghjfpfsilgaolcbmxykcszbiz` (`filename`,`folderId`),
  KEY `craftidx_jzgycynqclquvtczxmkbshmjdxldtckwdpoc` (`folderId`),
  KEY `craftidx_uaepdhmelyxpvspxoygxfpqjuzxfuxdhlxqk` (`volumeId`),
  KEY `craftfk_azyodgonsndrlwehoppqrhdrdlyplwdhllbo` (`uploaderId`),
  CONSTRAINT `craftfk_azyodgonsndrlwehoppqrhdrdlyplwdhllbo` FOREIGN KEY (`uploaderId`) REFERENCES `craftusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_doluunmhmegiygfmnnbzqkcautvlxeuafelq` FOREIGN KEY (`id`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_lrdrqtruvruhxgnsjxayhodghjjyetlfyucb` FOREIGN KEY (`volumeId`) REFERENCES `craftvolumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_ygerzyuohhluanflynncrwkoxmnubognqrnu` FOREIGN KEY (`folderId`) REFERENCES `craftvolumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftassettransformindex`;
CREATE TABLE `craftassettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_keyeoylwuftfokllauoqavajugabzsddnoui` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftassettransforms`;
CREATE TABLE `craftassettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_rxlqrzhgyhftmcoaxjdomyfnbcyacpvhpglo` (`name`),
  KEY `craftidx_cbawmlksmlhquxolicwomtftqsxmmodsouyr` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftcategories`;
CREATE TABLE `craftcategories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_tzcpvqyaiehtojjcdwnzmnyqdgeqggvlzezt` (`groupId`),
  KEY `craftfk_iutjgvzxixjubbcfeljffycrlfmkqtqawjde` (`parentId`),
  CONSTRAINT `craftfk_cfrlbeywhutnogwwjzupyohvoexharuvjpis` FOREIGN KEY (`groupId`) REFERENCES `craftcategorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_iutjgvzxixjubbcfeljffycrlfmkqtqawjde` FOREIGN KEY (`parentId`) REFERENCES `craftcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_xwlbvootfjedcvixalbbstjlfvpuxgprysgz` FOREIGN KEY (`id`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftcategorygroups`;
CREATE TABLE `craftcategorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_tvdihfegardhnpwpshrgykmsqynnbpjgcrgf` (`name`),
  KEY `craftidx_czkmuboxgofxjynevyfriwghiuzggvgyybpt` (`handle`),
  KEY `craftidx_sntuxorxqyeqeoqfisvyoyzslcpojkpiozjs` (`structureId`),
  KEY `craftidx_oxicbnxapzbbrvmgsewyxqshhojixsspfyxt` (`fieldLayoutId`),
  KEY `craftidx_xsbolpsvwjhhqjkkaioxgkjjupmuurmzbxdb` (`dateDeleted`),
  CONSTRAINT `craftfk_jszmcbduwtdtrjtzxvprsqksufjscvghabzk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_xjauupwiyapcspezijaolcptztctvpxoqnnt` FOREIGN KEY (`structureId`) REFERENCES `craftstructures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftcategorygroups_sites`;
CREATE TABLE `craftcategorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_hynvcyjgtqblhaptanbhrnyhrvosbciqehbz` (`groupId`,`siteId`),
  KEY `craftidx_wadxmrlopogaszyottuxbndedubffdimpapi` (`siteId`),
  CONSTRAINT `craftfk_hxtbunabkvwghmaidwpdcjwwiqmsrznjxsqs` FOREIGN KEY (`siteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_jyhnvfyrldjsntklvjxomnmyetgcydrsidhu` FOREIGN KEY (`groupId`) REFERENCES `craftcategorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftchangedattributes`;
CREATE TABLE `craftchangedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `craftidx_lwzkcvdrlxhzvyfvljvbbwfupmfejtmvhjlk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craftfk_taglxzcdwaislrslbiebgkysspzgnodrseaf` (`siteId`),
  KEY `craftfk_qemwaiaqiwzucqnnzsknnuzmiafbousuknik` (`userId`),
  CONSTRAINT `craftfk_apdeshlvxepyixrydonugpaddewncjfoaslm` FOREIGN KEY (`elementId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_qemwaiaqiwzucqnnzsknnuzmiafbousuknik` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craftfk_taglxzcdwaislrslbiebgkysspzgnodrseaf` FOREIGN KEY (`siteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftchangedfields`;
CREATE TABLE `craftchangedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `craftidx_rydijmishmzsotgsaszotagxxfsooqkivwti` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craftfk_lyeqbpnrqeeoecpfnkgjadxhygozzqtcrowt` (`siteId`),
  KEY `craftfk_wtvxquuuxnywzcvrydxgtabacppvkdsvpbea` (`fieldId`),
  KEY `craftfk_yttaqhoacbrmfantwgitffdddbpnbzcmmqrq` (`userId`),
  CONSTRAINT `craftfk_aqnmpyvfggrfgwbqxayletzjpqkexwvrtkiq` FOREIGN KEY (`elementId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_lyeqbpnrqeeoecpfnkgjadxhygozzqtcrowt` FOREIGN KEY (`siteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_wtvxquuuxnywzcvrydxgtabacppvkdsvpbea` FOREIGN KEY (`fieldId`) REFERENCES `craftfields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_yttaqhoacbrmfantwgitffdddbpnbzcmmqrq` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftcontent`;
CREATE TABLE `craftcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_tqaprikyroqqzskisqiqvojipmeakcbczncx` (`elementId`,`siteId`),
  KEY `craftidx_fdhaeapzwwcacmxhgsddsbeedixwsasiuwyb` (`siteId`),
  KEY `craftidx_xpombmvutkeqluszppnzllumdseidqlyulmk` (`title`),
  CONSTRAINT `craftfk_opbjdqlkqvupqiwewdlwxeuammsmgspedxvc` FOREIGN KEY (`siteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_vkdaimeufmrqpbcgeliuikiqrxnevhfyresq` FOREIGN KEY (`elementId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftcraftidtokens`;
CREATE TABLE `craftcraftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftfk_blgpfjldprsuibgxzwxgifeyxapnpamaoapw` (`userId`),
  CONSTRAINT `craftfk_blgpfjldprsuibgxzwxgifeyxapnpamaoapw` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftdeprecationerrors`;
CREATE TABLE `craftdeprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_gsmcsoigbctichsvpqczpgnqonhylievnrra` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftdrafts`;
CREATE TABLE `craftdrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `craftidx_cgdzezesdsrhcctgswoxundzyidwfjcwwjig` (`creatorId`,`provisional`),
  KEY `craftidx_wkfsadeaobjoljhavyqykyiqtmmshegsfgqd` (`saved`),
  KEY `craftfk_xskzisjdhikdypvflzyqkynihxwdwcapvtlk` (`sourceId`),
  CONSTRAINT `craftfk_ialxcrfwzhpaflweyhulrealjgbonxouqdrh` FOREIGN KEY (`creatorId`) REFERENCES `craftusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_xskzisjdhikdypvflzyqkynihxwdwcapvtlk` FOREIGN KEY (`sourceId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftelementindexsettings`;
CREATE TABLE `craftelementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_mdyvrmaqhfdejicfyakjudlpijttvhwamlrw` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftelements`;
CREATE TABLE `craftelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_ysxzfciagjivvqnblciictcgdklekthullkt` (`dateDeleted`),
  KEY `craftidx_txhhmxmxxbnrpwfwgfhbovrpryqfdgirnrhi` (`fieldLayoutId`),
  KEY `craftidx_lywdomypsugxwiiahypujtigyiiyfjvysbjo` (`type`),
  KEY `craftidx_araldqqwxekwynqbbbtwwlwdxvgjmhuyozvt` (`enabled`),
  KEY `craftidx_gcxxwfllpufbjwkczapxonqkppirqhyarkiv` (`archived`,`dateCreated`),
  KEY `craftidx_gksfjadahygqixxrcaxychdslubopjehsfaj` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `craftfk_ezlvcbpcmqrqaonzigdfhoaeqdwwnfttihzl` (`canonicalId`),
  KEY `craftfk_svbngjgritcxbtkqehgbdqjvpemudftumvvy` (`draftId`),
  KEY `craftfk_bxhzwyhtrhhkcrkrzyvdrzxfvnyvcuihhkjs` (`revisionId`),
  CONSTRAINT `craftfk_bxhzwyhtrhhkcrkrzyvdrzxfvnyvcuihhkjs` FOREIGN KEY (`revisionId`) REFERENCES `craftrevisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_eeyrgaeqzcyeqtggdhlhrpkueqrklzvwfuri` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_ezlvcbpcmqrqaonzigdfhoaeqdwwnfttihzl` FOREIGN KEY (`canonicalId`) REFERENCES `craftelements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_svbngjgritcxbtkqehgbdqjvpemudftumvvy` FOREIGN KEY (`draftId`) REFERENCES `craftdrafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftelements_sites`;
CREATE TABLE `craftelements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_rlqoriaruzcgrrldhnnrxkophobofrarcyfq` (`elementId`,`siteId`),
  KEY `craftidx_sylsxwxrsaproktccqfhaqymzpximptbznrw` (`siteId`),
  KEY `craftidx_ghlnqexddzauouwggcbxyoxulwdpixxilbov` (`slug`,`siteId`),
  KEY `craftidx_vzalndjmyluuvjkxnauyjhcvidfwnoiwjqtf` (`enabled`),
  KEY `craftidx_nzypisrjnuznzmhygbqzdqvvtxrwybnnpsfa` (`uri`,`siteId`),
  CONSTRAINT `craftfk_aagxnmowtmmxdiicdcvcpcbivtyvbskfwfyp` FOREIGN KEY (`siteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_xaksxwpuqhdvfngnkphfmggiznggeldirfac` FOREIGN KEY (`elementId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftentries`;
CREATE TABLE `craftentries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_ewvnqttwcycykzkkcvwjxcjatnuxpdwnjljp` (`postDate`),
  KEY `craftidx_kxbofbughnmpbfueeygykwoutdwmhpunoxjw` (`expiryDate`),
  KEY `craftidx_zalhrtddrachxhkehskewzcjyhclrrneyipu` (`authorId`),
  KEY `craftidx_ayqvjkupwrhfhqvknvpdfqzohpsjdwpfchaa` (`sectionId`),
  KEY `craftidx_gldhcqmixfhjkzqozpdxxcloftnkvnlsjjkf` (`typeId`),
  KEY `craftfk_xuccgvlzunmflfkrbmtansihwpubwtuohcgm` (`parentId`),
  CONSTRAINT `craftfk_evfhgrzmnnxhvzisnezgiccgnclyfjesepyi` FOREIGN KEY (`typeId`) REFERENCES `craftentrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_pdxzcylbpcejohmqgpufioyfbbwpntmnxbjr` FOREIGN KEY (`sectionId`) REFERENCES `craftsections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_tedplfodyoqxrbqmuukycsucopkdwkuebycg` FOREIGN KEY (`id`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_tijkzjttfdhirisfndzcfeibsskxkluzrbee` FOREIGN KEY (`authorId`) REFERENCES `craftusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_xuccgvlzunmflfkrbmtansihwpubwtuohcgm` FOREIGN KEY (`parentId`) REFERENCES `craftentries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftentrytypes`;
CREATE TABLE `craftentrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_iiuzgolnmagzchhzhnspyllvzxkiixharbnp` (`name`,`sectionId`),
  KEY `craftidx_wfemedwourvdzgspgtxcoiujzvafqrmumzdl` (`handle`,`sectionId`),
  KEY `craftidx_qngqmudasjtmgogbmuhiiqyolsoewbqmkdav` (`sectionId`),
  KEY `craftidx_yzdiqgskqaewwccpcqzqbpfvrjgxcxrfrnam` (`fieldLayoutId`),
  KEY `craftidx_hqraqnghnwkaigqbvrpogqsvvtjlmiaowmyn` (`dateDeleted`),
  CONSTRAINT `craftfk_eiocwranoiwykpnoudwxlnhnvvyzjahrszwy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_uecdebypxdmyeacqmbmeqimfyarxipmnnwrl` FOREIGN KEY (`sectionId`) REFERENCES `craftsections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftfieldgroups`;
CREATE TABLE `craftfieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_gmkeubwpavtlhgvbdvjkptfxzlxbiovaferx` (`name`),
  KEY `craftidx_mvcffodvwgeigoxdggxvxiarisjisvwwdbrl` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftfieldlayoutfields`;
CREATE TABLE `craftfieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_xixpemomydbpypixqnasstljozuqntqkahmv` (`layoutId`,`fieldId`),
  KEY `craftidx_arxyvmjjxwituibwblhtpcrsmbmdfbryjapc` (`sortOrder`),
  KEY `craftidx_wdbgjyrhhphshwhmlwhyltrysbrkqfermght` (`tabId`),
  KEY `craftidx_fgpsrcqozfyrgddmfmzollrxuwlezvpjgpjm` (`fieldId`),
  CONSTRAINT `craftfk_hydyjfinioqettpscchflenaziiwulfxcwxj` FOREIGN KEY (`tabId`) REFERENCES `craftfieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_nwaqlqnqwjnocsrztbcoqkyhosgxmlnhsrut` FOREIGN KEY (`layoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_vmtjmiofskexqzgvuyrecvulqqzejwqctchi` FOREIGN KEY (`fieldId`) REFERENCES `craftfields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftfieldlayouts`;
CREATE TABLE `craftfieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_ggwviwqmshrhtcfgvkfygnvkzmdkpihgejcl` (`dateDeleted`),
  KEY `craftidx_xprrzrxixizwdqkxkhpwhddulyothlnrtwbw` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftfieldlayouttabs`;
CREATE TABLE `craftfieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_gufyixcmokzkeztxyeectiewqaeduomlinnr` (`sortOrder`),
  KEY `craftidx_hnqundnhqlusrifbupkqltlodyttnxyhqufj` (`layoutId`),
  CONSTRAINT `craftfk_nbqzvhlgfwaxliljcuerylgwicfoeaqbigae` FOREIGN KEY (`layoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftfields`;
CREATE TABLE `craftfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_gwrwcuhaqzuecevibtykobkvuzfvfobvhkfw` (`handle`,`context`),
  KEY `craftidx_rinauokyeorbrkqayjemhtivzmywlebnwttq` (`groupId`),
  KEY `craftidx_rtqqvbggmpbmkplxhwyukoypifnhucslmewf` (`context`),
  CONSTRAINT `craftfk_jgiprfjuvuegztroqahsmdzbclsesjvilhcw` FOREIGN KEY (`groupId`) REFERENCES `craftfieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftglobalsets`;
CREATE TABLE `craftglobalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_degftmpbsfrznmrwfafbmersfeotyadbdnmp` (`name`),
  KEY `craftidx_pomcbluojphugyebedvywbgoptafqruqhwub` (`handle`),
  KEY `craftidx_gsetadrpmivodcmslycxbntjnybzfrkwxaoq` (`fieldLayoutId`),
  KEY `craftidx_flvzdmgrfudgjitgsravfvuowkixyimbptuj` (`sortOrder`),
  CONSTRAINT `craftfk_iyadhrngafnhxqyxylzfqtzrbweqfuwxvklo` FOREIGN KEY (`id`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_xpglhaygdhpcztcszbgibiyejrzqbwcuvdex` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftgqlschemas`;
CREATE TABLE `craftgqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftgqltokens`;
CREATE TABLE `craftgqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_dzuvhibtgkrxpoxukwhelylmplnijjhhpcro` (`accessToken`),
  UNIQUE KEY `craftidx_jwjadocjnivcuqlyferuxjiqntumbfvmfgfj` (`name`),
  KEY `craftfk_dcsmdccrwyjrqxdzmulyzgkroytbdxblmruz` (`schemaId`),
  CONSTRAINT `craftfk_dcsmdccrwyjrqxdzmulyzgkroytbdxblmruz` FOREIGN KEY (`schemaId`) REFERENCES `craftgqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftinfo`;
CREATE TABLE `craftinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftmatrixblocks`;
CREATE TABLE `craftmatrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_droqmniiumjvvuuocowpmgteusrqifwczidc` (`ownerId`),
  KEY `craftidx_bvihragbmngooctjfkmlelhumuwsbcvgxstn` (`fieldId`),
  KEY `craftidx_dffawnjtsysnsmjnsdloesqjngtgmxxobhnk` (`typeId`),
  KEY `craftidx_xtnkeffmkvpcjvhzotvsldgyegescggacfkh` (`sortOrder`),
  CONSTRAINT `craftfk_fybbkpogizsoupwqjtyqmdkveuzfhlbomzdh` FOREIGN KEY (`id`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_kxxwqxdmcdplxxkxxsdkfypvmgwuyfutunvr` FOREIGN KEY (`fieldId`) REFERENCES `craftfields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_mlamrczlpzxbefwccdwreelxvqwraommwnvf` FOREIGN KEY (`typeId`) REFERENCES `craftmatrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_ynfdhcvsxyoizxokerflnjgtjtjmhfpzoeut` FOREIGN KEY (`ownerId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftmatrixblocktypes`;
CREATE TABLE `craftmatrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_vudfgdmdyuxqcpfhpdxxzloiyxnpxgyzvufg` (`name`,`fieldId`),
  KEY `craftidx_jctozizazmmzdnagetgoqrophlgrbzgbxvwk` (`handle`,`fieldId`),
  KEY `craftidx_opsntlkkohdwaupllxwpfvvzfrcrxbdwyhiy` (`fieldId`),
  KEY `craftidx_vpdcyrdwjupnguyfbkqrsqruebkprktutluo` (`fieldLayoutId`),
  CONSTRAINT `craftfk_jdjqjlemkyrdjqjvkbndszpgqompcnqhapoc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_vlbkuecqkzurbsynsgpmbqbmgjbqiccwcpxp` FOREIGN KEY (`fieldId`) REFERENCES `craftfields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftmigrations`;
CREATE TABLE `craftmigrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_kvtbeysurvamfxuqvwxshhglreimjrmvkxnw` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftplugins`;
CREATE TABLE `craftplugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_zjcvyuydbcaywlfhzukjozgjoicvdqwkfzrf` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftprojectconfig`;
CREATE TABLE `craftprojectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftqueue`;
CREATE TABLE `craftqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `craftidx_hgpqejfnxulovkzvlsukkqcarkgidbjncmwb` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `craftidx_tkzymocjveveourffbfoajdvxyhukkxqntxr` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftrelations`;
CREATE TABLE `craftrelations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_prszlybtupfwtwxtxfzqgeraszijabowrakq` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craftidx_ixphfpubgobawooayfinshympwocqiacbspy` (`sourceId`),
  KEY `craftidx_eajpslpwvnmjqvnqcqxwqykkxcmpptxlbzyz` (`targetId`),
  KEY `craftidx_qvqlwxyftkmcxaaajinnovslqoggpnykpnad` (`sourceSiteId`),
  CONSTRAINT `craftfk_hcthpkkhmxejdxkqdxwjwwqmtkmixzlkvhtn` FOREIGN KEY (`fieldId`) REFERENCES `craftfields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_tdnspyrqbrkzkzmhrstqxoequfnsnqopjigc` FOREIGN KEY (`sourceId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_ywoxoqgxefcxmzhbxfvtisgpdgmkwdpdpgzq` FOREIGN KEY (`sourceSiteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craftfk_zujkibtjlvzmggqrgwnnzldhpfzgveivazbg` FOREIGN KEY (`targetId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftresourcepaths`;
CREATE TABLE `craftresourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftrevisions`;
CREATE TABLE `craftrevisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_nvajyeciohjujcmmtbhhhrzrdezvrllxekdr` (`sourceId`,`num`),
  KEY `craftfk_rsqukqbwmcegfqsiiarhaiqtpzhwaypvudxn` (`creatorId`),
  CONSTRAINT `craftfk_aheawxmgporywimfrllaeazjqwrgtshuuols` FOREIGN KEY (`sourceId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_rsqukqbwmcegfqsiiarhaiqtpzhwaypvudxn` FOREIGN KEY (`creatorId`) REFERENCES `craftusers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsearchindex`;
CREATE TABLE `craftsearchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craftidx_nsizibnmynjdtnhmgvhvwpnggfzsqmxmkhvt` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsections`;
CREATE TABLE `craftsections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_ksfeyhssqudpchbmkyearjcmmorzfcvvziub` (`handle`),
  KEY `craftidx_mvaufgigryyeteltumkwyqbtgxzauyusdkql` (`name`),
  KEY `craftidx_fmomqzrgpxmxhgqmohncrkgedthmpbsqwehy` (`structureId`),
  KEY `craftidx_zjxnpcswzrzfkwkxlyshqnbsnqjkkzawkhho` (`dateDeleted`),
  CONSTRAINT `craftfk_tladtduixxvrugnkmxokjufbtxnwgfhsbakr` FOREIGN KEY (`structureId`) REFERENCES `craftstructures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsections_sites`;
CREATE TABLE `craftsections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_rmfpxwkjuizrallpxpllqownohyltdfigrdl` (`sectionId`,`siteId`),
  KEY `craftidx_fovqruyimjuafkybpeseobnvwkzxyxfhqpfq` (`siteId`),
  CONSTRAINT `craftfk_daqfuibbbrauyiyhvjpuaejvxaoeqzlsvbry` FOREIGN KEY (`sectionId`) REFERENCES `craftsections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_krujtdmjgcxooirzpplohipyhcawayrfmdek` FOREIGN KEY (`siteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsequences`;
CREATE TABLE `craftsequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsessions`;
CREATE TABLE `craftsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_aovksrctxtwztnqrrapfewokwwnfhmszxitk` (`uid`),
  KEY `craftidx_qlcyqwhjivzfmnprptefxyzyvbunuqgohfcd` (`token`),
  KEY `craftidx_yytewqpmbaestffobbngxcacjvtobseqkhit` (`dateUpdated`),
  KEY `craftidx_ksjiewrgqeibxgcugplilzwxhbcukxxyifhz` (`userId`),
  CONSTRAINT `craftfk_fjpenqukyixjnekrabxuxuyzqtcuziolldkj` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftshunnedmessages`;
CREATE TABLE `craftshunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_ygptzdqjkidvqgoxwehazdcvbybivquqkksn` (`userId`,`message`),
  CONSTRAINT `craftfk_gtrulpkltozbuiuzdmwjurwlyxbhkibedeah` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsitegroups`;
CREATE TABLE `craftsitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_sdbemlaikupjhpdogrgisfheyxmynagsoqzk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsites`;
CREATE TABLE `craftsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_cuhswqsnquyvrwhnthkcfpoicmucbleejbji` (`dateDeleted`),
  KEY `craftidx_zmeymbneixrlezjmnuivkudndbvdkiybfepa` (`handle`),
  KEY `craftidx_mzqhabgumwmwoxwwaryzkdtyejlqyjqanfru` (`sortOrder`),
  KEY `craftfk_yicwahxegkmbwqfbomkicgjieslxawvfalaz` (`groupId`),
  CONSTRAINT `craftfk_yicwahxegkmbwqfbomkicgjieslxawvfalaz` FOREIGN KEY (`groupId`) REFERENCES `craftsitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftstructureelements`;
CREATE TABLE `craftstructureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_lgaxxcberbetboncihkaquwjezxkumxyfsbm` (`structureId`,`elementId`),
  KEY `craftidx_wkkjvrfkjexadhbuclprhgbzdytjukgvmnmw` (`root`),
  KEY `craftidx_lblnxcncsetkfqngqaoiotsldzkixumionwg` (`lft`),
  KEY `craftidx_bwnddgkunwgpmtinhyeyiglnrctkdjepjlnh` (`rgt`),
  KEY `craftidx_vnfkmkafkifsppssobkmzbvxwkmyoyahpqbj` (`level`),
  KEY `craftidx_xjgwpmmbggerkngkzarxwopzjwtrwiliaiio` (`elementId`),
  CONSTRAINT `craftfk_dnjooxgajtowgckraxpbrlehxdtarpwyndaj` FOREIGN KEY (`elementId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_povcrahgfwbyavomhvvldwqiebzippwdirjf` FOREIGN KEY (`structureId`) REFERENCES `craftstructures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftstructures`;
CREATE TABLE `craftstructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_ilhsgvqghhvaqjljcxuyevkvoglafljywpiy` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftsystemmessages`;
CREATE TABLE `craftsystemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_ktfeilmicskzbazsruubvsynfumbktazeilh` (`key`,`language`),
  KEY `craftidx_dqodqetfwpeheymwrdjtemmajzhlegobsiji` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `crafttaggroups`;
CREATE TABLE `crafttaggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_iplxdmwsmqyeaulpkopcsydxsnslfthyuaed` (`name`),
  KEY `craftidx_pkwjceaxmweeijhhgnjyfffjgqgxawmmzhgc` (`handle`),
  KEY `craftidx_heraklfhyfeyilgweubuxntltzhfzlbxmonh` (`dateDeleted`),
  KEY `craftfk_xaxbjibsbvpxwxtfwupdbkwnlthnefjuipvj` (`fieldLayoutId`),
  CONSTRAINT `craftfk_xaxbjibsbvpxwxtfwupdbkwnlthnefjuipvj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `crafttags`;
CREATE TABLE `crafttags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_tixagsifemeyoprshshitbkwjyzngsxtzmxb` (`groupId`),
  CONSTRAINT `craftfk_bowbyxglevevrgaewcuysinierkayfzlgfns` FOREIGN KEY (`id`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_pbbcdiqyrixeklljuvasubncgfllzmxopaxs` FOREIGN KEY (`groupId`) REFERENCES `crafttaggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `crafttemplatecacheelements`;
CREATE TABLE `crafttemplatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craftidx_wfeuafnfwctsthyzlekcmedtszginhlrwbps` (`cacheId`),
  KEY `craftidx_fnkjkixmbnrzvidfpcdrktpwrvpilcoawlel` (`elementId`),
  CONSTRAINT `craftfk_fjmyovkrkkqadhvpuzkgvcvikhtksjhzonfw` FOREIGN KEY (`elementId`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_lrwlyqjgqdbmabdqcmjnhseaciourhutsmow` FOREIGN KEY (`cacheId`) REFERENCES `crafttemplatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `crafttemplatecachequeries`;
CREATE TABLE `crafttemplatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craftidx_kciprfzlrwibomauahlzsusinjsvpjixujrs` (`cacheId`),
  KEY `craftidx_asqimtmkobxjomhwylglmthpxbbwmlbqueml` (`type`),
  CONSTRAINT `craftfk_jrsufejlcawxnnljvyukiyymgbjflhcxasec` FOREIGN KEY (`cacheId`) REFERENCES `crafttemplatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `crafttemplatecaches`;
CREATE TABLE `crafttemplatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craftidx_cdqrufewgawvwmqezwhynpzgymtijrqqqpvv` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `craftidx_qjkfjyxferkjloqfrvqfdneiggajvlylzrhc` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `craftidx_dibdbslfozlwguggmanmakltbtzlzrukjugz` (`siteId`),
  CONSTRAINT `craftfk_qtfqwpkxtjxwwanhjbdgddksdsjskrukueer` FOREIGN KEY (`siteId`) REFERENCES `craftsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `crafttokens`;
CREATE TABLE `crafttokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_usjpsnzwducxbsnjozcgbhwmnabqbwqobrzb` (`token`),
  KEY `craftidx_rsnwluymfmxatuqxarzikegzsrmcltbayrpl` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftusergroups`;
CREATE TABLE `craftusergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_qyatrgfuywqmsjzbztsibginlimndupkawxf` (`handle`),
  KEY `craftidx_bfrxrjpklccpqsrbzgkvttwzonpsjaeznzss` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftusergroups_users`;
CREATE TABLE `craftusergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_zehbgypjjroovogfexmnsgvgsghfuuphjgrg` (`groupId`,`userId`),
  KEY `craftidx_sltgkjwaihejpahfevquwhzrrpsruaydfcxz` (`userId`),
  CONSTRAINT `craftfk_sfjpwpzbkhmxygpstmednsyzfojztyidbnln` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_zcpvpcyzqjbyqitcchxwvachmugomfvgzzdr` FOREIGN KEY (`groupId`) REFERENCES `craftusergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftuserpermissions`;
CREATE TABLE `craftuserpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_yudjmtkwkxdiikfctzbakwsopgnvvpxicxbl` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftuserpermissions_usergroups`;
CREATE TABLE `craftuserpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_dhovtfeouvutgnyyflzemimzjsmbozkcelft` (`permissionId`,`groupId`),
  KEY `craftidx_zdwdzzuetgfxsiyhzqdgjmepnrglxwhlxyih` (`groupId`),
  CONSTRAINT `craftfk_nuzpbnbsqyrxyfczbpyekvgtdmtfupfnrfrx` FOREIGN KEY (`permissionId`) REFERENCES `craftuserpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_rcstjwylxodryeaourqksbtzpzmjnqcvhzsw` FOREIGN KEY (`groupId`) REFERENCES `craftusergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftuserpermissions_users`;
CREATE TABLE `craftuserpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_dhpwuedeolmozdpjwgafzwhnjnegkcfsygqv` (`permissionId`,`userId`),
  KEY `craftidx_iidzfeglmwrhwprbimelgqxaohsfprrhowtg` (`userId`),
  CONSTRAINT `craftfk_odabawogvtytewbhbwjharcywqfmikvbwiog` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_txxldjcqzgzdsvdbzljnmcyaxregaojilcvf` FOREIGN KEY (`permissionId`) REFERENCES `craftuserpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftuserpreferences`;
CREATE TABLE `craftuserpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craftfk_ufdcjhpdqswalvqklzhticsxjdinarkhvcjp` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftusers`;
CREATE TABLE `craftusers` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_dlpindobgfarghjtzdfoieopqnmwjmibgwwk` (`uid`),
  KEY `craftidx_aioucvahtntpkgmcyzwibbsnvapuqoucgyzw` (`verificationCode`),
  KEY `craftidx_suxsnbfwuatoieinzkbczjnnnvqqyahhqafx` (`email`),
  KEY `craftidx_owabsqnjckptkwfeetiphpbpczqfqscbjqpp` (`username`),
  KEY `craftfk_mliejlcusstfqljnfkwovppibsstccxcowys` (`photoId`),
  CONSTRAINT `craftfk_mliejlcusstfqljnfkwovppibsstccxcowys` FOREIGN KEY (`photoId`) REFERENCES `craftassets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craftfk_seqxfawoirnlcptnyicmsyesmvpucyposcrd` FOREIGN KEY (`id`) REFERENCES `craftelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftvolumefolders`;
CREATE TABLE `craftvolumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craftidx_aaxhcjndgcxaskjnekepnmfdwrwmbjkpmhzv` (`name`,`parentId`,`volumeId`),
  KEY `craftidx_obqvjzhwhpbcymgnwcwplwemaypzulziqnjl` (`parentId`),
  KEY `craftidx_esyofmuebaqwfsasxwjrqocpcqsdqmdwvkeg` (`volumeId`),
  CONSTRAINT `craftfk_edczepkvltpmdlfdejcsrkfyayiwajzrvytb` FOREIGN KEY (`volumeId`) REFERENCES `craftvolumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craftfk_wbxzdgkzheuxgeawhsndupmgqnjhcowzclik` FOREIGN KEY (`parentId`) REFERENCES `craftvolumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftvolumes`;
CREATE TABLE `craftvolumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_fujcouevdtvrquxafcqdyzoxxgxxelnpgfub` (`name`),
  KEY `craftidx_uzejsdmkfnqxlgdycysszxytfyvzkimmhksi` (`handle`),
  KEY `craftidx_fcwrxuyxupbejwfesphmyebyncclrlxjvgog` (`fieldLayoutId`),
  KEY `craftidx_jxtgammskzjteuupffdcgmmzaukljiacxctq` (`dateDeleted`),
  CONSTRAINT `craftfk_cbdyjgbbbeaoiukrfxanruqhfcfrnziijnou` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craftfieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `craftwidgets`;
CREATE TABLE `craftwidgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidx_jrqkaubdqivpnzzcbvbeehpjlyyvmrspdvsr` (`userId`),
  CONSTRAINT `craftfk_xqffyfesrumxdnozqqmmfyluiutpkolzbpll` FOREIGN KEY (`userId`) REFERENCES `craftusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `craft_changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(1, 1, 'firstName', '2022-03-07 09:59:17', 0, 1),
(1, 1, 'invalidLoginCount', '2021-12-06 11:04:50', 0, NULL),
(1, 1, 'invalidLoginWindowStart', '2021-12-06 11:04:50', 0, NULL),
(1, 1, 'lastName', '2022-03-07 09:59:17', 0, 1),
(1, 1, 'lastPasswordChangeDate', '2022-03-07 09:59:17', 0, 1),
(1, 1, 'password', '2022-03-07 09:59:17', 0, 1),
(1, 1, 'verificationCode', '2021-12-06 11:04:50', 0, NULL),
(1, 1, 'verificationCodeIssuedDate', '2021-12-06 11:04:50', 0, NULL);

INSERT INTO `craft_changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 1, '2021-11-23 15:55:33', 0, 1),
(8, 1, 5, '2021-11-23 16:03:03', 0, 1);

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_seo_yoqcokck`) VALUES
(1, 1, 1, NULL, '2021-11-23 14:07:04', '2022-03-07 09:59:16', '516f20ef-4f1f-476c-8ffc-efdbb6619303', NULL),
(2, 2, 1, 'Homepage', '2021-11-23 14:19:42', '2021-12-17 16:28:01', '066e38c7-ffbd-4d37-a874-3e363740fa74', '{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}'),
(3, 3, 1, 'Homepage', '2021-11-23 14:19:42', '2021-11-23 14:19:42', 'b8d8bd10-701e-404b-b512-368e83745561', NULL),
(4, 4, 1, 'Homepage', '2021-11-23 14:19:54', '2021-11-23 14:19:54', 'e8871426-24e8-4940-bcd9-7d44080afebe', '{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}'),
(6, 7, 1, 'Homepage', '2021-11-23 15:55:34', '2021-11-23 15:55:34', '659d1ec3-7ccd-4dda-abbb-a450843f7331', '{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}'),
(7, 8, 1, NULL, '2021-11-23 16:01:28', '2021-11-23 16:03:03', '18f8cc59-d0ad-402b-b6da-78c7e53be291', NULL),
(8, 17, 1, NULL, '2021-12-06 11:08:45', '2021-12-17 16:28:01', '5b80a95e-d9e3-492c-a855-c2c8641748a9', NULL),
(9, 20, 1, 'Homepage', '2021-12-06 12:38:51', '2021-12-06 12:38:51', '4a20cb10-f4d2-40d0-ba8f-25702c69d4b0', '{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}'),
(10, 21, 1, 'Homepage', '2021-12-17 16:28:00', '2021-12-17 16:28:00', '7da15eb7-1670-4177-8ae0-5ae142d4e941', '{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}'),
(11, 22, 1, 'Homepage', '2021-12-17 16:28:01', '2021-12-17 16:28:01', '8d14a261-f356-4d5e-aec7-d3a57a24d4f3', '{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Mission 10\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}');

INSERT INTO `craft_drafts` (`id`, `sourceId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`) VALUES
(2, NULL, 1, 0, 'First draft', '', 0, NULL, 1);

INSERT INTO `craft_elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"sourceOrder\":[[\"key\",\"*\"],[\"heading\",\"\"],[\"key\",\"single:22879b2d-c513-40dc-86a1-da6c5c5901eb\"],[\"key\",\"section:9df1c3f9-df7c-4f21-a8e9-c034cf195242\"]],\"sources\":{\"*\":{\"tableAttributes\":{\"1\":\"section\",\"2\":\"postDate\",\"3\":\"expiryDate\",\"4\":\"link\"}}}}', '2021-11-23 15:42:03', '2021-11-23 15:42:03', 'd8b0f045-1feb-4ff6-84bb-35a4a5910c09');

INSERT INTO `craft_elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-11-23 14:07:03', '2022-03-07 09:59:16', NULL, NULL, '321f6665-85be-4116-bf9c-244cd75ca7be'),
(2, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-11-23 14:19:42', '2021-12-17 16:28:01', NULL, NULL, 'cd7227f0-0aa2-4f78-81f1-acfbb77ad16b'),
(3, 2, NULL, 1, 2, 'craft\\elements\\Entry', 1, 0, '2021-11-23 14:19:42', '2021-11-23 14:19:42', NULL, NULL, '8bf5901e-fa9b-4046-be42-48927ebb3846'),
(4, 2, NULL, 2, 2, 'craft\\elements\\Entry', 1, 0, '2021-11-23 14:19:54', '2021-11-23 14:19:54', NULL, NULL, '54fe18a3-8d45-4d32-8ecd-5eb35997170d'),
(6, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-11-23 15:54:21', '2021-11-23 15:54:21', NULL, '2021-11-23 15:55:32', '4f24f43d-c750-4476-b9de-1b417bf9ceca'),
(7, 2, NULL, 3, 2, 'craft\\elements\\Entry', 1, 0, '2021-11-23 15:55:33', '2021-11-23 15:55:34', NULL, NULL, '16be4fbc-b627-4994-9211-98611139b645'),
(8, NULL, 2, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2021-11-23 16:01:28', '2021-11-23 16:03:03', NULL, '2021-12-06 11:05:20', '9871c50e-7096-4964-a53a-e8976216cc9e'),
(9, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:01:30', '2021-11-23 16:01:30', NULL, '2021-11-23 16:01:32', 'a6fab7e4-5f1b-4286-9582-70ebd1ed11c0'),
(10, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:01:32', '2021-11-23 16:01:32', NULL, '2021-11-23 16:01:34', '8fbae447-bc54-4c7c-b6f7-8afc43c0c9c7'),
(11, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:01:34', '2021-11-23 16:01:34', NULL, '2021-11-23 16:01:36', 'e3cbb2ad-3e26-4f5f-b5eb-6aad975d0ef4'),
(12, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:01:36', '2021-11-23 16:01:36', NULL, '2021-11-23 16:01:38', '56c89e92-6c21-4d3e-adb8-0011599a2147'),
(13, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:01:38', '2021-11-23 16:01:38', NULL, '2021-11-23 16:01:41', 'e161f467-457c-42d2-9d26-f7b0022350b9'),
(14, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:01:41', '2021-11-23 16:01:41', NULL, '2021-11-23 16:01:42', '7ca05b04-00f4-4183-aa89-86b94b5745a0'),
(15, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:01:42', '2021-11-23 16:01:42', NULL, '2021-11-23 16:01:44', '051c0771-9700-4732-8e0f-36c6fa2aec39'),
(16, NULL, NULL, NULL, 5, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-11-23 16:03:03', '2021-11-23 16:03:03', NULL, '2021-12-06 11:05:20', '45d277d0-f373-411c-97d5-217bbc3f2fd8'),
(17, NULL, NULL, NULL, 9, 'craft\\elements\\GlobalSet', 1, 0, '2021-12-06 11:08:45', '2021-12-17 16:28:01', NULL, NULL, 'e84f44c6-9fc5-4991-aa41-ac87821084e0'),
(18, NULL, NULL, NULL, 8, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-12-06 11:09:31', '2021-12-06 11:09:31', NULL, NULL, '4f654e11-f2b3-4e0b-9025-1580b9bcd7fa'),
(19, NULL, NULL, NULL, 8, 'verbb\\supertable\\elements\\SuperTableBlockElement', 1, 0, '2021-12-06 11:09:31', '2021-12-06 11:09:31', NULL, NULL, '19339139-dc88-4218-b739-8f64b605cf87'),
(20, 2, NULL, 4, 2, 'craft\\elements\\Entry', 1, 0, '2021-12-06 12:38:51', '2021-12-06 12:38:51', NULL, NULL, '6432f0bf-d2a1-487a-a5b4-a936cb94410b'),
(21, 2, NULL, 5, 2, 'craft\\elements\\Entry', 1, 0, '2021-12-17 16:28:00', '2021-12-17 16:28:00', NULL, NULL, 'd5c008a1-2c38-41ce-bce6-ce047e8bb09d'),
(22, 2, NULL, 6, 2, 'craft\\elements\\Entry', 1, 0, '2021-12-17 16:28:01', '2021-12-17 16:28:01', NULL, NULL, 'd51461c7-a84a-4aee-909e-3709fb4c28cc');

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-11-23 14:07:04', '2021-11-23 14:07:04', '2f43c181-8c5e-40a7-b250-e59ce684b0ac'),
(2, 2, 1, 'homepage', '__home__', 1, '2021-11-23 14:19:42', '2021-11-23 14:19:42', 'e20e159a-2562-4629-9917-0b685fb21e05'),
(3, 3, 1, 'homepage', '__home__', 1, '2021-11-23 14:19:42', '2021-11-23 14:19:42', 'a40954a2-252a-46de-8d4a-22fa38453184'),
(4, 4, 1, 'homepage', '__home__', 1, '2021-11-23 14:19:54', '2021-11-23 14:19:54', 'fe15dd28-1cf7-47d0-9800-54db995fbc27'),
(6, 6, 1, NULL, NULL, 1, '2021-11-23 15:54:21', '2021-11-23 15:54:21', 'cdb8c95f-b7e0-4e7a-99c3-a865aecf7719'),
(7, 7, 1, 'homepage', '__home__', 1, '2021-11-23 15:55:34', '2021-11-23 15:55:34', 'deeab271-8e5b-4f4e-9a36-9a58e9cc45cd'),
(8, 8, 1, '__temp_vducnmtsfpwtamdtqvnpzfasvyexifwjsdyj', NULL, 1, '2021-11-23 16:01:28', '2021-11-23 16:01:28', '189065cc-f146-41da-b918-81a1e65784df'),
(9, 9, 1, NULL, NULL, 1, '2021-11-23 16:01:30', '2021-11-23 16:01:30', 'f25b83e4-6162-4ab9-a654-d9c86d27d375'),
(10, 10, 1, NULL, NULL, 1, '2021-11-23 16:01:32', '2021-11-23 16:01:32', '7b7a9d41-743c-4131-9fbe-b7741749f556'),
(11, 11, 1, NULL, NULL, 1, '2021-11-23 16:01:34', '2021-11-23 16:01:34', '16ce7de5-aefe-449f-ba31-a11ff0398373'),
(12, 12, 1, NULL, NULL, 1, '2021-11-23 16:01:36', '2021-11-23 16:01:36', '2ea3d1ff-dc81-429b-87dc-698ee8b4e7e2'),
(13, 13, 1, NULL, NULL, 1, '2021-11-23 16:01:38', '2021-11-23 16:01:38', 'cfe05f55-46ec-49ef-96ab-8ebc27ca43ee'),
(14, 14, 1, NULL, NULL, 1, '2021-11-23 16:01:41', '2021-11-23 16:01:41', '067a4322-0ea0-4c66-8c0b-da612e12f8ab'),
(15, 15, 1, NULL, NULL, 1, '2021-11-23 16:01:42', '2021-11-23 16:01:42', '51988956-4fcd-4234-8341-49f761b6dddc'),
(16, 16, 1, NULL, NULL, 1, '2021-11-23 16:03:03', '2021-11-23 16:03:03', '71f41fb7-d432-414a-8fff-0a46e5fdfedd'),
(17, 17, 1, NULL, NULL, 1, '2021-12-06 11:08:45', '2021-12-06 11:08:45', 'e1a2514d-c61a-41d3-a08c-8a1773a5e6bf'),
(18, 18, 1, NULL, NULL, 1, '2021-12-06 11:09:31', '2021-12-06 11:09:31', '7f11d0c0-ff32-4613-ab3c-ce286e1efef4'),
(19, 19, 1, NULL, NULL, 1, '2021-12-06 11:09:31', '2021-12-06 11:09:31', '944813de-7a32-4018-b22d-5ad04c7b41f7'),
(20, 20, 1, 'homepage', '__home__', 1, '2021-12-06 12:38:51', '2021-12-06 12:38:51', '817608df-07ee-4889-b3a3-82a9823ee2c1'),
(21, 21, 1, 'homepage', '__home__', 1, '2021-12-17 16:28:00', '2021-12-17 16:28:00', '3385d17b-011a-4429-bcdb-7698caf56345'),
(22, 22, 1, 'homepage', '__home__', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'f2ad4a21-0c6c-4b41-8800-656b6c02c6f3');

INSERT INTO `craft_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2021-11-23 14:19:00', NULL, NULL, '2021-11-23 14:19:42', '2021-11-23 14:19:42', 'f86acdc5-a50c-4971-891a-9d0b51202ce2'),
(3, 1, NULL, 1, NULL, '2021-11-23 14:19:00', NULL, NULL, '2021-11-23 14:19:42', '2021-11-23 14:19:42', 'ebd4ebba-7f5c-4064-9c28-b1abfac0d0ed'),
(4, 1, NULL, 1, NULL, '2021-11-23 14:19:00', NULL, NULL, '2021-11-23 14:19:54', '2021-11-23 14:19:54', 'ff6b06db-437d-443b-b177-68b4a365042c'),
(7, 1, NULL, 1, NULL, '2021-11-23 14:19:00', NULL, NULL, '2021-11-23 15:55:34', '2021-11-23 15:55:34', '879d52fb-6502-4184-b10a-7a258b5d1d1c'),
(8, 3, NULL, 3, 1, '2021-11-23 16:01:00', NULL, 0, '2021-11-23 16:01:28', '2021-11-23 16:01:28', 'fdda4ef0-787d-4151-9fa1-6e5189cf88be'),
(20, 1, NULL, 1, NULL, '2021-11-23 14:19:00', NULL, NULL, '2021-12-06 12:38:51', '2021-12-06 12:38:51', 'd807256a-c45f-487e-a058-38a0bb076e04'),
(21, 1, NULL, 1, NULL, '2021-11-23 14:19:00', NULL, NULL, '2021-12-17 16:28:00', '2021-12-17 16:28:00', 'b4be0977-c470-4b8e-b05b-084a0ce2013a'),
(22, 1, NULL, 1, NULL, '2021-11-23 14:19:00', NULL, NULL, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'a3997f42-8cad-442f-8aa2-08ef8716b30c');

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 2, 'Homepage', 'homepage', 0, 'site', NULL, '{section.name|raw}', 1, '2021-11-23 14:19:42', '2021-11-23 14:19:42', NULL, 'c4834d8d-2e08-4de5-8b12-00a1277c2d2b'),
(2, 2, 3, 'Default', 'default', 1, 'site', NULL, NULL, 1, '2021-11-23 14:20:36', '2021-11-23 14:20:36', NULL, 'e68e9282-5576-414b-97db-5af34362b556'),
(3, 3, 6, 'Default', 'default', 1, 'site', NULL, NULL, 1, '2021-11-23 15:46:14', '2021-11-23 15:46:14', NULL, '107b376a-da5e-45ed-ab87-8a1f88124d69');

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-11-23 14:07:03', '2021-11-23 14:07:03', NULL, '1e6503ce-1874-499c-ac7a-3b92d3d0292a'),
(2, 'CTA', '2021-11-23 15:44:31', '2021-11-23 15:44:31', '2021-11-23 15:44:35', 'fb4fbfb4-8fef-42e6-9c97-22584d7ad635'),
(3, 'Globals', '2021-12-06 11:05:55', '2021-12-06 11:05:55', NULL, 'f64d0b4c-fb82-4b48-8b94-1153cc2c830c'),
(4, 'Test', '2021-12-06 12:36:36', '2021-12-06 12:36:36', '2021-12-17 16:28:00', '9594a255-d2bf-4455-abf1-99b7ce6606b9');

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(34, 3, 31, 1, 0, 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '27faecf3-a42f-414e-8252-e20be816e798'),
(35, 3, 32, 4, 0, 0, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '9b6165d6-9d44-4c09-9970-0f737ea1b507'),
(36, 2, 33, 1, 0, 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '13f7bb22-3d24-43d7-b114-be610d460e59'),
(37, 2, 34, 4, 0, 0, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '5f2870e1-d1fe-46ad-80d9-4564c3056c94'),
(38, 6, 35, 5, 0, 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '19644678-b136-41eb-b585-aded39b1f7d7'),
(39, 9, 37, 8, 0, 0, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '14b2d366-afe8-4868-8d42-9ce3f20e03ec'),
(40, 8, 38, 9, 0, 0, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'cf6cfd9a-3057-45ff-827a-0636b0ef4d9c'),
(43, 7, 40, 7, 1, 0, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'c7c5d95f-9c39-4df8-b80e-737e2604da2a'),
(44, 5, 41, 6, 0, 0, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '82eb541f-43dc-49eb-abce-59603826ba3c'),
(45, 1, 43, 2, 0, 0, '2022-04-06 08:17:35', '2022-04-06 08:17:35', 'd22e18bc-ee6a-4602-9145-3be2096bb806'),
(46, 1, 43, 3, 0, 1, '2022-04-06 08:17:35', '2022-04-06 08:17:35', 'a2156459-7609-4487-8482-7afca3e9cda6');

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\MatrixBlock', '2021-11-23 14:18:09', '2021-11-23 14:18:09', NULL, '97725b87-36f1-4737-9c0b-f0c5dfc22b58'),
(2, 'craft\\elements\\Entry', '2021-11-23 14:19:42', '2021-11-23 14:19:42', NULL, 'cbff9951-c82a-45da-b506-12d80fd9bdc2'),
(3, 'craft\\elements\\Entry', '2021-11-23 14:20:36', '2021-11-23 14:20:36', NULL, 'e8cecc7d-f597-4170-8b0f-381037a125d0'),
(4, 'craft\\elements\\Asset', '2021-11-23 15:41:30', '2021-11-23 15:41:30', NULL, '5d8d99f5-8168-492c-b05d-95964f303475'),
(5, 'verbb\\supertable\\elements\\SuperTableBlockElement', '2021-11-23 15:46:00', '2021-11-23 15:46:00', NULL, 'a76d2da8-34da-47fa-809f-ac71e1d195e6'),
(6, 'craft\\elements\\Entry', '2021-11-23 15:46:14', '2021-11-23 15:46:14', NULL, '63545446-0a5e-41df-8a37-c9a5a16d70ae'),
(7, 'craft\\elements\\MatrixBlock', '2021-11-23 15:54:16', '2021-11-23 15:54:16', NULL, 'f77b6b6e-7381-493f-9bb0-81c2f4e5b935'),
(8, 'verbb\\supertable\\elements\\SuperTableBlockElement', '2021-12-06 11:08:24', '2021-12-06 11:08:24', NULL, '05cee47c-00a1-478b-b4ab-ba047b77feaa'),
(9, 'craft\\elements\\GlobalSet', '2021-12-06 11:08:45', '2021-12-06 11:08:45', NULL, '7fb7112f-7779-45d1-8a9f-8f99bd80b8ab');

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(31, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"64286a3d-abda-4015-acb6-fdd84a52c3e7\"}]', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '5144a953-beaa-43b0-a765-bec0e4d19631'),
(32, 3, 'SEO', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a0571e3-8ecb-46fc-86f1-667fab82405c\"}]', 2, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'c4bc3a39-8834-4dcd-b74e-0fbdf236f87f'),
(33, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"64286a3d-abda-4015-acb6-fdd84a52c3e7\"}]', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'aad6e9b6-e441-416b-bd94-b50dc7cae3d3'),
(34, 2, 'SEO', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a0571e3-8ecb-46fc-86f1-667fab82405c\"}]', 2, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '0a631dc8-2a14-44ca-bb6b-7d504bbf4735'),
(35, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a9ed9ec2-c297-4bfd-8361-a5385e2139ea\"}]', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '3438949f-f5f0-4903-9125-9afae02c8658'),
(37, 9, 'Links', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0ec43b96-234e-442e-94d0-c51b18893a12\"}]', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '7b05c2cc-f39d-4d30-bd6b-b5e2eb99adad'),
(38, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"cd32edba-450b-4dc8-b0f0-298d905efc13\"}]', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'bb3e3b8d-7e7c-4929-807f-a9d9167d8de5'),
(40, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"116e4376-8da0-4496-9c87-73c2945e25a9\"}]', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', 'c1cd969d-6b44-4484-9be2-1db8998269df'),
(41, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"941b54ca-fa78-4aba-a0e7-c8ea0b9ee389\"}]', 1, '2021-12-17 16:28:01', '2021-12-17 16:28:01', '71806376-18d6-4529-b654-6e95432e45c3'),
(42, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2022-04-06 08:17:34', '2022-04-06 08:17:34', 'c076e307-10fd-4d6d-a905-586fabc41e35'),
(43, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6a4b9a4b-2826-4e8a-a241-207b54505996\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8d283175-641b-464a-ae68-7d0513252808\"}]', 1, '2022-04-06 08:17:35', '2022-04-06 08:17:35', '3ddcd860-9fa0-43c2-a745-ec7b36bb7570');

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Content Blocks', 'contentBlocks', 'global', NULL, '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_contentblocks}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}', '2021-11-23 14:18:09', '2021-11-23 14:18:09', '64286a3d-abda-4015-acb6-fdd84a52c3e7'),
(2, NULL, 'Headline', 'headline', 'matrixBlockType:f3b895ab-1000-4c04-b882-109ea8a06527', NULL, '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-11-23 14:18:09', '2021-11-23 14:18:48', '6a4b9a4b-2826-4e8a-a241-207b54505996'),
(3, NULL, 'Copy', 'copy', 'matrixBlockType:f3b895ab-1000-4c04-b882-109ea8a06527', NULL, '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2021-11-23 14:18:48', '2021-11-23 15:54:16', '8d283175-641b-464a-ae68-7d0513252808'),
(4, 1, 'SEO', 'seo', 'global', 'yoqcokck', '', 0, 'none', NULL, 'ether\\seo\\fields\\SeoField', '{\"description\":\"\",\"hideSocial\":\"\",\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"socialImage\":null,\"suffixAsPrefix\":null,\"title\":[{\"key\":\"1\",\"locked\":\"0\",\"template\":\"{title}\"},{\"key\":\"2\",\"locked\":\"1\",\"template\":\" - {{ siteName }}\"}],\"titleSuffix\":null}', '2021-11-23 14:19:26', '2021-11-23 14:19:26', '2a0571e3-8ecb-46fc-86f1-667fab82405c'),
(5, 1, 'Buttons', 'buttons', 'global', NULL, '', 0, 'site', NULL, 'verbb\\supertable\\fields\\SuperTableField', '{\"columns\":{\"941b54ca-fa78-4aba-a0e7-c8ea0b9ee389\":{\"width\":\"\"}},\"contentTable\":\"{{%stc_buttons}}\",\"fieldLayout\":\"row\",\"maxRows\":\"\",\"minRows\":\"\",\"placeholderKey\":null,\"propagationMethod\":\"all\",\"selectionLabel\":\"Add a button\",\"staticField\":\"\"}', '2021-11-23 15:46:00', '2021-11-23 16:01:24', 'a9ed9ec2-c297-4bfd-8361-a5385e2139ea'),
(6, NULL, 'Button', 'button', 'superTableBlockType:10b6675b-2ddd-41ec-96a5-1b2156bac2e6', NULL, '', 0, 'none', NULL, 'typedlinkfield\\fields\\LinkField', '{\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"allowedLinkNames\":{\"3\":\"entry\",\"6\":\"custom\",\"7\":\"email\",\"8\":\"tel\",\"9\":\"url\"},\"autoNoReferrer\":\"\",\"defaultLinkName\":\"asset\",\"defaultText\":\"Learn more\",\"enableAriaLabel\":\"\",\"enableTitle\":\"\",\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"category\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"entry\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"site\":{\"sites\":\"*\"},\"user\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"custom\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"email\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"tel\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"url\":{\"disableValidation\":\"\",\"allowAliases\":\"\"}}}', '2021-11-23 15:46:00', '2021-11-23 16:02:57', '941b54ca-fa78-4aba-a0e7-c8ea0b9ee389'),
(7, NULL, 'Anchor', 'anchor', 'matrixBlockType:62ede65a-7718-438f-8379-f63eebc5c864', NULL, 'Cannot include spaces or special characters.', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-11-23 15:54:16', '2021-11-23 15:55:26', '116e4376-8da0-4496-9c87-73c2945e25a9'),
(8, 3, 'Link-in-bio Links', 'linkInBioLinks', 'global', NULL, '', 0, 'site', NULL, 'verbb\\supertable\\fields\\SuperTableField', '{\"columns\":{\"3c19a2ac-4d02-4ee6-97d3-88b395a9d8e8\":{\"width\":\"\"}},\"contentTable\":\"{{%stc_linkinbiolinks}}\",\"fieldLayout\":\"row\",\"maxRows\":\"\",\"minRows\":\"\",\"placeholderKey\":null,\"propagationMethod\":\"all\",\"selectionLabel\":\"Add a link\",\"staticField\":\"\"}', '2021-12-06 11:08:23', '2021-12-06 11:08:23', '0ec43b96-234e-442e-94d0-c51b18893a12'),
(9, NULL, 'Link', 'bioLink', 'superTableBlockType:1438c97e-4d71-4e53-b9b8-dca088f1f818', 'ejwczycw', '', 0, 'none', NULL, 'typedlinkfield\\fields\\LinkField', '{\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"allowedLinkNames\":{\"1\":\"asset\",\"2\":\"category\",\"3\":\"entry\",\"6\":\"custom\",\"7\":\"email\",\"8\":\"tel\",\"9\":\"url\"},\"autoNoReferrer\":\"\",\"defaultLinkName\":\"url\",\"defaultText\":\"\",\"enableAriaLabel\":\"\",\"enableTitle\":\"\",\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"category\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"entry\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"site\":{\"sites\":\"*\"},\"user\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"custom\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"email\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"tel\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"url\":{\"disableValidation\":\"\",\"allowAliases\":\"\"}}}', '2021-12-06 11:08:24', '2021-12-06 11:08:24', 'cd32edba-450b-4dc8-b0f0-298d905efc13');

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(17, 'Link in bio', 'linkInBio', 9, 1, '2021-12-06 11:08:45', '2021-12-06 11:08:45', 'e84f44c6-9fc5-4991-aa41-ac87821084e0');

INSERT INTO `craft_gqltokens` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `schemaId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Token', '__PUBLIC__', 1, NULL, NULL, NULL, '2021-12-17 16:27:37', '2022-04-01 12:45:36', '8630f01c-553f-431f-be06-d28eb1c691ba');

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.37', '3.7.33', 0, 'tiueaoopqtny', '2@fqfwwrytas', '2021-11-23 14:07:03', '2022-04-06 08:18:34', '61899da4-e4e8-4f82-8982-ede715dfad04');

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'Text', 'text', 1, '2021-11-23 14:18:09', '2021-11-23 14:18:09', 'f3b895ab-1000-4c04-b882-109ea8a06527'),
(2, 1, 7, 'Anchor', 'anchor', 2, '2021-11-23 15:54:16', '2021-11-23 15:54:16', '62ede65a-7718-438f-8379-f63eebc5c864');

INSERT INTO `craft_matrixcontent_contentblocks` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_text_headline`, `field_text_copy`, `field_anchor_anchor`) VALUES
(1, 6, 1, '2021-11-23 15:54:21', '2021-11-23 15:54:21', '5c9769b2-8377-410d-8b2b-4a465cfe776f', NULL, NULL, NULL);

INSERT INTO `craft_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '697d2e94-4a2a-401e-b221-754ed869c337'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '64fd9b94-be77-4881-bf88-761049e82294'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'a5ed9330-82e7-4d63-89d7-a1b61cc89537'),
(4, 'craft', 'm150403_184533_field_version', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '92dea04b-bed4-4c05-b4c0-93a574d683a4'),
(5, 'craft', 'm150403_184729_type_columns', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'f8fd8919-7a21-4504-9b5c-34d58ba286a8'),
(6, 'craft', 'm150403_185142_volumes', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '19c2cfd7-aace-4bab-b4d8-c48ad7880caa'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '0714de89-2cf9-495a-aa02-fa823e9c0a60'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '64f69b2b-f0e1-4519-bc56-e33d7026ee0c'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '4c977356-05d4-4a69-b9e3-b0165f9b071c'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'd3ec19f2-a3f9-470d-894f-3cb534ec5b1f'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'af77b6d8-4724-4314-8d13-9ebced7bf9b3'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '78003021-149b-4c57-9d8d-30ebc21c12d7'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '9253b1bb-44a1-4e14-956c-76be759c03c8'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '9f939f6e-2cfb-4315-a519-31d6a6887b74'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '9da0a5c6-bdef-421d-986a-729aa7d996ef'),
(16, 'craft', 'm151209_000000_move_logo', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'a0c322d9-48c4-47fd-859a-ac148b070566'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '6e4bd9af-c901-4b18-a855-a666c7af8cd4'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '3187994b-d8cb-4ff6-b2ba-d757fb36f69b'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '57b189f5-4546-4f61-99a4-d2dac1026c20'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '0927d4d6-1fb7-4f6c-8384-ce703b953104'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '52ba04a7-77e1-43a8-861d-f7c6a792e79a'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '335981cd-7019-40eb-9545-0fea17934da9'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '7557e349-701e-40ac-8dd1-3e0db35a201d'),
(24, 'craft', 'm160807_144858_sites', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'd35c78d6-f1ad-4a5d-b65f-94ff02b67ad1'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'b0c2b25c-fe92-4ba4-a8b3-690e4ff19374'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'c3795c0a-28c3-48f5-844f-a1802060a9e2'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '9b80e16c-0613-4d2d-a4a4-8a315ad2dac1'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'b6cd2ceb-6311-41d2-be37-fb4aee6f7218'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '4257e9c8-c852-4ede-8695-064d79963352'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '1ebbf4fd-71f3-48bd-afcf-f6c28b185a9c'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'edf8e008-21e8-4cb9-b7ac-8ac3fb55d371'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '510c01fd-bd5e-4466-a833-0b50c09dae20'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '42ad456e-f35d-463e-9b23-391fdd93f590'),
(34, 'craft', 'm161013_175052_newParentId', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '4bbde122-76f0-4295-b2c1-c9323a7279ee'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '8be109d9-e444-4548-87df-60e593ce3623'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '8b35b93a-af50-4d6e-b510-8ef84a456883'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'd1f28cfd-f904-45bc-b58d-368ea26ea1a0'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '29cd81f9-55fe-4876-9e1a-6864575e3332'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '6187e48f-81ca-46e8-b987-85edc133c25c'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '543a0dd5-4330-4827-964e-a8d5271de19c'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '18a324a8-543e-4cd8-894f-789e3d2a48e1'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '07ec0af4-6608-43e7-adf4-00ea316b70ec'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '0dbb3700-30ff-4f14-8dd9-84ec10290a58'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'b4da6766-d2fa-4040-8ab4-2f232e092147'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'fc4d3183-84b3-45f2-aa2d-619cbd2f0da4'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'f7b339c0-a7d0-4ee1-871b-df32e6695084'),
(47, 'craft', 'm170206_142126_system_name', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '70feb7c2-e2b4-476e-8f8e-360ee40a5d4e'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'f1d193b6-88b3-4daf-b5ab-2577b0575fb3'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'eccfa4bf-cf55-40e5-964a-659d485bf072'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '56d82b60-d3a6-4946-b896-3c53760c15d8'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '42f5ce51-ad3e-4017-92ae-2b72038dba9a'),
(52, 'craft', 'm170228_171113_system_messages', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '0cb450a5-17c3-40aa-91b9-2bff36e5274c'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '9ae8d43e-401a-4d88-ad2c-3237e6a1343f'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '0ca01360-f025-4994-92ce-0557c858bca2'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '094110eb-0c19-4392-b013-eaf13c7921ce'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'ff408e82-39f3-4dc6-9452-f87c67de570d'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'aeacedfd-aec8-40b0-b910-aa10755c21f7'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '37d19e0a-d1f6-4850-b3e5-8eea1d9c6ffb'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '915d27bc-cb8f-4b2e-bc94-efee70bf25f8'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'd0f754f4-ed1a-42e1-a03b-cd2b2f8ccefb'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'dc78faa0-05c3-4869-a33a-4185bed18de6'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '7dbfc1ab-b2c3-47b8-b881-7546e9b547c1'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '3f48920c-df37-4063-b102-557e31f38d8e'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '84fa15ea-d8e9-4d57-9ced-6a6779c56497'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'f5e1d8b7-aa0e-4c18-90e1-ef5e63544c2f'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '8899f5f9-4c37-47a1-b829-c3a8f83a10dd'),
(67, 'craft', 'm171011_214115_site_groups', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '7b876701-0be6-425c-b8ac-317a8baad403'),
(68, 'craft', 'm171012_151440_primary_site', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'b0b72363-a914-460e-8d17-a99b01e9a6f4'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '9e4ad8c3-df41-45f1-bc47-29b29a2fe5ca'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2cee6637-7444-4710-b264-8d274a90b6d6'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '986cce9f-de77-43e1-8b38-235fa3a8bcb3'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2d033e06-0111-4262-bc43-547429252c4a'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '16d59c46-fc57-4b92-b2bb-c51fcc6149d9'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'a6b1174d-8563-41e5-b538-a2313f71f738'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '18d79d6a-8a39-4922-820e-d306764458ba'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'ef0c1047-7b96-4322-802d-37446fd8a73f'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2a09c937-ce86-4651-abb6-d8fe81fe36e6'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'f3abde8a-7a0a-4b7f-a60b-30094d77ad15'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '00e94780-d21c-454e-a692-9d7456fc74f4'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '29455c24-1f9a-4e1f-81d2-bf7721fd67c4'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '911b6278-4944-4208-b4c7-32d5a9d5d558'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'b34f0f32-943d-4ed4-b3e3-40a960213585'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2ba43de6-8b4c-40c4-a695-4f746b818bd0'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'c55fbb82-3d36-4501-b335-334336e35204'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'ee4df292-508b-4c27-81e6-e70992133bdb'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '4312c2fc-e34e-4af2-96a4-ee9acb815594'),
(87, 'craft', 'm180321_233505_small_ints', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'f5f4aa0c-821e-4082-a846-9d1052d06a1e'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'e2f14593-a979-4060-ae18-39908f592c20'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'f2fdb583-269d-4496-931b-f84e2172c4c6'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', 'd1c41f76-9e2e-413d-b827-09f74d8bd649'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '22399608-c197-4627-9a82-32d99cc81182'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '2021-11-23 14:07:06', '57e3e363-8529-441a-833d-2f2d7a378f03'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'bb676f1f-6e96-4cd9-8483-fae191f64550'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '06ac65d7-e84e-47a6-8c26-0c4ce66a538f'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'a92bf8b3-be48-4b40-be1d-fb6a98dde280'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '4cde1678-61f7-47af-b278-e1a0bb4744fd'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'aaada065-273c-400b-8998-7c19e708419b'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '9f91078c-02b8-4580-beb1-3e0a6a860ad0'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '54a58ca4-ef72-4dd9-8310-0d009f31040f'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8b607ebb-0933-44cd-869c-ea5b5c03facc'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2a9c7557-c568-4f16-9234-cbc9721785a7'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '23c37da7-3f87-44a9-8550-680004d3712b'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '96b0c1d9-654a-4bea-82a9-3bfb9b35c53e'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'ac540f60-9098-418c-9d8e-967eb6cfbc1e'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '45ec9a80-2bd1-417d-a76c-22e89e98e0bb'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8c8cf4d7-338c-4a9f-a015-99edea588e36'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '6fda0b8f-fab6-4e89-acc7-e31bd473194d'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f92466ea-5127-46c4-a4c8-92b881577a0d'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'c6a47f10-9752-496a-a3d8-d069ecd00099'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '6b4ed504-25a1-4842-80c2-905d61116e90'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '9090d0ec-6636-4f58-885e-16899d07da26'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8cddea83-e8c1-4c84-b280-3797dc24a309'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2c50aa50-2178-4719-b4ac-5005533703b0'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'e47431ad-acff-4a0b-86cf-9cad5020dbee'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '9a80b4b7-d381-463f-b347-9dcf4b5e11c9'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '681b3b77-56c9-4854-b019-d0ddcbffb449'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '67d7cd00-0ba5-441c-ac84-a5d87589a615'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'ea0eb06f-ac88-4473-81d5-825de4c354d6'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8ccccc60-4676-4a44-a58e-c96167110db0'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '6226bb58-29db-44e5-958d-06fbbd908bdb'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'b0e70811-93dc-44c5-a740-bd0a5dea5878'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '76a211fe-7b24-410d-b248-c379d318e49c'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '89ffbe6e-5417-4222-9765-37737422e917'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '1fd14290-21e3-43b0-b9fe-b1cb08fa5fde'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'cb890937-1d95-417a-9ccf-f7234b135dd2'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '9236a136-e09e-4438-8f75-e868ddd8d6d8'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'e6f8539a-c017-4171-bca6-60f468c26b24'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'c1c226fe-a5da-44c7-8fe4-763d2840a0f3'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'fb63bdbc-6fda-4246-ba83-4d7a4903b3e9'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '63f95d11-c781-48b9-b03f-f6cfe5738d7f'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '3bedbf81-52c7-46c0-97aa-ec089b0d0071'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '27869a3a-2b7b-4218-bd2f-83048b1ce151'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'd17add6f-18eb-4aff-bee3-5c341cd0289e'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'af7295ab-8006-4fff-933b-0c6ece8eddef'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'e0866747-f9ee-4589-a6dc-2cb40cb9f482'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '808484b5-22bd-4839-bbf5-7353a9c39ce5'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '6cf8d92c-495e-44b4-a7dc-ae2c6c2ac111'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'c0e45c0d-46f6-49dd-bb66-b61d2e062df3'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '6fdbe4b3-98db-4633-9667-31760d82d426'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '08f58028-99c6-49c2-9ade-d89bf99480ce'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f1c9d566-3b44-43a9-b5dc-7c1d8a5019c0'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'ea747860-9d27-4f2f-a7d3-ef4bd26bad26'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f7ea8f3c-c80a-4284-91ac-b2f68873374c'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '80d9492a-e0dd-4ed1-9902-15c9f761aa3b'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'caca262c-8a1e-43a3-a8ea-0693fce7d870'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '3168672b-5af9-4320-ba1e-05e9290cbec5'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '839f6957-62a3-49ac-a8ae-4fcc411210b5'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8c2b7f66-7ee9-40f0-acf8-d18aedbc7b0f'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'c885d436-5091-44bf-8876-5f24392e49d6'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8ab99fff-6a94-4406-9f5a-9871167393a5'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f82219b3-762c-4023-a415-026981c62637'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'ebefc6db-eedd-4218-b455-ea70cd73ea6c'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'a7101a99-76ad-471b-b55a-255ed1612f0f'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '705aac6c-4df5-4b23-9412-21207e27ca60'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '857580e3-bada-437a-bb9e-b764eb0d041c'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8163dbce-9d0a-441f-8b3a-313c940c3b56'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '4dbe5546-b90c-4ca7-b653-ff470bd5c1a9'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'e1136bdb-2fec-4824-9d8a-5f6c08b400a7'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'c6148397-0c56-4595-9958-83b324a99b60'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '4eb859e8-0fa1-4103-b93b-bc3c95c1fb01'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'd27b7065-76bf-4958-957e-6c1c6abcea80'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '27d8922f-9c36-4b3b-8a8a-566041bad2b8'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '6d47e8d5-2469-4c9a-9863-0d0bc3944507'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '3857f901-7743-4b00-bb0a-24e09416ef2a'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f4507020-2f37-40aa-ad62-f4e9fb08d561'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f9145578-2477-4f45-aa7b-bba0bd995110'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f4b23c09-1ee9-4100-8829-d192f9f509ee'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '0d64e389-945c-42b7-8930-29d66a2b7bb2'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'a50330a6-c67d-4a26-9775-b5e748cfe758'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f3e3b2b8-0bf3-4689-bc1d-61bcd4d474ea'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'b85ed62e-fbbd-487d-b249-f3500a0fbb85'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '20ff8671-6543-4613-b638-060dac233f3e'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '5e532a45-9b75-4253-baf1-1433b079175e'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '7e69fd87-7546-4c21-9d85-fcace4c0c674'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '7e56c013-0bdd-4432-ad44-3673e4313cbf'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '4ba7af3a-083e-4a5a-be48-39b78504f1d7'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '4aca09dd-c118-4c3d-acce-602b8a429b80'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'b8e83896-2f8a-45e5-9b29-9baac5daf5dc'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8c253c74-073f-42b1-bcf3-ce803f6af36d'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '80f6b3cc-fc01-4298-ada1-b2897169a379'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'a0e9496f-7ba6-4670-afd4-29e2a034477b'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '8deb1d63-1d8c-4447-9be8-b6ccf6217f70'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '7c60730e-4309-440c-aa31-0dba6e37840d'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '5bb55529-3e30-477f-91ef-e846e0408ea9'),
(185, 'craft', 'm210331_220322_null_author', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f3b1a6f4-ef0a-4cca-bf72-92c4f21d64a9'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2a7a6a1d-73ea-40d9-b4c6-933f8996d7c7'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '584dbd56-7f01-4c99-bd21-3dfc771aa95e'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '069359b5-de39-46e7-bc28-c979d7420e96'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '65267644-12a4-4072-a620-8ff39a8c18b6'),
(190, 'craft', 'm210613_184103_announcements', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', 'f0647d4b-2bc1-4aaa-a65a-aea71204f046'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '2021-11-23 14:07:07', '089bcabf-dc58-4c25-a975-4e2ec37cacd7'),
(192, 'plugin:super-table', 'Install', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'cbe712ee-4a19-4a8e-a97d-f7fc6be3a82a'),
(193, 'plugin:super-table', 'm180210_000000_migrate_content_tables', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '28a720e6-ee80-4722-9fc8-d03dbbcd5971'),
(194, 'plugin:super-table', 'm180211_000000_type_columns', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'a025c5be-1ea1-4b7a-8ae6-e4b26e347ac2'),
(195, 'plugin:super-table', 'm180219_000000_sites', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'd53f499f-4f98-4aee-8df9-9fd04ce3aaa0'),
(196, 'plugin:super-table', 'm180220_000000_fix_context', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'bc157732-942c-4ad9-a174-9d23f2d22220'),
(197, 'plugin:super-table', 'm190117_000000_soft_deletes', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'ee7b860a-ce4d-4801-8cba-5eba52d569f0'),
(198, 'plugin:super-table', 'm190117_000001_context_to_uids', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '0f3123df-6fec-446e-84e0-b1dc096bc774'),
(199, 'plugin:super-table', 'm190120_000000_fix_supertablecontent_tables', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'fa077108-6176-4bcd-bef3-e13395b3879c'),
(200, 'plugin:super-table', 'm190131_000000_fix_supertable_missing_fields', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'e02ab6e2-8742-4980-9b75-e31bce0c98df'),
(201, 'plugin:super-table', 'm190227_100000_fix_project_config', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '390ee44e-866e-4773-8122-bf73420944b9'),
(202, 'plugin:super-table', 'm190511_100000_fix_project_config', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'c410e5ae-fd73-481f-9a78-c8a999ba61c7'),
(203, 'plugin:super-table', 'm190520_000000_fix_project_config', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '1e537097-4415-42ca-89b6-fb152a42fbe6'),
(204, 'plugin:super-table', 'm190714_000000_propagation_method', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '5726ddd8-3353-4045-b661-c8407f60ded9'),
(205, 'plugin:super-table', 'm191127_000000_fix_width', '2021-11-23 14:17:10', '2021-11-23 14:17:10', '2021-11-23 14:17:10', 'fcd8dd44-d099-4710-877b-678d5b262c98'),
(206, 'plugin:aws-s3', 'Install', '2021-11-23 14:17:26', '2021-11-23 14:17:26', '2021-11-23 14:17:26', '2ffb8d21-9a40-4503-9967-667073d87d5e'),
(207, 'plugin:aws-s3', 'm180929_165000_remove_storageclass_setting', '2021-11-23 14:17:26', '2021-11-23 14:17:26', '2021-11-23 14:17:26', '1689b64a-551c-4066-81f7-e50268a359c4'),
(208, 'plugin:aws-s3', 'm190131_214300_cleanup_config', '2021-11-23 14:17:26', '2021-11-23 14:17:26', '2021-11-23 14:17:26', 'ce71f364-c0cb-40f4-9d1b-16300d08258e'),
(209, 'plugin:aws-s3', 'm190305_133000_cleanup_expires_config', '2021-11-23 14:17:26', '2021-11-23 14:17:26', '2021-11-23 14:17:26', 'bed1a4f1-4a07-405f-a544-a625b583fb0d'),
(210, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2021-11-23 14:18:25', '2021-11-23 14:18:25', '2021-11-23 14:18:25', '47a0f254-5830-4edd-8194-d37b3167bcc3'),
(211, 'plugin:redactor', 'Install', '2021-11-23 14:18:25', '2021-11-23 14:18:25', '2021-11-23 14:18:25', 'fb30254c-93c7-4f4d-a8e5-0e583064dcad'),
(212, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2021-11-23 14:18:25', '2021-11-23 14:18:25', '2021-11-23 14:18:25', 'f6451b6d-146d-4bad-882f-bf1f6d869d9a'),
(213, 'plugin:seo', 'Install', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '2021-11-23 14:19:14', 'cec3fc3a-b993-43ff-bff0-b39b984ee723'),
(214, 'plugin:seo', 'm180906_152947_add_site_id_to_redirects', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '5289d5fb-226a-47ad-bcbf-b3a7f220360d'),
(215, 'plugin:seo', 'm190114_152300_upgrade_to_new_data_format', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '20bb7def-d1a4-4a7f-a888-59b893debd5c'),
(216, 'plugin:seo', 'm200518_110721_add_order_to_redirects', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '499d81e4-c87f-4b23-8d4c-3274e70c97fc'),
(217, 'plugin:seo', 'm201207_124200_add_product_types_to_sitemap', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '2021-11-23 14:19:14', '04841450-626e-4cde-8595-a87f6396326b'),
(218, 'craft', 'm220209_095604_add_indexes', '2022-03-07 10:00:51', '2022-03-07 10:00:51', '2022-03-07 10:00:51', '67a1961f-a3f5-4c96-bc71-884fe421e688'),
(219, 'craft', 'm220214_000000_truncate_sessions', '2022-03-07 10:00:51', '2022-03-07 10:00:51', '2022-03-07 10:00:51', 'b2b59684-78f9-433d-b40b-251438ed13b4'),
(220, 'plugin:navigation', 'Install', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'f8267021-25af-4678-b805-365f13529ce4'),
(221, 'plugin:navigation', 'm180826_000000_propagate_nav_setting', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '7a96fb42-5513-4a4c-b463-766064a6a0bd'),
(222, 'plugin:navigation', 'm180827_000000_propagate_nav_setting_additional', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'a17db1cd-9889-47c0-9242-a0ea9583f771'),
(223, 'plugin:navigation', 'm181110_000000_add_elementSiteId', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '07e334df-705b-4691-86f1-26bc273c8d53'),
(224, 'plugin:navigation', 'm181123_000000_populate_elementSiteIds', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '531ef222-eaec-4199-863b-0a0b316b6a29'),
(225, 'plugin:navigation', 'm190203_000000_add_instructions', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'b48b7f86-4235-4588-ac57-186b8ce072ae'),
(226, 'plugin:navigation', 'm190209_000000_project_config', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'b610fdda-672e-4bdc-83e6-aa7b94dbf402'),
(227, 'plugin:navigation', 'm190223_000000_permissions', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '3f5d5739-51f2-4e63-98b5-a8242f58686b'),
(228, 'plugin:navigation', 'm190307_000000_update_field_content', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '982fc242-0034-498d-9262-982e844ea951'),
(229, 'plugin:navigation', 'm190310_000000_migrate_elementSiteId', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '87d27f16-e5cc-4c2f-a563-35a93ae24928'),
(230, 'plugin:navigation', 'm190314_000000_soft_deletes', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '189d0b22-45d9-442c-9329-96c03a23e6d0'),
(231, 'plugin:navigation', 'm190315_000000_project_config', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '7f2122cb-bafa-4193-8cd9-f1556dae2960'),
(232, 'plugin:navigation', 'm191127_000000_fix_nav_handle', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '293070aa-c97b-4ef4-958c-f1c0d8127906'),
(233, 'plugin:navigation', 'm191230_102505_add_fieldLayoutId', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '3593f348-7a99-445d-a82d-09945ffe65fd'),
(234, 'plugin:navigation', 'm200108_000000_add_attributes', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '605a37e7-eaa1-4dc1-9c80-a00980b9570e'),
(235, 'plugin:navigation', 'm200108_100000_add_url_suffix', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'a7fad41c-79c8-4ebc-896a-34de4c221b00'),
(236, 'plugin:navigation', 'm200108_200000_add_max_nodes', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'e2aa1fda-86c7-4174-9e8a-7473d87f2042'),
(237, 'plugin:navigation', 'm200205_000000_add_data', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '3bcc549f-781a-44de-ad6e-30b09042072d'),
(238, 'plugin:navigation', 'm200810_000000_fix_elementsiteid', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '9cfda5b0-41d2-461b-8d1d-23ba9d462946'),
(239, 'plugin:navigation', 'm200811_000000_fix_uris', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'acb5647f-b6b5-4e35-b7e1-d6db745255da'),
(240, 'plugin:navigation', 'm201017_000000_add_permissions', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '6b20a653-93b5-4180-bcda-dcbf65cc0aa2'),
(241, 'plugin:navigation', 'm201018_000000_site_settings', '2022-04-06 08:17:44', '2022-04-06 08:17:44', '2022-04-06 08:17:44', 'fd10ebc3-a7de-476e-b8ad-74e1fad22100');

INSERT INTO `craft_navigation_navs` (`id`, `structureId`, `name`, `handle`, `instructions`, `sortOrder`, `propagateNodes`, `maxNodes`, `permissions`, `siteSettings`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 2, 'Primary Navigation', 'primaryNavigation', '', 1, 0, NULL, '{\"craft\\\\elements\\\\Asset\":{\"enabled\":\"\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Category\":{\"enabled\":\"\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Entry\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Tag\":{\"enabled\":\"\",\"permissions\":\"*\"},\"custom\":{\"enabled\":\"1\"},\"verbb\\\\navigation\\\\nodetypes\\\\PassiveType\":{\"enabled\":\"\"}}', '{\"d6d70c7a-a269-4189-b17f-d94d3f2d788c\":null}', NULL, '2022-04-06 08:18:34', '2022-04-06 08:18:34', NULL, '0dee448f-00ea-4e52-bc59-ec307d4c6b7f');

INSERT INTO `craft_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'expanded-singles', '1.2.0', '1.0.0', 'unknown', NULL, '2021-11-23 14:16:26', '2021-11-23 14:16:26', '2022-04-06 08:17:45', 'cc808836-65c6-4232-9e7d-42797e6d94c2'),
(2, 'super-table', '2.7.1', '2.2.1', 'unknown', NULL, '2021-11-23 14:17:09', '2021-11-23 14:17:09', '2022-04-06 08:17:45', '0f4a3c2f-9115-41ae-9179-966a2dca0085'),
(3, 'aws-s3', '1.3.0', '1.2', 'unknown', NULL, '2021-11-23 14:17:26', '2021-11-23 14:17:26', '2022-04-06 08:17:45', '210fbf57-ccf3-4d88-becf-e9fd4b6cf6df'),
(4, 'redactor', '2.10.5', '2.3.0', 'unknown', NULL, '2021-11-23 14:18:25', '2021-11-23 14:18:25', '2022-04-06 08:17:45', '13596a28-d8b2-4010-9f59-7bf55c729e93'),
(5, 'seo', '3.7.4', '3.2.0', 'unknown', NULL, '2021-11-23 14:19:14', '2021-11-23 14:19:14', '2022-04-06 08:17:45', '3f82d331-ce19-4206-9ef7-74d737f38c86'),
(7, 'typedlinkfield', '1.0.25', '1.0.0', 'unknown', NULL, '2021-11-23 16:00:08', '2021-11-23 16:00:08', '2022-04-06 08:17:45', '07d1ce78-3492-4472-91cc-17c955b3d439'),
(8, 'image-optimization', 'v1.1.7', '1.0.0', 'unknown', NULL, '2021-11-23 16:08:48', '2021-11-23 16:08:48', '2022-04-06 08:17:45', '324f210b-f1e9-4690-baf1-7c21fdaf0611'),
(9, 'dashboard-begone', '1.0.1', '1.0.0', 'unknown', NULL, '2021-11-23 16:36:22', '2021-11-23 16:36:22', '2022-04-06 08:17:45', '9bea1dba-79cc-4d38-a479-c3915a4cdb6f'),
(11, 'faker', '1.0.8', '1.0.0', 'unknown', NULL, '2022-03-07 10:13:25', '2022-03-07 10:13:25', '2022-04-06 08:17:45', 'b490a39a-0499-4ff5-a9b7-8e414fbb11d7'),
(12, 'atom', '1.0.4', '1.0.0', 'unknown', NULL, '2022-03-18 12:57:57', '2022-03-18 12:57:57', '2022-04-06 08:17:45', '894b61d6-175f-4547-b987-05e3f1a2eca7'),
(14, 'navigation', '1.4.25', '1.0.21', 'trial', NULL, '2022-04-06 08:17:43', '2022-04-06 08:17:43', '2022-04-06 08:17:45', '8af752cf-a933-4be8-8076-6ed02bab4f7f');

INSERT INTO `craft_projectconfig` (`path`, `value`) VALUES
('dateModified', '1649233114'),
('email.fromEmail', '\"$MAIL_FROM_EMAIL\"'),
('email.fromName', '\"$MAIL_FROM_NAME\"'),
('email.replyToEmail', '\"$MAIL_FROM_EMAIL\"'),
('email.template', 'null'),
('email.transportSettings.encryptionMethod', '\"$MAIL_PROTOCOL\"'),
('email.transportSettings.host', '\"$MAIL_HOST\"'),
('email.transportSettings.password', '\"$MAIL_PASSWORD\"'),
('email.transportSettings.port', '\"$MAIL_PORT\"'),
('email.transportSettings.timeout', '\"10\"'),
('email.transportSettings.useAuthentication', '\"$MAIL_AUTH\"'),
('email.transportSettings.username', '\"$MAIL_USERNAME\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Smtp\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.class', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.disabled', 'false'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.id', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.instructions', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.label', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.max', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.min', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.name', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.orientation', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.readonly', 'false'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.requirable', 'false'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.size', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.step', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.tip', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.title', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.warning', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.0.width', '100'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.fieldUid', '\"a9ed9ec2-c297-4bfd-8361-a5385e2139ea\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.instructions', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.label', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.required', 'false'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.tip', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.warning', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.elements.1.width', '100'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.name', '\"Content\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.fieldLayouts.63545446-0a5e-41df-8a37-c9a5a16d70ae.tabs.0.sortOrder', '1'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.handle', '\"default\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.hasTitleField', 'true'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.name', '\"Default\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.section', '\"dbc4c592-afdb-4421-a3b5-6bebedd21c1c\"'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.sortOrder', '1'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.titleFormat', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.titleTranslationKeyFormat', 'null'),
('entryTypes.107b376a-da5e-45ed-ab87-8a1f88124d69.titleTranslationMethod', '\"site\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.class', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.disabled', 'false'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.id', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.instructions', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.label', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.max', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.min', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.name', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.orientation', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.readonly', 'false'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.requirable', 'false'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.size', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.step', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.tip', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.title', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.warning', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.0.width', '100'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.fieldUid', '\"64286a3d-abda-4015-acb6-fdd84a52c3e7\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.instructions', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.label', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.required', 'false'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.tip', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.warning', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.elements.1.width', '100'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.name', '\"Content\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.0.sortOrder', '1'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.fieldUid', '\"2a0571e3-8ecb-46fc-86f1-667fab82405c\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.instructions', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.label', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.required', 'false'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.tip', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.warning', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.elements.0.width', '100'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.name', '\"SEO\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.fieldLayouts.cbff9951-c82a-45da-b506-12d80fd9bdc2.tabs.1.sortOrder', '2'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.handle', '\"homepage\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.hasTitleField', 'false'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.name', '\"Homepage\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.section', '\"22879b2d-c513-40dc-86a1-da6c5c5901eb\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.sortOrder', '1'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.titleTranslationKeyFormat', 'null'),
('entryTypes.c4834d8d-2e08-4de5-8b12-00a1277c2d2b.titleTranslationMethod', '\"site\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.class', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.disabled', 'false'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.id', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.instructions', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.label', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.max', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.min', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.name', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.orientation', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.readonly', 'false'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.requirable', 'false'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.size', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.step', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.tip', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.title', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.warning', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.0.width', '100'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.fieldUid', '\"64286a3d-abda-4015-acb6-fdd84a52c3e7\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.instructions', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.label', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.required', 'false'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.tip', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.warning', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.elements.1.width', '100'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.name', '\"Content\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.0.sortOrder', '1'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.fieldUid', '\"2a0571e3-8ecb-46fc-86f1-667fab82405c\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.instructions', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.label', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.required', 'false'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.tip', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.warning', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.elements.0.width', '100'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.name', '\"SEO\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.fieldLayouts.e8cecc7d-f597-4170-8b0f-381037a125d0.tabs.1.sortOrder', '2'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.handle', '\"default\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.hasTitleField', 'true'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.name', '\"Default\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.section', '\"9df1c3f9-df7c-4f21-a8e9-c034cf195242\"'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.sortOrder', '1'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.titleFormat', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.titleTranslationKeyFormat', 'null'),
('entryTypes.e68e9282-5576-414b-97db-5af34362b556.titleTranslationMethod', '\"site\"'),
('fieldGroups.1e6503ce-1874-499c-ac7a-3b92d3d0292a.name', '\"Common\"'),
('fieldGroups.f64d0b4c-fb82-4b48-8b94-1153cc2c830c.name', '\"Globals\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.columnSuffix', 'null'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.contentColumnType', '\"string\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.fieldGroup', '\"f64d0b4c-fb82-4b48-8b94-1153cc2c830c\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.handle', '\"linkInBioLinks\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.instructions', '\"\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.name', '\"Link-in-bio Links\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.searchable', 'false'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.columns.__assoc__.0.0', '\"3c19a2ac-4d02-4ee6-97d3-88b395a9d8e8\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.columns.__assoc__.0.1.__assoc__.0.0', '\"width\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.columns.__assoc__.0.1.__assoc__.0.1', '\"\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.contentTable', '\"{{%stc_linkinbiolinks}}\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.fieldLayout', '\"row\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.maxRows', '\"\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.minRows', '\"\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.placeholderKey', 'null'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.propagationMethod', '\"all\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.selectionLabel', '\"Add a link\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.settings.staticField', '\"\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.translationKeyFormat', 'null'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.translationMethod', '\"site\"'),
('fields.0ec43b96-234e-442e-94d0-c51b18893a12.type', '\"verbb\\\\supertable\\\\fields\\\\SuperTableField\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.columnSuffix', '\"yoqcokck\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.contentColumnType', '\"text\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.fieldGroup', '\"1e6503ce-1874-499c-ac7a-3b92d3d0292a\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.handle', '\"seo\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.instructions', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.name', '\"SEO\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.searchable', 'false'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.description', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.hideSocial', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.robots.0', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.robots.1', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.robots.2', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.robots.3', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.robots.4', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.robots.5', '\"\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.socialImage', 'null'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.suffixAsPrefix', 'null'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.0.__assoc__.0.0', '\"key\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.0.__assoc__.0.1', '\"1\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.0.__assoc__.1.0', '\"locked\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.0.__assoc__.1.1', '\"0\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.0.__assoc__.2.0', '\"template\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.0.__assoc__.2.1', '\"{title}\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.1.__assoc__.0.0', '\"key\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.1.__assoc__.0.1', '\"2\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.1.__assoc__.1.0', '\"locked\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.1.__assoc__.1.1', '\"1\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.1.__assoc__.2.0', '\"template\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.title.1.__assoc__.2.1', '\" - {{ siteName }}\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.settings.titleSuffix', 'null'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.translationKeyFormat', 'null'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.translationMethod', '\"none\"'),
('fields.2a0571e3-8ecb-46fc-86f1-667fab82405c.type', '\"ether\\\\seo\\\\fields\\\\SeoField\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.columnSuffix', 'null'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.contentColumnType', '\"string\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.fieldGroup', '\"1e6503ce-1874-499c-ac7a-3b92d3d0292a\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.handle', '\"contentBlocks\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.instructions', '\"\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.name', '\"Content Blocks\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.searchable', 'false'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.settings.contentTable', '\"{{%matrixcontent_contentblocks}}\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.settings.maxBlocks', '\"\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.settings.minBlocks', '\"\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.settings.propagationKeyFormat', 'null'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.settings.propagationMethod', '\"all\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.translationKeyFormat', 'null'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.translationMethod', '\"site\"'),
('fields.64286a3d-abda-4015-acb6-fdd84a52c3e7.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.columnSuffix', 'null'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.contentColumnType', '\"string\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.fieldGroup', '\"1e6503ce-1874-499c-ac7a-3b92d3d0292a\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.handle', '\"buttons\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.instructions', '\"\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.name', '\"Buttons\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.searchable', 'false'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.columns.__assoc__.0.0', '\"941b54ca-fa78-4aba-a0e7-c8ea0b9ee389\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.columns.__assoc__.0.1.__assoc__.0.0', '\"width\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.columns.__assoc__.0.1.__assoc__.0.1', '\"\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.contentTable', '\"{{%stc_buttons}}\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.fieldLayout', '\"row\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.maxRows', '\"\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.minRows', '\"\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.placeholderKey', 'null'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.propagationMethod', '\"all\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.selectionLabel', '\"Add a button\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.settings.staticField', '\"\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.translationKeyFormat', 'null'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.translationMethod', '\"site\"'),
('fields.a9ed9ec2-c297-4bfd-8361-a5385e2139ea.type', '\"verbb\\\\supertable\\\\fields\\\\SuperTableField\"'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.fieldUid', '\"0ec43b96-234e-442e-94d0-c51b18893a12\"'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.instructions', 'null'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.label', 'null'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.required', 'false'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.tip', 'null'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.warning', 'null'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.elements.0.width', '100'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.name', '\"Links\"'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.fieldLayouts.7fb7112f-7779-45d1-8a9f-8f99bd80b8ab.tabs.0.sortOrder', '1'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.handle', '\"linkInBio\"'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.name', '\"Link in bio\"'),
('globalSets.e84f44c6-9fc5-4991-aa41-ac87821084e0.sortOrder', '1'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.field', '\"64286a3d-abda-4015-acb6-fdd84a52c3e7\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.fieldUid', '\"116e4376-8da0-4496-9c87-73c2945e25a9\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fieldLayouts.f77b6b6e-7381-493f-9bb0-81c2f4e5b935.tabs.0.sortOrder', '1'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.columnSuffix', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.contentColumnType', '\"text\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.fieldGroup', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.handle', '\"anchor\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.instructions', '\"Cannot include spaces or special characters.\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.name', '\"Anchor\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.searchable', 'false'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.byteLimit', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.charLimit', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.code', '\"\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.columnType', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.initialRows', '\"4\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.multiline', '\"\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.placeholder', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.translationKeyFormat', 'null'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.translationMethod', '\"none\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.fields.116e4376-8da0-4496-9c87-73c2945e25a9.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.handle', '\"anchor\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.name', '\"Anchor\"'),
('matrixBlockTypes.62ede65a-7718-438f-8379-f63eebc5c864.sortOrder', '2'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.field', '\"64286a3d-abda-4015-acb6-fdd84a52c3e7\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.fieldUid', '\"6a4b9a4b-2826-4e8a-a241-207b54505996\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.fieldUid', '\"8d283175-641b-464a-ae68-7d0513252808\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fieldLayouts.97725b87-36f1-4737-9c0b-f0c5dfc22b58.tabs.0.sortOrder', '1'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.columnSuffix', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.contentColumnType', '\"text\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.fieldGroup', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.handle', '\"headline\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.instructions', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.name', '\"Headline\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.searchable', 'false'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.byteLimit', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.charLimit', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.code', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.columnType', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.initialRows', '\"4\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.multiline', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.placeholder', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.translationKeyFormat', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.translationMethod', '\"none\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.6a4b9a4b-2826-4e8a-a241-207b54505996.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.columnSuffix', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.contentColumnType', '\"text\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.fieldGroup', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.handle', '\"copy\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.instructions', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.name', '\"Copy\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.searchable', 'false'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.availableTransforms', '\"*\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.availableVolumes', '\"*\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.cleanupHtml', 'true'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.columnType', '\"text\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.configSelectionMode', '\"choose\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.defaultTransform', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.manualConfig', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.purifierConfig', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.purifyHtml', '\"1\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.redactorConfig', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.removeEmptyTags', '\"1\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.removeInlineStyles', '\"1\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.removeNbsp', '\"1\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.showHtmlButtonForNonAdmins', '\"\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.settings.uiMode', '\"enlarged\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.translationKeyFormat', 'null'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.translationMethod', '\"none\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.fields.8d283175-641b-464a-ae68-7d0513252808.type', '\"craft\\\\redactor\\\\Field\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.handle', '\"text\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.name', '\"Text\"'),
('matrixBlockTypes.f3b895ab-1000-4c04-b882-109ea8a06527.sortOrder', '1'),
('meta.__names__.0dee448f-00ea-4e52-bc59-ec307d4c6b7f', '\"Primary Navigation\"'),
('meta.__names__.0ec43b96-234e-442e-94d0-c51b18893a12', '\"Link-in-bio Links\"'),
('meta.__names__.107b376a-da5e-45ed-ab87-8a1f88124d69', '\"Default\"'),
('meta.__names__.116e4376-8da0-4496-9c87-73c2945e25a9', '\"Anchor\"'),
('meta.__names__.1e6503ce-1874-499c-ac7a-3b92d3d0292a', '\"Common\"'),
('meta.__names__.22879b2d-c513-40dc-86a1-da6c5c5901eb', '\"Homepage\"'),
('meta.__names__.2a0571e3-8ecb-46fc-86f1-667fab82405c', '\"SEO\"'),
('meta.__names__.62ede65a-7718-438f-8379-f63eebc5c864', '\"Anchor\"'),
('meta.__names__.64286a3d-abda-4015-acb6-fdd84a52c3e7', '\"Content Blocks\"'),
('meta.__names__.6a4b9a4b-2826-4e8a-a241-207b54505996', '\"Headline\"'),
('meta.__names__.8d283175-641b-464a-ae68-7d0513252808', '\"Copy\"'),
('meta.__names__.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389', '\"Button\"'),
('meta.__names__.9df1c3f9-df7c-4f21-a8e9-c034cf195242', '\"Pages\"'),
('meta.__names__.a9ed9ec2-c297-4bfd-8361-a5385e2139ea', '\"Buttons\"'),
('meta.__names__.adc3ce14-b18c-4644-b669-727364548afd', '\"$SITE_NAME\"'),
('meta.__names__.c4834d8d-2e08-4de5-8b12-00a1277c2d2b', '\"Homepage\"'),
('meta.__names__.cd32edba-450b-4dc8-b0f0-298d905efc13', '\"Link\"'),
('meta.__names__.d16c11fe-e37d-4ac7-a989-1a53c3782161', '\"Cloud Files\"'),
('meta.__names__.d6d70c7a-a269-4189-b17f-d94d3f2d788c', '\"$SITE_NAME\"'),
('meta.__names__.dbc4c592-afdb-4421-a3b5-6bebedd21c1c', '\"Call To Actions\"'),
('meta.__names__.e68e9282-5576-414b-97db-5af34362b556', '\"Default\"'),
('meta.__names__.e84f44c6-9fc5-4991-aa41-ac87821084e0', '\"Link in bio\"'),
('meta.__names__.f3b895ab-1000-4c04-b882-109ea8a06527', '\"Text\"'),
('meta.__names__.f64d0b4c-fb82-4b48-8b94-1153cc2c830c', '\"Globals\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.handle', '\"primaryNavigation\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.instructions', '\"\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.maxNodes', '\"\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.name', '\"Primary Navigation\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Asset.enabled', '\"\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Asset.permissions', '\"*\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Category.enabled', '\"\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Category.permissions', '\"*\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Entry.enabled', '\"1\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Entry.permissions', '\"*\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Tag.enabled', '\"\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.craft\\elements\\Tag.permissions', '\"*\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.custom.enabled', '\"1\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.permissions.verbb\\navigation\\nodetypes\\PassiveType.enabled', '\"\"'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.propagateNodes', 'false'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c', 'null'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.sortOrder', '1'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.structure.maxLevels', 'null'),
('navigation.navs.0dee448f-00ea-4e52-bc59-ec307d4c6b7f.structure.uid', '\"444ffbe9-db5f-4a42-ac13-df531f7679c0\"'),
('plugins.atom.edition', '\"standard\"'),
('plugins.atom.enabled', 'true'),
('plugins.atom.schemaVersion', '\"1.0.0\"'),
('plugins.aws-s3.edition', '\"standard\"'),
('plugins.aws-s3.enabled', 'true'),
('plugins.aws-s3.schemaVersion', '\"1.2\"'),
('plugins.dashboard-begone.edition', '\"standard\"'),
('plugins.dashboard-begone.enabled', 'true'),
('plugins.dashboard-begone.schemaVersion', '\"1.0.0\"'),
('plugins.expanded-singles.edition', '\"standard\"'),
('plugins.expanded-singles.enabled', 'true'),
('plugins.expanded-singles.schemaVersion', '\"1.0.0\"'),
('plugins.faker.edition', '\"standard\"'),
('plugins.faker.enabled', 'true'),
('plugins.faker.schemaVersion', '\"1.0.0\"'),
('plugins.faker.settings.source', '\"$FAKER_IMG_SRC\"'),
('plugins.image-optimization.edition', '\"standard\"'),
('plugins.image-optimization.enabled', 'true'),
('plugins.image-optimization.schemaVersion', '\"1.0.0\"'),
('plugins.navigation.edition', '\"standard\"'),
('plugins.navigation.enabled', 'true'),
('plugins.navigation.licenseKey', '\"D1VR833TXDARXVIH79IACE5D\"'),
('plugins.navigation.schemaVersion', '\"1.0.21\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('plugins.seo.edition', '\"standard\"'),
('plugins.seo.enabled', 'true'),
('plugins.seo.schemaVersion', '\"3.2.0\"'),
('plugins.super-table.edition', '\"standard\"'),
('plugins.super-table.enabled', 'true'),
('plugins.super-table.schemaVersion', '\"2.2.1\"'),
('plugins.typedlinkfield.edition', '\"standard\"'),
('plugins.typedlinkfield.enabled', 'true'),
('plugins.typedlinkfield.schemaVersion', '\"1.0.0\"'),
('routes.f508aa98-7b11-47ee-a13e-2b7abd2ee250.siteUid', 'null'),
('routes.f508aa98-7b11-47ee-a13e-2b7abd2ee250.sortOrder', '1'),
('routes.f508aa98-7b11-47ee-a13e-2b7abd2ee250.template', '\"pages/bio\"'),
('routes.f508aa98-7b11-47ee-a13e-2b7abd2ee250.uriParts.0', '\"bio\"'),
('routes.f508aa98-7b11-47ee-a13e-2b7abd2ee250.uriPattern', '\"bio\"'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.defaultPlacement', '\"end\"'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.enableVersioning', 'true'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.handle', '\"homepage\"'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.name', '\"Homepage\"'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.propagationMethod', '\"all\"'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.enabledByDefault', 'true'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.hasUrls', 'true'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.template', '\"pages/default\"'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.uriFormat', '\"__home__\"'),
('sections.22879b2d-c513-40dc-86a1-da6c5c5901eb.type', '\"single\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.defaultPlacement', '\"end\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.enableVersioning', 'true'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.handle', '\"pages\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.name', '\"Pages\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.propagationMethod', '\"all\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.enabledByDefault', 'true'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.hasUrls', 'true'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.template', '\"pages/default\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.uriFormat', '\"{parent.uri}/{slug}\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.structure.maxLevels', 'null'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.structure.uid', '\"303398b9-0009-46b9-8079-398e4417bb40\"'),
('sections.9df1c3f9-df7c-4f21-a8e9-c034cf195242.type', '\"structure\"'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.defaultPlacement', '\"end\"'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.enableVersioning', 'true'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.handle', '\"callToActions\"'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.name', '\"Call To Actions\"'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.propagationMethod', '\"all\"'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.enabledByDefault', 'true'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.hasUrls', 'false'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.template', 'null'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.siteSettings.d6d70c7a-a269-4189-b17f-d94d3f2d788c.uriFormat', 'null'),
('sections.dbc4c592-afdb-4421-a3b5-6bebedd21c1c.type', '\"channel\"'),
('siteGroups.adc3ce14-b18c-4644-b669-727364548afd.name', '\"$SITE_NAME\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.baseUrl', '\"$SITE_URL\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.enabled', 'true'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.handle', '\"default\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.hasUrls', 'true'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.language', '\"en-GB\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.name', '\"$SITE_NAME\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.primary', 'true'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.siteGroup', '\"adc3ce14-b18c-4644-b669-727364548afd\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.sortOrder', '1'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.field', '\"a9ed9ec2-c297-4bfd-8361-a5385e2139ea\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.fieldUid', '\"941b54ca-fa78-4aba-a0e7-c8ea0b9ee389\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.instructions', 'null'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.label', 'null'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.required', 'false'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.tip', 'null'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.warning', 'null'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.elements.0.width', '100'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.name', '\"Content\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fieldLayouts.a76d2da8-34da-47fa-809f-ac71e1d195e6.tabs.0.sortOrder', '1'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.columnSuffix', 'null'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.contentColumnType', '\"text\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.fieldGroup', 'null'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.handle', '\"button\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.instructions', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.name', '\"Button\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.searchable', 'false');

INSERT INTO `craft_projectconfig` (`path`, `value`) VALUES
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.allowCustomText', '\"1\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.allowedLinkNames.3', '\"entry\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.allowedLinkNames.6', '\"custom\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.allowedLinkNames.7', '\"email\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.allowedLinkNames.8', '\"tel\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.allowedLinkNames.9', '\"url\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.allowTarget', '\"1\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.autoNoReferrer', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.defaultLinkName', '\"asset\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.defaultText', '\"Learn more\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.enableAriaLabel', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.enableTitle', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.0.0', '\"asset\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.0.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.0.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.0.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.0.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.1.0', '\"category\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.1.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.1.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.1.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.1.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.2.0', '\"entry\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.2.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.2.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.2.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.2.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.3.0', '\"site\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.3.1.__assoc__.0.0', '\"sites\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.3.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.4.0', '\"user\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.4.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.4.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.4.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.4.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.5.0', '\"custom\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.5.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.5.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.5.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.5.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.6.0', '\"email\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.6.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.6.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.6.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.6.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.7.0', '\"tel\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.7.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.7.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.7.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.7.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.8.0', '\"url\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.8.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.8.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.8.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.settings.typeSettings.__assoc__.8.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.translationKeyFormat', 'null'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.translationMethod', '\"none\"'),
('superTableBlockTypes.10b6675b-2ddd-41ec-96a5-1b2156bac2e6.fields.941b54ca-fa78-4aba-a0e7-c8ea0b9ee389.type', '\"typedlinkfield\\\\fields\\\\LinkField\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.field', '\"0ec43b96-234e-442e-94d0-c51b18893a12\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.fieldUid', '\"cd32edba-450b-4dc8-b0f0-298d905efc13\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.instructions', 'null'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.label', 'null'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.required', 'false'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.tip', 'null'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.warning', 'null'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.elements.0.width', '100'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.name', '\"Content\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fieldLayouts.05cee47c-00a1-478b-b4ab-ba047b77feaa.tabs.0.sortOrder', '1'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.columnSuffix', '\"ejwczycw\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.contentColumnType', '\"text\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.fieldGroup', 'null'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.handle', '\"bioLink\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.instructions', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.name', '\"Link\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.searchable', 'false'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowCustomText', '\"1\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowedLinkNames.1', '\"asset\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowedLinkNames.2', '\"category\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowedLinkNames.3', '\"entry\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowedLinkNames.6', '\"custom\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowedLinkNames.7', '\"email\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowedLinkNames.8', '\"tel\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowedLinkNames.9', '\"url\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.allowTarget', '\"1\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.autoNoReferrer', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.defaultLinkName', '\"url\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.defaultText', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.enableAriaLabel', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.enableTitle', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.0.0', '\"asset\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.0.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.0.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.0.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.0.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.1.0', '\"category\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.1.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.1.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.1.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.1.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.2.0', '\"entry\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.2.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.2.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.2.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.2.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.3.0', '\"site\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.3.1.__assoc__.0.0', '\"sites\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.3.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.4.0', '\"user\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.4.1.__assoc__.0.0', '\"sources\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.4.1.__assoc__.0.1', '\"*\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.4.1.__assoc__.1.0', '\"allowCustomQuery\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.4.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.5.0', '\"custom\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.5.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.5.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.5.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.5.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.6.0', '\"email\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.6.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.6.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.6.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.6.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.7.0', '\"tel\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.7.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.7.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.7.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.7.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.8.0', '\"url\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.8.1.__assoc__.0.0', '\"disableValidation\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.8.1.__assoc__.0.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.8.1.__assoc__.1.0', '\"allowAliases\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.settings.typeSettings.__assoc__.8.1.__assoc__.1.1', '\"\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.translationKeyFormat', 'null'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.translationMethod', '\"none\"'),
('superTableBlockTypes.1438c97e-4d71-4e53-b9b8-dca088f1f818.fields.cd32edba-450b-4dc8-b0f0-298d905efc13.type', '\"typedlinkfield\\\\fields\\\\LinkField\"'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"$SITE_NAME\"'),
('system.retryDuration', 'null'),
('system.schemaVersion', '\"3.7.33\"'),
('system.timeZone', '\"Europe/London\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.autocomplete', 'false'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.autocorrect', 'true'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.class', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.disabled', 'false'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.id', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.instructions', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.label', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.max', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.min', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.name', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.orientation', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.placeholder', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.readonly', 'false'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.requirable', 'false'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.size', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.step', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.tip', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.title', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.warning', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.elements.0.width', '100'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.name', '\"Content\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.fieldLayouts.5d8d99f5-8168-492c-b05d-95964f303475.tabs.0.sortOrder', '1'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.handle', '\"cloudFiles\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.hasUrls', 'true'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.name', '\"Cloud Files\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.addSubfolderToRootUrl', '\"1\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.autoFocalPoint', '\"\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.bucket', '\"$AWS_BUCKET\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.bucketSelectionMode', '\"manual\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.cfDistributionId', '\"$AWS_CLOUDFRONT_ID\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.cfPrefix', '\"$AWS_CLOUDFRONT_PREFIX\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.expires', '\"\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.keyId', '\"$AWS_ACCESS_KEY_ID\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.makeUploadsPublic', '\"\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.region', '\"$AWS_REGION\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.secret', '\"$AWS_SECRET_ACCESS_KEY\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.storageClass', '\"\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.settings.subfolder', '\"\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.sortOrder', '1'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.titleTranslationKeyFormat', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.titleTranslationMethod', 'null'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.type', '\"craft\\\\awss3\\\\Volume\"'),
('volumes.d16c11fe-e37d-4ac7-a989-1a53c3782161.url', '\"$AWS_CLOUDFRONT_URL\"');

INSERT INTO `craft_resourcepaths` (`hash`, `path`) VALUES
('1083ddca', '@lib/d3'),
('115f42a8', '@app/web/assets/utilities/dist'),
('124fd536', '@craft/web/assets/elementresizedetector/dist'),
('15ac87b7', '@app/web/assets/editentry/dist'),
('1745f04e', '@craft/web/assets/axios/dist'),
('17afcade', '@bower/jquery/dist'),
('1982c159', '@lib/jquery-touch-events'),
('19d38ea', '@app/web/assets/velocity/dist'),
('1a8ea583', '@app/web/assets/matrix/dist'),
('1b04cbd0', '@lib/prismjs'),
('1d485ac8', '@craft/web/assets/jqueryui/dist'),
('1db7d0df', '@verbb/supertable/resources/dist'),
('1e26fd9b', '@lib/picturefill'),
('1e5e19e5', '@craft/web/assets/matrix/dist'),
('1f450b6a', '@craft/web/assets/garnish/dist'),
('220fce95', '@craft/web/assets/pluginstore/dist'),
('233eca4c', '@lib/garnishjs'),
('273c5ca0', '@craft/web/assets/selectize/dist'),
('298f4d73', '@craft/web/assets/focusvisible/dist'),
('2b74fee8', '@craft/web/assets/cp/dist'),
('3141d8a1', '@craft/web/assets/d3/dist'),
('326d6bf9', '@app/web/assets/fields/dist'),
('32d0ca83', '@craft/web/assets/dashboard/dist'),
('3327801b', '@app/web/assets/fabric/dist'),
('3338c63', '@craft/web/assets/fileupload/dist'),
('34ea749d', '@verbb/base/resources/dist'),
('350a45b7', '@app/web/assets/dashboard/dist'),
('36781e72', '@lib/fabric'),
('36bdd79f', '@craft/web/assets/fields/dist'),
('37f73c7d', '@craft/web/assets/fabric/dist'),
('39053860', '@craft/web/assets/sites/dist'),
('3a20d116', '@craft/web/assets/iframeresizer/dist'),
('3c72c39', '@app/web/assets/sites/dist'),
('3df54332', '@craft/redactor/assets/redactor-plugins/dist/video'),
('3f932f4a', '@craft/web/assets/admintable/dist'),
('3fa05091', '@craft/redactor/assets/redactor/dist'),
('40349495', '@lib/xregexp'),
('41016116', '@craft/web/assets/jquerypayment/dist'),
('410bae80', '@craft/web/assets/installer/dist'),
('411e9c2f', '@craft/web/assets/axios/dist'),
('4152be74', '@craft/web/assets/jquerytouchevents/dist'),
('449663a1', '@craft/web/assets/velocity/dist'),
('450cc52b', '@craft/web/assets/pluginstore/dist'),
('46996f7b', '@app/web/assets/plugins/dist'),
('478106bd', '@verbb/navigation/resources/dist'),
('47e5d82a', '@app/web/assets/selectize/dist'),
('491e670b', '@craft/web/assets/garnish/dist'),
('49cfaa66', '@app/web/assets/jquerytouchevents/dist'),
('4a58d01f', '@lib/selectize'),
('4a84efa9', '@app/web/assets/axios/dist'),
('4b2c2d3', '@craft/redactor/assets/redactor-plugins/dist/video'),
('4c77f556', '@craft/web/assets/cp/dist'),
('4e421795', '@craft/awss3/resources'),
('4f0ae8d1', '@craft/web/assets/datepickeri18n/dist'),
('50284f29', '@craft/web/assets/updater/dist'),
('50b6bbfa', '@craft/web/assets/vue/dist'),
('51bedc21', '@craft/web/assets/fields/dist'),
('53fb7703', '@lib/datepicker-i18n'),
('55133905', '@app/web/assets/focusvisible/dist'),
('56092cc7', '@craft/web/assets/updateswidget/dist'),
('563717b7', '@craft/web/assets/plugins/dist'),
('576f22ce', '@app/web/assets/fileupload/dist'),
('58430183', '@app/web/assets/jqueryui/dist'),
('589024f4', '@craft/web/assets/admintable/dist'),
('59e5ded6', '@app/web/assets/datepickeri18n/dist'),
('5b4a0f9e', '@craft/web/assets/fieldsettings/dist'),
('5bf993b5', '@app/web/assets/iframeresizer/dist'),
('5ce306d', '@app/web/assets/deprecationerrors/dist'),
('5f26789c', '@craft/web/assets/generalsettings/dist'),
('6112542e', '@app/web/assets/picturefill/dist'),
('617028f6', '@craft/web/assets/updater/dist'),
('61ac501c', '@craft/web/assets/fabric/dist'),
('664c7e04', '@app/web/assets/xregexp/dist'),
('671ab4c0', '@craft/web/assets/d3/dist'),
('6732348', '@craft/web/assets/updater/dist'),
('68b36ea9', '@craft/web/assets/recententries/dist'),
('69112670', '@app/web/assets/d3/dist'),
('6bcf81e7', '@app/web/assets/admintable/dist'),
('6c7bbd77', '@craft/web/assets/iframeresizer/dist'),
('6cefc65', '@lib/fileupload'),
('6e463b58', '@app/web/assets/elementresizedetector/dist'),
('6e7d170', '@craft/redactor/assets/redactor/dist'),
('6f5e5401', '@craft/web/assets/sites/dist'),
('716730c1', '@craft/web/assets/selectize/dist'),
('7186c622', '@craft/web/assets/utilities/dist'),
('72170cb1', '@fruitstudios/linkit/assetbundles/fieldsettings/build'),
('73240039', '@app/web/assets/cp/dist'),
('7454a2f4', '@craft/web/assets/pluginstore/dist'),
('76834fd4', '@app/web/assets/jquerypayment/dist'),
('76e206c8', '@craft/web/assets/xregexp/dist'),
('771a1547', '@app/web/assets/login/dist'),
('77c108a4', '@app/web/assets/plugins/dist'),
('795d125b', '@craft/web/assets/matrix/dist'),
('7c8066c1', '@craft/web/assets/login/dist'),
('7d2f9289', '@craft/web/assets/cp/dist'),
('7d5abbc8', '@craft/web/assets/picturefill/dist'),
('7dfec39c', '@app/web/assets/editsection/dist'),
('7fcbcce0', '@lib/timepicker'),
('7fd42112', '@craft/web/assets/focusvisible/dist'),
('83033661', '@lib/velocity'),
('838c5060', '@craft/web/assets/fabric/dist'),
('85d5fbf', '@craft/web/assets/sites/dist'),
('86aba69e', '@craft/web/assets/dashboard/dist'),
('875cec06', '@app/web/assets/fabric/dist'),
('8bbaf0a', '@craft/web/assets/prismjs/dist'),
('92241cdb', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('928cc11c', '@bower/jquery/dist'),
('93a6c65e', '@craft/web/assets/utilities/dist'),
('93ebfae9', '@craft/redactor/assets/field/dist'),
('94c206b4', '@craft/web/assets/xregexp/dist'),
('97550341', '@craft/web/assets/editentry/dist'),
('9ea066bd', '@craft/web/assets/login/dist'),
('9f249989', '@lib/jquery.payment'),
('9f7abbb4', '@craft/web/assets/picturefill/dist'),
('a321616a', '@craft/web/assets/jquerypayment/dist'),
('a372be08', '@craft/web/assets/jquerytouchevents/dist'),
('a3d4a6c3', '@bower/jquery/dist'),
('a47945e3', '@craft/web/assets/routes/dist'),
('a5242eb5', '@app/web/assets/utilities/dist'),
('a634b92b', '@craft/web/assets/elementresizedetector/dist'),
('a6b663dd', '@craft/web/assets/velocity/dist'),
('a6dc372', '@lib/iframe-resizer'),
('a839222d', '@craft/web/assets/matrixsettings/dist'),
('a93336d5', '@craft/web/assets/jqueryui/dist'),
('a9aa2c4c', '@craft/web/assets/clearcaches/dist'),
('aaac7b08', '@craft/redactor/assets/field/dist'),
('ab3e6777', '@craft/web/assets/garnish/dist'),
('ab5782f6', '@typedlinkfield/resources'),
('ab639d3a', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('ac6ebbdb', '@app/web/assets/prismjs/dist'),
('ad2ae8ad', '@craft/web/assets/datepickeri18n/dist'),
('b0294e75', '@app/web/assets/dashboard/dist'),
('b296bb86', '@craft/web/assets/vue/dist'),
('b41717cb', '@craft/web/assets/plugins/dist'),
('b5e654f7', '@app/web/assets/velocity/dist'),
('b748e07e', '@craft/web/assets/fileupload/dist'),
('b7f3c141', '@craft/web/assets/dashboard/dist'),
('bb901fbb', '@app/web/assets/garnish/dist'),
('bd1c6ae9', '@lib/element-resize-detector'),
('bed6142a', '@app/web/assets/matrixsettings/dist'),
('c1540209', '@app/web/assets/generalsettings/dist'),
('c2996ad5', '@craft/web/assets/xregexp/dist'),
('c2f823c9', '@app/web/assets/jquerypayment/dist'),
('c361795a', '@app/web/assets/login/dist'),
('c37a4e5d', '@craft/web/assets/routes/dist'),
('c51c5cdc', '@craft/web/assets/selectize/dist'),
('c5a53c27', '@app/web/assets/updater/dist'),
('c75f6c24', '@app/web/assets/cp/dist'),
('c77ded8d', '@lib/axios'),
('c8fb0adc', '@craft/web/assets/login/dist'),
('c921d7d5', '@craft/web/assets/picturefill/dist'),
('c954fe94', '@craft/web/assets/cp/dist'),
('cb60887d', '@ether/seo/web/assets'),
('cbaf4d0f', '@craft/web/assets/focusvisible/dist'),
('cdaaadc4', '@lib/jquery-ui'),
('ceb0e78a', '@craft/web/assets/feed/dist'),
('d0f0caff', '@craft/web/assets/dashboard/dist'),
('d2371219', '@app/web/assets/xregexp/dist'),
('d3141c75', '@craft/web/assets/plugins/dist'),
('d361d8dd', '@craft/web/assets/d3/dist'),
('d5693833', '@app/web/assets/picturefill/dist'),
('d5cd4067', '@craft/web/assets/editsection/dist'),
('d5f06e18', '@app/web/assets/updateswidget/dist'),
('d800d16a', '@craft/web/assets/iframeresizer/dist'),
('d8a7fea6', '@app/web/assets/edituser/dist'),
('d8b34d41', '@app/web/assets/fieldsettings/dist'),
('da3d5745', '@app/web/assets/elementresizedetector/dist'),
('db62c2d9', '@app/web/assets/craftsupport/dist'),
('dd6a4a6d', '@app/web/assets/d3/dist'),
('e1138c1f', '@craft/web/assets/fileupload/dist'),
('e1685518', '@app/web/assets/focusvisible/dist'),
('e3144ed3', '@app/web/assets/fileupload/dist'),
('e4532334', '@craft/web/assets/updater/dist'),
('e4cdd7e7', '@craft/web/assets/vue/dist'),
('ea964ef8', '@lib/vue'),
('ea9baf76', '@craft/web/assets/prismjs/dist'),
('eb4a2c76', '@app/web/assets/recententries/dist'),
('ec386d9e', '@app/web/assets/jqueryui/dist'),
('ed3f46d0', '@app/web/assets/pluginstore/dist'),
('ed9eb2cb', '@app/web/assets/datepickeri18n/dist'),
('ef82ffa8', '@app/web/assets/iframeresizer/dist'),
('f05608ff', '@craft/web/assets/editentry/dist'),
('f06fd54a', '@craft/web/assets/elementresizedetector/dist'),
('f0ed0fbc', '@craft/web/assets/velocity/dist'),
('f1a5dace', '@craft/web/assets/craftsupport/dist'),
('f39eb437', '@app/web/assets/selectize/dist'),
('f529d269', '@craft/web/assets/jquerytouchevents/dist'),
('f565f032', '@craft/web/assets/axios/dist'),
('f57a0d0b', '@craft/web/assets/jquerypayment/dist'),
('f58fcaa2', '@bower/jquery/dist'),
('f6070bfb', '@app/web/assets/cp/dist'),
('f7430838', '@lib/focus-visible'),
('f9a36d03', '@craft/web/assets/login/dist'),
('fb7184cc', '@craft/web/assets/datepickeri18n/dist'),
('fdb4c67b', '@app/web/assets/jquerytouchevents/dist'),
('feb73a6', '@app/web/assets/garnish/dist'),
('feff83b4', '@app/web/assets/axios/dist'),
('ff685ab4', '@craft/web/assets/jqueryui/dist');

INSERT INTO `craft_revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, 'Applied “Draft 1”'),
(4, 2, 1, 4, NULL),
(5, 2, 1, 5, NULL),
(6, 2, 1, 6, NULL);

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' jordan mission10 co uk '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' mission10 '),
(2, 'slug', 0, 1, ' homepage '),
(2, 'title', 0, 1, ' homepage '),
(6, 'slug', 0, 1, ''),
(8, 'slug', 0, 1, ' temp vducnmtsfpwtamdtqvnpzfasvyexifwjsdyj '),
(8, 'title', 0, 1, ''),
(16, 'slug', 0, 1, ''),
(17, 'slug', 0, 1, ''),
(18, 'slug', 0, 1, ''),
(19, 'slug', 0, 1, '');

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Homepage', 'homepage', 'single', 1, 'all', 'end', NULL, '2021-11-23 14:19:42', '2021-11-23 14:19:42', NULL, '22879b2d-c513-40dc-86a1-da6c5c5901eb'),
(2, 1, 'Pages', 'pages', 'structure', 1, 'all', 'end', NULL, '2021-11-23 14:20:36', '2021-11-23 14:20:36', NULL, '9df1c3f9-df7c-4f21-a8e9-c034cf195242'),
(3, NULL, 'Call To Actions', 'callToActions', 'channel', 1, 'all', 'end', NULL, '2021-11-23 15:46:14', '2021-11-23 15:46:14', NULL, 'dbc4c592-afdb-4421-a3b5-6bebedd21c1c');

INSERT INTO `craft_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'pages/default', 1, '2021-11-23 14:19:42', '2021-11-23 14:19:42', 'b76497bf-688b-411f-ad7d-ebe3bc3b98df'),
(2, 2, 1, 1, '{parent.uri}/{slug}', 'pages/default', 1, '2021-11-23 14:20:36', '2021-11-23 14:20:36', '6719cc57-4bd2-4a3d-8fd4-a8fa24be9728'),
(3, 3, 1, 0, NULL, NULL, 1, '2021-11-23 15:46:14', '2021-11-23 15:46:14', '762aec97-250f-49f7-a888-3bc748626fe6');

INSERT INTO `craft_seo_redirects` (`id`, `uri`, `to`, `type`, `siteId`, `order`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '1(\\?.*|\\/$|\\/\\?.*|$)', '2$1', '301', NULL, 0, '2022-04-01 14:51:45', '2022-04-01 14:51:45', '45b1dc65-910e-4dfe-a08f-e4fc574082d0'),
(2, '1($|\\/(.*)$)', '2$1', '301', NULL, 0, '2022-04-01 14:55:25', '2022-04-01 14:55:25', '45714011-b2d9-4343-a972-7e994473e031'),
(3, 'original(\\?.*|\\/$|\\/\\?.*|$)', 'destination$1', '301', NULL, 0, '2022-04-01 14:56:39', '2022-04-01 14:56:39', 'b18c1f77-764f-4567-bcff-a322a803df20'),
(4, 'from1($|\\/(.*)$|\\?.*|\\/$|\\/\\?.*|$)', 'to1$1', '301', NULL, 0, '2022-04-01 15:00:16', '2022-04-01 15:00:16', 'be1484d4-de46-43e8-822c-8d29cc21b54a'),
(5, 'my-original-page($|\\/(.*)$|\\?.*|\\/$|\\/\\?.*|$)', 'my-final-page$1', '301', NULL, 0, '2022-04-01 16:32:02', '2022-04-01 16:32:02', '866a6324-5132-4cf1-81ac-c411193d8606'),
(6, 'test1($|\\/(.*)$)', 'test2$1', '301', NULL, 0, '2022-04-01 16:35:54', '2022-04-01 16:35:54', 'e900005c-077f-444b-8bb3-f8a8b1cd2f0c');

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Qb-OMnYXFnrXnPtqY3EQ2-xiVQS5TaJ88gjXR7TBGQ9jg7X5zxeSdCV4QVHOfv8sqqPPWySJfp8jqxKasOp_9CdyTZJZYqKKiBSh', '2022-03-07 10:01:14', '2022-03-07 12:54:33', '820f578f-3a6a-4811-bd34-40f8f9147a09'),
(2, 1, 'oPsIsVlK4OUDp1o-8dG5Svpqulop00nId-f6z_miQKyg_LaEB2p3s59dKKyEp-HMphcHm6Aik7iXR6AHBUD79rEOMD3n-juksuw9', '2022-03-18 12:36:33', '2022-03-18 16:56:52', '60e20c8d-3d0b-4d59-ab54-1631bf1e46cd'),
(3, 1, 'pL7SN87rOUEyi7D1aAKh1Ar9pZiwMaUaPW1lZ6yEgQu6Z22dbo41zsApMQcvB5V5uFQEv7__GJLkkxOSaB0X6pidVb9EnfOoc44x', '2022-03-23 09:51:22', '2022-03-23 12:05:59', '226cc9c9-717a-4e3b-8fea-9db9b7dd9d80'),
(5, 1, '7rh2VllRCtNcZ6PZZfM-w9ufnfgWjbGpwH04waGKI4Y8cht4DQlfDYernjf3qprFP4GeRlcwFcNJ0J0VClE7p0huxSm55Dfwgp3R', '2022-03-28 20:30:15', '2022-03-28 20:45:28', 'dbeb0f0f-da39-412c-9899-21e6a9056e0a'),
(7, 1, '9skoSwRDcK8SRpUSfIXaw1ehOxip7ZWbzBmXvPLe_jS6Ig8Z355fP2eXF7N8VYzeceJ3oaNqX2Czzs_Wc-3GyYICA7T-fY4jJsis', '2022-03-30 14:45:34', '2022-03-30 15:49:58', '7948b7ff-27a9-4cff-a487-73332bb7798d'),
(8, 1, 'iJkOy36pUrCzSj4Hguu5iZl5avUcpLiZM5SOr7dD3Py7n_Jo2i-AMRQwKP1zAPSSenIlbvNRX6QkNHc_x9D3vhK_O24dpe11AYbB', '2022-04-01 12:30:00', '2022-04-01 16:49:13', '97911833-360f-4329-b44c-bc9851cbb14c'),
(9, 1, 'r41O7E3hw6pDV0cGBzPkyqfU3o0Due-EA3vYwmOvE3AeAujS3wVLAwFcChJFxqcl305YsmJZYbUTeUrwLPJuA9CV5ZQbjX1hkyDc', '2022-04-06 08:17:22', '2022-04-06 08:49:51', '0f4e4b3e-218c-4f2f-aafe-a2515e5c4071');

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, '$SITE_NAME', '2021-11-23 14:07:03', '2021-11-23 14:56:01', NULL, 'adc3ce14-b18c-4644-b669-727364548afd');

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, '$SITE_NAME', 'default', 'en-GB', 1, '$SITE_URL', 1, '2021-11-23 14:07:03', '2021-11-23 14:56:12', NULL, 'd6d70c7a-a269-4189-b17f-d94d3f2d788c');

INSERT INTO `craft_stc_buttons` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_button`) VALUES
(1, 9, 1, '2021-11-23 16:01:30', '2021-11-23 16:01:30', 'ccb3e238-cb34-40d3-936e-f60a6fe876a9', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"url\",\"value\":\"\"}'),
(2, 10, 1, '2021-11-23 16:01:32', '2021-11-23 16:01:32', '6dc1659a-9898-4aa8-b93c-40d2f214bab7', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"tel\",\"value\":\"\"}'),
(3, 11, 1, '2021-11-23 16:01:34', '2021-11-23 16:01:34', '22ed7fd8-890d-48ff-ba5f-d5e8972c48ee', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"email\",\"value\":\"\"}'),
(4, 12, 1, '2021-11-23 16:01:36', '2021-11-23 16:01:36', 'a8dc0de0-7ae5-4029-9ce5-4f56bb26b7d7', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":null}'),
(5, 13, 1, '2021-11-23 16:01:38', '2021-11-23 16:01:38', '49a1dac0-48cf-4b04-b330-12b13591ccac', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"custom\",\"value\":\"\"}'),
(6, 14, 1, '2021-11-23 16:01:41', '2021-11-23 16:01:41', '037a177f-6661-4167-9be3-25cfd660c624', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"custom\",\"value\":\"#\"}'),
(7, 15, 1, '2021-11-23 16:01:42', '2021-11-23 16:01:42', 'b47a0944-c50c-4227-b1fb-2f1ac961cf9a', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"custom\",\"value\":\"\"}'),
(8, 16, 1, '2021-11-23 16:03:03', '2021-11-23 16:03:03', '46be1b8e-6bbc-41b6-9123-234c85016e0b', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":\"\",\"title\":null,\"type\":\"url\",\"value\":\"\"}');

INSERT INTO `craft_stc_linkinbiolinks` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_bioLink_ejwczycw`) VALUES
(1, 18, 1, '2021-12-06 11:09:31', '2021-12-06 11:09:31', '4c11559e-89c6-444a-a939-062e74d679dc', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Our website\",\"target\":\"\",\"title\":null,\"type\":\"entry\",\"value\":\"2\"}'),
(2, 19, 1, '2021-12-06 11:09:31', '2021-12-06 11:09:31', '3bcc4501-2224-4724-bba4-323012b10bc2', '{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Search engine\",\"target\":\"_blank\",\"title\":null,\"type\":\"url\",\"value\":\"https://google.com\"}');

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, '2021-11-23 14:20:36', '2021-11-23 14:20:36', NULL, '303398b9-0009-46b9-8079-398e4417bb40'),
(2, NULL, '2022-04-06 08:18:34', '2022-04-06 08:18:34', NULL, '444ffbe9-db5f-4a42-ac13-df531f7679c0');

INSERT INTO `craft_supertableblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(9, 8, 5, 1, 1, 0, '2021-11-23 16:01:30', '2021-11-23 16:01:30', '391030d9-1161-4d87-adc0-8e3f0296e958'),
(10, 8, 5, 1, 1, 0, '2021-11-23 16:01:32', '2021-11-23 16:01:32', 'bffce159-e445-4404-9fbe-2f7918a125c9'),
(11, 8, 5, 1, 1, 0, '2021-11-23 16:01:34', '2021-11-23 16:01:34', '92219a8a-37ec-43e6-907c-539b64a7bf73'),
(12, 8, 5, 1, 1, 0, '2021-11-23 16:01:36', '2021-11-23 16:01:36', '2e858ec5-dea2-4a31-94e0-7b9a846025a0'),
(13, 8, 5, 1, 1, 0, '2021-11-23 16:01:38', '2021-11-23 16:01:38', '23e36abb-a528-4517-949a-cffdcd29ee2a'),
(14, 8, 5, 1, 1, 0, '2021-11-23 16:01:41', '2021-11-23 16:01:41', 'b1076d15-de24-4f9e-b09a-1258c2611453'),
(15, 8, 5, 1, 1, 0, '2021-11-23 16:01:42', '2021-11-23 16:01:42', '78e588cb-2e35-4896-b059-1b90656467a5'),
(16, 8, 5, 1, 1, 1, '2021-11-23 16:03:03', '2021-11-23 16:03:03', '77728031-5c05-404c-9601-58fa7213fc0a'),
(18, 17, 8, 2, 1, NULL, '2021-12-06 11:09:31', '2021-12-06 11:09:31', '1435007c-a420-48c2-a664-f2352e6a4fa7'),
(19, 17, 8, 2, 2, NULL, '2021-12-06 11:09:31', '2021-12-06 11:09:31', 'a3ff888d-fa31-48a6-97e1-e9f6e9a9b40d');

INSERT INTO `craft_supertableblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 5, 5, '2021-11-23 15:46:00', '2021-11-23 15:46:00', '10b6675b-2ddd-41ec-96a5-1b2156bac2e6'),
(2, 8, 8, '2021-12-06 11:08:24', '2021-12-06 11:08:24', '1438c97e-4d71-4e53-b9b8-dca088f1f818');

INSERT INTO `craft_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-GB\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');

INSERT INTO `craft_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'mission10', NULL, '', '', 'jordan@mission10.co.uk', '$2y$13$ADIucI3IrKyoHIl1IdcCLukS1g0tiD1WUCQYLH5m2JKSeiL25kCk6', 1, 0, 0, 0, '2022-04-06 08:17:22', NULL, NULL, NULL, '2021-12-06 11:04:19', NULL, 1, NULL, NULL, NULL, 0, '2022-03-07 09:59:17', '2021-11-23 14:07:06', '2022-04-06 08:17:22', 'af9e4ac9-e8fb-4711-990e-bf7d80376ea4');

INSERT INTO `craft_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Cloud Files', '', '2021-11-23 15:41:30', '2021-11-23 15:41:30', '0269f668-1a59-4987-b1c1-205c80fb68dc'),
(2, NULL, NULL, 'Temporary source', NULL, '2021-11-23 15:44:53', '2021-11-23 15:44:53', '30ec19ee-4a09-44b0-b4fa-06701878c6b0'),
(3, 2, NULL, 'user_1', 'user_1/', '2021-11-23 15:44:53', '2021-11-23 15:44:53', '31fe5c0d-2973-48ff-a55b-36f7666b955c');

INSERT INTO `craft_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 4, 'Cloud Files', 'cloudFiles', 'craft\\awss3\\Volume', 1, '$AWS_CLOUDFRONT_URL', 'site', NULL, '{\"addSubfolderToRootUrl\":\"1\",\"autoFocalPoint\":\"\",\"bucket\":\"$AWS_BUCKET\",\"bucketSelectionMode\":\"manual\",\"cfDistributionId\":\"$AWS_CLOUDFRONT_ID\",\"cfPrefix\":\"$AWS_CLOUDFRONT_PREFIX\",\"expires\":\"\",\"keyId\":\"$AWS_ACCESS_KEY_ID\",\"makeUploadsPublic\":\"\",\"region\":\"$AWS_REGION\",\"secret\":\"$AWS_SECRET_ACCESS_KEY\",\"storageClass\":\"\",\"subfolder\":\"\"}', 1, '2021-11-23 15:41:30', '2021-11-23 15:41:30', NULL, 'd16c11fe-e37d-4ac7-a989-1a53c3782161');

INSERT INTO `craftcontent` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2021-11-23 14:06:16', '2021-11-23 14:06:16', 'f3c01961-097c-4b53-b393-47890cefd558');

INSERT INTO `craftelements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-11-23 14:06:15', '2021-11-23 14:06:15', NULL, NULL, '89817aaf-1356-48a0-b78d-5d3efc6ce7de');

INSERT INTO `craftelements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-11-23 14:06:15', '2021-11-23 14:06:15', 'a89410c6-3019-4cb5-82d7-4bb7b713b7a6');

INSERT INTO `craftfieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-11-23 14:06:15', '2021-11-23 14:06:15', NULL, '1e6503ce-1874-499c-ac7a-3b92d3d0292a');

INSERT INTO `craftinfo` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.21', '3.7.8', 0, 'mesizrdgjrjr', '2@zwenapqmrn', '2021-11-23 14:06:15', '2021-11-23 14:06:18', '38145c0f-deec-424c-89ae-846d3d273b61');

INSERT INTO `craftmigrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '72be4d49-ad83-4633-b8df-c24f4eae7ed8'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '00d00848-b774-4bec-b3e1-847b82757b8b'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '0f175487-529a-4e61-877c-c95c26e5fecf'),
(4, 'craft', 'm150403_184533_field_version', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '3da60b52-d865-4544-ba06-082946ff301f'),
(5, 'craft', 'm150403_184729_type_columns', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '6c4149dd-449d-4f4c-9b34-bce9161cd442'),
(6, 'craft', 'm150403_185142_volumes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5b18686d-b644-4f3d-9cf3-155a44a77edf'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9070b08a-38a6-4edc-9f46-737a0b8dc1f4'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2afce6d6-7916-4231-b813-b95c8341511f'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '891d6cb7-39b6-417b-9fa6-4645cb72346f'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '91461353-1b8c-492d-bbe0-6e1936541d67'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'c13bdbad-c6c4-4f36-a53e-bbd5372239cc'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '8d0e6575-2bcc-4972-b093-0d5fffb097c1'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '0fb0b919-98b8-4aca-8e12-74c3218c7cd3'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '929db86b-b791-46a0-92ea-747000c096f5'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '8c0f9f9d-ae67-4e9a-b22e-75b125ba5cc6'),
(16, 'craft', 'm151209_000000_move_logo', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9401764f-f3f6-4cd4-93e1-5d4ddb5f5e48'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '79308db3-e64f-44d0-bcf0-b693245e220e'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '482ff815-c584-458f-85d8-d2e4916aa99b'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'ad51d460-a736-4713-aaff-d8ddfb410df8'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '13399e0b-5f3a-40f2-8c02-1682575a5d7e'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '6996569a-a8c9-4f4c-afc4-8837252b9251'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '936442a8-4d8c-4187-8d36-a5926c52cf9d'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9681a642-d69e-4248-ae3e-29ad3f175fdd'),
(24, 'craft', 'm160807_144858_sites', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '401a42d5-bb36-4931-8632-d8c25bb2b114'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'ae1bc917-790d-41f8-add7-19df4a298ac7'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'efa44fc3-9c8c-4558-a83c-de952ff504a5'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2a0b21e4-6764-4e8f-81e5-905830b95257'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '33ebbd2b-7d55-4d03-b6b6-3afe3854b40c'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '3e52f909-2069-47b0-b834-bf1221891601'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '494761eb-d91f-44aa-ad2d-c51d1c591a69'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '6514d07e-b129-41b3-a4a3-e7a587883b92'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2c2089bb-2f56-4bef-8c66-8d89329bce7f'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '0c0dffd1-4add-46c6-a893-6a01b4b18793'),
(34, 'craft', 'm161013_175052_newParentId', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'be0c82f8-2a0c-4b15-bd45-b347f1ccfc2e'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9ff1c0b7-f923-401c-b2f9-5b4fb221ffc1'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '1b3ee5b8-c1e5-4fb0-8d88-c4c9037fcf03'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '217db9d6-2255-4c46-8cb8-2133445ed93a'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b338db38-7d2f-489c-ac3d-12d51c9b01d7'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '935c5d78-3f0e-42f8-b552-df97c63f6da4'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '1fea1ac5-9d91-4afa-a8d8-d0b0ed6512f8'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '19e50f1a-f4f2-4fcf-b748-5574e7d4ff1e'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '4d18135a-b463-4321-8ad4-815a2ce92f54'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'fe0d5eb4-5956-436a-9418-7073309bfcb4'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '8b2e4e22-c83c-446b-a25e-88104ed54214'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '3a65ba9b-1e06-4fdd-bec8-c31199b0a829'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9872b52a-b906-46ab-a5a7-eec42234003a'),
(47, 'craft', 'm170206_142126_system_name', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'eaa51cd5-3696-4a65-8bfb-b94eaa3772f4'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '3d560f07-8102-4635-aba0-0634a30bc5fb'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '41d7fe7e-16bc-42b5-9e25-f825bf4c86db'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '4a37df87-c34c-4645-93af-97e4e299132c'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '27299c19-8d41-495e-bde8-20705bae2487'),
(52, 'craft', 'm170228_171113_system_messages', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '07cf59fd-9cc1-499d-8d86-308168dcb6e2'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '84862c6f-264c-4541-8b29-0f0c73d3b5fb'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b541f4ff-5e6a-423c-ab37-ae667bab22ab'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '0c2e72b8-e1d0-4410-91ea-4a1887182ac6'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'be039750-d0cf-4af6-a647-d5d492f062de'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '07ab35a7-5667-4644-a184-c220c557bbcb'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '637c8b27-85ec-4e48-b6d9-e61c309f3d89'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '71a79499-a2a1-416d-ace6-250c0fed37d3'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '1a38415d-6e42-464d-9f9d-aad981f06201'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e0708497-dea7-4738-8d1a-9c968a7761fe'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e85b2cc2-db9a-44aa-b344-1541b0202a01'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b5fb5ff4-c025-4adf-96e1-c831a754d8b9'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e62d15db-14cd-4dc5-8fc1-d0d0fb08dce6'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'a403c097-d600-4bce-9642-e237a78e127c'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'bf346db4-23e1-4c50-8cef-a07f948ead71'),
(67, 'craft', 'm171011_214115_site_groups', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '88d9cb3a-48ce-4b16-874e-d09e3a1c7001'),
(68, 'craft', 'm171012_151440_primary_site', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '81206c9c-8604-4786-a14a-4206048cbc5a'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '349e0706-270b-4527-9108-a2ac3e776eca'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '84b64d24-47aa-4a46-b9f1-49854d6c512f'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '830f820c-fe4c-420c-956c-b4ec06e3f145'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '433964d8-1e34-4404-a68b-98679ad97e13'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'cc7862b8-0e1a-4c99-a02b-595b6afbaf76'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '3d434aad-8ffe-4aaa-b561-8dc3eb762384'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '86447104-809c-4c14-853d-f7467a374e93'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5753c1d6-ab9b-4f6c-80af-c53f2a49d06d'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '23299797-120b-487c-b993-a86a0978eef4'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '826904c0-ebc8-44d0-856f-c01376e92b55'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5407d67d-47af-48e9-b129-6c7b9815f23d'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '59bf7b77-edeb-4149-a59d-3d05c5949d37'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'd5964fe6-0875-4aaa-b38b-2c66585e70c3'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '1b9e987b-749c-4594-8af4-a1db9314ee92'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '539ffd1e-2d45-4f03-b02c-608b323e0b35'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9e9b5717-4a57-4653-b377-fe33038480b9'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b4273807-48f2-460d-ae6f-82af04b37acd'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '61a4cd05-2d4d-48e1-96fc-f0004e76d412'),
(87, 'craft', 'm180321_233505_small_ints', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'ebbe9f8e-f448-486a-8b04-7ef7237209cd'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '09b36585-e03e-453d-bece-40f270bb02bd'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '37223147-3353-4c67-917a-38523f0ddd32'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'c1f35daf-77f7-4d2b-aa4c-52e18cff1913'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '4f9bdaf9-6def-4dab-bb8f-b3912fbbf7f8'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9c8a0b53-528a-474f-bbfb-689c88a65bb0'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '1efea3d2-60d7-4f80-84ce-44c2ec293f6e'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e12c30f4-4f08-4bc6-92e2-118254bffbb9'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '4f546a3e-c479-4842-a366-92b21b0b55fe'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9e8482bf-5df3-4e27-8060-9a5a4c54311b'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'c5f56503-b88f-4b5f-a618-b64002a93a7f'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '62916ec0-52d7-4b9e-ab82-9cb9dba8c012'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '18b8513d-5afe-43b3-8052-c7b8c39576a8'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '6d94f766-3240-48ee-8dfb-69be88f0af11'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '8b2aa44a-c4f5-42c7-8c65-8055a8a98620'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'be489b25-301c-4eed-82e7-a84bbba2bed7'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'f56d3105-40b3-4505-be70-acd6ce0fee7f'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'fa616b0f-ff83-4920-b461-a7d8a43bbc0d'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '79e04b42-fc62-4245-90e8-d5f1a99b7b87'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'dc2dbc74-8350-4630-9048-52f5f549cb4e'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'f60e59d0-e4ef-40d1-bd40-63ef3d318aff'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'fd79df66-4abd-4d8f-91d7-337d025af94c'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '61c3b58c-1086-402b-abc3-66845b055b8a'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b51b9ecb-1039-4a52-8a93-9ccd3b262898'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e0648d40-d0a4-481f-8f67-be0bff50b393'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'd202e2ba-3a8b-48cb-9e13-3c839d6f4c7e'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'f042d0ed-ec7a-4782-afa4-61e7d7e0d118'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '4f3c1508-da48-4942-9974-d0bd5e2ce22c'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '66e44114-3c08-42f8-a4bb-a5d4348f2da9'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'ebbc6664-f6b2-4f34-a7a0-613bdc220d4c'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '11de50f3-614c-4ac9-8643-974396f4cb0d'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2511566c-50aa-4f04-bd02-16db5336533c'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b2d0d332-67dc-4e24-90fe-f089363dbbee'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'dd8b9419-d3d7-43f1-a7d8-49d00612a244'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '57e7e188-645e-476e-9164-527cc45bcd3e'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2b0fa5b9-9082-4f9f-9bb4-580858dfe102'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '395e6f82-dcee-453e-aed0-9dfaf16b5bae'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '07b001fe-e480-4247-8fcf-66ff6dfdd686'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b6dc8a97-412e-49e7-95fe-41e921849395'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'cf2aa1b7-9843-4311-87da-1f4c482e14d2'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'fbd0b5ec-def8-4dc9-872a-f5ed484be65d'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e2c20471-ea1b-4b32-ae0e-64eebe90a56e'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e8343bea-a002-4cd8-bbc0-3c428c7d7d1b'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '1ae86e06-77ea-434e-96cb-b99548e140a1'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e82053bc-3a16-4d4f-b0e7-3f611027075a'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '7e4904cf-97ce-4095-a9c8-8587c17c90f4'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '8cc57e78-aa4c-45b8-9e0a-b85574618a9a'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '1c77058a-ad50-4d74-9bf3-d92bb13f6004'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'b34ae051-d09d-4060-b06c-f71c78d549c0'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'd02955f7-626f-43e4-add4-ae3be0c78050'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e1724dd8-a10d-4819-a10e-ca81131d4781'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'a464469f-7812-4669-b305-71471894938f'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '6dca83cc-ee58-4c98-bd23-1c93e6cd41c9'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e61efcb3-8548-4226-b4e6-2cf1f36c7d5f'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '8c7cb628-2d72-45a1-bebd-370d56e57432'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '650a9904-14dd-4684-8ca6-ed7d2a2656cd'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'fdc039c4-cdb3-4c7b-97b2-36e4f0f902c8'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2d1f5550-1713-4160-8a61-2bdf69c18f85'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e98d2b40-f77d-42e4-8a3c-56d803bb068f'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2c2fec96-d2cd-4c9c-ad19-2ebefbdbd132'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5b00930d-c151-4329-b147-d2adba0ffb8c'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5128e2ab-9a0f-4aab-8782-4c0f5ce11f09'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e5ea0c07-b01d-4dce-ac6a-4ee82df835e6'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'bdbf3625-2d6a-4b71-80f7-1e7b03140fcd'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'd733a947-a4d9-4d33-993d-5e28aff335e1'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'cc3140e6-855c-45a3-8fd4-dce10e1c884d'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'dee888dc-f3d8-466b-9e93-c6dcd98892d8'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '4fcd9b54-f858-44b7-b713-ff722f302418'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e70b0d44-06d9-426f-9bee-6ed295df762d'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '6fd64864-462c-42db-b539-37acb7898d80'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'a72ffdf5-5029-4a89-9219-ec7ca9b22806'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '9f64bdf3-4e0c-4191-8acd-1f2104ef607c'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '18745882-0b4d-4bca-ad9d-b1e1fc185195'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '210fb058-5406-453d-9ef9-f284e4305d66'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'ebc4d139-dedb-416b-8a3a-e51efc112fdc'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '25eee4ca-c7cf-447a-a664-afafed8da506'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'd27a044d-e267-431f-bb31-34ee967212af'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '68cf3269-b0b8-4410-bbc3-c8dc3d125dff'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5d382f3b-7072-4027-90fe-b83f51b64e81'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'caeb64f4-5de4-478f-a6ac-aa8f3c34e271'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5e3ce4aa-10bb-4af4-81e9-f8a787e557ad'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '819d8c44-1d78-4992-a613-dc4bfc4b3b7e'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '05e3de16-59ba-4df0-923d-ba473e3b3ba9'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '3db59efb-fde7-4d36-807b-1d9d00371712'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '4f238178-00bd-4418-9a71-91ed44e4113d'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '966ec840-b34f-49af-8891-1f3dcfd33b23'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'fb150a2f-0335-4fd2-b3e9-107fbec991ab'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'ea684a1b-2e2a-4f57-930a-fb18eccb6a53'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '3495cfe4-9e5e-4147-86d3-7cb41f713048'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'e2939a16-44b9-4c43-911f-87440a1b0f5b'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '940bc236-083e-4daa-aea1-38e13275f1ff'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'd6e934cd-64f8-4519-94ba-d8c363f4d3a7'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'bfe6ef95-b882-4da0-93eb-7f01f09b13b7'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '787174f1-73f5-4857-bec2-0db5ae84f820'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '5de7ee72-1ebd-4585-8fdc-a7c021775feb'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '553ce35f-e373-4ad4-8c41-ccddab545d5a'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '0dc1696d-ef28-4366-a859-2ed7197da6aa'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'bbe47a9a-fe99-4d6a-a672-6a1a29debb68'),
(185, 'craft', 'm210331_220322_null_author', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'c07359d7-5ed8-4434-bcb3-a65fb5a61d4f'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'c74a0520-a2f8-4539-8211-4239597dbb88'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '20721e26-f7c9-40b8-96a4-fa86951a0be4'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '93f273e6-2e45-41b6-ac83-13d3b1ff6e2f'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'ae8a0de0-bd83-424e-b8f5-7e413feba49d'),
(190, 'craft', 'm210613_184103_announcements', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', 'f35ab250-15da-4f2e-a882-d61b1327ceaa'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '8ac897be-f887-47c1-a9b3-95d9f98397e6');

INSERT INTO `craftprojectconfig` (`path`, `value`) VALUES
('dateModified', '1637676378'),
('email.fromEmail', '\"jordan@mission10.co.uk\"'),
('email.fromName', '\"Boilerplate\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.1e6503ce-1874-499c-ac7a-3b92d3d0292a.name', '\"Common\"'),
('meta.__names__.1e6503ce-1874-499c-ac7a-3b92d3d0292a', '\"Common\"'),
('meta.__names__.adc3ce14-b18c-4644-b669-727364548afd', '\"Boilerplate\"'),
('meta.__names__.d6d70c7a-a269-4189-b17f-d94d3f2d788c', '\"Boilerplate\"'),
('siteGroups.adc3ce14-b18c-4644-b669-727364548afd.name', '\"Boilerplate\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.handle', '\"default\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.hasUrls', 'true'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.language', '\"en-GB\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.name', '\"Boilerplate\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.primary', 'true'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.siteGroup', '\"adc3ce14-b18c-4644-b669-727364548afd\"'),
('sites.d6d70c7a-a269-4189-b17f-d94d3f2d788c.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Boilerplate\"'),
('system.schemaVersion', '\"3.7.8\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

INSERT INTO `craftqueue` (`id`, `channel`, `job`, `description`, `timePushed`, `ttr`, `delay`, `priority`, `dateReserved`, `timeUpdated`, `progress`, `progressLabel`, `attempt`, `fail`, `dateFailed`, `error`) VALUES
(1, 'queue', 'O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":7:{s:11:\"elementType\";s:19:\"craft\\elements\\User\";s:9:\"elementId\";i:1;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";a:0:{}s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;}', 'Updating search indexes', 1637676378, 300, 0, 2048, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL);

INSERT INTO `craftsessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '7U8p8mdNDwZafq1XTxuTLW2FK2VIZwQGuGMV2OUG1Enem4wMGmDda_2PpIXmb5EhvvA7utQytZuavUVQMnNjNMTaerV9DLFKwrGh', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '81a34167-7968-4fb8-9751-3565f88b0202');

INSERT INTO `craftsitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Boilerplate', '2021-11-23 14:06:15', '2021-11-23 14:06:15', NULL, 'adc3ce14-b18c-4644-b669-727364548afd');

INSERT INTO `craftsites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Boilerplate', 'default', 'en-GB', 1, '$PRIMARY_SITE_URL', 1, '2021-11-23 14:06:15', '2021-11-23 14:06:15', NULL, 'd6d70c7a-a269-4189-b17f-d94d3f2d788c');

INSERT INTO `craftuserpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-GB\"}');

INSERT INTO `craftusers` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'mission10', NULL, NULL, NULL, 'jordan@mission10.co.uk', '$2y$13$lW0/uFTOUE7wqz5VfpzQMety5SLQCZ6JU4bg1ZB335CwaQYYAbtSa', 1, 0, 0, 0, '2021-11-23 14:06:18', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-11-23 14:06:18', '2021-11-23 14:06:18', '2021-11-23 14:06:18', '98e40837-3094-413c-a126-0f4131ebd41f');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;