package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DAO;

/**
 * Servlet implementation class addResourceToUser
 */
public class addResourceToUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addResourceToUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processrequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processrequest(request, response);
	}

	private void processrequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String resname = request.getParameter("newresource");
		String uid = request.getParameter("uid");
		String read = request.getParameter("read");
		String write = request.getParameter("write");
		String exec = request.getParameter("exec");
		String rid = null;
		try {
			rid = DAO.getResourceId(resname);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		try {
			DAO.addResourceToUser(uid, resname);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (read != null) {
			DAO.updateRead("y", rid, uid);
		} else {
			DAO.updateRead("n", rid, uid);
		}
		if (write != null) {
			DAO.updateWrite("y", rid, uid);
		} else {
			DAO.updateWrite("n", rid, uid);
		}
		if (exec != null) {
			DAO.updateExec("y", rid, uid);
		} else {
			DAO.updateExec("n", rid, uid);
		}
		try {
			request.getRequestDispatcher("group.jsp")
					.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
