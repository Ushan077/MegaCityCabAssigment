<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Employee Home</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

  <style>
    /* Global Styles */
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    
    /* Navbar Styles */
    .navbar {
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .navbar-brand {
      font-weight: bold;
      font-size: 1.5rem;
    }
    .navbar-nav .nav-link {
      font-size: 1.1rem;
      margin-right: 1rem;
    }
    
    /* Sidebar Styles */
    #sidebar {
      width: 220px;
      background-color: #343a40;
      min-height: 100vh;
      color: #fff;
      padding: 1.5rem 1rem;
      transition: background-color 0.3s ease;
    }
    #sidebar h5 {
      border-bottom: 1px solid #495057;
      padding-bottom: 0.5rem;
      margin-bottom: 1rem;
    }
    #sidebar a {
      color: #fff;
      text-decoration: none;
      display: block;
      padding: 0.5rem;
      border-radius: 4px;
      margin-bottom: 0.5rem;
      transition: background-color 0.3s ease, padding-left 0.3s ease;
    }
    #sidebar a:hover {
      background-color: #495057;
      padding-left: 10px;
    }
    
    /* Content Area */
    .content {
      margin: 2rem;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    
    /* Card Styles */
    .card {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      margin-bottom: 1.5rem;
      border: none;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    .card h4 {
      border-bottom: 2px solid #007bff;
      padding-bottom: 0.5rem;
      margin-bottom: 1rem;
    }
    .card p {
      font-size: 1.1rem;
    }
    
    /* Button Styles */
    .btn-primary {
      background-color: #007bff;
      border: none;
      transition: background-color 0.3s ease;
    }
    .btn-primary:hover {
      background-color: #0056b3;
    }
    
    /* Generate Bill Button (extra emphasis) */
    #goToBillPage {
      font-size: 1.1rem;
      padding: 0.75rem 1.5rem;
      margin-top: 1rem;
      border-radius: 5px;
      transition: transform 0.2s ease;
    }
    #goToBillPage:hover {
      transform: scale(1.05);
    }
    
    /* Theme Selector Dropdown */
    #themeSelector {
      width: auto;
      margin-left: 1rem;
    }
    
    /* Responsive adjustments for sidebar */
    @media (max-width: 768px) {
      #sidebar {
        width: 100%;
        min-height: auto;
        padding: 1rem;
      }
      .d-flex {
        flex-direction: column;
      }
      .content {
        margin: 1rem;
      }
    }
    
    /* Dark Mode Overrides */
    .dark-mode {
      background-color: #343a40 !important;
      color: #f8f9fa !important;
    }
    .dark-mode .navbar {
      background-color: #495057 !important;
    }
    .dark-mode #sidebar {
      background-color: #495057 !important;
    }
    .dark-mode .card {
      background-color: #3a3a3a !important;
      color: #f8f9fa !important;
    }
    
    /* Night Mode Overrides */
    .night-mode {
      background-color: #121212 !important;
      color: #e0e0e0 !important;
    }
    .night-mode .navbar {
      background-color: #1c1c1c !important;
    }
    .night-mode #sidebar {
      background-color: #1c1c1c !important;
    }
    .night-mode .card {
      background-color: #1f1f1f !important;
      color: #e0e0e0 !important;
    }
  </style>
</head>
<body onload="loadUserData(); loadBookings();">

  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <i class="fas fa-user-tie"></i> Employee Dashboard
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" 
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav ms-auto">
          <a class="nav-link" href="EmployeeHome.html">
            <i class="fas fa-home"></i> Home
          </a>
          <!-- Theme Selector Dropdown -->
          <select id="themeSelector" class="form-select form-select-sm">
            <option value="default">Default</option>
            <option value="dark">Dark Mode</option>
            <option value="night">Night Mode</option>
          </select>
        </div>
      </div>
    </div>
  </nav>

  <!-- Main Content with Sidebar -->
  <div class="d-flex">
    <!-- Sidebar Navigation -->
    <div id="sidebar">
      <h5>Menu</h5>
      <a href="EmployeeHome.jsp">
        <i class="fas fa-tachometer-alt"></i> Dashboard
      </a>
      <a href="BillMake.jsp">
        <i class="fas fa-calendar-check"></i> Manage Bookings
      </a>
      <a href="LogoutServlet">
        <i class="fas fa-sign-out-alt"></i> Exit
      </a>
    </div>

    <!-- Content Area -->
    <div class="content flex-grow-1">
      <!-- User Information Card -->
      <div class="card p-3">
        <h4>
          <i class="fas fa-info-circle"></i> User Information
        </h4>
        <p>
          <strong><i class="fas fa-user"></i> Name:</strong> 
          <span id="userName">N/A</span>
        </p>
        <p>
          <strong><i class="fas fa-id-card"></i> ID:</strong> 
          <span id="userID">N/A</span>
        </p>
      </div>

      <!-- Pending Bookings Card -->
      <div class="card p-3">
        <h4>
          <i class="fas fa-clock"></i> Pending Bookings
        </h4>
        <!-- Display total count of bookings -->
        <p id="bookingCount" class="mb-2">Total Bookings: 0</p>
        <!-- Table for dynamically loaded bookings -->
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Booking ID</th>
                <th>Date</th>
                <th>Vehicle</th>
                <th>Pickup</th>
                <th>Dropoff</th>
              </tr>
            </thead>
            <tbody id="bookingTableBody">
              <tr>
                <td colspan="5">No bookings found.</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Generate Bill Button -->
      <a id="goToBillPage" href="BillMake.jsp?name=N/A&id=N/A" class="btn btn-primary">
        <i class="fas fa-file-invoice"></i> Generate Bill
      </a>
    </div>
  </div>

  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
  <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
  <p style="margin: 0; text-align: center; font-size: 0.9rem;">
    &copy; 2023 MegaCityCab. All rights reserved.
  </p>
  <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
    Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
  </p>
</footer>
  <script>
    // Helper function to get a cookie by name.
    function getCookie(name) {
      const cookieArr = document.cookie.split(';');
      for (let cookie of cookieArr) {
        cookie = cookie.trim();
        if (cookie.startsWith(name + "=")) {
          return decodeURIComponent(cookie.substring(name.length + 1));
        }
      }
      return "";
    }

    // Load user data from cookies and update the UI.
    function loadUserData() {
      const userName = getCookie("name") || "Guest";
      const userID = getCookie("userID") || "N/A";

      document.getElementById("userName").textContent = userName;
      document.getElementById("userID").textContent = userID;

      // Save data to session storage for future use.
      sessionStorage.setItem("employeeName", userName);
      sessionStorage.setItem("employeeID", userID);

      // Correct URL for BillMake page.
      document.getElementById("goToBillPage").href = "BillMake.jsp?name=" + encodeURIComponent(userName) + "&id=" + encodeURIComponent(userID);
    }

    // Fetch booking data from the server and populate the table.
    function loadBookings() {
  fetch("EmployeeFetchBookingsServlet")
    .then(response => response.json())
    .then(bookings => {
      console.log("Fetched bookings:", bookings); // Debug log
      
      // Update booking count display.
      document.getElementById("bookingCount").textContent = "Total Bookings: " + (bookings ? bookings.length : 0);
      
      const tableBody = document.getElementById("bookingTableBody");
      if (!bookings || bookings.length === 0) {
        tableBody.innerHTML = `<tr><td colspan="5">No bookings found.</td></tr>`;
      } else {
        let html = "";
        bookings.forEach(b => {
          console.log("Booking data:", b); // Debug log for each booking
          html += "<tr>";
          html += "<td>" + (b.bookingId || "N/A") + "</td>";
          html += "<td>" + (b.bookingDate || "N/A") + "</td>";
          html += "<td>" + (b.vehicle || "N/A") + "</td>";
          html += "<td>" + (b.pickupLocation || "N/A") + "</td>";
          html += "<td>" + (b.dropoffLocation || "N/A") + "</td>";
          html += "</tr>";
        });
        tableBody.innerHTML = html;
      }
    })
    .catch(error => {
      console.error("Error fetching bookings:", error);
      document.getElementById("bookingTableBody").innerHTML = `<tr><td colspan="5">Error loading bookings.</td></tr>`;
    });
}


    // Initialize the page once the DOM is loaded.
    document.addEventListener("DOMContentLoaded", function() {
      loadUserData();
      loadBookings();
      
      // Theme selector functionality.
      const themeSelector = document.getElementById("themeSelector");
      themeSelector.addEventListener("change", function() {
        document.body.classList.remove("dark-mode", "night-mode");
        if (this.value === "dark") {
          document.body.classList.add("dark-mode");
        } else if (this.value === "night") {
          document.body.classList.add("night-mode");
        }
      });
    });
  </script>

  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>



</body>
</html>
