package com.datapackage.dao;

import com.datapackage.model.MostEmployeeModel;
import com.datapackage.model.MostVehicleModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO {

    // Get the most active employees based on bill count by joining the bill and users tables
    public List<MostEmployeeModel> getMostActiveEmployees(int limit) {
        List<MostEmployeeModel> employeeList = new ArrayList<>();
        String query = "SELECT b.employee_id, u.name as employee_name, COUNT(*) as bill_count, SUM(b.amount) as total_amount " +
                "FROM bill b JOIN users u ON b.employee_id = u.id " +
                "GROUP BY b.employee_id " +
                "ORDER BY bill_count DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, limit);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MostEmployeeModel employee = new MostEmployeeModel();
                    employee.setEmployeeId(rs.getString("employee_id"));
                    employee.setEmployeeName(rs.getString("employee_name"));
                    employee.setCount(rs.getInt("bill_count"));
                    employee.setTotalAmount(rs.getDouble("total_amount"));
                    employeeList.add(employee);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    // Get the most booked vehicles from the bill table and join with vehicles table
    public List<MostVehicleModel> getMostBookedVehicles(int limit) {
        List<MostVehicleModel> vehicleList = new ArrayList<>();
        String query = "SELECT b.vehicle, v.vehicle_name, COUNT(*) as booking_count " +
                "FROM bill b LEFT JOIN vehicles v ON b.vehicle = v.vehicle_no " +
                "GROUP BY b.vehicle " +
                "ORDER BY booking_count DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, limit);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MostVehicleModel vehicle = new MostVehicleModel();
                    vehicle.setVehicleId(rs.getString("vehicle"));
                    // Use vehicle_name if available, otherwise fall back to vehicle number
                    String vehicleName = rs.getString("vehicle_name");
                    if (vehicleName != null && !vehicleName.isEmpty()) {
                        vehicle.setVehicleName(vehicleName);
                    } else {
                        vehicle.setVehicleName(rs.getString("vehicle"));
                    }
                    vehicle.setBookingCount(rs.getInt("booking_count"));
                    vehicleList.add(vehicle);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicleList;
    }
}