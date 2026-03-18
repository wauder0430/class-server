-- SemiProject > ddl.sql

-- 회원 테이블
create table tblUser (
    id varchar2(50) PRIMARY KEY ,
    pw varchar2(50) NOT NULL ,
    name varchar2(50) NOT NULL ,
    email varchar2(100) NOT NULL ,
    lv number(1) NOT NULL ,             -- 등급(1-일반, 2-관리자)
    pic varchar2(100) DEFAULT 'pic.png' NOT NULL ,
    intro varchar2(500) NULL ,
    regdate date DEFAULT sysdate NOT NULL ,
    ing number(1) DEFAULT 1             -- 활동유무(1-활동, 0-탈퇴)
);

-- 게시판 테이블
create TABLE tblBoard (
    seq number PRIMARY KEY ,
    subject varchar2(500) NOT NULL ,
    content varchar2(4000) not NULL ,
    id varchar2(50) NOT NULL REFERENCES tblUser(id),
    regdate date default sysdate NOT NULL ,
    readcount number DEFAULT 0 not null
);
create SEQUENCE  seqBoard;

create or REPLACE view vwBoard
AS
select
    seq, subject, id, regdate, readcount, content,
    (select name from tblUser where id = tblBoard.id) as name,
    (sysdate-regdate) as isnew,
    (select count(*) from tblComment where bseq = tblBoard.seq) as commentCount
from TBLBOARD order by seq desc;

select * from vwBoard;



-- 댓글 테이블
create table tblComment(
    seq number PRIMARY KEY ,
    content varchar2(2000) NOT NULL ,
    regdate date DEFAULT sysdate NOT NULL ,
    id varchar2(50) NOT NULL REFERENCES tblUser(id),
    bseq number not NULL REFERENCES tblBoard(seq)
);
create SEQUENCE seqComment;

select * from tblComment order by seq;