<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Home Page</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Your Custom CSS -->
    <link rel="stylesheet" href="styles.css">

    <!-- jQuery, Popper, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            background-image: url('https://plus.unsplash.com/premium_photo-1737739963212-0cf511d7009c?q=80&w=2060&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .content {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            color: #fff;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.1);
            border: none;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            background-color: rgba(0, 0, 0, 0.3);
            color: white;
            font-weight: bold;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .dashboard-stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .stat-card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 8px;
            margin-right: 15px;
            text-align: center;
            flex: 1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            background-color: rgba(255, 255, 255, 0.2);
        }
        .stat-card:last-child {
            margin-right: 0;
        }
        .stat-icon {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #ffcc00;
        }
        .stat-value {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .stat-label {
            font-size: 0.9rem;
            opacity: 0.8;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .table {
            color: white;
            background-color: rgba(0, 0, 0, 0.3);
        }
        .table thead th {
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }
        .table td, .table th {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding: 12px 15px;
            vertical-align: middle;
        }
        .table tbody tr {
            transition: background-color 0.2s ease;
        }
        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        .table .badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        .badge-success {
            background-color: rgba(40, 167, 69, 0.7);
        }
        .badge-primary {
            background-color: rgba(0, 123, 255, 0.7);
        }
        .sidebar {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px 0;
            min-height: 100vh;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 12px 15px;
            text-decoration: none;
            transition: 0.3s;
            border-left: 3px solid transparent;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: rgba(255, 255, 255, 0.1);
            border-left: 3px solid #ffcc00;
        }
        .sidebar i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 15px 20px;
        }
        .navbar-brand {
            font-weight: bold;
            letter-spacing: 1px;
        }
        .progress {
            height: 8px;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .progress-bar {
            background-color: #ffcc00;
        }
        .welcome-banner {
            background-color: rgba(255, 215, 0, 0.1);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            border-left: 4px solid #ffcc00;
        }
        .welcome-title {
            margin-bottom: 10px;
            font-weight: 600;
        }
        .top-employee-row {
            display: flex;
            align-items: center;
        }
        .employee-avatar {
            width: 40px;
            height: 40px;
            background-color: #ffcc00;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-right: 15px;
            font-weight: bold;
        }
        .vehicle-badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 0.85rem;
            margin-right: 8px;
            background-color: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand navbar-dark">
        <a class="navbar-brand" href="#"><i class="fas fa-tachometer-alt mr-2"></i>MegaCityCab Admin</a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="Login.jsp"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a>
            </li>
        </ul>
    </nav>

    <div class="container-fluid">
        <div class="row no-gutters">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar">
                <h5 class="text-center text-white mb-4">Menu</h5>
                <a href="AdminDashboardServlet" class="active"><i class="fas fa-home"></i> Dashboard</a>
                <a href="usersmanage.jsp"><i class="fas fa-users"></i> Users</a>
                <a href="managevehivehicles.jsp"><i class="fas fa-car"></i> Vehicles</a>
                <a href="adminBillView.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Manage</a>
                <a href="admin_complaints.jsp"><i class="fas fa-exclamation-circle"></i> Complaints</a>
            </div>
            
            <!-- Main Content -->
            <div class="col-md-10 content">
                <div class="welcome-banner">
                    <h2 class="welcome-title"><i class="fas fa-crown mr-2"></i>Welcome, Admin!</h2>
                    <p class="mb-0">Here's what's happening with your fleet today.</p>
                </div>
              
                
                <div class="row">
                    <!-- Top Employees Section -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <i class="fas fa-user-tie mr-2"></i> Top Performing Employees
                            </div>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${not empty mostActiveEmployees}">
                                        <table class="table table-hover" id="employeesTable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Rank</th>
                                                    <th scope="col">Employee (Name/ID)</th>
                                                    <th scope="col">Bookings</th>
                                                    <th scope="col">Revenue</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${mostActiveEmployees}" var="employee" varStatus="status">
                                                    <tr>
                                                        <th scope="row">${status.index + 1}</th>
                                                        <td>
                                                            <div class="top-employee-row">
                                                                <div class="employee-avatar">
                                                                    <c:choose>
                                                                        <c:when test="${not empty employee.employeeName}">
                                                                            ${employee.employeeName.substring(0, 1)}
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            ${employee.employeeId.substring(0, 1)}
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                                <div>
                                                                    <c:choose>
                                                                        <c:when test="${not empty employee.employeeName}">
                                                                            ${employee.employeeName}
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            ${employee.employeeId}
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <c:if test="${status.index == 0}">
                                                                        <span class="badge badge-success ml-2">Top</span>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>${employee.count}</td>
                                                        <td>Rs. ${employee.totalAmount}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="text-center py-4">
                                            <i class="fas fa-search fa-3x mb-3 text-muted"></i>
                                            <p>No employee data available yet.</p>
                                            
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                           
                        </div>
                    </div>
                    
                    <!-- Most Booked Vehicles Section -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <i class="fas fa-car mr-2"></i> Most Booked Vehicles
                            </div>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${not empty mostBookedVehicles}">
                                        <table class="table table-hover" id="vehiclesTable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Vehicle (Name/ID)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${mostBookedVehicles}" var="vehicle" varStatus="status">
                                                    <tr>
                                                        <th scope="row">${status.index + 1}</th>
                                                        <td>
                                                            <span class="vehicle-badge">
                                                                <i class="fas fa-car-side mr-1"></i>
                                                                <c:choose>
                                                                    <c:when test="${not empty vehicle.vehicleName}">
                                                                        ${vehicle.vehicleName}
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${vehicle.vehicleId}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="text-center py-4">
                                            <i class="fas fa-car-side fa-3x mb-3 text-muted"></i>
                                            <p>No vehicle booking data available yet.</p>
                                           
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
        <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
        <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
        <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
            Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
        </p>
    </footer>
    
    <script>
    // Fetch dashboard data using AJAX
    function refreshDashboardData() {
        $.ajax({
            url: 'AdminDashboardServlet',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                updateEmployeesTable(data.mostActiveEmployees);
                updateVehiclesTable(data.mostBookedVehicles);
            },
            error: function () {
                alert('Failed to fetch dashboard data');
            }
        });
    }

    function updateEmployeesTable(employees) {
        let tableContent = '';
        employees.forEach((employee, index) => {
            tableContent += `<tr>
                <th scope="row">${index + 1}</th>
                <td>
                    <div class="top-employee-row">
                        <div class="employee-avatar">${employee.employeeName ? employee.employeeName.charAt(0) : employee.employeeId.charAt(0)}</div>
                        <div>${employee.employeeName ? employee.employeeName : employee.employeeId} ${index === 0 ? '<span class="badge badge-success ml-1">Top</span>' : ''}</div>
                    </div>
                </td>
                <td>${employee.count}</td>
                <td>Rs. ${employee.totalAmount}</td>
            </tr>`;
        });
        $('#employeesTable tbody').html(tableContent);
    }

    function updateVehiclesTable(vehicles) {
        let tableHTML = '';
        vehicles.forEach((vehicle, index) => {
            tableHTML += `<tr>
                    <th scope="row">${index + 1}</th>
                    <td>
                        <span class="vehicle-badge">
                            <i class="fas fa-car-side mr-1"></i> ${vehicle.vehicleName ? vehicle.vehicleName : vehicle.vehicleId}
                        </span>
                    </td>
                </tr>`;
        });
        $('#vehiclesTable tbody').html(tableHTML);
    }

    function calculateProgress(count, max) {
        return (count / max) * 100;
    }

    function vehiclesMaxBookingCount(vehicles) {
        let max = 0;
        vehicles.forEach(vehicle => {
            if(vehicle.bookingCount > max) {
                max = vehicle.bookingCount;
            }
        });
        return max;
    }

    // Refresh every 30 seconds
    setInterval(refreshDashboardData, 30000);

    // Initial fetch when page loads
    $(document).ready(function () {
        refreshDashboardData();
    });
    </script>
</body>
</html>
