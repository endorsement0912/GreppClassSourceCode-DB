# DML (Data Manipulation language) : 데이터 조작어
# 추가, 수정, 삭제
# sql 분류 : DDL / DML(DQL)

# insert
# insert into 테이블명(컬럼명 [, 컬럼명...]) values(value [, value...]);
insert into job(job_code, job_name) values('J8', '인턴');
select * from job;

insert into job(job_code, job_name) 
values
('J9', '알바'),
('JA', '입사지원자');
select * from job;

# 서브쿼리로 데이터 추가
create table emp_dept(
	emp_id varchar(3),
	emp_name varchar(50),
	dept_title varchar(50)
);

insert into emp_dept(
	select emp_id, emp_name, dept_title
	from employee e
	join department d on(e.dept_code = d.dept_id)
	#where ent_yn = "Y"
);

# update
# where 절을 반드시 작성해야한다!
# where 절이 없으면 모든 행에 대한 수정
# update 치기전에 반드시 select문으로 where 검증하자
update emp_dept
set dept_title = concat('아주 멋진 ', dept_title)
where emp_id = '222';

select * from emp_dept;

# delete
# 반드시 where절을 작성한다.
delete from emp_dept where emp_id = '222'; 
select * from emp_dept;

# truncate (안 쓴다)
# 테이블 전체 행을 삭제할 때 사용
# delete 보다 빠르다.
# rollback이 안된다.
truncate emp_dept;