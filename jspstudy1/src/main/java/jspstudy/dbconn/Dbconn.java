package jspstudy.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconn {
	Connection conn;
	private String coninfo ="jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
	private String idinfo ="root";
	private String pwdinfo = "1234";
	
	public Connection getConnection() {
		Connection conn = null;
		try {
        Class.forName("com.mysql.cj.jdbc.Driver");
	    System.out.println("생성자");
		conn = DriverManager.getConnection(coninfo, idinfo, pwdinfo);
		System.out.println("드라이버 로딩 성공");
		}catch(Exception e) {
		System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}
			return conn;
	}
		
}
		
	/*String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user="system";
	String password = "1111";		
		
		public Connection getConnection() {
			Connection conn = null;
			try {
				
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(url, user, password);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
}*/
