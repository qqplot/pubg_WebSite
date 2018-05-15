package pubg.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JoinCheck {

	// Member Variables (Set Variables for Connecting to Server DB)
	private final String URL = "jdbc:mysql://localhost:3306/pubgdb?useSSL=false";
	private final String ID = "root";
	private final String PW = "1111";
	
	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	// Constructor (Connect to the Driver)
	public JoinCheck() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("(서버) 드라이버 연결 성공!");
		} catch (ClassNotFoundException e) {
			System.out.print("(서버) 드라이버 연결 실패!<br/>");
		}
	}

	// Member Methods
	public boolean check_value(String column_name, String user_input) { // Check Duplication
		String query = "select '" + column_name + "' from member";
		try {
			con = DriverManager.getConnection(URL, ID, PW); // Synchronize with DB
			st = con.createStatement();
			rs = st.executeQuery(query);

			while (rs.next()) {
				if (rs.getString(column_name).equals(user_input)) {
					return true;
				}
			}
		} catch (SQLException e) {
			System.out.println("(서버) DB 연동에 실패했습니다...");
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("(서버) rs 닫히지 않음!");
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					System.out.println("(서버) ps 닫히지 않음!");
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println("(서버) con 닫히지 않음!");
				}
			}
		} // try ~ catch ~ finally
		return false;
	} // check_value()

	public boolean check_login(String user_id, String password) {
		String query_login = "select * from member where user_id = '" + user_id + "' and password = '" + password + "'";
		
		try {
			con = DriverManager.getConnection(URL, ID, PW); // Synchronize with DB
			st = con.createStatement();
			rs = st.executeQuery(query_login);
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("(서버) DB 연동에 실패했습니다...");
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("(서버) rs 닫히지 않음!");
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					System.out.println("(서버) ps 닫히지 않음!");
				}
			}
			if (con != null) {
				try {
					st.close();
				} catch (SQLException e) {
					System.out.println("(서버) con 닫히지 않음!");
				}
			}
		} // try ~ catch ~ finally
		return false;
	} // check_login()

	public boolean insert_sql(String user_id, String password, String address, String email) {
		String query_insert = "insert into member(user_id, password, address, email) values("
				+ user_id +","+ password +","+ address + "," + email + ")";

		try {
			con = DriverManager.getConnection(URL, ID, PW); // Synchronize with DB
			st = con.createStatement();
			st.executeUpdate(query_insert);
			return true;
		} catch (SQLException e) {
			System.out.println("(서버) 회원가입에 실패했습니다.");
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("(서버) rs 닫히지 않음!");
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					System.out.println("(서버) ps 닫히지 않음!");
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println("(서버) con 닫히지 않음!");
				}
			}
		} // try ~ catch ~finally
		return false;
	} // insert_sql()

	public boolean delete_sql(String user_id, String password) {
		String query_delete = "delete from member where user_id = '" + user_id + "' and password = '" + password + "'";
		try {
			con = DriverManager.getConnection(URL, ID, PW); // Synchronize with DB
			st = con.createStatement();
			st.executeUpdate(query_delete);
			return true;
		} catch (SQLException e) {
			System.out.println("(서버) 탈퇴에 실패했습니다.");
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("(서버) rs 닫히지 않음!");
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					System.out.println("(서버) ps 닫히지 않음!");
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println("(서버) con 닫히지 않음!");
				}
			}
		} // try ~ catch ~finally
		return false;
	} // delete_sql()

}// class
