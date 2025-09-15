<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Products - E-Commerce Store</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        .header { background: #333; color: white; padding: 15px; text-align: center; }
        .nav { background: #666; padding: 10px; text-align: center; }
        .nav a { color: white; text-decoration: none; margin: 0 15px; }
        .nav a:hover { text-decoration: underline; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .product-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; margin-top: 30px; }
        .product-card { border: 1px solid #ddd; padding: 15px; text-align: center; border-radius: 8px; background: #fff; transition: transform 0.3s ease, box-shadow 0.3s ease; }
        .product-card:hover { transform: scale(1.07); box-shadow: 0 6px 15px rgba(0,0,0,0.2); }
        .product-card img { width: 100%; height: 200px; object-fit: contain; border-radius: 5px; background: #f9f9f9; padding: 10px; transition: transform 0.3s ease; }
        .product-card:hover img { transform: scale(1.05); }
        .product-card h3 { margin: 15px 0 10px 0; }
        .product-card p { color: #666; margin: 5px 0; }
        .price { font-size: 18px; font-weight: bold; color: #e74c3c; }
        .btn { background: #007bff; color: white; padding: 8px 16px; text-decoration: none; border-radius: 5px; margin: 5px; display: inline-block; }
        .btn:hover { background: #0056b3; }
        .btn-cart { background: #28a745; }
        .btn-cart:hover { background: #218838; }
    </style>
</head>
<body>
    <div class="header"><h1>Our Products</h1></div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>

    <div class="container">
        <h2>All Products</h2>
        <div class="product-grid">
            <%
                Connection conn = null;
                try {
                    conn = DBConnection.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                    while(rs.next()) {
            %>
                        <div class="product-card">
                            <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("name")%>">
                            <h3><%=rs.getString("name")%></h3>
                            <p><%=rs.getString("description")%></p>
                            <p class="price">₹<%=rs.getDouble("price")%></p>
                            <a href="ProductController?action=view&id=<%=rs.getInt("id")%>" class="btn">View Details</a>
                            <a href="CartController?action=add&productId=<%=rs.getInt("id")%>" class="btn btn-cart">Add to Cart</a>
                        </div>
            <%
                    }
                    rs.close();
                    stmt.close();
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    DBConnection.closeConnection(conn);
                }
            %>
        </div>
    </div>
</body>
</html>
