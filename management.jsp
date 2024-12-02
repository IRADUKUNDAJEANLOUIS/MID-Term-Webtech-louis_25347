<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Management Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: gray;
        }
        .sidebar {
            width: 200px;
            height: 100vh;
            background-color: #237;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
        }
        .sidebar h2 {
            color: white;
            margin-bottom: 20px;
            font-size: 18px;
            text-align: center;
        }
        .sidebar a, .sidebar button {
            padding: 12px 20px;
            margin: 10px 0;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            text-align: center;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease, font-size 0.3s ease;
            width: 80%;
        }
        .sidebar a:hover, .sidebar button:hover {
            background-color: #45a049;
            font-size: 16px;
        }
        .logout-btn {
            background-color: #237;
        }
        .logout-btn:hover {
            background-color: #e53935;
        }
        .container {
            margin-left: 200px;
            padding: 20px;
            flex-grow: 1;
        }
        h1 {
            color: white;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Navigation</h2>
        <!-- View Book List Link -->
        <a href="loadBooks">View Book List</a>

        <!-- Display Provinces Button -->
        <button onclick="window.location.href='provinceName.jsp';">Display Province</button>

        <!-- Logout Button -->
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h1>Welcome, Management!</h1>
        <p>Access management functionalities.</p>
    </div>
</body>
</html>