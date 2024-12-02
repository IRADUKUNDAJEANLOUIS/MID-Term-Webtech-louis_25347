<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        
        color: #333;
       
        background: url('images/auca.jpg') no-repeat center center/cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
    }
    h2 {
        text-align: center;
        color: black; /* black */
        margin-bottom: 30px;
    }
    form {
        max-width: 700px;
        margin: 0 auto;
        color: white;
        background-color: gray; /* White background for form */
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        padding: 30px;
        font-size: 16px;
        opacity:0.8;
       
    }
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: white; /* Blue label color */
    }
    input[type="text"],
    input[type="password"],
    select {
        width: 100%;
        padding: 12px;
        margin-bottom: 18px;
        border: 2px solid #4a90e2; /* Blue border */
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 16px;
        transition: border-color 0.3s ease;
    }
    input[type="text"]:focus,
    input[type="password"]:focus,
    select:focus {
        border-color: #3cb371; /* Green border on focus */
        outline: none;
    }
    input[type="submit"],
    button {
        background-color: #2e8b57; /* Green button */
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover,
    button:hover {
        background-color: #3cb371; /* Lighter green on hover */
    }
    .hidden {
        display: none;
    }
    .location-details {
        margin-top: 30px;
        padding: 15px;
        border: 1px solid #2e8b57;
        border-radius: 6px;
        background-color: #e6fffa; /* Light green background */
    }
    .location-details select {
        width: 48%;
        display: inline-block;
        margin-right: 4%;
        margin-bottom: 12px;
    }
    .location-details select:last-child {
        margin-right: 0;
    }
    @media screen and (max-width: 768px) {
        form {
            padding: 20px;
        }
        .location-details select {
            width: 100%;
            margin-right: 0;
            margin-bottom: 15px;
        }
    }
</style>
    
    </style>
    <script>
        // Existing location-based JavaScript functions here
        window.onload = function() {
            fetch('/Webtech_Mid_exam/location/rwandaLocations.json')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log("JSON data loaded:", data);
                    locationData = data.data;
                    populateProvinces();
                })
                .catch(error => {
                    console.error("Error loading JSON file:", error);
                });
                toggleMembership();
            // Initialize membership visibility based on role selection

        };
        function toggleMembership() {
            const roleSelect = document.getElementById("role");
            const membershipDiv = document.getElementById("membershipDiv");

            if (roleSelect.value === "LIBRARIAN" || roleSelect.value === "DEAN" || roleSelect.value === "MANAGER") {

                membershipDiv.style.display = "none";
            } else {
                membershipDiv.style.display = "block";
            }
        }

        function populateProvinces() {
            const provinceDropdown = document.getElementById("province");
            provinceDropdown.innerHTML = '<option value="">Select Province</option>';
            locationData.forEach(provinceObj => {
                let provinceName = Object.keys(provinceObj)[0];  // Get the province name
                let option = document.createElement("option");
                option.text = provinceName;
                option.value = provinceName;
                provinceDropdown.add(option);
            });
        }

        function populateDistricts() {
            const provinceName = document.getElementById("province").value;
            const districtDropdown = document.getElementById("district");
            districtDropdown.innerHTML = '<option value="">Select District</option>';
            districtDropdown.disabled = true;  // Disable in case there's no data

            const provinceObj = locationData.find(p => Object.keys(p)[0] === provinceName);
            
            if (provinceObj && provinceObj[provinceName]) {
                provinceObj[provinceName].forEach(districtObj => {
                    let districtName = Object.keys(districtObj)[0];
                    let option = document.createElement("option");
                    option.text = districtName;
                    option.value = districtName;
                    districtDropdown.add(option);
                });
                districtDropdown.disabled = false;  // Enable if options were added
            } else {
                console.error("No districts found for selected province:", provinceName);
            }

            // Reset and disable the following dropdowns
            resetAndDisable(["sector", "cell", "village"]);
        }

        function populateSectors() {
            const provinceName = document.getElementById("province").value;
            const districtName = document.getElementById("district").value;
            const sectorDropdown = document.getElementById("sector");
            sectorDropdown.innerHTML = '<option value="">Select Sector</option>';
            sectorDropdown.disabled = true;

            const provinceObj = locationData.find(p => Object.keys(p)[0] === provinceName);
            const districtObj = provinceObj[provinceName].find(d => Object.keys(d)[0] === districtName);

            if (districtObj && districtObj[districtName]) {
                districtObj[districtName].forEach(sectorObj => {
                    let sectorName = Object.keys(sectorObj)[0];
                    let option = document.createElement("option");
                    option.text = sectorName;
                    option.value = sectorName;
                    sectorDropdown.add(option);
                });
                sectorDropdown.disabled = false;
            } else {
                console.error("No sectors found for selected district:", districtName);
            }

            resetAndDisable(["cell", "village"]);
        }

        function populateCells() {
            const provinceName = document.getElementById("province").value;
            const districtName = document.getElementById("district").value;
            const sectorName = document.getElementById("sector").value;
            const cellDropdown = document.getElementById("cell");
            cellDropdown.innerHTML = '<option value="">Select Cell</option>';
            cellDropdown.disabled = true;

            // Find the selected province object
            const provinceObj = locationData.find(p => Object.keys(p)[0] === provinceName);
            if (!provinceObj) return;

            // Find the selected district object
            const districtObj = provinceObj[provinceName].find(d => Object.keys(d)[0] === districtName);
            if (!districtObj) return;

            // Find the selected sector object
            const sectorObj = districtObj[districtName].find(s => Object.keys(s)[0] === sectorName);
            if (!sectorObj) return;

            // Populate cells dropdown with options
            if (sectorObj[sectorName]) {
                sectorObj[sectorName].forEach(cell => {
                    let cellName = typeof cell === "object" ? Object.keys(cell)[0] : cell;
                    let option = document.createElement("option");
                    option.text = cellName;
                    option.value = cellName;
                    cellDropdown.add(option);
                });
                cellDropdown.disabled = false;
            } else {
                console.error("No cells found for selected sector:", sectorName);
            }

            resetAndDisable(["village"]);
        }

        function populateVillages() {
            const provinceName = document.getElementById("province").value;
            const districtName = document.getElementById("district").value;
            const sectorName = document.getElementById("sector").value;
            const cellName = document.getElementById("cell").value;
            const villageDropdown = document.getElementById("village");
            villageDropdown.innerHTML = '<option value="">Select Village</option>';
            villageDropdown.disabled = true;

            // Find the selected province object
            const provinceObj = locationData.find(p => Object.keys(p)[0] === provinceName);
            if (!provinceObj) return;

            // Find the selected district object
            const districtObj = provinceObj[provinceName].find(d => Object.keys(d)[0] === districtName);
            if (!districtObj) return;

            // Find the selected sector object
            const sectorObj = districtObj[districtName].find(s => Object.keys(s)[0] === sectorName);
            if (!sectorObj) return;

            // Find the selected cell object
            const cellObj = sectorObj[sectorName].find(c => (typeof c === "object" ? Object.keys(c)[0] : c) === cellName);
            if (!cellObj) return;

            // Populate villages dropdown with options
            if (cellObj[cellName] && Array.isArray(cellObj[cellName])) {
                cellObj[cellName].forEach(village => {
                    let villageName = typeof village === "object" ? Object.keys(village)[0] : village;
                    let option = document.createElement("option");
                    option.text = villageName;
                    option.value = villageName;
                    villageDropdown.add(option);
                });
                villageDropdown.disabled = false;
            } else {
                console.error("No villages found or villages data is not an array for cell:", cellName);
            }
        }



        // Utility function to reset and disable specified dropdowns
        function resetAndDisable(ids) {
            ids.forEach(id => {
                const dropdown = document.getElementById(id);
                dropdown.innerHTML = `<option value="">Select ${id.charAt(0).toUpperCase() + id.slice(1)}</option>`;
                dropdown.disabled = true;
            });
        }

        function validateSelections(event) {
            const province = document.getElementById("province").value;
            const district = document.getElementById("district").value;
            const sector = document.getElementById("sector").value;
            const cell = document.getElementById("cell").value;
            const village = document.getElementById("village").value;

            if (!province || !district || !sector || !cell || !village) {
                alert("Please make a selection in each dropdown.");
                event.preventDefault();  // Prevent form submission if any dropdown is unselected
            }
        }
        
    </script>
</head>
<body>
    <h2>User Registration</h2>
    <form action="register" method="post">
        <label for="firstName">First Name:</label>
        <input type="text" name="firstName" required/><br/>

        <label for="lastName">Last Name:</label>
        <input type="text" name="lastName" required/><br/>

        <label for="gender">Gender:</label>
        <select name="gender" required>
            <option value="MALE">Male</option>
            <option value="FEMALE">Female</option>
            <option value="OTHER">Other</option>
        </select><br/>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" required/><br/>

        <label for="userName">Username:</label>
        <input type="text" name="userName" required/><br/>

        <label for="password">Password:</label>
        <input type="password" name="password" required/><br/>

        <label for="role">Role:</label>
        <select name="role" id="role" onchange="toggleMembership();" required>
            <option value="STUDENT">Student</option>
            <option value="TEACHER">Teacher</option>
            <option value="MANAGER">Manager</option>
            <option value="LIBRARIAN">Librarian</option>
            <option value="DEAN">DEAN</option>
        </select><br/>

<!-- Membership Selection (Visible for non-Librarian roles) -->
<div id="membershipDiv" style="display: none;">
    <label for="membership">Membership:</label>
    <select name="membershipTypeId" id="membership">
        <c:forEach var="membership" items="${membershipTypes}">
            <option value="${membership.membershipTypeId}"> <!-- Use the ID here -->
                ${membership.membershipName}
            </option>
        </c:forEach>
    </select><br/>
</div>

        <h3>Location Details</h3>
        <!-- Cascading dropdowns for locations -->
        <label for="province">Province:</label>
        <select id="province" name="province" onchange="populateDistricts();" required>
            <option value="">Select Province</option>
        </select><br/>

        <label for="district">District:</label>
        <select id="district" name="district" onchange="populateSectors();" required>
            <option value="">Select District</option>
        </select><br/>

        <label for="sector">Sector:</label>
        <select id="sector" name="sector" onchange="populateCells();" required>
            <option value="">Select Sector</option>
        </select><br/>

        <label for="cell">Cell:</label>
        <select id="cell" name="cell" onchange="populateVillages();" required>
            <option value="">Select Cell</option>
        </select><br/>

        <label for="village">Village:</label>
        <select id="village" name="village" required>
            <option value="">Select Village</option>
        </select><br/>

        <input type="submit" value="Register" onclick="validateSelections(event)">
    </form>
    <form action="login.jsp" method="get">
        <button type="submit">login</button>
    </form>
</body>
</html>
