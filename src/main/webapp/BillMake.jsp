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
    /* Global and component styles – similar to your original CSS */
    body { background-color: #f8f9fa; font-family: 'Roboto', 'Segoe UI', Arial, sans-serif; margin: 0; padding: 0; transition: all 0.3s ease; color: #343a40; line-height: 1.6; }
    .navbar { box-shadow: 0 4px 12px rgba(0,0,0,0.07); background-color: #343a40; padding: 1rem 2rem; }
    .navbar-brand { font-weight: 700; font-size: 1.6rem; letter-spacing: -0.5px; color: #ffffff; }
    .navbar-nav .nav-link { font-size: 1rem; margin-right: 1.5rem; font-weight: 500; position: relative; padding: 0.5rem 0; }
    .navbar-nav .nav-link:after { content: ''; position: absolute; bottom: 0; left: 0; width: 0; height: 2px; background-color: #ffffff; transition: width 0.3s; }
    .navbar-nav .nav-link:hover:after { width: 100%; }
    #sidebar { background-color: #343a40; color: #fff; min-height: 100vh; padding: 2rem 1.5rem; border-right: 1px solid rgba(255,255,255,0.1); }
    #sidebar h5 { border-bottom: 1px solid rgba(255,255,255,0.2); padding-bottom: 0.8rem; margin-bottom: 1.5rem; font-weight: 600; letter-spacing: 0.5px; text-transform: uppercase; font-size: 0.95rem; }
    #sidebar a { color: rgba(255,255,255,0.85); text-decoration: none; display: block; padding: 0.7rem 1rem; border-radius: 6px; margin-bottom: 0.5rem; transition: all 0.2s ease; font-weight: 500; }
    #sidebar a:hover { background-color: rgba(255,255,255,0.1); padding-left: 1.3rem; color: #ffffff; }
    .content { background-color: white; padding: 2rem; border-radius: 12px; box-shadow: 0 5px 25px rgba(0,0,0,0.05); margin-top: 25px; border: 1px solid rgba(0,0,0,0.05); }
    .content h2 { margin-bottom: 1.5rem; font-weight: 600; color: #343a40; border-bottom: 2px solid #f8f9fa; padding-bottom: 0.8rem; }
    table { width: 100%; margin-top: 1.5rem; border-collapse: separate; border-spacing: 0; border-radius: 8px; overflow: hidden; box-shadow: 0 3px 15px rgba(0,0,0,0.03); }
    th { background-color: #f8f9fa; color: #495057; font-weight: 600; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 0.5px; padding: 1rem; border-bottom: 2px solid rgba(0,0,0,0.05); }
    td { padding: 1rem; border-bottom: 1px solid rgba(0,0,0,0.05); }
    tr:hover td { background-color: rgba(0,0,0,0.01); }
    .btn { padding: 0.6rem 1.2rem; border-radius: 6px; font-weight: 500; text-transform: uppercase; font-size: 0.85rem; }
    .btn-primary { background-color: #4a6cf7; border-color: #4a6cf7; }
    .btn-primary:hover { background-color: #3958e2; border-color: #3958e2; transform: translateY(-2px); box-shadow: 0 4px 10px rgba(74, 108, 247, 0.25); }
    footer { background-color: #343a40; color: rgba(255,255,255,0.8); padding: 2rem 0; margin-top: 3rem; text-align: center; font-size: 0.9rem; }
  </style>
</head>
<body onload="initializePage()">
  
  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-user-tie"></i> Employee Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ms-auto">
          <a class="nav-link" href="EmployeeHome.jsp"><i class="fas fa-home"></i> Home</a>
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
      
      <!-- Content Area -->
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
          
          <!-- Billing Details Form -->
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
            <!-- Vehicle Name (read‑only) -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-car"></i> Vehicle:</label>
              <input type="text" class="form-control" id="vehicle" name="vehicle" readonly>
            </div>
            <!-- Kilometers Driven -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-road"></i> Kilometers Driven:</label>
              <input type="number" class="form-control" id="kilometers" name="kilometers" required oninput="calculateTotal()">
            </div>
            <!-- Rate per KM (fetched and/or editable) -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-dollar-sign"></i> Rate per KM:</label>
              <input type="number" class="form-control" id="perKmRate" name="perKmRate">
            </div>
            <!-- Optional: Dropdown to select an alternate vehicle (if needed) -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-car"></i> Select Alternate Vehicle:</label>
              <select class="form-select" id="vehicleDropdown" name="vehicleId">
                <option value="">Select Vehicle</option>
                <!-- Options will be added dynamically -->
              </select>
            </div>
            <!-- Total Amount -->
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
  
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p>Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321</p>
  </footer>
  
  <script>
    // Utility: Get a query parameter from URL
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
    
    // Fetch bookings – assumed structure: bookingId, bookingDate, vehicle, vehicleId, pickupLocation, dropoffLocation, etc.
    function loadBookings() {
      fetch("EmployeeFetchBookingsServlet")
        .then(response => response.json())
        .then(bookings => {
          console.log("Fetched bookings:", bookings);
          document.getElementById("bookingCount").textContent = "Total Bookings: " + (bookings ? bookings.length : 0);
          const tableBody = document.getElementById("bookingTableBody");
          if (!bookings || bookings.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='7'>No bookings found.</td></tr>";
          } else {
            let html = "";
            bookings.forEach(b => {
              html += "<tr>";
              html += "<td>" + (b.bookingId || "N/A") + "</td>";
              html += "<td>" + (b.bookingDate || "N/A") + "</td>";
              html += "<td>" + (b.vehicle || "N/A") + "</td>";
              html += "<td>" + (b.pickupLocation || "N/A") + "</td>";
              html += "<td>" + (b.dropoffLocation || "N/A") + "</td>";
              html += "<td><button class='btn btn-primary btn-sm' onclick='selectBooking(" 
                    + b.bookingId + ", " + b.customerId + ", " + b.vehicleId + ", \"" + b.vehicle + "\")'>Select</button></td>";
              html += "</tr>";
            });
            tableBody.innerHTML = html;
          }
        })
        .catch(error => {
          console.error("Error fetching bookings:", error);
          document.getElementById("bookingTableBody").innerHTML = "<tr><td colspan='7'>Error loading bookings.</td></tr>";
        });
    }
    
    // When a booking is selected, auto-fill the form and fetch the vehicle’s price.
    function selectBooking(bookingID, customerID, vehicleId, vehicleName) {
      document.getElementById("bookingID").value = bookingID;
      document.getElementById("customerID").value = customerID;
      document.getElementById("vehicle").value = vehicleName;
      // Fetch the vehicle's rate using its ID
      fetchVehiclePrice(vehicleId);
    }
    
    // Fetch the vehicle price from the database via a servlet and update the rate field.
    function fetchVehiclePrice(vehicleId) {
      fetch("FetchVehiclePriceServlet?id=" + vehicleId)
        .then(response => response.text())
        .then(price => {
          if (price == null) {
            console.error("Received null price");
            return;
          }
          const trimmedPrice = price.trim();
          const numericPrice = parseFloat(trimmedPrice);
          if (isNaN(numericPrice)) {
            alert("Invalid price received.");
            document.getElementById("perKmRate").value = "";
          } else {
            document.getElementById("perKmRate").value = numericPrice;
          }
          calculateTotal();
        })
        .catch(error => {
          console.error("Error fetching price:", error);
          document.getElementById("perKmRate").value = "";
          calculateTotal();
        });
    }
    
    // Load vehicles for the dropdown (if the user wants to override the fetched rate).
    function loadVehicles() {
      fetch("LoadVehiclesServlet")
        .then(response => response.json())
        .then(vehicles => {
          const dropdown = document.getElementById("vehicleDropdown");
          dropdown.innerHTML = "<option value=''>Select Vehicle</option>";
          vehicles.forEach(vehicle => {
            const option = document.createElement("option");
            option.value = vehicle.id;
            option.text = vehicle.vehicleName + " - $" + vehicle.price;
            option.setAttribute("data-price", vehicle.price);
            dropdown.appendChild(option);
          });
        })
        .catch(error => console.error("Error loading vehicles:", error));
    }
    
    // When a vehicle is selected from the dropdown, update the rate and (optionally) the vehicle name.
    document.getElementById("vehicleDropdown").addEventListener("change", function() {
      const selectedOption = this.options[this.selectedIndex];
      const price = selectedOption.getAttribute("data-price") || 0;
      document.getElementById("perKmRate").value = price;
      // Optionally update the vehicle name based on the dropdown selection:
      const vehicleName = selectedOption.text.split(" - $")[0];
      document.getElementById("vehicle").value = vehicleName;
      calculateTotal();
    });
    
 
    function calculateTotal() {
      const km = parseFloat(document.getElementById("kilometers").value) || 0;
      const rate = parseFloat(document.getElementById("perKmRate").value) || 0;
      document.getElementById("amount").value = (km * rate).toFixed(2);
    }
    
    // Entry point for loading data.
    function initializePage() {
      loadEmployeeData();
      loadVehicles();
    }
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>