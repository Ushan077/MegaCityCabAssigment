<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Complaints Management - Admin Dashboard</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="adminhome.html">Complaints Management - Admin Dashboard</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="themeDropdown" data-toggle="dropdown">
            <i class="fas fa-adjust"></i> Theme
          </a>
          <div class="dropdown-menu dropdown-menu-right">
            <a class="dropdown-item" href="#" onclick="setTheme('light')">Light</a>
            <a class="dropdown-item" href="#" onclick="setTheme('night')">Night</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Login.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2 sidebar">
        <h5 class="text-center text-white">Menu</h5>
        <a href="adminhome.html"><i class="fas fa-home"></i> Dashboard</a>
        <a href="usersmanage.jsp"><i class="fas fa-users"></i> Users</a>
        <a href="managevehivehicles.jsp"><i class="fas fa-car"></i> Vehicles</a>
        <a href="adminBillView.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Manage</a>
        <a href="admin_complaints.jsp"><i class="fas fa-exclamation-circle"></i> Complaints</a>
      </div>
      <div class="col-md-10 content">
        <h2><i class="fas fa-exclamation-triangle"></i> Complaints List</h2>
        <div class="table-responsive">
          <table class="table table-striped table-bordered">
            <thead class="thead-dark">
              <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>User Name</th>
                <th>Subject</th>
                <th>Description</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody id="complaintsTable"></tbody>
          </table>
        </div>
        <p id="rowCount" class="text-muted"></p>
      </div>
    </div>
  </div>
  <script>
    function loadComplaints() {
      fetch("GetComplaintsServlet")
        .then(response => response.json())
        .then(data => {
          const tbody = document.querySelector("#complaintsTable");
          tbody.innerHTML = "";
          data.forEach(complaint => {
            const tr = document.createElement("tr");
            tr.innerHTML = `
              <td>${complaint.complaintId}</td>
              <td>${complaint.userId}</td>
              <td>${complaint.userName}</td>
              <td>${complaint.subject}</td>
              <td>${complaint.description}</td>
              <td>${complaint.status}</td>
              <td>
                <a href="adminReply.html?complaint_id=${complaint.complaintId}" class="btn btn-primary btn-sm btn-reply">
                  <i class="fas fa-reply"></i> Reply
                </a>
              </td>
            `;
            tbody.appendChild(tr);
          });
          document.getElementById("rowCount").textContent = "Total Complaints: " + data.length;
        })
        .catch(error => console.error("Error loading complaints:", error));
    }
    document.addEventListener("DOMContentLoaded", loadComplaints);
    function setTheme(theme) {
      document.body.classList.toggle("night-mode", theme === "night");
    }
  </script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
 <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 10px 0; margin-top: 20px;">
  <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
  <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
</footer>

</body>
</html>
