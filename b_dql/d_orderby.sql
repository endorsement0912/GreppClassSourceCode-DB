# order by
# result set을 정렬하기 위해 사용
# select문 실행 순
# from > where > group by > having > select > order by

# order by
# 컬럼명 [asc(오름차순) | desc(내림차순)]

# 사원들의 이름, 급여, 보너스, 연봉레벨, 부서코드를 조회
select emp_name, salary, bonus, sal_level, dept_code
from employee
# 부서코드로 오름차순 정렬
# order by dept_code;
# 부서코드로 내림차순 정렬
# order by dept_code desc;
# 연봉레벨로 오름차순 정렬, 연봉레벨이 같다면 연봉으로 내림차순 정렬
# order by sal_level asc, salary desc;
# 보너스로 오름차순 정렬, null은 뒤쪽에 정렬
order by bonus is null asc, bonus asc;

# top n 구문
# limit 시작 인덱스, 출력할 개수
# limit 0,5 0번부터 5개
# employee 테이블에서 급여를 가장 많이 받는 5명
select emp_name, salary
from employee
order by salary desc
# limit 5; # 0, 5;
# 6등 부터 10등까지
limit 6, 5;

# employee 테이블에서 가장 최근에 입사한 사원 5명 조회
select *
from employee
order by hire_date desc
limit 5;


