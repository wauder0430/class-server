import java.sql.Connection;
import java.sql.DriverManager;

public class Ex02_Connection {
    public static void main(String[] args) {

        // Ex02_Connection

        Connection conn = null;

        // 오타 주의
        // 연결 문자열(Connection String)
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "server";
        String pw = "java1234";

        try {

            // 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // DB 접속(JDBC)
            // - Oracle
            // - MySQL
            // - MS-SQL
            // - DB2
            conn = DriverManager.getConnection(url, id, pw); // 접속 완료

            System.out.println(conn.isClosed()); // false => 접속 중

            // SQL 실행

            // 접속 종료
            conn.close();

            System.out.println(conn.isClosed()); // true => 접속 종료

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
