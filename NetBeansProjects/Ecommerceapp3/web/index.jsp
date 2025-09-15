<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Commerce Store</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .header { background: #333; color: white; padding: 15px; text-align: center; }
        .nav { background: #666; padding: 12px; text-align: center; }
        .nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        .nav a:hover { text-decoration: underline; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        h2 { text-align: center; margin-bottom: 20px; }
        
        .product-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); 
            gap: 20px; 
        }
        .product-card { 
            border: 1px solid #ddd; 
            border-radius: 8px; 
            padding: 15px; 
            text-align: center; 
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            background: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product-card:hover {
            transform: scale(1.07); /* zoom effect */
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }
        .product-card img { 
            width: 100%; 
            height: 250px; 
            object-fit: contain; 
            border-radius: 8px; 
            background: #f9f9f9; 
            padding: 10px;
            transition: transform 0.3s ease;
        }
        .product-card:hover img {
            transform: scale(1.05); /* image zoom too */
        }
        .price { font-size: 18px; font-weight: bold; margin: 10px 0; }
        .btn { 
            display: inline-block; 
            background: #007bff; 
            color: white; 
            padding: 10px 20px; 
            text-decoration: none; 
            border-radius: 5px; 
            font-weight: bold; 
        }
        .btn:hover { background: #0056b3; }
        .view-all { text-align: center; margin-top: 30px; }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Welcome to Our Store</h1>
    </div>

    <!-- Navigation Bar -->
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Featured Products</h2>
        
        <div class="product-grid">
            <!-- Product 1: Smartphone -->
<div class="product-card">
    <img src="images/phone.jpeg" alt="Smartphone">
    <h3>Sample Product 1</h3>
    <p class="price">₹15999</p> <!-- Updated to DB price -->
    <a href="ProductController?action=view&id=2" class="btn">View Details</a>
</div>

<!-- Product 2: Laptop -->
<div class="product-card">
    <img src="images/laptop.jpeg" alt="Laptop">
    <h3>Sample Product 2</h3>
    <p class="price">₹45999</p> <!-- Updated to DB price -->
    <a href="ProductController?action=view&id=1" class="btn">View Details</a>
</div>

            <!-- Product 3 -->
            <div class="product-card">
                <img src="images/headphones.jpeg" alt="Headphones">
                <h3>Sample Product 3</h3>
                <p class="price">₹2799</p>
                <a href="ProductController?action=view&id=3" class="btn">View Details</a>
            </div>
        </div>

        <!-- View All Products -->
        <div class="view-all">
            <a href="products.jsp" class="btn">View All Products</a>
        </div>
    </div>

</body>
</html>
