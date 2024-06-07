/*지금부터 만드는 것은 KH_WORKBOOK이라는 곳에 만들 테이블 생성*/

CREATE TABLE COMPONY (
    COMPANY_ID NUMBER PRIMARY KEY,
    COMPANY_NAME VARCHAR2(100) NOT NULL,
    COMPANY_ADDRESS VARCHAR2(55),
    COMPANY_PHONE VARCHAR2(20)
);

--COMPONY ALTER 테이블명 COMPANY 변경
ALTER TABLE COMPONY RENAME TO COMPANY;
SELECT * FROM COMPANY;

-- COMPANY 시퀀스 생성
-- 시퀀스명 COMPANY_SEQ 시작값1 증가값1 NOCACHE NOCYCLE
--(방법1)
CREATE SEQUENCE COMPANY_SEQ;
    
--(방법2)
CREATE SEQUENCE COMPANY_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE NOCYCLE
;


--INSERT COMPANY  회사 추가
INSERT INTO COMPANY
VALUES (company_seq.nextval, '햇에제과', '서울시 강남구', '02-1234-5678');

--NEXTVAL 이용해서 회사 추가
--'롯에제가' '서울시 중구' '02-23445-6789'
INSERT INTO COMPANY
VALUES (company_seq.nextval, '롯에제가', '서울시 중구', '02-2345-6789');

-- '올이온' '서울시 용산구' '02-3456-7890'
INSERT INTO COMPANY
VALUES (company_seq.nextval, '올이온', '서울시 용산구', '02-3456-7890');


--SNACKS 테이블 생성
CREATE TABLE SNACKS (
    SNACK_ID NUMBER(10,0) PRIMARY KEY,
    SNACK_NAME VARCHAR2(100) NOT NULL,
    PRICE NUMBER(10,2) NOT NULL,
    COMPANY_ID NUMBER(10,0),
    CONSTRAINT COMPANY FOREIGN KEY(COMPANY_ID)
    REFERENCES COMPANY(COMPANY_ID)
);

SELECT * FROM COMPANY;
SELECT * FROM SNACKS;

--SNACKS_SEQ 시퀀스 생성
-- 시퀀스명 SNACKS_SEQ 시작값1 증가값1 NOCACHE NOCYCLE
CREATE SEQUENCE SNACKS_SEQ 
    START WITH 1 
    INCREMENT BY 1
    NOCACHE 
    NOCYCLE;


--SNACES_SEQ NEXTVAL 이용해서 INSERT 해주기
--오에스 1500 1 
--칸초 1220 1
--배배로 1100 2
--초코파이 2000 2
INSERT INTO SNACKS
VALUES (SNACKS_SEQ.NEXTVAL, '오에스', '1500', '1');

INSERT INTO SNACKS
VALUES (SNACKS_SEQ.NEXTVAL, '칸초', '1220', '1');

INSERT INTO SNACKS
VALUES (SNACKS_SEQ.NEXTVAL, '배배로', '1100', '2');

INSERT INTO SNACKS
VALUES (SNACKS_SEQ.NEXTVAL, '초코파이', '1100', '2');

SELECT * FROM SNACKS;


--가격이 1500이상인 과자 조회
SELECT * 
FROM SNACKS
WHERE PRICE >= 1500;

--서울시 강남구에 위치한 회사 조회
SELECT *
FROM COMPANY
WHERE COMPANY_ADDRESS = '서울시 강남구';

--회사 ID가 1인 과자 조회
SELECT *
FROM SNACKS
WHERE COMPANY_ID = 1;

--회사 ID가 1이고, 그 회사의 과자를 조회 (JOIN)
SELECT C.COMPANY_NAME, S.SNACK_NAME, S.PRICE
FROM COMPANY C
JOIN SNACKS S ON C.COMPANY_ID = S.COMPANY_ID
WHERE C.COMPANY_ID = '1';


















