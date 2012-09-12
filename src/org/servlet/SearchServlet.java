package org.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

public class SearchServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public SearchServlet() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
		String searchContent = request.getParameter("searchContent");
		/* Validate whether the input is legal */
		Pattern searchPattern = Pattern
				.compile("[a-z|A-Z|0-9|\\u4e00-\\ufa29]+");
		Matcher m = searchPattern.matcher(searchContent);
		if (!m.matches()) {
			response.sendRedirect("../error.jsp?errorcode=Illegal_Inputs");
			return;
		}
		ArrayList<User> searchUser = new ArrayList<User>();
		ArrayList<Blog> searchBlog = new ArrayList<Blog>();
		try {
			/* Get all the users and blogs containing the key words */
			searchUser = UserAction.getSearchUser(searchContent);
			searchBlog = BlogAction.searchBlogs(searchContent);
		} catch (SQLException e) {
			response.sendRedirect("../error.jsp?errorcode=SearchServlet");
		}
		/* Set the file mode to be SEARCH */
		request.getSession().setAttribute("type", ConnectionUtil.SEARCH);
		request.getSession().setAttribute("userList", searchUser);
		request.getSession().setAttribute("blogList", searchBlog);
		request.getSession().setAttribute("tempUser", null);
		response.sendRedirect("../userlist.jsp");

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
