<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Shelf" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: gray;
        }
        h2 {
            color: white;
            margin-bottom: 30px;
        }
        .button-link {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #237;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 10px;
        }
        .button-link:hover {
            background-color: #45a049;
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
        label {
            display: inline-block;
            margin-top: 10px;
            font-weight: bold;
        }
        input, select {
            margin-bottom: 15px;
            padding: 8px;
            width: 100%;
            max-width: 400px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="date"] {
            width: 200px;
        }
        form {
            color: white;
            background-color: #035;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <h2>Add a New Book</h2>

    <!-- Navigation Buttons -->
    <div>
        <button onclick="location.href='addRoom.jsp'" type="button">Add New Room</button>
        <button onclick="location.href='loadRooms'" type="button">Add New Shelf</button>
        <a href="loadBooks" class="button-link">View Book List</a>
            <!-- Back to Dashboard Button -->
    <button onclick="window.location.href='librarianPage.jsp';">Back to Dashboard</button>
    </div>

    <div class="form-container">
        <form action="BookServlet" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required><br>
            
            <label for="edition">Edition:</label>
            <input type="number" id="edition" name="edition" required><br>
            
            <label for="pub_name">Publisher Name:</label>
            <input type="text" id="pub_name" name="pub_name" required><br>
            
            <label for="pub_year">Publication Year:</label>
            <input type="date" id="pub_year" name="pub_year" required><br>
            
            <label for="isbn_code">ISBN Code:</label>
            <input type="text" id="isbn_code" name="isbn_code" required><br>
            
            <label for="bookStatus">Book Status:</label>
            <select id="bookStatus" name="bookStatus" required>
                <option value="AVAILABLE">Available</option>
                <option value="BORROWED">Borrowed</option>
                <option value="RECEIVED">Received</option> 
            </select><br>
            
            <label for="shelf_id">Shelf:</label>
            <select id="shelf_id" name="shelf_id" required>
                <%
                    @SuppressWarnings("unchecked")
                    List<Shelf> shelves = (List<Shelf>) request.getAttribute("shelves");
                    if (shelves != null && !shelves.isEmpty()) {
                        for (Shelf shelf : shelves) {
                %>
                    <option value="<%= shelf.getShelfId().toString() %>"><%= shelf.getBookCategory() %></option>
                <%
                        }
                    } else {
                %>
                    <option value="" disabled>No shelves available</option>
                <%
                    }
                %>
            </select><br>
            
            <button type="submit" <% if(shelves == null || shelves.isEmpty()) { %> disabled <% } %>>Add Book</button>
        </form>
    </div>


</body>
</html>
