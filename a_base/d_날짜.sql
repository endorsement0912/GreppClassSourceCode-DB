0insert into tb_type(
	t_date, t_time, t_datetime, t_timestamp
) VALUES ('25-03-20', '10:06'
, '25-03-20 10:06:01'
, '25-03-20T10:07:01'
);

select * from tb_type;
set @@session.time_zone = '+01:00';
commit;