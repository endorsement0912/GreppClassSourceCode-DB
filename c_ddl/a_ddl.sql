# DDL
# Data define language : 데이터 정의 언어

# 테이블 생성
# create table 테이블명 (컬럼명 type [제약 조건])

# 제약조건 : 데이터 무결성을 보장하기 위한 조건
# 데이터 무결성
#	1. 정확성 : 데이터가 중복되거나 누락되지 않는 상태
#	2. 유효성 : 저장되는 데이터가 도메인의 범위 안인 상태
#	3. 일관성 : 데이터가 수정되었을 때 그 수정이 연속적으로 보장


create table ddl_dept(
	dept_code char(3) primary key,
	dept_title varchar(50)
);

insert into ddl_dept(dept_code, dept_title) values('D01', '개발팀');
insert into ddl_dept(dept_code, dept_title) values('D02', '인사팀');
insert into ddl_dept(dept_code, dept_title) values('D03', '기획팀');
commit;

select * from ddl_dept;

-- CREATE TABLE ddl_emp (
-- 	# primary key(기본키)
-- 	# 테이블을 대표하고, 테이블의 각 행을 식별하기 위해 사용하는 키
-- 	# 특징 : null을 허용하지 않음, 중복을 허용하지 않음
-- 
-- 	# 슈퍼키 : 식별자로 사용할 수 있는 단일컬럼 또는 컬럼집합을 의의
-- 	# 후보키 : 식별자로 사용할 수 있는 최소한의 컬럼집합(단일컬럼 포함)
-- 	# 인조키 : 테이블에 식별할 수 있는 컬럼집합도 없고, 대표성을 지니는 컬럼도 없다면,
-- 	#		 인위적으로 컬럼을 만들어 기본키를 지정
-- 	#		 * 대표성을 지니는 단일컬럼 후보키가 없다면 모든 테이블에 단일컬럼 인조키를 추가 
-- 
-- 
-- 	# auto_increment : 1부터 1씩 순차적으로 증가하는 값을 emp_i에 저장(= 값이 유니크, 중복되지 않음) 
-- 	emp_id INT AUTO_INCREMENT PRIMARY KEY,
-- 	
-- 	# not null : 컬럼에 null을 허용하지 않음 
-- 	emp_name VARCHAR(50) NOT NULL,
-- 	
-- 	# check : 도메인 무결성을 보장, 도메인 정의에 부합하는 값만 컬럼에 추가할 수 있다. 
-- 	age INT CHECK (age >= 0),
-- 
-- 	# unique : 중복값 허용하지 않음
-- 	emp_no VARCHAR(15) UNIQUE,
-- 	
-- 	# default : 컬럼에 null이 들어오면 default 값으로 대체
-- 	hire_date TIMESTAMP DEFAULT NOW(),
-- 	
-- 	# 참조무결성, 외래키 
-- 	# 외래키 : 유일성과 최소성(not null)이 만족되는 컬럼을 지정 
-- 	dept_code CHAR(3),
-- 	FOREIGN KEY (dept_code) REFERENCES ddl_dept(dept_code)
-- );


CREATE TABLE ddl_emp (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 0),
    emp_no VARCHAR(15) UNIQUE,
    hire_date TIMESTAMP DEFAULT NOW(),
    dept_code CHAR(3),
    FOREIGN KEY (dept_code) REFERENCES ddl_dept(dept_code)
);

-- 기본키에 null 넣기
-- insert into ddl_dept(dept_code, dept_title) values(null '테스트부서');
-- 기본키에 중복값 넣기
-- insert into ddl_dept (dept_code, dept_title) values('D01', '테스트부서');

insert into ddl_dept (dept_code, dept_title) values('D04', '테스트부서');
select * from ddl_emp;

# null 제약조건
insert into ddl_emp(emp_name, age, emp_no, dept_code)
values('이서', 26, '000000-1111111', 'D01');
select * from ddl_emp;

# check 제약조건
insert into ddl_emp(emp_name, age, emp_no, dept_code)
values('어선정', 20, '000000-2111111', 'D01');
select * from ddl_emp;

-- unique 제약조건
insert into ddl_emp(emp_name, age, emp_no, dept_code)
values('헤더', 20, '000000-2111112', 'D01');
select * from ddl_emp;

-- 외래키 제약조건
-- 부모 테이블 : 참조되고 있는 테이블 
-- 자식 테이블 : 외래키 제약조건을 선언한 테이블 
-- 1. 참조하는 테이블의 컬럼에 존재하지 않는 값을 자식테이블의 외래키 컬럼에 추가할 수 없다.
insert into ddl_emp(emp_name, age, emp_no, dept_code)
values('전정원', 20, '000000-1111112', 'D01');
select * from ddl_emp;

-- 2. 자식테이블이 참조하고 있는 행은 삭제할 수 없다.
delete from ddl_dept where dept_code = 'D04';

-- 2. 자식테이블이 참조하고 있는 행의 열 삭제할 수 없다.
update ddl_dept set dept_code = 'D04' where dept_code = 'D01'; -- 안됨.

-- 자식테이블이 참조하고 있는 행의 다른 열은 수정이 가능하다.
update ddl_dept set dept_code = 'dev' where dept_code = 'D01';
update ddl_dept set dept_code = 'D11' where dept_code = 'D03';


select * from ddl_dept;