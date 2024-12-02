<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow a Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color:#fff;
            color: #333;
        }
        .container {
            margin-left: 60px; /* Adjust for collapsed sidebar width */
            padding: 20px;
            transition: margin-left 0.3s ease;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 80px;
            height: 100%;
            background-color: gray;
            color: white;
            display: flex;          
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            overflow: hidden;
            transition: width 0.3s ease;
        }
        .sidebar.expanded {
            width: 200px;
        }
        .sidebar h2 {
            color: white;
            margin-bottom: 20px;
            font-size: 16px;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .sidebar.expanded h2 {
            opacity: 1;
        }
        .sidebar button {
            padding: 10px 15px;
            margin: 10px 0;
            width: 100%;
            background-color: #237;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
            transition: background-color 0.3s ease, font-size 0.3s ease;
        }
        .sidebar button:hover {
            background-color: #45a049;
            font-size: 16px;
        }
        .logout-btn {
            background-color: #237;
        }
        .logout-btn:hover {
            background-color: #e53935;
        }
        .toggle-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 30px;
            height: 30px;
            background-color: #237;
            color: white;
            border: none;
            border-radius: 50%;
            font-size: 16px;
            cursor: pointer;
            z-index: 1000;
        }
        .toggle-btn:hover {
            background-color: #45a049;
        }
        h1 {
            color: white;
           background-color: black;
        }
        .error {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <h2>Menu</h2>
        <!-- Borrow Book Button -->
        <form action="checkMembershipStatus" method="post">
            <button type="submit" name="action" value="borrowBook">Borrow a Book</button>
        </form>

        <!-- Display Provinces Button -->
        <button onclick="window.location.href='provinceName.jsp';">Display Province</button>

        <!-- Logout Button -->
        <form action="logout.jsp" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <!-- Toggle Button -->
    <button class="toggle-btn" id="toggleBtn">&#9776;</button>
   
    <!-- Main Content -->
    <div class="container" id="mainContainer">
        <h1>Welcome to the Borrow Book Section</h1>

        <%-- Show error message if there is an error --%>
        <p class="error">
            <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
        </p>
    </div>

    <script>
        const sidebar = document.getElementById('sidebar');
        const toggleBtn = document.getElementById('toggleBtn');
        const mainContainer = document.getElementById('mainContainer');

        toggleBtn.addEventListener('click', () => {
            sidebar.classList.toggle('expanded');
            mainContainer.style.marginLeft = sidebar.classList.contains('expanded') ? '200px' : '60px';
        });
    </script>

</body>
</html>
