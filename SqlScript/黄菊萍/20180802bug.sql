#BUG3282
UPDATE ss_dict_enum_data SET  ENUM_VALUE = 'Offline' WHERE ENUM_VALUE = 'offline';
UPDATE ss_dict_enum_data SET  ENUM_VALUE = 'Online' WHERE ENUM_VALUE = 'online';

#BUG3281
UPDATE ss_dict_enum_data SET ENUM_CODE = '07' WHERE ENUM_VALUE = '3G/4G' AND DICT_CODE = 'AC0001' AND DICT_LANG = 'en';
DELETE FROM ss_dict_enum_data WHERE DICT_CODE = 'AC0001' AND DICT_LANG = 'en' AND ENUM_VALUE NOT IN ('Ethernet','3G/4G');