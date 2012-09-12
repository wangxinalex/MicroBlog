package org.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bll.Blog;
import org.bll.BlogAction;
import org.util.ConnectionUtil;

public class ForwardServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8590218751706294629L;

	/**
	 * Constructor of the object.
	 */
	public ForwardServlet() {
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
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
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
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String forwardContent = request.getParameter("forwardContent");
		if(forwardContent.length()>=140){
			forwardContent=forwardContent.substring(0, 140);
		}
		int publisherid = Integer.parseInt(request.getParameter("publisherid"));
		int originalblogid = Integer.parseInt(request.getParameter("originalblogid"));
		Blog blog = new Blog();
		blog.setText(forwardContent);
		blog.setPublisherid(publisherid);
		blog.setOriginalid(originalblogid);
		ArrayList<Blog> bloglist = new ArrayList<Blog>();

		try {
			if (BlogAction.PostBlog(blog)) {
				bloglist = BlogAction.getAllBlogs(publisherid);
				request.getSession().setAttribute("type", ConnectionUtil.NORMAL);
				request.getSession().setAttribute("blogList", bloglist);
				request.getSession().setAttribute("tempUser", null);
				response.sendRedirect("../ui.jsp");
			} else {
				response.sendRedirect("../error.jsp?errorcode=ForwardServlet");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("../error.jsp?errorcode=ForwardServlet");
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
