<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>About Us - Mega City Cab</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
  <link rel="stylesheet" href="cusnav.css" />
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f9;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    /* Top Navbar */
    .navbar {
      background-color: #343a40;
    }
    .navbar-brand {
      font-weight: bold;
      font-size: 1.5rem;
      color: #fff !important;
    }
    /* Sidebar */
    #sidebar {
      width: 220px;
      background-color: #343a40;
      min-height: 100vh;
      color: #fff;
      padding: 1.5rem 1rem;
    }
    #sidebar .nav-link {
      color: #fff;
      margin-bottom: 0.5rem;
      text-decoration: none;
      display: block;
      padding: 0.5rem;
      border-radius: 4px;
      transition: background-color 0.3s ease, padding-left 0.3s ease;
    }
    #sidebar .nav-link:hover,
    #sidebar .nav-link.active {
      background-color: #495057;
      padding-left: 10px;
    }
    #sidebar .sidebar-heading {
      text-align: center;
      font-size: 1.2rem;
      margin-bottom: 1rem;
    }
    /* Main Content */
    .content {
      flex: 1;
      padding: 2rem;
      margin: 2rem;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    /* About Us Section */
    .about-section p {
      line-height: 1.6;
      margin-bottom: 1rem;
    }
    /* Custom Image Styling */
    .img-custom {
      max-width: 100%;
      height: 400px;
      border-radius: 10px;
      margin: 30px auto;
      box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    }
    /* Footer */
    footer {
      background-color: #343a40;
      color: #fff;
      padding: 20px 0;
      margin-top: 40px;
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
  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Mega City Cab</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">

          	<li class="nav-item">
 				 <a class="nav-link" style="color: red !important;" href="LogoutServlet">Logout</a>
			</li>

        </ul>
      </div>
    </div>
  </nav>

  <!-- Sidebar + Main Content Layout -->
  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar">
      <div class="sidebar-heading">Menu</div>
      <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="CustomerHome.jsp"><i class="fas fa-home"></i> Home</a></li>
        <li class="nav-item"><a class="nav-link" href="cusbooking.jsp"><i class="fas fa-calendar-alt"></i> Manage Bookings</a></li>
        <li class="nav-item"><a class="nav-link active" href="AboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
      </ul>
    </div>
    <!-- Main Content -->
    <div class="container my-5">
      <div class="row align-items-center">
        <div class="col-md-6 about-section">
          <h2 class="text-dark mb-4">About Us</h2>
          <p>
            Mega City Cab is a leading transportation service dedicated to providing safe, reliable, and affordable taxi services throughout the city. Founded with a commitment to excellence, we have grown to become one of the most trusted names in urban mobility.
          </p>
          <p>
            Our mission is to connect people with their destinations in a timely, efficient, and secure manner. With a modern fleet of vehicles and a team of experienced drivers, we strive to offer a superior travel experience for every customer.
          </p>
          <p>
            At Mega City Cab, customer satisfaction is our top priority. We continuously innovate and invest in technology to ensure a seamless and convenient ride experience—from easy booking through our online platform to professional, courteous service on every trip.
          </p>
          <p>
            We believe in building lasting relationships with our customers by consistently delivering quality service. Whether you need a ride to work, a quick trip across town, or transportation to and from the airport, Mega City Cab is here to serve you.
          </p>
          <p>
            For further information, please contact our customer support team at <strong>info@megacitycab.com</strong> or call <strong>+1-555-123-4567</strong>.
          </p>
        </div>
        <div class="col-md-6 text-center">
          <img src="https://img.freepik.com/free-vector/app-taxi-service_24908-60897.jpg?t=st=1740470190~exp=1740473790~hmac=c13efe07d61b802a20d8008a5f7bd36a74a262b550447d6f6f831f2a5be6b3e8&w=900" class="img-fluid img-custom mx-auto d-block" alt="Vehicle Image">
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <div class="container">
      <hr>
      <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
      <p>Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321</p>
    </div>
  </footer>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
