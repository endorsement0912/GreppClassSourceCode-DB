# 1. 2023년 6월 18일에 대출된 도서의 제목을 조회 - 1
select TITLE
from rent_master
where RM_IDX 
= (select RM_IDX
	from rent_book
	where reg_date = '2023-06-18');

# 2. 2023년 6월 30일에 반납된 도서의 작가를 조회 - 1
select AUTHOR
from book
where bk_idx 
= (select bk_idx
	from rent_book
	where return_date = '2023-06-30');

# 3. 2023년 6월 28일에 대출되고 RENT_CNT가 1보다 큰 도서의 제목을 조회 - 3
select TITLE
from book
where rent_cnt > 1 and bk_idx in(
	select bk_idx
	from rent_book
	where reg_date = '2023-06-28' 
);

# 4. 연체상태(RE01)인 대출도서의 카테고리를 조회 - 1
select CATEGORY
from book
where bk_idx in (
	select bk_idx
	from rent_book
	where state = 'RE01')
group by CATEGORY;

# 5. 대출일과 반납일이 동일한 도서의 제목을 조회 - 0
select TITLE
from book
where reg_date 
= ( select reg_date
	from rent_book
	where reg_date = return_date
);

# 6. 2023년 6월 7일에 대출되고 6월 11일에 반납된 도서의 작가를 조회 - 2
select AUTHOR
from book
where bk_idx in(
	select bk_idx
	from rent_book
	where reg_date = '2023-06-07' and return_date = '2023-06-11'
);

# 7. 2023년 6월 15일에 대출된 도서의 제목을 조회 - 2
select TITLE
from book
where bk_idx in(
	select bk_idx
	from rent_book
	where reg_date = '2023-06-15'	
);

# 8. 2023년 6월 30일에 대출된 도서들 중 누적 대출 횟수가 가장 적은 책 제목을를 조회 - 1 ******



# 9. 2023년 6월에 대출되고 누적 대출 횟수가 평균보다 큰 도서의 제목과 대출 횟수를 조회 - 6 -> 수정하기(누적) ******
select TITLE, RENT_CNT
from book
where bk_idx in(
	select bk_idx
	from rent_book
	where reg_date between '2023-06-01' and '2023-06-30'
);

# 10. 연체 상태인 대출도서의 식별자와 상태를 조회 - 5 -> 띠용 *********
select bk_idx, state as '상태'
from rent_book
where state = 'RE02' 
group by bk_idx;

# 11. 사용자가 작성한 게시글 중에서 가장 긴 글의 제목과 글자 수를 조회
























