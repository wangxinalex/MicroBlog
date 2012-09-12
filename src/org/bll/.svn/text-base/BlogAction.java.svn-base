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
 * Actions about blogs, Containing posting, deleting, selection, etc. 
 */
public class BlogAction {
	// Here defines how to connector the database.
	private static final String connectionString = "jdbc:mysql://localhost:3306/mblog";
	// username for mysql, 'root' by default.
	private static final String dbUsername = "root";
	// user password for mysql, change to yours.
	private static final String dbPassword = "root";

	private static final String postSQL = "INSERT INTO mblogs(txt,idpublisher,idoriginalmblog,time) VALUES(?,?,?,now())";
	private static final String GetBlogSQL = "SELECT * FROM mblogs WHERE idmblogs = ?";
	private static final String GetAllBlogSQL = "SELECT * FROM mblogs ORDER BY time DESC";
	private static final String GetBlogByPublisher = "SELECT * FROM mblogs WHERE idpublisher = ? ORDER BY time DESC";
	private static final String DeleteBlogSQL = "DELETE FROM mblogs WHERE idmblogs = ?";
	private static final String FavouriteBlogSQL = "SELECT * FROM mblogs WHERE idpublisher IN (SELECT target FROM relation WHERE source = ?) ORDER BY time DESC";
	private static final String GetSearchBlogSQL = "SELECT * FROM mblogs WHERE INSTR(txt,?)<>0";
	private static final int MAXLIMIT = 10;
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

	public static ArrayList<Blog> selectBlogByPublisher(int publisherid)
			throws SQLException {
		ArrayList<Blog> bloglist = new ArrayList<Blog>();

		PreparedStatement ps = null;
		ps = c.prepareStatement(GetBlogByPublisher);
		ps.setInt(1, publisherid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Blog blog = new Blog();
			blog.setId(rs.getInt("idmblogs"));
			blog.setPublisherid(publisherid);
			blog.setText(rs.getString("txt"));
			blog.setOriginalid(rs.getInt("idoriginalmblog"));
			blog.setPosttime(rs.getTimestamp("time"));
			bloglist.add(blog);

		}
		return bloglist;
	}

	public static ArrayList<Blog> getAllBlogs(int publisherid)
			throws SQLException {
		ArrayList<Blog> bloglist = new ArrayList<Blog>();

		PreparedStatement ps = null;
		ps = c.prepareStatement(GetAllBlogSQL);

		ResultSet rs = ps.executeQuery();
		int i = 0;
		while (rs.next() && i++ < MAXLIMIT) {
			Blog blog = new Blog();
			blog.setId(rs.getInt("idmblogs"));
			blog.setPublisherid(rs.getInt("idpublisher"));
			blog.setText(rs.getString("txt"));
			blog.setOriginalid(rs.getInt("idoriginalmblog"));
			blog.setPosttime(rs.getTimestamp("time"));
			bloglist.add(blog);

		}
		return bloglist;
	}

	/* Get all blogs from all my following users */
	public static ArrayList<Blog> favouriteBlogs(int sourceid)
			throws SQLException {
		ArrayList<Blog> bloglist = new ArrayList<Blog>();

		PreparedStatement ps = null;
		ps = c.prepareStatement(FavouriteBlogSQL);
		ps.setInt(1, sourceid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Blog blog = new Blog();
			blog.setId(rs.getInt("idmblogs"));
			blog.setPublisherid(rs.getInt("idpublisher"));
			blog.setText(rs.getString("txt"));
			blog.setOriginalid(rs.getInt("idoriginalmblog"));
			blog.setPosttime(rs.getTimestamp("time"));
			bloglist.add(blog);

		}
		return bloglist;
	}

	public static boolean PostBlog(Blog blog) throws SQLException {

		PreparedStatement ps = null;
		try {
			ps = c.prepareStatement(postSQL, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, blog.getText());
			ps.setInt(2, blog.getPublisherid());
			if (blog.getOriginalid() != 0) {
				ps.setInt(3, blog.getOriginalid());
			} else {
				ps.setObject(3, null);
			}
			ps.executeUpdate();
			ResultSet newid = ps.getGeneratedKeys();
			if (newid.next()) {
				blog.setId(newid.getInt(1));
				PreparedStatement ps2 = c.prepareStatement(GetBlogSQL);
				ps2.setInt(1, blog.getId());
				ResultSet rs2 = ps2.executeQuery();
				if (rs2.next()) {
					blog.setPosttime(rs2.getTimestamp("time"));
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

	public static boolean deleteBlogById(int blogid) {

		PreparedStatement ps = null;
		try {
			ps = c.prepareStatement(DeleteBlogSQL);

			ps.setInt(1, blogid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
		}
		return true;
	}

	public static ArrayList<Blog> searchBlogs(String str) throws SQLException {
		ArrayList<Blog> bloglist = new ArrayList<Blog>();

		PreparedStatement ps = null;
		ps = c.prepareStatement(GetSearchBlogSQL);
		ps.setString(1, str);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Blog blog = new Blog();
			blog.setId(rs.getInt("idmblogs"));
			blog.setPublisherid(rs.getInt("idpublisher"));
			blog.setText(rs.getString("txt"));
			blog.setOriginalid(rs.getInt("idoriginalmblog"));
			blog.setPosttime(rs.getTimestamp("time"));
			bloglist.add(blog);

		}
		return bloglist;
	}

	public static Blog getBlogById(int blogid) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {

		PreparedStatement ps = c.prepareStatement(GetBlogSQL);
		ps.setInt(1, blogid);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			Blog blog = new Blog();
			blog.setId(blogid);

			blog.setText(rs.getString("txt"));

			blog.setPublisherid(rs.getInt("idpublisher"));
			blog.setOriginalid(rs.getInt("idoriginalmblog"));
			blog.setPosttime(rs.getTimestamp("time"));

			System.out.println("getBlog = " + blog);
			return blog;
		} else {
			return null;
		}
	}

	/* Get the forward attached comments */
	public static String getForwardAttach(int blogid) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		String forwardAttach = "";
		Blog blog = getBlogById(blogid);

		if (blog.getOriginalid() != 0)
			forwardAttach = "//@" + BlogAction.getPublisherNameByBlogId(blogid)
					+ ":" + blog.getText();
		return forwardAttach;
	}

	public static String getForwardAttachHistory(int blogid)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		StringBuilder forwardAttach = new StringBuilder();
		Blog blog = getBlogById(blogid);
		int i = 0;
		while (blog.getOriginalid() != 0) {
			if (i != 0) {
				String publishername = UserAction.getUserById(
						blog.getPublisherid()).getNickname();
				forwardAttach.append("//@" + publishername + ":"
						+ blog.getText());
			}
			blog = getBlogById(blog.getOriginalid());
			i++;
		}

		return forwardAttach.toString();
	}

	public static String getPublisherNameByBlogId(int blogid)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		Blog blog = getBlogById(blogid);
		return UserAction.getUserById(blog.getPublisherid()).getNickname();

	}

	/* Get the original blog of a forward blog */
	public static Blog getTheOriginalBlog(int blogid) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		Blog blog = getBlogById(blogid);

		while (blog.getOriginalid() != 0) {

			blog = getBlogById(blog.getOriginalid());

		}
		return blog;

	}

}
