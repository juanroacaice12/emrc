-- 导入区域信息 国家:Costa Rica 省：Alajuela 城市: San Carlos 区:Monterrey

-- ygp1的脚本
INSERT INTO `ss_region`

(`REGION_CODE`, `PARENT_REGION_CODE`, `REGION_NAME`, `REGION_TYPE`, `DEPT_CODE`)

VALUES ('960003', '960001', 'Alajuela', '1', '');

INSERT INTO `ss_region`

(`REGION_CODE`, `PARENT_REGION_CODE`, `REGION_NAME`, `REGION_TYPE`, `DEPT_CODE`)

VALUES ('960004', '960003', 'San Carlos', '2', '');

INSERT INTO `ss_region`

(`REGION_CODE`, `PARENT_REGION_CODE`, `REGION_NAME`, `REGION_TYPE`, `DEPT_CODE`)

VALUES ('960005', '960004', 'Monterrey', '3', '');


-- ygptest的脚本
INSERT INTO `ss_region`

(`REGION_CODE`, `PARENT_REGION_CODE`, `REGION_NAME`, `REGION_TYPE`, `DEPT_CODE`)

VALUES ('100000', '', 'Costa Rica', '0', '');
INSERT INTO `ss_region`

(`REGION_CODE`, `PARENT_REGION_CODE`, `REGION_NAME`, `REGION_TYPE`, `DEPT_CODE`)

VALUES ('100001', '100000', 'Alajuela', '1', '');

INSERT INTO `ss_region`

(`REGION_CODE`, `PARENT_REGION_CODE`, `REGION_NAME`, `REGION_TYPE`, `DEPT_CODE`)

VALUES ('100002', '100001', 'San Carlos', '2', '');

INSERT INTO `ss_region`

(`REGION_CODE`, `PARENT_REGION_CODE`, `REGION_NAME`, `REGION_TYPE`, `DEPT_CODE`)

VALUES ('100003', '100002', 'Monterrey', '3', '');






