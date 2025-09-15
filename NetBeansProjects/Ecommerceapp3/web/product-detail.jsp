<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Detail</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        .header { background: #333; color: white; padding: 15px; text-align: center; }
        .nav { background: #666; padding: 10px; text-align: center; }
        .nav a { color: white; margin: 0 15px; text-decoration: none; }
        .container { max-width: 900px; margin: 0 auto; padding: 20px; }
        .product-detail { display: flex; gap: 20px; }
        .product-detail img { width: 300px; height: 300px; object-fit: contain; border: 1px solid #ddd; padding: 10px; background: #f9f9f9; }
        .price { font-size: 22px; font-weight: bold; color: #e74c3c; margin-top: 10px; }
        .btn { background: #007bff; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; margin-top: 20px; display: inline-block; }
        .btn:hover { background: #0056b3; }
        .btn-cart { background: #28a745; }
        .btn-cart:hover { background: #218838; }
    </style>
</head>
<body>
    <div class="header"><h1>Product Detail</h1></div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>

    <div class="container">
        <%
            ResultSet product = (ResultSet) request.getAttribute("product");
            if(product != null) {
        %>
            <div class="product-detail">
                <div>
                    <img src="images/<%=product.getString("image")%>" alt="<%=product.getString("name")%>">
                </div>
                <div>
                    <h2><%=product.getString("name")%></h2>
                    <p><%=product.getString("description")%></p>
                    <p class="price">₹<%=product.getDouble("price")%></p>
                    <a href="CartController?action=add&productId=<%=product.getInt("id")%>" class="btn btn-cart">Add to Cart</a>
                </div>
            </div>
        <%
            } else {
        %>
            <p>Product not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
