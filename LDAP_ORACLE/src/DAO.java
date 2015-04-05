import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class DAO {
	static Connection conn = null;
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@10.80.16.238:1522:ora11gin", "markdev",
					"markdev");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static boolean userExists(String uid) throws SQLException
	{
		String sql = "Select * from RAHUL_USER where USER_ID='"+uid+"'";
		Statement st =conn.createStatement();
		ResultSet rs= st.executeQuery(sql);
		return rs.next();
	}
	public static void addUser(String uid, String cn, String sn) {
		try {
			if(!userExists(uid))
			{
				String sql = "INSERT INTO RAHUL_USER(USER_ID,COMMON_NAME,SUR_NAME) VALUES(?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, cn);
				pstmt.setString(3, sn);
				pstmt.executeUpdate();
				pstmt.close();
			}
			} 
		catch (SQLException e)
		{
			System.err.println("ERROR: " + e.getMessage());
		}
	}
}