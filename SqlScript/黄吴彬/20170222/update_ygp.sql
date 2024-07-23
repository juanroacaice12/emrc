/*数据字典表添加数据*/
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
	
/*结算抄表成功率分析菜单*/
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`) VALUES
	('46', '4', '结算抄表成功率分析', '/meterReading/analysis/show.do?menuId=46', 'icon-double-angle-right', NULL, '56', 'zh');
	
/*结算抄表成功率分析功能*/
INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`, `MENU_ID`, `OPERATION_LANG`) 
VALUES ('1207', '查看', '00', '222', '0', '1', '46', 'zh');

/*结算抄表成功率分析权限*/
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) 
VALUES ('272', '2', '1207');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`) 
VALUES ('273', '1', '46');

/* 给admin配置结算抄表成功率分析的权限 */
INSERT INTO ss_rela_role_privilege(ROLE_ID, PRIVILEGE_ID)VALUES(1,272),(1,273);