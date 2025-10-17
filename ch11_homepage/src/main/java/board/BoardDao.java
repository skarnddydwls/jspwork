package board;

import java.sql.*;
import java.util.ArrayList;

import db.DBConnectionMgr;

public class BoardDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	// totla 레코드 수 
		public int getTotalRecord(String keyField, String keyWord){
			int record=0;
			try {
				con= pool.getConnection();
				
				if(keyWord.equals("") || keyWord == null) {
					sql = "select count(num) from board";
					pstmt = con.prepareStatement(sql);
				} else {
					sql = "select count(num) from board where "+keyField+" like ?" ;
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
				}
				rs = pstmt.executeQuery();
				if(rs.next()) {
					record = rs.getInt(1);
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
		        pool.freeConnection(con);
		    }
			return record;
		}
		
		// 
		public void a1(){
			try {
				con= pool.getConnection();
				sql = "";
				con.createStatement().executeUpdate(sql); 
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
		        pool.freeConnection(con);
		    }
		}
	
	// 게시판 목록 가져오기
	public ArrayList<Board> getBoardList(String keyField, String keyWord, int start, int end){
		ArrayList<Board> alist = new ArrayList<>();
		try {
			con = pool.getConnection();
			if(keyWord.equals("") || keyWord==null) {
				sql = "select * from (select ROWNUM as RNUM, BT1.* from (select * from board order by ref desc, pos) BT1) where RNUM between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from (select ROWNUM as RNUM, BT1.* from (select * from board order by ref desc, pos) BT1 where " + keyField + " like ?) where RNUM between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
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
	
	// 조회수 증가
	public int upCount(int num){
		int result = 0;
		try {
			con= pool.getConnection();
			sql = "update board set count = count +1 where num="+num;
			result=con.createStatement().executeUpdate(sql); // rs에 안 넣고 int 형?
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
		return result;
	}
	
	// num에 해당하는 게시물 얻어오기 
	public Board getBoard(int num){
		Board temp = new Board();
		try {
			con= pool.getConnection();
			sql = "select * from board where num="+num;
			rs=con.createStatement().executeQuery(sql); 
			if(rs.next()) {
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
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
		return temp;
	}

	// 게시물 수정
	public void updateBoard(Board bean) {
		try {
			con= pool.getConnection();
			sql = "update board set subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
				
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
	}
	
	// 게시물 삽입
	public void insertBoard(Board bean){
		try {
			con= pool.getConnection();
			sql = "insert into board(name, subject, content, pass, ip)"
					+ "values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getPass());
			pstmt.setString(5, bean.getIp());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
	}
	
	public void a(){
		try {
			con= pool.getConnection();
			sql = "";
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
	}

	public void replyUpBoard(int ref, int pos) {
		try {
			con= pool.getConnection();
			sql = "update board set pos = pos+1 where ref=? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
	}
	
	public void replyBoard(Board bean){
		try {
			con= pool.getConnection();
			sql = "insert into board (num, name, subject, content, pos, ref, depth, regdate, pass, ip, count)"
					+ " values(SEQ_BOARD.NEXTVAL,?,?,?,?,?,?,sysdate,?,?,0)";
			
			int pos = bean.getPos() + 1;
			int depth = bean.getDepth() + 1;
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, pos);
			pstmt.setInt(5, bean.getRef());
			pstmt.setInt(6, depth);
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
	}
	
	// 게시글 삭제
	public int deleteBoard(int num){
		int result =0;
		try {
			con= pool.getConnection();
			sql = "select count(*) from board where ref="+ num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				if(rs.getInt(1) == 1) {
					sql="delete from board where num="+num;
					result = con.createStatement().executeUpdate(sql);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        pool.freeConnection(con);
	    }
		
		return result;
	}	
}















