-- Memo > script.sql

-- DDL
create TABLE tblMemo (
    seq number PRIMARY KEY,
    name varchar2(30) not null,
    pw varchar2(30) not null,
    memo varchar2(2000) not NULL,
    regdate date DEFAULT SYSDATE NOT NULL
);
create SEQUENCE seqMemo;

-- 쓰기
INSERT INTO tblMemo (seq, name, pw, memo, regdate) VALUES (seqMemo.nextval, '홍길동', '1111', '메모입니다.', default);

-- 목록보기
select * from tblMemo ORDER BY regdate DESC;

-- 작성자 확인하기 > 암호 확인
SELECT count(*) as cnt FROM tblMemo WHERE seq = 1 and pw = '1111';

-- 수정하기
UPDATE tblMemo SET memo = '수정합니다.' WHERE seq = 1;

-- 삭제하기
DELETE from tblMemo where seq = 1;

commit;