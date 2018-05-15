package pubg.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/**
 * 2018-05-13
 * 
 * @author BeakJongHun
 *
 */
public class QnASQL {


		private PreparedStatement stmt;
		private ResultSet rs;
		private int max_count = 0;
		/**
		 * QnA
		 * @return
		 */
		public Vector<QnABean> SelectAll() {

			DBCon dbCon = new DBCon();
			Connection conn = null;
			Vector<QnABean> vc = new Vector<QnABean>();
			String sql = "select  * from qa_border";

			try {

				conn = DriverManager.getConnection(dbCon.getJDBC_URL(),dbCon.getID(),dbCon.getPASS());
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery(); 


					while(rs.next()) {


						QnABean qnABean = new QnABean();
						qnABean.setRegno(rs.getInt(1));
						qnABean.setUser_id(rs.getString("User_id"));
						qnABean.setQ_title(rs.getString("qa_title"));
						qnABean.setQ_date(rs.getString("qa_date"));
						qnABean.setQ_text(rs.getString("qa_text"));
						qnABean.setEmail(rs.getString("email"));

						vc.add(qnABean);
					}
				
			}catch (Exception e) {
				System.out.println("Exception:" + e);
				// TODO: handle exception
			}finally {
				dbCon.dbClose(rs, stmt, conn);
			}


			return vc;
		}

		/*
		 * 
		 * qnABean.setEmail(email);
	qnABean.setNo_text(text);
	qnABean.setNo_title(title);
	qnABean.setNo_date(date);

		 */

		public void  insert(QnABean qnABean) {
			DBCon dbCon = new DBCon();
			Connection conn = null;
			String sql = 
					"insert into qa_border(`user_id` , `email` , `qa_title` , `qa_text`,`qa_date`)"+ 
							"values (?,?,?,?,?);";


			try {
				conn = DriverManager.getConnection(dbCon.getJDBC_URL(),dbCon.getID(),dbCon.getPASS());
				stmt = conn.prepareStatement(sql);

				QnABean beans = qnABean;
	              stmt.setString(1, qnABean.getUser_id());
	              stmt.setString(2, qnABean.getEmail());
	              stmt.setString(3, qnABean.getQ_title());
	              stmt.setString(4, qnABean.getQ_text());
	              stmt.setString(5, qnABean.getQ_date());
	  			
				stmt.executeUpdate();



			}catch (Exception e) {
				System.out.println("Exception:" + e);
				// TODO: handle exception
			}finally {
				dbCon.dbClose(stmt, conn);
			}


		}
		
		public void deleteID(QnABean qABean) {
			DBCon dbCon = new DBCon();
			Connection conn = null;
			String sql = "delete from qa_border where regno= ?";


			try {
				conn = DriverManager.getConnection(dbCon.getJDBC_URL(),dbCon.getID(),dbCon.getPASS());
				stmt = conn.prepareStatement(sql);

				QnABean beans = qABean;
				stmt.setInt(1, beans.getRegno());

				stmt.executeUpdate();




			}catch (Exception e) {
				System.out.println("Exception:" + e);
				// TODO: handle exception
			}finally {
				dbCon.dbClose(stmt, conn);
			}
		}


	    public void updateID(QnABean qnABean) {
	    	DBCon dbCon = new DBCon();
			Connection conn = null;
			String sql ="update qa_border set qa_title=?,qa_date=?,email = ?,qa_text =? where user_id=?";


			try {
				conn = DriverManager.getConnection(dbCon.getJDBC_URL(),dbCon.getID(),dbCon.getPASS());
				stmt = conn.prepareStatement(sql);

				QnABean beans = qnABean;
	              
			    stmt.setString(1, beans.getQ_title());
			    stmt.setString(2, beans.getQ_date());
			    stmt.setString(3, beans.getEmail());
			    stmt.setString(4, beans.getQ_text());
			    stmt.setString(5, beans.getUser_id());

				int count = stmt.executeUpdate(); //max count
				System.out.printf(count+"callumn");



			}catch (Exception e) {
				System.out.println("Exception:" + e);
				// TODO: handle exception
			}finally {
				dbCon.dbClose(stmt, conn);
			}
	    }

	}
	 






