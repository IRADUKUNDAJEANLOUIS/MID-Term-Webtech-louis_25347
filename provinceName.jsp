<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Province by Phone Number</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #2e8b57;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            margin-top: 20px;
            padding: 12px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .output {
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Search Province</h1>
        <!-- Form to send phone number to servlet -->
        <form action="s	earchProvince" method="post">
            <label for="phoneNumber">Enter Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" required>

            <button type="submit">Search Province</button>
        </form>

        <!-- Display province name if retrieved -->
        <div class="output">
            <%
                String province = request.getAttribute("provinceName") != null 
                                  ? (String) request.getAttribute("provinceName") 
                                  : "";
                if (!province.isEmpty()) {
                    out.print("Province: " + province);
                }
            %>
        </div>
    </div>
</body>
</html>
