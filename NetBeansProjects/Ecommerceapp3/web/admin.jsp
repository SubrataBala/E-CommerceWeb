<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard - E-Commerce Store</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #e9ecef;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            min-height: 100vh;
        }
        .header {
            background: #dc3545;
            color: white;
            padding: 20px;
            text-align: center;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 10;
        }
        .nav {
            background: #c82333;
            padding: 10px;
            text-align: center;
            width: 100%;
            margin-bottom: 20px;
        }
        .nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 8px 20px;
            transition: background 0.3s, color 0.3s;
        }
        .nav a:hover {
            background: #a71d2a;
            color: #fff;
            border-radius: 20px;
        }
        .card-container {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 550px;
            padding: 25px;
            margin-top: 20px;
            margin-bottom: 40px; /* Add margin to the bottom */
        }
        .capsule-form {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 30px;
            padding: 20px;
            margin-bottom: 25px;
            transition: transform 0.2s;
        }
        .capsule-form:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #343a40;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus {
            border-color: #dc3545;
            outline: none;
        }
        .btn {
            background: #dc3545;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background 0.3s, transform 0.2s;
        }
        .btn:hover {
            background: #c82333;
            transform: scale(1.02);
        }
        .error {
            color: #721c24;
            text-align: center;
            margin-bottom: 15px;
            padding: 10px;
            background: #f8d7da;
            border-radius: 8px;
            font-weight: 500;
        }
        h2, h3 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Admin Dashboard</h1>
        </div>
        <div class="nav">
            <a href="index.jsp">Back to Store</a>
            <a href="AdminController?action=logout">Logout</a>
        </div>
        <div class="card-container">
            <%
                String adminUser = (String) session.getAttribute("adminUser");
                if (adminUser == null) {
            %>
                <h2>Admin Login</h2>
                <% if (request.getParameter("error") != null) { %>
                    <div class="error">Invalid username or password!</div>
                <% } %>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="login">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn">Login</button>
                    </form>
                </div>
            <% } else { %>
                <h2>Welcome, <%= adminUser %>!</h2>
                <h3>Add Product</h3>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="addProduct">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="text" id="price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" id="description" name="description" required>
                        </div>
                        <div class="form-group">
                            <label for="stock">Stock:</label>
                            <input type="text" id="stock" name="stock" required>
                        </div>
                        <button type="submit" class="btn">Add Product</button>
                    </form>
                </div>

                <h3>Edit Product</h3>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="updateProduct">
                        <div class="form-group">
                            <label for="productId">Product ID:</label>
                            <input type="text" id="productId" name="productId" required>
                        </div>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="text" id="price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" id="description" name="description" required>
                        </div>
                        <div class="form-group">
                            <label for="stock">Stock:</label>
                            <input type="text" id="stock" name="stock" required>
                        </div>
                        <button type="submit" class="btn">Update Product</button>
                    </form>
                </div>

                <h3>Delete Product</h3>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="deleteProduct">
                        <div class="form-group">
                            <label for="productId">Product ID:</label>
                            <input type="text" id="productId" name="productId" required>
                        </div>
                        <button type="submit" class="btn">Delete Product</button>
                    </form>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>