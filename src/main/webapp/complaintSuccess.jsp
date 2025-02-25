<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Complaint Submitted - MegaCityCab</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <style>
    body {
      background: #f4f6f9;
      font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }
    .complaint-container {
      margin: 100px auto 40px;
      padding: 40px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 600px;
    }
    .complaint-container h2 {
      font-size: 2.5rem;
      margin-bottom: 20px;
    }
    .complaint-container p {
      font-size: 1.2rem;
    }
    footer {
      background-color: #343a40;
      color: #fff;
      padding: 20px 0;
      margin-top: 60px;
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
  <div class="container complaint-container text-center">
    <h2 class="text-success">
      <i class="fas fa-check-circle"></i> Complaint Submitted Successfully
    </h2>
    <p>Thank you for your feedback. Our team will review your complaint and get back to you shortly.</p>
  </div>
  
  <footer>
    <div class="container">
      <hr>
      <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
      <p>Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321</p>
    </div>
  </footer>
  
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
