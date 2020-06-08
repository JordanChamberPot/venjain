package logon;

import java.sql.*;

import javax.naming.NamingException;

import common.dbutil.DBConnection;

public class LogonDAO {
	//인스턴스 생성
	private static LogonDAO instance = new LogonDAO();	
	public static LogonDAO getInstance() {
		return instance;
	}
	public int userCheck(String id, String passwd) {
		int x =0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//데이터베이스 연결 후
		try {
			conn = DBConnection.getConnection();
			String sql = "select memno from member where id =? and passwd=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id.trim());
			pstmt.setString(2, passwd.trim());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("memno") != null || rs.getString("memno").length() != 0)
					x = 1;
			}
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//connection 등을 close
		//받은 id, password로 회원이 맞는지 확인하는 로직
		return x;
	}
}
