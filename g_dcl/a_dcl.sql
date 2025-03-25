-- DCL (Data Control Language)
-- 데이터베이스에 대한 접근권한 관리 언어

-- 1. 계정 생성 - create user DB명 identified by '비밀번호';
create user dcl identified by '123qwe!@#';
create user dcl_dev identified by '123qwe!@#';
show grants for dcl;

-- 2. 계정 삭제 - drop user DB명 
drop user dcl;

-- 3. 권한 부여 - grant 권할줄것들 on 다른DB.*
grant select, insert, update, delete on study.* 
to dcl;

-- 4. with grant option
-- 사용자가 가지고 있는 권한을 다른 사용자에게 부여할 권한
grant select, insert, update, delete on study.* 
to dcl with grant option;

-- 5. 권한 회수 - revoke 권한준것 on 다른DB.* from DB명;
revoke insert on study.* from dcl;
show grants for dcl;

-- 6. role : 역할 (특정 역할에필요한 권한을 하나의 이름으로 묶음)
create role role_dev;
grant select, insert, update, delete on study.* to role_dev;
revoke select, update, delete on study.* from dcl;

-- 7. role 권한 부여 
grant role_dev to dcl;
set default role role_dev to dcl;

-- 8. role 권환 회수 
revoke role_dev from dcl;



