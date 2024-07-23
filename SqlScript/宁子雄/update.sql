/**英语国际化调整*/
update ss_operation set OPERATION_NAME_CODE='Inquire' where OPERATION_NAME_CODE='Detail';

update ss_menu set MENU_NAME_CODE='Region Management' where MENU_NAME_CODE='District Management';

update ss_menu set MENU_NAME_CODE='Reading Booklet' where MENU_NAME_CODE='Reading List Management';

update ss_menu set MENU_NAME_CODE='My Workbench' where MENU_NAME_CODE='My workspace';

update ss_menu set MENU_NAME_CODE='Device Profile' where MENU_NAME_CODE='Device Management';

update  ss_dict_enum_data set ENUM_VALUE='Balance Compensating' where ENUM_VALUE='Balance Compensating Process';

update  ss_dict_enum_data set ENUM_VALUE='File Maintainance' where ENUM_VALUE='File Maintainance Process';

/**表读取调整为3位小数,2017=-02-08*/
alter table  rm_record modify LAST_READING DECIMAL(14,3);

alter table  rm_record modify CUR_READING DECIMAL(14,3);

alter table  rm_record_hi modify LAST_READING DECIMAL(14,3);

alter table  rm_record_hi modify CUR_READING DECIMAL(14,3);

alter table rm_pub_record add column task_name varchar(120);

alter table p_dc_op_record add   index index_msg_id(msg_id);


/**物联网表参数2017-02-22*/
update om_rela_dataitem_protocol set style_options='{"util.forceClose":"fclose","util.forceExit":"exit"}'  where protocol_id=203 and dataitem_code='3002';
update om_rela_dataitem_protocol set style_options='{"util.forceOn":"fopen","util.forceClose":"fclose","util.forceExit":"exit"}'  where protocol_id=201 and dataitem_code='3002';
update om_rela_dataitem_protocol set style_options='{"util.forceClose":"fclose","util.forceExit":"exit"}'  where protocol_id=302 and dataitem_code='3002';
update om_rela_dataitem_protocol set style_options='{"util.forceOn":"fopen","util.forceClose":"fclose","util.forceExit":"exit"}'  where protocol_id=301 and dataitem_code='3002';

update ss_dict_enum_data set  ENUM_VALUE='民用物联网(杭天)2.0协议'  where DICT_CODE='AC0004' and enum_code='902';
update ss_dict_enum_data set  ENUM_VALUE='民用物联网(杭天召读)1.0协议'  where DICT_CODE='AC0004' and enum_code='901';