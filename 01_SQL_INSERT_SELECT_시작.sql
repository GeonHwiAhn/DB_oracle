/*
테이블을 만들 때 NULL값이 들어갈 수 있도록 허용한
컬럼에서만 가능

널이 아님에 체크를 해주지 않은 컬럼에서는 가능

널이 아님 체크를 해준 컬럼 : 필수로 값을 넣어야하는 공간

예를 들어
회원가입
아이디 이름 이메일 번호 주소

기념일 -> 널이 아님 체크X

INSERT에서 값을 선택해서 넣을 수 있는 컬럼이라면
선택해서 넣을 수 있는 컬럼명을 지워준 후 (작성하지 않은 후)
VALUES 다음에 값을 집어넣는 공간에도
값을 추가하지 않으면 됨 (NULL값 입력됨)
*/

/*
컬럼값을 그대로 두고 VALUES값에 '' 을 입력해도 입력 가능 (개수 맞춰주면 됨)
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES(5, '커피빈', '서울특별시 역삼동', '', '평일 10:00~13:00');
*/

/*공백이나 띄어쓰기는 관계없이 원하는 SQL 구문만큼 드래그해서 실행*/

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)  VALUES(2, '빠나프레소', '서울시 강남구 역삼동', '02-5555-5555', '영업시간 12:00~14:00');

--3 컴포즈커피 경기도 하남시 하남구 031-3232-3333 영업시간 평일 15:00~18:00
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES(3, '컴포즈커피', '경기도 하남시 하남구', '031-3232-3333', '평일 15:00~18:00');
--4 할리스커피 인천시 남동구 남동동 032-8888-8888 영업시간 평일 10:00~17:00
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES(4, '할리스커피', '인천시 남동구 남동동', '032-8888-8888', '평일 10:00~17:00');
--5 커피빈      서울특별시 역삼동                          영업시간 평일 10:00~13:00
INSERT INTO kh_cafe (c_id, c_name, c_address, c_time) VALUES(5, '커피빈', '서울특별시 역삼동', '평일 10:00~13:00');

-- 6 스타벅스 서울시 종로구 관철동 02-1111-2222    영업시간 평일 8:00~22:00
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES(6, '스타벅스', '서울시 종로구 관철동', '02-1111-2222', '평일 8:00~22:00');
-- 7 탐앤탐스 서울시 동대문구 장안동 02-5555-6666 영업시간 10:00~20:00
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES(7, '탐앤탐스', '서울시 동대문구 장안동', '02-5555-6666', '10:00~20:00');
-- 8 이디야커피 서울시 송파구 잠실동 02-1234-6789 영업시간 9:00~21:00
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES(8, '이디야커피', '서울시 송파구 잠실동', '02-1234-6789', '9:00~21:00');




--저장된 내용 보기
SELECT * FROM kh_cafe;

/*
SELECT : 저장된 데이터를 볼 때 사용
    ->로그인, 게시판 글 가져오기, 회원정보, 회사 내 직원 정보, 급여내역, 스터디명단블로그 ㅡㄷㅇ
SELECT 어떤칼럼을볼지선택 FROM 어느테이블에서가져올지테이블명작성

한 테이블에 있는 모든 칼럼을 보겠다
SELECT * FROM 테이블이름;

한 테이블에서 특정된 칼럼만 보겠다
SELECT C_NAME FROM 테이블이름;

한 테이블에서 특정된 칼럼들만 보겠다
SELECT C_NAME, C_ADDRESS FROM 테이블이름;
*/

SELECT C_NAME FROM KH_CAFE;

SELECT C_ADDRESS FROM KH_CAFE;

SELECT C_NAME, C_ADDRESS FROM kh_cafe;

--MEMBER 테이블 모두 보기
SELECT * FROM MEMBER;
--MEMBER 테이블 이름만 보기
SELECT M_NAME FROM MEMBER;
--MEMBER 테이블 이름 나이 보기
SELECT M_NAME, M_AGE FROM MEMBER;
--MEMBER 테이블 이름 번호 보기
SELECT M_NAME AS 멤버이름, M_PHONE AS 멤버번호 FROM MEMBER;

-- AS : ALIAS 별칭 이라는 영어 줄임말


-- 카페에서 카페이름 카페 번호 보는데 AS를 사용해서 카페이름 카페번호 표기해서 보여주기
SELECT C_NAME AS 카페이름, C_PHONE AS 카페번호 FROM kh_cafe;




--실습문제1
INSERT INTO MENU(menu_id, menu_name, menu_desc, menu_price) VALUES (1, '아메리카노', '신선한 원두로 만든 아메리카노', '3000');
INSERT INTO MENU(menu_id, menu_name, menu_desc, menu_price) VALUES (2, '카페라떼', '부드러운 우유가 들어간 라떼', '3500');
INSERT INTO MENU(menu_id, menu_name, menu_desc, menu_price) VALUES (3, '카푸치노', '진한 커피와 거품이 어우러진 카푸치노', '3500');
INSERT INTO MENU(menu_id, menu_name, menu_desc, menu_price) VALUES (4, '카라멜 마키아토', '달콤한 카라멜 시럽이 들어간 마키아토', '4000');
INSERT INTO MENU(menu_id, menu_name, menu_desc, menu_price) VALUES (5, '에스프레소', '강한 맛과 향의 에스프레소', '2500');






