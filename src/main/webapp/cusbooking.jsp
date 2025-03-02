<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Booking - Mega City Cab</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  
  <!-- FontAwesome for Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

  <style>
/* Global Styles */
body {
  font-family: 'Roboto', sans-serif;
  background-image: url('https://media.istockphoto.com/id/936346770/de/vektor/travel-concept-musterdesign-abstrakte-flugzeug-routen-reisen-und-tourismus-nahtlose.jpg?s=1024x1024&w=is&k=20&c=EAeALvegAwD19pV1hDCng92LJc8a2BN0BlOQ1-Pep-c=');
  background-size: cover;
  background-attachment: fixed;
  margin: 0;
  padding: 0;
  transition: background-color 0.3s ease, color 0.3s ease;
  color: #333;
}

/* Top Navbar */
.navbar {
  background: linear-gradient(to right, #2a3d66, #ff8a00) !important;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
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
  color: #fff !important;
  font-size: 1.1rem;
  margin-right: 1.5rem;
  font-weight: 500;
  position: relative;
  padding: 8px 0;
  transition: all 0.3s ease;
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

/* Sidebar */
#sidebar {
  position: fixed;
  top: 0;
  left: 0;
  width: 250px;
  height: 100vh;
  background: linear-gradient(135deg, #3a3d45, #121212);
  color: #fff;
  padding: 2rem 1.5rem;
  overflow-y: auto;
  transition: all 0.3s ease;
  z-index: 1000;
}
#sidebar .sidebar-heading {
  text-align: center;
  font-size: 1.4rem;
  margin-bottom: 2rem;
  border-bottom: 1px solid rgba(255,255,255,0.2);
  padding-bottom: 1rem;
  font-weight: 600;
  letter-spacing: 1px;
}
#sidebar .nav-link {
  color: rgba(255,255,255,0.8);
  display: block;
  padding: 0.8rem 1rem;
  border-radius: 8px;
  margin-bottom: 0.8rem;
  text-decoration: none;
  transition: all 0.3s ease;
  font-weight: 500;
}
#sidebar .nav-link:hover,
#sidebar .nav-link.active {
  background-color: rgba(255,255,255,0.15);
  color: #fff;
  padding-left: 1.5rem;
  box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

/* Main Content Area */
.content {
  margin-left: 250px;
  margin-top: 70px;
  padding: 30px;
  transition: all 0.3s ease;
  min-height: calc(100vh - 70px);
  background-color: rgba(255, 255, 255, 0.9);
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  border-radius: 15px;
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
  margin-bottom: 2rem;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}
.hero::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(0,0,0,0.6) 0%, rgba(0,123,255,0.5) 100%);
  z-index: 1;
}
.hero h1 {
  position: relative;
  z-index: 2;
  font-size: 3rem;
  font-weight: 800;
  text-align: center;
  text-transform: uppercase;
  letter-spacing: 2px;
  color: #fff;
  text-shadow: 3px 3px 6px rgba(0,0,0,0.7);
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

/* Card Styles */
.card {
  border-radius: 15px;
  box-shadow: 0 10px 20px rgba(0,0,0,0.1);
  margin-bottom: 1.5rem;
  padding: 20px;
  background: #fff;
  transition: all 0.3s ease;
}
.card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 35px rgba(0,0,0,0.15);
}
.card-header {
  background: linear-gradient(to right, #007bff, #00c6ff);
  color: white;
  font-weight: 600;
  padding: 15px;
}

/* Buttons */
.btn-primary {
  background: linear-gradient(to right, #007bff, #00c6ff);
  border: none;
  padding: 10px 25px;
  border-radius: 50px;
  font-weight: 600;
  letter-spacing: 1px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(0,123,255,0.3);
}
.btn-primary:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 25px rgba(0,123,255,0.5);
}

/* Footer */
footer {
  background: linear-gradient(to right, #1a2a6c, #b21f1f, #fdbb2d);
  color: #fff;
  padding: 30px 0;
  margin-top: 3rem;
  box-shadow: 0 -5px 15px rgba(0,0,0,0.1);
}
footer p {
  margin: 0;
  text-align: center;
  font-size: 1rem;
  letter-spacing: 1px;
}
footer .social-icons {
  margin-top: 15px;
  text-align: center;
}
footer .social-icons a {
  color: white;
  font-size: 1.5rem;
  margin: 0 10px;
  transition: all 0.3s ease;
}
footer .social-icons a:hover {
  color: rgba(255,255,255,0.7);
  transform: translateY(-5px);
}

/* Responsive Styles */
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
  .welcome-box {
    padding: 25px;
  }
  .card-header {
    font-size: 1.2rem;
  }
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
  
  <!-- Main Content Area -->
  <div class="content">
    <!-- Hero Section -->
    <section class="hero">
      <h1>Make a Booking</h1>
    </section>
    
    <!-- Booking Form Card -->
    <div class="card">
      <h4>Make a Booking</h4>
      <form action="CusBookingServlet" method="post">
        <div class="mb-3">
          <label for="customerName" class="form-label">Name:</label>
          <input type="text" class="form-control" id="customerName" name="customerName" readonly>
        </div>
        <div class="mb-3">
          <label for="customerID" class="form-label">Customer ID:</label>
          <input type="text" class="form-control" id="customerID" name="customerID" readonly>
        </div>
        <div class="mb-3">
          <label for="pickupLocation" class="form-label">Pickup Location:</label>
          <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" placeholder="Enter pickup location" required>
        </div>
        <div class="mb-3">
          <label for="vehicle" class="form-label">Select Vehicle:</label>
          <select class="form-select" id="vehicle" name="vehicle" required>
            <option value="">-- Select Vehicle --</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="dropoffLocation" class="form-label">Dropoff Location:</label>
          <input type="text" class="form-control" id="dropoffLocation" name="dropoffLocation" placeholder="Enter dropoff location" required>
        </div>
        <div class="mb-3">
          <label for="bookingDate" class="form-label">Booking Date:</label>
          <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit Booking</button>
      </form>
    </div>
    
    <!-- Bookings List Card -->
    <div class="card">
      <h4>My Bookings</h4>
      <table class="table table-bordered">
        <thead class="table-dark">
          <tr>
            <th>Booking ID</th>
            <th>Pickup Location</th>
            <th>Dropoff Location</th>
            <th>Vehicle</th>
            <th>Booking Date</th>
            
          </tr>
        </thead>
        <tbody id="bookingTableBody">
          <!-- Booking rows will be dynamically populated here -->
        </tbody>
      </table>
    </div>
  </div>
  
  <script>
    function loadVehicles() {
      const url = window.location.origin + '/MegaCityCabAssignment/FetchVehiclesServlet';
      fetch(url)
        .then(response => {
          if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
          return response.json();
        })
        .then(data => {
          const vehicleSelect = document.getElementById("vehicle");
          vehicleSelect.innerHTML = "<option value=''>-- Select Vehicle --</option>";
          data.forEach(vehicle => {
            const option = document.createElement("option");
            option.value = vehicle.id;
            option.textContent = `\${vehicle.vehicleName} (\${vehicle.vehicleNo}) - Rs: \${vehicle.price}`;
            vehicleSelect.appendChild(option);
          });
        })
        .catch(error => {
          console.error('Error loading vehicles:', error);
          alert("Error loading vehicles: " + error.message);
        });
    }

    function getCookie(name) {
      const cookieArr = document.cookie.split(";");
      for (let cookie of cookieArr) {
        cookie = cookie.trim();
        if (cookie.indexOf(name + "=") === 0) {
          return decodeURIComponent(cookie.substring(name.length + 1));
        }
      }
      return "";
    }

    function loadUserData() {
      const userName = getCookie("name") || "Guest";
      const userID   = getCookie("userID") || "N/A";
      document.getElementById("customerName").value = userName;
      document.getElementById("customerID").value = userID;
    }

    function loadBookings() {
      const customerId = getCookie("userID");
      if (!customerId) {
        alert("User not logged in.");
        return;
      }
      const url = window.location.origin + '/MegaCityCabAssignment/FetchBookingsServlet?customerId=' + customerId;
      fetch(url)
        .then(response => {
          if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
          return response.json();
        })
        .then(data => {
          const html = data.length 
            ? data.map(booking => `
                <tr>
                  <td>\${booking.bookingId}</td>
                  <td>\${booking.pickupLocation}</td>
                  <td>\${booking.dropoffLocation}</td>
                  <td>\${booking.vehicle}</td>
                  <td>\${booking.bookingDate}</td>
                 
                </tr>`).join('')
            : "<tr><td colspan='6'>No bookings available.</td></tr>";
          document.getElementById("bookingTableBody").innerHTML = html;
        })
        .catch(error => {
          console.error("Error loading bookings:", error);
          document.getElementById("bookingTableBody").innerHTML =
            "<tr><td colspan='6'>Error loading bookings.</td></tr>";
        });
    }

    function deleteBooking(bookingId) {
      bookingId = parseInt(bookingId);
      if (isNaN(bookingId)) {
        alert("Invalid Booking ID. Please refresh the page and try again.");
        return;
      }
      const params = new URLSearchParams();
      params.append("bookingId", bookingId);
      fetch(window.location.origin + '/MegaCityCabAssignment/DeleteBookingServlet', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: params.toString()
      })
      .then(response => response.text().then(text => text ? JSON.parse(text) : {}))
      .then(data => {
          if (data.success) {
              alert(data.message);
              loadBookings();
          } else {
              alert("Error: " + data.message);
          }
      })
      .catch(error => {
          console.error("Delete booking error:", error);
          alert("Failed to delete booking. Check console for details.");
      });
    }

    function initializePage() {
      loadUserData();
      loadVehicles();
      loadBookings();
    }
  </script>
  
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">
      &copy; 2023 MegaCityCab. All rights reserved.
    </p>
    <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
      Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
    </p>
  </footer>
  
  <!-- Bootstrap Bundle JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
