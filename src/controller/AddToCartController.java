package controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dao.ListProductDAO;

/**
 * Servlet implementation class AddToCartController
 */
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 *  Inside just to connect to sever
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
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		// Setup Connection
		response.setContentType("text/html;charset=UTF-8");
		Connection conn = null;
		conn = ds.getConnection();
		
		// Take Parameter from request
		HttpSession session = request.getSession(true);
		String idd = request.getParameter("id");
		String action = request.getParameter("action");
		
		//If action is add
		if (action != null && action.equalsIgnoreCase("add")) {
			//If Cart is Null, create a cart on session
			if (session.getAttribute("cart") == null) {
				session.setAttribute("cart", new Cart());
			}
			
			//Create a new Product and add to Cart, save cart on Session
			int id = Integer.parseInt(idd);
			Product p = new ListProductDAO(conn).getProduct(""+id);
			request.setAttribute("product", p);
			Cart c = (Cart) session.getAttribute("cart");
			c.add(new Product(p.getId(), p.getName(), p.getDescription(), p.getPrice(), p.getSrc(), p.getType(), p.getBrand(), 1));
			
			//Forward to infoProduct.jsp
			request.setAttribute("messeger", "Added to Cart");
			request.getRequestDispatcher("infoProduct.jsp").forward(request, response);
		} else if (action != null && action.equalsIgnoreCase("delete")) {
			//Action is delete
			int id = Integer.parseInt(idd);
			Cart c = (Cart) session.getAttribute("cart");
			c.remove(id);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
