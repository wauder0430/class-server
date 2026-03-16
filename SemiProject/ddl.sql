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
