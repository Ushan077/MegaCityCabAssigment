<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="loginstyle.css">
  <style>body {
  background-image: url('https://plus.unsplash.com/premium_photo-1736464269768-06b84d532420?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  height: 100vh;
  overflow-x: hidden;
}

.login-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  flex-direction: row;
  padding: 40px 20px;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/* Welcome message */
.welcome-message {
  text-align: left;
  margin-top: 40px;
  margin-right: 40px;
  color: white;
  animation: fadeIn 1.2s ease-out;
}

.welcome-message h2 {
  font-size: 4rem;
  font-weight: bold;
  color: #d3d3d3;
  margin-bottom: 30px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
}

.welcome-message h1 {
  font-size: 6rem;
  color: #d3d3d3;
  font-weight: bold;
  margin-bottom: 30px;
  text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.7);
}

.login-container {
  width: 350px;
  margin-left: 400px;
  background-color: rgba(255, 255, 255, 0.12);
  backdrop-filter: blur(15px);
  -webkit-backdrop-filter: blur(15px);
  color: #ffffff;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(255, 255, 255, 0.2);
  animation: slideUp 0.8s ease-out;
}

.login-container h3 {
  font-size: 2rem;
  margin-bottom: 25px;
  font-weight: 600;
  text-align: center;
  letter-spacing: 1px;
}

.login-container .form-control {
  background-color: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: white;
  border-radius: 8px;
  padding: 12px 15px;
  margin-bottom: 15px;
  transition: all 0.3s ease;
}

.login-container .form-control::placeholder {
  color: rgba(255, 255, 255, 0.7);
}

.login-container .form-control:focus {
  background-color: rgba(255, 255, 255, 0.3);
  color: #fff;
  box-shadow: none;
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.login-container .form-label {
  margin-bottom: 8px;
  font-weight: 500;
  display: block;
  transition: transform 0.2s ease, font-size 0.2s ease;
}

.login-container .form-control:focus + .form-label {
  transform: translateY(-20px);
  font-size: 0.85rem;
}

.login-container .btn-primary {
  background-color: #0d6efd;
  border: none;
  border-radius: 8px;
  padding: 12px;
  font-weight: 600;
  letter-spacing: 1px;
  width: 100%;
  margin-top: 10px;
  transition: background-color 0.3s ease, transform 0.2s ease-in-out;
}

.login-container .btn-primary:hover {
  background-color: #084298;
  transform: scale(1.05);
}

.login-container a.text-white {
  text-decoration: underline;
  color: #fff;
  transition: color 0.2s ease;
}

.login-container a.text-white:hover {
  color: #f0f0f0;
}

.alert {
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
  background-color: rgba(220, 53, 69, 0.2);
  border: 1px solid rgba(220, 53, 69, 0.3);
  color: #ffffff;
  padding: 12px;
  border-radius: 8px;
  margin-bottom: 20px;
}

.alert.show {
  opacity: 1;
}

@keyframes slideUp {
  from {
    transform: translateY(30px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

/* Icon styling */
.bi {
  margin-right: 8px;
}

/* Footer styling */
footer {
  background-color: rgba(52, 58, 64, 0.8) !important;
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}

/* Responsive design */
@media (max-width: 1200px) {
  .login-wrapper {
    flex-direction: column;
    padding: 20px;
  }
  
  .welcome-message {
    margin-right: 0;
    margin-bottom: 30px;
    text-align: center;
  }
  
  .welcome-message h1 {
    font-size: 4rem;
  }
  
  .welcome-message h2 {
    font-size: 2.5rem;
  }
  
  .login-container {
    margin-left: 0;
    width: 90%;
    max-width: 350px;
  }
}</style>
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
