set global log_bin_trust_function_creators=on;

grant all privileges on study.* to study@'%';
grant all privileges on bm.* to bm@'%';

show grants for study;
