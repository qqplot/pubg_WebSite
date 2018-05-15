package pubg.util;

import java.sql.*;
import java.util.*;

import pubg.util.FreeBoardBeanz;

public class FreeBoardJDBC {

	//---JDBC �뿰�룞---
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/pubgdb?useSSL=false&useUnicode=true&characterEncoding=utf8";
	private final String id = "root";
	private final String pw = "1111";
	
	String selQuery = "select regno, user_id, f_title, f_date from free_board"; // �쟾泥� 湲� 寃��깋 荑쇰━
	String searchQuery = "select regno, user_id, f_title, f_date from free_board where f_title like ?"; // �젣紐⑷��깋
	String textQuery = "select * from free_board where regno = ?"; //�젣紐⑺겢由� 湲�蹂닿린 荑쇰━
	String instQuery = "insert into free_board(user_id, f_title, f_text, f_date) values(?, ?, ?, ?)"; // 湲��옉�꽦
	String deleteQuery = "delete from free_board where regno = ?"; //湲��궘�젣
	
	public FreeBoardJDBC() {
		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("�뱶�씪�씠踰� �꽕移� �꽦怨�");
		} catch (ClassNotFoundException e) {
			System.out.println("�뱶�씪�씠踰� �꽕移� �떎�뙣");
		} 
	}
	//---JDBC �뿰�룞 end---

	//---�쟾泥� 湲� 寃��깋---
	public Vector<FreeBoardBeanz> getFBoardList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Vector<FreeBoardBeanz> vecList = new Vector<FreeBoardBeanz>();
		
		try {
			con = DriverManager.getConnection(JDBC_URL, id, pw);
			st = con.createStatement();
			rs = st.executeQuery(selQuery);
			
			while(rs.next()) {
				FreeBoardBeanz regBean = new FreeBoardBeanz();
				regBean.setRegno(rs.getInt("regno"));
				regBean.setUser_id(rs.getString("user_id"));
				regBean.setF_title(rs.getString("f_title"));
				regBean.setF_date(rs.getString("f_date"));
				vecList.add(regBean);
			}
		} catch (SQLException e) {
			System.out.println("Exception : " + e);
		} finally {
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { st.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return vecList;
	}	
	//---�쟾泥� 湲� 寃��깋 end---
	
	
	//---�젣紐⑷��깋---
	public Vector<FreeBoardBeanz> getFBoardSearch(String text){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Vector<FreeBoardBeanz> vecList = new Vector<FreeBoardBeanz>();
		
		try {
			con = DriverManager.getConnection(JDBC_URL, id, pw);
			ps = con.prepareStatement(searchQuery);
			ps.setString(1, "%"+text+"%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				FreeBoardBeanz regBean = new FreeBoardBeanz();
				regBean.setRegno(rs.getInt("regno"));
				regBean.setUser_id(rs.getString("user_id"));
				regBean.setF_title(rs.getString("f_title"));
				regBean.setF_date(rs.getString("f_date"));
				vecList.add(regBean);
			}
		} catch (SQLException e) {
			System.out.println("Exception : " + e);
		} finally {
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return vecList;
	}
	//---�젣紐⑷��깋 end---
	
	
	//---湲�蹂닿린---
	public Vector<FreeBoardBeanz> getFBoardText(int regno){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Vector<FreeBoardBeanz> vecList = new Vector<FreeBoardBeanz>();
		
		try {
			con = DriverManager.getConnection(JDBC_URL, id, pw);
			ps = con.prepareStatement(textQuery);
			ps.setInt(1, regno);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				FreeBoardBeanz regBean = new FreeBoardBeanz();
				regBean.setRegno(rs.getInt("regno"));
				regBean.setUser_id(rs.getString("user_id"));
				regBean.setF_title(rs.getString("f_title"));
				regBean.setF_text(rs.getString("f_text"));
				regBean.setF_date(rs.getString("f_date"));
				vecList.add(regBean);
			}
		} catch (SQLException e) {
			System.out.println("Exception : " + e);
		} finally {
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return vecList;
	}
	//---湲�蹂닿린 end---
	
	
	//---湲��옉�꽦---
	public void insertFBoardText(String user_id, String f_title, String f_text, String f_date) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DriverManager.getConnection(JDBC_URL, id, pw);
			ps = con.prepareStatement(instQuery);
			ps.setString(1, user_id); /* (�빐寃고뻽�뒿�땲�떎 by CHAE : ver_1.0.11 ----- user_id �쓽 �엫�떆諛⑺렪 : foreign key 愿��젴 exception --- */ 
			ps.setString(2, f_title);
			ps.setString(3, f_text);
			ps.setString(4, f_date);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Exception : " + e);
		} finally {
			try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
	}
	//---湲��옉�꽦 end---
	
	
	//---湲��궘�젣---
	public void deleteFBoardText(int regno) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DriverManager.getConnection(JDBC_URL, id, pw);
			ps = con.prepareStatement(deleteQuery);
			ps.setInt(1, regno); 
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Exception : " + e);
		} finally {
			try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
	}
	//---湲��궘�젣 end---
	
}
