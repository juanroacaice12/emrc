/*修改中间库的 rechargerecord 字段长度增加  2017-01-13 14:54:00*/
alter table rechargerecord modify column AccountNo varchar(50) DEFAULT NULL COMMENT '虚拟账号';
alter table rechargerecord modify column RechargeFlow varchar(50) DEFAULT NULL COMMENT '银行交易日志号(银行充值有效)';
alter table rechargerecord modify column PayPeople varchar(130) DEFAULT NULL COMMENT '缴款人名(银行充值有效)';
alter table rechargerecord modify column PayAccount varchar(50) DEFAULT NULL COMMENT '缴款账号(银行充值有效)';
alter table rechargerecord modify column PayBankCode varchar(64) DEFAULT NULL COMMENT '付款银行行号(银行充值有效)';
alter table rechargerecord modify column PayBankName varchar(50) DEFAULT NULL COMMENT '付款银行行名(银行充值有效)';
alter table rechargerecord modify column Memo varchar(256) DEFAULT NULL COMMENT '备注信息';

/*修改中间库的 rechargerecord SynchTime的备注信息*/
alter table rechargerecord modify column SynchTime datetime DEFAULT NULL COMMENT '同步发起时间';