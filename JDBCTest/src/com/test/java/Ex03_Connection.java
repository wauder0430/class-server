package com.test.java;

import java.sql.Connection;

public class Ex03_Connection {
    public static void main(String[] args) {


        // com.test.java.Ex03_Connection.java
        DBUtil dbUtil = new DBUtil();
        Connection conn = null;

        try {
            conn = dbUtil.open("localhost", "hr", "java1234");

            System.out.println(conn.isClosed());

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }



    }

}
