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
            background-color: black;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        button {
            padding: 10px 15px;
            background-color: #237;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 6px;
        }
        button:hover {
            background-color: #45a049;
            
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .styled-link {
    display: inline-block;
    background-color: #237; /* dark blue background */
    color: white; /* White text */
    text-decoration: none; /* Remove underline */
    padding: 10px 15px; /* Add padding */
    border-radius: 6px; /* Rounded corners */
    border: none; /* No border */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth hover effect */
}

.styled-link:hover {
    background-color: #45a049; /* Slightly darker green on hover */
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
                <th>Action</th>
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
                <td>
                    <!-- Delete button for each book -->
                    <input type="radio" name="bookId" value="<%= book.getBookId() %>" /> Select
                </td>
            </tr>
            <%  
                    }
                }
            %>
        </table>
   <div style="margin-top: 20px;">

            <!-- Update Book Details -->
		<a href="updateBooks" class="styled-link">Update Book Details</a>
		
            <!-- Delete Selected Book -->
            <button type="submit" formaction="deleteBookServlet" class="delete-btn">Delete Selected Book</button>
            
        </div>

    </form>
    <!-- Back to Dashboard Button -->
    <button onclick="window.location.href='librarianPage.jsp';">Back to Dashboard</button>


</body>
</html>
