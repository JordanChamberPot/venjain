package common.dbutil;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class DBConnection {
	public static DBConnection instance = new DBConnection();
	
	private DBConnection() {}
	
	//JNDI(Java Naming service Database Interface)를 사용 
	public static Connection getConnection() throws NamingException, SQLException {
//		Context inCtx = new InitialContext();
//		Context enCtx = (Context) inCtx.lookup("java:com/env");
//		DataSource ds = (DataSource) enCtx.lookup("jdbc/soldesk");
//		Connection conn = ds.getConnection();
        Context context = new InitialContext();
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/soldesk");
        Connection conn = dataSource.getConnection(); 

		return conn;
		
	}
	
	public static DBConnection getIinsatnce() {
		return instance;
	}
	
	
}
