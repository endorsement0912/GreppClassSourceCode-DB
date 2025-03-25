# 산술연산자
# +, -, *, /
select 10 + 10;
select 10 - 10;
select 10 * 10;
select 10 / 3;


# 비교연산자
# <, >, <=, >=, =, [!=, <>]
select 20 < 10;
select 20 > 10;
select 20 <= 10;
select 20 >= 10;
select 20 = 10;
select 20 <> 10;

select '90-01-01' > '25-03-20';
select date('90-01-01') > date('25-03-20');

# 논리연산자
# not, and, or
select true and true;
select not false and true;
select false or false;
select true or false;
select not false and false; # false -> not이 연산 순위가 더 높음 