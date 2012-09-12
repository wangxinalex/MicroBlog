package org.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bll.Relation;
import org.bll.RelationAction;

public class ChangeRelationServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ChangeRelationServlet() {
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
		String userid = request.getParameter("userid");
		String deleteFollowingId = request.getParameter("deletefollowing");
		String addFollowingId = request.getParameter("addfollowing");
		String otherHomePage = request.getParameter("otherhomepage");
		int useridInt = Integer.parseInt(userid);
		if (deleteFollowingId != null) {
			/* Delete a relation */
			int deleteFollowingIdInt = Integer.parseInt(deleteFollowingId);
			/* Delete this relation */
			if(!RelationAction.deleteRelationBySourceAndTarget(useridInt,
					deleteFollowingIdInt)){
				response.sendRedirect("../error.jsp?errorcode=ChangeRelationServlet");
				return;
			}

		} else {
			/* add a relation */
			int addFollowingIdInt = Integer.parseInt(addFollowingId);
			Relation relation = new Relation();
			relation.setSource(useridInt);
			relation.setTarget(addFollowingIdInt);
			if(!RelationAction.addRelation(relation)){
				response.sendRedirect("../error.jsp?errorcode=ChangeRelationServlet");
				return;
			}
		}
		if ("true".equals(otherHomePage)) {
			/* If it is other user's homepage, redirect to ui.jsp */
			response.sendRedirect("../ui.jsp");
			return;
		}
		if (request.getSession().getAttribute("type").equals("following")) {

			try {
				request.getSession().setAttribute("userList",
						RelationAction.getRelationBySource(useridInt));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				response.sendRedirect("../error.jsp?errorcode=ChangeRelationServlet");
				return;
			}
		}
		/* Otherwise redirect to userlist.jsp */
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
