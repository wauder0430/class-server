package com.test.memo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

    private Connection conn = null;

    public Connection open() {

        // 연결 문자열(Connection String)
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "server";
        String pw = "java1234";

        try {

            // 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            conn = DriverManager.getConnection(url, id, pw); // 접속 완료

            return conn;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

    public Connection open(boolean autoCommit) {

        // 연결 문자열(Connection String)
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "server";
        String pw = "java1234";

        try {

            // 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            conn = DriverManager.getConnection(url, id, pw); // 접속 완료

            conn.setAutoCommit(autoCommit);

            return conn;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

    public Connection open(String server, String id, String pw) {
        // 연결 문자열(Connection String)
        String url = "jdbc:oracle:thin:@" + server + ":1521:xe";

        try {

            // 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            conn = DriverManager.getConnection(url, id, pw); // 접속 완료

            return conn;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Connection open(String server, String id, String pw, boolean autoCommit) {
        // 연결 문자열(Connection String)
        String url = "jdbc:oracle:thin:@" + server + ":1521:xe";

        try {

            // 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            conn = DriverManager.getConnection(url, id, pw); // 접속 완료

            conn.setAutoCommit(autoCommit);

            return conn;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


}
