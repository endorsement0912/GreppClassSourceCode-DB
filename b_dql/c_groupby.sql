# group by
# 특정 컬럼을 기준으로 grouping을 하기 위해 사용
# group by 컬럼명 [, 컬럼명]
# having 조건절
# having 조건절에서는 집계함수를 사용할 수 있다.


# sum, count, avg, max, min
select sum(salary), count(salary), avg(salary),
max(salary), min(salary)
from employee;


# 부서별 급여의 총합, 평균, max, min
select dept_code, sum(salary), avg(salary), 
max(salary), min(salary)
from employee
group by dept_code;

# 부서별 직급별 급여의 총합, 평균, max, min
select dept_code, job_code, sum(salary), avg(salary), 
max(salary), min(salary)
from employee
group by dept_code, job_code;

# having절
# group by에 지정된 group에 대한 조건절
select dept_code, sum(salary), avg(salary), 
max(salary), min(salary)
from employee
group by dept_code
having avg(salary) >= 3000000;

# rollup, grouping
# 그룹별 중간 집계와 총 집계를 조회
select dept_code, job_code, sal_level,
sum(salary), avg(salary)
from employee
group by dept_code, job_code, sal_level
with rollup
order by
dept_code is null asc,
job_code is null asc,
sal_level is null asc,
dept_code asc,
job_code asc,
sal_level asc;

# grouping
# 해당 행의 집계연산에 포함된 컬럼이면 0, 아니면 1
select 
dept_code, job_code, sal_level,
grouping(dept_code),
grouping(job_code),
grouping(sal_level),
sum(salary), avg(salary)
from employee
group by dept_code, job_code, sal_level
with rollup
order by
dept_code is null asc,
job_code is null asc,
sal_level is null asc,
dept_code asc,
job_code asc,
sal_level asc;


