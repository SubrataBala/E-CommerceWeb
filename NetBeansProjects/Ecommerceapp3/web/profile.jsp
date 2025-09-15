<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Profile - E-Commerce Store</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f8f9fa; }
        .header { background: #333; color: white; padding: 15px; text-align: center; }
        .nav { background: #666; padding: 10px; text-align: center; }
        .nav a { color: white; text-decoration: none; margin: 0 15px; }
        .nav a:hover { text-decoration: underline; }
        .container { max-width: 1000px; margin: 0 auto; padding: 20px; }
        .profile-container { display: grid; grid-template-columns: 1fr 2fr; gap: 30px; }
        .profile-sidebar { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); height: fit-content; }
        .profile-content { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .profile-picture { text-align: center; margin-bottom: 20px; }
        .profile-picture img { width: 100px; height: 100px; border-radius: 50%; object-fit: cover; border: 3px solid #007bff; }
        .sidebar-menu { list-style: none; padding: 0; margin: 0; }
        .sidebar-menu li { margin-bottom: 10px; }
        .sidebar-menu a { display: block; padding: 12px 15px; text-decoration: none; color: #333; border-radius: 5px; transition: background 0.3s; }
        .sidebar-menu a:hover, .sidebar-menu a.active { background: #007bff; color: white; }
        .form-section { margin-bottom: 30px; }
        .form-section h3 { border-bottom: 2px solid #007bff; padding-bottom: 10px; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        .form-group input[readonly] { background: #f8f9fa; }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .btn { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; }
        .btn:hover { background: #0056b3; }
        .btn-secondary { background: #6c757d; }
        .btn-secondary:hover { background: #5a6268; }
        .order-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .order-table th, .order-table td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        .order-table th { background: #f8f9fa; }
        .status-badge { padding: 4px 8px; border-radius: 3px; font-size: 12px; font-weight: bold; }
        .status-pending { background: #ffc107; color: #212529; }
        .status-completed { background: #28a745; color: white; }
        .status-cancelled { background: #dc3545; color: white; }
    </style>
</head>
<body>
    <div class="header">
        <h1>My Profile</h1>
    </div>
    
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="profile.jsp">Profile</a>
        <a href="UserController?action=logout">Logout</a>
    </div>
    
    <div class="container">
        <!-- Check if user is logged in -->
        <% 
        String userName = (String) session.getAttribute("userName");
        if(userName == null) { 
            response.sendRedirect("login.jsp");
            return;
        } %>
        
        <div class="profile-container">
            <!-- Sidebar -->
            <div class="profile-sidebar">
                <div class="profile-picture">
                    <img src="https://via.placeholder.com/100x100" alt="Profile Picture">
                    <h4><%= userName %></h4>
                </div>
                
                <ul class="sidebar-menu">
                    <li><a href="#profile-info" class="active" onclick="showSection('profile-info')">Profile Information</a></li>
                    <li><a href="#order-history" onclick="showSection('order-history')">Order History</a></li>
                    <li><a href="#change-password" onclick="showSection('change-password')">Change Password</a></li>
                    <li><a href="#addresses" onclick="showSection('addresses')">My Addresses</a></li>
                </ul>
            </div>
            
            <!-- Main Content -->
            <div class="profile-content">
                <!-- Profile Information Section -->
                <div id="profile-info" class="content-section">
                    <div class="form-section">
                        <h3>Profile Information</h3>
                        <form action="UserController" method="post">
                            <input type="hidden" name="action" value="updateProfile">
                            
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="firstName">First Name:</label>
                                    <input type="text" id="firstName" name="firstName" value="John">
                                </div>
                                <div class="form-group">
                                    <label for="lastName">Last Name:</label>
                                    <input type="text" id="lastName" name="lastName" value="Doe">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" value="john.doe@email.com" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">Phone Number:</label>
                                <input type="tel" id="phone" name="phone" value="+91 9876543210">
                            </div>
                            
                            <button type="submit" class="btn">Update Profile</button>
                        </form>
                    </div>
                </div>
                
                <!-- Order History Section -->
                <div id="order-history" class="content-section" style="display: none;">
                    <div class="form-section">
                        <h3>Order History</h3>
                        <table class="order-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Date</th>
                                    <th>Items</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#1001</td>
                                    <td>2024-01-15</td>
                                    <td>Gaming Laptop, Smartphone</td>
                                    <td>₹61,998</td>
                                    <td><span class="status-badge status-completed">Delivered</span></td>
                                    <td><a href="OrderController?action=view&id=1001" style="color: #007bff;">View Details</a></td>
                                </tr>
                                <tr>
                                    <td>#1002</td>
                                    <td>2024-01-10</td>
                                    <td>Wireless Headphones</td>
                                    <td>₹2,999</td>
                                    <td><span class="status-badge status-pending">Processing</span></td>
                                    <td><a href="OrderController?action=view&id=1002" style="color: #007bff;">View Details</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <!-- Change Password Section -->
                <div id="change-password" class="content-section" style="display: none;">
                    <div class="form-section">
                        <h3>Change Password</h3>
                        <form action="UserController" method="post">
                            <input type="hidden" name="action" value="changePassword">
                            
                            <div class="form-group">
                                <label for="currentPassword">Current Password:</label>
                                <input type="password" id="currentPassword" name="currentPassword" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="newPassword">New Password:</label>
                                <input type="password" id="newPassword" name="newPassword" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="confirmPassword">Confirm New Password:</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            
                            <button type="submit" class="btn">Change Password</button>
                        </form>
                    </div>
                </div>
                
                <!-- Addresses Section -->
                <div id="addresses" class="content-section" style="display: none;">
                    <div class="form-section">
                        <h3>My Addresses</h3>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                            <span>Saved Addresses</span>
                            <button class="btn" onclick="showAddAddressForm()">Add New Address</button>
                        </div>
                        
                        <!-- Existing Addresses -->
                        <div style="border: 1px solid #ddd; padding: 15px; border-radius: 5px; margin-bottom: 15px;">
                            <h4>Home</h4>
                            <p>123 Main Street<br>
                            Gunupur, Odisha 765022<br>
                            India</p>
                            <button class="btn btn-secondary" style="margin-right: 10px;">Edit</button>
                            <button class="btn" style="background: #dc3545;">Delete</button>
                        </div>
                        
                        <!-- Add Address Form (Initially Hidden) -->
                        <div id="add-address-form" style="display: none; border: 1px solid #ddd; padding: 20px; border-radius: 5px; margin-top: 20px;">
                            <h4>Add New Address</h4>
                            <form action="UserController" method="post">
                                <input type="hidden" name="action" value="addAddress">
                                
                                <div class="form-group">
                                    <label for="addressName">Address Name:</label>
                                    <input type="text" id="addressName" name="addressName" placeholder="e.g., Home, Office">
                                </div>
                                
                                <div class="form-group">
                                    <label for="street">Street Address:</label>
                                    <input type="text" id="street" name="street">
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">City:</label>
                                        <input type="text" id="city" name="city">
                                    </div>
                                    <div class="form-group">
                                        <label for="state">State:</label>
                                        <input type="text" id="state" name="state">
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="pincode">Pin Code:</label>
                                        <input type="text" id="pincode" name="pincode">
                                    </div>
                                    <div class="form-group">
                                        <label for="country">Country:</label>
                                        <input type="text" id="country" name="country" value="India">
                                    </div>
                                </div>
                                
                                <button type="submit" class="btn">Save Address</button>
                                <button type="button" class="btn btn-secondary" onclick="hideAddAddressForm()" style="margin-left: 10px;">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        function showSection(sectionId) {
            // Hide all sections
            var sections = document.querySelectorAll('.content-section');
            sections.forEach(function(section) {
                section.style.display = 'none';
            });
            
            // Show selected section
            document.getElementById(sectionId).style.display = 'block';
            
            // Update active menu item
            var menuItems = document.querySelectorAll('.sidebar-menu a');
            menuItems.forEach(function(item) {
                item.classList.remove('active');
            });
            event.target.classList.add('active');
        }
        
        function showAddAddressForm() {
            document.getElementById('add-address-form').style.display = 'block';
        }
        
        function hideAddAddressForm() {
            document.getElementById('add-address-form').style.display = 'none';
        }
    </script>
</body>
</html>