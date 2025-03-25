# tcl
# transcation control language


# commit 	: 테이블의 변경사항을 저장 
# rollback	: 테이블의 마지막 commit 지점으로 테이블 상태를 되돌린다. 

insert into emp_dept values('222', '이태임', '경영지원부'); 
insert into emp_dept values('222', '하명도', '백엔드학부'); 
commit;

delete from emp_dept;

select * from emp_dept;

rollback;

# transcation : 논리적 최소작업단위 
# 계좌이체 기능 구현
# a계좌 --> 5만원 --> b계좌
# commit;
# update 계좌 set 잔액 = (잔액 - 5만원) where user_id = 'a';
# update 계좌 set 잔액 = (잔액 + 5만원) where user_id = 'b';
# 성공하면 commit / 실패 rollback;

# DBMS의 데이터 일관성을 보장하며 다수의 조작 요청을 동시에 안전하게 수행 
