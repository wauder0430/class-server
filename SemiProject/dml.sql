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
