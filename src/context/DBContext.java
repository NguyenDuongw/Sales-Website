package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	/* Change/update information of your dtbase connection */
	private final String serverName = "10.211.55.5";
	private final String dbName = "ShoppingDB";
	private final String portNumber = "1433";
	private final String instance = ""; //LEAVE EMPTY IF YOUR SQL IS SINGLE INSTANCE
	private final String userID = "sa";
	private final String password = "sa";
	
	
	/* USE BELLOW METHOD FOR DATABASE CONNECTION */
	/* DO NOT EDIT METHOD BELOW */
	public Connection getConnection() throws Exception{
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + ";databaseName=" + dbName;
		if (instance == null || instance.trim().isEmpty()) {
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
		}
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}
}
