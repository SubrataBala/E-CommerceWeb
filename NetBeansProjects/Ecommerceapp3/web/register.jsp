<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register - E-Commerce Store</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f4f4f4; }
        .header { background: #333; color: white; padding: 15px; text-align: center; }
        .nav { background: #666; padding: 10px; text-align: center; }
        .nav a { color: white; text-decoration: none; margin: 0 15px; }
        .nav a:hover { text-decoration: underline; }
        .register-container { max-width: 500px; margin: 50px auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        .btn { background: #28a745; color: white; padding: 12px 30px; border: none; border-radius: 5px; cursor: pointer; width: 100%; }
        .btn:hover { background: #218838; }
        .error { color: red; margin-top: 10px; }
        .link { text-align: center; margin-top: 20px; }
        .link a { color: #007bff; text-decoration: none; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Create Your Account</h1>
    </div>
    
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>
    
    <div class="register-container">
        <h2 style="text-align: center; margin-bottom: 30px;">Register</h2>
        
        <% if(request.getParameter("error") != null) { %>
            <div class="error">Registration failed! Email might already exist.</div>
        <% } %>
        
        <form action="UserController" method="post">
            <input type="hidden" name="action" value="register">
            
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            
            <button type="submit" class="btn">Register</button>
        </form>
        
        <div class="link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
    
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
            }
        });
    </script>
</body>
</html>