package board;

import java.sql.*;
import java.util.ArrayList;

public class BoardDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	// 게시판 목록 가져오기
	public ArrayList<Board> getBoardList(String keyField, String keyWord){
		ArrayList<Board> alist = new ArrayList<>();
		try {
			con= pool.getConnection();
			if(keyWord.equals("")||keyWord==null) {
				sql = "select * from board order by num desc";
			} else {
				sql = "select * from board where "+ keyField +" like '%"+ keyWord +"%' order by num desc";
			}
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				Board temp = new Board();
				temp.setNum(rs.getInt("num"));
				temp.setName(rs.getString("name"));
				temp.setSubject(rs.getString("subject"));
				temp.setContent(rs.getString("content"));
				temp.setPos(rs.getInt("pos"));
				temp.setRef(rs.getInt("ref"));
				temp.setDepth(rs.getInt("depth"));
				temp.setRegdate(rs.getString("regdate"));
				temp.setPass(rs.getString("pass"));
				temp.setIp(rs.getString("ip"));
				temp.setCount(rs.getInt("count"));
				temp.setFilename(rs.getString("filename"));
				temp.setFilesize(rs.getInt("filesize"));
				
				alist.add(temp);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
		
		return alist;
	}
}















