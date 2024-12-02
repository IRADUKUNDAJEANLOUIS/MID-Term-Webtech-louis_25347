<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Shelf</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: gray;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        .header {
            background-color: black;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .content {
            padding: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            color: black;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #237;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        button:hover {
            background-color: #45a049;
        }
        .back-button {
            background-color: #237;
            color: white;
            border: 1px solid #ccc;
        }
        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Add a New Shelf</h2>
        </div>
        <div class="content">
            <form action="shelfServlet" method="post">
                <label for="bookCategory">Book Category:</label>
                <input type="text" id="bookCategory" name="bookCategory" required>

                <label for="initialStock">Initial Stock:</label>
                <input type="number" id="initialStock" name="initialStock" required>

                <label for="room">Room:</label>
                <select id="room" name="room" required>
                    <%
                        @SuppressWarnings("unchecked")
                        List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                        if (rooms != null && !rooms.isEmpty()) {
                            for (Room room : rooms) {
                    %>
                                <option value="<%= room.getRoomId().toString() %>"><%= room.getRoomCode() %></option>
                    <%
                            }
                        } else {
                    %>
                            <option value="">No rooms available</option>
                    <%
                        }
                    %>
                </select>

                <button type="submit">Add Shelf</button>
                <button onclick="location.href='addBook.jsp'" type="button" class="back-button">Back to Add Book</button>
            </form>
        </div>
    </div>
</body>
</html>
