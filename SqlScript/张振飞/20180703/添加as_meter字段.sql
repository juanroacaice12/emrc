alter table as_meter add HAVE_VALVE  varchar(2)  default  '0';
alter table as_meter modify column HAVE_VALVE  varchar(2) comment '该表是否支持远程命令 0 不支持 1 支持 默认 0'; 

-- 数据库：ygp  模块： 水表添加是否下发抄表任务 提供人：张振飞
alter table rm_record add issue varchar(20) comment '00 或空 未下发 01 已下发';

-- 数据库：ygp  模块： 该表是否支持远程命令 0 不支持 1 支持 默认 0' 提供人：张振飞

alter table as_meter_temp add HAVE_VALVE varchar(2) comment '该表是否支持远程命令 0 不支持 1 支持 默认 0';