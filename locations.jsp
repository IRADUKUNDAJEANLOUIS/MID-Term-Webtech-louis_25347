<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Location</title>
</head>
<body>
    <h2>Create Location</h2>
    <form action="createLocation" method="post">
        <label>Location Code:</label>
        <input type="text" name="locationCode" required><br>

        <label>Location Name:</label>
        <input type="text" name="locationName" required><br>

        <label>Location Type:</label>
        <select name="locationType">
            <option value="PROVINCE">Province</option>
            <option value="DISTRICT">District</option>
            <option value="SECTOR">Sector</option>
            <option value="CELL">Cell</option>
            <option value="VILLAGE">Village</option>
        </select><br>

        <label>Parent ID (if any):</label>
        <input type="text" name="parentId"><br>

        <button type="submit">Create Location</button>
    </form>
</body>
</html>
    