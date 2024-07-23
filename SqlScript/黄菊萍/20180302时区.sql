-- 部门表增加时区字段
alter table ss_dept add(time_zone VARCHAR(1024) NOT NULL COMMENT '所属时区');

-- 修改字典表
ALTER TABLE ss_dict_enum_data MODIFY COLUMN ENUM_CODE VARCHAR(1024) NOT NULL;

-- 增加时区的数据字典
INSERT INTO ss_dict_enum_data (DICT_CODE, DICT_LANG, ENUM_CODE, ENUM_VALUE) VALUES
  -- ('DT0002', 'en', '', '零时区'),
  ('DT0002', 'en', 'Europe/Paris', 'UTC+1:00'),
  ('DT0002', 'en', 'Africa/Cairo', 'UTC+2:00'),
  ('DT0002', 'en', 'Africa/Addis_Ababa', 'UTC+3:00'),
  ('DT0002', 'en', 'Asia/Yerevan', 'UTC+4:00'),
  ('DT0002', 'en', 'Asia/Karachi', 'UTC+5:00'),
  ('DT0002', 'en', 'Asia/Dhaka', 'UTC+6:00'),
  ('DT0002', 'en', 'Asia/Saigon', 'UTC+7:00'),
  ('DT0002', 'en', 'Asia/Shanghai', 'UTC+8:00'),
  ('DT0002', 'en', 'Asia/Tokyo', 'UTC+9:00'),
  -- ('DT0002', 'en', '', '东十区'),
  ('DT0002', 'en', 'Australia/Sydney', 'UTC+11:00'),
  /*('DT0002', 'en', '', '东十二区'),
  ('DT0002', 'en', '', '西一区'),
  ('DT0002', 'en', '', '西二区'),*/
  ('DT0002', 'en', 'America/Argentina/Buenos_Aires', 'UTC-3:00'),
  ('DT0002', 'en', 'America/Puerto_Rico', 'UTC-4:00'),
  ('DT0002', 'en', 'America/New_York', 'UTC-5:00'),
  ('DT0002', 'en', 'America/Chicago', 'UTC-6:00'),
  ('DT0002', 'en', 'America/Denver', 'UTC-7:00'),
  ('DT0002', 'en', 'America/Los_Angeles', 'UTC-8:00');
  /*('DT0002', 'en', '', '西九区'),
  ('DT0002', 'en', '', '西十区'),
  ('DT0002', 'en', '', '西十一区');*/

-- 更新当前已存在国家的时区信息