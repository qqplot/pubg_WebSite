package pubg.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class NoticeSQL {

	private PreparedStatement stmt;
	private ResultSet rs;

	public Vector<NoticeBean> SelectAll() {
		DBCon dbCon = new DBCon();
		Connection conn = null;
		Vector<NoticeBean> vc = new Vector<NoticeBean>();
		String sql = "select  * from notice_border";

		try {
			conn = DriverManager.getConnection(dbCon.getJDBC_URL(), dbCon.getID(), dbCon.getPASS());
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				NoticeBean noticeBean = new NoticeBean();
				noticeBean.setRegno(rs.getInt(1));
				noticeBean.setNo_title(rs.getString("no_title"));
				noticeBean.setNo_date(rs.getString("no_date"));
				noticeBean.setNo_text(rs.getString("no_text"));
				vc.add(noticeBean);
			}
		} catch (Exception e) {
			System.out.println("Exception:" + e);
		} finally {
			dbCon.dbClose(rs, stmt, conn);
		}
		return vc;
	}

	public void insert(NoticeBean nbean) {
		DBCon dbCon = new DBCon();
		Connection conn = null;
		String sql = "INSERT INTO `battle`.`notice_border` ( `user_id`, `no_title`, `no_text`, `no_date`) VALUES ( ?, ?,?, ?);";

		try {
			conn = DriverManager.getConnection(dbCon.getJDBC_URL(), dbCon.getID(), dbCon.getPASS());
			stmt = conn.prepareStatement(sql);

			NoticeBean beans = nbean;
			System.out.printf(beans.getNo_date(), beans.getNo_text(), beans.getNo_title());
			stmt.setString(1, "user");
			stmt.setString(2, beans.getNo_title());
			stmt.setString(3, beans.getNo_text());
			stmt.setString(4, beans.getNo_date());
			int count = stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception:" + e);
		} finally {
			dbCon.dbClose(rs, stmt, conn);
		}
	}
}
