package org.bll;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 * @author wangxinalex
 * Actions about relations, Containing posting, deleting, selection, etc. 
 */
public class RelationAction {
	// Here defines how to connector the database.
	private static final String connectionString = "jdbc:mysql://localhost:3306/mblog";
	// username for mysql, 'root' by default.
	private static final String dbUsername = "root";
	// user password for mysql, change to yours.
	private static final String dbPassword = "root";
	private static final String AddRelation = "INSERT INTO relation(source,target) VALUES(?,?)";
	private static final String GetRelationBySource = "SELECT DISTINCT * FROM relation WHERE source = ?";
	private static final String GetRelationByTarget = "SELECT DISTINCT * FROM relation WHERE target = ?";
	private static final String GetRelationBySourceAndTarget = "SELECT DISTINCT * FROM relation WHERE source=? AND target = ?";
	private static final String DeleteRelationBySourceAndTarget = "DELETE FROM relation WHERE source=? AND target = ?";
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

	public static boolean addRelation(Relation relation)  {
		PreparedStatement ps = null;
		try {
			ps = c.prepareStatement(AddRelation);
			ps.setInt(1, relation.getSource());
			ps.setInt(2, relation.getTarget());
			ps.executeUpdate();

		} catch (SQLException e) {
			return false;
		} 
		return true;
	}

	public static ArrayList<User> getRelationBySource(int source)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		ArrayList<User> targetUserList = new ArrayList<User>();
		PreparedStatement ps = null;
		ps = c.prepareStatement(GetRelationBySource);
		ps.setInt(1, source);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {

			targetUserList.add(UserAction.getUserById(rs.getInt("target")));

		}
		return targetUserList;
	}

	public static ArrayList<User> getRelationByTarget(int target)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		ArrayList<User> relationList = new ArrayList<User>();
		PreparedStatement ps = null;
		ps = c.prepareStatement(GetRelationByTarget);
		ps.setInt(1, target);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			relationList.add(UserAction.getUserById(rs.getInt("source")));

		}
		return relationList;
	}

	public static boolean getRelationBySourceAndTarget(int source, int target)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		PreparedStatement ps = null;
		ps = c.prepareStatement(GetRelationBySourceAndTarget);
		ps.setInt(1, source);
		ps.setInt(2, target);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			System.out.println("source = " + rs.getInt("source"));
			return true;

		}
		return false;
	}

	public static boolean deleteRelationBySourceAndTarget(int source, int target)
			{
		PreparedStatement ps = null;
		try {
			ps = c.prepareStatement(DeleteRelationBySourceAndTarget);
			ps.setInt(1, source);
			ps.setInt(2, target);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
		}
		

		return true;
	}

	public static int getFollowerNumber(int targetid) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		return getRelationByTarget(targetid).size();

	}
}
