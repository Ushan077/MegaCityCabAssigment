<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="loginstyle.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
  <div class="d-flex justify-content-center align-items-center vh-100">
    <div class="login-wrapper d-flex">
      <div class="welcome-message">
        <h2>Welcome to</h2>
        <h1>Mega City Cab</h1>
      </div>
      <div class="login-container">
        <h3>Login</h3>
        <div class="alert alert-danger d-none" id="errorMessage"></div>
        <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
          <div class="mb-3">
            <label class="form-label">
              <i class="bi bi-person-circle"></i> Username
            </label>
            <input type="text" class="form-control" name="username" required />
          </div>
          <div class="mb-3">
            <label class="form-label">
              <i class="bi bi-lock"></i> Password
            </label>
            <input type="password" class="form-control" name="password" required />
          </div>
          <div class="mb-3">
            <label class="form-label">User Type</label>
            <select class="form-control" name="usertype" required>
              <option value="admin">Admin</option>
              <option value="user">User</option>
              <option value="employee">Employee</option>
            </select>
          </div>
          <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <p class="text-center mt-3">
          <a href="signup.jsp" class="text-white">Create an account</a>
        </p>
      </div>
    </div>
  </div>
  <script>
  document.addEventListener("DOMContentLoaded", function () {
      const params = new URLSearchParams(window.location.search);
      if (params.get("error") === "invalid") {
        const errorMessage = document.getElementById("errorMessage");
        errorMessage.classList.remove("d-none");
        errorMessage.classList.add("show");
        errorMessage.innerText = "Invalid username, password, or usertype.";
      }
  });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
