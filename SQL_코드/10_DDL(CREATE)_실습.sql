/****** CREATE TABLE 실습 ******/

-- 고객 테이블 CUSTOMER
CREATE TABLE CUSTOMER (
CUSTOMER_ID NUMBER(10,0) PRIMARY KEY,
CUSTOMER_NAME VARCHAR2(100) NOT NULL,
CUSTOMER_EMAIL VARCHAR2(100) CONSTRAINT C_M UNIQUE,
CUSTOMER_PHONE VARCHAR2(20), 
CUSTOMER_ADDRESS VARCHAR2(255), CONSTRAINT C_A_UNIQUE UNIQUE(CUSTOMER_ADDRESS)
);

COMMENT ON COLUMN CUSTOMER. CUSTOMER_ID IS '고객아이디'; --주석 작성
COMMENT ON COLUMN CUSTOMER. CUSTOMER_NAME IS '고객이름'; --주석 작성
COMMENT ON COLUMN CUSTOMER. CUSTOMER_EMAIL IS '고객이메일'; --주석 작성
COMMENT ON COLUMN CUSTOMER. CUSTOMER_PHONE IS '고객핸드폰번호'; --주석 작성
COMMENT ON COLUMN CUSTOMER. CUSTOMER_ADDRESS IS '고객주소'; --주석 작성

COMMIT;
/*
ORA-01780: string literal required
01780. 00000 -  "string literal required"
->큰따옴표 문제
*/


-- PRODUCT 테이블 생성
--PRODUCT_ID NUMBER(10,0) 기본키
--PRODUCT_NAME VARCHAR2(100) NULL 사용불가
--PRODUCT_PRICE NUMBER(소수점2번째 자리까지 허옹) NULL 사용 불가
--PRODUCT_DESC VARCHAR2(200) -- 중복안되는 특별한 값 설정
CREATE TABLE PRODUCT (
    PRODUCT_ID NUMBER(10,0) PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(100) NOT NULL,
    PRODUCT_PRICE NUMBER(10,2) NOT NULL,
    PRODUCT_DESC VARCHAR2(200) CONSTRAINT P_D_U UNIQUE
);
COMMIT;
--PRODUCT 값 추가
--아메리카노 3000 신선한 원두로 만든 아메리카노
--2 카페라뗴 2500 부드러운 우유가 들어간 라뗴
--카푸치노 3500 진한 커피와 거품이 어우러진 카푸치노
--2 카라멜 마키아토 4000 달콤한 카라멜 시럽이 들어간 마키아토

INSERT INTO PRODUCT VALUES(1, '아메리카노', 3000, '신선한 원두로 만든 아메리카노');
INSERT INTO PRODUCT VALUES(2, '카페라떼', 2500, '부드러운 우유가 들어간 라뗴');
INSERT INTO PRODUCT VALUES(3, '카푸치노', 3500, '진한 커피와 거품이 어우러진 카푸치노');
INSERT INTO PRODUCT VALUES(4, '카라멜 마키아토', 4000, '달콤한 카라멜 시럽이 들어간 마키아토');
COMMIT;






-- FOOD_COMPANY TABLE 생성
CREATE TABLE FOOD_COMPANY (
    COMPANY_ID              NUMBER(10,0) PRIMARY KEY,     --회사 ID 기본키
    COMPANY_NAME         VARCHAR2(100) NOT NULL,       --회사이름 NULL 불가
    COMPANY_ADDRESS     VARCHAR2(255),                     --회사 주소
    COMPANY_PHONE        VARCHAR2(20)                       --회사 전화번호
);
COMMIT;
--> Table FOOD_COMPANY이(가) 생성되었습니다.


-- SNACKS 테이블 생성
CREATE TABLE SNACKS (
    SNACK_ID        NUMBER(10,0) PRIMARY KEY,       --과자ID (기본키)
    SNACK_NAME   VARCHAR2(100) NOT NULL,        --과자 이름(NULL 불가)
    PRICE              NUMBER(10,2) NOT NULL,          --가격(NULL 불가)
    COMPANY_ID NUMBER(10,0),                            -->핵심 포인트
    
    CONSTRAINT FK_COMPANY FOREIGN KEY (COMPANY_ID)
    REFERENCES FOOD_COMPANY (COMPANY_ID) ON DELETE CASCADE --부모 삭제시 자식까지 삭제해줘
);
--ORA-00904 COMPANY_ID NUMBER(10,0), --> 핵심 포인트

----> 부모에서 COMPANY_ID 자식에서도 COMPANY_ID 써야하느냐? 아닙니다!

-- SNACKS 테이블 생성
CREATE TABLE SNACKS1 (
    SNACK_ID        NUMBER(10,0) PRIMARY KEY,       --과자ID (기본키)
    SNACK_NAME   VARCHAR2(100) NOT NULL,        --과자 이름(NULL 불가)
    PRICE              NUMBER(10,2) NOT NULL,          --가격(NULL 불가)
    CCCCCCCCC NUMBER(10,0),                            -->핵심 포인트
    
    CONSTRAINT FK_COMPANY1 FOREIGN KEY (CCCCCCCCC)
    REFERENCES FOOD_COMPANY (COMPANY_ID) ON DELETE CASCADE --부모 삭제시 자식까지 삭제해줘
);

-- SNACKS 테이블 생성
CREATE TABLE SNACKS2 (
    SNACK_ID        NUMBER(10,0) PRIMARY KEY,       --과자ID (기본키)
    SNACK_NAME   VARCHAR2(100) NOT NULL,        --과자 이름(NULL 불가)
    PRICE              NUMBER(10,2) NOT NULL,          --가격(NULL 불가)
    AAAA NUMBER(10,0),                            -->핵심 포인트
    
    CONSTRAINT FK_COMPANY2 FOREIGN KEY (AAAA)
    REFERENCES FOOD_COMPANY (COMPANY_ID) ON DELETE CASCADE --부모 삭제시 자식까지 삭제해줘
);

-- SNACKS 테이블 생성
CREATE TABLE SNACKS3 (
    SNACK_ID        NUMBER(10,0) PRIMARY KEY,       --과자ID (기본키)
    SNACK_NAME   VARCHAR2(100) NOT NULL,        --과자 이름(NULL 불가)
    PRICE              NUMBER(10,2) NOT NULL,          --가격(NULL 불가)
    ABCD NUMBER(10,0),                            -->핵심 포인트
    
    CONSTRAINT FK_COMPANY3 FOREIGN KEY (ABCD)
    REFERENCES FOOD_COMPANY (COMPANY_ID) ON DELETE CASCADE --부모 삭제시 자식까지 삭제해줘
);
--> ABCD FOREIGN KEY 키를 참조할 변수명
---> 참조할 변수명 FK_COMPANY3 규칙명 작성해주는데 규칙명은 모든 테이블 합쳐서 동일한 이름을 쓸 수 없음


--테이블 생성  

CREATE TABLE DRINK_COMPANY (
    DRINK_ID NUMBER(10,0) PRIMARY KEY,
    DRINK_NAME VARCHAR2(100) NOT NULL,
    DRINK_ADDRESS VARCHAR2(255),
    DRINK_PHONE VARCHAR2(20)
); 



-- 테이블 생성 
CREATE TABLE SOFTS (
    SOFTS_ID NUMBER(10,0) PRIMARY KEY,
    SOFTS_NAME VARCHAR2(100) NOT NULL,
    PRICE   NUMBER (10,2) NOT NULL,
    
    COMPANY_ID NUMBER (10,0), --회사 ID
    --부모삭제시 자식 삭제하는 FOREIGN KEY 생성  외래키 이름 : DK_COMPANY
    CONSTRAINT DK_COMPANY FOREIGN KEY(COMPANY_ID)
    REFERENCES DRINK_COMPANY(DRINK_ID) ON DELETE CASCADE
);

--DRINK_COMPANY
--1, '고가콜라', '서울시 강남구', '02-1234-5678'
--2, '뱁시', '서울시 중구', '02-8765-4321'
INSERT INTO DRINK_COMPANY VALUES(1, '고가콜라', '서울시 강남구', '02-1234-5678');
INSERT INTO DRINK_COMPANY VALUES(2, '뱁시', '서울시 중구', '02-8765-4321');

--SOFTS
--1, '콜라', 1500, 1
--2, '사이다', 1200, 1
--3, '벱시콜라', 1000, 2
--4, '마운틴듀오', 2000, 2
INSERT INTO SOFTS VALUES(1, '콜라', 1500, 1);
INSERT INTO SOFTS VALUES(2, '사이다', 1200, 1);
INSERT INTO SOFTS VALUES(3, '벱시콜라', 1000, 2);
INSERT INTO SOFTS VALUES(4, '마운틴듀오', 2000, 2);


DELETE FROM DRINK_COMPANY WHERE DRINK_ID =1; --고가콜라 삭제
SELECT * FROM SOFTS; --고가콜라 삭제됨에 따라 콜라, 사이다 삭제










