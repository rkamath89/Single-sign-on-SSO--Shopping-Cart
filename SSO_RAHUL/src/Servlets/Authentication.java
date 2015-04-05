package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Authentication() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();
		Hashtable env = new Hashtable();
		String uid = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(uid);
		System.out.println(password);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/login.jsp");
		String msg = "";

		env.put(Context.INITIAL_CONTEXT_FACTORY,
				"com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.PROVIDER_URL, "ldap://localhost:10389/");
		env.put(Context.SECURITY_PRINCIPAL, "uid=admin,ou=system");
		env.put(Context.SECURITY_CREDENTIALS, "secret");
		// String uid ="test";
		// String password ="test123";
		DirContext ctx = null;
		try {
			// Step 1: Bind anonymously
			ctx = new InitialDirContext(env);
			// Step 2: Search the directory

			String filter = "(&(objectClass=*)(uid={0}))";
			SearchControls ctls = new SearchControls();
			ctls.setSearchScope(SearchControls.SUBTREE_SCOPE);
			ctls.setReturningAttributes(new String[0]);
			ctls.setReturningObjFlag(true);
			NamingEnumeration enm = ctx.search("ou=users,ou=system", filter,
					new String[] { uid }, ctls);
			String dn = null;

			if (enm.hasMore()) {
				SearchResult result = (SearchResult) enm.next();

				dn = result.getNameInNamespace();

				System.out.println("dn: " + dn);
			}

			if (dn == null || enm.hasMore()) {
				// uid not found or not unique
				msg = "USER NAME INVALID!!!";
				request.setAttribute("msg", msg);
				dispatcher.forward(request, response);

			} else if (uid.equals("admin")) {

				// Step 3: Bind with found DN and given password
				ctx.addToEnvironment(Context.SECURITY_PRINCIPAL, dn);
				ctx.addToEnvironment(Context.SECURITY_CREDENTIALS, password);
				// Perform a lookup in order to force a bind operation with JNDI
				ctx.lookup(dn);

				System.out.println("Authentication successful");
				HttpSession session = request.getSession();
				session.setAttribute("username", uid);
				request.getRequestDispatcher("/home.jsp").forward(request,
						response);
			} else {
				// Step 3: Bind with found DN and given password
				ctx.addToEnvironment(Context.SECURITY_PRINCIPAL, dn);
				ctx.addToEnvironment(Context.SECURITY_CREDENTIALS, password);
				// Perform a lookup in order to force a bind operation with JNDI
				ctx.lookup(dn);

				System.out.println("Authentication successful");
				HttpSession session = request.getSession();
				session.setAttribute("username", uid);
				request.getRequestDispatcher("/userInfo.jsp?uid=" + uid)
						.forward(request, response);

			}
		} catch (NamingException e) {
			msg = "PASSWORD INVALID!!!";
			request.setAttribute("msg", msg);
			dispatcher.forward(request, response);
		}

		finally {
			try {
				ctx.close();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
