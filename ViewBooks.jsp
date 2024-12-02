<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Shelf" %>
<%@ page import="java.util.UUID" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f7f7f7;
        }
        h1 {
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
 

        .back-button {
            padding: 10px 15px;
            background-color: #4CAF50;
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
    <h1>Book List</h1>

    <!-- Book List Table -->
    <form method="post" action="deleteBookServlet">
        <table>
            <tr>
                <th>ID</th>
                <th>Edition</th>
                <th>Title</th>
                <th>Publisher Name</th>
                <th>Publication Year</th>
                <th>ISBN Code</th>
                <th>Status</th>
                <th>Shelf Name</th>
            </tr>
            <%
                @SuppressWarnings("unchecked")
                List<model.Book> books = (List<model.Book>) request.getAttribute("books");
                if (books != null) {
                    for (model.Book book : books) {
            %>
            <tr>
                <td><%= book.getBookId() %></td>
                <td><%= book.getEdition() %></td>
                <td><%= book.getTitle() %></td>
                <td><%= book.getPub_name() %></td>
                <td><%= book.getPub_year() != null ? book.getPub_year().toString() : "N/A" %></td>
                <td><%= book.getIsbn_code() %></td>
                <td><%= book.getBookStatus() != null ? book.getBookStatus().name() : "N/A" %></td>
                <td><%= book.getShelf() != null ? book.getShelf().getBookCategory(): "N/A" %></td>
                
            </tr>
            <%  
                    }
                }
            %>
        </table>
        
        
    </form>
  <!-- Back to Dashboard Button -->
    <a href="management.jsp" class="back-button">Back</a>

</body>
</html>
