package oracleDB;

import java.sql.*;

public class OracleDBTest2 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free", "skarnddydwls", "1234");
			System.out.println("성공");
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from department");
			
			while(rs.next()) {
				String id= rs.getString(1);
				String title= rs.getString(2);
				String location= rs.getString(3);
				System.out.println(id+", "+title+", "+location);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 없음");
		} catch (SQLException e) {
			System.out.println("db버전 혹은 계정 정보 오류");
		}
	}
}
