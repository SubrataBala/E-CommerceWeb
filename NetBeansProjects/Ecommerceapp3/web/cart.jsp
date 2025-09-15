<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        .header { background: #333; color: white; padding: 15px; text-align: center; }
        .nav { background: #666; padding: 10px; text-align: center; }
        .nav a { color: white; margin: 0 15px; text-decoration: none; }
        .container { max-width: 1000px; margin: 0 auto; padding: 20px; }
        .cart-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .cart-table th, .cart-table td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        .cart-table th { background: #f8f9fa; font-weight: bold; }
        .cart-item img { width: 80px; height: 80px; object-fit: cover; }
        .quantity-controls { display: flex; align-items: center; gap: 10px; }
        .quantity-controls button { background: #007bff; color: white; border: none; padding: 5px 10px; cursor: pointer; border-radius: 3px; }
        .remove-btn { background: #dc3545; color: white; border: none; padding: 8px 12px; cursor: pointer; border-radius: 3px; }
        .remove-btn:hover { background: #c82333; }
        .cart-summary { background: #f8f9fa; padding: 20px; margin-top: 20px; border-radius: 5px; }
        .total-price { font-size: 24px; font-weight: bold; color: #e74c3c; }
    </style>
</head>
<body>
    <div class="header"><h1>Shopping Cart</h1></div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>

    <div class="container">
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th><th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    double subtotal = 0;
                    try {
                        conn = DBConnection.getConnection();
                        String sql = "SELECT c.product_id, c.quantity, p.name, p.price, p.image " +
                                     "FROM cart c JOIN products p ON c.product_id = p.id";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);

                        while(rs.next()) {
                            int pid = rs.getInt("product_id");
                            int qty = rs.getInt("quantity");
                            double price = rs.getDouble("price");
                            double total = qty * price;
                            subtotal += total;
                %>
                            <tr class="cart-item">
                                <td><img src="images/<%=rs.getString("image")%>" alt=""></td>
                                <td><%=rs.getString("name")%></td>
                                <td>₹<%=price%></td>
                                <td>
                                    <div class="quantity-controls">
                                        <form action="CartController" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="updateQuantity">
                                            <input type="hidden" name="productId" value="<%=pid%>">
                                            <input type="hidden" name="change" value="-1">
                                            <button type="submit">-</button>
                                        </form>
                                        <%=qty%>
                                        <form action="CartController" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="updateQuantity">
                                            <input type="hidden" name="productId" value="<%=pid%>">
                                            <input type="hidden" name="change" value="1">
                                            <button type="submit">+</button>
                                        </form>
                                    </div>
                                </td>
                                <td>₹<%=total%></td>
                                <td>
                                    <form action="CartController" method="post">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="productId" value="<%=pid%>">
                                        <button type="submit" class="remove-btn">Remove</button>
                                    </form>
                                </td>
                            </tr>
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
            </tbody>
        </table>

        <div class="cart-summary">
            <h3>Cart Summary</h3>
            <p class="total-price">Total: ₹<%=subtotal%></p>
            <a href="checkout.jsp">Proceed to Checkout</a>
        </div>
    </div>
</body>
</html>
