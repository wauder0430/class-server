-- Todo > script.sql

create TABLE tblTodo (
    seq number PRIMARY KEY ,
    todo varchar2(100) NOT NULL ,
    state char(1) DEFAULT 'n' not null, -- 완료(y), 미완료(n)
    regdate date DEFAULT SYSDATE NOT NULL
);
create SEQUENCE  seqTodo;

INSERT INTO tblTodo (seq, todo, state, regdate) VALUES (seqTodo.nextval, '컴퓨터 포맷하기', DEFAULT, DEFAULT);

INSERT INTO tblTodo (seq, todo, state, regdate) VALUES (seqTodo.nextval, '강아지 산책하기', DEFAULT, DEFAULT);

INSERT INTO tblTodo (seq, todo, state, regdate) VALUES (seqTodo.nextval, '고양이 목욕하기', DEFAULT, DEFAULT);

commit;

SELECT * from tblTodo ORDER BY seq DESC;

update tblTodo set state = 'y' where seq in(2,3);