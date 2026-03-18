-- SemiProject > dml.sql

-- 계정
-- 일반 계정 1명
INSERT INTO TBLUSER (id, pw, name, email, lv, pic, intro, regdate, ing) VALUES ('hong','1111','홍길동', 'hong@gmail.com', 1,DEFAULT,'반갑습니다.',DEFAULT,DEFAULT);

-- 관리자 계정 1명
INSERT INTO TBLUSER (id, pw, name, email, lv, pic, intro, regdate, ing) VALUES ('tiger','1111','호랑이', 'tiger@gmail.com', 2,DEFAULT,'관리자입니다.',DEFAULT,DEFAULT);

commit;
SELECT *
FROM TBLUSER ;

select *
from tblboard ORDER BY seq DESC ;

select
    seq, subject, id, regdate, readcount,
    (select name from tblUser where id = tblBoard.id) as name
from TBLBOARD order by seq desc;

update tblBoard set regdate = regdate -2 where seq in (1,2);
update tblBoard set regdate = regdate -1 where seq in (3,4);
commit;

select a.*, (select name from tblUser where id = a.id) as name from TBLBOARD a;

-- 게시판 검색(제목, 내용, 글쓴이)
select * from TBLBOARD where SUBJECT like '%안녕%';
select * from TBLBOARD where CONTENT like '%안녕%';
select * from TBLBOARD where ID like '%안녕%';

select * from TBLBOARD where SUBJECT like '%안녕%' or CONTENT like '%안녕%';

select * from TBLBOARD where SUBJECT like '%안녕%' or regdate BETWEEN ('2026-01-01', );

-- 전문적인 검색 환경 > Elastic Serach
select * from TBLBOARD where SUBJECT like '%자바%';
select * from TBLBOARD where SUBJECT like '%Java%';
select * from TBLBOARD where SUBJECT like '%프로그램%';


-- 페이징
select * from (select a.*, rownum as rnum from vwBoard a)
    where rnum BETWEEN 1 and 10;