package org.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.bll.User;

public class ConnectionUtil {
	public final static String connectionUrl = "jdbc:mysql://localhost/mblog?user=root&password=root";
	public final static String connectionStr = "com.mysql.jdbc.Driver";
	private static final String GetUserSQL = "SELECT * FROM user where iduser = ?";
	public static final int NORMAL = 1;
	public static final int SEARCH = 2;
	public static final int FOLLOWING = 3;
	public static final int FOLLOWER = 4;

	public static Connection getConnection() throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {

		Class.forName(connectionStr).newInstance();
		Connection connection = DriverManager.getConnection(connectionUrl);
		return connection;
	}

	public static ResultSet select(String table, String arg0, String arg1)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {

		Statement statement = getConnection().createStatement();
		String sql = "SELECT * FROM " + table + " WHERE " + arg0 + " = " + arg1;
		ResultSet rs = statement.executeQuery(sql);
		return rs;

	}

	public static User getUserById(int userid) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		PreparedStatement ps = getConnection().prepareStatement(GetUserSQL);
		ps.setInt(1, userid);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			User user = new User();
			user.setId(userid);

			user.setUsername(rs.getString("username"));

			user.setNickname(rs.getString("nickname"));
			user.setHeadurl(rs.getString("headurl"));
			user.setComefrom(rs.getString("comefrom"));

			System.out.println(user);
			return user;
		} else {
			return null;
		}
	}

}
