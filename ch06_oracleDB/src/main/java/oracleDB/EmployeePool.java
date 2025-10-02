package oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class EmployeePool {
	private DBConnectionMgr pool = null;
	
	public EmployeePool() {
		pool = DBConnectionMgr.getInstance();	
	}
	
	public ArrayList<EmployeeBean> getEmplist(){
		ArrayList<EmployeeBean> alist = new ArrayList<EmployeeBean>();
		Connection con = null;
		try {
			con = pool.getConnection();
			Statement st = con.createStatement();
			String query = "select * from employee";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				EmployeeBean bean = new EmployeeBean();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setEmail(rs.getString("email"));
				bean.setDept_code(rs.getString("dept_code"));
				bean.setJob_code(rs.getString("job_code"));
				bean.setSalary(rs.getInt("salary"));
				
				alist.add(bean);
				 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return alist;
	}
}
