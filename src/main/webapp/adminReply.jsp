<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Reply</title>
  <!-- Bootstrap CSS (v5.3.0) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <!-- Custom CSS with theme variables -->
  <style>
    :root {
      --bg-color: #f4f6f9;
      --text-color: #333;
      --navbar-bg: #007bff;
      --card-bg: #ffffff;
      --border-color: #dee2e6;
      --primary-color: #0d6efd;
    }
    
    .night-mode {
      --bg-color: #121212;
      --text-color: #ffffff;
      --navbar-bg: #1f78d1;
      --card-bg: #1e1e1e;
      --border-color: #3e3e3e;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      background-color: var(--bg-color);
      color: var(--text-color);
      padding: 2rem;
    }
    
    .container-custom {
      max-width: 800px;
      margin: auto;
      background: var(--card-bg);
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
    }
    
    .icon {
      margin-right: 0.5rem;
      color: var(--primary-color);
    }
    
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
<body>
  <div class="container-custom">
    <h2 id="complaintTitle" class="mb-4">
      <i class="fas fa-comment-dots icon"></i>
      Admin Reply for Complaint #
    </h2>
    
    <div id="complaintDetails" class="card mb-3">
      <div class="card-body">
        <p><strong><i class="fas fa-id-badge icon"></i>User ID:</strong> <span id="userId"></span></p>
        <p><strong><i class="fas fa-user icon"></i>User Name:</strong> <span id="userName"></span></p>
        <p><strong><i class="fas fa-tag icon"></i>Subject:</strong> <span id="subject"></span></p>
        <p><strong><i class="fas fa-align-left icon"></i>Description:</strong> <span id="description"></span></p>
        <p><strong><i class="fas fa-info-circle icon"></i>Status:</strong> <span id="status"></span></p>
      </div>
    </div>

    <!-- Admin Reply Form -->
    <form id="replyForm">
      <input type="hidden" name="complaint_id" id="complaint_id">
      <div class="mb-3">
        <label for="admin_reply" class="form-label">
          <i class="fas fa-reply icon"></i>
          Admin Reply:
        </label>
        <textarea class="form-control" name="admin_reply" id="admin_reply" rows="5" required></textarea>
      </div>
      <div class="d-flex gap-2">
        <button type="submit" class="btn btn-primary">
          <i class="fas fa-paper-plane icon"></i>
          Submit Reply
        </button>
        <a href="admin_complaints.jsp" class="btn btn-secondary">
          <i class="fas fa-arrow-left icon"></i>
          Back to Complaints
        </a>
      </div>
    </form>
  </div>

  <script>
    // Helper: Get URL parameter value.
    function getQueryParam(param) {
      const urlParams = new URLSearchParams(window.location.search);
      console.log('URL Parameters:', Object.fromEntries(urlParams.entries()));
      return urlParams.get(param);
    }

    // Populate complaint details from URL parameters.
    function populateComplaintDetails() {
      const complaintId = getQueryParam("complaint_id");
      if (complaintId) {
        document.getElementById("complaintTitle").textContent = "Admin Reply for Complaint #" + complaintId;
        document.getElementById("complaint_id").value = complaintId;
        document.getElementById("userId").textContent = getQueryParam("user_id") || "N/A";
        document.getElementById("userName").textContent = getQueryParam("user_name") || "N/A";
        document.getElementById("subject").textContent = getQueryParam("subject") || "N/A";
        document.getElementById("description").textContent = getQueryParam("description") || "N/A";
        document.getElementById("status").textContent = getQueryParam("status") || "N/A";
      } else {
        document.body.innerHTML = "<h3 class='text-center text-danger'>Error: No complaint selected.</h3>";
      }
    }

    // Handle form submission.
    document.getElementById("replyForm").addEventListener("submit", function(event) {
      event.preventDefault();

      const complaintId = document.getElementById("complaint_id").value;
      const adminReply = document.getElementById("admin_reply").value;

      fetch("AdminReplyServlet", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `complaint_id=${complaintId}&admin_reply=${encodeURIComponent(adminReply)}`
      })
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.text();
      })
      .then(data => {
        alert("Reply submitted successfully!");
        window.location.href = "admin_complaints.jsp";
      })
      .catch(error => {
        console.error("Error submitting reply:", error);
        alert("Error submitting reply. Please try again.");
      });
    });

    document.addEventListener("DOMContentLoaded", populateComplaintDetails);
  </script>
  
  <!-- Bootstrap JS Bundle (v5.3.0) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <footer>
    <hr>
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
  </footer>
</body>
</html>
