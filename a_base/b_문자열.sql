# 문자 타입
insert into tb_type(t_char) values('hello char');
insert into tb_type(t_varchar) values('hello varchar');
commit;

select length(t_varchar), length(t_char) from tb_type;
commit;