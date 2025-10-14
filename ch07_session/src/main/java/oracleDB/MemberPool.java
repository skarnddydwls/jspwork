package oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class MemberPool {
	private DBConnectionMgr pool; // null 안 넣어도 null 들어감
	
	public MemberPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("error");
		}
			
	}
	
	public boolean loginMem(String id, String name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		
		try {
			con = pool.getConnection();
			String query = "select count(*) from emp_new where emp_id =? and emp_name =? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) > 0) {
				loginCon = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		
		return loginCon;
	}
}
