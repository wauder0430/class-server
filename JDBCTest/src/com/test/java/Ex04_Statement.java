package com.test.java;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex04_Statement {

    public static void main(String[] args) {

        //Ex04_Statement.java

		/*

			Statement
			- 모든 SQL 실행

			Statement 종류
			1. Statement
				- 기본
				- 정적 쿼리

			2. PreparedStatement
				- 특화
				- 매개변수가 있는 쿼리 * > 안정성

			3. CallableStatement
				- 특화
				- PreparedStatement 일종
				- 프로시저 호출 특화

		*/

        //m1();
        //m2();
        //m3();
        //m4();
        //m5();

        m6();

    }//main

    private static void m6() {

        //UI > 사용자 데이터 입력 > DB 저장
        Scanner scan = new Scanner(System.in);


        //*** 언어가 다른 자료형이 아무 의미가 없다.
        //자바(입력) > 오라클(저장)
        //String     > varchar2
        //String     > number

        //varchar2(30)
        System.out.print("이름: ");
        String name = scan.nextLine();

        //number(3)
        System.out.print("나이: ");
        String age = scan.nextLine();

        System.out.print("성별(m,f): ");
        String gender = scan.nextLine();

        System.out.print("연락처: ");
        String tel = scan.nextLine();

        System.out.print("주소: ");
        String address = scan.nextLine();

        String sql = String.format("insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextval, '%s', %s, '%s', '%s', '%s', default)", name, age, gender, tel, address);

        //insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextval, '거북이', 100, 'm', '010-1234-5678', '제주도 남해', default)
        //System.out.println(sql);


        DBUtil util = new DBUtil();
        Connection conn = null;
        Statement stat = null;

        try {

            conn = util.open();
            stat = conn.createStatement();

            //SQL
            int result = stat.executeUpdate(sql);

            System.out.println(result);

            stat.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static void m5() {

        //반환값이 없는 쿼리
        //- DML > insert, update, delete
        //- DDL
        //- DCL
        DBUtil util = new DBUtil();
        Connection conn = null;
        Statement stat = null;

        try {

            conn = util.open();
            stat = conn.createStatement();

            //SQL
            String sql = """
					
			create table tblAddress2 (
			    seq number primary key,                                 
			    name varchar2(30) not null,                             
			    age number(3) not null check(age between 0 and 120),    
			    gender char(1) not null check(gender in ('m', 'f')),    
			    tel varchar2(15) not null,                              
			    address varchar2(300) not null,                         
			    regdate date default sysdate not null                   
			)
					
			""";

            int result = stat.executeUpdate(sql);

            System.out.println(result);

            stat.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static void m4() {

        //delete
        DBUtil util = new DBUtil();
        Connection conn = null;
        Statement stat = null;

        try {

            conn = util.open();
            stat = conn.createStatement();

            //SQL
            String sql = "delete from tblAddress";

            int result = stat.executeUpdate(sql);

            System.out.println(result);

            stat.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static void m3() {

        //update
        DBUtil util = new DBUtil();
        Connection conn = null;
        Statement stat = null;

        try {

            conn = util.open();
            stat = conn.createStatement();

            //SQL
            String sql = "update tblAddress set age = age + 1";

            int result = stat.executeUpdate(sql);

            System.out.println(result);

            stat.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static void m2() {

        //Auto Commit On
        DBUtil util = new DBUtil();
        Connection conn = null;
        Statement stat = null;

        try {

            conn = util.open(false);

            stat = conn.createStatement();

            if (!conn.isClosed()) {


                //성공
                String sql = "insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextval, '강아지', 20, 'm', '010-1234-5678', '서울시 강남구 대치동', default)";

                int result = stat.executeUpdate(sql);

                if (result == 1) {
                    System.out.println("성공");
                } else {
                    System.out.println("실패");
                }


                //성공 or 실패
                sql = "insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextval, '고양이', 20, 'm', '010-1234-5678', '서울시 강남구 대치동', default)";

                result = stat.executeUpdate(sql);

                if (result == 1) {
                    System.out.println("성공");
                } else {
                    System.out.println("실패");
                }

                //둘다 성공
                conn.commit();

                stat.close();
                conn.close();

            } else {
                System.out.println("DB 접속 실패");
            }

        } catch (Exception e) {
            e.printStackTrace();

            //롤백
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

    }

    private static void m1() {

        //*** JDBC는 자동 커밋이 기본 설정이다.

        //1. DB 연결
        //2. SQL 실행
        //3. DB 종료

        //1.
        DBUtil util = new DBUtil();
        Connection conn = null;
        Statement stat = null;

        try {

            conn = util.open();

            //2.
            //stat = new Statement(); //insert
            stat = conn.createStatement();

            if (!conn.isClosed()) {

                //SQL 실행
                //- 자바는 SQL이 뭔지 모른다. > SQL을 문자열 취급한다.(의미X)

                //Statement는 한번에 한개의 SQL만 실행 가능하다.
                String sql = "insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextval, '홍길동', 20, 'm', '010-1234-5678', '서울시 강남구 대치동', default)";

                //쿼리 실행
                //- 반환값O: ResultSet executeQuery()
                //- 반환값X: int executeUpdate()

                int result = stat.executeUpdate(sql); //Ctrl + Enter 역할

                if (result == 1) {
                    System.out.println("성공");
                } else {
                    System.out.println("실패");
                }

                //XE
                //- 가용 메모리 최대 1GB

                //자원 해제
                stat.close();
                conn.close();

            } else {
                System.out.println("DB 접속 실패");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}












