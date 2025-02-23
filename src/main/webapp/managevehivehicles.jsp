<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Manage Vehicles</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  
  <script>
    // Adjust the context path as needed.
   const servletUrl = window.location.origin + '/MegaCityCabAssignment/ManageVehicleServlet';


    // Display a success message.
    function showSuccess(message) {
      const alertDiv = document.getElementById('alertMessage');
      alertDiv.className = 'alert alert-success';
      alertDiv.innerText = message;
      alertDiv.style.display = 'block';
      setTimeout(() => { alertDiv.style.display = 'none'; }, 3000);
    }

    // Display an error message.
    function showError(message) {
      const alertDiv = document.getElementById('alertMessage');
      alertDiv.className = 'alert alert-danger';
      alertDiv.innerText = message;
      alertDiv.style.display = 'block';
      setTimeout(() => { alertDiv.style.display = 'none'; }, 5000);
    }

    // Load vehicles from the servlet.
    function loadVehicles() {
      fetch(servletUrl + '?action=listVehicles')
        .then(response => response.json())
        .then(data => {
          const tableBody = document.getElementById('vehiclesTableBody');
          tableBody.innerHTML = "";
          if (data.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='5' class='text-center'>No vehicles found</td></tr>";
          } else {
            data.forEach(vehicle => {
              tableBody.innerHTML += `
                <tr>
                  <td>${vehicle.id}</td>
                  <td>${vehicle.vehicleNo}</td>
                  <td>${vehicle.vehicleName}</td>
                  <td>${vehicle.price}</td>
                  <td>
                    <button class="btn btn-warning btn-sm" onclick='editVehicle(${vehicle.id}, ${JSON.stringify(vehicle.vehicleNo)}, ${JSON.stringify(vehicle.vehicleName)}, ${vehicle.price})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteVehicle(${vehicle.id})">Delete</button>
                  </td>
                </tr>
              `;
            });
          }
        })
        .catch(error => {
          console.error('Error loading vehicles:', error);
          showError("Error loading vehicles: " + error.message);
        });
    }

    // Add a new vehicle.
    function addVehicle(event) {
      event.preventDefault();
      document.getElementById('action').value = "createVehicle";
      saveVehicle("Vehicle successfully added.");
    }

    // Update an existing vehicle.
    function updateVehicle(event) {
      event.preventDefault();
      document.getElementById('action').value = "updateVehicle";
      saveVehicle("Vehicle successfully updated.");
    }

    // Save vehicle data (used for both create and update).
    function saveVehicle(successMessage) {
      const formData = new FormData(document.getElementById('vehicleForm'));
      fetch(servletUrl, {
        method: 'POST',
        body: formData
      })
      .then(response => {
        if (!response.ok) {
          return response.text().then(text => { throw new Error(text); });
        }
        return response.json();
      })
      .then(data => {
        if (data.status === "success") {
          document.getElementById('vehicleForm').reset();
          loadVehicles();
          showSuccess(successMessage + " (Rows affected: " + data.rowsAffected + ")");
        } else if (data.error) {
          showError("Error: " + data.error);
        }
      })
      .catch(error => {
        console.error('Error saving vehicle:', error);
        showError("Error saving vehicle: " + error.message);
      });
    }

    // Pre-fill form fields for editing.
    function editVehicle(id, vehicle_no, vehicle_name, price) {
      document.getElementById('vehicleId').value = id;
      document.getElementById('vehicle_no').value = vehicle_no;
      document.getElementById('vehicle_name').value = vehicle_name;
      document.getElementById('price').value = price;
    }

    // Delete a vehicle.
    function deleteVehicle(id) {
      if (!id) {
        showError("Error: Vehicle ID is undefined!");
        return;
      }
      if (confirm("Are you sure you want to delete this vehicle?")) {
        const formData = new FormData();
        formData.append('action', 'deleteVehicle');
        formData.append('id', id);

        fetch(servletUrl, {
          method: 'POST',
          body: formData
        })
        .then(response => response.json())
        .then(data => {
          if (data.status === "success") {
            loadVehicles();
            showSuccess("Vehicle successfully deleted.");
          } else if (data.error) {
            showError("Error: " + data.error);
          }
        })
        .catch(error => {
          console.error('Error deleting vehicle:', error);
          showError("Error deleting vehicle: " + error.message);
        });
      }
    }

    // Reset form and clear hidden fields.
    function resetForm() {
      document.getElementById('vehicleForm').reset();
      document.getElementById('vehicleId').value = "";
    }

    // Load vehicles when the page loads.
    document.addEventListener("DOMContentLoaded", loadVehicles);
  </script>
</head>
<body>
 
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Admin Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavbar" 
              aria-controls="topNavbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="topNavbar">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="Login.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container-fluid">
    <div class="row">
      
      <div class="col-md-2 sidebar">
        <h5 class="text-center text-white">Menu</h5>
        <a href="adminhome.html"><i class="fas fa-home"></i> Dashboard</a>
        <a href="usersmanage.html"><i class="fas fa-users"></i> Users</a>
        <a href="managevehicles.html"><i class="fas fa-car"></i> Vehicles</a>
        <a href="adminBillView.html"><i class="fas fa-file-invoice-dollar"></i> Bill Manage</a>
        <a href="admin_complaints.html"><i class="fas fa-exclamation-circle"></i> Complaints</a>
      </div>

     
      <div class="col-md-10">
        <div class="main-content"><br>
          <h2 class="text-center" style="font-weight: bold;">
  <i class="fas fa-car"></i> Vehicle Management
</h2>

        
          <div id="alertMessage" style="display:none;"></div>
          
          <hr>
         
          <form id="vehicleForm">
           
            <input type="hidden" id="action" name="action" value="createVehicle">
            <input type="hidden" id="vehicleId" name="id" value="">
            
            <div class="mb-3">
              <label for="vehicle_no" class="form-label">Vehicle Number</label>
              <input type="text" class="form-control" id="vehicle_no" name="vehicle_no" placeholder="Enter vehicle number" required>
            </div>
            <div class="mb-3">
              <label for="vehicle_name" class="form-label">Vehicle Name</label>
              <input type="text" class="form-control" id="vehicle_name" name="vehicle_name" placeholder="Enter vehicle name" required>
            </div>
            <div class="mb-3">
              <label for="price" class="form-label">Price</label>
              <input type="number" step="0.01" class="form-control" id="price" name="price" placeholder="Enter price" required>
            </div>
            <div class="mb-3">
              <button type="button" class="btn btn-success" onclick="addVehicle(event)">
                <i class="fas fa-plus-circle"></i> Add Vehicle
              </button>
              <button type="button" class="btn btn-primary" onclick="updateVehicle(event)">
                <i class="fas fa-edit"></i> Update Vehicle
              </button>
              <button type="reset" class="btn btn-secondary" onclick="resetForm()">
                <i class="fas fa-undo"></i> Reset
              </button>
            </div>
          </form>
          
          
         
          <h4>Vehicles List</h4>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>ID</th>
                <th>Vehicle Number</th>
                <th>Vehicle Name</th>
                <th>Price</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody id="vehiclesTableBody">
              
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 10px 0; margin-top: 20px;">
  <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
  <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
</footer>

</body>
</html>
