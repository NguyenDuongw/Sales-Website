package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import model.Cart;
import model.Orders;
import model.Product;

public class OrdersDAO {
	private Connection conn;
	private int orderId = 0;
	
	
	public OrdersDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int maxID() throws SQLException {
		String sql = "SELECT MAX(order_id) FROM shoppingdb.orders;";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			int maxId = rs.getInt("MAX(order_id)");
			return maxId;
		}
		
		return 0;
		
	}


	// inser information of Order to data source, that including list of
	// products in cart (c) and information of buyer in Orders o
	public void inserOrder(Orders o, Cart c) throws SQLException {
		// Primary Key use for 2 table
		orderId = maxID() + 1;
		
		/*
		 * Insert into orders table
		 */
		// Get parameter
		String userMail = o.getUserMail();
		int orderStatus = o.getStatus();
		String time = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());  		
		String discountCode = o.getDiscount();
		String orderAdress = o.getAddress();
		
		// Creat Prepare Statement and MySQL code
		String sql = "INSERT INTO shoppingdb.orders VALUES (?, ?, ?, ?, ?, ?);";				
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		//Complete MySQL code
		stmt.setString(1, userMail);
		stmt.setInt(2, orderId);
		stmt.setInt(3, orderStatus);
		stmt.setString(4, time);
		stmt.setString(5, discountCode);
		stmt.setString(6, orderAdress);
		
		//Insert in to order table
		stmt.executeUpdate();
		
		/*
		 * Insert into orders_datail table
		 */
		for (Product p : c.getItems()) {
			// Get parameter
			int productId = p.getId();
			int amountOfProduct = 1;
			int priceProduct = (int)p.getPrice();
			
			// Creat Prepare Statement and MySQL code
			sql = "INSERT INTO shoppingdb.orders_detail VALUES (?, ?, ?, ?);";				
			stmt = conn.prepareStatement(sql);
			
			//Complete MySQL code
			stmt.setInt(1, orderId);
			stmt.setInt(2, productId);
			stmt.setInt(3, amountOfProduct);
			stmt.setInt(4, priceProduct);
			
			//Insert in to order table
			stmt.executeUpdate();
		}
		
		stmt.close();
	}
}
