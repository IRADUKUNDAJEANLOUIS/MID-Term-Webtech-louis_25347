<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Borrow a Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f7f7f7;
        }
        h2 {
            color: #2e8b57;
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
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 6px;
        }
        button:hover {
            background-color: #45a049;
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
    <h2>Borrow a Book</h2>

    <!-- Display success or error message if available -->
    <c:if test="${not empty message}">
        <p style="color: ${message == 'Book borrowed successfully!' ? 'green' : 'red'};">
            ${message}
        </p>
    </c:if>

    <c:choose>
        <c:when test="${not empty availableBooks}">
            <form action="borrowBook" method="post">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Edition</th>
                            <th>Publisher</th>
                            <th>Publication Year</th>
                            <th>ISBN</th>
                            <th>Available Stock</th>
                            <th>Select</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${availableBooks}">
                            <tr>
                                <td>${book.title}</td>
                                <td>${book.edition}</td>
                                <td>${book.pub_name}</td>
                                <td>${book.pub_year}</td>
                                <td>${book.isbn_code}</td>
                                <td>${book.shelf.available_stock}</td>
                                <td>
                                    <input type="radio" name="bookId" value="${book.bookId}" required>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <br>
                <label for="returnDate">Select Planned Return Date:</label>
                <input type="date" name="returnDate" required>

                <br><br>
                <button type="submit">Borrow Selected Book</button>
            </form>
        </c:when>
        <c:otherwise>
            <p>No books are available for borrowing at this time.</p>
        </c:otherwise>
    </c:choose>

    <!-- Back to Dashboard Button -->
    <a href="logout.jsp" class="back-button">logout</a>
</body>
</html>
