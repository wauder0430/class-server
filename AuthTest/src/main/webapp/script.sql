-- AuthTest > script.sql

create TABLE tblUser(
    id varchar2(30) PRIMARY KEY ,
    pw varchar2(30) NOT NULL ,
    name varchar2(30) NOT NULL ,
    grade number(1) NOT NULL                    -- 등급 > 일반(1), 관리자(2)
);

INSERT INTO tblUser VALUES ('hong','1111','홍길동', 1);
INSERT INTO tblUser VALUES ('dog','1111','강아지', 1);
INSERT INTO tblUser VALUES ('cat','1111','고양이', 2);

commit;