package com.test.java;

public class Ex01 {
	public static void main(String[] args) {

		// 자바 > (조작) > 오라클

		/*
			JDBC, Java Database Connectivity
			- 영속성 계층(Persistence Layer) > 역할
			- 중간 계층 > 위치
			
			1. JDBC
			
			수업 진행
			2. Spring JDBC > 5~10% (X)
			2. MyBatis(+Spring) > 
			2. JPA(+Spring Boot) > 
			
			JDBC Driver 설치
			- 관련 클래스 가져오기 > *.jar 참조
			- 어떤 DB 사용? Oracle 21c XE > DB 제조사 사이트 > JDBC jar 제공 > 다운로드 + 설치
			- Oracle 설치 > Driver 파일을 같이 배포
			// C:\app\\user\product\21c\dbhomeXE\jdbc\lib
			// ojdbc8.jar or ojdbc11.jar<<

			[사람 + SQL Developer <- (SQL) -> Oracle Database Server]
			
			1. 클라이언트 툴 실행
			
			2. DB 접속
				- 호스트명: localhost
				- 포트번호: 1521
				- SID: xe
				- 드라이버: thin
				- 사용자명: --
				- 암호: ----
				
			3. 질의
				- SQL 사용(DDL, DML, DCL ..)
				3.1 반환값이 없는 쿼리
					- select 문을 제외한 쿼리
					
				3.2 반환값이 있는 쿼리
					- select 문
					- 결과셋을 반환하는 쿼리
					- 결과셋을 업무에 사용
			
			4. 접속 종료
				- commit/rollback
				
				
			[자바 프로그램 + JDBC <- (SQL) -> Oracle Database Server]
			
			1. 자바 프로그램 실행(+JDBC)
			
			2. DB 접속
				- JDBC > Connection 클래스 사용
				- 호스트명: localhost
				- 포트번호: 1521
				- SID: xe
				- 드라이버: thin
				- 사용자명: --
				- 암호: ----
			
			3. 질의
				- SQL 사용(DDL, DML, DCL ..)
				3.1 반환값이 없는 쿼리
					- select 문을 제외한 쿼리
					- void Statement.executeUpdate("SQL");
					
				3.2 반환값이 있는 쿼리
					- select 문
					- 결과셋을 반환하는 쿼리
					- 결과셋을 업무에 사용
					- ResultSet Statement.executeQuery("SQL");
					- JDBC > ResultSet 클래스 == select의 결과셋
			
			4. 접속 종료
				- JDBC > Connection 클래스 사용
				- commit/rollback
				
			JDBC 라이브러리 클래스(objdbc11.jar)
			- Connection, Statement, ResultSet
			
			
		*/
		
	}
}
