DROP TABLE IF EXISTS `rm_analysis_report`;
CREATE TABLE `rm_analysis_report` (
  `rm_report_id` bigint(20) NOT NULL COMMENT '分析报告id',
  `report_name` varchar(128) NOT NULL COMMENT '报告名称',
  `dept_code` varchar(20) default NULL COMMENT '部门编号',
  `rm_plan_id` bigint(20) NOT NULL COMMENT '计划id',
  `create_date` date default NULL COMMENT '生成时间',
  `pub_status` varchar(2) default NULL COMMENT '发布标志 0：未发布 1：已发布',
  `pub_date` datetime default NULL COMMENT '发布时间',
  PRIMARY KEY  (`rm_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rm_succ_analysis`;
CREATE TABLE `rm_succ_analysis` (
  `rm_analysis_id` bigint(20) NOT NULL COMMENT '抄表成功率分析id',
  `rm_report_id` bigint(20) NOT NULL COMMENT '分析报告id',
  `dept_code` varchar(20) default NULL COMMENT '部门编号',
  `group_type` varchar(2) default NULL COMMENT '组类型 0：小区  1：群组  2：全部',
  `analysis_type` varchar(2) default NULL COMMENT '分析类型 0：物联网 1：扩频表',
  `group_id` varchar(32) default NULL COMMENT '小区/群组id',
  `group_name` varchar(128) default NULL COMMENT '小区/群组名称',
  `meter_reading_num` int(11) default NULL COMMENT '应抄表数',
  `real_meter_reading_num` int(11) default NULL COMMENT '实抄表数',
  `estimate_meter_reading_num` int(11) default NULL COMMENT '估抄表数',
  `meter_unreading_num` int(11) default NULL COMMENT '未抄到数',
  `rm_succ_rate` decimal(5,2) default NULL COMMENT '抄表成功率',
  PRIMARY KEY  (`rm_analysis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rm_unread_record`;
CREATE TABLE `rm_unread_record` (
  `unread_id` bigint(20) NOT NULL COMMENT '未抄到记录id',
  `rm_report_id` bigint(20) NOT NULL COMMENT '分析报告id',
  `cust_code` varchar(64) default NULL COMMENT '户号',
  `cust_name` varchar(64) default NULL COMMENT '户名',
  `asset_code` varchar(32) default NULL COMMENT '资产编号',
  `meter_code` varchar(20) default NULL COMMENT '表号',
  `unread_type` varchar(2) default NULL COMMENT '未抄到原因类型 1：已换表 2：电池欠压 3：号段问题 4：空置户 5：无法入户 6：装修拆除 7：基表 8：换表后账目未更新 9：排查中',
  `remark` varchar(128) default NULL COMMENT '备注',
  PRIMARY KEY  (`unread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rm_abnormal_record`;
CREATE TABLE `rm_abnormal_record` (
  `abnormal_id` bigint(20) NOT NULL COMMENT '抄到异常记录id',
  `rm_report_id` bigint(20) NOT NULL COMMENT '分析报告id',
  `cust_code` varchar(64) default NULL COMMENT '户号',
  `cust_name` varchar(64) default NULL COMMENT '户名',
  `asset_code` varchar(32) default NULL COMMENT '资产编号',
  `meter_code` varchar(20) default NULL COMMENT '表号',
  `abnormal_type` varchar(2) default NULL COMMENT '异常类型 00:无异常  01：光电异常  02：万位突变异常 03：连续2次估抄用户 04：点后后长时间未用气用户 05：表计倒走  06：表计飞走',
  `remark` varchar(128) default NULL COMMENT '备注',
  PRIMARY KEY  (`abnormal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;