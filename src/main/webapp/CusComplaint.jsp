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
    /* Global styles */
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://plus.unsplash.com/premium_photo-1728723282563-92a1c71c5669?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTN8fGNhYiUyMHNlcnZpY2V8ZW58MHx8MHx8fDA%3D');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    
    /* Top Navbar */
    .navbar-brand {
      font-weight: bold;
    }
    
    /* Sidebar styling */
    #sidebar {
      min-width: 200px;
      max-width: 250px;
      background-color: #343a40;
      min-height: 100vh;
    }
    #sidebar .nav-link {
      color: #fff;
    }
    #sidebar .nav-link:hover,
    #sidebar .nav-link.active {
      background-color: #495057;
    }
    #sidebar .sidebar-heading {
      color: #fff;
      padding: 1rem;
      font-size: 1.2rem;
      text-align: center;
    }
    
    /* Main content area */
    .content {
      flex: 1;
      padding: 2rem;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    
    /* Complaint form container */
    .complaint-container {
      background: #fff;
      padding: 3rem 10rem; 
      border-radius: 8px;
      box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
      margin: 2rem;
      min-height: 400px;  
    }

    /* Background Box for headers and table */
    .background-box {
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }
    
    /* Table responsiveness */
    .table-responsive {
      margin-top: 1rem;
    }
    
    /* Theme Selector Dropdown (Bootstrap 4 styling) */
    #themeSelector {
      margin-left: 1rem;
      padding: 0.2rem;
      border-radius: 0.2rem;
      width: auto;
    }
  </style>
</head>
<body>
  <!-- Top Navbar -->
  <nav class="navbar navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <i class="fas fa-user-circle"></i> Customer Dashboard
      </a>
      <div class="d-flex align-items-center">
        <a class="btn btn-outline-light mr-2" href="LogoutServlet">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </div>
    </div>
  </nav>
  
  <!-- Sidebar + Main Content Layout -->
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
    
    <div class="complaint-container">
      <div class="content">
        <h2 class="text-primary mb-4">File a Complaint</h2>
        
        <div class="mb-3">
          <label><strong>User ID:</strong></label>
          <span id="userIDDisplay">N/A</span>
        </div>
        <div class="mb-3">
          <label><strong>Name:</strong></label>
          <span id="usernameDisplay">Guest</span>
        </div>
        
        <!-- Complaint Form Container -->
        <div class="complaint-container">
          <form id="complaintForm" action="ComplaintController" method="post">
            <!-- Hidden fields to send user info -->
            <input type="hidden" name="userID" id="userID" value="">
            <input type="hidden" name="userName" id="userName" value="">
            
            <div class="form-group">
              <label for="subject">Subject:</label>
              <input type="text" class="form-control" name="subject" id="subject" placeholder="Enter complaint subject" required>
            </div>
            <div class="form-group">
              <label for="description">Complaint Details:</label>
              <textarea class="form-control" name="description" id="description" rows="5" placeholder="Describe your issue" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Complaint</button>
          </form>
        </div>
        
        <!-- Section to view admin replies for user's complaints -->
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
  
  <!-- Scripts -->
  <!-- Include jQuery before Bootstrap JS (Bootstrap 4 dependency) -->
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
