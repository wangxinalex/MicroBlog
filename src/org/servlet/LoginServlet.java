package org.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bll.Blog;
import org.bll.BlogAction;
import org.bll.User;
import org.bll.UserAction;
import org.util.ConnectionUtil;
import org.util.Encrypt;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String useridStr = request.getParameter("userid");
		User user = new User();
		if (!"".equals(useridStr) && useridStr != null) {
			int userid = Integer.parseInt(useridStr);
			try {
				/* Get all my blogs */
				user = UserAction.getUserById(userid);
				request.getSession().setAttribute("tempUser", user);
				// System.out.println("tempUser = "+user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				response.sendRedirect("../error.jsp?errorcode=MyBlogServlet");
			}
		} else {
			user = (User) request.getSession().getAttribute("user");
		}
		int userid = user.getId();
		ArrayList<Blog> allBlogs = new ArrayList<Blog>();
		try {
			allBlogs = BlogAction.selectBlogByPublisher(userid);
			request.getSession().setAttribute("blogList", allBlogs);
			response.sendRedirect("../ui.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("../error.jsp?errorcode=MyBlogServlet");
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = Encrypt.getMD5(request.getParameter("password"));
		System.out.println("username = " + username + ", password = "
				+ password);
		Pattern emailPattern = Pattern
				.compile("^([a-zA-Z0-9]+[_|\\-|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\-|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$");
		Matcher emailMatcher = emailPattern.matcher(username);
		if (!emailMatcher.matches()) {
			response.sendRedirect("../error.jsp?errorcode=Illegal_Inputs");
			return;
		}
		User user = null;
		try {
			user = UserAction.Login(username, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.sendRedirect("../error.jsp");
		}
		if (user != null) {
			// login succeeded
			// save the user info to the Session.
			request.getSession().setAttribute("user", user);
			ArrayList<Blog> bloglist = new ArrayList<Blog>();
			try {
				/* Get all latest blogs */
				bloglist = BlogAction.getAllBlogs(user.getId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().setAttribute("type", ConnectionUtil.NORMAL);
			request.getSession().setAttribute("blogList", bloglist);
			request.getSession().setAttribute("tempUser", null);
			response.sendRedirect("../ui.jsp");
		} else {
			/* There is not such a user in the database */
			response.sendRedirect("../login.jsp?loginError=true");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
