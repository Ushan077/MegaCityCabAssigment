<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Mega City Cab</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      background-image: url('https://media.istockphoto.com/id/1043503382/photo/3d-street-flight-render.jpg?s=1024x1024&w=is&k=20&c=x23UatxE3r8-7RnsxSb2LUiDU71X1-xHYzB991OKSQM=');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }
    .welcome-message {
      text-align: left;
      margin-top: 40px;
      margin-right: 40px;
      color: white;
    }
    .welcome-message h2 {
      font-size: 4rem;
      font-weight: bold;
      color: #d3d3d3;
      margin-bottom: 30px;
    }
    .welcome-message h1 {
      font-size: 6rem;
      color: #d3d3d3;
      font-weight: bold;
      margin-bottom: 30px;
    }
    .d-flex-center {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .registration-container {
      width: 500px;
      margin-left: 80px;
      background-color: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(15px);
      -webkit-backdrop-filter: blur(15px);
      color: #ffffff;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }
    .registration-container h2 {
      text-align: center;
      margin-bottom: 1rem;
    }
    table.table {
      margin-bottom: 0;
    }
    table.table td {
      border-top: none;
    }
    .registration-container .form-control {
      background-color: rgba(255, 255, 255, 0.2);
      border: none;
      color: #fff;
    }
    .registration-container .form-control:focus {
      background-color: rgba(255, 255, 255, 0.3);
      color: #fff;
      box-shadow: none;
      border: 1px solid rgba(255, 255, 255, 0.2);
    }
    .registration-container .btn-success {
      background-color: #28a745;
      border: none;
      transition: background-color 0.3s ease;
    }
    .registration-container .btn-success:hover {
      background-color: #218838;
    }
    .registration-container .btn {
      transition: background-color 0.3s ease;
    }
    #passwordAlert {
      padding: 0.5rem;
      margin-top: 0.5rem;
    }
  </style>
  <script>
    $(document).ready(function() {
      $("#password, #confirm_password").on("keyup", function() {
        let password = $("#password").val();
        let confirmPassword = $("#confirm_password").val();
        if (password !== confirmPassword) {
          $("#passwordAlert").removeClass("d-none").text("Passwords do not match!");
        } else {
          $("#passwordAlert").addClass("d-none");
        }
      });
      $("form").on("submit", function(event) {
        if ($("#password").val() !== $("#confirm_password").val()) {
          event.preventDefault();
          $("#passwordAlert").removeClass("d-none").text("Passwords do not match!");
        }
      });
      if (window.location.href.indexOf("success=true") !== -1) {
        $("#successModal").modal("show");
      }
      const urlParams = new URLSearchParams(window.location.search);
      if (urlParams.has("error")) {
        let errorMsg = "An error occurred during registration.";
        switch (urlParams.get("error")) {
          case "driver":
            errorMsg = "Database driver not found!";
            break;
          case "insert":
            errorMsg = "Failed to insert record. Please try again.";
            break;
          case "sql":
            errorMsg = "Database error occurred.";
            break;
          case "unknown":
            errorMsg = "An unknown error occurred.";
            break;
        }
        $("#errorMessage").text(errorMsg);
        $("#errorModal").modal("show");
      }
    });
  </script>
</head>
<body>
  <div class="d-flex-center">
    <div class="welcome-message">
      <h2>Welcome to</h2>
      <h1>Mega City Cab</h1>
    </div>
    <div class="registration-container">
      <h2 class="text-light">Registration Form</h2>
      <form class="form p-3" action="RegisterServlet" method="post">
        <table class="table table-hover">
          <tr>
            <td style="text-align: left;">
              <input type="reset" value="Clear" class="btn" style="background-color: transparent; border: none; color: red; font-weight: bold;" />
            </td>
          </tr>
          <tr>
            <td style="color: black; font-weight: bold;">NIC:</td>
            <td>
              <input type="text" name="nic" class="form-control" required />
            </td>
          </tr>
          <tr>
            <td style="color: black; font-weight: bold;">Name:</td>
            <td>
              <input type="text" name="name" class="form-control" required />
            </td>
          </tr>
          <tr>
            <td style="color: black; font-weight: bold;">Address:</td>
            <td>
              <input type="text" name="address" class="form-control" required />
            </td>
          </tr>
          <tr>
            <td style="color: black; font-weight: bold;">Contact:</td>
            <td>
              <input type="text" name="contact" class="form-control" required />
            </td>
          </tr>
          <tr>
            <td style="color: black; font-weight: bold;">Password:</td>
            <td>
              <input type="password" id="password" name="password" class="form-control" required />
            </td>
          </tr>
          <tr>
            <td style="color: black; font-weight: bold;">Re-enter Password:</td>
            <td>
              <input type="password" id="confirm_password" class="form-control" required />
              <div id="passwordAlert" class="alert alert-danger mt-2 d-none"></div>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <input type="submit" value="Register" class="btn btn-success" /><br /><br />
              <p style="color: white;">Do you have an account?</p>
              <a href="Login.jsp" class="btn" style="background-color: transparent; border: none; color: white;">Login</a>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
  <div class="modal fade" id="successModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title">Registration Successful</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          You have been successfully registered!
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="errorModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title">Registration Failed</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p id="errorMessage">An error occurred during registration.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
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

</body>
</html>
