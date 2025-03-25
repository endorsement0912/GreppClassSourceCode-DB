# 숫자 타입
insert into tb_type(t_tinyint, t_smallint, t_int, t_bigint)
values(100, 1000, 10000, 100000);


select * from tb_type;


# 고정소수점, 부동소수점
# 고정소수점 : 정수부와 실수부의 자리를 fix
# ex) 전체 자리수에서 소수점 자리를 3자리로 고정
# decimal(5,3)
# precison : 전체 자리수 ex) 5
# scale : 소수점 자리수 ex) 3 

insert into tb_type(t_float, t_double) value(0.1, 112.1234);
insert into tb_type(t_decimal) values(99.123);
select * from tb_type;

DELETE from tb_type;
commit;


