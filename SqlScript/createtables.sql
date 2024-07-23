/*创建数据库*/
CREATE DATABASE IF NOT EXISTS `ygp`;
alter database ygp CHARACTER SET utf8;
USE `ygp`;

/*****************************建表****************************************************************************************************************建表************************************************
*****************************************建表*******************************************************************************************建表*********************************************************
*****************************************************建表**********************************************************************建表******************************************************************
***************************************************************建表**********************************************建表*****************************************************************************
*******************************************************************************建表*********************建表*****************************************************************************************
*********************************************************************************************************************************************************************************************
******************************************************************************************建表***************************************************************************************************/

CREATE TABLE IF NOT EXISTS `ap_mobile_pin` (
  `pin_id` int(11) NOT NULL,
  `mobile` varchar(64) default NULL COMMENT '手机号码',
  `effect_start_time` datetime default NULL COMMENT '验证码生效开始时间',
  `auth_code` varchar(10) default NULL COMMENT '验证码',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`pin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存手机验证码表';


CREATE TABLE IF NOT EXISTS `ap_push_message` (
  `message_id` int(11) NOT NULL,
  `dept_code` varchar(20) default NULL COMMENT '部门编号',
  `mobile` varchar(64) default NULL COMMENT '手机号码',
  `title` varchar(64) default NULL COMMENT '推送标题',
  `body` varchar(256) default NULL COMMENT '推送内容',
  `push_date` datetime default NULL COMMENT '推送时间',
  `read_flag` varchar(2) default NULL COMMENT '已读/未读标记',
  PRIMARY KEY  (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推送消息保存表';

CREATE TABLE IF NOT EXISTS `ap_rela_user_cust` (
  `user_id` int(11) default NULL COMMENT '用户id',
  `cust_id` int(11) default NULL COMMENT '客户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP用户与客户关联表';

CREATE TABLE IF NOT EXISTS `ap_user` (
  `user_id` int(11) NOT NULL,
  `mobile` varchar(64) default NULL COMMENT '手机号码',
  `password` varchar(32) default NULL COMMENT '密码',
  `create_time` datetime default NULL COMMENT '创建时间',
  `latest_login_time` datetime default NULL COMMENT '最近登录时间',
  `token` varchar(64) default NULL,
  `error_login_num` int(11) default NULL,
  `notice_Num` int(11) default NULL,
  `payment_Bill_Num` int(11) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app用户注册表';


CREATE TABLE IF NOT EXISTS `asset_sim_tariff` (
  `SIM_TARIFF_ID` bigint(20) NOT NULL,
  `GAS_COMPANY_CODE` varchar(20) NOT NULL,
  `TARIFF_DESC` varchar(32) NOT NULL COMMENT '填写套餐定义，如：\r\n            60M/月，1M/月，2G/月，100M包年 等等',
  `SIM_APN_VPN` varchar(64) default NULL,
  PRIMARY KEY  (`SIM_TARIFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每个燃气公司可以使用自己申请的专有套餐。';

CREATE TABLE IF NOT EXISTS `as_asset` (
  `ASSET_ID` bigint(20) NOT NULL,
  `ASSET_CODE` varchar(32) default NULL COMMENT '资产编码',
  `ASSET_STATE` varchar(2) NOT NULL COMMENT '01：入仓库 02：领用 03：使用中 04：维修 05：报废',
  `ASSET_TYPE` varchar(2) default NULL COMMENT '资产类型编码 01：集中器，02：采集器，03：表具，04：中继器',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '单位',
  `BAR_CODE` varchar(32) default NULL COMMENT '资产条形码',
  `MANUFACTURE_CODE` varchar(16) NOT NULL COMMENT '生产商编码',
  `EXTERNAL_ASSET_CODE` varchar(32) default NULL COMMENT '外部资产编号',
  `MEMO` varchar(80) default NULL COMMENT '对于特殊表，提供备注信息。如工业及公建用户，需要填写公建编号',
  PRIMARY KEY  (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备资产管理的基表';

CREATE TABLE IF NOT EXISTS `as_asset_comm_param` (
  `ASSET_ID` bigint(20) default NULL COMMENT '采集设备ID(包括表、集中器、采集器)',
  `COMM_PROTOCOL` varchar(4) default NULL COMMENT '通讯规约',
  `REMOTE_COMM_TYPE` varchar(2) default NULL COMMENT '01：GPRS/CDMA； 02：3G； 03：4G； 04：SMS（短信）； 05：ITHERNET；',
  `LOCAL_COMM_TYPE` varchar(2) default NULL COMMENT '本地通信方式 01：RF组网；  02：RF扩频组网；03：RF点抄；04：RS232(485);  05：WIFI； 06：蓝牙',
  `COMM_ADDR1` varchar(32) NOT NULL COMMENT '通讯地址1',
  `COMM_ADDR2` varchar(32) NOT NULL COMMENT '通讯地址2',
  `COMM_PORT1` int(11) default NULL COMMENT '通讯端口号1',
  `COMM_PORT2` int(11) default NULL COMMENT '通讯端口号2',
  `BAUD_RATE` varchar(16) default NULL COMMENT '波特率',
  `NETWORK_ID` varchar(20) default NULL,
  `FREQUENCY` varchar(10) default NULL COMMENT '频点(RF)',
  `APN` varchar(20) default NULL COMMENT '网络接入点',
  KEY `FK_Reference_200` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产-设备通信参数表';


CREATE TABLE IF NOT EXISTS `as_asset_flow_mgmt` (
  `AS__ASSET_ID` bigint(20) default NULL,
  `ASSET_ID` varchar(20) default NULL,
  `OPERATION_TYPE` varchar(2) NOT NULL COMMENT '01：新购暂管入库\r\n            02：新购验收入库\r\n            03：新购直接入库\r\n            04：检定/检测返回入库\r\n            05：拆回入库\r\n            06：配送入库\r\n            07：预领退回入库\r\n            08：领出未装入库\r\n            09：厂返更换入库\r\n            10：用户资产移交入库 \r\n            11：盘盈资产入库\r\n            ',
  `OPERATOR` varchar(20) NOT NULL,
  `OCCUR_TIME` date NOT NULL,
  `ASSET_USER` varchar(20) default NULL COMMENT '使用者：如领用人；维修工；报废人；转移人',
  `ASSET_USER_DEPT` varchar(20) default NULL,
  `DESCRIPTION` varchar(128) default NULL COMMENT '填写如 报废原因；维修原因；转移的情况描述；租借情况；',
  KEY `FK_FK_ASSET_DC_FLOW` (`AS__ASSET_ID`),
  CONSTRAINT `FK_FK_ASSET_DC_FLOW` FOREIGN KEY (`AS__ASSET_ID`) REFERENCES `as_asset` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `as_assistant_dc_flow_mgmt` (
  `ASSET_ID` bigint(20) default NULL,
  `ASSISTANT_DC_CODE` varchar(2) default NULL COMMENT '01：SIM卡\r\n            02：掌上电脑\r\n            03：便携打印机',
  `OPERATION_TYPE` varchar(2) NOT NULL COMMENT '01：入库； 02：领用；03：投入运行；04：维修； 05：报废； 06：转移；  07：租借；\r\n            ',
  `OPERATOR` varchar(20) NOT NULL,
  `OCCUR_TIME` date NOT NULL,
  `ASSET_USER` varchar(20) default NULL COMMENT '使用者：如领用人；维修工；报废人；转移人',
  `ASSET_USER_DEPT` varchar(20) default NULL,
  `DESCRIPTION` varchar(128) default NULL COMMENT '填写如 报废原因；维修原因；转移的情况描述；租借情况；',
  KEY `FK_Reference_14` (`ASSET_ID`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`ASSET_ID`) REFERENCES `as_asset` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `as_dc` (
  `DC_ID` bigint(20) NOT NULL COMMENT '终端资产号',
  `PARENT_DC_ID` bigint(20) default NULL COMMENT '父DC_ID',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '单位',
  `DC_TYPE` varchar(2) NOT NULL COMMENT '01：集中器； 02：采集器；03：中继器',
  `ASSET_CODE` varchar(32) default NULL COMMENT '资产号',
  `LOGICAL_ADDR` varchar(20) default NULL COMMENT '对于虚拟表计，逻辑地址为\r\n            VM + SEQUENCE',
  `PRODUCTION_MODEL` varchar(64) default NULL,
  `INSTALL_ADDRESS` varchar(256) default NULL,
  `INSTALL_REGION_CODE` varchar(20) default NULL,
  `GPS_INFO` varchar(20) default NULL COMMENT 'GPS信息，经度纬度',
  `MANUFACTURE_CODE` varchar(16) NOT NULL COMMENT '厂商编码',
  `CREATE_DATE` datetime default NULL COMMENT '创建日期',
  `online` int(11) default NULL COMMENT '是否在线 0：不在线，1：在线',
  `SIM_NUMBER` varchar(64) default NULL COMMENT 'SIM卡号码',
  `maintain_command` varchar(2) default NULL COMMENT '是否为支持运维命令的扩频组网版本集中器 1:是 0：不是',
  PRIMARY KEY  (`DC_ID`),
  CONSTRAINT `FK_FK_ASSET_DC` FOREIGN KEY (`DC_ID`) REFERENCES `as_asset` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包括真实终端和虚拟终端，如数据集中器和数据采集器。\r\nDC-ID和表计ID，采用统一生成方式，如sequenc';


CREATE TABLE IF NOT EXISTS `as_dc_protocol` (
  `protocol_id` bigint(20) NOT NULL,
  `protocol_code` int(11) NOT NULL COMMENT '前置机对应协议编码',
  `protocol_uuid` varchar(50) DEFAULT NULL COMMENT '由厂家简码 +  协议简码 组成，如威星民用物联网3.0，表示为：wx_civil_3',
  `protocol_name` varchar(50) DEFAULT NULL COMMENT '协议名称',
  `dc_type` varchar(5) DEFAULT NULL COMMENT '00：基表；01：RF远程表；02：RF点抄表；03：物联网表；04：IC卡表',
  `MANUFACTURE_CODE` varchar(20) NOT NULL COMMENT '协议厂家',
  `protocol_version` varchar(5) DEFAULT NULL COMMENT '协议版本',
  `protocol_type` int(10) NOT NULL COMMENT '0：民用物联网协议；1：商用物联网协议；2：民用扩频；',
  `protocol_name_cn` varchar(50) NOT NULL COMMENT '中文名提示信息',
  `need_open` varchar(2) DEFAULT NULL COMMENT '是否需要开通: 1:是; 0:否;',
  PRIMARY KEY (`protocol_id`),
  KEY `Index_msgId_funcode` (`MANUFACTURE_CODE`,`protocol_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备通信协议表';

CREATE TABLE IF NOT EXISTS `as_meter_batch_template` (
  `TEMPLATE_ID` bigint(20) NOT NULL,
  `MODEL_ID` bigint(20) NOT NULL,
  `PRODUCTION_BATCH_CODE` varchar(20) default NULL,
  `TEMPLATE_NAME` varchar(64) NOT NULL,
  `PRODUCTION_DATE` date default NULL,
  `VALVE_STATE` varchar(2) default NULL COMMENT '00：无阀门\r\n            01：开\r\n            02：关\r\n            03：半开\r\n            04：不确定',
  `RECHARGE_MAX` varchar(20) default NULL,
  `INIT_CREDIT` varchar(20) default NULL,
  `OVERDRAFT_LIMIT` varchar(20) default NULL,
  `ALERT_LIMIT` varchar(20) default NULL,
  `LESS_CREDIT_LIMIT` varchar(20) default NULL,
  `IDLE_DAYS_LIMIT` int(11) default NULL,
  `AMR_TYPE` varchar(2) default NULL COMMENT '00：不自动上告\r\n            01：每分钟  02：每小时； 03：每天；04：每月；05：每两月\r\n            10：单月； 11：双月； \r\n            13：按时 14： 按天 15： 指定2时  16：指定2日',
  `AMR_PERIOD` int(11) default NULL,
  `AMR_TIME2` varchar(20) default NULL,
  `AMR_TIME3` varchar(20) default NULL,
  `AMR_TIME4` varchar(20) default NULL,
  `AMR_TIME5` varchar(20) default NULL,
  `AMR_TIME1` varchar(20) default NULL,
  `FROZEN_TYPE` varchar(2) default NULL COMMENT '01:小时冻结；02：日冻结；03：月冻结',
  `FROZEN_TIME` varchar(20) default NULL,
  `CUSTOM_PARAMS` varchar(8192) default NULL COMMENT '以JSON字符串的形式保存自定义部分参数',
  `CREATOR` varchar(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  PRIMARY KEY  (`TEMPLATE_ID`),
  KEY `FK_Reference_3` (`MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `as_meter_custom_template` (
  `TEMPLATE_ID` bigint(20) NOT NULL,
  `MODEL_ID` bigint(20) NOT NULL,
  `TEMPLATE_NAME` varchar(64) NOT NULL,
  `VALVE_STATE` varchar(2) default NULL COMMENT '00：无阀门\r\n            01：开\r\n            02：关\r\n            03：半开\r\n            04：不确定',
  `RECHARGE_MAX` varchar(20) default NULL,
  `INIT_CREDIT` varchar(20) default NULL,
  `OVERDRAFT_LIMIT` varchar(20) default NULL,
  `ALERT_LIMIT` varchar(20) default NULL,
  `LESS_CREDIT_LIMIT` varchar(20) default NULL,
  `IDLE_DAYS_LIMIT` int(11) default NULL,
  `AMR_TYPE` varchar(2) default NULL COMMENT '00：不自动上告\r\n            01：每分钟  02：每小时； 03：每天；04：每月；05：每两月\r\n            10：单月； 11：双月； \r\n            13：按时 14： 按天 15： 指定2时  16：指定2日',
  `AMR_PERIOD` int(11) default NULL,
  `AMR_TIME1` varchar(20) default NULL,
  `AMR_TIME2` varchar(20) default NULL,
  `AMR_TIME3` varchar(20) default NULL,
  `AMR_TIME4` varchar(20) default NULL,
  `AMR_TIME5` varchar(20) default NULL,
  `FROZEN_TYPE` varchar(2) default NULL COMMENT '01:小时冻结；02：日冻结；03：月冻结',
  `FROZEN_TIME` varchar(20) default NULL,
  `CUSTOM_PARAMS` varchar(8192) default NULL COMMENT '以JSON字符串的形式保存自定义部分参数',
  `CREATOR` varchar(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  PRIMARY KEY  (`TEMPLATE_ID`),
  KEY `FK_Reference_17` (`MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `as_meter_model` (
  `MODEL_ID` bigint(20) NOT NULL COMMENT '型号ID',
  `MODEL_NAME` varchar(64) NOT NULL COMMENT '型号名称',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '所属部门',
  `REMOTE_COMM_TYPE` varchar(2) default NULL COMMENT '01：GPRS/CDMA； 02：3G； 03：4G； 04：SMS（短信）',
  `LOCAL_COMM_TYPE` varchar(2) default NULL COMMENT '01：RF组网；  02：RF扩频组网；03：RF点抄；04：RS232(485);  05：WIFI； 06：蓝牙',
  `MANUFACTURE_CODE` varchar(20) NOT NULL COMMENT '设备厂家编号',
  `METER_PAY_TYPE` varchar(2) NOT NULL COMMENT '表计计费类型 01：后付费 02：预付费',
  `METERING_MODEL` varchar(2) default NULL COMMENT '计量方式 01：霍尔；02：光电；03：超声波',
  `RECHARGE_TYPE` varchar(2) default NULL COMMENT '充值类型\r\n            00：不能充值（N/A）\r\n            01：IC卡充气； \r\n            02：IC卡充钱 \r\n            03：远程充气； 04：远程充钱\r\n            05：IC+远程充气； 06：IC+远程充钱；\r\n            07：NFC充气； 08：NFC充钱；\r\n            04：蓝牙充值',
  `BATTERY_TYPE` varchar(2) default NULL COMMENT '电池种类 01：碱性电池 02：锂电池',
  `BATTERY_LIFE` int(11) NOT NULL COMMENT '预期电池寿命',
  `CREATOR` varchar(20) default NULL COMMENT '创建人',
  `CREATE_DATE` datetime default NULL COMMENT '创建日期',
  PRIMARY KEY  (`MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存表计型号表';


CREATE TABLE IF NOT EXISTS `as_meter_params_hi` (
  `METER_ID` bigint(20) NOT NULL,
  `VALVE_STATE` varchar(2) default NULL COMMENT '阀门状态 00：无阀门；  01：开；  02：关；03：半开  04：不确定；05：异常；06：强制开；07：强制关;08：退出强制',
  `RECHARGE_MAX` varchar(20) default NULL,
  `INIT_CREDIT` varchar(20) default NULL,
  `OVERDRAFT_LIMIT` varchar(20) default NULL,
  `ALERT_LIMIT` varchar(20) default NULL,
  `LESS_CREDIT_LIMIT` varchar(20) default NULL,
  `IDLE_DAYS_LIMIT` int(11) default NULL,
  `AMR_TYPE` varchar(2) default NULL COMMENT ' 00：不自动上告；01：每分钟；02：每小时；03：每天；04：每月(A_T1=#DDHHMM)；05：每两月(A_T1=#DDHHMM)；10：单月(A_T1=#DDHHMM)；11：双月(A_T1=#DDHHMM)；12：按分(A_P=#N)；13：按时(A_P=#N)；14：按天(A_P=#N)；15：指定2时(A_T1=#HHMM,A_T2=#HHMM)；16：指定2日(A_T1=#DDHHMM,A_T2=#DDHHMM)',
  `AMR_PERIOD` int(11) default NULL,
  `AMR_TIME1` varchar(20) default NULL,
  `AMR_TIME2` varchar(20) default NULL,
  `AMR_TIME3` varchar(20) default NULL,
  `AMR_TIME4` varchar(20) default NULL,
  `AMR_TIME5` varchar(20) default NULL,
  `FROZEN_TYPE` varchar(2) default NULL COMMENT '冻结时间单位；00:分钟；01：小时；02：日；03：无效',
  `FROZEN_TIME` varchar(20) default NULL,
  `CUSTOM_PARAMS` varchar(4096) default NULL COMMENT '以JSON字符串的形式保存自定义部分参数',
  `RECORD_TYPE` varchar(2) default NULL COMMENT '00 初始开通 ； 01 后期修改',
  `CREATE_TIME` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `as_sim` (
  `SIM_ID` bigint(20) NOT NULL,
  `SIM_CODE` varchar(20) NOT NULL,
  `SIM_CARD_TYPE` varchar(2) NOT NULL COMMENT '01：移动网联网； 02：移动公网；03：电信物联网； 04：电信公网；',
  `SIM_TARIFF_ID` varchar(10) NOT NULL,
  `ASSET_ID` bigint(20) default NULL,
  `TARIFF_BEGIN_DATE` date default NULL,
  `TARIFF_FINISH_DATE` date default NULL,
  `OPEN_DATE` date default NULL,
  `OVERDUE_FLAG` varchar(2) NOT NULL COMMENT '00：未知\r\n            01：未欠费\r\n            02：欠费',
  `GAS_COMPANY_CODE` varchar(20) NOT NULL COMMENT '单位',
  `CURR_METER_ID` bigint(20) default NULL,
  `REGION_CODE` varchar(20) default NULL,
  `GIS_LONGITUDE` int(11) default NULL COMMENT '经度',
  `GIS_LATITUDE` int(11) default NULL COMMENT '纬度',
  `SIM_STATE` varchar(2) NOT NULL COMMENT '00：入仓库；  01：领用； 02：使用中；\r\n            03：维修；  04：报废； 05：欠费；',
  `CURR_OPER` varchar(20) default NULL,
  `CURR_DEPT_CODE` varchar(20) default NULL COMMENT '单位',
  PRIMARY KEY  (`SIM_ID`),
  UNIQUE KEY `idx_da_bj_bjzch4` (`SIM_CODE`),
  KEY `FK_Reference_12` (`ASSET_ID`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`ASSET_ID`) REFERENCES `as_asset` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bs_batch_install` (
  `install_id` bigint(20) NOT NULL COMMENT '批量安装id',
  `install_code` varchar(20) NOT NULL COMMENT '建档code',
  `install_name` varchar(30) NOT NULL COMMENT '建档名称',
  `region_code` varchar(20) NOT NULL COMMENT '小区编码,针对该小区建档',
  `status` int(11) NOT NULL COMMENT '建档状态：0:批量建档初始状态，1：施工派发，2：户表关联, 3:表具初始化',
  `create_time` datetime default NULL COMMENT '创建时间',
  `TEMPLATE_ID` bigint(20) default NULL COMMENT '出厂参数模板id',
  `DEPT_CODE` varchar(20) default NULL,
  PRIMARY KEY  (`install_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批量新装表';


CREATE TABLE IF NOT EXISTS `cg_price_gas` (
  `price_id` bigint(20) NOT NULL COMMENT '气价id',
  `price_name` varchar(64) NOT NULL COMMENT '气价名称',
  `price_type` varchar(2) NOT NULL COMMENT '气价类型:0居民 1商业 2工业 3公福',
  `price_kinds` varchar(2) NOT NULL COMMENT '气价种类:1阶梯 0单一',
  `current_status` varchar(2) NOT NULL COMMENT '当前状态:0编辑、1发布、2执行、3失效、4禁用',
  `price_creator` varchar(64) default NULL COMMENT '气价创建人员',
  `dept_code` varchar(64) NOT NULL COMMENT '所属机构id',
  `price_standard` varchar(64) default NULL COMMENT '气价标准',
  `price_versions` decimal(14,1) NOT NULL COMMENT '气价版本',
  `price_create_date` date default NULL COMMENT '气价创建日期',
  `price_effective_date` date default NULL COMMENT '气价生效日期',
  `price_expiry_date` date default NULL COMMENT '气价失效日期',
  `price_approver` varchar(64) default NULL COMMENT '气价审批人员',
  `ladder_segments` int(11) NOT NULL COMMENT '阶梯段数',
  `gas_volume_ladder1` int(11) default NULL COMMENT '气价气量',
  `gas_volume_ladder2` int(11) default NULL,
  `gas_volume_ladder3` int(11) default NULL,
  `gas_volume_ladder4` int(11) default NULL,
  `gas_volume_ladder5` int(11) default NULL,
  `gas_price_ladder1` decimal(14,2) default NULL COMMENT '气价单价',
  `gas_price_ladder2` decimal(14,2) default NULL,
  `gas_price_ladder3` decimal(14,2) default NULL,
  `gas_price_ladder4` decimal(14,2) default NULL,
  `gas_price_ladder5` decimal(14,2) default NULL,
  `household_float` varchar(2) NOT NULL COMMENT '是否按户人数浮动',
  `float_person_num` int(11) default NULL COMMENT '浮动人数基数',
  `float_range` int(11) default NULL COMMENT '浮动幅度',
  `ladder_cycle` varchar(2) default NULL COMMENT '阶梯周期 0：月度 1：年度',
  `settlement_cycle` varchar(2) default NULL COMMENT '结算周期 0周 1单月 2双月 3年 ',
  `raise_rates` decimal(14,2) default NULL COMMENT '增值税率',
  `has_preferential` varchar(2) NOT NULL COMMENT '是否带有优惠策略',
  `preferential_method` varchar(2) NOT NULL COMMENT '0无优惠 1气价额度2气量优惠',
  `amount_price1` decimal(14,2) default NULL COMMENT '气价额度',
  `amount_price2` decimal(14,2) default NULL,
  `amount_price3` decimal(14,2) default NULL,
  `amount_price4` decimal(14,2) default NULL,
  `amount_price5` decimal(14,2) default NULL,
  `preferential_gas1` int(11) default NULL COMMENT '优惠气量',
  `preferential_gas2` int(11) default NULL,
  `preferential_gas3` int(11) default NULL,
  `preferential_gas4` int(11) default NULL,
  `preferential_gas5` int(11) default NULL,
  `price_method` varchar(2) default NULL COMMENT '价格策略:0调价日抄表 1调价日不抄表',
  PRIMARY KEY  (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cm_contract` (
  `CONTRACT_ID` bigint(20) default NULL COMMENT '合同ID',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `CONTRACT_CODE` varchar(20) default NULL COMMENT '合同编号',
  `OPERATE_TYPE` int(11) default NULL COMMENT '操作类型',
  `CONTRACT_TYPE` int(11) default NULL COMMENT '合同类型',
  `CONTRACT_DATE` datetime default NULL COMMENT '签订日期',
  `CONTRACT_BEGIN_DATE` datetime default NULL COMMENT '有效开始日期',
  `CONTRACT_VAILDITY` int(11) default NULL COMMENT '有效期 单位为月',
  `CONTRACT_PERSON` varchar(12) default NULL COMMENT '签订人',
  `CONTRACT_ADDR` varchar(20) default NULL COMMENT '签订地点',
  `CONTRACT_STATE` int(11) default NULL COMMENT '合同状态',
  `APPLY_CODE` varchar(20) default NULL COMMENT '申请编号',
  `RETROACT_REASON` varchar(80) default NULL COMMENT '补签原因',
   INDEX `index_cust_id` (`CUST_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户合同信息';

CREATE TABLE IF NOT EXISTS `cm_customer_gas` (
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `DEPT_CODE` varchar(20) NOT NULL,
  `GAS_CUST_TYPE` varchar(2) NOT NULL COMMENT '11居民普通户 、12居民低保户、13居民特困户、21工业用户、31商业用户、41公福用户、51其他',
  `GAS_CUST_STATE` varchar(2) NOT NULL default '0' COMMENT '用气客户的状态说明，说明客户是否处于变更中或已销户\r\n            01：正常用气客户，02：当前新装客户，03：当前变更客户，04：已销户客户\r\n            ',
  `INDUSTRY_CODE` varchar(20) NOT NULL COMMENT '见行业代码表',
  `OPEN_DATE` datetime NOT NULL COMMENT '开户时间',
  `CLOSE_DATE` datetime default NULL COMMENT '销户日期',
  `CBQM` varchar(16) default '' COMMENT '抄表区码',
  `CUST_NAME` varchar(32) NOT NULL COMMENT '户名',
  `CUST_ADDR_DETAIL` varchar(256) default NULL COMMENT '用户详细地址',
  `CREDENTIAL_TYPE` varchar(2) default NULL COMMENT '证件类型',
  `CREDENTIAL_NUMBER` varchar(20) default NULL COMMENT '证件号码',
  `CUST_MOBILE` varchar(64) default NULL COMMENT '户主手机',
  `CUST_CODE` varchar(64) default NULL COMMENT '户号',
  `REGION_CODE` varchar(32) NOT NULL COMMENT '地址区域ID',
  `GAS_REMARK` varchar(128) default '' COMMENT '备注',
  `CUST_LABEL` varchar(128) default NULL,
  PRIMARY KEY  (`CUST_ID`),
  KEY `Index 3` (`OPEN_DATE`),
  KEY `AK_UK_DEPT_ID_GAS_CUST_CODE` USING BTREE (`DEPT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `cm_customer_gas_detail` (
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `CUST_LEVEL` int(11) default NULL COMMENT '关注级别 1、2、3、4、5，默认是1',
  `CUST_DANGER` int(11) default '0' COMMENT '0：否、1：是，默认是0',
  `CUST_STOP` int(11) default NULL COMMENT '是否不可停气客户 0：否、1：是，默认是0',
  `SUB_TYPE` int(11) default NULL COMMENT '低保类型 A、B、C类，用1、2、3分别表示',
  `SUB_BEGIN_DATE` date default NULL COMMENT '低保开始日期',
  `SUB_END_DATE` date default NULL COMMENT '低保结束日期',
  `GAS_PERMIT_CODE` varchar(20) default NULL COMMENT '用气证编号',
  `CUST_RESIDENT` int(11) default NULL COMMENT '常住人口 1：是、0：否',
  `CUST_LEASE` int(11) default NULL COMMENT '是否租赁用户 1：是、0：否',
  `CUST_ONTICE_TYPE` int(11) default NULL COMMENT '欠费通知方式 0:短信、1:电话、2:微信、3:邮件，默认是0短信',
  `CUST_CARD_TYPE` int(11) default NULL COMMENT '用卡状态 0:无、1：已制、2:使用、3:挂失,默认是0',
  `CUST_CARD_CODE` varchar(20) default NULL COMMENT '用户卡编号',
  `NATIONALITY` varchar(20) default NULL COMMENT '国籍',
  `ENGLISH_NAME` varchar(20) default NULL COMMENT '英文名',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  PRIMARY KEY  (`CUST_ID`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`CUST_ID`) REFERENCES `cm_customer_gas` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='燃气客户详细信息表';

CREATE TABLE IF NOT EXISTS `cm_pay_account` (
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `ACCOUNT_ID` varchar(32) default NULL COMMENT '账号ID',
  `ACCOUNT_NAME` varchar(20) default NULL COMMENT '账户名称',
  `ACCOUNT_FROM` varchar(20) default NULL COMMENT '支付方式名称，如：支付宝、微信、中国银行',
  `PAY_MODE` int(11) default NULL COMMENT '支付方式，0：无、1：银行、2、微信、3、支付宝、4、其他',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  KEY `FK_Reference_38` (`CUST_ID`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`CUST_ID`) REFERENCES `cm_customer_gas` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户支付账户信息';


CREATE TABLE IF NOT EXISTS `cm_subdivide_conditions` (
  `condition_id` bigint(20) NOT NULL COMMENT '条件id',
  `subdivide_id` bigint(20) NOT NULL COMMENT '细分id',
  `GAS_CUST_TYPE` varchar(2) default NULL COMMENT '用户类型\r\n            11居民普通户 、12居民低保户、13居民特困户、21工业用户、31商业用户、41公福用户、51其他'',',
  `GAS_PROP_TYPE` varchar(2) default NULL COMMENT '用气性质\r\n            01工业\r\n            02商业\r\n            03集体\r\n            04民用\r\n            05其他',
  `INDUSTRY_CODE` varchar(20) default NULL COMMENT '行业分类\r\n            01农、林、牧。。\r\n            02~17见数据字典',
  `CUST_LEVEL` int(11) default NULL COMMENT '关注级别\r\n            1\r\n            2\r\n            3\r\n            4\r\n            5',
  `CUST_DANGER` varchar(2) default NULL COMMENT '是否高危重要客户',
  `CUST_STOP` varchar(2) default NULL COMMENT '是否不可停气客户',
  `SUB_TYPE` int(11) default NULL COMMENT '低保类型\r\n            1：A类\r\n            2：B类\r\n            3：C类',
  `CUST_LEASE` varchar(2) default NULL COMMENT '是否租赁用户',
  `CONTRACT_TYPE` int(11) default NULL COMMENT '合同类型\r\n            1：建设合同\r\n            2：工商业用户供气合同\r\n            3：居民用户供气合同',
  `PAY_MODE` int(11) default NULL COMMENT '支付方式，0：无、1：银行、2、微信、3、支付宝、4、其他'',',
  `METERING_MODEL` varchar(2) default NULL COMMENT '''计量方式 01：霍尔；02：光电；03：超声波'',',
  `METER_PAY_TYPE` varchar(2) default NULL COMMENT '结算方式01：后付费 02：预付费'',',
  `METER_TYPE` varchar(2) default NULL COMMENT '燃气表类型（0开头为气表类型定义；1开头为水表类型定义）\r\n            00：基表；01：RF远程表：02：RF点抄表：03：物联网表：04：IC卡表'',',
  `PRESS_TYPE` int(11) default NULL COMMENT '管网类型\r\n            1低压\r\n            2中压\r\n            3高压',
  `BUILDING_TYPE` int(11) default NULL COMMENT '房屋结构 1：楼房、2：平房、3：小二楼、4：高层、5：公寓、6：别墅、7：排屋'',',
  `INDOOR_POSITION` varchar(15) default NULL COMMENT '燃气表安装位置\r\n            0厨房\r\n            1过道\r\n            2阳台\r\n            3户外\r\n            4其他',
  `DEPT_CODE` varchar(20) NOT NULL,
  PRIMARY KEY  (`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户细分条件表：默认值或者null';


CREATE TABLE IF NOT EXISTS `cm_subdivide_conditions_value` (
  `condition_id` bigint(20) NOT NULL COMMENT '条件id',
  `group_id` bigint(20) default NULL COMMENT '群组id',
  `GAS_CUST_TYPE` varchar(2) default NULL COMMENT '用户类型\r\n            11居民普通户 、12居民低保户、13居民特困户、21工业用户、31商业用户、41公福用户、51其他'',',
  `GAS_PROP_TYPE` varchar(2) default NULL COMMENT '用气性质\r\n            01工业\r\n            02商业\r\n            03集体\r\n            04民用\r\n            05其他',
  `INDUSTRY_CODE` varchar(20) default NULL COMMENT '行业分类\r\n            01农、林、牧。。\r\n            02~17见数据字典',
  `CUST_LEVEL` int(11) default NULL COMMENT '关注级别\r\n            1\r\n            2\r\n            3\r\n            4\r\n            5',
  `CUST_DANGER` varchar(2) default NULL COMMENT '是否高危重要客户',
  `CUST_STOP` varchar(2) default NULL COMMENT '是否不可停气客户',
  `SUB_TYPE` int(11) default NULL COMMENT '低保类型\r\n            1：A类\r\n            2：B类\r\n            3：C类',
  `CUST_LEASE` varchar(2) default NULL COMMENT '是否租赁用户',
  `CONTRACT_TYPE` int(11) default NULL COMMENT '合同类型\r\n            1：建设合同\r\n            2：工商业用户供气合同\r\n            3：居民用户供气合同',
  `PAY_MODE` int(11) default NULL COMMENT '支付方式，0：无、1：银行、2、微信、3、支付宝、4、其他'',',
  `METERING_MODEL` varchar(2) default NULL COMMENT '''计量方式 01：霍尔；02：光电；03：超声波'',',
  `METER_PAY_TYPE` varchar(2) default NULL COMMENT '结算方式01：后付费 02：预付费'',',
  `METER_TYPE` varchar(2) default NULL COMMENT '燃气表类型（0开头为气表类型定义；1开头为水表类型定义）\r\n            00：基表；01：RF远程表：02：RF点抄表：03：物联网表：04：IC卡表'',',
  `PRESS_TYPE` int(11) default NULL COMMENT '管网类型\r\n            1低压\r\n            2中压\r\n            3高压',
  `BUILDING_TYPE` int(11) default NULL COMMENT '房屋结构 1：楼房、2：平房、3：小二楼、4：高层、5：公寓、6：别墅、7：排屋'',',
  `INDOOR_POSITION` varchar(15) default NULL COMMENT '燃气表安装位置\r\n            0厨房\r\n            1过道\r\n            2阳台\r\n            3户外\r\n            4其他',
  `DEPT_CODE` varchar(20) NOT NULL,
  PRIMARY KEY  (`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='条件值表';


CREATE TABLE IF NOT EXISTS `cm_subdivide_standard` (
  `subdivide_id` bigint(20) NOT NULL COMMENT '细分id',
  `subdivide_code` varchar(20) NOT NULL COMMENT '细分编号',
  `subdivide_name` varchar(64) NOT NULL COMMENT '细分名称',
  `condition_id` bigint(20) NOT NULL COMMENT '用户类型、用气性质、行业分类、关注级别、是否高危重要客户、是否不可停气客户、用户来源、低保类型、是否租赁用户、合同类型、支付方式、计量方式、结算方式、燃气表类型燃气表安装位置、管网类型、房层结构类型',
  `subdivide_make_person` varchar(20) NOT NULL COMMENT '制定人',
  `subdivide_make_date` date NOT NULL COMMENT '制定时间',
  `dept_code` varchar(20) NOT NULL,
  PRIMARY KEY  (`subdivide_id`),
  KEY `FK_Reference_98` (`condition_id`),
  CONSTRAINT `FK_Reference_58` FOREIGN KEY (`condition_id`) REFERENCES `cm_subdivide_conditions` (`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户细分标准表';


CREATE TABLE IF NOT EXISTS `gas_equipment` (
  `OPEN_RECORD_ID` bigint(20) default NULL COMMENT '开通记录id',
  `EQUIP_TYPE` varchar(64) default NULL COMMENT '器具类型',
  `EQUIP_BRAND` varchar(64) default NULL COMMENT '器具品牌',
  `PIPE_SPEC` varchar(64) default NULL COMMENT '软管规格',
  `INSTALL_POSITION` varchar(64) default NULL COMMENT '器具安装位置',
  `PIPE_MATERIAL` varchar(64) default NULL COMMENT '软管材质',
  `MOVE_PA` varchar(50) default NULL COMMENT '动压',
  `STATIC_PA` varchar(50) default NULL COMMENT '静压',
  `MANU_DATE` varchar(50) default NULL COMMENT '生产年月',
  `EQUIP_MODEL` varchar(50) default NULL COMMENT '器具型号',
  `EQUIP_POWER` varchar(50) default NULL COMMENT '功率',
  `METER_READING` varchar(50) default NULL COMMENT '表具读数（点火开通时）',
  `METER_ID` bigint(20) default NULL COMMENT '表具id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='燃气用具表';

CREATE TABLE IF NOT EXISTS `meter_count` (
  `COUNT_ID` bigint(20) NOT NULL auto_increment,
  `DEPT` varchar(20) default NULL COMMENT '区域编码',
  `PLAN_DATE_METER` int(11) default NULL COMMENT '计划抄表日的抄表户数',
  `PLAN_METER` int(11) default NULL COMMENT '计划抄表户数',
  `SHOULD_METER` int(11) default NULL COMMENT '应抄户数',
  `PRACTICAL_METER` int(11) default NULL COMMENT '实抄户数',
  `NOT_METER` int(11) default NULL COMMENT '未抄户数',
  `ESTIMATE_METER` int(11) default NULL COMMENT '估抄户数',
  `ACCOUNT_AMOUNT` decimal(10,2) default NULL COMMENT '日账户总额',
  `RECHARGE` decimal(10,2) default NULL COMMENT '累计充值金额',
  `CONSUMPTION` decimal(10,2) default NULL COMMENT '日消费金额',
  `ARREARAGE` decimal(10,2) default NULL COMMENT '累计欠款金额',
  `USER_AMOUNT` decimal(10,2) default NULL COMMENT '日用气总量',
  `OVERDRAFT_AMOUNT` decimal(10,2) default NULL COMMENT '累计透支用气量',
  `COUNT_DATE` datetime default NULL COMMENT '统计日期',
  PRIMARY KEY  (`COUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `meter_upload_record` (
  `UPLOAD_REC_ID` bigint(20) NOT NULL COMMENT '记录ID',
  `TASK_ID` bigint(20) NOT NULL COMMENT '任务ID',
  `TASK_NAME` varchar(32) NOT NULL COMMENT '任务名称',
  `UPLOAD_TIME` datetime NOT NULL COMMENT '上传时间',
  `OPER_ID` bigint(20) NOT NULL COMMENT '抄表员ID',
  `OPER_NAME` varchar(20) default NULL,
  `METERS_NUM` int(11) NOT NULL COMMENT '本次抄表数',
  `MISSED_NUM` int(11) NOT NULL COMMENT '未抄到数',
  PRIMARY KEY  (`UPLOAD_REC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表机上传记录表';


CREATE TABLE IF NOT EXISTS `od_bus_frozengas` (
  `DATA_ID` bigint(20) NOT NULL COMMENT '本实体记录的唯一标识，创建供电单位的唯一编码。',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表计编码',
  `RECV_TIME` datetime NOT NULL COMMENT '上告时间',
  `DATA_TIME` datetime NOT NULL COMMENT '数据时间',
  `SIGNAL_STRENGTH` int(11) default NULL COMMENT '信号强度',
  `TOTAL_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '累计总量',
  `REMAIN_MONEY` decimal(10,2) default NULL COMMENT '剩余金额',
  `CURRENT_PRICE` decimal(10,2) default NULL COMMENT '单位类别：国网公司、省公司、地市公司、区县公司、分公司、供电所等。01 国网公司、02 省公司、03 地市公司 、04 区县公司、05 分公司、06 供电所。',
  `TIERED_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '阶梯用气量',
  `BATTERY_VOLTAGE` int(11) default NULL COMMENT '电池电压',
  `BATTERY_PERCENT` int(11) default NULL COMMENT '电池百分比%',
  `STD_CONDITION_VOLUMN` decimal(10,3) unsigned default NULL COMMENT '标况总量',
  `WORKING_CONDITION_VOLUMN` decimal(10,3) default NULL COMMENT '工况总量',
  `STD_CONDITION_FLOW` decimal(10,3) default NULL COMMENT '标况流量 单位：立方米/秒',
  `WORKING_CONDITION_FLOW` decimal(10,3) default NULL COMMENT '工况流量',
  `TEMPERATURE` decimal(10,2) default NULL COMMENT '工况流量',
  `PRESSURE` decimal(10,2) default NULL COMMENT '压力',
  `SOUND_SPEED` decimal(3,1) default NULL COMMENT '声速',
  `FLOWMETER_TEMP_STATUS` varchar(3) default NULL COMMENT '流量计温度状态 0：正常；1：损坏；2：超范围',
  `FLOWMETER_PRESS_STATUS` varchar(3) default NULL COMMENT '流量计压力状态 0：正常；1：损坏；2：超范围',
  `FLOWMETER_MEASSURE_STATUS` varchar(2) default NULL COMMENT '流量计计量状态\r\n            0：两路工作正常；\r\n            1：第一路工作异常；\r\n            2：第二路工作异常；\r\n            3：两路均异常',
  `FLOWMETER_MEASSURE_INFO_CODE` varchar(2) default NULL COMMENT '流量计计量信息\r\n            1：反向；\r\n            2：小流；\r\n            3：超流；',
  `FLOWMETER_BATTERY_STATUS` varchar(2) default NULL COMMENT '流量计电池状态\r\n            0：正常；\r\n            1：欠压；',
  `FLOWMETER_BATTERY_PERCENT` int(11) default NULL COMMENT '流量计电池百分比',
  `COUNT_MODE` varchar(4) default NULL COMMENT '计数方式0：霍尔_0.1M3;1：霍尔_1M3;2：脉冲_1M3;3：光电;4：串口_超声波流量计;5：RS485_FMG体积修正仪;6：RS485_苍南流量计;7：RS485_天信流量计;8：RS485_德闻流量计;9：RS485_埃尔斯特流量计;10：RS485_卓度流量计;11：RS485_新科流量计;12：RS485_爱创流量计;13：RS485_罗美特流量计；14：OC_0.1M3;15：OC_1M3;16：CMOS_0.1M3;17：CMOS_1M3',
  `STORAGE_STATUS_CODE` varchar(2) default NULL COMMENT '存储状态\r\n            0：正常；\r\n            1：异常；',
  `MONEY_STATUS_CODE` varchar(2) default NULL COMMENT '金额状态\r\n            0：正常；\r\n            1：少额告警；\r\n            2：欠费告警；\r\n            3：透支告警',
  `VOLTAGE_STATUS_CODE` varchar(2) default NULL COMMENT '电压状态\r\n            0：正常；\r\n            1：欠压告警；\r\n            2：低压告警',
  `OPENED` varchar(1) default NULL COMMENT '开通标志\r\n            0：未开通；\r\n            1：已开通；',
  `PAY_MODE` varchar(2) default NULL COMMENT '付费模式\r\n            0：后付费；\r\n            1：预付费；',
  `OPEN_COVER` varchar(1) default NULL COMMENT '开盖标志 0：关；1：开',
  `BREAK_LINE` varchar(1) default NULL COMMENT '\r\n            断线标志 0：正常；1：断线；',
  `VALVE_STATUS` varchar(2) default NULL COMMENT '阀门状态\r\n            0：开 ；\r\n            1：关 ；\r\n            2：无阀；\r\n            3：强制开；\r\n            4：强制关；\r\n            5：退出强制；\r\n            6：开阀中；\r\n            7：关阀中；\r\n            8：强制开阀中；\r\n            9：强制关阀中；\r\n            10：不定状态；\r\n            11：异常',
  `NET_TYPE` varchar(2) default NULL COMMENT '网络类型\r\n            0：移动专网；\r\n            1：移动公网；\r\n            2：电信专网；\r\n            3：电信公网',
  `LACK_MONEY_WARN` varchar(1) default NULL COMMENT '少额提醒标志\r\n            0：未开通；\r\n            1：已开通；',
  `OVERDRAFT_CLOSE` varchar(1) default NULL COMMENT '透支关阀标志\r\n            0：未开通；\r\n            1：已开通；',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  PRIMARY KEY  (`DATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商用冻结数据';


CREATE TABLE IF NOT EXISTS `od_bus_frozengas_hi` (
  `DATA_ID` bigint(20) NOT NULL COMMENT '本实体记录的唯一标识，创建供电单位的唯一编码。',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表计编码',
  `RECV_TIME` datetime NOT NULL COMMENT '上告时间',
  `DATA_TIME` datetime NOT NULL COMMENT '数据时间',
  `SIGNAL_STRENGTH` int(11) default NULL COMMENT '信号强度',
  `TOTAL_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '累计总量',
  `REMAIN_MONEY` decimal(10,2) default NULL COMMENT '剩余金额',
  `CURRENT_PRICE` decimal(3,2) default NULL COMMENT '单位类别：国网公司、省公司、地市公司、区县公司、分公司、供电所等。01 国网公司、02 省公司、03 地市公司 、04 区县公司、05 分公司、06 供电所。',
  `TIERED_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '阶梯用气量',
  `BATTERY_VOLTAGE` int(11) default NULL COMMENT '电池电压',
  `BATTERY_PERCENT` int(11) default NULL COMMENT '电池百分比%',
  `STD_CONDITION_VOLUMN` decimal(10,3) default NULL COMMENT '标况总量',
  `WORKING_CONDITION_VOLUMN` decimal(10,3) default NULL COMMENT '工况总量',
  `STD_CONDITION_FLOW` decimal(10,3) default NULL COMMENT '标况流量 单位：立方米/秒',
  `WORKING_CONDITION_FLOW` decimal(10,3) default NULL COMMENT '工况流量',
  `TEMPERATURE` decimal(3,2) default NULL COMMENT '工况流量',
  `PRESSURE` decimal(3,2) default NULL COMMENT '压力',
  `SOUND_SPEED` decimal(3,1) default NULL COMMENT '声速',
  `FLOWMETER_TEMP_STATUS` varchar(3) default NULL COMMENT '流量计温度状态 0：正常；1：损坏；2：超范围',
  `FLOWMETER_PRESS_STATUS` varchar(3) default NULL COMMENT '流量计压力状态 0：正常；1：损坏；2：超范围',
  `FLOWMETER_MEASSURE_STATUS` varchar(2) default NULL COMMENT '流量计计量状态\r\n            0：两路工作正常；\r\n            1：第一路工作异常；\r\n            2：第二路工作异常；\r\n            3：两路均异常',
  `FLOWMETER_MEASSURE_INFO_CODE` varchar(2) default NULL COMMENT '流量计计量信息\r\n            1：反向；\r\n            2：小流；\r\n            3：超流；',
  `FLOWMETER_BATTERY_STATUS` varchar(2) default NULL COMMENT '流量计电池状态\r\n            0：正常；\r\n            1：欠压；',
  `FLOWMETER_BATTERY_PERCENT` int(11) default NULL COMMENT '流量计电池百分比',
  `COUNT_MODE` varchar(4) default NULL COMMENT '计数方式0：霍尔_0.1M3;1：霍尔_1M3;2：脉冲_1M3;3：光电;4：串口_超声波流量计;5：RS485_FMG体积修正仪;6：RS485_苍南流量计;7：RS485_天信流量计;8：RS485_德闻流量计;9：RS485_埃尔斯特流量计;10：RS485_卓度流量计;11：RS485_新科流量计;12：RS485_爱创流量计;13：RS485_罗美特流量计；14：OC_0.1M3;15：OC_1M3;16：CMOS_0.1M3;17：CMOS_1M3',
  `STORAGE_STATUS_CODE` varchar(2) default NULL COMMENT '存储状态\r\n            0：正常；\r\n            1：异常；',
  `MONEY_STATUS_CODE` varchar(2) default NULL COMMENT '金额状态\r\n            0：正常；\r\n            1：少额告警；\r\n            2：欠费告警；\r\n            3：透支告警',
  `VOLTAGE_STATUS_CODE` varchar(2) default NULL COMMENT '电压状态\r\n            0：正常；\r\n            1：欠压告警；\r\n            2：低压告警',
  `OPENED` varchar(1) default NULL COMMENT '开通标志\r\n            0：未开通；\r\n            1：已开通；',
  `PAY_MODE` varchar(2) default NULL COMMENT '付费模式\r\n            0：后付费；\r\n            1：预付费；',
  `OPEN_COVER` varchar(1) default NULL COMMENT '开盖标志 0：关；1：开',
  `BREAK_LINE` varchar(1) default NULL COMMENT '\r\n            断线标志 0：正常；1：断线；',
  `VALVE_STATUS` varchar(2) default NULL COMMENT '阀门状态\r\n            0：开 ；\r\n            1：关 ；\r\n            2：无阀；\r\n            3：强制开；\r\n            4：强制关；\r\n            5：退出强制；\r\n            6：开阀中；\r\n            7：关阀中；\r\n            8：强制开阀中；\r\n            9：强制关阀中；\r\n            10：不定状态；\r\n            11：异常',
  `NET_TYPE` varchar(2) default NULL COMMENT '网络类型\r\n            0：移动专网；\r\n            1：移动公网；\r\n            2：电信专网；\r\n            3：电信公网',
  `LACK_MONEY_WARN` varchar(1) default NULL COMMENT '少额提醒标志\r\n            0：未开通；\r\n            1：已开通；',
  `OVERDRAFT_CLOSE` varchar(1) default NULL COMMENT '透支关阀标志\r\n            0：未开通；\r\n            1：已开通；',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  PRIMARY KEY  (`DATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商用冻结数据_历史';



CREATE TABLE IF NOT EXISTS `od_civil_frozengas` (
  `DATA_ID` bigint(20) NOT NULL COMMENT '数据记录ID',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表计编码',
  `RECV_TIME` datetime NOT NULL COMMENT '上告时间',
  `DATA_TIME` datetime NOT NULL COMMENT '冻结数据时间',
  `FROZEN_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '冻结气量数据',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  PRIMARY KEY  (`DATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='民用冻结数据';


CREATE TABLE IF NOT EXISTS `od_civil_frozengas_hi` (
  `DATA_ID` bigint(20) NOT NULL COMMENT '数据记录ID',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表计编码',
  `RECV_TIME` datetime NOT NULL COMMENT '上告时间',
  `DATA_TIME` datetime NOT NULL COMMENT '冻结数据时间',
  `FROZEN_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '冻结气量数据',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  PRIMARY KEY  (`DATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='民用冻结数据_历史';


CREATE TABLE IF NOT EXISTS `od_up_gas` (
  `DATA_ID` bigint(20) NOT NULL auto_increment COMMENT '数据记录ID',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表计编码',
  `RECV_TIME` datetime NOT NULL COMMENT '上告时间',
  `DATA_TIME` datetime NOT NULL,
  `SIGNAL_STRENGTH` int(11) default NULL COMMENT '信号强度',
  `CURRENT_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '当前累计气量',
  `PERIOD_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '周期累计气量',
  `REMAIN_MONEY` decimal(10,2) default NULL COMMENT '剩余金额',
  `COMSUMED_MONEY` decimal(10,2) default NULL COMMENT '消费金额',
  `REMAIN_VOLUMN` decimal(10,3) default NULL COMMENT '剩余气量',
  `LAST_RECHARGE_MONEY` decimal(10,2) default NULL COMMENT '末次充值金额',
  `CURRENT_PRICE` decimal(10,2) default NULL COMMENT '当前单价',
  `TEMPERATURE` decimal(10,2) default NULL COMMENT '温度',
  `PRESSURE` decimal(10,2) default NULL COMMENT '压力',
  `BATTERY_VOLTAGE` varchar(6) default NULL COMMENT '电池电压',
  `BATTERY_PERCENT` int(11) default NULL COMMENT '电池百分比%',
  `VOLTAGE_STATUS_CODE` varchar(2) default NULL COMMENT '电压状态 0：正常；1：欠压告警；2：低压告警',
  `MONEY_STATUS_CODE` varchar(2) default NULL COMMENT '金额状态0：正常；1：少额告警；2：欠费告警；3：透支告警',
  `VALVE_STATUS` varchar(2) default NULL COMMENT '阀门状态 00：无阀门；  01：开；  02：关；03：半开  04：不确定；05：异常；06：强制开；07：强制关',
  `MESSURE_STATUS_CODE` varchar(16) default NULL COMMENT '计量状态\\\\r\\\\n            0：正常 \\\\r\\\\n            1：异常；\\\\r\\\\n            2：表示表具有非严重性故障，启用冗余补偿测量，数据正常。\\\\r\\\\n            3：表具坏；\\\\r\\\\n            4：表具正发生强光干扰，本次读数已放弃，回传的数据为上次保存的数据；\\\\r\\\\n            5：关电只读模块未回应',
  `MESSURE_STATUS_ULTRASONIC_CODE` varchar(2) default NULL COMMENT '计量状态(超声波)\r\n            0：无；\r\n            1：开阀；\r\n            2：开阀中；\r\n            3：关阀：\r\n            4：关阀中；\r\n            5：异常；\r\n            6：阀门强开；\r\n            7：阀门强关',
  `LOW_VOLTAGE_CLOSE` varchar(2) default NULL COMMENT '低电关阀状态\r\n            0：开启；\r\n            1：禁止；',
  `CHAR_WHEEL_STATUS_CODE` varchar(2) default NULL COMMENT '字轮状态 0：异常；1：正常',
  `COMMUN_STATUS_CODE` varchar(2) default NULL COMMENT '通讯状态\r\n            0：通讯正常；\r\n            1：通讯故障',
  `STORAGE_STATUS_CODE` varchar(2) default NULL COMMENT '存储状态\r\n            0：正常；\r\n            1：异常；',
  `TIMING_STATUS_CODE` varchar(2) default NULL COMMENT '校时状态\r\n            0：已校时；\r\n            1：未校时',
  `BATTERY_TYPE_CODE` varchar(2) default NULL COMMENT '电池类型 0：碱电；1：锂电',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  `MSG_ID` varchar(80) default NULL COMMENT '消息id',
  `UP_TYPE` int(11) NOT NULL default '0' COMMENT '上告类型 0：召测、1：主动上告',
  `HAVE_MAGNETIC_ATTACK` varchar(2) default NULL COMMENT '是否受到磁攻击(00：无；01：有)',
  `MOD_DATA_TYPE` varchar(2) default NULL COMMENT '模块数据类型（00：光电数据；01：脉冲数据）',
  `route_level`          int default 1 comment '路由级数，为1是集中器',
  `RF_BATTERY_VOLTAGE`   varchar(6) comment 'rf模块电池电压',
  `FROZEN_TIME`          varchar(6) comment '冻结日期',
  `stand_gas_volumn`     DECIMAL(10,3) comment '标况总量',
  `industry_gas_volumn`  DECIMAL(10,3) comment '工况总量',
  `amount_trans_type`    char(10) comment '量传状态返回数据  0故障，1正常',
  `light_electric_status` int default 0 comment '光电状态 0：正常 1：通讯异常',
  PRIMARY KEY  (`DATA_ID`),
  index index_meter_code(meter_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表数据';


CREATE TABLE IF NOT EXISTS `od_up_gas_hi` (
  `DATA_ID` bigint(20) NOT NULL COMMENT '本实体记录的唯一标识，创建供电单位的唯一编码。',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表计编码',
  `RECV_TIME` datetime NOT NULL COMMENT '上告时间',
  `DATA_TIME` datetime NOT NULL,
  `SIGNAL_STRENGTH` int(11) default NULL COMMENT '信号强度',
  `CURRENT_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '当前累计气量',
  `PERIOD_GAS_VOLUMN` decimal(10,3) default NULL COMMENT '周期累计气量',
  `REMAIN_MONEY` decimal(10,2) default NULL COMMENT '剩余金额',
  `COMSUMED_MONEY` decimal(10,2) default NULL COMMENT '消费金额',
  `REMAIN_VOLUMN` decimal(10,3) default NULL COMMENT '剩余气量',
  `LAST_RECHARGE_MONEY` decimal(10,2) default NULL COMMENT '末次充值金额',
  `CURRENT_PRICE` decimal(10,2) default NULL COMMENT '当前单价',
  `TEMPERATURE` decimal(10,2) default NULL COMMENT '温度',
  `PRESSURE` decimal(10,2) default NULL COMMENT '压力',
  `BATTERY_VOLTAGE` varchar(6) default NULL COMMENT '电池电压',
  `BATTERY_PERCENT` int(11) default NULL COMMENT '电池百分比%',
  `VOLTAGE_STATUS_CODE` varchar(2) default NULL COMMENT '电压状态 0：正常；1：欠压告警；2：低压告警',
  `MONEY_STATUS_CODE` varchar(2) default NULL COMMENT '金额状态0：正常；1：少额告警；2：欠费告警；3：透支告警',
  `VALVE_STATUS` varchar(2) default NULL COMMENT '阀门状态 00：无阀门；  01：开；  02：关；03：半开  04：不确定；05：异常；06：强制开；07：强制关',
  `MESSURE_STATUS_CODE` varchar(16) default NULL COMMENT '计量状态\\r\\n            0：正常 \\r\\n            1：异常；\\r\\n            2：表示表具有非严重性故障，启用冗余补偿测量，数据正常。\\r\\n            3：表具坏；\\r\\n            4：表具正发生强光干扰，本次读数已放弃，回传的数据为上次保存的数据；\\r\\n            5：关电只读模块未回应',
  `MESSURE_STATUS_ULTRASONIC_CODE` varchar(2) default NULL COMMENT '计量状态(超声波)\r\n            0：无；\r\n            1：开阀；\r\n            2：开阀中；\r\n            3：关阀：\r\n            4：关阀中；\r\n            5：异常；\r\n            6：阀门强开；\r\n            7：阀门强关',
  `LOW_VOLTAGE_CLOSE` varchar(2) default NULL COMMENT '低电关阀状态\r\n            0：开启；\r\n            1：禁止；',
  `CHAR_WHEEL_STATUS_CODE` varchar(2) default NULL COMMENT '字轮状态 0：异常；1：正常',
  `COMMUN_STATUS_CODE` varchar(2) default NULL COMMENT '通讯状态\r\n            0：通讯正常；\r\n            1：通讯故障',
  `STORAGE_STATUS_CODE` varchar(2) default NULL COMMENT '存储状态\r\n            0：正常；\r\n            1：异常；',
  `TIMING_STATUS_CODE` varchar(2) default NULL COMMENT '校时状态\r\n            0：已校时；\r\n            1：未校时',
  `BATTERY_TYPE_CODE` varchar(2) default NULL COMMENT '电池类型 0：碱电；1：锂电',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  `MSG_ID` varchar(80) default NULL,
  `UP_TYPE` int(11) NOT NULL default '0' COMMENT '上告类型 0：召测、1：主动上告',
  `HAVE_MAGNETIC_ATTACK` varchar(2) default NULL COMMENT '是否受到磁攻击(00：无；01：有)',
  `MOD_DATA_TYPE` varchar(2) default NULL COMMENT '模块数据类型（00：光电数据；01：脉冲数据）',
  `route_level`          int default 1 comment '路由级数，为1是集中器',
  `RF_BATTERY_VOLTAGE`   varchar(6) comment 'rf模块电池电压',
  `FROZEN_TIME`          varchar(6) comment '冻结日期',
  `stand_gas_volumn`     DECIMAL(10,3) comment '标况总量',
  `industry_gas_volumn`  DECIMAL(10,3) comment '工况总量',
  `amount_trans_type`    char(10) comment '量传状态返回数据  0故障，1正常',
  `light_electric_status` int default 0 comment '光电状态 0：正常 1：通讯异常',
  PRIMARY KEY  (`DATA_ID`),
  index index_meter_code(meter_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史抄表数据';


CREATE TABLE IF NOT EXISTS `om_dataitem` (
  `dataitem_name` varchar(20) default NULL COMMENT '数据项名称',
  `dataitem_code` varchar(5) NOT NULL COMMENT '数据项编码，对应ygp自定义的编码',
  `dataitem_class` varchar(5) default NULL COMMENT '1：参数读设；\r\n            2：充值；\r\n            3：阀控；\r\n            4：调价；\r\n            5：校时；',
  `param_type` varchar(5) NOT NULL COMMENT '通信参数=1,抄表参数=2,阀控参数=3,报警参数=4,上告参数=5,冻结参数=6,校时参数=7',
  `show_style` varchar(15) default NULL COMMENT 'radio\r\n            string\r\n            integer\r\n            number\r\n            currency\r\n            date\r\n            checkbox\r\n            select',
  `display_order` int(11) default NULL COMMENT '显示顺序 值小的排前面',
  `dataitem_name_cn` varchar(50) default NULL,
  PRIMARY KEY  (`dataitem_code`),
  KEY `Index_msgId_funcode` (`param_type`,`dataitem_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前置交互数据项表';


CREATE TABLE IF NOT EXISTS `om_rela_dataitem_protocol` (
  `dataitem_code` varchar(5) NOT NULL COMMENT '设置id',
  `protocol_id` bigint(20) NOT NULL,
  `scope` int(11) default NULL COMMENT '命令作用范围  0表计，1集中器，2采集器',
  `rw_remark` int(11) default NULL COMMENT '1：只读；\\r\\n            2：只写；\\r\\n            3：读写；',
  `style_options` varchar(200) default NULL COMMENT '用于Combobox或RadioBox选项定义，如上告周期：日（1）#月（2）#单月#双月，用“#”隔开',
  PRIMARY KEY  (`dataitem_code`,`protocol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前置数据项协议关系表';


CREATE TABLE IF NOT EXISTS `pp_group_cust_detail` (
  `id` bigint(20) NOT NULL COMMENT '自增id',
  `cust_id` bigint(20) default NULL COMMENT '客户id',
  `last_reading` decimal(14,2) default NULL COMMENT '示度',
  `gas_consumption` decimal(14,2) default NULL COMMENT '用气量',
  `balance_state` varchar(2) default NULL COMMENT '少额状态   00:正常、01:少额预警、02:少额告警、03:透支、04:欠费',
  `fault_state` varchar(2) default NULL COMMENT '故障状态   00:正常、01:阀门异常、02:关阀走气、03:未抄到表、04:计量异常',
  `last_reading_time` datetime default NULL COMMENT '最近抄表时间',
  `notice_state` varchar(2) default NULL COMMENT '通知状态  00:已通知、01:未通知',
  `last_notice_time` datetime default NULL COMMENT '最近通知时间',
  `early_alarm_notice` varchar(2) character set utf8 collate utf8_bin default '00' COMMENT '预警是否发送通知 00：未通知 01：已通知',
  `alarm_notice` varchar(2) default '00' COMMENT '告警是否发送通知 00：未通知 01：已通知',
  `meter_code` varchar(20) default NULL COMMENT '表具编号',
  `valve_control_state` varchar(2) default NULL COMMENT '00：无阀；01：开阀成功；02：开阀中；03：关阀成功；04：关阀中 05：开阀异常；06：阀门强开失败；07：阀门强关失败；08：强制开阀成功 09：强制关阀成功；10：退出强制中；11：退出强制成功；12：退出强制失败；13：开阀堵转；14：关阀堵转;15：关阀异',
  `last_valve_control_time` datetime default NULL COMMENT '最近阀控时间',
  `dept_code` varchar(20) default NULL COMMENT '总公司code',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `pp_group_notice_info` (
  `id` bigint(20) NOT NULL COMMENT '自增id',
  `dept_code` varchar(20) default NULL,
  `notice_model` varchar(2) default NULL COMMENT '提醒模式',
  `oper_id` bigint(20) default NULL COMMENT '操作员id',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `pp_group_param_config` (
  `id` bigint(20) NOT NULL COMMENT '自增id',
  `group_id` bigint(20) default NULL COMMENT '群组id',
  `dept_code` varchar(20) default NULL COMMENT '部门编号',
  `config_category` varchar(2) default NULL COMMENT '配置类别   00:全局配置，01:当前群组配置',
  `early_alarm_amount` float default NULL COMMENT '预警金额',
  `alarm_amount` float default NULL COMMENT '告警金额',
  `valve_control_model` varchar(2) default NULL COMMENT '阀控模式  00:自动阀控模式，01人工阀控模式',
  `balance_config` decimal(10,2) default NULL COMMENT '自动阀控余额',
  `abnormal_command_days` varchar(2) default NULL COMMENT '提醒模式（天）',
  `owe_valve_control` varchar(5) default NULL COMMENT '提醒模式（户）',
  `notify_model` varchar(2) default NULL COMMENT '通知模式 00:系统自动通知，01:人工通知',
  `export_model` varchar(2) default NULL COMMENT '导出模式   00:开启余额不足通知清单定时导出，01:开启欠费用户清单定时导出',
  `frequency_unit` varchar(2) default NULL COMMENT '抄表周期频率单位   00:小时，01:天，02:月',
  `frequency_interval` varchar(50) default NULL COMMENT '抄表周期间隔',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `price_rela_cust` (
  `PRICE_ID` bigint(20) NOT NULL COMMENT '价格id',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `EFECTIVE_STATE` varchar(2) NOT NULL COMMENT '0 生效  1 失效',
  `EFECTIVE_TIME` datetime NOT NULL COMMENT '生效时间',
  `INVALID_TIME` datetime default NULL COMMENT '失效时间',
  `CYCLE_BEGINDATE` date default NULL COMMENT '周期开始时间',
  `CYCLE_ENDDATE` date default NULL COMMENT '周期截止时间',
  UNIQUE KEY `PRICE_ID_CUST_ID_EFECTIVE_STATE` (`PRICE_ID`,`CUST_ID`,`EFECTIVE_STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户价格关联表';


CREATE TABLE IF NOT EXISTS `p_account` (
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `EXTERNAL_ACCOUNT` varchar(100) default NULL COMMENT '账号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime default NULL COMMENT '修改时间',
  `BALANCE` decimal(10,2) NOT NULL default '0.00' COMMENT '余额',
  `CREDIT_LIMIT` decimal(10,2) NOT NULL default '0.00' COMMENT '信用额度',
  PRIMARY KEY  (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帐户表';


CREATE TABLE IF NOT EXISTS `p_account_log` (
  `OUT_SERIAL_NUMBER` varchar(50) default NULL COMMENT '外部流水号',
  `SERIAL_NUMBER` varchar(50) NOT NULL COMMENT '流水号',
  `EXTERNAL_ACCOUNT` varchar(100) default NULL COMMENT '外部账号',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `BALANCE_BEFORE` decimal(10,2) default NULL COMMENT '操作前余额',
  `OPERATION_TYPE` varchar(2) NOT NULL COMMENT '操作类型 00 充值 01 扣款',
  `AMOUNT` decimal(10,2) NOT NULL COMMENT '操作金额',
  `TRANSACTION_TIME` datetime NOT NULL COMMENT '交易时间',
  `RECHARGE_SOURCE` varchar(2) default NULL COMMENT '充值来源 01支付宝充值 02 微信充值 03银联充值 04营业厅100:现金101:支票200:工商201:杭州银行',
  `REMARK` varchar(256) default NULL COMMENT '备注',
  `CHANNEL_ID` varchar(20) default NULL COMMENT '渠道标示',
  `CUST_NO` varchar(50) default NULL COMMENT '客户编号',
  `ACCT_NO` varchar(50) default NULL COMMENT '账号（充值时用的付款账号）',
  `BANK` varchar(50) default NULL COMMENT '开户行',
  `INSERT_TIME` datetime default NULL COMMENT '时间（充值接口传送过来的时间）',
  `STATUS` varchar(2) default NULL COMMENT '状态：0 失败 1 成功',
  `NONCE_STR` varchar(64) default NULL COMMENT '随机字符串',
  `SIGN` varchar(64) default NULL COMMENT '签名',
  `BILL_CODE` varchar(50) default NULL COMMENT '账单流水号',
  PRIMARY KEY  (`SERIAL_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帐户流水表';


CREATE TABLE IF NOT EXISTS `p_cust_bill` (
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `BILL_CODE` varchar(50) NOT NULL COMMENT '账单流水号',
  `USED_GAS` decimal(10,2) NOT NULL COMMENT '本期用气量',
  `BILL_AMOUNT` decimal(10,2) NOT NULL COMMENT '账单金额',
  `PREFERENTIAL_AMOUNT` decimal(10,2) default NULL COMMENT '优惠金额',
  `BILL_BEGAIN_TIME` datetime default NULL COMMENT '账单开始时间',
  `BILL_END_TIME` datetime NOT NULL COMMENT '账单截止时间',
  `BILL_GENERATE_TIME` datetime NOT NULL COMMENT '生成账单时间',
  `CYCLE1_USED_GAS` decimal(10,2) NOT NULL default '0.00' COMMENT '周期1累计用气量',
  `CYCLE2_USED_GAS` decimal(10,2) default '0.00' COMMENT '周期2累计用气量',
  `CURRENT_STAIR` varchar(2) default NULL COMMENT '当前阶梯',
  `CURRENT_PRICE` decimal(10,2) NOT NULL COMMENT '当前价格',
  `LATE_FEE` decimal(10,2) NOT NULL default '0.00' COMMENT '滞纳金',
  `BILL_STATUS` varchar(2) NOT NULL COMMENT '清算标志 0 未缴费1 已缴费',
  `OTHER_FEE` decimal(10,2) NOT NULL COMMENT '其它费用',
  `REMARK` varchar(256) default NULL COMMENT '备注',
  `USED_GAS1` decimal(10,2) default NULL COMMENT '阶梯1用气量',
  `USED_GAS2` decimal(10,2) default NULL COMMENT '阶梯2用气量',
  `USED_GAS3` decimal(10,2) default NULL COMMENT '阶梯3用气量',
  `USED_GAS4` decimal(10,2) default NULL COMMENT '阶梯4用气量',
  `USED_GAS5` decimal(10,2) default NULL COMMENT '阶梯5用气量',
  `PRICE1` decimal(10,2) default NULL COMMENT '阶梯1价格',
  `PRICE2` decimal(10,2) default NULL COMMENT '阶梯2价格',
  `PRICE3` decimal(10,2) default NULL COMMENT '阶梯3价格',
  `PRICE4` decimal(10,2) default NULL COMMENT '阶梯4价格',
  `PRICE5` decimal(10,2) default NULL COMMENT '阶梯5价格',
  `USE_MONEY1` decimal(10,2) default NULL COMMENT '阶梯1用气金额',
  `USE_MONEY2` decimal(10,2) default NULL COMMENT '阶梯2用气金额',
  `USE_MONEY3` decimal(10,2) default NULL COMMENT '阶梯3用气金额',
  `USE_MONEY4` decimal(10,2) default NULL COMMENT '阶梯4用气金额',
  `USE_MONEY5` decimal(10,2) default NULL COMMENT '阶梯5用气金额',
  `PAYMENT_METHOD` varchar(2) default NULL COMMENT '0：支付宝1：微信支付2：银联支付3：Apply Pay支付 4 ：营业厅',
  `PAYMENT_PRESON` varchar(50) default NULL COMMENT '支付人',
  `PAYMENT_TIME` datetime default NULL COMMENT '支付时间',
  `BILL_TYPE` VARCHAR(2) NOT NULL COMMENT '0：后付费 1：预付费',
  PRIMARY KEY  (`BILL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单表';


CREATE TABLE IF NOT EXISTS `p_cust_bill_detail` (
  `PARENT_BILL_CODE` varchar(50) NOT NULL COMMENT '主账单流水号',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `METER_CODE` varchar(50) NOT NULL COMMENT '表号',
  `CUR_READING` decimal(14,2) NOT NULL COMMENT '本期读数',
  `CUR_READING_TIME` datetime NOT NULL COMMENT '本期抄表时间',
  `LAST_READING` decimal(14,2) NOT NULL COMMENT '上期读数',
  `LAST_READING_TIME` datetime default NULL COMMENT '上期抄表时间',
  `USED_GAS` decimal(10,2) NOT NULL COMMENT '本期用气量',
  `STATUS` varchar(2) NOT NULL COMMENT '账单状态 0 已生成账单 1 未生成账单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单明细表';


CREATE TABLE IF NOT EXISTS `p_dc_op_record` (
  `OP_ID` bigint(20) NOT NULL auto_increment COMMENT '操作id',
  `concentrator_code` varchar(20) default NULL COMMENT '集中器code',
  `collector_code` varchar(20) default NULL COMMENT '采集器code',
  `dept_code` varchar(20) NOT NULL COMMENT '部门code',
  `meter_code` varchar(20) default NULL COMMENT '表code',
  `op_from` varchar(64) NOT NULL COMMENT '操作来源：（系统名称/操作员名称）',
  `task_type` varchar(16) default NULL COMMENT '任务类型  10开通、100阀控、101调价、102充值、103表具参数设置、104表具参数读取、105校时、106 读月冻结数据、200全抄、201单抄、202集中器参数设置、 203集中器参数读取、204集中器全删、205集中器注册表具、206集中器读取表具列表 208:设置IP端口、209:读取IP端口',
  `task_desc` varchar(100) default NULL COMMENT '任务描述 100、101、102 时必须给出详细描述，如：“充值金额300，次数100，流水号212312313”',
  `task_content` varchar(2048) default NULL COMMENT '任务内容',
  `task_content_convert` varchar(1200) default NULL COMMENT '转换后的任务内容',
  `rs_content` varchar(1200) default NULL COMMENT '返回结果',
  `rs_content_convert` varchar(500) default NULL COMMENT '转换后的返回结果',
  `exec_result` int(11) default NULL COMMENT '执行结果(0：处理中，1：成功，2：失败，3：手动取消)',
  `error_msg` varchar(20) default NULL COMMENT '失败原因',
  `create_time` datetime default NULL COMMENT '创建时间',
  `end_time` datetime default NULL COMMENT '结束时间',
  `rw` int(11) default NULL COMMENT '0：读，1：写',
  `re_send_times` int(11) default NULL COMMENT '失败重发次数',
  `msg_id` varchar(100) default NULL COMMENT '消息id',
  `p_msg_id` varchar(25) default NULL COMMENT '父消息id',
  `fun_code` varchar(8) default NULL COMMENT '功能码',
  `METER_ID` bigint(20) NOT NULL default '0' COMMENT '表具ID，如果操作的不是表具，则该值为0',
  `valve_op` int(11) default NULL COMMENT '阀门控制 0：关，1：开',
  PRIMARY KEY  (`OP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备（集中器/采集器/表具）参数操作记录表';


CREATE TABLE IF NOT EXISTS `p_manual_valve_record` (
  `RECORD_ID` bigint(20) NOT NULL COMMENT '记录ID',
  `METER_CODE` varchar(20) NOT NULL default '' COMMENT '表具编号',
  `DEPT_CODE` varchar(20) NOT NULL default '' COMMENT '部门编号',
  `VALVE_CONTROL_TYPE` varchar(2) default NULL COMMENT '阀控类型 1:开阀；0:关阀',
  `INSERT_TIME` datetime default NULL COMMENT '导入时间',
  `VALVE_CONTROL_STATE` varchar(2) default NULL COMMENT '阀控状态 0:处理中 1:阀控成功 2:阀控失败 4:未发送 5:发送失败',
  `LAST_SEND_TIME` datetime default NULL COMMENT '最后一次下发时间',
  `SEND_NUM` varchar(11) default NULL COMMENT '发送次数',
  `msg_id` varchar(50) default NULL COMMENT '消息id',
  PRIMARY KEY  (`RECORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `p_meter_read_strategy` (
  `strategy_id` bigint(20) NOT NULL COMMENT '策略id',
  `METER_ID` bigint(20) default NULL COMMENT '表具ID',
  `METER_CODE` varchar(20) default NULL COMMENT '表具编码',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '所属部门',
  `cron_expression` varchar(20) default NULL COMMENT '定时表达式，格式：类型/间隔  类型取值 00:小时 01:天 02:月',
  `concentrator_code` varchar(20) default NULL COMMENT '集中器code',
  `collector_code` varchar(20) default NULL COMMENT '采集器code',
  `last_modify_time` datetime default NULL COMMENT '最后修改时间',
  `last_excute_time` datetime default NULL COMMENT '上次执行时间，非物联网表存放上次开始时间，物联网表存放开始时间',
  `op_from` varchar(20) NOT NULL COMMENT '操作来源：（系统名称/操作员名称）',
  `meter_date` varchar(40) default NULL COMMENT '抄表日：针对物联网表，时分固定在早上06点00',
  PRIMARY KEY  (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时抄表策略表';


CREATE TABLE IF NOT EXISTS `p_meter_set_no` (
  `METER_ID` bigint(20) NOT NULL COMMENT '表具ID',
  `METER_CODE` varchar(20) default NULL COMMENT '表具编码',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '所属部门',
  `price_modify_no` int(11) default NULL COMMENT '调价序号',
  `recharge_no` int(11) default NULL COMMENT '充值序号',
  `last_modify_time` datetime default NULL COMMENT '最后修改时间',
  PRIMARY KEY  (`METER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值/调价序号表';


CREATE TABLE IF NOT EXISTS `p_thingsnet_send` (
  `OP_ID` bigint(20) NOT NULL COMMENT '操作id',
  `METER_CODE` varchar(20) character set utf8 default NULL COMMENT '表具编码',
  `DEPT_CODE` varchar(20) character set utf8 NOT NULL COMMENT '所属部门',
  `TASK_TYPE` varchar(16) character set utf8 default NULL COMMENT '10开通、100阀控、101调价、102充值、103表具参数设置、104表具参数读取、105校时 208:设置IP端口、209:读取IP端口 210:读取阀门状态 211:读取冻结日 212:读取冻结周期 213:读取上告周期 214:读取上告日 215:读取阶梯价格 216:读取用户名密码217:设置冻结日218:设置冻结周期219:设置上告周期220:设置上告日221:设置用户名密码',
  `TASK_CONTENT` varchar(2048) character set utf8 default NULL COMMENT '下发内容',
  `TASK_DATA_MEAN` varchar(2500) character set utf8 default NULL COMMENT '任务返回数据内容解析',
  `TASK_STATUS` varchar(2) character set utf8 default NULL COMMENT '下发状态 01：未下发 02：已下发  03：发送成功  04：发送失败；05：取消 06 多次超时；',
  `RESENDTIMES` tinyint(4) default NULL COMMENT '重发次数',
  `CREATE_TIME` datetime default NULL COMMENT '生成时间',
  `LAST_SEND_TIME` datetime default NULL COMMENT '最近发送时间',
  `RETUEN_CONTENT` varchar(512) character set utf8 default NULL COMMENT '返回内容',
  `TASK_RESULT` varchar(2) character set utf8 default NULL COMMENT '00：还未处理 01：成功，02：失败',
  `fun_code` varchar(8) character set utf8 default NULL COMMENT '功能码',
  `pro_type` varchar(5) character set utf8 default NULL COMMENT '协议类型',
  `DONE_FLAG` int(11) default '0' COMMENT '是否已被抄表服务处理标记，0：未处理，1：已处理',
  `priority` int(11) default '0' COMMENT '优先级 0：默认，数值越大，优先级越高，最高为10',
  `ygp_proType` varchar(6) character set utf8 default NULL COMMENT 'ygp协议，与前置机协议有个对应关系',
  `data_item` varchar(512) character set utf8 default NULL COMMENT '操作关注的数据项',
  `TASK_CONTENT_SHOW` varchar(512) character set utf8 default NULL COMMENT '展示在页面的下发内容',
  `RETURN_CONTENT_SHOW` varchar(512) character set utf8 default NULL COMMENT '展示在页面的返回内容',
  PRIMARY KEY  (`OP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='物联网参数设置任务表';


CREATE TABLE IF NOT EXISTS `rm_book` (
  `RM_BOOK_ID` bigint(20) NOT NULL COMMENT '抄表册ID',
  `RM_BOOK_CODE` varchar(20) default NULL COMMENT '抄表册编码',
  `RM_BOOK_NAME` varchar(64) default NULL COMMENT '抄表册名称',
  `DEPT_CODE` varchar(20) default NULL COMMENT '部门编号：每一级采用两位级联的格式进行编码，如：父级01，子级：0101',
  `RM_TYPE_CODE` varchar(2) default NULL COMMENT '01：抄表机抄表、\\\\r\\\\n            02：远传抄表          03：主动上告     04：人工抄表'',',
  `OPER_ID` varchar(20) default NULL COMMENT '抄表员ID',
  `RM_BOOK_SATATUS` varchar(2) default NULL COMMENT '抄表册状态\r\n            01：已生成计划\r\n            02：未生成计划',
  `RM_BOOK_CREATOR` varchar(20) default NULL COMMENT '编制人名称',
  `CREATION_DATE` date default NULL COMMENT '编制时间',
  `LAST_RM_DATE` date default NULL COMMENT '上次抄表时间',
  `GAS_PROP_TYPE` varchar(2) NOT NULL COMMENT '01：工业:02：商业 03：集体（公福）04：民用 05：其它',
  `CREATE_DATE` datetime default NULL,
  PRIMARY KEY  (`RM_BOOK_ID`),
  UNIQUE KEY `RM_BOOK_CODE` (`RM_BOOK_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表册，用于抄表管理，对表计按抄表册进行管理，用于抄表计划的制定';


CREATE TABLE IF NOT EXISTS `rm_measuring_point` (
  `MEASURING_POINT_ID` bigint(20) NOT NULL COMMENT '计量点id',
  `GAS_PROP_TYPE` varchar(2) NOT NULL COMMENT '01：工业:02：商业 03：集体（公福）04：民用 05：其它',
  `REGION_CODE` varchar(20) NOT NULL COMMENT '地址区域编码,到楼栋，表计的REGION_CODE与此保持一致',
  `SEARCH_KEY` varchar(64) default NULL COMMENT '搜索关键字',
  `DETAIL_ADDR` varchar(50) default NULL COMMENT '详细地址，精确到单元门牌号',
  `ADDR_TYPE` int(11) default NULL COMMENT '地址状态 0:地址建立并已开通、1:地址建立尚未开通、2:地址被拆除',
  `INDOOR_POSITION` varchar(15) default NULL COMMENT '户内安装位置',
  `VENT_TYPE` int(11) default NULL COMMENT '立管通气状态 0:自然通风、1:强制通风',
  `VENT_DATE` datetime default NULL COMMENT '通气日期',
  `VENT_FIRE_TYPE` int(11) default NULL COMMENT '通气点火状态 0:未点火开通、1:已点火开通、2:点火开通异常',
  `VENT_FIRE_TIME` datetime default NULL COMMENT '通气点火时间',
  `CONSTRUCTION_UNIT` varchar(15) default NULL COMMENT '室内管道施工单位',
  `LAY_TYPE` int(11) default NULL COMMENT '管道铺设方式 1：明设、2：暗埋',
  `HOUSE_RIGHT` int(11) default NULL COMMENT '房屋产权 1：单位产权；2：自有产权3：使用权4：其他',
  `BUILDING_TYPE` int(11) default NULL COMMENT '房屋结构 1：楼房、2：平房、3：小二楼、4：高层、5：公寓、6：别墅、7：排屋',
  `HOUSE_MEASURE` int(11) default NULL COMMENT '建筑面积 ',
  `PRESS_TYPE` int(11) default NULL COMMENT '管网压力类型',
  `PIPE_BUILD_CODE` varchar(20) default NULL COMMENT '所属立管编号',
  `PIPE_LEADIN_CODE` varchar(20) default NULL COMMENT '所属引入管编号',
  `BOX_CODE` varchar(20) default NULL COMMENT '所属调压箱编号',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  `MP_TYPE_CODE` varchar(2) NOT NULL COMMENT '计量点分类 01客户表、02关口表',
  `MP_ATTR_CODE` varchar(2) NOT NULL COMMENT '计量点性质  01结算、02考核',
  `CUST_ID` bigint(20) default NULL COMMENT '客户id',
  PRIMARY KEY  (`MEASURING_POINT_ID`),
  KEY `index_GAS_PROP_TYPE` (`GAS_PROP_TYPE`),
  KEY `cust_id` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量点信息';


CREATE TABLE IF NOT EXISTS `rm_plan` (
  `RM_PLAN_ID` bigint(20) NOT NULL COMMENT '抄表计划ID',
  `RM_PLAN_CODE` varchar(20) default NULL COMMENT '抄表计划编码',
  `RM_PLAN_NAME` varchar(64) default NULL COMMENT '抄表计划名称',
  `DEPT_CODE` varchar(20) default NULL COMMENT '部门编号：每一级采用两位级联的格式进行编码，如：父级01，子级：0101',
  `RM_DAY` int(2) default NULL COMMENT '抄表日',
  `RM_PERIOD_CODE` varchar(2) default NULL COMMENT '抄表周期\r\n            01：月抄;\r\n            02：双月抄;\r\n            03：半月抄\r\n            04：周抄\r\n            05：日抄',
  `RM_PLAN_STATUS` varchar(2) default NULL COMMENT '抄表计划状态\r\n            01：未执行\r\n            02：执行中\r\n            03：已过期',
  `COMPLETE_DEGREE` varchar(5) NOT NULL COMMENT '完成进度',
  `EFFECTIVE_DATE` date default NULL COMMENT '生效日期',
  `EXPIRY_DATE` date default NULL COMMENT '失效日期',
  `RM_BOOK_CREATOR` varchar(20) default NULL COMMENT '编制人：填操作员名称',
  `CREATION_DATE` date default NULL COMMENT '编制时间',
  PRIMARY KEY  (`RM_PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表计划，用来衡量和管理一次抄表业务的完成情况及任务分配';


CREATE TABLE IF NOT EXISTS `rm_plan_execute_info` (
  `RM_PLAN_ID` bigint(20) NOT NULL COMMENT '抄表计划ID',
  `RM_DATE` date default NULL COMMENT '抄表时间',
  `PLAN_RM_METERS` int(11) default NULL COMMENT '计划抄表总数',
  `ACTUAL_RM_METERS` int(11) default NULL COMMENT '实际抄表数',
  `ESTIMATE_READ_METERS` int(11) default NULL COMMENT '估抄表数',
  `ACTUAL_PUBLISH_METERS` int(11) default NULL COMMENT '实际发布数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表计划执行记录';


CREATE TABLE IF NOT EXISTS `rm_plan_modify_info` (
  `PLAN_MOD_ID` bigint(20) NOT NULL COMMENT '计划变更记录ID',
  `RM_PLAN_ID` bigint(20) default NULL COMMENT '抄表计划ID',
  `MODIFY_TIME` datetime default NULL COMMENT '调整时间',
  `MODIFY_DETAIL` varchar(2048) default NULL COMMENT '调整明细',
  `MODIFY_REASON` varchar(128) default NULL COMMENT '调整原因',
  `MODIFY_OPERATOR` varchar(64) default NULL COMMENT '调整人',
  PRIMARY KEY  (`PLAN_MOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表计划调整记录';


CREATE TABLE IF NOT EXISTS `rm_point` (
  `RM_POINT_ID` bigint(20) NOT NULL COMMENT '抄表点ID',
  `RM_POINT_NAME` varchar(64) default NULL COMMENT '抄表点名称',
  `REGION_CODE` varchar(20) default NULL COMMENT '所属小区',
  `GPS_INFORMATION` varchar(20) default NULL COMMENT 'GPS经度 中间以逗号隔开',
  `RM_ORDER_NO` int(11) default NULL COMMENT '抄表顺序号',
  `BUILDING_CODE` varchar(20) default NULL COMMENT '楼栋编号',
  `UNIT_CODE` varchar(20) default NULL COMMENT '单元编号',
  `FLOOR` int(11) default NULL,
  `REMARK` varchar(256) default NULL COMMENT '备注',
  PRIMARY KEY  (`RM_POINT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表点，用于抄表机抄表模式';


CREATE TABLE IF NOT EXISTS `rm_pub_record` (
  `RM_PUB_ID` bigint(20) NOT NULL COMMENT '发布id',
  `OPER_NAME` varchar(20) NOT NULL COMMENT '发布人',
  `PUB_TAR_NAME` varchar(32) NOT NULL COMMENT '发布对象名称 对应一个系统名称',
  `PUB_NUM` int(11) NOT NULL COMMENT '发布总数',
  `PUB_TIME` datetime NOT NULL COMMENT '发布时间',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '部门编码',
  `OPER_ID` bigint(20) NOT NULL COMMENT '发布人Id',
  `task_name` varchar(120),  
  PRIMARY KEY  (`RM_PUB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表数据发布记录';


CREATE TABLE IF NOT EXISTS `rm_record` (
  `RM_RECORD_ID` bigint(20) NOT NULL COMMENT '抄表记录id',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `OPER_ID` bigint(20) NOT NULL COMMENT '抄表员id',
  `RM_PLAN_ID` bigint(20) default NULL,
  `TASK_ID` bigint(20) default NULL,
  `OPER_NAME` varchar(64) default NULL COMMENT '抄表员姓名',
  `LAST_READING` decimal(14,3) default NULL,
  `CUR_READING` decimal(14,3) default NULL,
  `RM_DATA_FROM` varchar(2) default NULL COMMENT '数据来源 01：正常抄表 02：估算抄表 ',
  `RM_TYPE_CODE` varchar(2) NOT NULL COMMENT '01：抄表机抄表、\r\n            02：远传抄表          03：主动上告     04：人工抄表',
  `RM_RECORD_STATE` varchar(2) NOT NULL COMMENT '00：初始状态 01：正常 02：未抄到 03：抄表异常',
  `ERROR_TYPE` varchar(2) default NULL COMMENT '异常处理类型\r\n            01：计量故障处理流程\r\n            02：违约用气处理流程\r\n            03：气费退补处理						\r\n            04：档案维护',
  `LAST_REC_TIME` datetime default NULL COMMENT '上次抄表时间',
  `CUR_REC_TIME` datetime default NULL COMMENT '本次抄表时间',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表具的编号',
  `DEPT_CODE` varchar(20) default NULL COMMENT '燃气公司编码',
  `CUST_CODE` varchar(64) NOT NULL COMMENT '客户编码',
  `METER_ID` bigint(20) default NULL COMMENT '表具ID',
  `GAS_CUST_TYPE` varchar(2) NOT NULL COMMENT '''01：居民用户；02：学校用户；03：工业用户；04：商业用户''',
  `PIC_URL` varchar(64) default NULL COMMENT '图片',
  `DC_ID` bigint(20) default NULL COMMENT '集中器采集器id',
  `TASK_BEGIN_DATE` date default NULL COMMENT '任务开始日期',
  `GAS_PROP_TYPE` varchar(2) NOT NULL COMMENT '用气性质',
  `RM_UP_TIME` datetime default NULL,
  `DATA_ID` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '原始数据id',
  `EXCEPTION_TYPE` varchar(2) default NULL COMMENT '00:无异常  01：光电异常  02：万位突变异常 03：连续2次估抄用户 04：点后后长时间未用气用户 05：表计倒走  06：表计飞走',
  PRIMARY KEY  (`RM_RECORD_ID`),
  KEY `FK_Reference_32` (`OPER_ID`),
  KEY `FK_Reference_35` (`RM_PLAN_ID`),
  KEY `FK_Reference_38` (`CUST_ID`),
  KEY `FK_Reference_40` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表记录表';


CREATE TABLE IF NOT EXISTS `rm_record_hi` (
  `RM_RECORD_ID` bigint(20) NOT NULL COMMENT '抄表记录id',
  `METER_ID` bigint(20) NOT NULL COMMENT '表具id',
  `CUST_CODE` varchar(64) NOT NULL COMMENT '客户编码',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `OPER_ID` bigint(20) NOT NULL COMMENT '抄表员id',
  `RM_PLAN_ID` bigint(20) default NULL COMMENT '抄表计划ID',
  `TASK_ID` bigint(20) default NULL COMMENT '任务ID',
  `OPER_NAME` varchar(64) default NULL COMMENT '抄表员姓名',
  `LAST_READING` decimal(14,3) default NULL COMMENT '上次读数',
  `CUR_READING` decimal(14,3) default NULL COMMENT '本次读数',
  `RM_TYPE_CODE` varchar(2) NOT NULL,
  `RM_DATA_FROM` varchar(2) NOT NULL COMMENT '数据来源 01：正常抄表 02：估算抄表 ',
  `RM_RECORD_STATE` varchar(2) NOT NULL COMMENT '00：初始状态 01：正常 02：未抄到 03：抄表异常',
  `ERROR_TYPE` varchar(2) default NULL COMMENT '异常处理类型\r\n            01：计量故障处理流程\r\n            02：违约用气处理流程\r\n            03：气费退补处理						\r\n            04：档案维护',
  `LAST_REC_TIME` datetime default NULL COMMENT '上次抄表时间',
  `CUR_REC_TIME` datetime default NULL COMMENT '本次抄表时间',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表具的编号',
  `DEPT_CODE` varchar(20) default NULL COMMENT '燃气公司编码',
  `GAS_CUST_TYPE` varchar(2) NOT NULL,
  `PIC_URL` varchar(64) default NULL COMMENT '图片',
  `DC_ID` bigint(20) default NULL COMMENT '集中器采集器id',
  `TASK_BEGIN_DATE` date default NULL COMMENT '任务开始日期',
  `GAS_PROP_TYPE` varchar(2) NOT NULL COMMENT '用气性质',
  `RM_UP_TIME` datetime default NULL,
  `DATA_ID` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '原始数据id',
  `EXCEPTION_TYPE` varchar(2) default NULL COMMENT '00:无异常  01：光电异常  02：万位突变异常 03：连续2次估抄用户 04：点后后长时间未用气用户 05：表计倒走  06：表计飞走',
  PRIMARY KEY  (`RM_RECORD_ID`),
  KEY `FK_Reference_29` (`OPER_ID`),
  KEY `FK_Reference_30` (`METER_ID`),
  KEY `FK_Reference_31` (`TASK_ID`),
  KEY `FK_Reference_34` (`RM_PLAN_ID`),
  KEY `FK_Reference_36` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表历史记录表';


CREATE TABLE IF NOT EXISTS `rm_rela_book_plan` (
  `RM_PLAN_ID` bigint(20) NOT NULL COMMENT '抄表计划ID',
  `RM_BOOK_ID` bigint(20) default NULL COMMENT '抄表册ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表计划与抄表册关系表';


CREATE TABLE IF NOT EXISTS `rm_rela_book_region` (
  `RM_BOOK_ID` bigint(20) NOT NULL COMMENT '抄表册ID',
  `REGION_CODE` varchar(20) NOT NULL COMMENT '区域ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表册/小区关系表';


CREATE TABLE IF NOT EXISTS `rm_rela_pub_record` (
  `RM_PUB_ID` bigint(20) NOT NULL COMMENT '发布id',
  `RM_RECORD_ID` bigint(20) NOT NULL COMMENT '抄表记录id',
  PRIMARY KEY  (`RM_PUB_ID`,`RM_RECORD_ID`),
  KEY `FK_Reference_39` (`RM_RECORD_ID`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`RM_RECORD_ID`) REFERENCES `rm_record_hi` (`RM_RECORD_ID`),
  CONSTRAINT `FK_RM_PUB_RECORD_RM_PUB_ID` FOREIGN KEY (`RM_PUB_ID`) REFERENCES `rm_pub_record` (`RM_PUB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据发布记录和历史记录关系表';

CREATE TABLE IF NOT EXISTS `rm_rela_task_book` (
  `RM_TASK_ID` bigint(20) NOT NULL COMMENT '抄表任务ID',
  `RM_BOOK_ID` bigint(20) default NULL COMMENT '抄表册ID',
  `RM_PLAN_ID` bigint(20) default NULL COMMENT '抄表计划ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表任务/抄表册';


CREATE TABLE IF NOT EXISTS `settle_data` (
  `DATA_ID` bigint(20) NOT NULL COMMENT '数据id',
  `MEASURING_POINT_ID` bigint(20) NOT NULL COMMENT '计量点id',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表号',
  `CUR_READING` decimal(14,2) NOT NULL COMMENT '本次读数',
  `CUR_READING_TIME` datetime NOT NULL COMMENT '本次抄表时间',
  `SETTLE_FLAG` varchar(2) NOT NULL COMMENT '结算标志',
  `CYCLE_USED_GAS` decimal(10,2) NOT NULL COMMENT '阶梯累计用气量',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户id',
  `DATA_SOURCE` varchar(2) NOT NULL COMMENT '数据来源 0 正常抄表 1 换表 2 调价 3 销户 4 过户 5 报停  ',
  `CHECK_TYPE` varchar(2) NOT NULL COMMENT '审核类型 1人工审核(后付费的) 2自动审核（预付费）',
  `BILL_CODE` varchar(50) default NULL COMMENT '账单流水号',
  PRIMARY KEY  (`DATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算基础数据表';


CREATE TABLE IF NOT EXISTS `ss_dept` (
  `DEPT_ID` bigint(20) NOT NULL COMMENT '机构ID',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '机构编码',
  `PARENT_DEPT_ID` varchar(20) default NULL COMMENT '上级机构ID',
  `DEPT_NAME` varchar(256) NOT NULL COMMENT '机构名称',
  `DEPT_TYPE` varchar(2) NOT NULL COMMENT '01 总公司、02 分公司、03 部门、04 营业厅、05 抄表班、06 核算班、07 计费班、 08 计量班\r\n            20 第三方机构（如收费代理）',
  `REGION_CODE` varchar(20) NOT NULL,
  PRIMARY KEY  (`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门信息';


CREATE TABLE IF NOT EXISTS `ss_dict_enum_data` (
  `DICT_DATA_ID` bigint(20) NOT NULL auto_increment,
  `DICT_CODE` varchar(20) NOT NULL,
  `DICT_LANG` varchar(2) NOT NULL,
  `ENUM_CODE` varchar(16) NOT NULL,
  `ENUM_VALUE` varchar(64) NOT NULL,
  PRIMARY KEY  (`DICT_DATA_ID`),
  KEY `dict_code` (`DICT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多国语言设计. 适合存放如 性别,表类型等\r\nSEX   01 : 男  02 女  00 未知';


CREATE TABLE IF NOT EXISTS `ss_dict_items` (
  `DICT_ID` bigint(20) NOT NULL auto_increment,
  `DICT_CODE` varchar(20) NOT NULL,
  `PARENT_DICT_CODE` varchar(20) default NULL,
  `DICT_VALUE` varchar(128) NOT NULL,
  `DICT_LANG` varchar(2) default NULL,
  `DICT_DESC` varchar(255) default NULL,
  `tableName` varchar(100) default NULL,
  `columName` varchar(100) default NULL,
  PRIMARY KEY  (`DICT_ID`),
  UNIQUE KEY `DICT_CODE` (`DICT_CODE`),
  UNIQUE KEY `DICT_CODE_2` (`DICT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国际化支持. 适合存放如 \r\n         预定义角色 (按角色编码) ;\r\n         ';


CREATE TABLE IF NOT EXISTS `ss_grid_display` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `TABLE_NAME` varchar(32) NOT NULL COMMENT '表名',
  `COLUMN_NAME` varchar(32) NOT NULL COMMENT '字段名',
  `DISPLAY` int(11) NOT NULL default '0' COMMENT '是否显示，0：显示，1：不显示，默认为0',
  `DISPLAY_ORDER` int(11) NOT NULL default '0' COMMENT '按升序排序，默认为0',
  `OPER_ID` bigint(20) NOT NULL COMMENT '操作员ID',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `AK_UK_SS_CUSTOMER_DISPLAY` (`OPER_ID`,`TABLE_NAME`,`COLUMN_NAME`),
  KEY `IDX_SS_CUSTOMER_DISPLAY_ALL` (`OPER_ID`,`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统平台_客户信息个性显示   实现定制信息按账号保存，下次登录后依然生效，客户自己选择可显示字段及显示顺序。';


CREATE TABLE IF NOT EXISTS `ss_homepage` (
  `HOMEPAGE_ID` bigint(20) NOT NULL,
  `HOMEPAGE_NAME_CODE` varchar(20) NOT NULL,
  `HOMEPAGE_URI` varchar(128) NOT NULL,
  `IS_DEFAULT` varchar(2) default NULL COMMENT '01表示系统默认首页，02表示其他首页',
  PRIMARY KEY  (`HOMEPAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页信息';


CREATE TABLE IF NOT EXISTS `ss_key_table` (
  `id` int(5) NOT NULL auto_increment,
  `type` int(5) default NULL,
  `sequence` float NOT NULL,
  `create_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `ss_menu` (
  `MENU_ID` int(20) NOT NULL auto_increment COMMENT '菜单编码',
  `PARENT_MENU_ID` int(8) default NULL COMMENT '上级菜单编码',
  `MENU_NAME_CODE` varchar(64) default NULL COMMENT '菜单名',
  `MENU_URI` varchar(128) default NULL COMMENT 'URL',
  `MENU_ICON` varchar(64) default NULL COMMENT '菜单图标',
  `MENU_STATE` varchar(2) default NULL,
  `MENU_SEQ` varchar(8) default NULL COMMENT '排序编码',
  `MENU_LANG` varchar(64) default NULL,
  PRIMARY KEY  (`MENU_ID`),
  KEY `IDX_XT_CD` (`MENU_URI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单资源';


CREATE TABLE IF NOT EXISTS `ss_message` (
  `message_id` bigint(20) NOT NULL auto_increment,
  `message_content` varchar(64) default NULL COMMENT '通知内容',
  `message_person` varchar(64) default NULL COMMENT '通知人员',
  `message_type` varchar(2) default NULL COMMENT '通知类型：00 :异常命令          01 :欠费待阀控    02余额预警       03:开阀',
  `message_status` varchar(2) default NULL COMMENT '通知状态 00 : 未读\\r\\n            01 : 已读',
  `message_time` datetime default NULL COMMENT '通知时间',
  `dept_code` varchar(20) default NULL COMMENT '部门编码',
  PRIMARY KEY  (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内通知表';


CREATE TABLE IF NOT EXISTS `ss_operation` (
  `OPERATION_ID` bigint(20) NOT NULL COMMENT '菜单编码',
  `OPERATION_NAME_CODE` varchar(20) NOT NULL COMMENT '操作名称',
  `OPERATION_TYPE` varchar(2) default NULL COMMENT '00：允许执行（如菜单） 01： 禁止执行\r\n            10：允许新增/创建  11 ：禁止新增\r\n            12：允许更新            13：禁止更新\r\n            14：允许删除            15：禁止删除         16：允许查询   17：禁止查询',
  `OPERATION_PARAM` varchar(64) default NULL COMMENT '一般存放资源ID，如菜单ID，或者业务自定义参数，如开关阀门等',
  `OPERATION_STATE` varchar(2) NOT NULL COMMENT '00：有效\r\n            01：无效',
  `OPERATION_SEQ` varchar(8) default NULL COMMENT '排序编码',
  `MENU_ID` varchar(20) default NULL COMMENT '菜单ID',
  `OPERATION_LANG` varchar(10) NOT NULL,
  PRIMARY KEY  (`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作权限表';


CREATE TABLE IF NOT EXISTS `ss_operator` (
  `OPER_ID` bigint(20) NOT NULL,
  `DEPT_ID` bigint(20) default NULL,
  `WORK_CODE` varchar(32) default NULL COMMENT '工号',
  `OPER_NAME` varchar(64) NOT NULL COMMENT '姓名',
  `OPER_PASSWORD` varchar(64) NOT NULL COMMENT '密码',
  `OPER_TYPE` varchar(2) NOT NULL,
  `OPER_STATE` varchar(2) NOT NULL COMMENT '状态：00注销\r\n            01： 有效；\r\n            02： 暂时禁用；',
  `OPER_MOBILE` varchar(64) default NULL COMMENT '手机',
  `OPER_TEL` varchar(40) default NULL COMMENT '电话',
  `OPER_CREATOR` varchar(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL COMMENT '创建日期',
  `IP_CONSTRAIN` varchar(64) default NULL COMMENT '绑定IP',
  `MAC_CONSTRAIN` varchar(32) default NULL COMMENT '绑定MAC',
  `OPER_EMAIL` varchar(64) default NULL COMMENT '邮箱地址',
  `ERR_LOGIN_NUM` int(11) default NULL COMMENT '登录错误次数',
  `LATEST_LOGIN_TIME` datetime default NULL COMMENT '最近登录时间',
  `ERR_PIN_NUM` int(11) default NULL COMMENT '短信验证码错误次数',
  PRIMARY KEY  (`OPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1、操作员信息，由系统录入产生';


CREATE TABLE IF NOT EXISTS `ss_operator_group` (
  `OPER_GROUP_ID` bigint(20) NOT NULL,
  `OPER_GROUP_NAME` varchar(128) NOT NULL,
  `OPER_GROUP_TYPE` varchar(2) NOT NULL,
  `OPER_GROUP_STATE` varchar(2) NOT NULL COMMENT '状态：00注销',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY  (`OPER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组';


CREATE TABLE IF NOT EXISTS `ss_oper_log` (
  `oper_no` bigint(20) NOT NULL COMMENT '操作流水号',
  `oper_id` bigint(20) NOT NULL COMMENT '操作员id',
  `dept_code` varchar(20) default NULL COMMENT '操作员机构号',
  `rquest_name` varchar(20) default NULL COMMENT '操作名称',
  `reruest_id` varchar(64) NOT NULL COMMENT '请求url',
  `oper_type` varchar(20) NOT NULL COMMENT '操作类型',
  `oper_date` date NOT NULL COMMENT '操作日期',
  `oper_time` datetime NOT NULL COMMENT '操作时间',
  `process_method` varchar(64) NOT NULL COMMENT '处理方法',
  `local_address` varchar(20) NOT NULL COMMENT 'ip地址',
  `request_params` varchar(2048) default NULL COMMENT '请求参数',
  `oper_state` varchar(2) NOT NULL COMMENT '操作状态 00：正常 01:失败',
  `exception_mesg` varchar(1024) default NULL COMMENT '报错信息',
  PRIMARY KEY  (`oper_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';


CREATE TABLE IF NOT EXISTS `ss_oper_role_assign` (
  `ROLE_ID` bigint(5) default NULL COMMENT '角色ID',
  `OPER_ID` bigint(20) default NULL,
  KEY `FK_Reference_47` (`ROLE_ID`),
  KEY `FK_Reference_48` (`OPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-用户关联表';


CREATE TABLE IF NOT EXISTS `ss_privilege` (
  `PRIVILEGE_ID` bigint(20) NOT NULL COMMENT '权限ID',
  `PRIVILEGE_TYPE` varchar(2) default NULL,
  `FK_RESOURCE_ID` bigint(20) default '30' COMMENT '存放菜单ID，首页定义ID，功能操作表ID等。由权限类型决定存放内容。',
  PRIMARY KEY  (`PRIVILEGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';


CREATE TABLE IF NOT EXISTS `ss_region` (
  `REGION_CODE` varchar(64) NOT NULL default '' COMMENT '单位代代码',
  `PARENT_REGION_CODE` varchar(64) default NULL COMMENT '上级单位代码',
  `REGION_NAME` varchar(256) default NULL COMMENT '单位名称',
  `REGION_TYPE` varchar(2) default NULL COMMENT '区域类别  0：国家 1：省/直辖市 2：市/直辖市区 3: 区/县  4: 镇/街道 5：村/小区 6：楼栋/村号  7：门牌号',
  `DEPT_CODE` varchar(20) default '',
  PRIMARY KEY  (`REGION_CODE`),
  KEY `index_regionCode` (`REGION_CODE`),
  KEY `index_DEPT_CODE` (`DEPT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';


CREATE TABLE IF NOT EXISTS `ss_rela_dept_region` (
  `DEPT_ID` bigint(20) default NULL COMMENT '机构ID',
  `REGION_CODE` varchar(64) default NULL COMMENT '单位代代码',
  KEY `FK_Reference_55` (`REGION_CODE`),
  KEY `FK_Reference_56` (`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位-区域关联表';


CREATE TABLE IF NOT EXISTS `ss_rela_group_operator` (
  `OPER_GROUP_ID` bigint(20) default NULL,
  `OPER_ID` bigint(20) default NULL,
  KEY `FK_Reference_49` (`OPER_GROUP_ID`),
  KEY `FK_Reference_50` (`OPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户所属组关系表';


CREATE TABLE IF NOT EXISTS `ss_rela_operator_dept` (
  `OPER_ID` bigint(20) default NULL,
  `DEPT_ID` bigint(20) default NULL COMMENT '机构ID',
  KEY `FK_Reference_44` (`OPER_ID`),
  KEY `FK_Reference_46` (`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限-操作员-部门关联';


CREATE TABLE IF NOT EXISTS `ss_rela_role_privilege` (
  `ROLE_ID` bigint(20) default NULL COMMENT '角色ID',
  `PRIVILEGE_ID` bigint(20) default NULL COMMENT '权限ID',
  KEY `FK_Reference_53` (`ROLE_ID`),
  KEY `FK_Reference_54` (`PRIVILEGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-权限关联表';


CREATE TABLE IF NOT EXISTS `ss_role` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `ROLE_NAME_CODE` varchar(20) NOT NULL COMMENT '角色名',
  `ROLE_DESC` varchar(256) default NULL COMMENT '说明',
  `ROLE_ATTR` varchar(2) NOT NULL default '01' COMMENT '01：有效，02：失效，03：删除标识',
  `ROLE_CREATOR` varchar(20) default NULL COMMENT '管理员（不是超级管理员）只能访问超级管理员创建的或自己创建的角色。如果是超级管理员创建的角色，则creator == null',
  `CREATE_DATE` datetime NOT NULL,
  `DEPT_ID` varchar(20) NOT NULL COMMENT '部门ID',
  `ROLE_TYPE` varchar(2) NOT NULL COMMENT '角色类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `ss_test` (
  `REGION_CODE` varchar(20) NOT NULL,
  `PARENT_REGION_CODE` varchar(20) default NULL,
  `REGION_NAME` varchar(256) default NULL,
  `REGION_TYPE` varchar(2) default NULL,
  `DEPT_CODE` varchar(20) default NULL,
  PRIMARY KEY  (`REGION_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `ss_user_group_role_assign` (
  `OPER_GROUP_ID` bigint(20) default NULL,
  `ROLE_ID` bigint(20) default NULL COMMENT '角色ID',
  KEY `FK_Reference_51` (`OPER_GROUP_ID`),
  KEY `FK_Reference_52` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `t_areainfo` (
  `id` int(11) NOT NULL,
  `level` int(11) default NULL,
  `name` varchar(255) default NULL,
  `parentId` int(11) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `t_task` (
  `id` bigint(20) NOT NULL auto_increment,
  `jobName` varchar(50) default NULL COMMENT '任务名称',
  `jobGroup` varchar(50) default NULL COMMENT '任务分组',
  `jobStatus` varchar(1) default NULL COMMENT '0:禁止1:启动2:删除',
  `cronExpression` varchar(150) default NULL COMMENT '任务运行时间表达式',
  `description` varchar(255) default NULL COMMENT '任务描述',
  `jobType` int(11) default NULL COMMENT '任务类型 1：抄表计划分解',
  `deptCode` varchar(50) NOT NULL COMMENT '机构编码',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `as_meter` (
  `METER_ID` bigint(20) NOT NULL COMMENT '表具ID',
  `METER_CODE` varchar(20) NOT NULL COMMENT '表具编号',
  `ASSET_STATE` varchar(2) NOT NULL COMMENT '01：入仓库 02：领用 03：使用中 04：维修 05：报废',
  `METER_CATEGORY` varchar(2) NOT NULL COMMENT '00：虚拟表计\r\n            01：电表；\r\n            02：气表；\r\n            03：水表；\r\n            04：热表',
  `METER_TYPE` varchar(2) NOT NULL COMMENT '表计类型编码（0开头为气表类型定义；1开头为水表类型定义）\r\n            00：基表；01：RF远程表：02：RF点抄表：03：物联网表：04：IC卡表',
  `MANUFACTURE_CODE` varchar(20) NOT NULL COMMENT '生产厂商',
  `MODEL_ID` bigint(20) NOT NULL COMMENT '设备型号',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '所属部门',
  `REGION_CODE` varchar(20) NOT NULL COMMENT '所属楼栋，和计量点的REGION_CODE保持一致',
  `MEASURING_POINT_ID` bigint(20) default NULL COMMENT '计量点ID，为0时表示还未关联计量点',
  `GPS_INFO` varchar(64) default NULL COMMENT 'GPS信息，格式："经度,纬度"',
  `SIM_NUMBER` varchar(64) default NULL COMMENT 'SIM卡号码',
  `CREATOR` varchar(20) NOT NULL COMMENT '创建人',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建日期',
  `RM_TYPE_CODE` varchar(2) NOT NULL COMMENT '01：抄表机抄表     02：远传抄表          03：主动上告     04：人工抄表',
  `init_state` int(11) default '0' COMMENT '表计初始状态  0：未初始化 1:初始化成功,默认为0',
  `INLET_DIRECT` char(1) default NULL COMMENT '进气方向（0：左:1：右）',
  `BATCH_ID` varchar(20) default NULL COMMENT '导入或新建时批次id，用于方便找到刚导入的表',
  `PAY_TYPE_REAL` varchar(2) NOT NULL COMMENT '真正的付费方式 00：表端预付费  01：后付费 02：预付费，因为预付费的表可以当后付费使用',
  `DISMANTLE_TIME` datetime default NULL COMMENT '拆除时间',
  `DURATION_USE` varchar(5) default NULL COMMENT '使用期限',
  `TEMPLATE_ID`       bigint default 0 comment '模板id',
  PRIMARY KEY  (`METER_ID`),
  KEY `FK_Reference_1` (`MODEL_ID`),
  KEY `index_RM_TYPE_CODE` (`RM_TYPE_CODE`),
  CONSTRAINT `FK_FK_ASSET_METER` FOREIGN KEY (`METER_ID`) REFERENCES `as_asset` (`ASSET_ID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`MODEL_ID`) REFERENCES `as_meter_model` (`MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `as_rela_dc_meter` (
  `DC_ID` bigint(20) NOT NULL COMMENT '终端资产号',
  `METER_ID` bigint(20) NOT NULL,
  `CONFIG_TO_DC` varchar(2) NOT NULL COMMENT '00：正常运行\r\n            01：表计未设置装接关系；\r\n            02：已设置到集中器，待设置到采集器；\r\n            03：已设置到采集器，待设置到集中器；\r\n            ',
  PRIMARY KEY  (`DC_ID`,`METER_ID`),
  KEY `FK_Reference_10` (`DC_ID`),
  KEY `FK_Reference_9` (`METER_ID`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`DC_ID`) REFERENCES `as_dc` (`DC_ID`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`METER_ID`) REFERENCES `as_meter` (`METER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `as_meter_params` (
  `METER_ID` bigint(20) NOT NULL,
  `VALVE_STATE` varchar(2) default NULL COMMENT '阀门状态 00：无阀门；  01：开；  02：关；03：半开  04：不确定；05：异常；06：强制开；07：强制关;08：退出强制',
  `RECHARGE_MAX` varchar(20) default NULL,
  `INIT_CREDIT` varchar(20) default NULL,
  `OVERDRAFT_LIMIT` varchar(20) default NULL,
  `ALERT_LIMIT` varchar(20) default NULL,
  `LESS_CREDIT_LIMIT` varchar(20) default NULL,
  `IDLE_DAYS_LIMIT` int(11) default NULL,
  `AMR_TYPE` varchar(2) default NULL COMMENT ' 00：不自动上告；01：每分钟；02：每小时；03：每天；04：每月(A_T1=#DDHHMM)；05：每两月(A_T1=#DDHHMM)；10：单月(A_T1=#DDHHMM)；11：双月(A_T1=#DDHHMM)；12：按分(A_P=#N)；13：按时(A_P=#N)；14：按天(A_P=#N)；15：指定2时(A_T1=#HHMM,A_T2=#HHMM)；16：指定2日(A_T1=#DDHHMM,A_T2=#DDHHMM)',
  `AMR_PERIOD` int(11) default NULL,
  `AMR_TIME1` varchar(20) default NULL,
  `AMR_TIME2` varchar(20) default NULL,
  `AMR_TIME3` varchar(20) default NULL,
  `AMR_TIME4` varchar(20) default NULL,
  `AMR_TIME5` varchar(20) default NULL,
  `FROZEN_TYPE` varchar(2) default NULL COMMENT '冻结时间单位；00:分钟；01：小时；02：日；03：无效 ; 04 : 月',
  `FROZEN_TIME` varchar(20) default NULL,
  `CUSTOM_PARAMS` varchar(4096) default NULL,
  PRIMARY KEY  (`METER_ID`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`METER_ID`) REFERENCES `as_meter` (`METER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `as_rela_sim_device` (
  `DEVICE_ID` bigint(20) default NULL,
  `ASSET_ID` bigint(20) default NULL,
  `SIM_ID` bigint(20) NOT NULL,
  `OP_STATE` varchar(2) NOT NULL COMMENT '01：绑定\r\n            02：解除绑定',
  `OP_DATE` date NOT NULL,
  `OPERATOR` varchar(20) NOT NULL,
  KEY `FK_Reference_11` (`DEVICE_ID`),
  KEY `FK_Reference_15` (`ASSET_ID`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`DEVICE_ID`) REFERENCES `as_sim` (`SIM_ID`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`ASSET_ID`) REFERENCES `as_asset` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `bs_rela_install_mpoint` (
  `install_id` bigint(20) NOT NULL COMMENT '批量安装id',
  `measuring_point_id` bigint(20) NOT NULL COMMENT '计量点id',
  PRIMARY KEY  (`install_id`,`measuring_point_id`),
  KEY `FK_Reference_20` (`measuring_point_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`measuring_point_id`) REFERENCES `rm_measuring_point` (`MEASURING_POINT_ID`),
  CONSTRAINT `FK_Reference_45` FOREIGN KEY (`install_id`) REFERENCES `bs_batch_install` (`install_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批量新装和计量点的关系表';



CREATE TABLE IF NOT EXISTS `cm_customer_company` (
  `CUST_ID` bigint(20) NOT NULL COMMENT '用户id',
  `CMPY_NAME` varchar(30) default NULL COMMENT '单位名称',
  `CMPY_TINYNAME` varchar(10) default NULL COMMENT '单位简称',
  `CMPY_PHONE` varchar(20) default NULL COMMENT '单位电话',
  `CMPY_FAX` varchar(20) default NULL COMMENT '传真',
  `CMPY_EMAIL` varchar(30) default NULL COMMENT '邮箱',
  `CMPY_BUSINESS` varchar(100) default NULL COMMENT '主营业务',
  `CMPY_SCALE` varchar(20) default NULL COMMENT '经营规模（万元）、',
  `CMPY_PERSON_NUM` int(11) default NULL COMMENT '人数',
  `PERSON_CHARGE` varchar(15) default NULL COMMENT '负责人',
  `PERSON_CHARGE_MOBILE` varchar(64) default NULL COMMENT '负责人手机',
  `MNG_DEPT` varchar(20) default NULL COMMENT '主管部门',
  `ACCOUNT_UNIT` int(11) default NULL COMMENT '结算单位 0:人民币、1：美元、2：欧元、3：英镑',
  `CMPY_REMARK` varchar(80) default NULL COMMENT '备注',
  `LEGAL_PERSON` varchar(15) default NULL COMMENT '法人代表',
  PRIMARY KEY  (`CUST_ID`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`CUST_ID`) REFERENCES `cm_customer_gas` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='燃气客户单位信息';

CREATE TABLE IF NOT EXISTS `cm_customer_concat` (
  `CONCAT_ID` bigint(20) default NULL COMMENT '联系ID',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `CONTACT_TYPE` int(11) default NULL COMMENT '联系人类型  0：户主本人、1：业务办理联系、2：安检联系、3：财务联系等',
  `CONTACT_ADDRESS` varchar(32) default NULL COMMENT '联系地址',
  `POST_CODE` varchar(10) default NULL COMMENT '邮编',
  `GENDER` int(11) default NULL COMMENT '性别 0:男、1:女',
  `CONTACT_RELATION` varchar(10) default NULL COMMENT '与户主关系',
  `CONTACT_PHONE` varchar(15) default NULL COMMENT '联系人固定电话',
  `CONTACT_EMAIL` varchar(32) default NULL COMMENT '联系人电子邮箱',
  `CONTACT_NAME` varchar(20) default NULL COMMENT '联系人姓名',
  `CONTACT_MOBILE` varchar(64) default NULL COMMENT '联系人手机',
  `CONTACT_WECHAT` varchar(20) default NULL COMMENT '联系人微信',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  KEY `FK_Reference_36` (`CUST_ID`),
  CONSTRAINT `FK_Reference_36` FOREIGN KEY (`CUST_ID`) REFERENCES `cm_customer_gas` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户联系人信息';

CREATE TABLE IF NOT EXISTS `cm_customer_group` (
  `group_id` bigint(20) NOT NULL COMMENT '群组id',
  `group_code` varchar(20) NOT NULL COMMENT '群组编号',
  `group_name` varchar(64) NOT NULL COMMENT '群组名称',
  `create_time` date NOT NULL COMMENT '建立时间',
  `subdivide_id` bigint(20) NOT NULL COMMENT '细分编号',
  `customer_num` int(11) NOT NULL COMMENT '客户数',
  `condition_id` bigint(20) NOT NULL COMMENT '细分条件id',
  `group_priviliage` varchar(2) default NULL COMMENT '群组权限\r\n            0：私有\r\n            1：公有',
  `dept_code` varchar(20) default NULL COMMENT '部门编码',
  `update_method` varchar(2) default NULL COMMENT '群组更新方式\r\n            0：手动\r\n            1：自动',
  `subdivide_name` varchar(64) default NULL COMMENT '细分标准名称',
  `business_type` varchar(2) default NULL COMMENT '00:调价 01：阀控',
  `make_person` varchar(64) default NULL,
  PRIMARY KEY  (`group_id`),
  KEY `FK_Reference_62` (`subdivide_id`),
  KEY `FK_Reference_66` (`condition_id`),
  CONSTRAINT `FK_Reference_62` FOREIGN KEY (`subdivide_id`) REFERENCES `cm_subdivide_standard` (`subdivide_id`),
  CONSTRAINT `FK_Reference_66` FOREIGN KEY (`condition_id`) REFERENCES `cm_subdivide_conditions_value` (`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户群表';

CREATE TABLE IF NOT EXISTS `cm_rela_customer_group` (
  `cust_id` bigint(20) NOT NULL COMMENT '客户id',
  `group_id` bigint(20) NOT NULL COMMENT '群组id',
  KEY `FK_Reference_64` (`group_id`),
  KEY `FK_Reference_65` (`cust_id`),
  CONSTRAINT `FK_Reference_64` FOREIGN KEY (`group_id`) REFERENCES `cm_customer_group` (`group_id`),
  CONSTRAINT `FK_Reference_65` FOREIGN KEY (`cust_id`) REFERENCES `cm_customer_gas` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户-客户群关系表';

CREATE TABLE IF NOT EXISTS `rm_rela_rmpoint_meter` (
  `RM_POINT_ID` bigint(20) NOT NULL,
  `METER_ID` bigint(20) default NULL,
  KEY `FK_Reference_7` (`RM_POINT_ID`),
  KEY `FK_Reference_8` (`METER_ID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`RM_POINT_ID`) REFERENCES `rm_point` (`RM_POINT_ID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`METER_ID`) REFERENCES `as_meter` (`METER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表点与表计 ';

CREATE TABLE IF NOT EXISTS `rm_task` (
  `TASK_ID` bigint(20) NOT NULL COMMENT '任务ID',
  `RM_PLAN_ID` bigint(20) default NULL COMMENT '抄表计划ID，仅对抄表任务有效',
  `TASK_CODE` varchar(20) default NULL COMMENT '任务编码',
  `TASK_NAME` varchar(64) default NULL COMMENT '任务名称',
  `OPER_ID` bigint(20) default NULL COMMENT '操作员ID',
  `TASK_TYPE_CODE` varchar(2) default NULL COMMENT '01：抄表任务\\r\\n            02：表计初始化任务\\r\\n            03：表计安装任务\\r\\n            04：批量调价任务\\r\\n            05：故障排查任务\\r\\n            06：户内安检任务  07:点火通气任务 08:表计新装及初始化任务',
  `TASK_STATUS` varchar(2) NOT NULL COMMENT '01：未打开;\r\n            02：已接收;\r\n            03：已下放\r\n            04：已超期\r\n            05：已上传\r\n            06：已完成\r\n            \r\n            ',
  `TASK_BEGIN_DATE` date default NULL COMMENT '任务生效时间',
  `TASK_EXPIRY_DATE` date default NULL COMMENT '任务失效时间',
  `TASK_END_DATE` datetime default NULL COMMENT '任务完成时间',
  `TASK_PROP` varchar(2) NOT NULL COMMENT '任务性质 01：正常任务 02：临时任务',
  `REMARK` varchar(80) default NULL COMMENT '描述',
  `TASK_CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`TASK_ID`),
  KEY `FK_Reference_23` (`OPER_ID`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`OPER_ID`) REFERENCES `ss_operator` (`OPER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄表任务，用于分解抄表计划后，发送给对应的抄表员，进行抄表执行';

CREATE TABLE IF NOT EXISTS `bs_open_record` (
  `OPEN_RECORD_ID` bigint(20) NOT NULL COMMENT '记录id',
  `CUST_CODE` varchar(64) NOT NULL COMMENT '户号',
  `CUST_NAME` varchar(256) NOT NULL COMMENT '户名',
  `REGION_NAME` varchar(256) NOT NULL COMMENT '小区名',
  `REGION_CODE` varchar(20) NOT NULL COMMENT '区域编号',
  `SEARCH_KEY` varchar(20) default NULL COMMENT '检索码',
  `APPLY_TIME` datetime NOT NULL COMMENT '申请时间',
  `APPLY_CHANNEL` varchar(1) NOT NULL COMMENT '申请来源 0：营业厅 1：电话 3：app',
  `HANDLE_STATUS` varchar(1) default NULL COMMENT '处理状态 0：已受理 1：处理中 2 ：成功 3：失败',
  `ORDER_DATE` datetime default NULL COMMENT '预约时间',
  `CREATE_OPER_ID` bigint(20) NOT NULL COMMENT '受理员id',
  `HANDLE_OPER_ID` bigint(20) default NULL COMMENT '处理员id',
  `OPEN_CHANNEL` varchar(1) default NULL COMMENT '开通方式 1：人工 2：app',
  `ACTUAL_OPEN_TIME` datetime default NULL COMMENT '实际开通点火时间',
  `FINISH_TIME` datetime default NULL COMMENT '完成时间',
  `TASK_ID` bigint(20) default NULL COMMENT '任务id',
  `TASK_BEGIN_DATE` date default NULL COMMENT '任务开始时间',
  `CUST_MOBILE` bigint(64) NOT NULL COMMENT '联系电话',
  `DEPT_CODE` varchar(20) NOT NULL COMMENT '燃气公司编码',
  `CUST_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `PIC_URL` varchar(256) default NULL COMMENT '客户签名图片',
  `FAIL_MESG` varchar(256) default NULL COMMENT '备注（开通失败时的原因）',
  PRIMARY KEY  (`OPEN_RECORD_ID`),
  KEY `FK_Reference_59` (`CUST_ID`),
  KEY `FK_Reference_60` (`TASK_ID`),
  CONSTRAINT `FK_Reference_59` FOREIGN KEY (`CUST_ID`) REFERENCES `cm_customer_gas` (`CUST_ID`),
  CONSTRAINT `FK_Reference_60` FOREIGN KEY (`TASK_ID`) REFERENCES `rm_task` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开通点火记录表';

CREATE TABLE IF NOT EXISTS `bs_rela_task_mpoint` (
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `measuring_point_id` bigint(20) NOT NULL COMMENT '计量点id',
  `apply_time` datetime default NULL COMMENT '申请时间',
  `apply_from` varchar(10) default NULL COMMENT '申请来源',
  `apply_state` int(11) default NULL COMMENT '申请处理状态 0:已预约,1:已受理，2：已开通',
  `appoint_time` datetime default NULL COMMENT '预约时间',
  `dept_code` varchar(20) NOT NULL,
  PRIMARY KEY  (`task_id`,`measuring_point_id`),
  KEY `FK_Reference_37` (`measuring_point_id`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`measuring_point_id`) REFERENCES `rm_measuring_point` (`MEASURING_POINT_ID`),
  CONSTRAINT `FK_Reference_57` FOREIGN KEY (`task_id`) REFERENCES `rm_task` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务计量点关系表';


CREATE TABLE `AS_METER_TEMP` (
  `METER_ID` VARCHAR(50) DEFAULT NULL COMMENT '表具编号',
  `ASSET_CODE` VARCHAR(50) DEFAULT NULL COMMENT '资产编号',
  `METER_CODE` VARCHAR(50) DEFAULT NULL COMMENT '表具编号',
  `DC_CODE` VARCHAR(50) DEFAULT NULL COMMENT '集中器编号',
  `CUST_CODE` VARCHAR(50) DEFAULT NULL COMMENT '户号',
  `ASSET_STATE` VARCHAR(50) DEFAULT NULL COMMENT '01：入仓库 02：领用 03：使用中 04：维修 05：报废',
  `METER_TYPE` VARCHAR(50) DEFAULT NULL COMMENT '00：虚拟表计RN            01：电表；RN            02：气表；RN            03：水表；RN            04：热表',
  `METER_TYPENAME` VARCHAR(50) DEFAULT NULL COMMENT '00：虚拟表计RN            01：电表；RN            02：气表；RN            03：水表；RN            04：热表',
  `METER_CATEGORYNAME` VARCHAR(50) DEFAULT NULL COMMENT '表计类型编码（0开头为气表类型定义；1开头为水表类型定义）RN            00：基表；01：RF远程表：02：RF点抄表：03：物联网表：04：IC卡表',
  `MANUFACTURE_CODE` VARCHAR(50) DEFAULT NULL COMMENT '生产厂商',
  `MANUFACTURE_NAME` VARCHAR(50) DEFAULT NULL COMMENT '生产厂商',
  `MODEL_ID` VARCHAR(50) DEFAULT NULL COMMENT '设备型号',
  `MODEL_NAME` VARCHAR(50) DEFAULT NULL COMMENT '设备型号名称',
  `TEMPLATE_NAME` VARCHAR(80) DEFAULT NULL COMMENT '模板名称',
  `DEPT_CODE` VARCHAR(50) DEFAULT NULL COMMENT '所属部门',
  `REGION_CODE` VARCHAR(50) DEFAULT NULL COMMENT '所属楼栋，和计量点的REGION_CODE保持一致',
  `MEASURING_POINT_ID` BIGINT(50) DEFAULT NULL COMMENT '计量点ID，为0时表示还未关联计量点',
  `SIM_NUMBER` VARCHAR(64) DEFAULT NULL COMMENT 'SIM卡号码',
  `RM_TYPE_CODE` VARCHAR(50) DEFAULT NULL COMMENT '01：抄表机抄表     02：远传抄表          03：主动上告     04：人工抄表',
  `RM_TYPE_CODENAME` VARCHAR(50) DEFAULT NULL COMMENT '01：抄表机抄表     02：远传抄表          03：主动上告     04：人工抄表',
  `PAY_TYPE_REAL` VARCHAR(50) DEFAULT NULL COMMENT '真正的付费方式 00：表端预付费  01：后付费 02：预付费，因为预付费的表可以当后付费使用',
  `PAY_TYPE_REALNAME` VARCHAR(50) DEFAULT NULL COMMENT '真正的付费方式 00：表端预付费  01：后付费 02：预付费，因为预付费的表可以当后付费使用',
  `GAS_PROPTYPE` VARCHAR(50) DEFAULT NULL COMMENT '用气性质',
  `GAS_PROPTYPE_NAME` VARCHAR(50) DEFAULT NULL COMMENT '用气性质',
  `ASSET_TYPE` VARCHAR(50) DEFAULT NULL COMMENT '资产类型编码 01：集中器，02：采集器，03：表具',
  `BAR_CODE` VARCHAR(50) DEFAULT NULL COMMENT '资产条形码',
  `EXTERNAL_ASSET_CODE` VARCHAR(50) DEFAULT NULL COMMENT '外部资产编号',
  `COMM_PROTOCOL` VARCHAR(50) DEFAULT NULL COMMENT '通讯规约',
  `COMM_PROTOCOLNAME` VARCHAR(50) DEFAULT NULL COMMENT '通讯规约',
  `REMOTE_COMM_TYPE` VARCHAR(50) DEFAULT NULL COMMENT '01：GPRS/CDMA； 02：3G； 03：4G； 04：SMS（短信）； 05：ITHERNET；',
  `LOCAL_COMM_TYPE` VARCHAR(50) DEFAULT NULL COMMENT '本地通信方式 01：RF组网；  02：RF扩频组网；03：RF点抄；04：RS232(485);  05：WIFI； 06：蓝牙',
  `COMM_ADDR1` VARCHAR(32) DEFAULT NULL COMMENT '通讯地址1',
  `COMM_ADDR2` VARCHAR(32) DEFAULT NULL COMMENT '通讯地址2',
  `COMM_PORT1` VARCHAR(11) DEFAULT NULL COMMENT '通讯端口号1',
  `COMM_PORT2` VARCHAR(11) DEFAULT NULL COMMENT '通讯端口号2',
  `BAUD_RATE` VARCHAR(16) DEFAULT NULL COMMENT '波特率',
  `NETWORK_ID` VARCHAR(20) DEFAULT NULL,
  `FREQUENCY` VARCHAR(10) DEFAULT NULL COMMENT '频点(RF)',
  `APN` VARCHAR(20) DEFAULT NULL COMMENT '网络接入点',
  `area` VARCHAR(20) DEFAULT NULL COMMENT '小区',
  `buildingNumber` VARCHAR(50) DEFAULT NULL COMMENT '楼栋',
  `unitNumber` VARCHAR(20) DEFAULT NULL COMMENT '单元',
  `houseNumber` VARCHAR(20) DEFAULT NULL COMMENT '门牌号码',
  `BOOK_CODE` VARCHAR(50) DEFAULT NULL COMMENT '抄表册编号',
  `STATUS` VARCHAR(10) DEFAULT NULL,
  `CREATOR` VARCHAR(50) DEFAULT NULL COMMENT '操作者',
  `CREATE_DATE` DATE DEFAULT NULL,
  `INDOOR_POSITION` VARCHAR(15) DEFAULT NULL COMMENT '户内安装位置',
  `REMARK` VARCHAR(500) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `my_key_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `my_key` varchar(100) NOT NULL,
  `my_value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `my_key_value_un` (`my_key`),
  UNIQUE KEY `my_key_value_my_key_idx` (`my_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存一些运行时信息';


CREATE TABLE `bank_account_log` (
	`LOG_ID` bigint(20) NOT NULL COMMENT '记录Id',
	`ORDER_NUMBER` VARCHAR(50) NOT NULL COMMENT '序号',
	`TRANSACTION_DATE` DATETIME NOT NULL COMMENT '交易日期',
	`TRANSACTION_TIME` DATETIME NOT NULL COMMENT '交易时间',
	`OUT_SERIAL_NUMBER` VARCHAR(50) NOT NULL COMMENT '交易日志号（外部流水号）',
	`PRIMARY_ACNO` VARCHAR(64) NULL DEFAULT NULL COMMENT '主账号',
	`PRIMARY_ACNAME` VARCHAR(64) NULL DEFAULT NULL COMMENT '账户名称',
	`EXTERNAL_ACCOUNT` VARCHAR(100) NOT NULL  COMMENT '虚拟账号',
	`AMOUNT` DECIMAL(10,2) NOT NULL COMMENT '金额',
	`PAYER_ACNO` VARCHAR(50) NOT NULL  COMMENT '付款账号',
	`PAYER_NAME` VARCHAR(50) NOT NULL  COMMENT '付款方姓名',
	`PAYER_BANK_CODE` VARCHAR(64)NOT NULL  COMMENT '付款行行号',
	`PAYER_BANK` VARCHAR(50) NOT NULL  COMMENT '付款银行',
	`OPERATION_TYPE` VARCHAR(2) NOT NULL COMMENT '操作类型 00 充值',
	`REMARK` VARCHAR(256) NULL DEFAULT NULL COMMENT '备注',
	`CUST_ID` VARCHAR(50) NOT NULL COMMENT '客户ID',
	`DEPT_CODE` VARCHAR(20) NOT NULL COMMENT '部门编码',
	`FILE_NAME` VARCHAR(64) NOT NULL COMMENT '文件名',
	PRIMARY KEY (`OUT_SERIAL_NUMBER`,`TRANSACTION_DATE`,`LOG_ID`)
)
COMMENT='银行对账文件信息表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

/*银行对账文件处理日志表*/
CREATE TABLE `file_process_log` (
	`FILE_NAME` VARCHAR(64) NOT NULL COMMENT '文件名',
	`TOTAL_NUMBER` VARCHAR(64) NULL DEFAULT NULL COMMENT '总笔数：文件说明',
	`TOTAL_MONEY` VARCHAR(64) NULL DEFAULT NULL COMMENT '总金额：文件说明',
	`PROCESS_NUMBER` VARCHAR(64) NULL DEFAULT NULL COMMENT '信息完整数目',
	`WRONG_ENTRY` VARCHAR(2048) NULL DEFAULT NULL COMMENT '信息不完整条目',
	`PROCESS_TIME` DATETIME NOT NULL COMMENT '处理时间',
	`PROCESS_STATUS` VARCHAR(2) NOT NULL COMMENT '处理状态 0失败 1成功',
	PRIMARY KEY (`FILE_NAME`)
)
COMMENT='银行对账文件处理日志表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `t_realtimedata` (
	`GATEWAY_ID` VARCHAR(16) NOT NULL COMMENT 'EUI of the gateway',
	`EUI` VARCHAR(16) NOT NULL,
	`METER_ID` VARCHAR(16) NOT NULL DEFAULT '',
	`REAL_VOLUME` DECIMAL(10,3) NULL DEFAULT NULL COMMENT '实时表码值',
	`HOUR_FRONZEN` DECIMAL(10,3) NULL DEFAULT NULL COMMENT '小时冻结数据',
	`DATA_TIME` DATETIME NOT NULL COMMENT '表端的日期时间',
	`ALARM_CODE` VARCHAR(11) NULL DEFAULT NULL COMMENT '报警编码',
	`DIAGNOS` VARCHAR(11) NULL DEFAULT NULL,
	`Seq` INT(11) NULL DEFAULT NULL COMMENT '接收到数据的包序号',
	`GATEWAY_TIME` DATETIME NULL DEFAULT NULL COMMENT '网关的时间',
	`FREQ` FLOAT(11,0) NULL DEFAULT NULL COMMENT 'The frequency of the packet was received ',
	`SF` VARCHAR(16) NULL DEFAULT NULL COMMENT 'The sepctrum factor of the packet was received',
	`RSSI` VARCHAR(8) NULL DEFAULT NULL COMMENT 'The signal strenth of the packet was received ',
	`LSNR` FLOAT(11,0) NULL DEFAULT NULL COMMENT 'The SNR of the packet was received',
	`PORT` TINYINT(4) NULL DEFAULT NULL COMMENT 'The port was used by the packet which was difined in LoRaWAN '
)
COMMENT='临时表，用于Lorawan水表演示'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

/*新增密钥管理表*/
CREATE TABLE `as_secret_key` (
  `key_id` bigint(20) NOT NULL,
  `key_versions` varchar(20) DEFAULT NULL COMMENT '密钥版本号',
  `secret_key` varchar(64) DEFAULT NULL COMMENT '密钥',
  `protocol_id` varchar(20) DEFAULT NULL COMMENT '对应规约',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `key_status` varchar(2) DEFAULT NULL COMMENT '0：未投用\r\n   1：已投用',
  `create_person` varchar(20) DEFAULT NULL COMMENT '创建人',
  `key_length` int(20) DEFAULT '0' COMMENT '密钥长度',
  `dept_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `index_protocol` (`protocol_id`),
  KEY `index_keyId` (`key_id`)
) comment='密钥管理表' ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*新增历史密钥表*/
CREATE TABLE `as_secret_key_hi` (
  `update_id` bigint(20) NOT NULL COMMENT '历史信息Id',
  `key_id` bigint(20) DEFAULT NULL COMMENT '密钥id',
  `meter_id` bigint(20) DEFAULT NULL COMMENT '表具id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `oper_person` varchar(64) DEFAULT NULL COMMENT '操作员',
  `update_status` varchar(2) DEFAULT '0',
  PRIMARY KEY (`update_id`),
  KEY `index_meterId` (`meter_id`),
  KEY `index_keyId` (`key_id`)
)comment='历史密钥表' ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*as_meter表中加入两个字段：表具是否是加密设备、最新密钥版本号*/
alter table as_meter add (ENCRPY_DEVICE varchar(2) default '0' COMMENT '是否为加密设备 0：不是  1：是');
alter table as_meter add (KEY_VERSIONS varchar(20) default null comment '最新密钥版本号');

/* as_meter增加字段purpose表具用途
 * 1：居民厨房用气
 * 2：居民地暖/壁挂炉用气
 * 3：工商户厨房用气
 * 4：工商户锅炉用气 
 */
alter table as_meter add (purpose varchar(2) default null comment '1：居民厨房用气;2：居民地暖/壁挂炉用气;3：工商户厨房用气;4：工商户锅炉用气');

/* 表具临时表as_meter_temp增加字段：表具用途、通气点火时间*/
alter table as_meter_temp add (purpose varchar(64) default null comment '表具用途');
alter table as_meter_temp add (VENT_FIRE_TIME datetime DEFAULT NULL COMMENT '通气点火时间');
alter table as_meter_temp add (batch_info varchar(64) DEFAULT NULL COMMENT '批次信息');
	
/*群组的细分条件表cm_subdivide_conditions与细分条件值表cm_subdivide_conditions_value增加字段：表具型号、批次、抄表计划*/
alter table cm_subdivide_conditions add (MODEL_ID bigint(20) default NULL COMMENT '表具型号');
alter table cm_subdivide_conditions add (PRODUCTION_BATCH_CODE varchar(20) default null comment '批次');
alter table cm_subdivide_conditions add (RM_PLAN_ID bigint(20) default null comment '抄表计划');

alter table cm_subdivide_conditions_value add (MODEL_ID bigint(20) default NULL COMMENT '表具型号');
alter table cm_subdivide_conditions_value add (PRODUCTION_BATCH_CODE varchar(20) default null comment '批次');
alter table cm_subdivide_conditions_value add (RM_PLAN_ID bigint(20) default null comment '抄表计划');

/*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************视图************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*******************************************************************************************************视图**************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
***************************************************************视图**********************************************************************************************************
***********************************************************************************************************************************************视图**********************************************
*********************************************************************************************************************************************************************************************
********************************************************************视图*************************************************************************************************************************/

DROP VIEW IF EXISTS `view_dataitem_protocol`;
CREATE  VIEW `view_dataitem_protocol` 
AS select `c`.`dataitem_name` AS `dataitem_name`,`c`.`dataitem_code` AS `dataitem_code`,`c`.`dataitem_class` AS `dataitem_class`,`c`.`param_type` AS `param_type`,
`c`.`show_style` AS `show_style`,`c`.`display_order` AS `display_order`,`a`.`protocol_id` AS `protocol_id`,`a`.`rw_remark` AS `rw_remark`,`a`.`scope` AS `scope`,
`b`.`protocol_code` AS `protocol_code`,`a`.`style_options` AS `style_options` from ((`om_rela_dataitem_protocol` `a` join `as_dc_protocol` `b`) join `om_dataitem` `c`) 
where ((`a`.`protocol_id` = `b`.`protocol_id`) and (`a`.`dataitem_code` = `c`.`dataitem_code`));


DROP VIEW IF EXISTS `view_dict_enum_data`;
CREATE  VIEW `view_dict_enum_data` 
AS select `i`.`DICT_CODE` AS `DICT_CODE`,`i`.`DICT_VALUE` AS `DICT_VALUE`,`d`.`DICT_LANG` AS `DICT_LANG`,`d`.`ENUM_CODE` AS `ENUM_CODE`,`d`.`ENUM_VALUE` AS `ENUM_VALUE`
from (`ss_dict_items` `i` join `ss_dict_enum_data` `d`) where (`i`.`DICT_CODE` = `d`.`DICT_CODE`);

/* 增加水表告警与诊断数据表 nzx 2017-06-08*/
CREATE TABLE `as_water_alarm` (
	`alarm_id` BIGINT(20) NOT NULL COMMENT '报警id',
	`diagnose_id` BIGINT(20) NULL DEFAULT NULL COMMENT '诊断id，告警信息与诊断信息一起上来的，则填写对应表as_water_diagnose(diagnose_id)的值',
	`alarm_time` DATETIME NOT NULL COMMENT '报警时间',
	`meter_code` VARCHAR(20) NOT NULL DEFAULT '-1' COMMENT '表具code',
	`dept_code` VARCHAR(20) NOT NULL DEFAULT '-1' COMMENT '部门code',
	`recv_time` DATETIME NOT NULL COMMENT '接收时间',
	`flow_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '流量状态 -1：不支持，0：正常，1：异常',
	`temperature_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '温度状态 -1：不支持，0：正常，1：异常',
	`water_leak_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '滴漏状态 -1：不支持，0：正常，1：异常',
	`empty_pipe_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '空管状态 -1：不支持，0：正常，1：异常',
	`reverse_flow_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '逆流状态 -1：不支持，0：正常，1：异常',
	PRIMARY KEY (`alarm_id`)
)
COMMENT='水表告警信息'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;


CREATE TABLE `as_water_alarm_diagnose` (
	`diagnose_id` BIGINT(20) NOT NULL COMMENT '诊断id',
	`diagnose_time` DATETIME NOT NULL COMMENT '诊断时间',
	`meter_code` VARCHAR(20) NOT NULL DEFAULT '-1' COMMENT '表具code',
	`dept_code` VARCHAR(20) NOT NULL DEFAULT '-1' COMMENT '部门code',
	`recv_time` DATETIME NOT NULL COMMENT '接收时间',
	`lid_open_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '开盖报警状态 -1：不支持，0：正常，1：异常',
	`store_chip_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '存储芯片状态 -1：不支持，0：正常，1：异常',
	`transducer_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '换能器状态 -1：不支持，0：正常，1：异常',
	`communicate_model_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '通讯模块状态 -1：不支持，0：正常，1：异常',
	`temperature_sensor_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '温度传感器状态 -1：不支持，0：正常，1：异常',
	`battery_low_state` VARCHAR(2) NOT NULL DEFAULT '-1' COMMENT '电池电量低状态 -1：不支持，0：正常，1：异常',
	PRIMARY KEY (`diagnose_id`)
)
COMMENT='水表告警信息诊断'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;



/*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************函数************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*******************************************************************************************************函数**************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
***************************************************************函数**********************************************************************************************************
***********************************************************************************************************************************************函数**********************************************
*********************************************************************************************************************************************************************************************
********************************************************************函数*************************************************************************************************************************/


/**************************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
*******************************************************************************************存储过程**************************************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
***************************************************************存储过程****************************************************************************************************************
*****************************************************************************************************************存储过程****************************************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
********************************************************************************存储过程***************************************************存储过程**********************************************************
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************/
