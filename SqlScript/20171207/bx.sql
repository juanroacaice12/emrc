
drop table if exists EXC_NOTICE_READ;

drop table if exists EXC_NOTICE;

drop table if exists EX_HANDLE_RECORD;

drop table if exists MO_WORK_ORDER;

drop table if exists MO_WORK_ORDER_OPER;

/*==============================================================*/
/* Table: MO_WORK_ORDER                                         */
/*==============================================================*/
create table MO_WORK_ORDER
(
   WO_ID                bigint not null auto_increment,
   DEPT_CODE            varchar(20) not null comment '燃气公司编码',
   WO_TYPE              varchar(20) comment '1：异常处理工单；
            2：现场业务工单；
            3：入户安检工单；
            4：维修工单
            ',
   WO_STATE             varchar(2) comment '0：初始状态
            1：已派工
            2：处理中
            3：已处理
            4：已归档
            ',
   WO_PRODUCTOR         varchar(20),
   WO_GENERATION_TIME   datetime,
   WO_RECEIVE_TIME      datetime,
   WO_ACHIEVE_TIME      datetime,
   WO_HANDLER           varchar(20),
   REMARK               varchar(200),
   OPER_ID              bigint not null comment '处理人ID',
   primary key (WO_ID)
);

alter table MO_WORK_ORDER comment '工单表';




drop table if exists EX_HANDLE_RECORD;

/*==============================================================*/
/* Table: EX_HANDLE_RECORD                                      */
/*==============================================================*/
create table EX_HANDLE_RECORD
(
   EX_RECORD_ID         bigint not null comment '异常记录ID',
   WO_ID                bigint not null comment '处理工单ID',
   cust_id              bigint comment '客户id',
   cust_code            varchar(30),
   cust_name            varchar(30) comment '户名',
   cust_mobile          varchar(30) comment '客户电话',
   cust_detail_addr     varchar(200) comment '客户地址',
   device_code          varchar(50) comment '设备号',
   REMARK               varchar(200),
   status               varchar(2) comment '处理状态 00：未处理 01：已处理',
   primary key (EX_RECORD_ID, WO_ID)
);

alter table EX_HANDLE_RECORD comment '异常处理记录表';



/*==============================================================*/
/* Table: EXC_NOTICE                                            */
/*==============================================================*/
create table EXC_NOTICE
(
   EX_RECORD_ID         bigint not null comment '异常记录ID',
   NOTICE_ID            bigint not null auto_increment comment '通知ID',
   DEPT_CODE            varchar(20) not null comment '燃气公司编码',
   NOTICE_TIME          datetime comment '通知生成时间',
   EXCODE_LIST          varchar(100) comment '异常代码列表 ： 多个时已逗号隔开',
   primary key (NOTICE_ID)
);

alter table EXC_NOTICE comment '诊断异常通知表';




/*=============================================================*/
/* Table: EXC_NOTICE_READ                                       */
/*==============================================================*/
create table EXC_NOTICE_READ
(
   HAVE_READ            varchar(2) not null comment '是否已读 00：未读 01：已读',
   OPER_ID              bigint not null comment '已读人ID',
   NOTICE_ID            bigint not null comment '通知ID',
   READ_TIME            datetime,
   primary key (OPER_ID, NOTICE_ID)
);

alter table EXC_NOTICE_READ comment '诊断异常通知表读取情况表';

alter table EXC_NOTICE_READ add constraint FK_Reference_noticeRead foreign key (NOTICE_ID)
      references EXC_NOTICE (NOTICE_ID) on delete restrict on update restrict;



/*==============================================================*/
/* Table: MO_WORK_ORDER_OPER                                    */
/*==============================================================*/
create table MO_WORK_ORDER_OPER
(
   WO_ID                bigint not null comment '处理工单ID',
   OPER_ID              bigint not null comment '处理人ID',
   WO_HANDLER           varchar(20),
   primary key (WO_ID, OPER_ID)
);

alter table MO_WORK_ORDER_OPER comment '工单人员表';





---报警与诊断信息增加计量点id与客户id
ALTER table  as_water_alarm_diagnose add column cust_id BIGINT COMMENT '客户id';
ALTER table  as_water_alarm_diagnose add column MEASURING_POINT_ID BIGINT COMMENT '计量点id';

ALTER table  as_water_alarm add column cust_id BIGINT COMMENT '客户id';
ALTER table  as_water_alarm add column MEASURING_POINT_ID BIGINT COMMENT '计量点id';


---更新诊断数据的客户id与计量点id
update as_water_alarm_diagnose a,as_meter b,rm_measuring_point c set a.cust_id=c.cust_id,a.MEASURING_POINT_ID=c.MEASURING_POINT_ID   

where a.meter_code=b.METER_CODE and b.MEASURING_POINT_ID=c.MEASURING_POINT_ID

and a.dept_code=left(b.DEPT_CODE,4);


---更新告警数据的客户id与计量点id
update as_water_alarm a,as_meter b,rm_measuring_point c set a.cust_id=c.cust_id,a.MEASURING_POINT_ID=c.MEASURING_POINT_ID   

where a.meter_code=b.METER_CODE and b.MEASURING_POINT_ID=c.MEASURING_POINT_ID

and a.dept_code=left(b.DEPT_CODE,4);



ALTER TABLE as_water_alarm ADD COLUMN alarm_status VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '0:未下载 1：已下载';
ALTER TABLE as_water_alarm_diagnose ADD COLUMN diagnose_status VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '0:未通知 1：处理中 2：已处理';
ALTER TABLE as_water_alarm_diagnose ADD COLUMN download_person BIGINT(20) DEFAULT NULL COMMENT '下载的操作人员id';

ALTER TABLE as_water_alarm_diagnose ADD COLUMN audit_person BIGINT(20) DEFAULT NULL COMMENT '审核的操作人员id';
ALTER TABLE as_water_alarm_diagnose ADD COLUMN audit_time datetime DEFAULT NULL COMMENT '审核时间';
ALTER TABLE as_water_alarm_diagnose ADD COLUMN download_time datetime DEFAULT NULL COMMENT '下载时间';
ALTER TABLE as_water_alarm_diagnose ADD COLUMN audit_person_name varchar(80) DEFAULT NULL COMMENT '审核的操作人员名称';




---增加国际化

INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE01001', '在N天内累计出现信号强度低于阀值M的情况', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE01002', '连续N个上告周期未上线的情况，针对集中器为连续N天未上线', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE01003', '针对支持系统一键运维的扩频远传表，初始调试成功后，出现中继器丢失的情况', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02001', '电池欠压', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02002', '电池低压', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02003', '阀门异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02004', '控制器液晶异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02005', '温度传感器异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02006', '压力传感器异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02017', '流量计异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02018', '光电计数器故障', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02019', 'RS485通讯失败', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02020', '水表存储芯片失灵', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02021', '水表换能器失灵', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02022', '水表温度传感器失灵', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02023', '水表通讯模块失灵', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE02024', '水表电池电量低', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03001', '超声波计量异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03002', '超声波压力异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03003', '超声波温度异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03004', '开盖事件', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE030105', '磁攻击事件', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE030106', '开通失败', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE030107', '卸表报警', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03008', '反向计量', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE030209', '恒流量泄漏', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03010', '大流量泄漏', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03011', '小流量泄漏', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03012', '水表流量异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03013', '水表滴漏异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03014', '水表空管异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03015', '水表温度异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03016', '水表逆流异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03017', '水表开盖报警', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03018', '透支报警', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03019', '零额报警', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE03020', '少额报警', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04001', '万位突变异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04002', '用气量突变异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04003', '表码倒走异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04004', '抄表成功率低', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04005', '购气量异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04006', '连续未用气异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04007', '连续N次估抄', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE04008', '表计飞走', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE05001', '超大气费', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE05002', '连续N期零气费', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE05003', '突增突减计费', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE06001', '接口通信异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE06002', '前置机通信异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE06003', '服务器内存异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE06004', '服务器CPU异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE06005', '服务器存储空间异常', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE07001', '长时间未闭环业务', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE07002', '业务异常中断', '0001');
INSERT INTO ss_dict_enum_data (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`, `DEPT_CODE`) VALUES ('EXCEP001', 'zh', 'HE08001', '对账记录异常', '0001');

DELETE from ss_dict_enum_data where DICT_CODE='WD0001' and ENUM_CODE='00'


alter table EXC_NOTICE add column meter_code varchar(50) not  null COMMENT '表号';

alter table EXC_NOTICE add column notice_status int not null default 1 COMMENT '消息状态 0：无效消息，1：有效消息';


