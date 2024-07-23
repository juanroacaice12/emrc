/*在rm_record和rm_recrd_hi中加了EXCEPTION_TYPE字段  2017-01-13 14:54:00*/
alter table rm_record add(EXCEPTION_TYPE VARCHAR(2) NULL DEFAULT NULL COMMENT '异常类型  \\r\\n  01：光电异常  \\r\\n  02：万位突变异常');
alter table rm_record_hi add(EXCEPTION_TYPE VARCHAR(2) NULL DEFAULT NULL COMMENT '异常类型  \\r\\n  01：光电异常  \\r\\n  02：万位突变异常');

/*修改bank_account_log中的PAYER_NAME字段长度，加长为130 2017-01-13 14:54:00*/
alter table bank_account_log modify column PAYER_NAME varchar(130) DEFAULT NULL COMMENT '付款人姓名';