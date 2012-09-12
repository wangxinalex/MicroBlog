package org.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.bll.User;
import org.bll.UserAction;

@SuppressWarnings("deprecation")
public class UploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UploadServlet() {
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
	@SuppressWarnings("rawtypes")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		System.out.println("user = " + user);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		int useridInt = user.getId();
		String uploadPath = request.getRealPath("/") + "upload/images/";

		String tempPath = request.getRealPath("/") + "upload/images/temp/";

		if (!new File(uploadPath).isDirectory())
			new File(uploadPath).mkdirs();
		if (!new File(tempPath).isDirectory())
			new File(tempPath).mkdirs();
		try {
			DiskFileUpload uploadFile = new DiskFileUpload();

			uploadFile.setSizeMax(4194304);

			uploadFile.setSizeThreshold(4096);

			uploadFile.setRepositoryPath(tempPath);

			List fileItems = uploadFile.parseRequest(request);
			Iterator i = fileItems.iterator();

			while (i.hasNext()) {
				FileItem file = (FileItem) i.next();
				String fileName = file.getName();
				/* Generate the unique file name for uploaded avatars */
				if (fileName != null
						&& (fileName.endsWith(".jpg")
								|| fileName.endsWith(".gif") || fileName
								.endsWith(".png"))) {
					String filename = null;
					Random rd = new Random();
					Calendar time = Calendar.getInstance();
					if (fileName.endsWith(".jpg")) {
						filename = String.valueOf(time.get(Calendar.YEAR))
								+ String.valueOf(time.get(Calendar.MONTH))
								+ String.valueOf(time
										.get(Calendar.DAY_OF_MONTH))
								+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
								+ String.valueOf(time.get(Calendar.MINUTE))
								+ String.valueOf(time.get(Calendar.SECOND))
								+ String.valueOf(rd.nextInt(100)) + ".jpg";
					} else if (fileName.endsWith(".gif")) {
						filename = String.valueOf(time.get(Calendar.YEAR))
								+ String.valueOf(time.get(Calendar.MONTH))
								+ String.valueOf(time
										.get(Calendar.DAY_OF_MONTH))
								+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
								+ String.valueOf(time.get(Calendar.MINUTE))
								+ String.valueOf(time.get(Calendar.SECOND))
								+ String.valueOf(rd.nextInt(100)) + ".gif";
					} else {
						filename = String.valueOf(time.get(Calendar.YEAR))
								+ String.valueOf(time.get(Calendar.MONTH))
								+ String.valueOf(time
										.get(Calendar.DAY_OF_MONTH))
								+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
								+ String.valueOf(time.get(Calendar.MINUTE))
								+ String.valueOf(time.get(Calendar.SECOND))
								+ String.valueOf(rd.nextInt(100)) + ".png";
					}
					File f1 = new File(uploadPath + filename);
					String headurl = f1.getAbsolutePath();
					file.write(f1);
					/* Get the right file path of the uploaded avatars */
					headurl = headurl.replace("\\", "/");
					Pattern pattern = Pattern.compile("upload[\\w\\.\\d\\/]+");
					Matcher matcher = pattern.matcher(headurl);
					StringBuffer buffer = new StringBuffer();

					if (matcher.find()) {
						buffer.append(matcher.group(0));
					}
					/*Update the avatar of a user*/
					User newuser = UserAction.UpdateHeadById(buffer.toString(),
							useridInt);
					request.getSession().setAttribute("user", newuser);
					response.sendRedirect("../ui.jsp");
				} else {
					out.println("只允许上传 *.jpg , *.gif , *.png");
					response.sendRedirect("../ui.jsp");
				}
			}
		} catch (Exception e) {
			response.sendRedirect("../error.jsp?errorcode=UploadServlet");
			return;
		}
		out.flush();
		out.close();
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
