# 테이블 수정
# alter

# 테이블 이름 수정
alter table ddl_emp rename to ddl_employee;
alter table ddl_employee rename to ddl_emp;

# 테이블 컬럼 수정
# alter table 테이블명 add | modify | drop 컬럼명

# 테이블 컬럼 추가
alter table ddl_emp add(job_code char(3));

# 테이블 컬럼 수정
# 테이블을 수정할 때는 기존에 저장된 테이블의 
# 데이터 및 제약조건과 충돌하지 않는 방향으로만 수정이 가능

# 1. 기존컬럼의 타입을 다른 타입으로 변경이 가능할까? => x
alter table ddl_emp modify emp_name int;

# 2. 기존컬럼의 크기를 기존보다 작은 값으로 변경하는 것이 가능할까?
alter table ddl_emp modify emp_name varchar(1);

# 2. 기존컬럼의 크기를 기존보다 큰 값으로 변경하는 것이 가능할까?
alter table ddl_emp modify emp_name varchar(199);

# 3. 컬럼에 이미 null인 데이터가 존재할 때 not null 제약조건을 걸 수 있을까?
alter table ddl_emp modify job_code char(3) not null;
alter table ddl_emp modify age int not null;

# 4. 컬럼에 중복값이 하나라도 존재할 때 unique 제약조건을 걸 수 있을까?
alter table ddl_emp modify age int unique;

# 5. check 제약조건의 범위를 기존 데이터가 포함되지 않는 범위로 변경할 수 있다.
alter table ddl_emp modify age int check(age > 30);
alter table ddl_emp modify age int check(age > 10);

# 테이블 컬럼 삭제
alter table ddl_emp drop job_code;

# 테이블 컬럼 이름 변경
alter table ddl_emp add(job_code char(3));
alter table ddl_emp rename column job_code to job;
alter table ddl_emp rename column job to job_code;

# 제약조건 추가 및 삭제
delete from tb_type;
commit;

# 기본키 추가 삭제
alter table tb_type add primary key(t_tinyint);
alter table tb_type drop primary key;

-- 외래키 추가 삭제
-- 외래키 삭제
alter table ddl_emp drop constraint ddl_emp_ibfk_1;

-- 외래키 제약조건 옵션
-- on delete|update cascade : 자식테이블에서 참조하고 있는 행을 삭제/수정할 경우
-- 					  		자식테이블의 행도 함께 삭제/수정
-- on delete|update set null : 자식테이블에서 참조하고 있는 행을 삭제/수정할 경우
-- 					  		자식테이블의 행의 외래키 컬럼에 null을 넣어준다.

-- on delete cascade
alter table ddl_emp add constraint 
foreign key(dept_code) references ddl_dept(dept_code) on delete cascade;

-- on delete set null
alter table ddl_emp add constraint 
foreign key(dept_code) references ddl_dept(dept_code) 
on delete set null;

-- on delete set null , on update cascade
alter table ddl_emp add constraint 
foreign key(dept_code) references ddl_dept(dept_code) 
on delete set null
on update cascade;

-- on delete set null , on update set null
alter table ddl_emp add constraint 
foreign key(dept_code) references ddl_dept(dept_code) 
on delete set null
on update set null;

delete from ddl_dept where dept_code = 'D01';
update ddl_dept set dept_code = 'D01' where dept_code = 'D99';
select * from ddl_emp;

-- 테스트를 위한 데이터 초기화
insert into ddl_dept(dept_code, dept_title) values('D01', '개발팀');
update ddl_emp set dept_code = 'D01';
commit;

insert into ddl_emp(emp_name, age, emp_no, dept_code)
values('하명도', 20, '000000-1111111', 'D01');
insert into ddl_emp(emp_name, age, emp_no, dept_code)
values('헤더', 20, '000000-2111112', 'D01');
insert into ddl_emp(emp_name, age, emp_no, dept_code)
values('전정원', 20, '000000-1111112', 'D01');

commit;


