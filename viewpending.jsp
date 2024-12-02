<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Membership" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Memberships</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: gray;
            padding: 20px;
        }
        h1 {
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #777773;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        button {
            background-color: gray;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-right: 10px;
        }
        button:hover {
            background-color: #3cb371;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        form {
            display: inline;
        }
        .add-book-form {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <h1>Pending Memberships</h1>
    <table>
        <thead>
            <tr>
                <th>Membership ID</th>
                <th>User</th>
                <th>Membership Type</th>
                <th>Registration Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="membership" items="${pendingMemberships}">
                <tr>
                    <td>${membership.membershipId}</td>
                    <td>${membership.reader.firstName} ${membership.reader.lastName}</td>
                    <td>${membership.membershipType.membershipName}</td>
                    <td>${membership.reg_date}</td>
                    <td>
                        <form method="post" action="viewPendingMemberships">
                            <input type="hidden" name="id" value="${membership.membershipId}" />
                            <div class="action-buttons">
                                <button type="submit" name="action" value="approve">Approve</button>
                                <button type="submit" name="action" value="decline">Decline</button>
                            </div>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Add a New Book Button -->
    <form action="addBook.jsp" method="get" class="add-book-form">
        <button type="submit">Add a New Book</button>
    </form>    
</body>
</html>
