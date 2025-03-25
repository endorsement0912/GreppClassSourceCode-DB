-- 계정 생성
CREATE USER 'study'@'%' IDENTIFIED BY '123qwe!@#';
CREATE USER 'bm'@'%' IDENTIFIED BY '123qwe!@#';

GRANT ALL PRIVILEGES ON study.* TO 'study'@'%';
GRANT ALL PRIVILEGES ON bm.* TO 'bm'@'%';
