package pubg.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBCon {

	private PreparedStatement stmt;
	private ResultSet rs;

	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/pubgdb?useSSL=false";
	private final String ID = "root";
	private final String PASS = "1111";
	
	public String getJDBC_DRIVER() {
		return JDBC_DRIVER;
	}

	public String getJDBC_URL() {
		return JDBC_URL;
	}

	public String getID() {
		return ID;
	}

	public String getPASS() {
		return PASS;
	}

	public DBCon() {
		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("드라이버 연결성공");
              
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버 연결 실패");
		}
	}
	
	
	public void dbClose(ResultSet rs , PreparedStatement stmt , Connection conn) {
		 if(rs != null) {
			 try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 if(stmt != null) {
			 try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 if(conn != null) {
			 try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
	}	
	
	
	
	public void dbClose(PreparedStatement stmt , Connection conn) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
}
