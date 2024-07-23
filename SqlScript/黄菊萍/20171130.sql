ALTER TABLE as_water_alarm ADD COLUMN alarm_status VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '0:未下载 1：已下载';

ALTER TABLE as_water_alarm_diagnose ADD COLUMN diagnose_status VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '0:未通知 1：处理中 2：已处理';

ALTER TABLE as_water_alarm_diagnose ADD COLUMN download_person BIGINT(20) DEFAULT NULL COMMENT '下载的操作人员id';

ALTER TABLE as_water_alarm_diagnose ADD COLUMN audit_person BIGINT(20) DEFAULT NULL COMMENT '审核的操作人员id';

ALTER TABLE as_water_alarm_diagnose ADD COLUMN download_time DATETIME DEFAULT NULL COMMENT '下载时间';

ALTER TABLE as_water_alarm_diagnose ADD COLUMN audit_time DATETIME DEFAULT NULL COMMENT '审核时间';

INSERT INTO `ss_dict_enum_data` (`DICT_CODE`, `DICT_LANG`, `ENUM_CODE`, `ENUM_VALUE`) VALUES
  ('MS0002', 'en', '00', 'Read'),('MS0002', 'en', '01', 'Unread');
