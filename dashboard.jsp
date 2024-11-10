<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    
    <ul>
        <li><a href="register.jsp">Register User</a></li>
        <li><a href="borrowBook.jsp">Borrow Book</a></li>
        <li><a href="returnBook.jsp">Return Book</a></li>
        <li><a href="locations.jsp">Create Location</a></li>
    </ul>
</body>
</html>
