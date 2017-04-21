drop table floorplan;

-- 평면도 테이블 datanum 시퀀스
create sequence seq_floorplan_datanum;

CREATE TABLE floorplan
(
	-- 평면도 번호
	datanum number(1000) constraint pk_floorplan_datanum primary key,
	-- 관련 매물 번호
	property_no number(10,0) constraint fk_floorplan_property_no references property,
	-- 저장된 아이콘 데이터
	icons clob,
	-- 저장된 선 데이터
	lines clob
);
