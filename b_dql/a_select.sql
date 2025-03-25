# DQL (Data query Language)
# query : 묻다. 데이터베이스에서 데이터를 조회하는 구문

# [] -> optional
# select 컬럼명 [, 컬럼명...]
# from 테이블명
# where 조건절

# job 테이블의 모든 데이터 조회
select *
from job;

select job_name
from job;

# job 테이블에서 직급명이 '대표' 인 직급코드를 조회
select job_code
from job 
where job_name = '대표';

# employee 테이블에서 급여가 3000000 이상인 사원의 이름과 급여를 조회
select emp_name, salary
from employee
where salary  >= 3000000;

# distinct
select distinct dept_code, ent_yn from employee; 

# 실습
# 1. employee 테이블에서 부서코드가 D9 또는 D5이고
# 급여를 400만원 이상 받는 모든 사원의 모든 정보를 조회하시오.
select *
from employee 
where (dept_code = 'D9' or dept_code = 'D5') and (salary >= 4000000);
