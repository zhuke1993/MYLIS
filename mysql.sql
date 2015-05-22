/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : lis

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-11-28 01:00:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bas_dict`
-- ----------------------------
DROP TABLE IF EXISTS `bas_dict`;
CREATE TABLE `bas_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_type` varchar(50) DEFAULT NULL,
  `dict_item` varchar(50) DEFAULT NULL,
  `dict_value` varchar(50) DEFAULT NULL,
  `dict_is_editable` char(1) DEFAULT '1',
  `del_status` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_dict
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_custmessage`
-- ----------------------------
DROP TABLE IF EXISTS `clt_custmessage`;
CREATE TABLE `clt_custmessage` (
  `id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `massage` varchar(1000) DEFAULT NULL,
  `leave_time` date DEFAULT NULL,
  `del_status` char(1) DEFAULT '0',
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `clt_custmessage_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `cus_customerinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_custmessage
-- ----------------------------

-- ----------------------------
-- Table structure for `cust_logininfo`
-- ----------------------------
DROP TABLE IF EXISTS `cust_logininfo`;
CREATE TABLE `cust_logininfo` (
  `id` int(11) NOT NULL,
  `cust_login` varchar(20) NOT NULL,
  `cust_pwd` varchar(20) NOT NULL,
  `login_card` varchar(20) NOT NULL,
  `login_name` varchar(20) NOT NULL,
  `login_email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cust_logininfo
-- ----------------------------

-- ----------------------------
-- Table structure for `cus_customerinfo`
-- ----------------------------
DROP TABLE IF EXISTS `cus_customerinfo`;
CREATE TABLE `cus_customerinfo` (
  `id` int(11) NOT NULL,
  `cust_login_id` int(11) NOT NULL,
  `cust_number` varchar(20) NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_emp_id` int(11) NOT NULL,
  `cust_grading` varchar(20) NOT NULL,
  `cust_credit` int(11) NOT NULL,
  `cust_addr` varchar(500) DEFAULT NULL,
  `cust_zip` varchar(20) DEFAULT NULL,
  `cust_principal` varchar(20) NOT NULL,
  `cust_tel` varchar(20) NOT NULL,
  `cust_fax` varchar(20) DEFAULT NULL,
  `cust_website` varchar(100) DEFAULT NULL,
  `cust_chieftain` varchar(20) DEFAULT NULL,
  `cust_bankroll` int(11) DEFAULT NULL,
  `cust_bank` varchar(500) NOT NULL,
  `cust_bank_account` varchar(20) NOT NULL,
  `cust_status` char(1) NOT NULL,
  `cust_regist_time` date NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cust_emp_id` (`cust_emp_id`),
  KEY `cust_login_id` (`cust_login_id`),
  CONSTRAINT `cus_customerinfo_ibfk_2` FOREIGN KEY (`cust_login_id`) REFERENCES `cust_logininfo` (`id`),
  CONSTRAINT `cus_customerinfo_ibfk_1` FOREIGN KEY (`cust_emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cus_customerinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `cus_lose`
-- ----------------------------
DROP TABLE IF EXISTS `cus_lose`;
CREATE TABLE `cus_lose` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `cust_emp_id` int(11) NOT NULL,
  `cust_end_order_time` date NOT NULL,
  `cust_lose_time` date DEFAULT NULL,
  `cust_deferment_step` varchar(500) DEFAULT NULL,
  `cust_lose_cause` varchar(500) DEFAULT NULL,
  `cust_lose_status` char(1) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cust_id` (`cust_id`),
  KEY `cust_emp_id` (`cust_emp_id`),
  KEY `cust_end_order_time` (`cust_end_order_time`),
  CONSTRAINT `cus_lose_ibfk_3` FOREIGN KEY (`cust_end_order_time`) REFERENCES `ord_orderinfo` (`odr_time`),
  CONSTRAINT `cus_lose_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `cus_customerinfo` (`id`),
  CONSTRAINT `cus_lose_ibfk_2` FOREIGN KEY (`cust_emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cus_lose
-- ----------------------------

-- ----------------------------
-- Table structure for `cus_service`
-- ----------------------------
DROP TABLE IF EXISTS `cus_service`;
CREATE TABLE `cus_service` (
  `id` int(11) NOT NULL,
  `cust_sev_number` varchar(20) NOT NULL,
  `cust_sev_type` varchar(20) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `cust_sev_general` varchar(100) NOT NULL,
  `cust_sev_desire` varchar(200) NOT NULL,
  `cust_sev_time` date NOT NULL,
  `cust_sev_manage` varchar(2000) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `cust_satisfation_degree` int(11) NOT NULL,
  `cust_dissatisfation_degree` varchar(20) DEFAULT NULL,
  `cust_sev_status` char(1) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  `cust_sev_cltime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cust_id` (`cust_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `cus_service_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `cus_service_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `cus_customerinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cus_service
-- ----------------------------

-- ----------------------------
-- Table structure for `dtm_departmentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `dtm_departmentinfo`;
CREATE TABLE `dtm_departmentinfo` (
  `id` int(11) NOT NULL,
  `dep_number` varchar(20) NOT NULL COMMENT '部门编号',
  `dep_name` varchar(20) NOT NULL COMMENT '部门名称',
  `dep_phone` varchar(20) DEFAULT NULL COMMENT '部门电话',
  `dep_fax` varchar(20) DEFAULT NULL COMMENT '部门传真',
  `dep_intro` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dtm_departmentinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `dtm_majorinfo`
-- ----------------------------
DROP TABLE IF EXISTS `dtm_majorinfo`;
CREATE TABLE `dtm_majorinfo` (
  `id` int(11) NOT NULL COMMENT '序号',
  `major_number` varchar(20) NOT NULL COMMENT '职位编号',
  `major_name` varchar(20) NOT NULL COMMENT '职位名称',
  `major_ename` varchar(20) NOT NULL COMMENT '职位英文名称',
  `dep_id` int(11) NOT NULL COMMENT '部门序号',
  `major_intro` varchar(200) DEFAULT NULL COMMENT '职位描述',
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `dtm_majorinfo_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `dtm_departmentinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dtm_majorinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_achievement`
-- ----------------------------
DROP TABLE IF EXISTS `emp_achievement`;
CREATE TABLE `emp_achievement` (
  `id` int(11) NOT NULL,
  `ach_number` varchar(20) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `ach_job_score` int(11) NOT NULL,
  `ach_solve_question_score` int(11) NOT NULL,
  `ach_job_go` int(11) NOT NULL,
  `ach_teamwork_score` int(11) NOT NULL,
  `ach_learning_score` int(11) NOT NULL,
  `ach_job_efficiency_score` int(11) NOT NULL,
  `ach_job_grade_score` int(11) NOT NULL,
  `ach_check_score` int(11) NOT NULL,
  `ach_check_grade_score` varchar(20) NOT NULL,
  `ach_check_status` char(1) NOT NULL,
  `ach_check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ach_remark` varchar(500) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  KEY `dep_id` (`dep_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `emp_achievement_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_achievement_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `dtm_departmentinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_achievement_ibfk_3` FOREIGN KEY (`major_id`) REFERENCES `dtm_majorinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_achievement
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_check`
-- ----------------------------
DROP TABLE IF EXISTS `emp_check`;
CREATE TABLE `emp_check` (
  `id` int(11) DEFAULT NULL,
  `check_number` varchar(20) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `check_attendance_day` int(11) DEFAULT NULL,
  `check_leave_type` varchar(20) DEFAULT NULL,
  `check_start_leave_time` date DEFAULT NULL,
  `check_late_degree` int(11) DEFAULT NULL,
  `check_break_degree` int(11) DEFAULT NULL,
  `check_start_evection_time` date DEFAULT NULL,
  `check_end_evection_time` date DEFAULT NULL,
  `check_intro` varchar(255) DEFAULT NULL,
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `emp_check_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_check
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_comeback`
-- ----------------------------
DROP TABLE IF EXISTS `emp_comeback`;
CREATE TABLE `emp_comeback` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_comeback_time` date NOT NULL,
  `dep_id` int(20) NOT NULL,
  `major_id` int(20) NOT NULL,
  `emp_comeback_remark` varchar(2000) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  KEY `dep_id` (`dep_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `emp_comeback_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_comeback_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `dtm_departmentinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_comeback_ibfk_3` FOREIGN KEY (`major_id`) REFERENCES `dtm_majorinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_comeback
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_employeeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `emp_employeeinfo`;
CREATE TABLE `emp_employeeinfo` (
  `id` int(11) NOT NULL,
  `emp_number` varchar(20) NOT NULL,
  `emp_name` varchar(20) NOT NULL,
  `emp_picture` varchar(20) DEFAULT NULL,
  `dep_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `emp_sex` char(255) NOT NULL,
  `emp_birthday` date NOT NULL,
  `emp_card_number` varchar(18) NOT NULL,
  `emp_government` varchar(20) DEFAULT NULL,
  `emp_marriage` varchar(20) DEFAULT NULL,
  `emp_job_date` date NOT NULL,
  `emp_phone` varchar(20) DEFAULT NULL,
  `emp_address` varchar(100) DEFAULT NULL,
  `emp_postcode` varchar(20) DEFAULT NULL,
  `emp_intro` varchar(200) DEFAULT NULL COMMENT '备注',
  `emp_job_status` char(1) NOT NULL COMMENT '员工状态',
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dep_id` (`dep_id`),
  KEY `major_id` (`major_id`),
  KEY `emp_number` (`emp_number`),
  CONSTRAINT `emp_employeeinfo_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `dtm_departmentinfo` (`id`),
  CONSTRAINT `emp_employeeinfo_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `dtm_majorinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_employeeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_employinfo`
-- ----------------------------
DROP TABLE IF EXISTS `emp_employinfo`;
CREATE TABLE `emp_employinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employ_name` varchar(20) NOT NULL,
  `employ_sex` varchar(20) NOT NULL,
  `employ_phone` varchar(20) NOT NULL,
  `employ_email` varchar(50) DEFAULT NULL,
  `employ_dateyear` varchar(20) DEFAULT NULL,
  `employ_education` varchar(20) NOT NULL,
  `employ_station` varchar(50) NOT NULL,
  `employ_ability_description` varchar(2000) DEFAULT NULL,
  `employ_job_experience` varchar(2000) DEFAULT NULL,
  `employ_other` varchar(2000) DEFAULT NULL,
  `items_experience` varchar(2000) DEFAULT NULL,
  `evaluation` varchar(2000) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_employinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_example`
-- ----------------------------
DROP TABLE IF EXISTS `emp_example`;
CREATE TABLE `emp_example` (
  `id` int(11) NOT NULL,
  `exa_number` varchar(20) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `exa_begintime` date NOT NULL,
  `exa_endtime` date NOT NULL,
  `exa_type` varchar(10) NOT NULL,
  `exa_status` char(1) NOT NULL,
  `exa_cause` varchar(20) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `emp_example_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_example
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_leave`
-- ----------------------------
DROP TABLE IF EXISTS `emp_leave`;
CREATE TABLE `emp_leave` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_leave_time` int(11) NOT NULL,
  `emp_leave_cause` varchar(2000) NOT NULL,
  `emp_leave_remark` varchar(2000) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `emp_leave_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_leave
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_probation`
-- ----------------------------
DROP TABLE IF EXISTS `emp_probation`;
CREATE TABLE `emp_probation` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_probation_check_status` varchar(20) NOT NULL,
  `emp_probation_check_remark` varchar(200) NOT NULL,
  `emp_probation_check_time` date NOT NULL,
  `emp_probation_success` char(1) DEFAULT NULL,
  `emp_probation_remark` varchar(1000) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `emp_probation_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_probation
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_remove`
-- ----------------------------
DROP TABLE IF EXISTS `emp_remove`;
CREATE TABLE `emp_remove` (
  `id` int(11) NOT NULL,
  `rem_number` varchar(20) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `sta_dep_id` int(11) NOT NULL,
  `sta_major_id` int(11) NOT NULL,
  `rem_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `new_dep_id` int(11) NOT NULL,
  `new_major_id` int(11) NOT NULL,
  `rem_cause` varchar(2000) NOT NULL,
  `rem_status` char(1) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  KEY `sta_dep_id` (`sta_dep_id`),
  KEY `sta_major_id` (`sta_major_id`),
  KEY `new_dep_id` (`new_dep_id`),
  KEY `new_major_id` (`new_major_id`),
  CONSTRAINT `emp_remove_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_remove_ibfk_2` FOREIGN KEY (`sta_dep_id`) REFERENCES `dtm_departmentinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_remove_ibfk_3` FOREIGN KEY (`sta_major_id`) REFERENCES `dtm_majorinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_remove_ibfk_4` FOREIGN KEY (`new_dep_id`) REFERENCES `dtm_departmentinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_remove_ibfk_5` FOREIGN KEY (`new_major_id`) REFERENCES `dtm_majorinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_remove
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_retire`
-- ----------------------------
DROP TABLE IF EXISTS `emp_retire`;
CREATE TABLE `emp_retire` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_retire_time` date NOT NULL,
  `emp_retire_mode` varchar(20) NOT NULL,
  `emp_retire_status` char(1) NOT NULL,
  `emp_retire_remark` varchar(2000) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `emp_retire_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_retire
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_accountinfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_accountinfo`;
CREATE TABLE `fas_accountinfo` (
  `bankInfo_id` int(11) NOT NULL COMMENT '银行基本信息，外键--银行编号',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 's序号',
  `subject_id` int(11) NOT NULL COMMENT '科目编号',
  `ai_type` varchar(20) NOT NULL COMMENT '账户类型',
  `ai_name` varchar(20) NOT NULL COMMENT '账户名称',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `bankInfo_id` (`bankInfo_id`),
  KEY `subject_id` (`subject_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_accountinfo_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_accountinfo_ibfk_1` FOREIGN KEY (`bankInfo_id`) REFERENCES `fas_bankinfo` (`id`),
  CONSTRAINT `fas_accountinfo_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `fas_subjectinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_accountinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_bankinfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_bankinfo`;
CREATE TABLE `fas_bankinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `bankinfo_name` varchar(50) NOT NULL COMMENT '银行名称',
  `bankinfo_number` varchar(50) NOT NULL COMMENT '银行账号',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date NOT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_bankinfo_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_bankinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_billbook`
-- ----------------------------
DROP TABLE IF EXISTS `fas_billbook`;
CREATE TABLE `fas_billbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `subject_id` int(11) NOT NULL COMMENT '科目序号',
  `billbook_date` date NOT NULL COMMENT '记账日期',
  `billbook_number` varchar(50) NOT NULL COMMENT '凭证号',
  `billbook_dm` decimal(9,2) NOT NULL COMMENT '借方金额',
  `billbook_lm` decimal(9,2) NOT NULL COMMENT '贷方金额',
  `billbook_sub` char(1) NOT NULL COMMENT '对方科目',
  `billbook_hp` int(50) NOT NULL COMMENT '经手人',
  `billbook_format` varchar(50) NOT NULL COMMENT '出纳形式',
  `billbook_sum` varchar(50) DEFAULT NULL COMMENT '摘要',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `billbook_hp` (`billbook_hp`),
  CONSTRAINT `fas_billbook_ibfk_2` FOREIGN KEY (`billbook_hp`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_billbook_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `fas_subjectinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_billbook
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_biscwage`
-- ----------------------------
DROP TABLE IF EXISTS `fas_biscwage`;
CREATE TABLE `fas_biscwage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `bisc_department_id` int(11) NOT NULL COMMENT '部门编号',
  `bisc_major_id` int(11) NOT NULL COMMENT '职务编号',
  `bisc_wage_mon` decimal(10,0) NOT NULL COMMENT '基本工资',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `bisc_department_id` (`bisc_department_id`),
  KEY `bisc_major_id` (`bisc_major_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_biscwage_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_biscwage_ibfk_1` FOREIGN KEY (`bisc_department_id`) REFERENCES `dtm_departmentinfo` (`id`),
  CONSTRAINT `fas_biscwage_ibfk_2` FOREIGN KEY (`bisc_major_id`) REFERENCES `dtm_majorinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_biscwage
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_checkinfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_checkinfo`;
CREATE TABLE `fas_checkinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `bankinfo_id` int(11) NOT NULL COMMENT '银行名称',
  `ci_date` date NOT NULL COMMENT '购置日期',
  `ci_incept` varchar(50) NOT NULL COMMENT '支票起始号',
  `ci_stop` varchar(50) NOT NULL COMMENT '支票终止号',
  `ci_status` char(1) DEFAULT NULL COMMENT '支票状态',
  `ci_hxstatus` date DEFAULT NULL COMMENT '核销时间',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date NOT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `bankinfo_id` (`bankinfo_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_checkinfo_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_checkinfo_ibfk_1` FOREIGN KEY (`bankinfo_id`) REFERENCES `fas_bankinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_checkinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_copeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_copeinfo`;
CREATE TABLE `fas_copeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `copeinfo_oi` int(11) NOT NULL COMMENT '客户名称',
  `copeinfo_gt` varchar(20) NOT NULL COMMENT '付款类型',
  `copeinfo_gm` decimal(9,2) NOT NULL COMMENT '付款金额',
  `copeinfo_oa` decimal(9,2) DEFAULT NULL COMMENT '整单折扣',
  `copeinfo_sm` decimal(9,2) NOT NULL COMMENT '实付金额',
  `copeinfo_fm` char(1) NOT NULL COMMENT '结算方式',
  `copeinfo_am` int(11) NOT NULL COMMENT '审核人',
  `copeinfo_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date NOT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `copeinfo_oi` (`copeinfo_oi`),
  KEY `copeinfo_am` (`copeinfo_am`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_copeinfo_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_copeinfo_ibfk_1` FOREIGN KEY (`copeinfo_oi`) REFERENCES `cus_customerinfo` (`id`),
  CONSTRAINT `fas_copeinfo_ibfk_2` FOREIGN KEY (`copeinfo_am`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_copeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_evectioninfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_evectioninfo`;
CREATE TABLE `fas_evectioninfo` (
  `id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `evection_time` date NOT NULL,
  `evection_place` varchar(50) NOT NULL,
  `evection_money` decimal(9,2) DEFAULT NULL,
  `evection_remark` varchar(20) DEFAULT NULL,
  `evection_pm` decimal(9,2) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `update_date` date DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  KEY `employees_id` (`employees_id`),
  CONSTRAINT `fas_evectioninfo_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_evectioninfo_ibfk_2` FOREIGN KEY (`employees_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_evectioninfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_floor`
-- ----------------------------
DROP TABLE IF EXISTS `fas_floor`;
CREATE TABLE `fas_floor` (
  `id` int(11) DEFAULT NULL COMMENT '序号',
  `floor_typename` varchar(20) NOT NULL COMMENT '场地类型名',
  `floor_name` varchar(20) NOT NULL COMMENT '场地名称',
  `floor_company` varchar(20) NOT NULL COMMENT '场地所属公司',
  `floor_hiretype` varchar(200) DEFAULT NULL COMMENT '场地出租方式',
  `floor_price` decimal(9,2) NOT NULL COMMENT '场地价格',
  `floor_apply` decimal(9,2) NOT NULL COMMENT '申请资金',
  `floor_apply_empid` int(11) DEFAULT NULL COMMENT '申请员工编号',
  `floor_begintime` date DEFAULT NULL COMMENT '场地出租时间',
  `floor_endtime` date DEFAULT NULL COMMENT '场地到期时间',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date NOT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  KEY `floor_apply_empid` (`floor_apply_empid`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_floor_ibfk_1` FOREIGN KEY (`floor_apply_empid`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_floor_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_floor
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_gerenalledger`
-- ----------------------------
DROP TABLE IF EXISTS `fas_gerenalledger`;
CREATE TABLE `fas_gerenalledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `subject_id` int(11) NOT NULL COMMENT '科目编号',
  `subject_name` varchar(50) NOT NULL COMMENT '科目名称',
  `general_bd` varchar(200) NOT NULL COMMENT '期间',
  `general_bb` decimal(9,2) NOT NULL COMMENT '期初余额',
  `general_ca` decimal(9,2) NOT NULL COMMENT '本期应收全额',
  `general_cr` decimal(9,2) NOT NULL COMMENT '本期应付金额',
  `general_ya` decimal(9,2) NOT NULL COMMENT '本年应付金额',
  `general_yr` decimal(9,2) NOT NULL COMMENT '本年应收金额',
  `general_eb` decimal(9,2) NOT NULL COMMENT '期末余额',
  `general_summary` varchar(200) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `fas_gerenalledger_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `fas_subjectinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_gerenalledger
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_receiptinfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_receiptinfo`;
CREATE TABLE `fas_receiptinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `receipt_type` varchar(10) NOT NULL COMMENT '开票类型',
  `receipt_mode` varchar(10) NOT NULL COMMENT '开票方式',
  `client_id` int(11) NOT NULL COMMENT '客户编号',
  `receipt_money` decimal(9,2) NOT NULL COMMENT '开票金额',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `receipt_remark` varchar(200) NOT NULL COMMENT '备注信息',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_receiptinfo_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_receiptinfo_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `cus_customerinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_receiptinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_subjectinfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_subjectinfo`;
CREATE TABLE `fas_subjectinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `subject_name` varchar(50) NOT NULL COMMENT '科目名称',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_subjectinfo_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_subjectinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_suitcollection`
-- ----------------------------
DROP TABLE IF EXISTS `fas_suitcollection`;
CREATE TABLE `fas_suitcollection` (
  `id` int(11) NOT NULL COMMENT '序号',
  `subject_id` int(11) NOT NULL COMMENT '科目序号',
  `order_id` int(11) NOT NULL COMMENT '订单序号',
  `suitci_gt` varchar(10) NOT NULL COMMENT '收款类型',
  `suitci_gm` decimal(9,2) NOT NULL COMMENT '收款金额',
  `suitci_oa` decimal(9,2) DEFAULT NULL COMMENT '整单折扣',
  `suitci_sm` decimal(9,2) NOT NULL COMMENT '实收金额',
  `suitci_fm` char(1) NOT NULL COMMENT '结算方式',
  `suitci_mm` int(11) NOT NULL COMMENT '制单人',
  `suitci_am` int(11) NOT NULL COMMENT '审核人',
  `suitci_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `order_id` (`order_id`),
  KEY `suitci_mm` (`suitci_mm`),
  KEY `suitci_am` (`suitci_am`),
  CONSTRAINT `fas_suitcollection_ibfk_4` FOREIGN KEY (`suitci_am`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_suitcollection_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `fas_subjectinfo` (`id`),
  CONSTRAINT `fas_suitcollection_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ord_orderinfo` (`id`),
  CONSTRAINT `fas_suitcollection_ibfk_3` FOREIGN KEY (`suitci_mm`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_suitcollection
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_tenancy`
-- ----------------------------
DROP TABLE IF EXISTS `fas_tenancy`;
CREATE TABLE `fas_tenancy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `apply_bankroll` decimal(9,2) NOT NULL COMMENT '申请资金',
  `apply_man` int(11) NOT NULL COMMENT '资金申请人',
  `synopsis` varchar(200) DEFAULT NULL COMMENT '概要',
  `linkman` varchar(20) NOT NULL COMMENT '联系人',
  `linkman_phone` varchar(20) NOT NULL COMMENT '联系电话',
  `create_name` int(11) NOT NULL COMMENT '创建人',
  `tenancy_state` char(1) NOT NULL COMMENT '0.未审核 1.已审核 2.未支付 3.已支付',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `apply_man` (`apply_man`),
  KEY `create_name` (`create_name`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_tenancy_ibfk_1` FOREIGN KEY (`apply_man`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_tenancy_ibfk_2` FOREIGN KEY (`create_name`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_tenancy_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_tenancy
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_travelinfo`
-- ----------------------------
DROP TABLE IF EXISTS `fas_travelinfo`;
CREATE TABLE `fas_travelinfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `department_id` int(11) NOT NULL,
  `trival_time` date NOT NULL,
  `trival_em` decimal(9,2) DEFAULT NULL,
  `emp_id` int(20) NOT NULL,
  `update_date` date DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0未删除 1已删除',
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fas_travelinfo_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `fas_travelinfo_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `dtm_departmentinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_travelinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `fas_wageverify`
-- ----------------------------
DROP TABLE IF EXISTS `fas_wageverify`;
CREATE TABLE `fas_wageverify` (
  `id` int(11) NOT NULL COMMENT '序号',
  `basc_id` int(11) NOT NULL COMMENT '基本工资编号',
  `employee_id` int(11) NOT NULL COMMENT '员工名称',
  `superfluity_wage` decimal(9,2) DEFAULT NULL COMMENT '额外工资',
  `recoup_wage` decimal(9,2) DEFAULT NULL COMMENT '扣除工资',
  `wage_revenue` decimal(9,2) NOT NULL COMMENT '缴纳税收',
  `deservely_wage` decimal(9,2) NOT NULL COMMENT '应得工资',
  `wage_rewark` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  `basc_wage` decimal(9,2) NOT NULL COMMENT '基本工资',
  PRIMARY KEY (`id`),
  KEY `basc_id` (`basc_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `fas_wageverify_ibfk_1` FOREIGN KEY (`basc_id`) REFERENCES `fas_biscwage` (`id`),
  CONSTRAINT `fas_wageverify_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fas_wageverify
-- ----------------------------

-- ----------------------------
-- Table structure for `ord_attemper`
-- ----------------------------
DROP TABLE IF EXISTS `ord_attemper`;
CREATE TABLE `ord_attemper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atte_bg_time` date NOT NULL,
  `atte_end_time` date NOT NULL,
  `atte_temp_add` varchar(200) NOT NULL,
  `atte_dep_id` int(11) NOT NULL,
  `atte_odr_id` int(11) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `atte_dep_id` (`atte_dep_id`),
  KEY `atte_odr_id` (`atte_odr_id`),
  CONSTRAINT `ord_attemper_ibfk_2` FOREIGN KEY (`atte_odr_id`) REFERENCES `ord_orderinfo` (`id`),
  CONSTRAINT `ord_attemper_ibfk_1` FOREIGN KEY (`atte_dep_id`) REFERENCES `dtm_departmentinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ord_attemper
-- ----------------------------

-- ----------------------------
-- Table structure for `ord_consigninfo`
-- ----------------------------
DROP TABLE IF EXISTS `ord_consigninfo`;
CREATE TABLE `ord_consigninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cons_name` varchar(100) NOT NULL,
  `cons_tel` varchar(100) NOT NULL,
  `cons_add` varchar(100) NOT NULL,
  `cons_time` varchar(100) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0：未删除，1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ord_consigninfo
-- ----------------------------

-- ----------------------------
-- Table structure for `ord_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ord_orderinfo`;
CREATE TABLE `ord_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cons_id` int(11) NOT NULL,
  `odr_number` varchar(20) NOT NULL,
  `odr_time` date NOT NULL,
  `odr_pay_type` varchar(50) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `odr_train_type` varchar(10) NOT NULL,
  `odr_check_type` varchar(10) NOT NULL,
  `odr_sign_status` char(1) NOT NULL,
  `odr_remove` char(1) NOT NULL COMMENT '0.未调度  1.已调度',
  `odr_ispay` char(1) NOT NULL,
  `ware_id` int(11) NOT NULL,
  `odr_status` char(1) NOT NULL,
  `check_money` decimal(9,2) DEFAULT NULL,
  `take_goods ` varchar(10) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `congign_id` int(11) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `odr_time` (`odr_time`),
  KEY `cons_id` (`cons_id`),
  KEY `cust_id` (`cust_id`),
  KEY `ware_id` (`ware_id`),
  KEY `congign_id` (`congign_id`),
  CONSTRAINT `ord_orderinfo_ibfk_4` FOREIGN KEY (`congign_id`) REFERENCES `ord_shipper` (`id`),
  CONSTRAINT `ord_orderinfo_ibfk_1` FOREIGN KEY (`cons_id`) REFERENCES `ord_consigninfo` (`id`),
  CONSTRAINT `ord_orderinfo_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `cus_customerinfo` (`id`),
  CONSTRAINT `ord_orderinfo_ibfk_3` FOREIGN KEY (`ware_id`) REFERENCES `ord_ware` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ord_orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `ord_shipper`
-- ----------------------------
DROP TABLE IF EXISTS `ord_shipper`;
CREATE TABLE `ord_shipper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_id` int(11) NOT NULL,
  `check_name` varchar(20) NOT NULL,
  `check_phone` varchar(20) NOT NULL,
  `check_address` varchar(1000) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ord_id` (`ord_id`),
  CONSTRAINT `ord_shipper_ibfk_1` FOREIGN KEY (`ord_id`) REFERENCES `ord_orderinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ord_shipper
-- ----------------------------

-- ----------------------------
-- Table structure for `ord_update`
-- ----------------------------
DROP TABLE IF EXISTS `ord_update`;
CREATE TABLE `ord_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_id` int(11) NOT NULL,
  `ord_attemper_id` int(11) NOT NULL,
  `ord_lr_status` varchar(50) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ord_update
-- ----------------------------

-- ----------------------------
-- Table structure for `ord_ware`
-- ----------------------------
DROP TABLE IF EXISTS `ord_ware`;
CREATE TABLE `ord_ware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_number` varchar(20) NOT NULL,
  `ware_name` varchar(100) NOT NULL,
  `ware_height` decimal(9,2) NOT NULL,
  `ware_cubage` decimal(9,2) DEFAULT NULL,
  `ware_count` int(11) DEFAULT NULL,
  `ware_risk` decimal(9,2) DEFAULT NULL,
  `ware_money` decimal(9,2) NOT NULL,
  `ware_bgaddr` varchar(100) NOT NULL,
  `ware_endaddr` varchar(100) NOT NULL,
  `ware_transit_type` varchar(20) NOT NULL,
  `ware_type` varchar(20) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0：未删除，1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ord_ware
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_afficheinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_afficheinfo`;
CREATE TABLE `sys_afficheinfo` (
  `id` int(11) NOT NULL,
  `affiche_number` varchar(20) NOT NULL,
  `affiche_title` varchar(50) NOT NULL,
  `affiche_type` varchar(20) NOT NULL,
  `affiche_notes` varchar(5000) NOT NULL,
  `affiche_addtime` date NOT NULL,
  `affiche_updatetime` date DEFAULT NULL,
  `affiche_userid` int(11) NOT NULL,
  `affiche_remark` varchar(100) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `affiche_userid` (`affiche_userid`),
  CONSTRAINT `sys_afficheinfo_ibfk_1` FOREIGN KEY (`affiche_userid`) REFERENCES `sys_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_afficheinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_loglogininfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_loglogininfo`;
CREATE TABLE `sys_loglogininfo` (
  `id` int(11) NOT NULL,
  `log_userid` int(11) NOT NULL,
  `log_logintime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_exittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `log_remark` varchar(100) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `log_userid` (`log_userid`),
  CONSTRAINT `sys_loglogininfo_ibfk_1` FOREIGN KEY (`log_userid`) REFERENCES `sys_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_loglogininfo
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logworkinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logworkinfo`;
CREATE TABLE `sys_logworkinfo` (
  `id` int(11) NOT NULL,
  `log_userid` int(11) NOT NULL,
  `log_workname` varchar(200) NOT NULL,
  `log_worktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_remark` varchar(100) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `log_userid` (`log_userid`),
  CONSTRAINT `sys_logworkinfo_ibfk_1` FOREIGN KEY (`log_userid`) REFERENCES `sys_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_logworkinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_righthandle`
-- ----------------------------
DROP TABLE IF EXISTS `sys_righthandle`;
CREATE TABLE `sys_righthandle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `right_id` int(11) NOT NULL,
  `handle_add` int(11) NOT NULL,
  `handle_delete` int(11) NOT NULL,
  `handle_modify` int(11) NOT NULL,
  `handle_get` int(11) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `right_id` (`right_id`),
  CONSTRAINT `sys_righthandle_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_righthandle
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_rightinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rightinfo`;
CREATE TABLE `sys_rightinfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `right_id` varchar(20) NOT NULL,
  `right_type` varchar(20) NOT NULL,
  `right_name` varchar(20) NOT NULL,
  `right_desc` varchar(200) DEFAULT NULL,
  `right_url` varchar(255) NOT NULL,
  `right_parent_id` varchar(50) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rightinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  `role_dep_id` int(11) NOT NULL,
  `role_major_id` int(11) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `right_id` (`right_id`),
  KEY `role_dep_id` (`role_dep_id`),
  KEY `role_major_id` (`role_major_id`),
  CONSTRAINT `sys_role_ibfk_3` FOREIGN KEY (`role_major_id`) REFERENCES `dtm_majorinfo` (`id`),
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `sys_rightinfo` (`id`),
  CONSTRAINT `sys_role_ibfk_2` FOREIGN KEY (`role_dep_id`) REFERENCES `dtm_departmentinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_roleright`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roleright`;
CREATE TABLE `sys_roleright` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `right_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `right_id` (`right_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `sys_roleright_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_rightinfo` (`id`),
  CONSTRAINT `sys_roleright_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roleright
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_userinfo`;
CREATE TABLE `sys_userinfo` (
  `id` int(11) NOT NULL,
  `user_number` varchar(20) NOT NULL,
  `user_loginName` varchar(20) NOT NULL,
  `user_loginPwd` varchar(20) NOT NULL,
  `user_empId` int(11) NOT NULL,
  `user_state` char(1) NOT NULL,
  `user_remark` varchar(100) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_empId` (`user_empId`),
  CONSTRAINT `sys_userinfo_ibfk_1` FOREIGN KEY (`user_empId`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_carinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_carinfo`;
CREATE TABLE `tsp_carinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `car_name` varchar(20) NOT NULL COMMENT '车辆名称',
  `car_type` varchar(20) NOT NULL COMMENT '车辆类型',
  `car_no` varchar(20) NOT NULL COMMENT '车牌号',
  `car_date` date NOT NULL COMMENT ' 购入日期',
  `car_money` decimal(9,2) NOT NULL COMMENT '金额',
  `car_state` char(1) NOT NULL DEFAULT '0' COMMENT '当前状态',
  `car_remark` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `tsp_carinfo_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_carinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_carmto`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_carmto`;
CREATE TABLE `tsp_carmto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `maintain_car_id` int(11) NOT NULL COMMENT '车辆编号',
  `maintain_time` date NOT NULL COMMENT '保养时间',
  `maintain_cyc` int(11) NOT NULL COMMENT '保养周期',
  `maintain_money` decimal(9,2) NOT NULL COMMENT '保养费用',
  `maintain_emp_id` int(11) NOT NULL COMMENT '处理人员',
  `car_remark` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `maintain_emp_id` (`maintain_emp_id`),
  KEY `maintain_car_id` (`maintain_car_id`),
  CONSTRAINT `tsp_carmto_ibfk_3` FOREIGN KEY (`maintain_car_id`) REFERENCES `tsp_carinfo` (`id`),
  CONSTRAINT `tsp_carmto_ibfk_2` FOREIGN KEY (`maintain_emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_carmto
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_carnote`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_carnote`;
CREATE TABLE `tsp_carnote` (
  `id` int(11) NOT NULL,
  `carnote_type` char(1) NOT NULL,
  `carnote_empno` int(11) NOT NULL,
  `carnote_carno` int(11) NOT NULL,
  `carnote_time` date NOT NULL,
  `carnote_begin` varchar(200) DEFAULT NULL,
  `carnote_address` varchar(200) NOT NULL,
  `carnote_remark` varchar(200) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `update_date` date DEFAULT NULL,
  `create_date` date NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `carnote_empno` (`carnote_empno`),
  KEY `carnote_carno` (`carnote_carno`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `tsp_carnote_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `tsp_carnote_ibfk_1` FOREIGN KEY (`carnote_empno`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `tsp_carnote_ibfk_2` FOREIGN KEY (`carnote_carno`) REFERENCES `tsp_carinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_carnote
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_car_fix`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_car_fix`;
CREATE TABLE `tsp_car_fix` (
  `id` int(11) NOT NULL,
  `fix_car_id` int(11) NOT NULL,
  `fix_address` varchar(50) DEFAULT NULL,
  `fix_disposalName` varchar(20) NOT NULL,
  `fix_money` decimal(9,2) DEFAULT NULL,
  `fix_item` varchar(200) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `update_date` date DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  KEY `fix_car_id` (`fix_car_id`),
  CONSTRAINT `tsp_car_fix_ibfk_3` FOREIGN KEY (`fix_car_id`) REFERENCES `tsp_carinfo` (`id`),
  CONSTRAINT `tsp_car_fix_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_car_fix
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_ordernote`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_ordernote`;
CREATE TABLE `tsp_ordernote` (
  `id` int(11) NOT NULL,
  `carnote_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `carnote_id` (`carnote_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `tsp_ordernote_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ord_orderinfo` (`id`),
  CONSTRAINT `tsp_ordernote_ibfk_1` FOREIGN KEY (`carnote_id`) REFERENCES `tsp_carnote` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_ordernote
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_siteinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_siteinfo`;
CREATE TABLE `tsp_siteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `siteinfo_car_id` int(11) NOT NULL COMMENT '车辆编号',
  `siteinfo_emp_id` varchar(20) NOT NULL COMMENT '司机编号',
  `siteinfo_time` time NOT NULL COMMENT '当前时间',
  `siteinfo_address` varchar(200) NOT NULL COMMENT '本质地址',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `siteinfo_car_id` (`siteinfo_car_id`),
  KEY `siteinfo_emp_id` (`siteinfo_emp_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `tsp_siteinfo_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `tsp_siteinfo_ibfk_1` FOREIGN KEY (`siteinfo_car_id`) REFERENCES `tsp_carinfo` (`id`),
  CONSTRAINT `tsp_siteinfo_ibfk_2` FOREIGN KEY (`siteinfo_emp_id`) REFERENCES `emp_employeeinfo` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_siteinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_slipstate`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_slipstate`;
CREATE TABLE `tsp_slipstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `slipstate_state` char(1) NOT NULL DEFAULT '0' COMMENT '处理状态',
  `slipstate_result` varchar(20) NOT NULL COMMENT '处理结果',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_slipstate
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_transit`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_transit`;
CREATE TABLE `tsp_transit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sub_id` int(11) NOT NULL COMMENT '地区编号',
  `transit_name` varchar(20) NOT NULL COMMENT '货站点名称',
  `transit_address` varchar(200) NOT NULL COMMENT '详细地址',
  `transit_tel` varchar(20) NOT NULL COMMENT '联系电话',
  `transit_remark` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `tsp_transit_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `whu_sub` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_transit
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_translip`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_translip`;
CREATE TABLE `tsp_translip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `slipstate_id` int(11) NOT NULL COMMENT '处理编号',
  `translip_empid` int(11) NOT NULL COMMENT '司机编号',
  `translip_carid` int(11) NOT NULL COMMENT '车辆编号',
  `translip_time` date NOT NULL COMMENT '事故时间',
  `translip_address` varchar(200) NOT NULL COMMENT '事故地点',
  `translip_cause` varchar(200) NOT NULL COMMENT '事故原因',
  `emp_id` int(11) NOT NULL COMMENT '操作人',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `translip_empid` (`translip_empid`),
  KEY `tsp_translip_ibfk_1` (`slipstate_id`),
  KEY `emp_id` (`emp_id`),
  KEY `tsp_translip_empinfo` (`translip_carid`),
  CONSTRAINT `tsp_translip_empinfo` FOREIGN KEY (`translip_carid`) REFERENCES `tsp_carinfo` (`id`),
  CONSTRAINT `tsp_translip_ibfk_1` FOREIGN KEY (`slipstate_id`) REFERENCES `tsp_slipstate` (`id`),
  CONSTRAINT `tsp_translip_ibfk_2` FOREIGN KEY (`translip_empid`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `tsp_translip_ibfk_4` FOREIGN KEY (`emp_id`) REFERENCES `emp_employeeinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_translip
-- ----------------------------

-- ----------------------------
-- Table structure for `tsp_zone`
-- ----------------------------
DROP TABLE IF EXISTS `tsp_zone`;
CREATE TABLE `tsp_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区编号',
  `zone_pro` varchar(20) NOT NULL COMMENT '省',
  `zone_city` varchar(20) NOT NULL COMMENT '市',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '判断逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsp_zone
-- ----------------------------

-- ----------------------------
-- Table structure for `whu_depot`
-- ----------------------------
DROP TABLE IF EXISTS `whu_depot`;
CREATE TABLE `whu_depot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depot_name` varchar(50) NOT NULL,
  `depot_address` varchar(500) NOT NULL,
  `deport_remark` varchar(500) DEFAULT NULL,
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0:未删除,1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whu_depot
-- ----------------------------

-- ----------------------------
-- Table structure for `whu_depot_sub`
-- ----------------------------
DROP TABLE IF EXISTS `whu_depot_sub`;
CREATE TABLE `whu_depot_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `depot_id` int(11) NOT NULL COMMENT '仓库编号',
  `sub_id` int(11) NOT NULL COMMENT '分区编号',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0:未删除,1:已删除 判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `FK_2` (`sub_id`),
  KEY `FK_1` (`depot_id`),
  CONSTRAINT `FK_1` FOREIGN KEY (`depot_id`) REFERENCES `whu_depot` (`id`),
  CONSTRAINT `FK_2` FOREIGN KEY (`sub_id`) REFERENCES `whu_sub` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whu_depot_sub
-- ----------------------------

-- ----------------------------
-- Table structure for `whu_feightyype`
-- ----------------------------
DROP TABLE IF EXISTS `whu_feightyype`;
CREATE TABLE `whu_feightyype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sub_id` int(11) NOT NULL COMMENT '分区编号',
  `fright_number` varchar(20) NOT NULL COMMENT '货物类型名称',
  `fright_remark` varchar(200) DEFAULT NULL COMMENT '货物类型描述',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0：未删除，1：已删除',
  PRIMARY KEY (`id`,`sub_id`),
  UNIQUE KEY `id` (`id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `whu_feightyype_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `whu_sub` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whu_feightyype
-- ----------------------------

-- ----------------------------
-- Table structure for `whu_inandtnote`
-- ----------------------------
DROP TABLE IF EXISTS `whu_inandtnote`;
CREATE TABLE `whu_inandtnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `recard_time` date NOT NULL COMMENT '货物入库时间',
  `recard_person` int(20) NOT NULL COMMENT '审批人',
  `recard_type` char(1) NOT NULL COMMENT '0：出库，1：入库 存取类型',
  `recard_remark` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `sub_id` int(11) NOT NULL COMMENT '外键，仓库信息表  仓库编号',
  `recard_number` varchar(20) NOT NULL COMMENT '出入库单号',
  `recard_unit` varchar(200) DEFAULT NULL COMMENT '货物批次号',
  `recad_block` varchar(20) NOT NULL COMMENT '货物类型编号',
  `Feight_id` int(11) NOT NULL COMMENT '外键，货物信息表',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0：未删除1：已删除  判断逻辑删除',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`Feight_id`),
  KEY `FK_Depot` (`sub_id`),
  KEY `recard_person` (`recard_person`),
  CONSTRAINT `whu_inandtnote_ibfk_3` FOREIGN KEY (`recard_person`) REFERENCES `emp_employeeinfo` (`id`),
  CONSTRAINT `whu_inandtnote_ibfk_1` FOREIGN KEY (`Feight_id`) REFERENCES `whu_feightyype` (`id`),
  CONSTRAINT `whu_inandtnote_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `whu_depot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whu_inandtnote
-- ----------------------------

-- ----------------------------
-- Table structure for `whu_sub`
-- ----------------------------
DROP TABLE IF EXISTS `whu_sub`;
CREATE TABLE `whu_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sub_name` varchar(20) NOT NULL COMMENT '分区名称',
  `sub_state` char(1) NOT NULL COMMENT '分区状态',
  `sub_remark` varchar(200) NOT NULL COMMENT '分区描述',
  `del_status` char(1) NOT NULL DEFAULT '0' COMMENT '0:未删除,1:已删除 判断逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whu_sub
-- ----------------------------
