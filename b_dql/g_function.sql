# function
# 1. 문자 관련 함수
# length, char_length, instr, substr, concat, replace, triim, lpad, rpad

# 1. length
SELECT LENGTH('text');
SELECT LENGTH('텍스트');

# 2. substring
select substr('programmers', 2);
select substr('programmers', 2, 5);
select substr('programmers' from 2);
select substr('programmers' from 2 for 5);

# employee 테이블에서 남자인 직원을 조회하시오.
# 남자여부 - 주민등록번호의 8번째 자리가 1 또는 3
select emp_name, emp_no
from employee
where substr(emp_no, 8, 1) in (1,3); 

# concat
select concat('pro', 'gram', 'mers');

# concat_ws
select concat_ws('!', 'pro', 'gram', 'mers'); # pro!gram!mers

# instr
select instr('programmers', 'r'); #2

# locate
select locate('r', 'programmers'); #2
select locate('r', 'programmers', 6); #10

# replace
select replace('programmers', 'mers', '!'); #program!

# trim
select trim('   programmers   ');
select trim(trailing from '   programmers   '); #   programmers
select trim(leading 'x' from 'xxxprogrammersxxx');  #programmersxxx
select trim(trailing 'x' from 'xxxprogrammersxxx'); #xxxprogrammers
select trim('x' from 'xxxprogramersxxx'); #programers

# lpad, rpad
select lpad('program', 11, 'hi'); #hihiprogram
select lpad('program', 11, 'mers'); #mersprogram
select lpad('program', 11, ' '); #    program

# employee 테이블에서 사원명과 주민번호를 조회하시오
# 단 주민번호의 뒤 7자리는 *로 마스킹처리 해주세요
select emp_name, concat(substr(emp_no, 1, 7), '*******') as emp_no
from employee;

select emp_name, replace(emp_no, substr(emp_no, 8), '*******') as emp_no
from employee;

select emp_name, rpad (substr(emp_no, 1, 7), 14, '*')
from employee;

# 숫자 관련 함수
# abs, mod, floor, ceil, round, trunc
select abs(-22);
select mod(777,10);
select floor(99.9999); #99 내림처리
select floor(-99.9999); #-100
select ceil(99.9999); #100 올림처리
select ceil(-99.9999); #-99
select round(99.99); #100
select round(93.99, -1); #90
select truncate(87.001, 0); #87
select truncate(87.001, -1); #80

# 날짜 관련 함수
# now, datediff, date_add, date_sub, year, month, date
select now();
select sysdate();
select curdate();

# datediff
# employee 테이블에서 사원들의 근무일자를 조회
select emp_name, datediff(now(), hire_date) as '근속일자'
from employee
where ent_yn = 'N';

# date_add
select date_add(now(), INTERVAL 1 day);
# 현재 시간에서 5분 10.0001초를 더한 시간
select date_add(now(), INTERVAL '5:10.0001' MINUTE_MICROSECOND);
select date_sub(now(), INTERVAL '5:10.0001' MINUTE_MICROSECOND);

select now(),
year(now()),
month(now()),
dayofweek(now()),
hour(now()),
minute(now()),
second(now());

# 형변환
select cast('2025-03-21' as date) > '90-03-21'; #1
select cast('2025-03-21 1:1:1.111111' as datetime(3)); #2025-03-21 01:01:01.111
select cast('99999.99' as double); # 99999.99
select cast('99999.99' as decimal); # 100000
select cast('99999.99' as decimal(6,2)); #9999.99
select cast('1979년' as year);
-
# case-when-then
# case
# when 조건식 then 표현식
# ...
# else 표현식
# end 별칭

# 급여레벨
select emp_name, salary,
case 
	when salary >= 6000000 and salary <= 1000000 then 's1'
	when salary >= 5000000 then 's2'
	when salary >= 4000000 then 's3'
	when salary >= 3000000 then 's4'
	when salary >= 2000000 then 's5'
	when salary >= 1000000 then 's6'
	else 's7'
end as '급여레벨'
from employee;
