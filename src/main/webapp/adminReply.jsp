<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Reply</title>
  <!-- Bootstrap CSS (v4.5.2) -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <!-- Custom Navbar CSS -->
  <link rel="stylesheet" href="cusnav.css">
  <style>
    body {
      background-color: #f8f9fa;
      padding: 2rem;
    }
    .container {
      max-width: 800px;
      margin: auto;
      background: #fff;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
    }
    .icon {
      margin-right: 0.5rem;
      color: #0d6efd;
    }
  </style>
</head>
<body>
  <div class="container">
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
      <div class="form-group">
        <label for="admin_reply">
          <i class="fas fa-reply icon"></i>
          Admin Reply:
        </label>
        <textarea class="form-control" name="admin_reply" id="admin_reply" rows="5" required></textarea>
      </div>
      <button type="submit" class="btn btn-primary">
        <i class="fas fa-paper-plane icon"></i>
        Submit Reply
      </button>
      <a href="admin_complaints.jsp" class="btn btn-secondary">
        <i class="fas fa-arrow-left icon"></i>
        Back to Complaints
      </a>
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

      // Use backticks for a template literal to preserve the ${...} syntax.
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
  
  <!-- Bootstrap JS Bundle -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 10px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
  </footer>
</body>
</html>
