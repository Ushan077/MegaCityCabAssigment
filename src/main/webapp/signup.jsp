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
  font-family: 'Segoe UI', Arial, sans-serif;
  height: 100vh;
  overflow-x: hidden;
}

/* Animation keyframes */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideInLeft {
  from { transform: translateX(-50px); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

@keyframes slideInRight {
  from { transform: translateX(50px); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

@keyframes float {
  0% { transform: translateY(0px); }
  50% { transform: translateY(-10px); }
  100% { transform: translateY(0px); }
}

/* Welcome message with enhanced animations */
.welcome-message {
  text-align: left;
  margin-top: 40px;
  margin-right: 40px;
  color: white;
  animation: slideInLeft 1s ease-out forwards;
}

.welcome-message h2 {
  font-size: 4rem;
  font-weight: bold;
  color: #e6e6e6;
  margin-bottom: 15px;
  text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
  animation: fadeIn 1.5s ease-out forwards;
}

.welcome-message h1 {
  font-size: 6rem;
  color: #f2f2f2;
  font-weight: bold;
  margin-bottom: 30px;
  text-shadow: 3px 3px 15px rgba(0, 0, 0, 0.8), 0 0 30px rgba(0, 100, 255, 0.6);
  animation: float 6s ease-in-out infinite;
}

/* Center layout styling */
.d-flex-center {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

/* Registration container with enhanced glass effect */
.registration-container {
  width: 500px;
  margin-left: 80px;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.18) 0%, rgba(255, 255, 255, 0.12) 100%);
  backdrop-filter: blur(15px);
  -webkit-backdrop-filter: blur(15px);
  color: #ffffff;
  padding: 30px;
  border-radius: 16px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2), inset 0 0 3px rgba(255, 255, 255, 0.3);
  border: 1px solid rgba(255, 255, 255, 0.2);
  animation: slideInRight 1s ease-out forwards, fadeIn 1.2s ease-out forwards;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.registration-container:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3), inset 0 0 3px rgba(255, 255, 255, 0.4);
}

.registration-container h2 {
  text-align: center;
  margin-bottom: 1.5rem;
  font-weight: 600;
  font-size: 2.2rem;
  letter-spacing: 1px;
  background: linear-gradient(to right, #e6e6e6, #ffffff);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Table styling */
table.table {
  margin-bottom: 0;
  width: 100%;
}

table.table td {
  border-top: none;
  padding: 12px 5px;
  vertical-align: middle;
}

/* Form control styling */
.registration-container .form-control {
  background-color: rgba(255, 255, 255, 0.15);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #fff;
  border-radius: 8px;
  padding: 12px 15px;
  transition: all 0.3s ease;
}

.registration-container .form-control::placeholder {
  color: rgba(255, 255, 255, 0.6);
}

.registration-container .form-control:focus {
  background-color: rgba(255, 255, 255, 0.25);
  color: #fff;
  box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.3);
  transform: translateY(-2px);
}

/* Label styling */
.registration-container label {
  margin-bottom: 6px;
  font-weight: 500;
  display: block;
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
  letter-spacing: 0.5px;
}

/* Button styling */
.registration-container .btn-success {
  background: linear-gradient(to right, #28a745, #20c997);
  border: none;
  border-radius: 8px;
  padding: 12px 20px;
  font-weight: 600;
  letter-spacing: 1px;
  box-shadow: 0 4px 15px rgba(40, 167, 69, 0.3);
  transition: all 0.3s ease;
  text-transform: uppercase;
  font-size: 0.95rem;
}

.registration-container .btn-success:hover {
  background: linear-gradient(to right, #218838, #1aae88);
  box-shadow: 0 6px 20px rgba(40, 167, 69, 0.4);
  transform: translateY(-3px);
}

.registration-container .btn {
  transition: all 0.3s ease;
  margin-top: 10px;
}

/* Password alert styling */
#passwordAlert {
  padding: 0.75rem;
  margin-top: 0.75rem;
  border-radius: 8px;
  background-color: rgba(220, 53, 69, 0.2);
  border: 1px solid rgba(220, 53, 69, 0.3);
  font-size: 0.9rem;
}

/* Responsive adjustments */
@media (max-width: 1200px) {
  .d-flex-center {
    flex-direction: column;
    padding: 20px;
  }
  
  .welcome-message {
    margin-right: 0;
    margin-bottom: 30px;
    text-align: center;
  }
  
  .welcome-message h1 {
    font-size: 4.5rem;
  }
  
  .welcome-message h2 {
    font-size: 2.8rem;
  }
  
  .registration-container {
    margin-left: 0;
    width: 90%;
    max-width: 500px;
  }
}

@media (max-width: 576px) {
  .welcome-message h1 {
    font-size: 3.5rem;
  }
  
  .welcome-message h2 {
    font-size: 2rem;
  }
  
  .registration-container {
    padding: 20px 15px;
  }
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
