package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ListProductDAO {
	private Connection conn;

	public ListProductDAO(Connection conn) {
		this.conn = conn;
	}

	// return the list of product by product name
	public List<Product> search(String characters) throws SQLException {
		String sql = "SELECT * FROM shoppingdb.products WHERE product_name LIKE ?;";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, "%" + characters + "%");

		ResultSet rs = stmt.executeQuery();

		List<Product> listProduct = new ArrayList<Product>();

		while (rs.next()) {
			int productId = rs.getInt("product_id");
			String productName = rs.getString("product_name");
			String productDes = rs.getString("product_des");
			float productPrice = rs.getFloat("product_price");
			String productimgSource = rs.getString("product_img_source");
			String productType = rs.getString("product_type");
			String productBrand = rs.getString("product_brand");

			Product product = (Product) new Product(productId, productName, productDes, productPrice, productimgSource,
					productType, productBrand);
			listProduct.add(product);
		}

		return listProduct;
	}

	// get the product
	public Product getProduct(String characters) throws SQLException {
		String sql = "SELECT * FROM shoppingdb.products WHERE product_id = ?;";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, characters);

		ResultSet rs = stmt.executeQuery();

		if (rs.next()) {
			int productId = rs.getInt("product_id");
			String productName = rs.getString("product_name");
			String productDes = rs.getString("product_des");
			float productPrice = rs.getFloat("product_price");
			String productimgSource = rs.getString("product_img_source");
			String productType = rs.getString("product_type");
			String productBrand = rs.getString("product_brand");

			Product product = (Product) new Product(productId, productName, productDes, productPrice, productimgSource,
					productType, productBrand);
			
			return product;
		}

		return null;
	}

	// get all the product
	public List<Product> getAllProducts() throws SQLException {
		String sql = "SELECT * FROM shoppingdb.products;";

		PreparedStatement stmt = conn.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery();

		List<Product> listProduct = new ArrayList<Product>();

		while (rs.next()) {
			int productId = rs.getInt("product_id");
			String productName = rs.getString("product_name");
			String productDes = rs.getString("product_des");
			float productPrice = rs.getFloat("product_price");
			String productimgSource = rs.getString("product_img_source");
			String productType = rs.getString("product_type");
			String productBrand = rs.getString("product_brand");

			Product product = (Product) new Product(productId, productName, productDes, productPrice, productimgSource,
					productType, productBrand);
			listProduct.add(product);
		}

		return listProduct;
	}
}
