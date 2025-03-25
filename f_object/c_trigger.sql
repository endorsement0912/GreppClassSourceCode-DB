-- create
-- trigger [if not exists] name
-- trigger time trigger_event
-- on table_name for each row
-- body

-- trigger time : {before | after}
-- trigger event : {inset | update | delete}

-- new : insert, update되어 새롭게 갱신된 행의 참조변수
-- old : delete로 삭제된 행의 참조변수

create table sal_grade_history(
	sal_level char(2),
	min_sal int,
	max_sal int,
	state varchar(50),
	created_at timestamp default now()
);


delimiter $$
create trigger trg_sal_grade_insert
after insert on sal_grade
for each row
begin
	insert into sal_grade_history(sal_level, min_sal, max_sal, state)
	values(new.sal_level, new.min_sal, new.max_sal, 'INSERT');
end
$$

delimiter ;

insert into sal_grade(sal_level, min_sal, max_sal)
values('S7', 800000, 1000000);

select * from sal_grade_history sgh;



delimiter $$
create trigger trg_sal_grade_delete
after delete on sal_grade
for each row
begin
	insert into sal_grade_history(sal_level, min_sal, max_sal, state)
	values(old.sal_level, old.min_sal, old.max_sal, 'DELETE');
end
$$

delimiter ;

delete from sal_grade where sal_level = 'S7';
select * from sal_grade_history;


