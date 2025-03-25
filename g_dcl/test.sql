select * from sal_grade;
insert into sal_grade values('S8', 600000, 800000);
update sal_grade set min_sal = 850000 where sal_level = 'S7';
delete from sal_grade where sal_level = 'S7';

grant select, insert, update, delete on study.* 
to dcl_dev with grant option;
