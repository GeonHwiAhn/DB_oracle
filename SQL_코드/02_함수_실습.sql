/*함수 실습 코드*/

-- LENGTH --

--1. 직원 이름의 길이 조회 이름_길이로 작성
SELECT EMP_ID, EMP_NAME, LENGTH(EMP_NAME) AS "이름_길이" 
FROM EMPLOYEE;

--2. 이메일 아이디의 길이 조회 이메일_길이로 작성
--> 아이디, 이름 이메일, 이메일 길이
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EMAIL) AS "이메일_길이" 
FROM EMPLOYEE;

--3. 전화번호 길이가 11자리인 직원 조회
-->아이디 이름 번호 조회
SELECT EMP_ID, EMP_NAME PHONE 
FROM EMPLOYEE 
WHERE LENGTH(PHONE) = '11';

--4. 이메일의 길이가 15자 이상인 직원 조회
--> 아이디 이름, 이메일, 이메일 길이
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EMAIL) 
FROM EMPLOYEE WHERE LENGTH(EMAIL) > '15';

--5. 부서코드가 2글자인 직원 조회
-->아이디, 이름 부서코드
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE 
WHERE LENGTH(DEPT_CODE) = '2';

--6. 전화번호에 010 이 포함된 직원 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE INSTR(PHONE, '010') >0;

-->LIKE
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '%010%';


--SUBSTR 예제

--1. 이름의 세글자 가져오기
-->EMP_NAME  이름_석자
SELECT EMP_NAME, SUBSTR(EMP_NAME,1, 3) AS "이름_석자"
FROM EMPLOYEE;

--2. 전화번호의 마지막 네자리 가져오기 -4
--> PHONE AS 마지막_네_자리
SELECT EMP_ID, PHONE, SUBSTR (PHONE, -4) AS "마지막_네자리"
FROM EMPLOYEE
-- 만약에 NULL값이 아닌 번호만 보길 원한다면
--WHERE 이용해서 전화번호가 몇자리 이상
--IS NOT NULL;
WHERE PHONE IS NOT NULL;

--3. 주민등록번호의 생년월일 추출
-->EMP_NAME, EMP_NO AS 생년월일
SELECT EMP_NAME, EMP_NO, SUBSTR (EMP_NO, 1,6) AS "생년월일"
FROM EMPLOYEE;


--4. 전화번호의 앞 세자리 추출
--> PHONE AS 앞_세자리
SELECT PHONE, SUBSTR(PHONE, 1, 3) AS "앞_세자리"
FROM EMPLOYEE
WHERE PHONE IS NOT NULL;


--5. 이메일 @ 뒤에 있는 도메인 추출
--> EMP_NAME, EMAIL AS 도메인
SELECT EMP_NAME, SUBSTR(EMAIL, INSTR(EMAIL, '@') +1 ) AS "도메인"
FROM EMPLOYEE;




--AVG 평균
--모든 사원의 평균 급여 조회
SELECT AVG(SALARY)
FROM EMPLOYEE;

--올림 내림 반올림 환용해서 정수로 출력

--1. 올림
SELECT CEIL(AVG(SALARY))
FROM EMPLOYEE;
--2. 내림
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE;
--3. 반올림
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;



/*** COUNT 실습 ***/
--1. 전체 직원 수 조회
--> AS 총 직원수
SELECT COUNT(*) AS "총 직원수"
FROM EMPLOYEE;

--2. WHERE 사용해서 D9 부서 직원 수 조회
--> D9 부서 직원 수
SELECT COUNT(DEPT_CODE) AS "D9 부서 직원 수"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--3. WHERE 사용해서 보너스 받은 수
-->보너스 받은 직원들
SELECT COUNT(BONUS) AS "보너스 받은 직원들"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;


/********** AVG 평균 구하기 실습 **********/
--1. 전체 직원 평균 급여 조회
--> 전체 직원 평균 급여 조회
-->AS 평균 급여
SELECT AVG(SALARY) AS "평균 급여"
FROM EMPLOYEE;

--2. 부서별 평균 급여 조회
-->AS 부서, AS 평균급여
SELEC AVG(SALARY) AS "평균급여"
FROM EMPLOYEE;

SELECT DEPT_CODE AS "부서", AVG(SALARY) AS "평균급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;
/*
SELECT DEPT_CODE AS "부서", AVG(SALARY) AS "평균급여"
사용하려면 추후 GROUP BY 사용해야함

ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
125행, 8열에서 오류 발생
*/



--3. D5부서의 평균 급여 조회
--> AS D5부서 평균급여
SELECT AVG(SALARY) AS "D5부서 평균급여"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';











