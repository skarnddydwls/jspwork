package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ajax01.DBConnectionMgr;

public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql; 
	String sql1; 
	
	public ArrayList<Reply> getReply(int num) {
		ArrayList<Reply> alist = new ArrayList<>();
		try {
			con= pool.getConnection();
			sql= "select * from reply where ref=? order by no desc";
			sql1= "select no, content, name, to_char(redate, 'YYYY-MM-DD') redate from reply where ref=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs= pstmt.executeQuery(); 
			
			while(rs.next()) {
				Reply re = new Reply();
				re.setName(rs.getString("name"));
				re.setContent(rs.getString("content"));
				re.setRedate(rs.getString("redate"));
				
				alist.add(re);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return alist;
	}
	
	public int InsertReply(Reply content) {
		int result =0;
		try {
			con= pool.getConnection();
			sql= "insert into reply values(SEQ_REPLY.nextval, ?, ?, ?, sysdate)";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, content.getContent());
			pstmt.setInt(2, content.getRef());
			pstmt.setString(3, content.getName());
			result = pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return result;
	}
}











