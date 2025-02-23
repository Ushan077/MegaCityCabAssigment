<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Generate Bill</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  
  <style>
    /* Global Styles */
    body {
      background-color: #f8f9fa;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    /* Top Navbar Styles */
    .navbar {
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .navbar-brand { font-weight: bold; font-size: 1.5rem; }
    .navbar-nav .nav-link { font-size: 1.1rem; margin-right: 1rem; }
    
    /* Sidebar Styles */
    #sidebar {
      background-color: #343a40;
      color: #fff;
      min-height: 100vh;
      padding: 1.5rem 1rem;
      transition: background-color 0.3s ease;
    }
    #sidebar h5 { border-bottom: 1px solid #495057; padding-bottom: 0.5rem; margin-bottom: 1rem; }
    #sidebar a { color: #fff; text-decoration: none; display: block; padding: 0.5rem; border-radius: 4px; margin-bottom: 0.5rem; transition: background-color 0.3s ease, padding-left 0.3s ease; }
    #sidebar a:hover { background-color: #495057; padding-left: 10px; }
    
    /* Content Area */
    .content {
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      margin-top: 20px;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    
    /* Table Styles */
    table { width: 100%; margin-top: 20px; }
    th, td { text-align: center; }
    
    /* Theme Selector Dropdown */
    #themeSelector { width: auto; margin-left: 1rem; }
    
    @media (max-width: 768px) {
      .d-flex { flex-direction: column; }
      #sidebar { min-height: auto; }
      .content { margin: 1rem; }
    }
    
    /* Footer Styles */
    footer {
      background-color: #343a40;
      color: #fff;
      padding: 10px 0;
      margin-top: 20px;
    }
    footer hr {
      border-top: 1px solid #fff;
      margin-bottom: 10px;
    }
    footer p {
      margin: 0;
      text-align: center;
      font-size: 0.9rem;
    }
  </style>
</head>
<body onload="initializePage()">
  
  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-user-tie"></i> Employee Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" 
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ms-auto">
          <a class="nav-link" href="EmployeeHome.jsp"><i class="fas fa-home"></i> Home</a>
          <select id="themeSelector" class="form-select form-select-sm">
            <option value="default">Default</option>
            <option value="dark">Dark Mode</option>
            <option value="night">Night Mode</option>
          </select>
        </div>
      </div>
    </div>
  </nav>
  
  <!-- Main Layout -->
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-2 p-0" id="sidebar">
        <h5><i class="fas fa-bars"></i> Menu</h5>
        <a href="EmployeeHome.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="BillMake.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Exit</a>
      </div>
      
      <!-- Content -->
      <div class="col-md-10">
        <div class="content">
          <h2 class="mb-3"><i class="fas fa-file-invoice-dollar"></i> Generate Bill</h2>
          
          <!-- Booking Table Section -->
          <h4><i class="fas fa-calendar-alt"></i> Available Bookings</h4>
          <p id="bookingCount" class="mb-2"></p>
          <table class="table table-bordered">
            <thead class="table-dark">
              <tr>
                <th>Booking ID</th>
                <th>Booking Date</th>
                <th>Vehicle</th>
                <th>Pickup</th>
                <th>Dropoff</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody id="bookingTableBody">
              <!-- Booking rows will be added dynamically -->
            </tbody>
          </table>
          
          <!-- Bill Form Section -->
          <h4 class="mt-4"><i class="fas fa-info-circle"></i> Billing Details</h4>
          <form action="BillMakeServlet" method="post">
            <!-- Employee Information -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-user"></i> Employee Name:</label>
              <input type="text" class="form-control" id="employeeName" name="employeeName" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-id-badge"></i> Employee ID:</label>
              <input type="text" class="form-control" id="employeeID" name="employeeID" readonly>
            </div>
            <!-- Booking Information -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-hashtag"></i> Booking ID:</label>
              <input type="text" class="form-control" id="bookingID" name="bookingID" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-user-tag"></i> Customer ID:</label>
              <input type="text" class="form-control" id="customerID" name="customerID" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-car"></i> Vehicle:</label>
              <input type="text" class="form-control" id="vehicle" name="vehicle" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-road"></i> Kilometers Driven:</label>
              <input type="number" class="form-control" id="kilometers" name="kilometers" required oninput="calculateTotal()">
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-dollar-sign"></i> Rate per KM:</label>
              <input type="number" class="form-control" id="perKmRate" name="perKmRate" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-calculator"></i> Total Amount:</label>
              <input type="number" class="form-control" id="amount" name="amount" readonly>
            </div>
            
            <button type="submit" class="btn btn-success">
              <i class="fas fa-file-invoice"></i> Generate Bill
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Footer: Web Down Line Bar -->
  <footer class="mt-5">
    <hr>
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
  </footer>
  
  <script>
    // Utility: Get query parameter from URL
    function getQueryParam(name) {
      const urlParams = new URLSearchParams(window.location.search);
      return urlParams.get(name) || "";
    }
    
    // Load employee data and bookings
    function loadEmployeeData() {
      document.getElementById("employeeName").value = sessionStorage.getItem("employeeName") || getQueryParam("name");
      document.getElementById("employeeID").value = sessionStorage.getItem("employeeID") || getQueryParam("id");
      loadBookings();
    }
    
    // loadBookings: Fetch booking details and build the table with a Select button
    function loadBookings() {
      fetch("FetchBookingsServlet")
        .then(response => response.json())
        .then(bookings => {
          console.log("Fetched bookings:", bookings);
          document.getElementById("bookingCount").textContent = "Total Bookings: " + (bookings ? bookings.length : 0);
          const tableBody = document.getElementById("bookingTableBody");
          if (!bookings || bookings.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='6'>No bookings found.</td></tr>";
          } else {
            let html = "";
            bookings.forEach(b => {
              console.log("Booking data:", b);
              html += "<tr>";
              html += "<td>" + (b.bookingId || "N/A") + "</td>";
              html += "<td>" + (b.bookingDate || "N/A") + "</td>";
              html += "<td>" + (b.vehicle || "N/A") + "</td>";
              html += "<td>" + (b.pickupLocation || "N/A") + "</td>";
              html += "<td>" + (b.dropoffLocation || "N/A") + "</td>";
              html += "<td><button class='btn btn-primary btn-sm' onclick='selectBooking(" + b.bookingId + ", " + b.customerId + ", \"" + b.vehicle + "\")'>Select</button></td>";
              html += "</tr>";
            });
            tableBody.innerHTML = html;
          }
        })
        .catch(error => {
          console.error("Error fetching bookings:", error);
          document.getElementById("bookingTableBody").innerHTML = "<tr><td colspan='6'>Error loading bookings.</td></tr>";
        });
    }
    
    // When a booking is selected, auto-fill form fields and fetch the per KM price
    function selectBooking(bookingID, customerID, vehicleId) {
      document.getElementById("bookingID").value = bookingID;
      document.getElementById("customerID").value = customerID;
      document.getElementById("vehicle").value = vehicleId;
      fetchPrice(vehicleId);
    }
    
    function fetchPrice(vehicleId) {
    	  console.log("Fetching price for vehicleId:", vehicleId);
    	  fetch(`http://localhost:8082/MegaCityCabAssignment/FetchPriceServlet?id=${vehicleId}`)
    	    .then(response => {
    	      if (!response.ok) {
    	        throw new Error('Network response was not ok');
    	      }
    	      return response.text();
    	    })
    	    .then(price => {
    	      console.log("Price returned: ", price);
    	      document.getElementById("perKmRate").value = price;
    	      calculateTotal();
    	    })
    	    .catch(error => {
    	      console.error("Error fetching price:", error);
    	    });
    	}

    
    // calculateTotal: Calculate total amount based on kilometers and per KM rate
    function calculateTotal() {
      const km = parseFloat(document.getElementById("kilometers").value) || 0;
      const rate = parseFloat(document.getElementById("perKmRate").value) || 0;
      document.getElementById("amount").value = (km * rate).toFixed(2);
    }
    
    // initializePage: Entry point for loading employee data and bookings
    function initializePage() {
      loadEmployeeData();
    }
    
    document.addEventListener("DOMContentLoaded", function() {
      initializePage();
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
    
    window.onload = loadEmployeeData;
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
