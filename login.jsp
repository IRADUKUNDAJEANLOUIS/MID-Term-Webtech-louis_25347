<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | AUCA Library Management System</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        /* Full-page background image */
        body {
            font-family: Arial, sans-serif;
            background: url('images/lib5.jpg') no-repeat center center/cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
        }
        /* Container for login form */
        .container {
            width: 90%;
            max-width: 450px;
            background: rgba(0, 102, 204, 0.2); /* Blue overlay */
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6);
            text-align: center;
            position: relative;
            animation: fadeIn 1s ease-in-out;
            
        }
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        /* Title Styling */
        .container h2 {
            font-size: 2rem;
            color: #ffffff;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        /* Form Styling */
        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }
        .form-group label {
            font-size: 1rem;
            font-weight: bold;
            color: white; /* Green */
        }
        .form-group input {
            width: 100%;
            padding: 0.75rem;
            font-size: 1rem;
            border: none;
            border-radius: 8px;
            outline: none;
            color: #333;
        }
        .form-group input::placeholder {
            color: #999;
        }
        /* Button Styles */
        .btn {
            width: 100%;
            padding: 0.8rem;
            font-size: 1.1rem;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease;
        }
        .btn-login {
            background: #00cc99; /* Green */
            color: #fff;
        }
        .btn-login:hover {
            background: #00b386;
            transform: scale(1.05);
        }
        .btn-register {
            background: #ffffff; /* White */
            color: #0066cc; /* Blue */
            margin-top: 1rem;
        }
        .btn-register:hover {
            background: #e6f7ff;
            transform: scale(1.05);
        }
        /* Error Message */
        .error-message {
            background: #ff4d4f;
            color: #fff;
            padding: 0.5rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome Back!</h2>
        
        <!-- Display error message if login failed -->
        <%
            String errorMessage = request.getParameter("error");
            if (errorMessage != null && errorMessage.equals("invalid")) {
        %>
            <div class="error-message">Incorrect username or password. Please try again.</div>
        <% } %>
        
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-login">Login</button>
        </form>
        
        <!-- Button to navigate to register page -->
        <form action="initializeMemberships" method="get">
            <button type="submit" class="btn btn-register">Register</button>
        </form>
    </div>
</body>
</html>
