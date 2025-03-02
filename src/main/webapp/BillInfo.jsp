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
  font-family: 'Roboto', sans-serif;
  background-image: url('https://images.unsplash.com/photo-1607765782528-6adc51455bab?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  margin: 0;
  padding: 0;
  transition: background-color 0.3s ease, color 0.3s ease;
}

/* Upper Navbar Styles */
.navbar {
  background: linear-gradient(135deg, #1a2a6c, #b21f1f, #fdbb2d) !important;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  padding: 15px 20px;
}

.navbar-brand {
  font-weight: bold;
  font-size: 1.8rem;
  color: #fff !important;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.navbar-nav .nav-link {
  font-size: 1rem;
  margin-right: 1rem;
  font-weight: 500;
  color: #fff !important;
  position: relative;
  padding: 8px 0;
}

.navbar-nav .nav-link::after {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  background: #fff;
  left: 0;
  bottom: 0;
  transition: width 0.3s ease;
}

.navbar-nav .nav-link:hover::after {
  width: 100%;
}

/* Side Navbar Styles */
#sidebar {
  min-width: 200px;
  max-width: 250px;
  background: linear-gradient(135deg, #343a40, #121212);
  color: #fff;
  min-height: 100vh;
  transition: background-color 0.3s ease, color 0.3s ease;
  position: fixed;
  top: 0;
  left: 0;
  padding: 2rem 1.5rem;
  overflow-y: auto;
}

#sidebar .sidebar-heading {
  font-size: 1.4rem;
  text-align: center;
  color: #fff;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  padding-bottom: 1rem;
  margin-bottom: 2rem;
  font-weight: 600;
  letter-spacing: 1px;
}

#sidebar .nav-link {
  color: rgba(255, 255, 255, 0.8);
  padding: 0.75rem 1rem;
  border-radius: 8px;
  margin-bottom: 0.8rem;
  display: block;
  transition: all 0.3s ease;
}

#sidebar .nav-link:hover {
  background-color: rgba(255, 255, 255, 0.15);
  color: #fff;
  padding-left: 1.5rem;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

/* Main Content Area */
.content {
  margin-left: 250px;
  margin-top: 70px;
  padding: 30px;
  transition: background-color 0.3s ease, color 0.3s ease;
  background-color: rgba(255, 255, 255, 0.9);
  min-height: calc(100vh - 70px);
}

.container-content {
  margin-top: 40px;
}

.background-box {
  background-color: rgba(255, 255, 255, 0.95);
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px;
  transition: all 0.3s ease;
}

.background-box:hover {
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
  transform: translateY(-5px);
}

/* Hero Section */
.hero {
  position: relative;
  background-image: url('https://images.unsplash.com/photo-1550445324-11f720eb5fcb?q=80&w=1964&auto=format&fit=crop');
  background-size: cover;
  background-position: center;
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  margin-bottom: 3rem;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.hero::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.6);
  z-index: 1;
}

.hero h1 {
  position: relative;
  z-index: 2;
  font-size: 3rem;
  font-weight: 800;
  text-align: center;
  color: #fff;
  text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.7);
  animation: fadeInUp 1s ease-out;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Responsive adjustments */
@media (max-width: 992px) {
  #sidebar {
    width: 200px;
  }
  .content {
    margin-left: 200px;
  }
  .hero h1 {
    font-size: 2.5rem;
  }
}

@media (max-width: 768px) {
  .hero h1 {
    font-size: 2rem;
  }
  
  #sidebar {
    width: 100%;
    height: auto;
    position: relative;
    padding: 1rem;
  }

  .content {
    margin-left: 0;
    margin-top: 0;
  }

  .background-box {
    padding: 25px;
  }
}

/* Card hover effects */
.card {
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  transition: all 0.4s ease;
  background: #fff;
  padding: 20px;
  margin-bottom: 1.5rem;
}

.card:hover {
  transform: translateY(-10px);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.table {
  width: 100%;
}
 @media print {
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      font-size: 12pt;
    }
    
    .bill-container {
      width: 8.5in;
      max-width: 100%;
      margin: 0 auto;
      padding: 0.5in;
      border: 1px solid #ddd;
      box-shadow: none;
      page-break-after: always;
    }
    
    .bill-footer {
      position: fixed;
      bottom: 0.5in;
      width: calc(8.5in - 1in);
    }
  }

  .bill-container {
    width: 100%;
    max-width: 8.5in;
    margin: 0 auto;
    padding: 30px;
    border: 1px solid #ddd;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    font-family: Arial, sans-serif;
    background-color: white;
  }

  .bill-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
  }

  .company-info {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .company-info h1 {
    margin: 10px 0 5px;
    color: #333;
    font-size: 24pt;
  }

  .tagline {
    font-size: 10pt;
    color: #666;
    margin-top: 0;
  }

  .logo {
    width: 80px;
    height: auto;
  }

  .bill-details {
    text-align: right;
  }

  .bill-details h2 {
    color: #333;
    margin-bottom: 10px;
  }

  .bill-info-table {
    border-collapse: collapse;
  }

  .bill-info-table td {
    padding: 3px 0;
  }

  .bill-info-table td:first-child {
    padding-right: 10px;
  }

  .divider {
    border: none;
    border-top: 2px solid #333;
    margin: 15px 0;
  }

  .bill-body {
    margin-bottom: 30px;
  }

  .customer-details {
    width: 100%;
    margin-bottom: 30px;
  }

  .customer-details .label {
    font-weight: bold;
    width: 150px;
    vertical-align: top;
    padding: 5px 0;
  }

  .customer-details .value {
    padding: 5px 0;
  }

  .charges-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
  }

  .charges-table th, .charges-table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  .charges-table th {
    background-color: #f2f2f2;
    font-weight: bold;
  }

  .amount {
    text-align: right;
  }

  .total-row {
    border-top: 2px solid #333;
    background-color: #f9f9f9;
  }

  .payment-info {
    margin-bottom: 30px;
  }

  .payment-method {
    margin-top: 15px;
  }

  .signature-area {
    margin-top: 30px;
    display: flex;
    justify-content: flex-end;
  }

  .signature-line {
    width: 250px;
    text-align: center;
  }

  .signature-line hr {
    border: none;
    border-top: 1px solid #000;
    margin-bottom: 5px;
  }

  .signature-line p {
    margin: 0;
    font-size: 10pt;
  }

  .bill-footer {
    text-align: center;
    margin-top: 50px;
    font-size: 10pt;
    color: #666;
    border-top: 1px solid #ddd;
    padding-top: 15px;
  }

  .bill-footer p {
    margin: 5px 0;
  }

  </style>
</head>
<body onload="initializePage();">
  <!-- Top Navbar (Fixed at the top) -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Customer Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Fixed Sidebar (L-Shape) -->
  <div id="sidebar">
    <div class="sidebar-heading">Menu</div>
    <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="CustomerHome.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="cusbooking.jsp"><i class="fas fa-calendar-alt"></i> Manage Bookings</a></li>
        <li class="nav-item"><a class="nav-link" href="BillInfo.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Information</a></li>
        <li class="nav-item"><a class="nav-link" href="CusComplaint.jsp"><i class="fas fa-exclamation-circle"></i> Complaint</a></li>
        <li class="nav-item"><a class="nav-link" href="aboutus.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="helpandsupport.jsp"><i class="fas fa-exclamation-circle"></i> Help & Support</a></li>
        <li class="nav-item"><a class="nav-link" href="LogoutServlet"><i class="fas fa-door-open"></i> Exit</a></li>
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
     fetch(`FetchBillsJsonServlet?customerID=${customerID}`)
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
        	  <div class="bill-container">
        	  <div class="bill-header">
        	    <div class="company-info">
        	      <img src="https://thumbs.dreamstime.com/z/magic-taxi-4123725.jpg?ct=jpeg" alt="Mega City Cab Logo" class="logo">
        	      <h1>MEGA CITY CAB</h1>
        	      <p class="tagline">Your Reliable Transport Partner</p>
        	    </div>
        	    <div class="bill-details">
        	      <h2>RECEIPT</h2>
        	      <table class="bill-info-table">
        	        <tr>
        	          <td><strong>Bill ID:</strong></td>
        	          <td>${bill.id}</td>
        	        </tr>
        	        <tr>
        	          <td><strong>Date:</strong></td>
        	          <td>${bill.billDate}</td>
        	        </tr>
        	      </table>
        	    </div>
        	  </div>

        	  <hr class="divider">

        	  <div class="bill-body">
        	    <table class="customer-details">
        	      <tr>
        	        <td class="label">Employee Name:</td>
        	        <td class="value">${bill.employeeName}</td>
        	      </tr>
        	      <tr>
        	        <td class="label">Service Type:</td>
        	        <td class="value">Transportation</td>
        	      </tr>
        	    </table>
        	    
        	    <table class="charges-table">
        	      <thead>
        	        <tr>
        	          <th>Description</th>
        	          <th>Amount</th>
        	        </tr>
        	      </thead>
        	      <tbody>
        	        <tr>
        	          <td>Transportation Service</td>
        	          <td class="amount">$${parseFloat(bill.amount).toFixed(2)}</td>
        	        </tr>
        	        <tr class="total-row">
        	          <td><strong>TOTAL</strong></td>
        	          <td class="amount"><strong>$${parseFloat(bill.amount).toFixed(2)}</strong></td>
        	        </tr>
        	      </tbody>
        	    </table>
        	  </div>

        	  

        	  <div class="bill-footer">
        	    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
        	    <p>Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
        	    <p>Thank you for choosing Mega City Cab!</p>
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
  
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">
      &copy; 2023 MegaCityCab. All rights reserved.
    </p>
    <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
      Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
    </p>
  </footer>
  
</body>
</html>
