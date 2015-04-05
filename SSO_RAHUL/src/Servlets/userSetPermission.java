package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DAO;

/**
 * Servlet implementation class userSetPermission
 */
public class userSetPermission extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSetPermission() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processrequest(request,response);
	}

	private void processrequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String read = request.getParameter("read");
		String write = request.getParameter("write");
		String exec = request.getParameter("exec");
		if (read != null) {
			DAO.updateRead(request.getParameter("read"),request.getParameter("rid"), request.getParameter("uid"));
			request.getRequestDispatcher("userInfo.jsp?uid="+request.getParameter("uid")).forward(request, response);
		}
		if (write != null) {
			DAO.updateWrite(request.getParameter("write"),request.getParameter("rid"), request.getParameter("uid"));
			request.getRequestDispatcher("userInfo.jsp?uid="+request.getParameter("uid")).forward(request, response);
		}
		if (exec != null) {
			DAO.updateExec(request.getParameter("exec"),request.getParameter("rid"), request.getParameter("uid"));
			request.getRequestDispatcher("userInfo.jsp?uid="+request.getParameter("uid")).forward(request, response);
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processrequest(request,response);
	}

}
