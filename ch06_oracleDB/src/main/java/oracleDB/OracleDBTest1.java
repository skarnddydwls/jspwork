package oracleDB;

import java.sql.*;

public class OracleDBTest1 {

	public static void main(String[] args) {
		try {
//			mysql
//			Class.forName("com.mysql.jdbc.Driver");
//			oracle
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free", "skarnddydwls", "1234");
			System.out.println("성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 없음");
		} catch (SQLException e) {
			System.out.println("db버전 혹은 계정 정보 오류");
		}
	}
}
