

/***************初始化数据**********************************************************************************************************************************初始化数据****************************
*****************************初始化数据************************************************************************************************初始化数据*************************************************
************************************************************************************************************************************************************************************************
***************************************************************初始化数据****************************************************初始化数据*******************************************************
*************************************************************************************************初始化数据***************************************************************************
************************************************************************************************************************************************************************************************
***************************************************************初始化数据*************************************************************初始化数据**********************************************/

/*初始化用户*/
INSERT INTO ss_operator(OPER_ID, DEPT_ID, WORK_CODE, OPER_NAME, OPER_PASSWORD, OPER_TYPE, OPER_STATE, OPER_MOBILE, OPER_TEL, 
	                    OPER_CREATOR, CREATE_DATE, IP_CONSTRAIN, MAC_CONSTRAIN, OPER_EMAIL, ERR_LOGIN_NUM, LATEST_LOGIN_TIME, ERR_PIN_NUM)
                  VALUES(1, NULL, 'admin', 'admin', '58cf703f664397ec4f0ac359b84b565c', '00', '01', NULL, NULL, 
	                   'system', now(), NULL, NULL, NULL, 0, NULL, 0);
/*初始化角色*/
INSERT INTO ss_role(ROLE_ID, ROLE_NAME_CODE, ROLE_DESC, ROLE_ATTR, ROLE_CREATOR, CREATE_DATE, DEPT_ID, ROLE_TYPE)
VALUES(1, 'admin', 'admin', '01', NULL, now(), 'system', '1');
/*初始化用户与角色关系*/
INSERT INTO ss_oper_role_assign(ROLE_ID, OPER_ID) VALUES(1, 1);
/*初始化菜单*/
/*英文*/
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) VALUES
	(100, 0, 'Device Management', NULL, 'iconfont icon-am-start', '', '4', 'en'),
	(110, 100, 'Meter Type Management', '/runningManagement/device/show.do?menuId=110', 'icon-double-angle-right', '', '41', 'en'),
	(120, 100, 'Device Profile', '/runningManagement/instrument/show.do?menuId=120', 'icon-double-angle-right', '', '42', 'en'),
	(130, 300, 'Customer Profile', '/system/customer/show.do?menuId=130', 'icon-double-angle-right', '', '61', 'en'),
	(140, 100, 'Read on Demand', '/runningManagement/dataMeasurement/show.do?menuId=140', 'icon-double-angle-right', '', '43', 'en'),
	(170, 100, 'Remote Control', '/runningManagement/messageValidate.do?menuId=170', 'icon-double-angle-right', '', '44', 'en'),
	(180, 100, 'Data Inquiry', '/runningManagement/dataQuery/show.do?menuId=180', 'icon-double-angle-right', '', '45', 'en'),
	(190, 100, 'Valve Control', '/manualValve/show.do?menuId=190', 'icon-double-angle-right', '', '46', 'en'),
	(200, 0, 'Administration', NULL, 'iconfont icon-xitongguanli', '', '3', 'en'),
	(210, 200, 'Utility Management', '/system/dept/show.do?menuId=210', 'icon-double-angle-right', '', '31', 'en'),
	(220, 200, 'User Management', '/system/author/show.do?menuId=220', 'icon-double-angle-right', '', '32', 'en'),
	(240, 200, 'Region Management', '/system/region/show.do?menuId=240', 'icon-double-angle-right', '', '33', 'en'),
	(300, 0, 'Customer Management', NULL, 'iconfont icon-fcstubiao', '', '6', 'en'),
	(400, 0, 'Meter Reading', NULL, 'iconfont icon-bi', '', '5', 'en'),
	(410, 400, 'Reading Booklet', '/meterReading/book/show.do?menuId=410', 'icon-double-angle-right', '', '51', 'en'),
	(420, 400, 'Reading Plan', '/meterReading/meterPlan/show.do?menuId=420', 'icon-double-angle-right', '', '52', 'en'),
	(430, 400, 'Reading Process', '/meterReading/execute/show.do?menuId=430', 'icon-double-angle-right', '', '53', 'en'),
	(450, 400, 'Auditing and Releasing', '/meterReading/check/showMeterRecordCheck.do?menuId=450', 'icon-double-angle-right', '', '54', 'en'),
	(500, 0, 'Services', NULL, 'iconfont icon-ai-briefcase', '', '2', 'en'),
	(520, 500, 'Registration', '/transactBusiness/openCustomer/showOpenCustomer.do?menuId=520', 'icon-double-angle-right', '', '21', 'en'),
	(700, 0, 'My Workbench', NULL, 'iconfont icon-iconwodegongzuotai', '', '1', 'en'),
	(710, 700, 'My Task', '/myTask/meterTask/show.do?menuId=710', 'icon-double-angle-right', '', '11', 'en'),
	(440, 400, 'Released Record', '/meterReading/pub/showMeterRecordPubList.do?menuId=440', 'icon-double-angle-right', '', '55', 'en');
  /*初始化菜单表（ss_menu）：中文版*/
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
 VALUES ('1', '0', '运行管理', NULL, 'iconfont icon-am-start', NULL, '4', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('2', '0', '系统管理', NULL, 'iconfont icon-xitongguanli', NULL, '3', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('3', '0', '客户管理', NULL, 'iconfont icon-fcstubiao', NULL, '6', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('4', '0', '抄表管理', NULL, 'iconfont icon-bi', NULL, '5', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
 VALUES ('5', '0', '业务办理', NULL, 'iconfont icon-ai-briefcase', NULL, '2', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
 VALUES ('7', '0', '我的工作台', NULL, 'iconfont icon-iconwodegongzuotai', NULL, '1', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('8', '0', '计费管理', NULL, 'iconfont icon-jifeiguize', NULL, '7', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('9', '0', '预付费管理', NULL, 'iconfont icon-yufukuan', NULL, '8', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('11', '1', '设备库管理', '/runningManagement/device/show.do?menuId=11', 'icon-double-angle-right', NULL, '41', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('12', '1', '档案管理', '/runningManagement/instrument/show.do?menuId=12', 'icon-double-angle-right', NULL, '42', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('13', '3', '燃气客户档案', '/system/customer/show.do?menuId=13', 'icon-double-angle-right', NULL, '61', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('14', '1', '数据召测', '/runningManagement/dataMeasurement/show.do?menuId=14', 'icon-double-angle-right', NULL, '45', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('15', '1', '开通管理', '/runningManagement/open/show.do?menuId=15', 'icon-double-angle-right', NULL, '44', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('16', '1', '物联网表任务管理', '/runningManagement/thingsTask/show.do?menuId=16', 'icon-double-angle-right', NULL, '47', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('17', '1', '参数管理', '/runningManagement/messageValidate.do?menuId=17', 'icon-double-angle-right', NULL, '43', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('18', '1', '数据查询', '/runningManagement/dataQuery/show.do?menuId=18', 'icon-double-angle-right', NULL, '46', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('19', '1', '手动阀控', '/manualValve/show.do?menuId=19', 'icon-double-angle-right', '', '48', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('21', '2', '组织管理', '/system/dept/show.do?menuId=21', 'icon-double-angle-right', NULL, '31', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('22', '2', '操作权限', '/system/author/show.do?menuId=22', 'icon-double-angle-right', NULL, '32', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('23', '2', '系统维护', '/system/regionUpload/show.do?menuId=23', 'icon-double-angle-right', NULL, '33', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('24', '2', '区域管理', '/system/region/show.do?menuId=24', 'icon-double-angle-right', NULL, '34', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('32', '3', '计量点管理', '/system/measuringPoint/showMeasuringPoint.do?menuId=32', 'icon-double-angle-right', NULL, '62', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('33', '3', '客户细分管理', '/system/subdivideCustomerStandard/show.do?menuId=33', 'icon-double-angle-right', NULL, '63', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('41', '4', '抄表册管理', '/meterReading/book/show.do?menuId=41', 'icon-double-angle-right', NULL, '51', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('42', '4', '抄表计划管理', '/meterReading/meterPlan/show.do?menuId=42', 'icon-double-angle-right', NULL, '52', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('43', '4', '执行抄表', '/meterReading/execute/show.do?menuId=43', 'icon-double-angle-right', NULL, '53', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('44', '4', '发布数据记录', '/meterReading/pub/showMeterRecordPubList.do?menuId=44', 'icon-double-angle-right', NULL, '55', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('45', '4', '抄表结果审核', '/meterReading/check/showMeterRecordCheck.do?menuId=45', 'icon-double-angle-right', NULL, '54', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('51', '5', '批量安装列表', '/transactBusiness/batchInstall/show.do?menuId=51', 'icon-double-angle-right', NULL, '22', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('52', '5', '开户', '/transactBusiness/openCustomer/showOpenCustomer.do?menuId=52', 'icon-double-angle-right', NULL, '21', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('54', '5', '申请开通', '/transactBusiness/applyOpen/show.do?menuId=54', 'icon-double-angle-right', NULL, '23', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('71', '7', '我的任务', '/myTask/meterTask/show.do?menuId=71', 'icon-double-angle-right', NULL, '11', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('81', '8', '计费规划', '/chargeManagement/priceManagement/show.do?menuId=81', 'icon-double-angle-right', NULL, '71', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('91', '9', '后台预付费', '/prepay/groupPrepay/show.do?menuId=91', 'icon-double-angle-right', NULL, '81', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) 
VALUES ('55', '5', '扩频组网运维', '/transactBusiness/spspNetworkMaintain/show.do?menuId=55', 'icon-double-angle-right', NULL, '24', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) VALUES
	('46', '4', '结算抄表成功率分析', '/meterReading/analysis/show.do?menuId=46', 'icon-double-angle-right', NULL, '64', 'zh');
/*初始化权限*/

/*英文版菜单权限*/
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
 VALUES(129, '1', 100);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(130, '1', 200);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(131, '1', 300);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(132, '1', 110);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(133, '1', 120);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(134, '1', 210);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(135, '1', 220);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(137, '1', 240);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(138, '1', 130);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(139, '1', 420);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(140, '1', 400);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(262, '1', 430);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(141, '1', 410);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(143, '1', 450);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(144, '1', 710);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(145, '1', 700);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(146, '1', 140);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(148, '1', 500);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(149, '1', 520);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(157, '1', 170);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
 VALUES(158, '1', 180);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
VALUES(162, '1', 190);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
 VALUES(267, '1', 440);
 
/*初始化操作权限：en*/
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(163, '2', 1001);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(164, '2', 1002);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(165, '2', 1003);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(166, '2', 1004);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(168, '2', 1006);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(169, '2', 1007);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(170, '2', 1008);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(171, '2', 1009);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(173, '2', 1011);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(174, '2', 1012);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(175, '2', 1013);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(176, '2', 1014);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(178, '2', 1016);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(179, '2', 1017);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(180, '2', 1018);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(181, '2', 1019);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(183, '2', 1021);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(184, '2', 1022);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(185, '2', 1023);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(186, '2', 1024);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(193, '2', 1031);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(194, '2', 1032);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(195, '2', 1033);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(196, '2', 1034);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(198, '2', 1036);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(199, '2', 1037);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(200, '2', 1038);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(203, '2', 1041);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(204, '2', 1042);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(205, '2', 1043);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(208, '2', 1046);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(218, '2', 1056);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(223, '2', 1061);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(228, '2', 1066);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(232, '2', 1083);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(247, '2', 1098);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(250, '2', 1101);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(253, '2', 1104);
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
  VALUES(268, '2', 1202);

  /*初始化权限表（ss_privilege）中文*/
/*初始化一级菜单权限 zh*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('1', '1', '1');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('2', '1', '2');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('3', '1', '3');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('17', '1', '4');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('22', '1', '7');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('91', '1', '5');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('100', '1', '8');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('121', '1', '9');

/*初始化二级菜单权限 zh*/
/*运行管理*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('4', '1', '11');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('5', '1', '12');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('83', '1', '14');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('95', '1', '15');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('99', '1', '16');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('114', '1', '17');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('119', '1', '18');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('126', '1', '19');
/*系统管理*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('6', '1', '21');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('7', '1', '22');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('8', '1', '23');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('9', '1', '24');
/*客户管理*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('15', '1', '13');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('106', '1', '32');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('112', '1', '33');
/*抄表管理*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('16', '1', '42');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('18', '1', '43');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('19', '1', '41');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('89', '1', '44');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('20', '1', '45');
/*业务办理*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('260', '1', '51');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('92', '1', '52');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('93', '1', '54');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('265', '1', '55');
/*我的工作台*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('21', '1', '71');
/*计费管理*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('101', '1', '81');
/*预付费管理*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('122', '1', '91');

/*初始化操作权限 zh*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('10', '2', '1');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('11', '2', '2');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('12', '2', '3');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('13', '2', '4');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('23', '2', '6');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('24', '2', '7');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('25', '2', '8');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('26', '2', '9');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('28', '2', '11');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('29', '2', '12');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('30', '2', '13');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('31', '2', '14');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('33', '2', '16');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('34', '2', '17');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('35', '2', '18');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('36', '2', '19');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('38', '2', '21');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('39', '2', '22');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('40', '2', '23');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('43', '2', '26');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('48', '2', '31');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('49', '2', '32');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('50', '2', '33');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('51', '2', '34');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('53', '2', '36');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('54', '2', '37');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('55', '2', '38');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('58', '2', '41');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('59', '2', '42');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('60', '2', '43');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('63', '2', '46');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('68', '2', '51');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('73', '2', '56');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('78', '2', '61');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('84', '2', '84');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('90', '2', '80');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('261', '2', '81');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('94', '2', '66');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('96', '2', '87');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('97', '2', '82');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('98', '2', '83');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('102', '2', '88');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('103', '2', '89');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('105', '2', '91');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('107', '2', '92');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('108', '2', '93');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('109', '2', '94');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('110', '2', '95');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('113', '2', '97');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('115', '2', '98');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('116', '2', '99');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('117', '2', '100');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('120', '2', '101');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('123', '2', '102');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('127', '2', '104');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('255', '2', '1106');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('256', '2', '1107');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('257', '2', '1108');

INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('263', '2', '1200');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('264', '2', '1201');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('266', '2', '103');

  /*初始化操作表数据*/

  /*初始化操作表数据：英文版*/

   /*设备库管理*/
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1001, 'Inquire', '00', '222', '0', '1', '110', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1002, 'Add', '01', '', '0', '2', '110', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1003, 'Edit', '02', '22', '0', '3', '110', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1004, 'Delete', '03', '22', '0', '4', '110', 'en');
/*档案管理*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1006, 'Inquire', '00', '222', '0', '1', '120', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1007, 'Add', '01', '', '0', '2', '120', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1008, 'Edit', '02', '22', '0', '3', '120', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1009, 'Delete', '03', '22', '0', '4', '120', 'en');
 /*数据招测*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1066, 'Inquire', '00', '22', '0', '1', '140', 'en');
 /*参数管理*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1098, 'Read', '08', '222', '0', '1', '170', 'en');
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1201, 'Set', '09', '222', '0', '2', '170', 'en');
  /*数据查询*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1101, 'Inquire', '00', '222', '0', '1', '180', 'en');
  /*手动阀控*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1104, 'Inquire', '00', '222', '0', '1', '190', 'en');
  /*组织管理*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1016, 'Inquire', '00', '222', '0', '1', '210', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1017, 'Add', '01', '', '0', '2', '210', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1018, 'Edit', '02', '22', '0', '3', '210', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1019, 'Delete', '03', '22', '0', '4', '210', 'en');
  /*操作权限*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1021, 'Inquire', '00', '222', '0', '1', '220', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1022, 'Add', '01', '', '0', '2', '220', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1023, 'Edit', '02', '22', '0', '3', '220', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1024, 'Delete', '03', '22', '0', '4', '220', 'en');
  /*区域管理*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1031, 'Inquire', '00', '222', '0', '1', '240', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1032, 'Add', '01', '', '0', '2', '240', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1033, 'Edit', '02', '22', '0', '3', '240', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1034, 'Delete', '03', '22', '0', '4', '240', 'en');
  /*客户档案管理*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1011, 'Inquire', '00', '222', '0', '1', '130', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1012, 'Add', '01', '', '0', '2', '130', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1013, 'Edit', '02', '22', '0', '3', '130', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1014, 'Delete', '03', '22', '0', '4', '130', 'en'); 
  /*抄表册管理*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1036, 'Inquire', '00', '222', '0', '1', '410', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1037, 'Add', '01', '', '0', '2', '410', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1038, 'Edit', '02', '22', '0', '3', '410', 'en');
  /*抄表计划管理*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1041, 'Inquire', '00', '222', '0', '1', '420', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1042, 'Add', '01', '', '0', '2', '420', 'en');
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1043, 'Edit', '02', '22', '0', '3', '420', 'en');
  /*执行抄表*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1046, 'Inquire', '00', '222', '0', '1', '430', 'en');
  /*抄表结果审核*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1056, 'Inquire', '00', '222', '0', '1', '450', 'en');
   /*开户*/
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1083, 'Add', '01', '22', '0', '2', '520', 'en'); 
 /*我的任务*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1061, 'Inquire', '00', '222', '0', '1', '710', 'en');
/*发布数据记录*/
  INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1202, 'Inquire', '00', '222', '0', '1', '440', 'en');
  
/*初始化操作表（ss_operation）：中文版*/
/*设备库管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('1', '查看', '00', '222', '0', '1', '11', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`)
 VALUES ('2', '新增', '01', '', '0', '2', '11', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`)
 VALUES ('3', '编辑', '02', '22', '0', '3', '11', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('4', '删除', '03', '22', '0', '4', '11', 'zh');
/*档案管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('6', '查看', '00', '222', '0', '1', '12', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`)
 VALUES ('7', '新增', '01', '', '0', '2', '12', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('8', '编辑', '02', '22', '0', '3', '12', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('9', '删除', '03', '22', '0', '4', '12', 'zh');
/*数据召测*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('66', '查看', '00', '22', '0', '1', '14', 'zh');
/*开通管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('87', '查看', '00', '222', '0', '1', '15', 'zh');
/*物联网表任务管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('1106', '查看', '00', '222', '0', '1', '16', 'zh');
/*参数管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('98', '读取', '08', '222', '0', '1', '17', 'zh');

INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('1200', '设置', '09', '222', '0', '2', '17', 'zh');
/*数据查询*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('101', '查看', '00', '222', '0', '1', '18', 'zh');
/*手动阀控*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('104', '查看', '00', '222', '0', '1', '19', 'zh');
/*组织管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('16', '查看', '00', '222', '0', '1', '21', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('17', '新增', '01', '', '0', '2', '21', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('18', '编辑', '02', '22', '0', '3', '21', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('19', '删除', '03', '22', '0', '4', '21', 'zh');
/*操作权限*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('23', '编辑', '02', '22', '0', '3', '22', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('22', '新增', '01', '', '0', '2', '22', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('21', '查看', '00', '222', '0', '1', '22', 'zh');
/*系统维护*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('26', '新增', '00', '222', '0', '1', '23', 'zh');
/*区域管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('31', '查看', '00', '222', '0', '1', '24', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('32', '新增', '01', '', '0', '2', '24', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('33', '编辑', '02', '22', '0', '3', '24', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('34', '删除', '03', '22', '0', '4', '24', 'zh');
/*燃气客户档案*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('11', '查看', '00', '222', '0', '1', '13', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('12', '新增', '01', '', '0', '2', '13', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('13', '编辑', '02', '22', '0', '3', '13', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('14', '删除', '03', '22', '0', '4', '13', 'zh');
/*计量点管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('95', '删除', '03', '22', '0', '4', '32', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('94', '编辑', '02', '22', '0', '3', '32', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('93', '新增', '01', '22', '0', '2', '32', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('92', '查看', '00', '222', '0', '1', '32', 'zh');
/*客户细分管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('97', '查看', '00', '222', '0', '1', '33', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('99', '新增', '01', '22', '0', '2', '33', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('100', '编辑', '02', '22', '0', '3', '33', 'zh');
/*抄表册管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('36', '查看', '00', '222', '0', '1', '41', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('37', '新增', '01', '', '0', '2', '41', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('38', '编辑', '02', '22', '0', '3', '41', 'zh');
/*抄表计划管理*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('43', '编辑', '02', '22', '0', '3', '42', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('42', '新增', '01', '', '0', '2', '42', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('41', '查看', '00', '222', '0', '1', '42', 'zh');
/*执行抄表*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('46', '查看', '00', '222', '0', '1', '43', 'zh');
/*发布数据记录*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('51', '查看', '00', '222', '0', '1', '44', 'zh');
/*抄表结果审核*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('56', '查看', '00', '222', '0', '1', '45', 'zh');
/*批量安装列表*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('80', '查看', '01', '22', '0', '1', '51', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('81', '新增', '02', '22', '0', '2', '51', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('1107', '编辑', '02', '22', '0', '3', '51', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('1108', '删除', '03', '22', '0', '4', '51', 'zh');
/*开户*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('82', '查看', '00', '222', '0', '1', '52', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('83', '新增', '01', '22', '0', '2', '52', 'zh');
/*申请开通*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('84', '查看', '20', '6', '0', '1', '54', 'zh');
/*我的任务*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('61', '查看', '00', '222', '0', '1', '71', 'zh');
/*计费规划*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('91', '编辑', '02', '22', '0', '3', '81', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('89', '新增', '01', NULL, '0', '2', '81', 'zh');
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('88', '查看', '00', '222', '0', '1', '81', 'zh');
/*后台预付费*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('102', '查看', '00', '22', '0', '1', '91', 'zh');
/*扩频组网运维*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('103', '查看', '00', '22', '0', '1', '55', 'zh');

  /*初始化系统管理员操所权限*/

  /*初始化系统管理员操所权限：en*/

INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 130);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 134);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 135);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 178);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 179);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 180);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 181);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 183);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 184);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 185);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 186);
 /*初始化系统管理员操所权限：zh*/
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 2);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 6);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 7);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 8);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 33);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 34);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 35);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 36);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 38);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 39);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 40);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 41);
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 43);


/*初始化字典表数据*/
INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
	(1, 'AC0001', 'zh', '01', 'GPRS/CDMA'),
	(2, 'AC0001', 'zh', '02', '3G'),
	(3, 'AC0001', 'zh', '03', '4G'),
	(4, 'AC0001', 'zh', '04', 'SMS（短信）'),
	(5, 'AC0001', 'zh', '05', 'ITHERNET'),
	(14, 'AF0001', 'zh', '01', '新购暂管入库'),
	(15, 'AF0001', 'zh', '02', '新购验收入库'),
	(16, 'AF0001', 'zh', '03', '新购直接入库'),
	(17, 'AF0001', 'zh', '04', '检定/检测返回入库'),
	(18, 'AF0001', 'zh', '05', '拆回入库'),
	(19, 'AF0001', 'zh', '06', '配送入库'),
	(20, 'AF0001', 'zh', '07', '预领退回入库'),
	(21, 'AF0001', 'zh', '08', '领出未装入库'),
	(22, 'AF0001', 'zh', '09', '厂返更换入库'),
	(23, 'AF0001', 'zh', '10', '用户资产移交入库'),
	(24, 'AF0001', 'zh', '11', '盘盈资产入库'),
	(25, 'AF0001', 'zh', '20', '新购暂管出库'),
	(26, 'AF0001', 'zh', '21', '待检定/校准出库'),
	(27, 'AF0001', 'zh', '22', '新装出库'),
	(28, 'AF0001', 'zh', '23', '更换用出库'),
	(29, 'AF0001', 'zh', '24', '预领待装出库'),
	(30, 'AF0001', 'zh', '25', '配送出库'),
	(31, 'AF0001', 'zh', '26', '报废出库'),
	(32, 'AF0001', 'zh', '27', '退厂出库'),
	(33, 'AF0001', 'zh', '28', '其它领用出库'),
	(34, 'AF0001', 'zh', '30', '安装未开通'),
	(35, 'AF0001', 'zh', '31', '开通（正常使用）'),
	(36, 'AF0001', 'zh', '32', '维修'),
	(37, 'AM0001', 'zh', '01', 'SIM卡'),
	(38, 'AM0001', 'zh', '02', '掌上电脑'),
	(39, 'AM0001', 'zh', '03', '便携打印机'),
	(40, 'AM0002', 'zh', '01', '入库'),
	(41, 'AM0002', 'zh', '02', '领用'),
	(42, 'AM0002', 'zh', '03', '投入运行'),
	(43, 'AM0002', 'zh', '04', '维修'),
	(44, 'AM0002', 'zh', '05', '报废'),
	(45, 'AM0002', 'zh', '06', '转移'),
	(46, 'AM0002', 'zh', '07', '租借'),
	(47, 'AS0001', 'zh', '01', 'IC充值卡'),
	(48, 'AS0001', 'zh', '02', '设置卡'),
	(49, 'AS0001', 'zh', '03', '转存卡'),
	(50, 'AS0001', 'zh', '04', '清除卡'),
	(51, 'AS0001', 'zh', '20', '掌机'),
	(52, 'AS0001', 'zh', '21', '打印机'),
	(53, 'AS0001', 'zh', '22', '移动采集器'),
	(54, 'AS0001', 'zh', '23', '中继器'),
	(55, 'AS0002', 'zh', '01', '入仓库'),
	(56, 'AS0002', 'zh', '02', '领用'),
	(57, 'AS0002', 'zh', '03', '使用中'),
	(58, 'AS0002', 'zh', '04', '维修'),
	(59, 'AS0002', 'zh', '05', '报废'),
	(60, 'BK0001', 'zh', '01', '抄表机抄表'),
	(61, 'BK0001', 'zh', '02', '远传抄表'),
	(62, 'BK0001', 'zh', '03', '主动上告'),
	(63, 'BK0002', 'zh', '01', '已生成计划'),
	(64, 'BK0002', 'zh', '02', '未生成计划'),
	(65, 'CD0001', 'zh', '01', '数值型'),
	(66, 'CD0001', 'zh', '02', '字符型'),
	(67, 'CD0001', 'zh', '03', '布尔型'),
	(68, 'CD0001', 'zh', '04', '枚举型'),
	(69, 'DC0001', 'zh', '01', '集中器'),
	(70, 'DC0001', 'zh', '02', '采集器'),
	(71, 'DC0001', 'zh', '03', '中继器'),
	(77, 'DT0001', 'zh', '20', '第三方机构（如收费代理）'),
	(78, 'GD0001', 'zh', '0', '显示'),
	(79, 'GD0001', 'zh', '1', '不显示'),
	(84, 'MM0002', 'zh', '01', 'RF组网'),
	(85, 'MM0002', 'zh', '02', 'RF扩频组网'),
	(86, 'MM0002', 'zh', '03', 'RF点抄'),
	(87, 'MM0002', 'zh', '04', 'RS232(485)'),
	(88, 'MM0002', 'zh', '05', 'WIFI'),
	(89, 'MM0002', 'zh', '06', '蓝牙'),
	(95, 'MM0005', 'zh', '01', '霍尔'),
	(96, 'MM0005', 'zh', '02', '光电'),
	(97, 'MM0005', 'zh', '03', '超声波'),
	(98, 'MM0006', 'zh', '00', '不能充值（N/A）'),
	(99, 'MM0006', 'zh', '01', 'IC卡充气'),
	(100, 'MM0006', 'zh', '02', 'IC卡充钱'),
	(101, 'MM0006', 'zh', '03', '远程充气'),
	(102, 'MM0006', 'zh', '04', '远程充钱'),
	(103, 'MM0006', 'zh', '05', 'IC+远程充气'),
	(104, 'MM0006', 'zh', '06', 'IC+远程充钱'),
	(105, 'MM0006', 'zh', '07', 'NFC充气'),
	(106, 'MM0006', 'zh', '08', 'NFC充钱'),
	(107, 'MM0007', 'zh', '01', '碱性电池'),
	(108, 'MM0007', 'zh', '02', '锂电池'),
	(109, 'MP0001', 'zh', '00', '无阀门'),
	(110, 'MP0001', 'zh', '01', '开'),
	(111, 'MP0001', 'zh', '02', '关'),
	(112, 'MP0001', 'zh', '03', '半开'),
	(113, 'MP0001', 'zh', '04', '不确定'),
	(114, 'MP0002', 'zh', '00', '不自动上告'),
	(115, 'MP0002', 'zh', '01', '每分钟'),
	(116, 'MP0002', 'zh', '02', '每小时'),
	(117, 'MP0002', 'zh', '03', '每天'),
	(118, 'MP0002', 'zh', '04', '每月'),
	(119, 'MP0002', 'zh', '05', '每两月'),
	(120, 'MP0002', 'zh', '10', '单月'),
	(121, 'MP0002', 'zh', '11', '双月'),
	(122, 'MP0002', 'zh', '13', '按时'),
	(123, 'MP0002', 'zh', '14', '按天'),
	(124, 'MP0002', 'zh', '15', '指定2时'),
	(125, 'MP0002', 'zh', '16', '指定2日'),
	(126, 'MP0003', 'zh', '01', '小时冻结'),
	(127, 'MP0003', 'zh', '02', '日冻结'),
	(128, 'MP0003', 'zh', '03', '月冻结'),
	(150, 'OG0001', 'zh', '01', '国家定义区域'),
	(151, 'OG0001', 'zh', '02', '小区'),
	(152, 'OG0001', 'zh', '03', '楼栋'),
	(153, 'OP0001', 'zh', '00', '注销'),
	(154, 'OP0001', 'zh', '01', '有效'),
	(155, 'OP0001', 'zh', '02', '禁用'),
	(166, 'OT0002', 'zh', '00', '有效'),
	(167, 'OT0002', 'zh', '01', '无效'),
	(168, 'PN0001', 'zh', '02', '月抄'),
	(169, 'PN0001', 'zh', '01', '双月抄'),
	(170, 'PN0001', 'zh', '03', '半月抄'),
	(171, 'PN0001', 'zh', '04', '周抄'),
	(172, 'PN0001', 'zh', '05', '日抄'),
	(173, 'PN0002', 'zh', '01', '未执行'),
	(174, 'PN0002', 'zh', '02', '执行中'),
	(175, 'PN0002', 'zh', '03', '已过期'),
	(176, 'PN0003', 'zh', '01', '已生成计划'),
	(177, 'PN0003', 'zh', '02', '未生成计划'),
	(178, 'PN0004', 'zh', '01', '日常计划'),
	(179, 'PN0004', 'zh', '02', '临时计划'),
	(180, 'RD0001', 'zh', '01', '绑定'),
	(181, 'RD0001', 'zh', '02', '解除绑定'),
	(182, 'RG0001', 'zh', '01', '总公司'),
	(183, 'RG0001', 'zh', '02', '分公司'),
	(184, 'RG0001', 'zh', '03', '部门'),
	(185, 'RG0001', 'zh', '04', '营业厅'),
	(186, 'RG0001', 'zh', '05', '抄表班'),
	(187, 'RG0001', 'zh', '06', '核算班'),
	(188, 'RG0001', 'zh', '07', '计费班'),
	(189, 'RG0001', 'zh', '08', '计量班'),
	(190, 'RO0001', 'zh', '1', '系统预定义角色'),
	(191, 'RO0001', 'zh', '2', '用户自定义角色'),
	(192, 'RO0002', 'zh', '01', '有效'),
	(193, 'RO0002', 'zh', '02', '失效'),
	(194, 'RO0002', 'zh', '03', '删除'),
	(195, 'SM0001', 'zh', '01', '移动网联网'),
	(196, 'SM0001', 'zh', '02', '移动公网'),
	(197, 'SM0001', 'zh', '03', '电信物联网'),
	(198, 'SM0001', 'zh', '04', '电信公网'),
	(199, 'SM0002', 'zh', '00', '未知'),
	(200, 'SM0002', 'zh', '01', '未欠费'),
	(201, 'SM0002', 'zh', '02', '欠费'),
	(202, 'SM0003', 'zh', '00', '入库'),
	(203, 'SM0003', 'zh', '01', '领用'),
	(204, 'SM0003', 'zh', '02', '使用'),
	(205, 'SM0003', 'zh', '03', '维修'),
	(206, 'SM0003', 'zh', '04', '报废'),
	(207, 'SM0003', 'zh', '05', '欠费'),
	(208, 'TS0001', 'zh', '01', '抄表任务'),
	(209, 'TS0001', 'zh', '02', '表计初始化任务'),
	(210, 'TS0001', 'zh', '03', '表计安装任务'),
	(211, 'TS0001', 'zh', '04', '批量调价任务'),
	(212, 'TS0001', 'zh', '05', '故障排查任务'),
	(213, 'TS0001', 'zh', '06', '户内安检任务'),
	(214, 'TS0002', 'zh', '01', '未打开'),
	(215, 'TS0002', 'zh', '02', '已接收'),
	(216, 'TS0002', 'zh', '03', '已完成'),
	(217, 'TS0002', 'zh', '04', '已超期'),
	(218, 'TS0003', 'zh', '01', '未执行'),
	(219, 'TS0003', 'zh', '02', '执行中'),
	(220, 'TS0003', 'zh', '03', '已过期'),
	(256, 'MT0004', 'zh', '00', '虚拟表计'),
	(257, 'MT0004', 'zh', '01', '电表'),
	(258, 'MT0004', 'zh', '02', '气表'),
	(259, 'MT0004', 'zh', '03', '水表'),
	(260, 'MT0004', 'zh', '04', '热表'),
	(261, 'MT0005', 'zh', '00', '基表'),
	(262, 'MT0005', 'zh', '01', 'RF远程表'),
	(263, 'MT0005', 'zh', '02', 'RF点抄表'),
	(264, 'MT0005', 'zh', '03', '物联网表'),
	(265, 'MT0005', 'zh', '04', 'IC卡表'),
	(266, 'DC0003', 'zh', '00', '无远程通信/移动网络组网'),
	(267, 'DC0003', 'zh', '01', 'GPRS/CDMA'),
	(268, 'DC0003', 'zh', '02', '3G'),
	(269, 'DC0003', 'zh', '03', '4G'),
	(270, 'DC0003', 'zh', '05', 'ITHERNET'),
	(301, 'GC0002', 'zh', '01', '正常用气客户'),
	(302, 'GC0002', 'zh', '02', '当前新装客户'),
	(303, 'GC0002', 'zh', '03', '当前变更客户'),
	(304, 'GC0002', 'zh', '04', '已销户客户'),
	(305, 'GC0003', 'zh', '0', '地址建立并已开通'),
	(306, 'GC0003', 'zh', '1', '地址建立尚未开通'),
	(307, 'GC0003', 'zh', '2', '地址被拆除'),
	(308, 'GC0004', 'zh', '1', '一级'),
	(309, 'GC0004', 'zh', '2', '二级'),
	(310, 'GC0004', 'zh', '3', '三级'),
	(311, 'GC0004', 'zh', '4', '四级'),
	(312, 'GC0004', 'zh', '5', '五级'),
	(313, 'GC0005', 'zh', '1', 'A类'),
	(314, 'GC0005', 'zh', '2', 'B类'),
	(315, 'GC0005', 'zh', '3', 'C类'),
	(316, 'GC0006', 'zh', '0', '短信'),
	(317, 'GC0006', 'zh', '1', '电话'),
	(318, 'GC0006', 'zh', '2', '微信'),
	(319, 'GC0006', 'zh', '3', '邮件'),
	(320, 'GC0007', 'zh', '0', '无'),
	(321, 'GC0007', 'zh', '1', '已制'),
	(322, 'GC0007', 'zh', '2', '使用'),
	(323, 'GC0007', 'zh', '3', '挂失'),
	(326, 'GC0009', 'zh', '1', '业务办理类型'),
	(327, 'GC0009', 'zh', '2', '安检联系类型'),
	(328, 'GC0009', 'zh', '3', '财务联系类型'),
	(329, 'GC0010', 'zh', '0', '无'),
	(330, 'GC0010', 'zh', '1', '银行'),
	(331, 'GC0010', 'zh', '2', '微信'),
	(332, 'GC0010', 'zh', '3', '支付宝'),
	(333, 'GC0010', 'zh', '4', '其他'),
	(334, 'GC0011', 'zh', '0', '自然通风'),
	(335, 'GC0011', 'zh', '1', '强制通风'),
	(339, 'GC0013', 'zh', '1', '明设'),
	(340, 'GC0013', 'zh', '2', '暗埋'),
	(341, 'GC0014', 'zh', '1', '单位产权'),
	(342, 'GC0014', 'zh', '2', '自有产权'),
	(343, 'GC0014', 'zh', '3', '使用权'),
	(344, 'GC0014', 'zh', '4', '其他'),
	(345, 'GC0015', 'zh', '1', '楼房'),
	(346, 'GC0015', 'zh', '2', '平房'),
	(347, 'GC0015', 'zh', '3', '小二楼'),
	(348, 'GC0015', 'zh', '4', '高层'),
	(349, 'GC0015', 'zh', '5', '公寓'),
	(350, 'GC0015', 'zh', '6', '别墅'),
	(351, 'GC0015', 'zh', '7', '排屋'),
	(352, 'GC0016', 'zh', '1', '低压'),
	(353, 'GC0016', 'zh', '2', '中压'),
	(354, 'GC0016', 'zh', '3', '高压'),
	(548, 'BK0001', 'zh', '04', '人工抄表'),
	(557, 'MM0006', 'zh', '09', '蓝牙充值'),
	(558, 'RE0001', 'zh', '00', '初始状态'),
	(559, 'RE0001', 'zh', '01', '正常'),
	(560, 'RE0001', 'zh', '02', '未抄到'),
	(561, 'RE0001', 'zh', '03', '抄表异常'),
	(562, 'GC0017', 'zh', '1', '建设合同'),
	(563, 'GC0017', 'zh', '2', '工商业用户供气合同'),
	(564, 'GC0017', 'zh', '3', '居民用户供气合同'),
	(596, 'AC0004', 'zh', '401', 'mesh 预付费'),
	(597, 'AC0004', 'zh', '402', 'mesh 后付费'),
	(598, 'AC0004', 'zh', '403', 'mesh 深燃佛燃'),
	(599, 'AC0004', 'zh', '301', '民用物联网1.0'),
	(600, 'AC0004', 'zh', '302', '民用物联网2.0'),
	(601, 'AC0004', 'zh', '902', '民用物联网(杭天)2.0协议'),
	(602, 'AC0004', 'zh', '901', '民用物联网(杭天召读)1.0协议'),
	(603, 'AC0004', 'zh', '203', '商业物联网3.0协议'),
	(604, 'AC0004', 'zh', '201', '商业物联网1.0协议'),
	(605, 'AC0004', 'zh', '501', '商业物联网（杭天）协议'),
	(619, 'GC0018', 'zh', '01', '农、林、牧、渔业'),
	(620, 'GC0018', 'zh', '02', '采矿业'),
	(621, 'GC0018', 'zh', '03', '制造业'),
	(622, 'GC0018', 'zh', '04', '电力、燃气及水的生产和供应业'),
	(623, 'GC0018', 'zh', '05', '建筑业'),
	(624, 'GC0018', 'zh', '06', '交通运输、仓储和邮政业'),
	(625, 'GC0018', 'zh', '07', '信息传输、计算机服务和软件业'),
	(626, 'GC0018', 'zh', '08', '批发和零售业'),
	(627, 'GC0018', 'zh', '09', '住宿和餐饮业'),
	(628, 'GC0018', 'zh', '10', '金融业'),
	(629, 'GC0018', 'zh', '11', '房地产业'),
	(630, 'GC0018', 'zh', '12', '租赁和商务服务业'),
	(631, 'GC0018', 'zh', '13', '科学研究、技术服务和地质勘察业'),
	(632, 'GC0018', 'zh', '14', '水利、环境和公共设施管理业'),
	(633, 'GC0018', 'zh', '15', '居民服务和其他服务业'),
	(634, 'GC0018', 'zh', '16', '教育业'),
	(635, 'GC0018', 'zh', '17', '卫生、社会保障和社会福利业'),
	(647, 'OM0001', 'zh', '00', '未开通'),
	(648, 'OM0001', 'zh', '01', '开通成功'),
	(649, 'OM0001', 'zh', '02', '开通失败'),
	(655, 'OST001', 'zh', '1', '初始化'),
	(656, 'OST001', 'zh', '2', '参数读取'),
	(657, 'OST001', 'zh', '3', '参数设置'),
	(658, 'OST001', 'zh', '4', '群抄表'),
	(659, 'OST002', 'zh', '01', '未下发'),
	(660, 'OST002', 'zh', '02', '已下发'),
	(661, 'OST002', 'zh', '03', '发送成功'),
	(662, 'OST002', 'zh', '04', '发送失败'),
	(663, 'OST003', 'zh', '1', '后台调度'),
	(664, 'OST003', 'zh', '2', '前置机调度'),
	(665, 'OST004', 'zh', '01', '成功'),
	(666, 'OST004', 'zh', '02', '成功'),
	(667, 'OST004', 'zh', '03', '对应阀门状态'),
	(670, 'OST001', 'zh', '5', '单抄表'),
	(671, 'OST001', 'zh', '6', '远程调价'),
	(672, 'OST001', 'zh', '7', '远程阀控'),
	(673, 'OST001', 'zh', '8', '校时'),
	(674, 'OST005', 'zh', '1', '出厂模板'),
	(675, 'OST005', 'zh', '2', '运行模板'),
	(676, 'MT0006', 'zh', '0', '未初始化'),
	(677, 'MT0006', 'zh', '1', '初始化成功'),
	(678, 'GC0019', 'zh', '01', '客户表'),
	(679, 'GC0019', 'zh', '02', '关口表'),
	(680, 'GC0020', 'zh', '01', '结算'),
	(681, 'GC0020', 'zh', '02', '考核'),
	(682, 'GC0021', 'zh', '0', '厨房'),
	(683, 'GC0021', 'zh', '1', '过道'),
	(684, 'GC0021', 'zh', '2', '阳台'),
	(685, 'GC0021', 'zh', '3', '户外'),
	(686, 'GC0021', 'zh', '4', '其他'),
	(1000, 'MT0007', 'zh', '01', 'RF远程表'),
	(1001, 'MT0007', 'zh', '02', 'RF点抄表'),
	(1002, 'MT0007', 'zh', '03', '物联网表'),
	(1011, 'PG0002', 'zh', '0', '编辑'),
	(1012, 'PG0002', 'zh', '1', '发布'),
	(1013, 'PG0002', 'zh', '2', '执行'),
	(1014, 'PG0002', 'zh', '3', '失效'),
	(1015, 'PG0002', 'zh', '4', '禁用'),
	(1016, 'PG0003', 'zh', '0', '月度'),
	(1017, 'PG0003', 'zh', '1', '年度'),
	(1018, 'PG0003', 'zh', '2', '双月'),
	(1019, 'PG0003', 'zh', '3', '半年'),
	(1020, 'PG0003', 'zh', '4', '周'),
	(1021, 'PG0003', 'zh', '5', '季度'),
	(1022, 'MS0001', 'zh', '00', '异常命令'),
	(1023, 'MS0001', 'zh', '01', '欠费待阀控'),
	(1024, 'MS0002', 'zh', '00', '未读'),
	(1025, 'MS0002', 'zh', '01', '已读'),
	(1026, 'MS0001', 'zh', '02', '余额预警'),
	(1027, 'CG0001', 'zh', '0', '私有'),
	(1028, 'CG0001', 'zh', '1', '公有'),
	(1055, 'PGC001', 'zh', '00', '正常'),
	(1056, 'PGC001', 'zh', '01', '少额预警'),
	(1057, 'PGC001', 'zh', '02', '少额告警'),
	(1058, 'PGC001', 'zh', '03', '透支'),
	(1059, 'PGC001', 'zh', '04', '欠费'),
	(1060, 'MS0001', 'zh', '03', '开阀'),
	(1066, 'MVC0001', 'zh', '1', '开阀'),
	(1067, 'MVC0001', 'zh', '0', '关阀'),
	(1070, 'MVC0002', 'zh', '0', '处理中'),
	(1071, 'MVC0002', 'zh', '1', '阀控成功'),
	(1072, 'MVC0002', 'zh', '2', '阀控失败'),
	(1073, 'MVC0002', 'zh', '4', '未发送'),
	(1074, 'MVC0002', 'zh', '5', '发送失败'),
	(1087, 'MP0001', 'zh', '08', '退出强制'),
	(1089, 'MP0001', 'zh', '06', '强制开'),
	(1090, 'MP0001', 'zh', '07', '强制关'),
	(1093, 'TS0001', 'zh', '07', '点火通气任务'),
	(1513, 'AC0001', 'en', '01', 'GPRS/CDMA'),
	(1514, 'AC0001', 'en', '02', '3G'),
	(1515, 'AC0001', 'en', '03', '4G'),
	(1516, 'AC0001', 'en', '04', 'SMS'),
	(1517, 'AC0001', 'en', '05', 'ITHERNET'),
	(1518, 'BK0001', 'en', '01', 'Walk-by'),
	(1519, 'BK0001', 'en', '02', 'AMI'),
	(1520, 'BK0001', 'en', '03', 'AMR'),
	(1521, 'BK0001', 'en', '04', 'Manual Reading'),
	(1522, 'BK0002', 'en', '01', 'In Reading Plan'),
	(1523, 'BK0002', 'en', '02', 'Not in Reading Plan'),
	(1524, 'MM0002', 'en', '01', 'RF Networking'),
	(1525, 'MM0002', 'en', '02', 'RF Networking(SP)'),
	(1526, 'MM0002', 'en', '03', 'RF Point Reading'),
	(1527, 'MM0002', 'en', '04', 'RS232(485)'),
	(1528, 'MM0002', 'en', '05', 'WIFI'),
	(1529, 'MM0002', 'en', '06', 'Bluetooth'),
	(1530, 'MM0003', 'zh', '11', '居民普通户'),
	(1531, 'MM0003', 'zh', '12', '居民低保户'),
	(1532, 'MM0003', 'zh', '13', '居民特困户'),
	(1533, 'MM0003', 'zh', '21', '工业用户'),
	(1534, 'MM0003', 'zh', '31', '商业用户'),
	(1535, 'MM0003', 'zh', '41', '公福用户'),
	(1536, 'MM0003', 'zh', '51', '其他'),
	(1537, 'MM0003', 'en', '11', 'Residential'),
	(1538, 'MM0003', 'en', '21', 'Industrial'),
	(1539, 'MM0003', 'en', '31', 'Commercial'),
	(1540, 'MM0003', 'en', '51', 'Other'),
	(1541, 'GC0001', 'zh', '01', '工业'),
	(1542, 'GC0001', 'zh', '02', '商业'),
	(1543, 'GC0001', 'zh', '03', '公福'),
	(1544, 'GC0001', 'zh', '04', '民用'),
	(1545, 'GC0001', 'zh', '05', '其它'),
	(1546, 'GC0001', 'en', '01', 'Industrial'),
	(1547, 'GC0001', 'en', '02', 'Commercial'),
	(1548, 'GC0001', 'en', '04', 'Residential'),
	(1549, 'GC0001', 'en', '05', 'Other'),
	(1550, 'GC0002', 'en', '01', 'In Normal Consumption'),
	(1551, 'GC0002', 'en', '02', 'New Customer'),
	(1552, 'GC0002', 'en', '03', 'Customer Info. Changed'),
	(1553, 'GC0002', 'en', '04', 'Cancelled Customer'),
	(1554, 'GC0003', 'en', '0', 'Available Address'),
	(1555, 'GC0003', 'en', '1', 'Unavailable Address'),
	(1556, 'GC0003', 'en', '2', 'Cancelled'),
	(1557, 'GC0004', 'en', '1', 'Level 1'),
	(1558, 'GC0004', 'en', '2', 'Level 2'),
	(1559, 'GC0004', 'en', '3', 'Level 3'),
	(1560, 'GC0004', 'en', '4', 'Level 4'),
	(1561, 'GC0004', 'en', '5', 'Level 5'),
	(1562, 'MM0004', 'zh', '01', '后付费'),
	(1563, 'MM0004', 'zh', '02', '后台预付费'),
	(1564, 'MM0004', 'zh', '03', '表计预付费'),
	(1565, 'MM0004', 'en', '01', 'Post-payment'),
	(1566, 'MM0004', 'en', '02', 'Prepayment in System'),
	(1567, 'MM0004', 'en', '03', 'Prepayment in Meter'),
	(1568, 'MM0005', 'en', '01', 'Hall'),
	(1569, 'MM0005', 'en', '02', 'Photoelectric'),
	(1570, 'MM0005', 'en', '03', 'Ultrasonic'),
	(1571, 'MM0006', 'en', '00', 'N/A'),
	(1572, 'MM0006', 'en', '01', 'IC Card (Volume)'),
	(1573, 'MM0006', 'en', '02', 'IC Card (Money)'),
	(1574, 'MM0006', 'en', '03', 'Remote (Volume)'),
	(1575, 'MM0006', 'en', '04', 'Remote (Money)'),
	(1576, 'MM0006', 'en', '05', 'IC Card and Remote (Volume)'),
	(1577, 'MM0006', 'en', '06', 'IC Card and Remote (Money)'),
	(1578, 'MM0006', 'en', '07', 'NFC (Volume)'),
	(1579, 'MM0006', 'en', '08', 'NFC (Money)'),
	(1580, 'MM0006', 'en', '09', 'Bluetooth(Money)'),
	(1581, 'MM0006', 'en', '10', 'Bluetooth(Volume)'),
	(1582, 'MM0007', 'en', '01', 'Alkaline Battery'),
	(1583, 'MM0007', 'en', '02', 'Li-battery'),
	(1584, 'MP0001', 'en', '01', 'No Valve'),
	(1585, 'MP0001', 'en', '02', 'Open'),
	(1586, 'MP0001', 'en', '03', 'Close'),
	(1587, 'MP0001', 'en', '04', 'Half-open'),
	(1588, 'MP0001', 'en', '05', 'Unknown'),
	(1589, 'MP0002', 'en', '00', 'Passive Report'),
	(1590, 'MP0002', 'en', '01', 'Every Minute'),
	(1591, 'MP0002', 'en', '02', 'Every Hour'),
	(1592, 'MP0002', 'en', '03', 'Everyday'),
	(1593, 'MP0002', 'en', '04', 'Every Month'),
	(1594, 'MP0002', 'en', '05', 'Every Two Months'),
	(1595, 'MP0002', 'en', '12', 'Minutes'),
	(1596, 'MP0002', 'en', '13', 'Hours'),
	(1597, 'MP0003', 'en', '00', 'Hours'),
	(1598, 'MP0003', 'en', '01', 'Days'),
	(1599, 'MP0003', 'en', '02', 'Months'),
	(1600, 'OG0001', 'en', '00', 'Administrative Area'),
	(1601, 'OG0001', 'en', '01', 'District'),
	(1602, 'OG0001', 'en', '02', 'Building'),
	(1603, 'OP0001', 'en', '00', 'Cancelled'),
	(1604, 'OP0001', 'en', '01', 'Available'),
	(1605, 'OP0001', 'en', '02', 'Disable'),
	(1606, 'OT0002', 'en', '00', 'Available'),
	(1607, 'OT0002', 'en', '01', 'Unavailable'),
	(1608, 'PN0001', 'en', '02', 'Month'),
	(1609, 'PN0001', 'en', '01', 'Two-month'),
	(1610, 'PN0001', 'en', '03', 'Half-month'),
	(1611, 'PN0001', 'en', '04', 'Week'),
	(1612, 'PN0001', 'en', '05', 'Day'),
	(1613, 'PN0002', 'en', '01', 'To be Excuted'),
	(1614, 'PN0002', 'en', '02', 'Executing'),
	(1615, 'PN0002', 'en', '03', 'Expired'),
	(1616, 'PN0003', 'en', '00', 'In Reading Plan'),
	(1617, 'PN0003', 'en', '01', 'Not in Reading Plan'),
	(1618, 'PN0004', 'en', '00', 'Normal Plan'),
	(1619, 'PN0004', 'en', '01', 'Temprary Plan'),
	(1620, 'RD0001', 'en', '00', 'Bound'),
	(1621, 'RD0001', 'en', '01', 'To be Bound'),
	(1622, 'RG0001', 'en', '00', 'Head Company'),
	(1623, 'RG0001', 'en', '01', 'Branch Office'),
	(1624, 'RG0001', 'en', '02', 'Department'),
	(1625, 'RG0001', 'en', '03', 'Vending Station'),
	(1626, 'RO0001', 'en', '1', 'Specified Role'),
	(1627, 'RO0001', 'en', '2', 'Customized Role'),
	(1628, 'RO0002', 'en', '01', 'Available'),
	(1629, 'RO0002', 'en', '02', 'Unavailable'),
	(1630, 'RO0002', 'en', '03', 'Deleted'),
	(1631, 'SM0001', 'en', '99', 'N/A'),
	(1632, 'SM0002', 'en', '01', 'Unknown'),
	(1633, 'SM0002', 'en', '02', 'Normal'),
	(1634, 'SM0002', 'en', '03', 'Overdue'),
	(1635, 'SM0003', 'en', '01', 'Registrated'),
	(1636, 'SM0003', 'en', '03', 'Used'),
	(1637, 'SM0003', 'en', '04', 'Maintenance'),
	(1638, 'SM0003', 'en', '05', 'Cancelled'),
	(1639, 'SM0003', 'en', '06', 'Overdue'),
	(1640, 'TS0001', 'en', '01', 'Meter Reading'),
	(1641, 'TS0001', 'en', '02', 'Meter Activation'),
	(1642, 'TS0001', 'en', '03', 'Meter Installation'),
	(1643, 'TS0001', 'en', '04', 'Batch Adjustment of Tariff'),
	(1644, 'TS0001', 'en', '05', 'Trouble Shooting'),
	(1645, 'TS0001', 'en', '06', 'Safety Check'),
	(1646, 'TS0002', 'en', '01', 'Intact'),
	(1647, 'TS0002', 'en', '02', 'Received'),
	(1648, 'TS0002', 'en', '03', 'Fulfilled'),
	(1649, 'TS0002', 'en', '04', 'Expired'),
	(1650, 'TS0003', 'en', '01', 'To be Excuted'),
	(1651, 'TS0003', 'en', '02', 'Executing'),
	(1652, 'TS0003', 'en', '03', 'Expired'),
	(1653, 'MT0005', 'en', '00', 'Base Meter'),
	(1654, 'MT0005', 'en', '01', 'AMI Smart Meter '),
	(1655, 'MT0005', 'en', '02', 'Walk-by Meter'),
	(1656, 'MT0005', 'en', '03', 'AMR Smart Meter'),
	(1657, 'MT0005', 'en', '04', 'Prepayment IC Card'),
	(1658, 'DC0003', 'en', '00', 'N/A'),
	(1659, 'DC0003', 'en', '01', 'GPRS/CDMA'),
	(1660, 'DC0003', 'en', '02', '3G'),
	(1661, 'DC0003', 'en', '03', '4G'),
	(1662, 'DC0003', 'en', '05', 'ITHERNET'),
	(1663, 'GC0005', 'en', '99', 'N/A'),
	(1664, 'GC0006', 'en', '99', 'N/A'),
	(1665, 'GC0007', 'en', '0', 'N/A'),
	(1666, 'GC0008', 'zh', '01', '身份证'),
	(1667, 'GC0008', 'zh', '02', '户口本'),
	(1668, 'GC0008', 'zh', '03', '军官证'),
	(1669, 'GC0008', 'zh', '04', '文职干部证'),
	(1670, 'GC0008', 'zh', '05', '护照'),
	(1671, 'GC0008', 'zh', '06', '港澳台同胞回乡证'),
	(1672, 'GC0008', 'zh', '07', '产权证'),
	(1673, 'GC0008', 'zh', '08', '市民卡'),
	(1674, 'GC0008', 'zh', '09', '营业执照'),
	(1675, 'GC0008', 'zh', '49', '其他'),
	(1676, 'GC0008', 'en', '01', 'Identification Card'),
	(1677, 'GC0008', 'en', '03', 'Certificate of Officers'),
	(1678, 'GC0008', 'en', '05', 'Passport'),
	(1679, 'GC0008', 'en', '09', 'Commercial License'),
	(1680, 'GC0008', 'en', '49', 'Other'),
	(1681, 'GC0009', 'en', '99', 'N/A'),
	(1682, 'GC0010', 'en', '99', 'N/A'),
	(1683, 'GC0011', 'en', '99', 'N/A'),
	(1684, 'GC0012', 'zh', '0', '未点火开通'),
	(1685, 'GC0012', 'zh', '1', '已点火开通'),
	(1686, 'GC0012', 'zh', '2', '点火开通异常'),
	(1687, 'GC0012', 'en', '99', 'N/A'),
	(1688, 'GC0013', 'en', '99', 'N/A'),
	(1689, 'GC0014', 'en', '99', 'N/A'),
	(1690, 'GC0015', 'en', '99', 'N/A'),
	(1691, 'GC0016', 'en', '99', 'N/A'),
	(1692, 'DC0004', 'zh', '01', '入库'),
	(1693, 'DC0004', 'zh', '02', '领用'),
	(1694, 'DC0004', 'zh', '03', '使用中'),
	(1695, 'DC0004', 'zh', '04', '维修'),
	(1696, 'DC0004', 'zh', '05', '报废'),
	(1697, 'DC0004', 'en', '01', 'Registrated'),
	(1698, 'DC0004', 'en', '03', 'Used'),
	(1699, 'DC0004', 'en', '04', 'Maintenance'),
	(1700, 'DC0004', 'en', '05', 'Cancelled'),
	(1701, 'RE0001', 'en', '00', 'Init'),
	(1702, 'RE0001', 'en', '01', 'Normal Reading'),
	(1703, 'RE0001', 'en', '02', 'Failed'),
	(1704, 'RE0001', 'en', '03', 'Abnormal Reading'),
	(1705, 'GC0017', 'en', '99', 'N/A'),
	(1706, 'VD0001', 'en', '4', 'viewshine'),
	(1707, 'AC0004', 'en', '403', 'mesh后付费'),
	(1708, 'AC0004', 'en', '402', 'mesh扩频后付费'),
	(1709, 'AC0004', 'en', '401', 'mesh扩频预付费'),
	(1710, 'AC0004', 'en', '301', '民用物联网1.0'),
	(1711, 'AC0004', 'en', '302', '民用物联网2.0'),
	(1712, 'AC0004', 'en', '902', '民用物联网(杭天)2.0协议'),
	(1713, 'AC0004', 'en', '901', '民用物联网(杭天召读)1.0协议'),
	(1714, 'AC0004', 'en', '203', '商业物联网3.0协议'),
	(1715, 'AC0004', 'en', '201', '商业物联网1.0协议'),
	(1716, 'AC0004', 'en', '501', '商业物联网（杭天）协议'),
	(1717, 'GC0018', 'en', '00', 'N/A'),
	(1718, 'OM0001', 'en', '00', 'To be activated'),
	(1719, 'OM0001', 'en', '01', 'Succeed'),
	(1720, 'OM0001', 'en', '02', 'Failed'),
	(1721, 'OST001', 'en', '1', 'Meter Activation'),
	(1722, 'OST001', 'en', '2', 'Parameters Reading '),
	(1723, 'OST001', 'en', '3', 'Parameters Setting'),
	(1724, 'OST001', 'en', '4', 'Batch Reading'),
	(1725, 'OST001', 'en', '5', 'Point Reading'),
	(1726, 'OST001', 'en', '7', 'Valve Control'),
	(1727, 'OST001', 'en', '8', 'Timing'),
	(1728, 'OST002', 'en', '01', '未下发'),
	(1729, 'OST002', 'en', '02', '已下发'),
	(1730, 'OST002', 'en', '03', '发送成功'),
	(1731, 'OST002', 'en', '04', '发送失败'),
	(1732, 'OST004', 'en', '01', 'Success'),
	(1733, 'OST004', 'en', '02', 'Failed'),
	(1734, 'OST004', 'en', '03', 'Valve Status'),
	(1735, 'OST005', 'en', '01', 'Factory Default'),
	(1736, 'OST005', 'en', '02', 'Running Mode'),
	(1737, 'MT0006', 'en', '0', '未初始化'),
	(1738, 'MT0006', 'en', '1', '初始化成功'),
	(1740, 'MS0001', 'en', '00', '异常命令'),
	(1741, 'MS0001', 'en', '01', '欠费待阀控'),
	(1742, 'MS0001', 'en', '02', '余额预警'),
	(1743, 'MS0001', 'en', '03', '开阀'),
	(1744, 'CG0001', 'en', '0', 'Private'),
	(1745, 'CG0001', 'en', '1', 'Public'),
	(1746, 'PGC001', 'en', '00', '正常'),
	(1747, 'PGC001', 'en', '01', '少额预警'),
	(1748, 'PGC001', 'en', '02', '少额告警'),
	(1749, 'PGC001', 'en', '03', '透支'),
	(1750, 'PGC001', 'en', '04', '欠费'),
	(1751, 'MVC0001', 'en', '1', 'Open'),
	(1752, 'MVC0001', 'en', '0', 'Close'),
	(1753, 'MVC0002', 'en', '0', 'Processing'),
	(1754, 'MVC0002', 'en', '1', 'Succeed'),
	(1755, 'MVC0002', 'en', '2', 'Failed'),
	(1756, 'MVC0002', 'en', '4', 'Unsent'),
	(1757, 'MVC0002', 'en', '5', 'Sending Failure'),
	(1761, 'RDF0001', 'zh', '01', '正常抄表'),
	(1762, 'RDF0001', 'zh', '02', '估算抄表'),
	(1763, 'ET0001', 'zh', '01', '计量故障处理流程'),
	(1764, 'ET0001', 'zh', '02', '违约用气处理流程'),
	(1765, 'ET0001', 'zh', '03', '气费退补处理流程'),
	(1766, 'ET0001', 'zh', '04', '档案维护处理流程'),
	(1767, 'RDF0001', 'en', '01', 'Normal Reading'),
	(1768, 'RDF0001', 'en', '02', 'Estimated Reading'),
	(1769, 'ET0001', 'en', '01', 'Metering Failure'),
	(1770, 'ET0001', 'en', '02', 'Abnormal Consumption'),
	(1771, 'ET0001', 'en', '03', 'Balance Compensating'),
	(1772, 'ET0001', 'en', '04', 'File Maintainance'),
	(1781, 'VD0001', 'zh', '01', '威星'),
	(1782, 'VD0001', 'zh', '02', '先锋'),
	(1783, 'VD0001', 'zh', '03', '金卡'),
	(1784, 'VD0001', 'zh', '04', '燃网'),
	(1785, 'VD0001', 'zh', '05', '新天'),
	(1786, 'VD0001', 'zh', '06', '蓝宝石'),
	(1787, 'VD0001', 'zh', '07', '维格'),
	(1788, 'MT0004', 'en', '00', 'virtual meter'),
	(1789, 'MT0004', 'en', '01', 'electric meter'),
	(1790, 'MT0004', 'en', '02', 'gas meter'),
	(1791, 'MT0004', 'en', '03', 'water meter'),
	(1792, 'MT0004', 'en', '04', 'heat meter'),
	(1793, 'GC0021', 'en', '0', 'kitchen'),
	(1794, 'GC0021', 'en', '1', 'aisle'),
	(1795, 'GC0021', 'en', '2', 'balcony'),
	(1796, 'GC0021', 'en', '3', 'outdoors'),
	(1797, 'GC0021', 'en', '4', 'other'),
	(1798, 'PTS001', 'zh', '10', '开通'),
	(1799, 'PTS001', 'zh', '100', '阀控'),
	(1800, 'PTS001', 'zh', '101', '调价'),
	(1801, 'PTS001', 'zh', '102', '充值'),
	(1802, 'PTS001', 'zh', '103', '参数设置'),
	(1803, 'PTS001', 'zh', '104', '参数读取'),
	(1804, 'PTS001', 'zh', '105', '校时'),
	(1805, 'PTS001', 'zh', '208', '设置IP端口'),
	(1806, 'PTS001', 'zh', '209', '读取IP端口'),
	(1807, 'PTS001', 'zh', '210', '读取阀门状态'),
	(1808, 'PTS001', 'zh', '211', '读取冻结日'),
	(1809, 'PTS001', 'zh', '212', '读取冻结周期 '),
	(1810, 'PTS001', 'zh', '213', '读取上告周期'),
	(1811, 'PTS001', 'zh', '214', '读取上告日'),
	(1812, 'PTS001', 'zh', '215', '读取阶梯价格'),
	(1813, 'PTS001', 'zh', '216', '读取用户名密码'),
	(1814, 'PTS001', 'zh', '217', '设置冻结日'),
	(1815, 'PTS001', 'zh', '218', '设置冻结周期'),
	(1816, 'PTS001', 'zh', '219', '设置上告周期'),
	(1817, 'PTS001', 'zh', '220', '设置上告日'),
	(1818, 'PTS001', 'zh', '221', '设置用户名密码'),
	(1819, 'PTS001', 'zh', '222', '读取校时时间'),
	(1820, 'PTS001', 'zh', '106', '读月冻结数据'),
	(1821, 'PTS001', 'zh', '200', '全抄'),
	(1822, 'PTS001', 'zh', '201', '单抄'),
	(1823, 'PTS001', 'zh', '202', '集中器参数设置'),
	(1824, 'PTS001', 'zh', '203', '集中器参数读取'),
	(1825, 'PTS001', 'zh', '204', '集中器全删'),
	(1826, 'PTS001', 'zh', '205', '集中器注册表具'),
	(1827, 'PTS001', 'zh', '206', '集中器读取表具列表'),
	(1828, 'PTS001', 'zh', '207', '集中器删除表'),
	(21829, 'PTS001', 'zh', '224', '中继器参数读取'),
	(21830, 'PTS001', 'zh', '223', '中继器参数设置'),
	(21831, 'PTS001', 'zh', '225', '集中器增加中继器'),
	(21832, 'PTS001', 'zh', '226', '中继器下增加表或中继器'),
	(1829, 'PTS002', 'zh', '01', '未下发'),
	(1830, 'PTS002', 'zh', '02', '已下发'),
	(1831, 'PTS002', 'zh', '03', '发送成功'),
	(1832, 'PTS002', 'zh', '04', '发送失败'),
	(1833, 'PTS002', 'zh', '05', '取消'),
	(1834, 'PTS002', 'zh', '06', '多次超时'),
	(1835, 'PTS003', 'zh', '00', '未处理'),
	(1836, 'PTS003', 'zh', '01', '成功'),
	(1837, 'PTS003', 'zh', '02', '失败'),
	(1838, 'PTS004', 'zh', '0', '未处理'),
	(1839, 'PTS004', 'zh', '1', '已处理'),
	(1840, 'ET0002', 'zh', '01', '光电异常'),
	(1841, 'ET0002', 'zh', '02', '万位突变异常'),
	(1842, 'ET0002', 'en', '00', 'N/A');
	
	/**故障状态*/
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1900, 'GZ0001', 'zh', '00', '正常');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1901, 'GZ0001', 'zh', '01', '阀门异常');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1902, 'GZ0001', 'zh', '02', '关阀走气');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1903, 'GZ0001', 'zh', '03', '未抄到表');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1904, 'GZ0001', 'zh', '04', '计量异常');
	/**阀控状态*/
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1905, 'FK0001', 'zh', '00', '未阀控');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1906, 'FK0001', 'zh', '01', '关阀命令待发');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1907, 'FK0001', 'zh', '02', '关阀命令失败');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1908, 'FK0001', 'zh', '03', '关阀命令成功');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1909, 'FK0001', 'zh', '04', '开阀命令待发');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1910, 'FK0001', 'zh', '05', '开阀命令失败');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1911, 'FK0001', 'zh', '06', '开阀命令成功');
	/**通知状态*/
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1912, 'TZ0001', 'zh', '00', '已通知');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1913, 'TZ0001', 'zh', '01', '未通知');
	/**故障状态*/
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1914, 'GZ0001', 'en', '00', '正常');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1915, 'GZ0001', 'en', '01', '阀门异常');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1916, 'GZ0001', 'en', '02', '关阀走气');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1917, 'GZ0001', 'en', '03', '未抄到表');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1918, 'GZ0001', 'en', '04', '计量异常');
	/**阀控状态*/
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1919, 'FK0001', 'en', '00', '未阀控');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1920, 'FK0001', 'en', '01', '关阀命令待发');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1921, 'FK0001', 'en', '02', '关阀命令失败');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1922, 'FK0001', 'en', '03', '关阀命令成功');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1923, 'FK0001', 'en', '04', '开阀命令待发');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1924, 'FK0001', 'en', '05', '开阀命令失败');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1925, 'FK0001', 'en', '06', '开阀命令成功');
	/**通知状态*/
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1926, 'TZ0001', 'en', '00', '已通知');
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) 
	VALUES(1927, 'TZ0001', 'en', '01', '未通知');
	/*未抄到原因和抄到异常类型*/
	INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
	(1928, 'ANA0001', 'zh', '1', '已换表'),
	(1929, 'ANA0001', 'zh', '2', '电池欠压'),
	(1930, 'ANA0001', 'zh', '3', '号段问题'),
	(1931, 'ANA0001', 'zh', '4', '空置户'),
	(1932, 'ANA0001', 'zh', '5', '无法入户'),
	(1933, 'ANA0001', 'zh', '6', '装修拆除'),
	(1934, 'ANA0001', 'zh', '7', '基表'),
	(1935, 'ANA0001', 'zh', '8', '换表后账目未更新'),
	(1936, 'ANA0001', 'zh', '9', '排查中'),
	(1937, 'ANA0002', 'zh', '00', '无异常'),
	(1938, 'ANA0002', 'zh', '01', '光电异常'),
	(1939, 'ANA0002', 'zh', '02', '万位突变异常'),
	(1940, 'ANA0002', 'zh', '03', '连续2次估抄用户'),
	(1941, 'ANA0002', 'zh', '04', '点火后长时间未用气用户'),
	(1942, 'ANA0002', 'zh', '05', '累计倒走'),
	(1943, 'ANA0002', 'zh', '06', '表计飞走');
	
	
/**协议初始化*/
INSERT INTO `as_dc_protocol` (`protocol_id`, `protocol_code`, `protocol_uuid`, `protocol_name`, `dc_type`, `MANUFACTURE_CODE`, `protocol_version`, `protocol_type`, `protocol_name_cn`, `need_open`) VALUES
	(201, 201, 'wx_bus_201', 'bs_ProtocolProvider.bus1', '03', '威星', '1.0', 1, '商业物联网1.0', 1),
	(203, 203, 'wx_bus_203', 'bs_ProtocolProvider.bus3', '03', '威星', '3.0', 1, '商业物联网3.0', 1),
	(301, 301, 'civil_1.0', 'bs_ProtocolProvider.civil1', '03', '威星', '1.0', 0, '民用物联网1.0', 1),
	(302, 302, 'civil_2.0', 'bs_ProtocolProvider.civil2', '03', '威星', '2.0', 0, '民用物联网2.0', 1),
	(401, 401, 'wx_mesh_41', 'bs_ProtocolProvider.meshprepay', '01', '威星', '1.0', 2, 'mesh预付费', 1),
	(402, 402, 'wx_mesh_4', 'bs_ProtocolProvider.meshpostpay', '01', '威星', '1.0', 2, 'mesh后付费', 0),
	(403, 403, 'wx_mesh_403', 'bs_ProtocolProvider.meshsrfr', '01', '威星', '1.0', 2, 'mesh深燃佛燃', 0),
	(404, 404, 'wx_mesh_chaoshengbo', 'bs_ProtocolProvider.meshUltrasonic', '01', '威星', '1.0', 2, 'mesh扩频超声波', 0),
	(501, 501, 'wx_bus_501', 'bs_ProtocolProvider.busht', '03', '威星', 'ht', 1, '商业物联网（杭天）', 0),
	(901, 901, 'ht_civil_zhaodu', 'bs_ProtocolProvider.civilhtzd1', '03', '威星', '1.0', 0, '民用物联网（杭天召读）协议', 0),
	(902, 902, 'ht_civil', 'bs_ProtocolProvider.civilht2', '03', '威星', '1.0', 0, '民用物联网（杭天）协议', 0),
	(1101, 1101, 'ht_rf', 'bs_ProtocolProvider.meshhtcommon', '01', '威星', '1.0', 2, '杭天通用扩频协议', 0),
	(1201, 1201, 'huarun_bus_1201', 'bs_ProtocolProvider.bushuayun', '03', '威星', '1.0', 1, '华润集团商业物联网协议', 0);

/*协议项初始化*/
INSERT INTO `om_dataitem` (`dataitem_name`, `dataitem_code`, `dataitem_class`, `param_type`, `show_style`, `display_order`, `dataitem_name_cn`) VALUES
	('pset.ipport1', '1101', '1', '1', 'ipport', 11, '主IP端口'),
	('pset.ipport2', '1102', '1', '1', 'ipport', 12, '备用IP端口'),
	('pset.apn', '1103', '1', '1', NULL, 1, 'APN/VPDN'),
	('pset.userNamePwd', '1104', '1', '1', 'string', 2, '用户名密码'),
	('pset.frequence', '1105', '1', '1', 'number', 3, '频点'),
	('pset.netId', '1106', '1', '1', 'string', 4, '网络ID'),
	('pset.frozenDay', '1201', '1', '6', 'date', 104, '月冻结日'),
	('pset.frozenPeriod', '1202', '1', '6', 'date', 103, '冻结周期'),
	('pset.upPeriod', '1203', '1', '5', 'date', 99, '上告周期'),
	('pset.upday1', '1204', '1', '5', 'date', 100, '上告日1'),
	('pset.upday2', '1205', '1', '5', 'date', 101, '上告日2'),
	('pset.upday3', '1206', '1', '5', 'date', 102, '上告日3'),
	('pset.lessMoneyOn', '1301', '3', '3', 'radio', 1, '开启少额关阀'),
	('pset.overdraftOn', '1302', '3', '3', 'radio', 1, '开启透支关阀'),
	('pset.lessVoltageOn', '1303', '3', '3', 'radio', 1, '开启低压关阀'),
	('pset.overFlow', '1304', '3', '3', 'radio', 1, '开启超流关阀'),
	('pset.lowFlow', '1305', '3', '3', 'radio', 1, '开启小流关阀'),
	('pset.zeroMoney', '1306', '3', '3', 'radio', 1, '开启零额关阀'),
	('pset.linkBreak', '1307', '3', '3', 'radio', 1, '开启断线关阀'),
	('pset.lidOpen', '1308', '3', '3', 'radio', 1, '开启开盖关阀'),
	('pset.magneticAttack', '1309', '3', '3', 'radio', 1, '开启磁攻击关阀'),
	('pset.lowVoltage', '1310', '3', '3', 'radio', 1, '开启欠压关阀'),
	('pset.meterValveError', '1311', '3', '3', 'radio', 1, '开启表具异常关阀'),
	('pset.amountEmpty', '1312', '3', '3', 'radio', 1, '开启大于排空量关阀'),
	('pset.pressureBroken', '1313', '3', '3', 'radio', 1, '开启压力传感器坏关阀'),
	('pset.temperaBroken', '1314', '3', '3', 'radio', 1, '开启温度传感器坏关阀'),
	('pset.reverseAir', '1315', '3', '3', 'radio', 1, '开启反向走气功关阀'),
	('pset.electricCome', '1316', '3', '3', 'radio', 1, '开启上电开阀'),
	('pset.valve119', '1317', '3', '3', 'radio', 1, '开启119关阀功能'),
	('pset.rechargeMoney', '2001', '2', '8', 'currency', 1, '充值金额'),
	('pset.remainMoney', '2004', '1', '6', 'currency', 1, '剩余金额'),
	('pset.valvestate', '3002', '3', '3', 'radio', -1, '阀门状态'),
	('pset.excutePeriod', '4001', '4', '2', 'date', 20, '执行时间段'),
	('pset.stage1Price', '4002', '4', '2', 'currency', 21, '阶梯1价格'),
	('pset.stage1Vol', '4003', '4', '2', 'integer', 26, '阶梯1气量'),
	('pset.stage2Price', '4004', '4', '2', 'currency', 22, '阶梯2价格'),
	('pset.stage2Vol', '4005', '4', '2', 'integer', 27, '阶梯2气量'),
	('pset.stage3Price', '4006', '4', '2', 'currency', 23, '阶梯3价格'),
	('pset.stage3Vol', '4007', '4', '2', 'integer', 28, '阶梯3气量'),
	('pset.stage4Price', '4008', '4', '2', 'currency', 24, '阶梯4价格'),
	('pset.stage4Vol', '4009', '4', '2', 'integer', 29, '阶梯4气量'),
	('pset.stage4Price', '4010', '4', '2', 'currency', 25, '阶梯5价格'),
	('pset.stage5Vol', '4011', '4', '2', 'integer', 30, '阶梯5气量'),
	('pset.stageStartYmd', '4012', '4', '2', 'date', 19, '阶梯起始日'),
	('pset.adjustTime', '5001', '5', '7', 'date', 1, '校时');

/*协议对应协议项*/
INSERT INTO `om_rela_dataitem_protocol` (`dataitem_code`, `protocol_id`, `scope`, `rw_remark`, `style_options`) VALUES
	('1101', 201, 0, 3, '如192.168.1.1:8097'),
	('1101', 203, 0, 3, '如192.168.1.1:8097'),
	('1101', 301, 0, 3, '如192.168.1.1:8097'),
	('1101', 302, 0, 3, '如192.168.1.1:8097'),
	('1101', 401, 1, 3, '如192.168.1.1:8097'),
	('1101', 402, 1, 3, '如192.168.1.1:8097'),
	('1101', 403, 1, 3, '如192.168.1.1:8097'),
	('1101', 404, 1, 3, '如192.168.1.1:8097'),
	('1101', 501, 0, 3, '如192.168.1.1:8097'),
	('1101', 901, 0, 3, '如192.168.1.1:8097'),
	('1101', 902, 0, 3, '如192.168.1.1:8097'),
	('1101', 1201, 0, 3, '如192.168.1.1:8097'),
	('1102', 401, 1, 3, 'IP:PORT'),
	('1102', 402, 1, 3, 'IP:PORT'),
	('1103', 201, 0, 3, NULL),
	('1103', 203, 0, 3, NULL),
	('1103', 501, 0, 3, NULL),
	('1104', 301, 0, 3, NULL),
	('1104', 302, 0, 3, NULL),
	('1104', 901, 0, 3, NULL),
	('1104', 902, 0, 3, NULL),
	('1104', 1201, 0, 3, NULL),
	('1105', 401, 1, 1, NULL),
	('1105', 402, 1, 1, NULL),
	('1105', 403, 1, 1, NULL),
	('1105', 404, 1, 1, NULL),
	('1106', 401, 1, 1, NULL),
	('1106', 402, 1, 1, NULL),
	('1106', 403, 1, 1, NULL),
	('1106', 404, 1, 1, NULL),
	('1201', 301, 0, 3, 'ddHHmm'),
	('1201', 302, 0, 3, 'ddHHmm'),
	('1201', 401, 0, 3, 'ddHHmm'),
	('1201', 402, 0, 3, 'ddHHmm'),
	('1201', 901, 0, 3, 'ddHHmm'),
	('1201', 902, 0, 3, 'ddHHmm'),
	('1201', 1201, 0, 3, 'ddHHmm'),
	('1202', 201, 0, 3, NULL),
	('1202', 203, 0, 3, NULL),
	('1202', 501, 0, 3, NULL),
	('1203', 201, 0, 3, NULL),
	('1203', 203, 0, 3, NULL),
	('1203', 301, 0, 3, NULL),
	('1203', 302, 0, 3, NULL),
	('1203', 501, 0, 3, NULL),
	('1203', 901, 0, 3, NULL),
	('1203', 902, 0, 3, NULL),
	('1203', 1201, 0, 3, NULL),
	('1204', 201, 0, 3, NULL),
	('1204', 203, 0, 3, NULL),
	('1204', 501, 0, 3, NULL),
	('1205', 201, 0, 3, NULL),
	('1205', 203, 0, 3, NULL),
	('1205', 501, 0, 3, NULL),
	('1206', 203, 0, 3, NULL),
	('1301', 201, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1301', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1301', 301, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1301', 302, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1301', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1302', 201, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1302', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1302', 301, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1302', 302, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1302', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1303', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1304', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1304', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1305', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1305', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1306', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1307', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1308', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1309', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1310', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1310', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1311', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1312', 203, 0, 2, '{"util.open":"open","util.close":"close"}'),
	('1313', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1314', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1315', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1316', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('1317', 1201, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('2001', 201, 0, 2, NULL),
	('2001', 203, 0, 2, NULL),
	('2001', 301, 0, 2, NULL),
	('2001', 302, 0, 2, NULL),
	('2001', 401, 0, 2, NULL),
	('2001', 403, 0, 2, NULL),
	('2001', 404, 0, 2, NULL),
	('2001', 1201, 0, 2, NULL),
	('2004', 401, 0, 1, NULL),
	('3002', 201, 0, 3, '{"util.forceOn":"fopen","util.forceClose":"fclose","util.forceExit":"exit"}'),
	('3002', 203, 0, 3, '{"util.forceClose":"fclose","util.forceExit":"exit"}'),
	('3002', 301, 0, 2, '{"util.forceOn":"fopen","util.forceClose":"fclose","util.forceExit":"exit"}'),
	('3002', 302, 0, 2, '{"util.forceClose":"fclose","util.forceExit":"exit"}'),
	('3002', 401, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('3002', 402, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('3002', 403, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('3002', 404, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('3002', 901, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('3002', 902, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('3002', 1201, 0, 3, '{"util.forceOn":"fopen","util.forceClose":"fclose","util.forceExit":"exit"}'),
	('4001', 201, 0, 3, NULL),
	('4001', 203, 0, 3, NULL),
	('4001', 301, 0, 3, NULL),
	('4001', 302, 0, 3, NULL),
	('4001', 401, 0, 3, NULL),
	('4001', 1201, 0, 3, NULL),
	('4002', 201, 0, 3, NULL),
	('4002', 203, 0, 3, NULL),
	('4002', 301, 0, 3, NULL),
	('4002', 302, 0, 3, NULL),
	('4002', 401, 0, 3, NULL),
	('4002', 1201, 0, 3, NULL),
	('4003', 201, 0, 3, NULL),
	('4003', 203, 0, 3, NULL),
	('4003', 301, 0, 3, NULL),
	('4003', 302, 0, 3, NULL),
	('4003', 401, 0, 3, NULL),
	('4003', 1201, 0, 3, NULL),
	('4004', 201, 0, 3, NULL),
	('4004', 203, 0, 3, NULL),
	('4004', 301, 0, 3, NULL),
	('4004', 302, 0, 3, NULL),
	('4004', 401, 0, 3, NULL),
	('4004', 1201, 0, 3, NULL),
	('4005', 201, 0, 3, NULL),
	('4005', 203, 0, 3, NULL),
	('4005', 301, 0, 3, NULL),
	('4005', 302, 0, 3, NULL),
	('4005', 401, 0, 3, NULL),
	('4005', 1201, 0, 3, NULL),
	('4006', 201, 0, 3, NULL),
	('4006', 203, 0, 3, NULL),
	('4006', 301, 0, 3, NULL),
	('4006', 302, 0, 3, NULL),
	('4006', 401, 0, 3, NULL),
	('4006', 1201, 0, 3, NULL),
	('4007', 201, 0, 3, NULL),
	('4007', 203, 0, 3, NULL),
	('4007', 301, 0, 3, NULL),
	('4007', 302, 0, 3, NULL),
	('4007', 401, 0, 3, NULL),
	('4007', 1201, 0, 3, NULL),
	('4008', 201, 0, 3, NULL),
	('4008', 203, 0, 3, NULL),
	('4008', 301, 0, 3, NULL),
	('4008', 302, 0, 3, NULL),
	('4008', 401, 0, 3, NULL),
	('4008', 1201, 0, 3, NULL),
	('4009', 201, 0, 3, NULL),
	('4009', 203, 0, 3, NULL),
	('4009', 301, 0, 3, NULL),
	('4009', 302, 0, 3, NULL),
	('4009', 401, 0, 3, NULL),
	('4009', 1201, 0, 3, NULL),
	('4010', 201, 0, 3, NULL),
	('4010', 203, 0, 3, NULL),
	('4010', 301, 0, 3, NULL),
	('4010', 302, 0, 3, NULL),
	('4010', 401, 0, 3, NULL),
	('4010', 1201, 0, 3, NULL),
	('4011', 201, 0, 3, NULL),
	('4011', 203, 0, 3, NULL),
	('4011', 301, 0, 3, NULL),
	('4011', 302, 0, 3, NULL),
	('4011', 401, 0, 3, NULL),
	('4011', 1201, 0, 3, NULL),
	('4012', 201, 0, 3, NULL),
	('4012', 203, 0, 3, NULL),
	('4012', 301, 0, 3, NULL),
	('4012', 302, 0, 3, NULL),
	('4012', 401, 0, 3, NULL),
	('4012', 1201, 0, 3, NULL),
	('5001', 201, 0, 2, 'yy MM dd HH mm ss'),
	('5001', 203, 0, 2, 'yy MM dd HH mm ss'),
	('5001', 301, 0, 3, 'yy MM dd HH mm ss'),
	('5001', 302, 0, 3, 'yy MM dd HH mm ss'),
	('5001', 401, 1, 3, 'yy MM dd HH mm ss'),
	('5001', 402, 1, 3, 'yy MM dd HH mm ss'),
	('5001', 403, 1, 3, 'yy MM dd HH mm ss'),
	('5001', 404, 1, 3, 'yy MM dd HH mm ss'),
	('5001', 501, 0, 2, 'yy MM dd HH mm ss'),
	('5001', 1201, 0, 3, 'yy MM dd HH mm ss'),
	('1101', 1101, 1, 3, '如192.168.1.1:8097'),
	('1201', 1101, 0, 3, 'ddHHmm'),
	('3002', 1101, 0, 3, '{"util.open":"open","util.close":"close"}'),
	('5001', 1101, 1, 3, 'yy MM dd HH mm ss');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21833','VD0001','zh','08','克罗姆');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21834','VD0001','zh','09','丹东');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21835','VD0001','zh','10','苍南');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21836','VD0001','zh','11','天信');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21837','VD0001','zh','12','重庆前卫');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21838','VD0001','zh','13','埃尔斯特');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21839','VD0001','zh','14','荣城市宇翔');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21840','VD0001','zh','15','罗美特');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21841','VD0001','zh','16','贝特');
insert into ss_dict_enum_data( DICT_DATA_ID,DICT_CODE,DICT_LANG,ENUM_CODE,ENUM_VALUE) values('21842','VD0001','zh','17','新立');

	/*初始化序列*/
insert into ss_key_table(id,type,sequence,create_date) values(1,1,1,now());

INSERT INTO `t_task` (`id`, `jobName`, `jobGroup`, `jobStatus`, `cronExpression`, `description`, `jobType`, `deptCode`) VALUES
	(1, '抄表计划分解', 'system', '1', '0 0 0 * * ?', '每天0点分解', 1, '0001');
	

	/*数据库赋权限*/
grant all on *.* to root@"%" identified by 'root';

/* 英文菜单增加系统维护 */

INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) VALUES
(230, 200, 'Region Config', '/system/regionUpload/show.do?menuId=230', 'icon-double-angle-right', '', '34', 'en');

/* 配置模块的权限 */
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
 VALUES(270, '1', 230);

/* 配置系统维护的操作权限：查看*/
INSERT INTO ss_operation(OPERATION_ID, OPERATION_NAME_CODE, OPERATION_TYPE, OPERATION_PARAM, OPERATION_STATE, OPERATION_SEQ, MENU_ID, OPERATION_LANG)
  VALUES(1203, 'Inquire', '00', '222', '0', '1', '230', 'en');

/* 配置操作的权限 */
INSERT INTO ss_privilege(PRIVILEGE_ID, PRIVILEGE_TYPE, FK_RESOURCE_ID)
 VALUES(271, '2', 1203);

/* 给admin配置系统维护的权限 */
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 270),(1,271);

/*结算抄表成功率分析功能*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('1207', '查看', '00', '222', '0', '1', '46', 'zh');

/*结算抄表成功率分析权限*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('272', '2', '1207');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('273', '1', '46');

/* 给admin配置结算抄表成功率分析的权限 */
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 272),(1,273);

/*密钥管理增加权限*/
/*增加二级菜单：密钥管理*/
INSERT INTO ss_menu (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) VALUES 
('10', '1', '密钥管理', '/runningManagement/secretKeyManagement/show.do?menuId=10', 'icon-double-angle-right', NULL, '49', 'zh');

/*增加密钥管理的操作权限：查看、新增、编辑、删除*/
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1203', '查看', '00', '222', '0', '1', '10', 'zh');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1204', '新增', '01', '', '0', '2', '10', 'zh');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1205', '编辑', '02', '22', '0', '3', '10', 'zh');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1206', '删除', '03', '22', '0', '4', '10', 'zh');

/*配置密钥管理的菜单权限*/
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('269', '1', '10');

/*配置密钥管理的操作权限*/
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('270', '2', '1203');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('271', '2', '1204');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('272', '2', '1205');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('273', '2', '1206');

/*增加表具用途的数据字典（中文）*/
INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
	(NULL, 'AM0003', 'zh', '1', '居民厨房用气'),
	(NULL, 'AM0003', 'zh', '2', '居民地暖/壁挂炉用气'),
	(NULL, 'AM0003', 'zh', '3', '工商户厨房用气'),
	(NULL, 'AM0003', 'zh', '4', '工商户锅炉用气');
	
/*增加表具用途的数据字典（英文）*/
INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
	(NULL, 'AM0003', 'en', '1', '居民厨房用气'),
	(NULL, 'AM0003', 'en', '2', '居民地暖/壁挂炉用气'),
	(NULL, 'AM0003', 'en', '3', '工商户厨房用气'),
	(NULL, 'AM0003', 'en', '4', '工商户锅炉用气');
	
/*增加群组类型的数据字典*/
INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
	(null, 'CS0001', 'zh', '00', '调价群组'),
	(null, 'CS0001', 'zh', '01', '阀控群组'),
	(null, 'CS0001', 'zh', '02', '抄表管理群组');
	
/* 2017-06-12 新增报警和诊断  by hjp */
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('3000', '0', '报警和诊断', NULL, 'iconfont icon-am-start', NULL, '13', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('3001', '3000', '报警', '/water/alarm/show.do?menuId=3001', 'icon-double-angle-right', NULL, '301', 'zh');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('3002', '3000', '诊断', '/water/diagnose/show.do?menuId=3002', 'icon-double-angle-right', NULL, '302', 'zh');

INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1331', '查看', '00', '222', '0', '1', '3001', 'zh');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1332', '查看', '00', '222', '0', '1', '3002', 'zh');

INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('350', '1', '3000');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('351', '1', '3001');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('352', '1', '3002');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('353', '2', '1331');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('354', '2', '1332');


INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('30000', '0', 'Maintenance', NULL, 'iconfont icon-am-start', NULL, '13', 'en');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('30001', '30000', 'Alarms', '/water/alarm/show.do?menuId=30001', 'icon-double-angle-right', NULL, '301', 'en');
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('30002', '30000', 'Diagnostics', '/water/diagnose/show.do?menuId=30002', 'icon-double-angle-right', NULL, '302', 'en');

INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1333', 'Inquire', '00', '222', '0', '1', '30001', 'en');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1334', 'Inquire', '00', '222', '0', '1', '30002', 'en');

INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('355', '1', '30000');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('356', '1', '30001');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('357', '1', '30002');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('358', '2', '1333');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('359', '2', '1334');

/* 增加报警信息筛选的数据字典 */
INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
(null, 'WA0001', 'zh', '00', '流量异常'),
(null, 'WA0001', 'zh', '01', '温度异常'),
(null, 'WA0001', 'zh', '02', '滴漏'),
(null, 'WA0001', 'zh', '03', '空管'),
(null, 'WA0001', 'zh', '04', '逆流');

INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
(null, 'WA0001', 'en', '00', 'Abnormal Flow Rate'),
(null, 'WA0001', 'en', '01', 'Abnormal Temperature'),
(null, 'WA0001', 'en', '02', 'Leakage'),
(null, 'WA0001', 'en', '03', 'Air in Pipe'),
(null, 'WA0001', 'en', '04', 'Reverse Flow');

INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
/*(null, 'WD0001', 'zh', '00', '开盖报警'),*/
(null, 'WD0001', 'zh', '01', '存储芯片失灵'),
(null, 'WD0001', 'zh', '02', '通讯模块失灵'),
(null, 'WD0001', 'zh', '03', '温度传感器失灵'),
(null, 'WD0001', 'zh', '04', '电池电量低'),
(null, 'WD0001', 'zh', '05', '换能器失灵');

INSERT INTO `ss_dict_enum_data` (`DICT_DATA_ID`, `DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
/*(null, 'WD0001', 'en', '00', 'Meter Cover Opened'),*/
(null, 'WD0001', 'en', '01', 'Memory Chip Failure'),
(null, 'WD0001', 'en', '02', 'Communication Module Failure'),
(null, 'WD0001', 'en', '03', 'Temperature Sensors Failure'),
(null, 'WD0001', 'en', '04', 'Low Battery'),
(null, 'WD0001', 'en', '05', 'Measurement Sensors Failure');

----诊断增加诊断统计 中文
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('3003', '3000', '诊断统计', '/meterDiagnose/diagnoseStatisis.do?menuId=3003', 'icon-double-angle-right', NULL, '303', 'zh');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1335', '诊断统计', '00', '16', '0', '1', '3003', 'zh');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1337', '查看诊断统计饼图', '00', '16', '0', '2', '3003', 'zh');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('360', '1', '3003');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('362', '2', '1335');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('364', '2', '1337');


----诊断增加诊断统计 英文
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('30003', '30000', 'Diagnose Statistics', '/meterDiagnose/diagnoseStatisis.do?menuId=30003', 'icon-double-angle-right', NULL, '303', 'en');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1336', 'Diagnose Statistics', '00', '16', '0', '1', '30003', 'en');
INSERT INTO ss_operation (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) VALUES 
('1338', '查看诊断统计饼图', '00', '16', '0', '2', '30003', 'en');

INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('361', '1', '30003');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('363', '2', '1336');
INSERT INTO ss_privilege (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) VALUES ('365', '2', '1338');

INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1, 360),(1,361),(1,362),(1,363),(1,364),(1,365);

