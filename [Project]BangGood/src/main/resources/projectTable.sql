drop table property;
drop table customer;
drop table cart;
drop table message;
drop table position;
drop table floorplan;
drop table maintence;
drop table message;
drop table propertyreply;
drop table roomoption;
drop table searchboard;
drop table searchreply;
drop table picture;

drop sequence seq_property_no;
drop sequence seq_pic_plan_no;
drop sequence seq_pic_room_no;
drop sequence seq_propertyreply_no;
drop sequence seq_msg_no;
drop sequence seq_cart_no;
drop sequence seq_searchboard_no;
drop sequence seq_searchreply_no;
drop sequence seq_floorplan_datanum;

-- 테이블 만들고 데이터 임포트 후 반드시 아래의 문장을 추가적으로 실행해 줄 것. maintence_fee의 default 0이 먹히지 않음.
update property set maintence_fee = 0 where maintence_fee is null;

-- 회원
CREATE TABLE customer
(
	-- 아이디
	custid varchar2(20) constraint pk_customer_id primary key,
	-- 이름
	name varchar2(20) NOT NULL,
	-- 비밀번호
	password varchar2(20) NOT NULL,
	-- 이메일
	email varchar2(30) NOT NULL,
	-- 휴대폰
	phone number(11) NOT NULL,
	-- 벌점
	penalty number default 0
);

-- 장바구니
CREATE TABLE cart
(
	-- 장바구니번호
	cart_no number(10,0) constraint pk_cart_no primary key,
	-- 아이디
	custid varchar2(20) constraint fk_cart_id references customer on delete cascade,
	-- 담은날짜
	cart_inputdate date default sysdate,
	-- 매물번호
	property_no number(10,0) NOT NULL
);


-- 메시지
CREATE TABLE message
(
	-- 메시지번호
	msg_no number(10,0) constraint pk_msg_no primary key,
	-- 보낸이
	custid varchar2(20) constraint fk_msg_id references customer on delete cascade,
	-- 받는이 : 받는 이 아이디
	receiver varchar2(20) NOT NULL,
	-- 메시지내용
	msg_text varchar2(2000) NOT NULL,
	-- 보낸날짜
	senddate date default sysdate,
	-- 수신확인날짜
	readdate date,
	-- 확인여부
	ischecked varchar2(20) default 'false',
	-- 수신 내역 삭제
	receive_notshowing varchar2(20) default 'false',
	-- 송신 내역 삭제
	send_notshowing varchar2(20) default 'false'
);

-- 지도 중심 좌표를 위한 테이블
CREATE TABLE position
(
	-- 좌표명
	position varchar2(150) NOT NULL,
	-- 주소
	position_address varchar2(300) NOT NULL,
	-- 검색명
	searchtext varchar2(150) NOT NULL
)

-- 매물
CREATE TABLE property
(
	-- 매물번호
	property_no number(10,0) constraint pk_property_no primary key,
	-- 아이디
	custid varchar2(20) NOT NULL,
	-- 구분 : 월세인지 전세인지
	rent_type varchar2(10) check(rent_type in('전세', '월세')),
	-- 주소
	address varchar2(100) NOT NULL,
	-- 상세주소
	address_detail varchar2(100),
	-- 건물명
	building_name varchar2(100),
	-- 해당매물 층수
	floor number(2,0) NOT NULL,
	-- 주거타입 : 원룸, 투룸, 2LDK 등 방 형태
	property_type varchar2(20) NOT NULL,
	-- 보증금 : 전세라면 전세금
	deposit number(10,0) NOT NULL,
	-- 월세 : 월세가 얼마인지, 전세라면 null
	month_fee number(7,0) default 0,
	-- 관리비
	maintence_fee number(5,0) default 0,
	-- 건축연도
	built_year number(4,0) NOT NULL,
	-- 방면적 : m2로 입력. 서버단에서 평수 표시
	roomsize number(5,2) NOT NULL,
	-- 게시허가여부 : 게시글허가여부
	-- true 게시 허가
	-- false 게시 불가
	isaccessible varchar2(10) default 'false',
	-- 게시중단여부 : 게시중단여부
	issoldout varchar2(10) default 'true',
	-- 방등록제목	
 	property_title varchar2(500) NOT NULL,
	-- 등록 내용
	property_text varchar2(2000) NOT NULL,
	-- 게시일
	property_inputdate date default sysdate,
	-- 조회수
	property_hits number(5) default 0,
	-- 댓글수
	reply_count varchar2(5) default 0,
	-- 좋아요 or 장바구니 삽입수
	property_like number(3) default 0
);

-- 평면도
CREATE TABLE floorplan
(
	-- 평면도 번호(시퀀스)
	datanum number(38) constraint pk_floorplan_datanum primary key,
	-- 관련 매물 번호
	property_no number(10,0) constraint fk_floorplan_property_no references property,
	-- 사용 유저
	custid varchar2(20) not null,
	-- 사용자 지정 저장 이름
	saved_name varchar2(20) not null,
	-- 저장된 아이콘 데이터
	icons clob,
	-- 저장된 선 데이터
	lines clob,
	-- 창문 및 문 데이터
	objects clob,
	-- 축척 데이터
	scale number not null
);

-- 사진
CREATE TABLE picture
(
	-- 방사진번호
	pic_room_no number(10,0) constraint pk_pic_no primary key,
	-- 매물번호
	property_no number(10,0) constraint fk_pic_no references property on delete cascade,
	-- 사진 구분, 메인, 평면도, 입구, 부엌, 방, 화장실, 일반으로 구분
	pic_division varchar2(12),
	-- 사진파일 원래이름
	pic_name varchar2(100) NOT NULL,
	-- 사진 저장명
	pic_savename varchar2(150) NOT NULL,
 	 -- 신규여부
 	 new number(1) default 1
);

-- 관리비포함내역
CREATE TABLE maintence
(
	-- 매물번호
	property_no number(10,0) constraint fk_maintence_property_no references property on delete cascade,
	-- 인터넷
	internet number(1) NOT NULL,
	-- TV
	tvfee number(1) NOT NULL,
	-- 청소비
	cleaning number(1) NOT NULL,
	-- 수도료
	waterfee number(1) NOT NULL,
	-- 가스비
	gasfee number(1) NOT NULL,
	-- 전기세
	electronic number(1) NOT NULL
);

-- 방옵션
CREATE TABLE roomoption
(
	-- 매물번호
	property_no number(10,0) constraint fk_option_property_no references property on delete cascade,
	-- 애완동물 : 애완동물을 키울 수 있는가?
	pet number(1) NOT NULL,
	-- 주차 : 주차가 가능한지 불가능한지
	car number(1) NOT NULL,
	-- 에어컨
	elevator number(1) NOT NULL,
	-- 에어컨
	air_conditioner number(1) NOT NULL,
	-- 냉장고
	fridge number(1) NOT NULL,
	-- 세탁기
	washing_machine number(1) NOT NULL,
	-- 가스레인지
	gas_stove number(1) NOT NULL,
	-- 인덕션
	electric_stove number(1) NOT NULL,
	-- 전자레인지
	microwave number(1) NOT NULL,
	-- 책상
	desk number(1) NOT NULL,
	-- 선반
	rack number(1) NOT NULL,
	-- 침대
	bed number(1) NOT NULL,
	-- 옷장
	closet number(1) NOT NULL,
	-- 신발장
	shoecabinet number(1) NOT NULL,
	-- 도어락
	doorlock number(1) NOT NULL,
	-- 무선인터넷
	wifi number(1) NOT NULL,
	-- 그래프용 수치
	total number(2) NOT NULL
);

-- 매물 댓글용 테이블
CREATE TABLE propertyreply
(
	-- 댓글번호
	property_reply_no number(10,0) constraint pk_rrply_no primary key,
	-- 작성자아아디
	custid varchar2(20) NOT NULL,
	-- 댓글작성일
	propertyreply_inputdate date default sysdate,
	-- 댓글내용
	propertyreply_text varchar2(2000) NOT NULL,
	-- 매물번호
	property_no number(10,0) constraint fk_rreply_property_no references property on delete cascade,
	-- 사진파일 원래이름
	pic_name varchar2(30),
	-- 사진 저장명
	pic_savename varchar2(30)
);


-- 문의게시판
CREATE TABLE searchboard
(
	-- 문의게시판 번호
	searchboard_no number(10,0) constraint pk_sboard_no primary key,
	-- 작성자아이디
	custid varchar2(20) NOT NULL,
 	-- 작성자 이메일
	email varchar2(30) NOT NULL,
	-- 문의게시판 제목
	searchboard_title varchar2(100) NOT NULL,
	-- 문의게시판 게시글내용
	searchboard_text varchar2(2000) NOT NULL,
	-- 문의게시판 입력날짜
	searchboard_inputdate date default sysdate,
	-- 문의게시판 조회수
	searchboard_hits number(5,0) default 0,
	-- 문의게시판 댓글수
	searchboard_reply number(5,0) default 0
);

-- 문의게시판 댓글
CREATE TABLE searchreply
(
	-- 문의게시판 번호
	searchreply_no number(10,0) constraint pk_sreply_no primary key,
	-- 문의게시판 번호
	searchboard_no number(10,0) constraint fk_sreply_sboard_no references searchboard on delete cascade,
	-- 작성자아이디
	custid varchar2(20) NOT NULL,
	-- 문의게시판 내용
	searchreply_text varchar2(2000) NOT NULL,
	-- searchreply_inputdate
	searchreply_inputdate date default sysdate
);

/* Create Sequence */

-- 매물 번호
create sequence seq_property_no increment by 1 start with 100000;
-- 도면도 번호
create sequence seq_pic_plan_no increment by 1 start with 200000;
-- 방사진 번호
create sequence seq_pic_room_no increment by 1 start with 300000;
-- 방댓글 번호
create sequence seq_propertyreply_no increment by 1 start with 400000;
-- 메시지 번호
create sequence seq_msg_no increment by 1 start with 500000;
-- 장바구니 번호
create sequence seq_cart_no increment by 1 start with 600000;
-- 문의게시판 글 번호
create sequence seq_searchboard_no increment by 1 start with 700000;
-- 문의게시판 댓글 번호
create sequence seq_searchreply_no increment by 1 start with 800000;
-- 평면도 테이블 datanum 시퀀스
create sequence seq_floorplan_datanum;