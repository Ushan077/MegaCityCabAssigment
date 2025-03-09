package com.datapackage.controller;

import com.datapackage.dao.DashboardDAO;
import com.datapackage.model.MostEmployeeModel;
import com.datapackage.model.MostVehicleModel;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DashboardDAO dashboardDAO = new DashboardDAO();

        // Get top 5 most active employees (from carbooking table for employees only)
        List<MostEmployeeModel> employees = dashboardDAO.getMostActiveEmployees(5);
        request.setAttribute("mostActiveEmployees", employees);

        // Get top 5 most booked vehicles (from carbooking table)
        List<MostVehicleModel> vehicles = dashboardDAO.getMostBookedVehicles(5);
        request.setAttribute("mostBookedVehicles", vehicles);
        
        // Get dashboard statistics
        try {
            // Get total employees count (filtered by usertype 'employee')
            int totalEmployees = getTotalEmployees();
            request.setAttribute("totalEmployees", totalEmployees);
            
            // Get total vehicles count
            int totalVehicles = getTotalVehicles();
            request.setAttribute("totalVehicles", totalVehicles);
            
            // Get total bookings count from the carbooking table
            int totalBookings = getTotalBookings();
            request.setAttribute("totalBookings", totalBookings);
            
            // Get total revenue by summing vehicle prices for each booking
            double totalRevenue = getTotalRevenue();
            request.setAttribute("totalRevenue", totalRevenue);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // If the request is AJAX (expects JSON), return JSON response
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            response.setContentType("application/json");
            Map<String, Object> jsonResponse = new HashMap<>();
            jsonResponse.put("mostActiveEmployees", employees);
            jsonResponse.put("mostBookedVehicles", vehicles);
            jsonResponse.put("totalEmployees", request.getAttribute("totalEmployees"));
            jsonResponse.put("totalVehicles", request.getAttribute("totalVehicles"));
            jsonResponse.put("totalBookings", request.getAttribute("totalBookings"));
            jsonResponse.put("totalRevenue", request.getAttribute("totalRevenue"));
            String json = new Gson().toJson(jsonResponse);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } else {
            // Otherwise, forward to the JSP page (adminhome.jsp)
            request.getRequestDispatcher("/adminhome.jsp").forward(request, response);
        }
    }

    private int getTotalEmployees() throws SQLException {
        int count = 0;
        String query = "SELECT COUNT(*) FROM users WHERE usertype = 'employee'";
        try (Connection conn = com.datapackage.dao.DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }
    
    private int getTotalVehicles() throws SQLException {
        int count = 0;
        String query = "SELECT COUNT(*) FROM vehicles";
        try (Connection conn = com.datapackage.dao.DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }
    
    private int getTotalBookings() throws SQLException {
        int count = 0;
        String query = "SELECT COUNT(*) FROM carbooking";
        try (Connection conn = com.datapackage.dao.DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }
    
    private double getTotalRevenue() throws SQLException {
        double total = 0;
        String query = "SELECT SUM(v.price) FROM carbooking cb JOIN vehicles v ON cb.vehicle = v.vehicle_no";
        try (Connection conn = com.datapackage.dao.DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        }
        return total;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
