package controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Orders;
import model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dao.ListProductDAO;
import dao.OrdersDAO;

/**
 * Servlet implementation class PayController
 */
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PayController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig) Inside just to connect to sever
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();

			Context env = (Context) initContext.lookup("java:comp/env");

			ds = (DataSource) env.lookup("jdbc/shoppingdb");

		} catch (NamingException e) {
			throw new ServletException();
		}
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		// Setup Connection
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		conn = ds.getConnection();

		// Setup session and received cart from it
		HttpSession session = request.getSession(true);
		Cart c = (Cart) session.getAttribute("cart");

		// If cart not null
		if (c != null) {
			// Creat connection to sever
			OrdersDAO dao = new OrdersDAO(conn);

			// Received parameter from cart.jsp
			String usermail = request.getParameter("usermail");
			String discount = request.getParameter("discount");
			String address = request.getParameter("address");

			// Create new Order
			Orders d = new Orders(usermail, 2, discount, address, "", null);
			
			//Insert order to database
			dao.inserOrder(d, c);
			
			//After insert done forward to pay.jsp
			request.setAttribute("orders", d);
			request.getRequestDispatcher("/pay.jsp").forward(request, response);
		} else {
			request.setAttribute("messeger", "Cart is empty");
			request.getRequestDispatcher("/cart.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String usermail = request.getParameter("usermail");
//		String discount = request.getParameter("discount");
//		String address = request.getParameter("address");
//
//		PrintWriter out = response.getWriter();
//		out.println(usermail + discount + address);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processRequest(request, response);
		} catch (SQLException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
