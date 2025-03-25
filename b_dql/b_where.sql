# where 절
# 1. employee 테이블에서 월급이 350만원 이상 600만원 이하인 사원을 조회
select *
from employee
where salary >= 3500000 and salary <= 6000000;

# *** between A and B : A이상 B이하
select salary
from employee 
where salary between 3500000 and 6000000;

# 350만원 미만 또는 600만원 초과인 사원
select salary
from employee 
where salary not between 3500000 and 6000000;

# 입사일이 90-01-01 부터 01-01-01 사이인 모든 사원을 조회
select *
from employee
where hire_date between '90-01-01' and '01-01-01';

# *** like ***
# 컬럼명 like 패턴
# 패턴문자 : %, _
# % : 'A%'  A로 시작하는  
#     '%A'  A로 끝나는 
#     '%A%' A가 포함된 

# employee 테이블에서 성이 이씨인 사원을 조회
select emp_name
from employee
where emp_name like '이%';

# employee 테이블에서 이름에 '이'가 포함되고
# 입사일이 01-01-01 이후인 사원의 이름, 사번, 입사일을 조회하시오
select emp_name, emp_id, hire_date
from employee
where emp_name like '%이%' 
and hire_date >= '01-01-01';

# employee 테이블에서 이름이 '연'으로 끝나고
# 재직중인 사원을 조회하시오.
select emp_name, ent_yn 
from employee
where emp_name like '%연' 
and ent_yn = 'N';


# like절의 와일카드
# _ 문자열의 자리수를 지정
# like '___A%' : 앞자리 3자리 뒤에 A가 오는 패턴으로 시작하는.

# employee 테이블에서 전화번호 뒤에 4번째 자리가 7인 사원의 이름과 전화번호 조회
select emp_name, phone
from employee
where phone like '%7___';

# escape 문자 
# escape 'escape 문자'
# 이메일이 '_' 앞에 3글자가 존재하는 패턴으로 시작하는
# 이메일을 가진 사원의 정보를 조회
select emp_name, email
from employee
where email like '___$_%' escape '$';

# *** in ***
# 직급코드가 'J7' 또는 'J2'인 사원 중 급여가 200만원 이상인 사원의
# 이름, 급여, 직급코드를 조회
select emp_name, salary, job_code
from employee
where (job_code = 'J7' or job_code = 'J2') and
salary >= 2000000;

select emp_name, salary, job_code
from employee
where job_code in ('J2', 'J7') and
salary >= 2000000;

# *** null ***
# null : 알 수 없음
# null도 연산이 가능
# null의 모든 산술연산의 결과 : null
# null의 모든 비교연산의 결과 : null
# null의 논리연산
# null and true : null
# null and false : false
# null or true : true
# null or false : null

# *** bonus가 null인 사원을 조회
select emp_name, bonus
from employee
where bonus is null;

# *** bonus가 null이 아닌 사원을 조회
select emp_name, bonus
from employee
where bonus is not null;

# 총 연봉이 5500 미만인 사원을 조회하시오
# 총 연봉 : 급여 * 12 * 1 * bonus
select emp_name, salary * 12 * (1 + ifnull(bonus, 0)) as '총연'
from employee
where salary * 12 * (1 + ifnull(bonus, 0)) < 55000000;

