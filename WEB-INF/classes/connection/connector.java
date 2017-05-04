package connection;
import java.sql.*;
public class connector {

	static Connection con=null;
	static String driver="com.ibm.db2.jcc.DB2Driver";
	static String url="jdbc:db2://localhost:50000/JOBS";
	static String user="Dell";
	static String pass="VSSLLOO";
	public static Connection connect()
	{
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,pass);
			System.out.println("Connected");
		}
		catch(Exception e)
		{
			System.out.println("Connection failed!!");
		}
		return con;
	

	}

}
