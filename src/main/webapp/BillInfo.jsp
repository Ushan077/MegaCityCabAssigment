<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>My Bill Information</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <!-- Custom Navbar CSS -->
  <link rel="stylesheet" href="cusnav.css">
  
  <style>
    /* Global Styles */
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://images.unsplash.com/photo-1607765782528-6adc51455bab?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    /* Upper Navbar Styles */
    .navbar-brand { font-weight: bold; }
    .navbar-nav .nav-link { font-size: 1rem; margin-right: 1rem; }
    /* Side Navbar Styles */
    #sidebar {
      min-width: 200px;
      max-width: 250px;
      background-color: #343a40;
      min-height: 100vh;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    #sidebar .nav-link { color: #fff; padding: 0.75rem 1rem; }
    #sidebar .nav-link:hover { background-color: #495057; }
    #sidebar .sidebar-heading {
      color: #fff;
      padding: 1rem;
      font-size: 1.2rem;
      text-align: center;
      border-bottom: 1px solid #495057;
    }
    /* Main Content Area */
    .content { margin: 2rem; transition: background-color 0.3s ease, color 0.3s ease; }
    .container-content { margin-top: 40px; }
    .background-box {
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }
    /* Responsive adjustments */
    @media (max-width: 768px) {
      .d-flex { flex-direction: column; }
      #sidebar { max-width: 100%; min-height: auto; }
      .content { margin: 1rem; }
    }
  </style>
</head>
<body onload="initializePage();">
  
  <!-- Upper Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-user-circle"></i> Customer Dashboard</a>
      <div class="d-flex align-items-center">
        <a class="btn btn-outline-light ms-3" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </div>
    </div>
  </nav>
  
  <!-- Layout: Side Navbar + Main Content -->
  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar">
      <div class="sidebar-heading text-center mt-3">Menu</div>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a class="nav-link" href="CustomerHome.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cusbooking.jsp"><i class="fas fa-calendar-alt"></i> Manage Bookings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BillInfo.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Information</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="CusComplaint.jsp"><i class="fas fa-exclamation-circle"></i> Complaint</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><i class="fas fa-door-open"></i> Exit</a>
        </li>
      </ul>
    </div>
    
    <!-- Main Content -->
    <div class="content container-content">
      <div class="background-box">
        <h2 class="text-center mb-4">My Bill Information</h2>
        <!-- Bill Cards Container -->
        <div class="row" id="bill-list">
          <!-- Bill cards will be inserted here dynamically -->
        </div>
      </div>
    </div>
  </div>
  
  <script>
    // Utility function to retrieve a cookie value by name.
    function getCookie(name) {
      const cookies = document.cookie.split(";");
      for (let cookie of cookies) {
        let [key, value] = cookie.trim().split("=");
        if (key === name) {
          return decodeURIComponent(value);
        }
      }
      return "";
    }
    
    // Function to fetch and display bills for the logged-in user.
    function loadUserBills() {
      // Retrieve customer id from cookie "userID"
      const customerID = getCookie("userID");
      if (!customerID) {
        alert("User not logged in or userID cookie not found.");
        return;
      }
      
      // Fetch bills only for this customer.
      fetch(`http://localhost:8082/MegaCityCabAssignment/FetchBillsJsonServlet?customerID=${customerID}`)
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok: " + response.statusText);
        }
        return response.json();
      })
      .then(bills => {
        const billList = document.getElementById("bill-list");
        billList.innerHTML = "";
        if (bills.length === 0) {
          billList.innerHTML = `<div class="col-12 text-center">No bills found.</div>`;
          return;
        }
        bills.forEach(bill => {
          const card = `
            <div class="col-md-4 mb-3">
              <div class="card h-100">
                <div class="card-body">
                  <h5 class="card-title">Bill ID: ${bill.id}</h5>
                  <p class="card-text"><strong>Employee Name:</strong> ${bill.employeeName}</p>
                  <p class="card-text"><strong>Amount:</strong> $${parseFloat(bill.amount).toFixed(2)}</p>
                  <p class="card-text"><strong>Date:</strong> ${bill.billDate}</p>
                </div>
              </div>
            </div>
          `;
          billList.innerHTML += card;
        });
      })
      .catch(error => {
        console.error("Error fetching bills:", error);
        document.getElementById("bill-list").innerHTML = `<div class="col-12 text-center text-danger">Error loading bill data.</div>`;
      });
    }
    
    function initializePage() {
      loadUserBills();
    }
    
    window.onload = initializePage;
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 10px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
  </footer>
</body>
</html>
