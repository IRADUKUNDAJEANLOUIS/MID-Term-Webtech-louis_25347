<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Borrow Book</title>
</head>
<body>
    <h2>Borrow Book</h2>
    <form action="borrowBook" method="post">
        <label>User ID:</label>
        <input type="text" name="userId" required><br>

        <label>Book ID:</label>
        <input type="text" name="bookId" required><br>

        <button type="submit">Borrow Book</button>
    </form>
</body>
</html>
