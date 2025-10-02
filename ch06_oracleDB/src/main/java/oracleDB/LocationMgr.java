package oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class LocationMgr {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:free";
	private final String USER = "skarnddydwls";
	private final String PASS = "1234";
	
	public LocationMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<LocationBean> getLocalist(){
		ArrayList<LocationBean> alist = new ArrayList<LocationBean>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			String query = "select * from location";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				LocationBean bean = new LocationBean();
				bean.setLocation_code(rs.getString("local_code"));
				bean.setNational_code(rs.getString("national_code"));
				bean.setLocal_name(rs.getString("local_name"));
				
				alist.add(bean);
				}
			} catch(Exception e) {
			
		}
		return alist;
	}
}
