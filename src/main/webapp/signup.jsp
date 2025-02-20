<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Registration Form</title>

  
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
  />

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

  <style>
   
    body {
      background-image: url('https://media.istockphoto.com/id/1053821688/photo/senior-woman-traveling-by-car.jpg?s=1024x1024&w=is&k=20&c=ArAyS8507K1BaFE_Js88etqfMJCN8iNN5YaNmnYD5mo=');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    /* Center the registration form container */
    .d-flex-center {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* Glassmorphism container for the form */
    .registration-container {
      width: 500px;
      margin-left:1000px;
      background-color: rgba(255, 255, 255, 0.15); /* semi-transparent white */
      backdrop-filter: blur(15px);                 /* blur for the glass effect */
      -webkit-backdrop-filter: blur(15px);         /* Safari support */
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

    /* Table styling inside the form (optional) */
    table.table {
      margin-bottom: 0;
    }
    table.table td {
      border-top: none; /* remove extra lines if desired */
    }

    /* Form controls inside the container */
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

    /* Button styles */
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

    /* Alert styling for password mismatch */
    #passwordAlert {
      padding: 0.5rem;
      margin-top: 0.5rem;
    }
  </style>

  <script>
    $(document).ready(function() {
      // Check if passwords match on keyup
      $("#password, #confirm_password").on("keyup", function() {
        let password = $("#password").val();
        let confirmPassword = $("#confirm_password").val();

        if (password !== confirmPassword) {
          $("#passwordAlert")
            .removeClass("d-none")
            .text("Passwords do not match!");
        } else {
          $("#passwordAlert").addClass("d-none");
        }
      });

      // Prevent form submission if passwords don't match
      $("form").on("submit", function(event) {
        if ($("#password").val() !== $("#confirm_password").val()) {
          event.preventDefault();
          $("#passwordAlert")
            .removeClass("d-none")
            .text("Passwords do not match!");
        }
      });

      // Show success modal if redirected with success flag
      if (window.location.href.indexOf("success=true") !== -1) {
        $("#successModal").modal("show");
      }

      // Show error modal if registration fails
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
  <!-- Container that centers the form vertically and horizontally -->
  <div class="d-flex-center">
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
              <input
                type="password"
                id="password"
                name="password"
                class="form-control"
                required
              />
            </td>
          </tr>
          <tr>
            <td style="color: black; font-weight: bold;">Re-enter Password:</td>
            <td>
              <input
                type="password"
                id="confirm_password"
                class="form-control"
                required
              />
              <div
                id="passwordAlert"
                class="alert alert-danger mt-2 d-none"
              ></div>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <input
                type="submit"
                value="Register"
                class="btn btn-success"
              />
              <br /><br />
             <p style="color: white;">Do you have an account?</p>

            <a href="Login.jsp" class="btn" style="background-color: transparent; border: none; color: white;">Login</a>


            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>

  <!-- Success Modal -->
  <div class="modal fade" id="successModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title">Registration Successful</h5>
          <button type="button" class="close" data-dismiss="modal">
            &times;
          </button>
        </div>
        <div class="modal-body">
          You have been successfully registered!
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-primary"
            data-dismiss="modal"
          >
            OK
          </button>
        </div>
      </div>
    </div>
  </div>

  <!-- Error Modal -->
  <div class="modal fade" id="errorModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title">Registration Failed</h5>
          <button type="button" class="close" data-dismiss="modal">
            &times;
          </button>
        </div>
        <div class="modal-body">
          <p id="errorMessage">An error occurred during registration.</p>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-secondary"
            data-dismiss="modal"
          >
            OK
          </button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
