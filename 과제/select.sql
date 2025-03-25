# 1. 대출 횟수가 20회 이상인 도서들의 식별번호, isbn, 제목, 대출횟수 정보를 조회 - 1
select bk_idx, isbn, title, rent_cnt
from book
where rent_cnt >= 20;

# 2. 등록일이 2020년 6월 20일 이후인 도서의 식별번호, isbn, 제목, 등록일자 정보를 조회 - 20
select bk_idx, isbn, title, reg_date
from book
where reg_date > '2020-06-20';


# 3. 카테고리가 'B001'이고 대출 횟수가 8회인 도서의 식별번호, isbn, 제목, 대출횟수 정보를 조회 - 16
select bk_idx, isbn, title, rent_cnt
from book
where category = 'B001' and rent_cnt = 8;

# 4. 저자가 '혜민'인 도서들의 도서들의 식별번호, isbn, 제목, 저자 정보를 조회 - 2
select bk_idx, isbn, title, author
from book
where author like '혜민%';

# 5. 도서 제목에 '소설'이 포함된 도서들의 제목 정보를 조회 - 32
select title
from book
where title like '%소설%';

# 6. 등록일이 2020년 4월 15일 이전이고 대출 횟수가 10회 이하인 도서들의 식별번호, isbn, 제목, 저자, 등록일, 대출횟수 정보를 조회 - 14
select bk_idx, isbn, title, rent_cnt
from book
where reg_date < '2020-04-15' and rent_cnt <= 10;

# 7. 도서 제목이 '나는'으로 시작하는 도서들의 식별번호, isbn, 제목, 저자, 등록일, 대출횟수 정보를 조회 - 4
select bk_idx, isbn, title, author, rent_cnt
from book
where title like '나는%';

# 8. 도서 카테고리별 평균 대출건수와 총 대출건수 조회 - 6
select category, avg(rent_cnt) as '평균 대출건수', sum(rent_cnt) as '총 대출건수'
from book
group by category
order by category;

# 9. 대출 횟수 상위 5권의 식별번호, isbn, 제목, 저자, 등록일, 대출 횟수를 조회 - 5
select bk_idx, isbn, title, author, rent_cnt
from book
order by rent_cnt desc
limit 5;

# 10. 도서 카테고리가 B002인 도서의 식별번호, isbn, 카테고리, 제목, 저자, 등록일정보를 등록일자 순으로 내림차순으로 조회 - 17
select bk_idx, isbn, category, title, author, reg_date
from book
where category = 'B002'
order by reg_date desc;

# 11. 회원 등급이 ROLE_USER 인 회원을 이름으로 오름차순 정렬하여 조회 - 25
select USER_ID, PASSWORD, EMAIL, GRADE, TELL, IS_LEAVE
from MEMBER
where GRADE = 'ROLE_USER'
order by USER_ID;

# 12. 등급이 'ROLE_ADMIN'인 사용자 중 퇴사하지 않은 사용자만 조회 - 3 
select USER_ID, PASSWORD, EMAIL, GRADE, TELL, IS_LEAVE
from MEMBER
where GRADE = 'ROLE_ADMIN' and IS_LEAVE = 0;

# 13. 등급 별 사용자 수를 조회 - 2
select GRADE, count(*) as 'COUNT'
from MEMBER
group by GRADE;

# 14. 등급이 'ROLE_USER'이고 전화번호가 9로 끝나는 회원을 조회 - 2 
select USER_ID, PASSWORD, EMAIL, GRADE, TELL, IS_LEAVE
from MEMBER
where GRADE = 'ROLE_USER' and TELL like '%9';

# 15. 퇴사하지 않은 사용자 중에서 등급이 'ROLE_ ADMIN' 인 사용자의 이메일 조회 (알파벳 순) - 3
select EMAIL
from MEMBER
where GRADE = 'ROLE_ADMIN'
order by EMAIL;

# 16. 등급이 'ROLE_USER'이면서 퇴사하지 않은 사용자 중에서 전화번호의 4번째 숫자가 4이고 id가 E로 시작하는 사용자 - 1(문제이상)
select USER_ID, PASSWORD, EMAIL, GRADE, TELL, IS_LEAVE
from MEMBER
where GRADE = 'ROLE_USER' and IS_LEAVE = 0 and TELL like '010-____-4%' and USER_ID like 'E%';

# 17. 제목이나 내용에 "철학" 단어를 포함하는 게시글을 조회 - 1
select BD_IDX, USER_ID, REG_DATE, TITLE, CONTENT, VIEW_CNT, IS_DEL
from board
where title like '%철학%' or content like '%철학%';

# 18. 조회수 상위 10개 게시글을 출력 - 10
select BD_IDX, USER_ID, REG_DATE, TITLE, CONTENT, VIEW_CNT, IS_DEL
from board
order by view_cnt desc
limit 10;

# 19. 게시글 중에서 조회수가 30 이상이고 작성자가 "Socrates"인 것만 조회 - 4
select BD_IDX, USER_ID, REG_DATE, TITLE, CONTENT
from board
where view_cnt >= 30 and user_id = 'Socrates';

# 20. 도서의 식별번호, 제목, 저자, 대분류를 조회
# 카테고리가 'B0' 으로 시작하는 도서는 대분류를 ‘문학’으로, 카테고리가 'B1'로 시작하는 도서는 대분류를 ‘전문서적’으로 표시 - 99
select bk_idx, title, author, category as '대분류' 
from book 
where category like 'B0%';


# 21. 대출상태가 'RE01' 인 대출도서 정보를 조회 - 3
select RB_IDX, RM_IDX, BK_IDX, REG_DATE, STATE, RETURN_DATE
from RENT_BOOK
where STATE = 'RE01';

# 22. 대출도서가 2권 이상인 대출건제목을 조회
select title
from rent_master
where rent_book_cnt >= 2;

# 23. 2020/06/25 ~ 30일 사이에 입고된 도서의 식별번호, isbn, 제목, 등록일자 정보를 조회 - 6
select bk_idx, isbn, title, reg_date
from book
where reg_date between '2020-06-25' and '2020-06-30';

# 24. 2023년 11월에 탈퇴한 사용자를 조회 - 1(문제오류)
select USER_ID, REG_DATE, LOGIN_DATE, MODIFY_DATE, LEAVE_DATE
from MEMBER_INFO
where LEAVE_DATE >= '2023-11-01';
