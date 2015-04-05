package

filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sessionFilter implements Filter {

	public sessionFilter() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		HttpServletResponse res = (HttpServletResponse) response;

		try {
			String userid = (String) req.getSession(false).getAttribute(
					"username");
			if (userid == null || !userid.equals("admin")) {
				res.sendRedirect("index.html");
				System.out.println("Session is not created");
			}

			else if (userid.equals("admin"))
				System.out.println("Admin session");
			else
				System.out.println("Normal Users");
		}

		catch (NullPointerException e) {
			res.sendRedirect("index.html");

		}

		chain.doFilter(request, response);

	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}