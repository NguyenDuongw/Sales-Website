package controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.user;
import dao.AccountDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();

			Context env = (Context) initContext.lookup("java:comp/env");

			ds = (DataSource) env.lookup("jdbc/webshop");

		} catch (NamingException e) {
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");

		if (action == null) {
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		} else if (action.equals("login")) {
			request.setAttribute("email", "");
			request.setAttribute("password", "");
			request.setAttribute("message", "");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
			out.println("unrecognised action");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// use connection
				PrintWriter out = response.getWriter();

				String action = request.getParameter("action");

				if (action == null) {
					out.println("unrecognised action");
					return;
				}

				Connection conn = null;

				try {
					conn = ds.getConnection();
				} catch (SQLException e) {
					out.println("Unable to connect to database.");
					System.out.println("Unable to connect to database.");
					return;
					// throw new ServletException();
				}

				if (action.equals("dologin")) {
					String email = request.getParameter("email");
					String password = request.getParameter("password");

					user user = new user(email, password);

					request.setAttribute("email", email);
					request.setAttribute("password", "");

					AccountDAO account = new AccountDAO(conn);
					
					try {
						if (account.login(email, password)) {
							request.getRequestDispatcher("admin/index.jsp").forward(request, response);
						} else {
							request.setAttribute("message", "email address or password not recognised");
							request.getRequestDispatcher("/login.jsp").forward(request, response);
						}
					} catch (SQLException | ServletException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
	}

}
