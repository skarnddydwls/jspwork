package vote;

import java.sql.*;
import db.DBConnectionMgr;
import java.util.ArrayList;

public class VoteDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	Statement stmt; // 이건 뭔데?
	ResultSet rs;
	String sql;
	
	// 목록중 가장 num이 큰 번호 얻어오기
	public int getMaxNum() {
		int maxNum =0;
		try {
			con = pool.getConnection();
			sql= "select max(num) from votelist";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				maxNum= rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maxNum;
	}
	
	// 설문 등록하기
	public boolean voteInsert(Votelist vlist, Voteitem vitem) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into votelist values(seq_vote.nextval, ?, ?, ?, sysdate, ?, default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();
			
			int result2 = 0;
			if(result == 1) {
				sql = "insert into voteitem values(seq_vote.currval, ?, ?, default)";
				pstmt = con.prepareStatement(sql);
				String[] item = vitem.getItem();
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals(""))
						break;
					
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);
					result2 = pstmt.executeUpdate();
				}
			}
			if(result2 == 1) {
				flag = true;
			} else {
				con.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// 전체 설문 목록 가져오기
	public ArrayList<Votelist> getList(){
		ArrayList<Votelist> alist= new ArrayList<Votelist>();
		
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by num desc";
			stmt = con.createStatement(); // con.prepareStatement와 차이점
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Votelist vlist = new Votelist();
				vlist.setNum(rs.getInt(1));
				vlist.setQuestion(rs.getString(2));
				vlist.setSdate(rs.getString(3));
				vlist.setEdate(rs.getString(4));
				alist.add(vlist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alist;
	}
	
	// 설문폼의 질문과 type 가져오기
	public Votelist getVote(int num) {
		Votelist vlist = new Votelist();
		try {
			con = pool.getConnection();
			if(num==0) {
				sql= "select * from votelist order by num desc";
			} else {
				sql= "select * from votelist where num="+num;
			}
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				vlist.setQuestion(rs.getString("question"));
				vlist.setType(rs.getInt("type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vlist;
	}
	
	// 설문폼의 item 가져오기
	public ArrayList<String> getItem(int num){
		ArrayList<String> alist = new ArrayList();
		
		try {
			con = pool.getConnection();
			if(num == 0) { // num이 0?
				num = getMaxNum();
			}
			sql= "select item from voteitem where listnum="+num;
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				alist.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	// 투표 (count 증가)
	public boolean updateCount(int num, String[] itemnum) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update voteitem set count = count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			
			System.out.println(itemnum[0]);
			
			if(num == 0) {
				num = getMaxNum();
			}
			for (int i=0;i<itemnum.length;i++) {
				if(itemnum[i]==null || itemnum[i].equals("")) break;
				
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				int result = pstmt.executeUpdate();
				if(result > 0) flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return flag;
	}
	
	// listnum의 전체 count 가져오기
	public int sumCount(int num) {
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "select sum(count) from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) num = getMaxNum();
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1); // 첫번째 컬럼 = 위 sql문의 sum
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return count;
	}
	
	// listnum 각각의 item과 count 가져오기
	public ArrayList<Voteitem> getView(int num) {
		ArrayList<Voteitem> vitem = new ArrayList<Voteitem>();
		
		try {
			con = pool.getConnection();
			sql = "select item, count from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) num = getMaxNum();
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) { // 개념 체크
				Voteitem item = new Voteitem(); // 위에랑 다른겨
				String items[] = new String[1];
				items[0] = rs.getString(1);
				item.setItem(items);
				item.setCount(rs.getInt(2));
				vitem.add(item);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return vitem;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
