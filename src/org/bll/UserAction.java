package org.bll;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
/**
 * @author wangxinalex
 * Actions about users, Containing posting, deleting, selection, etc. 
 */
public class UserAction {
	// Here defines how to connector the database.
	private static final String connectionString = "jdbc:mysql://localhost:3306/mblog";
	// username for mysql, 'root' by default.
	private static final String dbUsername = "root";
	// user password for mysql, change to yours.
	private static final String dbPassword = "root";

	private static final String LoginSQL = "SELECT * FROM user where username = ? and password = ?";
	private static final String RegSQL = "INSERT INTO user(username,password,nickname,comefrom,headurl,regtime) values(?,?,?,?,?,now())";
	private static final String GetUserSQL = "SELECT * FROM user where iduser = ?";
	private static final String UpdateHeadSQL = "UPDATE user SET headurl = ? WHERE iduser = ?";
	private static final String GetUserByNameSQL = "SELECT * FROM user WHERE username = ?";
	private static final String GetNewUserSQL = "SELECT * FROM user ORDER BY regtime DESC";
	private static final String GetHotUserSQL = "SELECT * FROM user ORDER BY (SELECT COUNT(*) FROM relation WHERE target = iduser) DESC";
	private static final String GetSearchUserSQL = "SELECT * FROM user WHERE INSTR(nickname,?)<>0";
	private static Connection c = null;
	static {
		try {
			// class name for mysql driver
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection(connectionString, dbUsername,
					dbPassword);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static User Login(String username, String password)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		// simulate the login procedure
		PreparedStatement ps = null;
		ps = c.prepareStatement(LoginSQL, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			int id = rs.getInt("iduser");
			String nickname = rs.getString("nickname");
			String comefrom = rs.getString("comefrom");
			String headurl = rs.getString("headurl");

			User user = new User();
			user.setId(id);
			user.setNickname(nickname);
			user.setUsername(username);
			user.setComefrom(comefrom);
			user.setHeadurl(headurl);

			return user;
		} else {
			return null;
		}
	}

	public static boolean Reg(User user) throws SQLException {
		PreparedStatement ps = null;
		try {
			ps = c.prepareStatement(RegSQL, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getNickname());
			ps.setString(4, user.getComefrom());
			ps.setString(5, user.getHeadurl());
			ps.executeUpdate();
			ResultSet newid = ps.getGeneratedKeys();
			if (newid.next()) {
				user.setId(newid.getInt(1));
				PreparedStatement ps2 = c.prepareStatement(GetUserSQL);
				ps2.setInt(1, user.getId());
				ResultSet rs2 = ps2.executeQuery();
				if (rs2.next()) {
					user.setRegtime(rs2.getTimestamp("regtime"));
				}
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static User getUserById(int userid) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {

		PreparedStatement ps = c.prepareStatement(GetUserSQL);
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

	public static User UpdateHeadById(String headurl, int userid)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {

		PreparedStatement ps = c.prepareStatement(UpdateHeadSQL);
		ps.setString(1, headurl);
		ps.setInt(2, userid);
		ps.executeUpdate();
		return getUserById(userid);

	}

	public static boolean getUserByUsername(String username)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {

		PreparedStatement ps = c.prepareStatement(GetUserByNameSQL);
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}

	public static ArrayList<User> getNewUser() throws SQLException {

		PreparedStatement ps = c.prepareStatement(GetNewUserSQL);
		ResultSet rs = ps.executeQuery();
		ArrayList<User> newUserList = new ArrayList<User>();
		while (rs.next()) {
			User user = new User();
			user.setId(rs.getInt("iduser"));
			user.setUsername(rs.getString("username"));
			user.setNickname(rs.getString("nickname"));
			user.setHeadurl(rs.getString("headurl"));
			user.setComefrom(rs.getString("comefrom"));
			newUserList.add(user);
		}
		return newUserList;

	}

	public static ArrayList<User> getHotUser() throws SQLException {

		PreparedStatement ps = c.prepareStatement(GetHotUserSQL);
		ResultSet rs = ps.executeQuery();
		ArrayList<User> hotUserList = new ArrayList<User>();
		while (rs.next()) {
			User user = new User();
			user.setId(rs.getInt("iduser"));

			user.setUsername(rs.getString("username"));

			user.setNickname(rs.getString("nickname"));
			user.setHeadurl(rs.getString("headurl"));
			user.setComefrom(rs.getString("comefrom"));

			hotUserList.add(user);
		}
		return hotUserList;

	}

	public static ArrayList<User> getSearchUser(String str) throws SQLException {

		PreparedStatement ps = c.prepareStatement(GetSearchUserSQL);
		ps.setString(1, str);
		ResultSet rs = ps.executeQuery();
		ArrayList<User> newUserList = new ArrayList<User>();
		while (rs.next()) {
			User user = new User();
			user.setId(rs.getInt("iduser"));
			user.setUsername(rs.getString("username"));
			user.setNickname(rs.getString("nickname"));
			user.setHeadurl(rs.getString("headurl"));
			user.setComefrom(rs.getString("comefrom"));

			newUserList.add(user);
		}
		return newUserList;

	}
}
