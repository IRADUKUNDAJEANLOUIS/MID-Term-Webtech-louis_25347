<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Return Book</title>
</head>
<body>
    <h2>Return Book</h2>
    <form action="returnBook" method="post">
        <label>Borrow ID:</label>
        <input type="text" name="borrowId" required><br>

        <button type="submit">Return Book</button>
    </form>
</body>
</html>
