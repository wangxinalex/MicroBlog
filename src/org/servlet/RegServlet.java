package org.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bll.User;
import org.bll.UserAction;
import org.util.Encrypt;

public class RegServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7993744682493248190L;

	/**
	 * Constructor of the object.
	 */
	public RegServlet() {
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
		String username = request.getParameter("username");
		String password = Encrypt.getMD5(request.getParameter("password"));
		String nickname = request.getParameter("nickname");
		String comefrom = request.getParameter("comefrom");
		try {
			if(UserAction.getUserByUsername(username)){
				response.sendRedirect("../register.jsp?duplicated=true");
				return;
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			response.sendRedirect("../error.jsp?errorcode=RegServlet");
		}
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setComefrom(comefrom);
		/*Set the default avatars*/
		user.setHeadurl("images/caption.png");
		try {
			if(UserAction.Reg(user)){
				/*Set the newly registered user as logged in*/
				request.getSession().setAttribute("user", user);
				response.sendRedirect("../ui.jsp");
			}else{
				response.sendRedirect("../error.jsp?errorcode=RegServlet");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("../error.jsp?errorcode=RegServlet");
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
