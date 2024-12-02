<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Pending and Overdue Borrowings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: gray;
        }
        h1 {
            color: white;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .back-button {
            padding: 10px 15px;
            background-color: #2196F3;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .back-button:hover {
            background-color: #0b7dda;
        }
    </style>
</head>
<body>
    <h1>Pending and Overdue Borrowings</h1>
    
    <c:if test="${not empty borrowers}">
        <table border="1">
            <thead>
                <tr>
                    <th>Book Title</th>
                    <th>User</th>
                    <th>Role</th>
                    <th>Pick Up Date</th>
                    <th>Return Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="borrower" items="${borrowers}">
                    <tr>
                        <td>${borrower.book.title}</td>
                        <td>${borrower.reader.firstName} ${borrower.reader.lastName}</td>
                        <td>${borrower.reader.role}</td>
                        <td><fmt:formatDate value="${borrower.pickup_date}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${borrower.dueDate}" pattern="yyyy-MM-dd" /></td>
                        <td>
                            <a href="returnBook?id=${borrower.id}">Return</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    
    <c:if test="${empty borrowers}">
        <p>No borrowings found.</p>
    </c:if>

    <!-- Back to Dashboard Button -->
    <a href="librarianPage.jsp" class="back-button">Back to Dashboard</a>
</body>
</html>
