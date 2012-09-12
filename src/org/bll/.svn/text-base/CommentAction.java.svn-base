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
 * Actions about comments, Containing posting, deleting, selection, etc. 
 */
public class CommentAction {
	// Here defines how to connector the database.
	private static final String connectionString = "jdbc:mysql://localhost:3306/mblog";
	// username for mysql, 'root' by default.
	private static final String dbUsername = "root";
	// user password for mysql, change to yours.
	private static final String dbPassword = "root";

	private static final String AddCommentSQL = "INSERT INTO comment(txt,idpublisher,idtargetmblog,time) VALUES(?,?,?,now())";
	private static final String GetCommentSQL = "SELECT * FROM comment WHERE idcomment = ?";
	private static final String GetCommentByTarget = "SELECT * FROM comment WHERE idtargetmblog = ? ORDER BY time DESC";
	private static final String DeleteCommentSQL = "DELETE FROM comment WHERE idcomment = ?";
	private static Connection c = null;
	// private static final String GetBlogSQL =
	// "SELECT * FROM mblogs where iduser = ?";
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

	public static ArrayList<Comment> selectCommentByTarget(int targetblogid)
			throws SQLException {
		ArrayList<Comment> commentList = new ArrayList<Comment>();

		PreparedStatement ps = null;
		ps = c.prepareStatement(GetCommentByTarget);
		ps.setInt(1, targetblogid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Comment comment = new Comment();
			comment.setId(rs.getInt("idcomment"));
			comment.setText(rs.getString("txt"));
			comment.setPublisherid(rs.getInt("idpublisher"));
			comment.setTargetblogid(targetblogid);
			comment.setCommentTime(rs.getTimestamp("time"));
			commentList.add(comment);

		}
		return commentList;
	}

	public static boolean addComment(Comment comment) throws SQLException {
		PreparedStatement ps = null;
		try {
			ps = c.prepareStatement(AddCommentSQL,
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, comment.getText());
			ps.setInt(2, comment.getPublisherid());
			ps.setInt(3, comment.getTargetblogid());

			ps.executeUpdate();
			ResultSet newid = ps.getGeneratedKeys();
			if (newid.next()) {
				comment.setId(newid.getInt(1));
				PreparedStatement ps2 = c.prepareStatement(GetCommentSQL);
				ps2.setInt(1, comment.getId());
				ResultSet rs2 = ps2.executeQuery();
				if (rs2.next()) {
					comment.setCommentTime(rs2.getTimestamp("time"));
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

	public static boolean deleteCommentById(int commentid) {
		PreparedStatement ps = null;
		try {
			ps = c.prepareStatement(DeleteCommentSQL);

			ps.setInt(1, commentid);

			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
		}
		return true;
	}
}
