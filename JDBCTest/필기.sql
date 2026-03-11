-- system
show user;

-- 1. 관리자 모드 활성화 (일반 사용자 생성 허용). 계정명에 C## 생략
ALTER SESSION SET "_ORACLE_SCRIPT" = true;

-- 2. 'team' 계정 생성, 비번 'java1234' 설정
CREATE USER server IDENTIFIED BY java1234;

-- 3. 기본 권한 부여
-- CONNECT: DB 접속 가능
-- CREATE TABLE, CREATE SEQUENCE: 데이터 저장 및 자동 번호 생성
-- CREATE VIEW, CREATE PROCEDURE: 가상 테이블 및 로직 구현
-- CREATE TRIGGER: 트리거 생성
GRANT CONNECT, CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE PROCEDURE, CREATE TRIGGER TO server;

-- 4. 저장 공간 설정
-- USERS 테이블스페이스에 300MB 제한 (무분별한 용량 차지 방지)
-- TEMP 테이블스페이스 임시 작업용
ALTER USER server DEFAULT TABLESPACE users
               QUOTA UNLIMITED ON users
               TEMPORARY TABLESPACE temp;

