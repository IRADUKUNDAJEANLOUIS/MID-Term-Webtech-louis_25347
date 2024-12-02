<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Librarian Dashboard</title>
    <style>
        /* Global Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
             background: url('images/Library.jpg') no-repeat center center fixed; /* Add the background image */
    background-size: cover; /* Ensure the image covers the entire background */
            color: #333;
        }
        body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.2); /* White overlay with 80% opacity */
    z-index: -1; /* Send the overlay behind all content */
    font-style: "font-family";
}
        a {
            text-decoration: none;
            color: inherit;
        }

        /* Sidebar Styling */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #777777; /* gray */
            padding-top: 30px;
            color: white;
            box-sizing: border-box;
            transition: width 0.3s ease;
        }
        .sidebar:hover {
            width: 270px; /* Slightly increase size on hover */
        }
        .sidebar h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 30px;
        }
        .sidebar a {
            display: block;
            padding: 15px;
            font-size: 18px;
            margin-bottom: 15px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .sidebar a:hover {
            background-color: #777777; /* Lighter green on hover */
        }
        .sidebar button {
            width: 100%;
            padding: 15px;
            background-color: #ff6347; /* Tomato red */
            color: white;
            font-size: 18px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            margin-top: 30px;
        }
        .sidebar button:hover {
            background-color: #ff4500; /* Darker red on hover */
        }

        /* Content Styling */
        .content {
            margin-left: 250px;
            padding: 30px;
            box-sizing: border-box;
        }
        h1 {
            color: #2e8b57;
            font-size: 32px;
            margin-bottom: 15px;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .sidebar a {
                font-size: 16px;
                padding: 12px;
            }
            .content {
                margin-left: 0;
                padding: 15px;
            }
            h1 {
                font-size: 28px;
            }
            .sidebar button {
                font-size: 16px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <h2>Librarian Dashboard</h2>
        <a href="viewPendingMemberships">View Pending Memberships</a>
        <a href="DisplayAllBorrowers">View Borrowings</a>
        <a href="addBook.jsp">Add New Books</a>
        <a href="loadBooks">Update or Delete a Book</a>
        <button onclick="window.location.href='logout.jsp';">Log Out</button>
    </div>

    <!-- Content Area -->
    <div class="content">
        <h1>Welcome, Librarian!</h1>
        <p>Here you can manage library records, view pending memberships, and handle book borrowings. Select an option from the sidebar to get started.</p>
    </div>

</body>
</html>
