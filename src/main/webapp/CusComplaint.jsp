<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>File a Complaint</title>
  
  <!-- Bootstrap CSS (v4.5.2) -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
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
    <div class="content">
      <div class="complaint-container mx-auto">
        <h2 class="text-primary mb-4 text-center">File a Complaint</h2>
        
        <div class="mb-3">
          <label><strong>User ID:</strong></label>
          <span id="userIDDisplay">N/A</span>
        </div>
        <div class="mb-3">
          <label><strong>Name:</strong></label>
          <span id="usernameDisplay">Guest</span>
        </div>
        
        <!-- Complaint Form -->
        <form id="complaintForm" action="ComplaintController" method="post">
          <!-- Hidden fields to send user info -->
          <input type="hidden" name="userID" id="userID" value="">
          <input type="hidden" name="userName" id="userName" value="">
          
          <div class="form-group mb-3">
            <label for="subject">Subject:</label>
            <input type="text" class="form-control" name="subject" id="subject" placeholder="Enter complaint subject" required>
          </div>
          <div class="form-group mb-3">
            <label for="description">Complaint Details:</label>
            <textarea class="form-control" name="description" id="description" rows="5" placeholder="Describe your issue" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Submit Complaint</button>
        </form>
        
        <!-- Admin Replies Section -->
        <div id="adminReplySection" class="background-box">
          <h4 class="text-success">Admin Replies</h4>
          <div class="table-responsive">
            <table class="table table-bordered" id="adminRepliesTable">
              <thead>
                <tr>
                  <th>Complaint ID</th>
                  <th>Subject</th>
                  <th>Admin Reply</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <!-- Table body will be populated dynamically -->
              </tbody>
            </table>
          </div>
        </div>
      </div>      
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
  
  <!-- jQuery (v3.5.1) -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <!-- Bootstrap JS Bundle -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
  
  <!-- Helper: Retrieve cookie by name -->
  <script>
    function getCookie(name) {
      const cookies = document.cookie.split(";");
      for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].trim();
        if (cookie.indexOf(name + "=") === 0) {
          return decodeURIComponent(cookie.substring(name.length + 1));
        }
      }
      return "";
    }
  </script>
  
  <!-- Main Script: Populate fields and load admin replies -->
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      // Populate user details from cookies
      const userID = getCookie("userID") || "N/A";
      const userName = getCookie("name") || "Guest";
      document.getElementById("userIDDisplay").textContent = userID;
      document.getElementById("usernameDisplay").textContent = userName;
      document.getElementById("userID").value = userID;
      document.getElementById("userName").value = userName;
      
      // Load admin replies if a valid userID is available
      loadUserAdminReplies();
    });
    
    function loadUserAdminReplies() {
      const userID = document.getElementById("userID").value;
      if (userID === "N/A" || !userID) {
        console.log("Invalid userID; skipping admin replies load.");
        return;
      }
      
      const url = "GetUserComplaintsServlet?userID=" + encodeURIComponent(userID);
      fetch(url)
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          return response.json();
        })
        .then(data => {
          const tbody = document.querySelector("#adminRepliesTable tbody");
          tbody.innerHTML = ""; // Clear any existing rows
          let hasReplies = false;
          
          data.forEach(complaint => {
            // Only display complaints that have an admin reply
            if (complaint.admin_reply && complaint.admin_reply.trim() !== "") {
              hasReplies = true;
              tbody.innerHTML += `
                <tr>
                  <td>\${complaint.complaint_id}</td>
                  <td>\${complaint.subject}</td>
                  <td>\${complaint.admin_reply}</td>
                  <td>\${complaint.status}</td>
                </tr>
              `;
            }
          });
          
          if (!hasReplies) {
            tbody.innerHTML = `<tr><td colspan="4" class="text-center">No admin replies available</td></tr>`;
          }
        })
        .catch(error => {
          console.error("Error loading admin replies:", error);
        });
    }
  </script>
</body>
</html>
