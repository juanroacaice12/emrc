INSERT INTO `ss_dict_enum_data`
(`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`)
VALUES ('AC0001', 'en', '06', 'Ethernet');

INSERT INTO `ss_dict_enum_data`
(`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`)
VALUES ('AC0001', 'en', '06', '3G/4G');

/*INSERT INTO `ss_dict_enum_data`
(`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`)
VALUES ('DC0001', 'en', '04', 'Gateway');*/

ALTER TABLE as_dc MODIFY COLUMN DC_TYPE VARCHAR(2) NOT NULL COMMENT '01：集中器； 02：采集器；03：中继器 04：网关';
ALTER TABLE as_dc MODIFY COLUMN MANUFACTURE_CODE varchar(16) DEFAULT NULL COMMENT '厂商编码';
ALTER TABLE as_asset MODIFY COLUMN MANUFACTURE_CODE varchar(16) DEFAULT NULL COMMENT '厂商编码';
ALTER TABLE as_asset_comm_param MODIFY COLUMN `COMM_ADDR1` varchar(32) DEFAULT NULL COMMENT '通讯地址1';
ALTER TABLE as_asset_comm_param MODIFY COLUMN `COMM_ADDR2` varchar(32) DEFAULT NULL COMMENT '通讯地址2';

INSERT INTO `ss_dict_enum_data`
(`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`)
VALUES ('AE0001', 'en', '00000', 'offline');
INSERT INTO `ss_dict_enum_data`
(`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`)
VALUES ('AE0001', 'en', '00001', 'online');

-- 网关监测菜单
INSERT INTO `ss_menu` (`MENU_ID`, `PARENT_MENU_ID`, `MENU_NAME_CODE`, `MENU_URI`, `MENU_ICON`, `MENU_STATE`, `MENU_SEQ`, `MENU_LANG`)
VALUES ('30004', '30000', 'Gateway Status', '/monitor/gateway/show.do?menuId=30004', 'icon-double-angle-right', NULL, '304', 'en');

INSERT INTO `ss_operation` (`OPERATION_ID`, `OPERATION_NAME_CODE`, `OPERATION_TYPE`, `OPERATION_PARAM`, `OPERATION_STATE`, `OPERATION_SEQ`,
                            `MENU_ID`, `OPERATION_LANG`)
VALUES ('1339', 'Inquire', '00', '222', '0', '1',
                            '30004', 'en');

INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`)
VALUES ('370', '2', '1339');
INSERT INTO `ss_privilege` (`PRIVILEGE_ID`, `PRIVILEGE_TYPE`, `FK_RESOURCE_ID`)
VALUES ('371', '1', '30004');

