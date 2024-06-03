/*
날짜

TO_DATE ('작성하고자하는문자열', '작성할패턴')
문자열을 기록하고자 하는 패턴형태로 해석해서 DATE타입으로 변경하는 함수

TO_DATE ('2000-01-01', 'YYYY-MM-DD')
-> 2000년 1월 1일생을 8자리로 기록하는 방법

TO_DATE ('21/12/12', 'RR/MM/DD')
-> 2000년 1월 1일생을 6자리로 기록하는 방법
-> ORACLE에서 네자리수 연도를 두 자리수 연도로 변환하면서
    특정 패턴을 나타내기 위해 사용된 형식
->Y2K 문제를 해결하기 위해 설계된 규칙
Y2K = YEAR 숫자2 KILO = 2000년대

TO_DATE ('21/12/12', 'YY/MM/DD')


형식
YY       : 년도 (짧게) 2023년에서 23년만 표기하길 원한다
YYYY    :  년도 (길게) 2023년 모두 작성하길 원한다
(YY/MM/DD) - 날짜를 짧게 작성하겠다.

RR      : 년도 (짧게) 2024년에서 23년만 표기하길 원한다
RRRR  : 년도 (길게) 2023년 모두 작성하길 원한다
(RR/MM/DD) - 2000년대 기준으로 날짜를 생각해서 작성하겠다.


월
MM  

일
DD

오전/오후
AM  PM

HH       : 12시간
HH24    : 24시간
M        : 분
SS       : 초

DAY     : 요일(전체) EX) 월요일, MONDAY
DY       : 요일(짧게) EX) 월, MON

제일 많이 사용
SYSDATE : 현재시간 - 회원가입, 로그인기록
YYMMDD : 생년월일 6자
YYYYMMDD : 결혼기념일, 생년월일


*/































