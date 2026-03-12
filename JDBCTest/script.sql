--

-- 주소록 테이블
create table tblAddress (
    seq number PRIMARY KEY,
    name varchar2(30) NOT NULL,
    age number(3) NOT NULL CHECK ( age BETWEEN 0 and 120),
    gender char(1) NOT NULL CHECK ( gender in('m', 'f') ),
    tel varchar2(15) NOT NULL ,
    address varchar2(300) NOT NULL ,
    regdate date DEFAULT SYSDATE NOT NULL
);
create SEQUENCE  seqAddress;

-- CRUD SQL
-- 1. 검증
-- 2. JDBC > 프로그램 작업을 위해서 미리 작성
INSERT INTO tblAddress (seq, name, age, gender, tel, address, regdate)
    VALUES (seqAddress.nextval, '홍길동', 20, 'm', '010-1234-5678', '서울시 강남구 대치동', DEFAULT);

SELECT *
FROM tblAddress;

SELECT * from tabs;

update tblAddress set address = '서울시 강남구 역삼동' where seq=1;

DELETE FROM TBLADDRESS where seq = 4;

commit;


select count(*) from TBLADDRESS;

select * from tblAddress where seq = 10;